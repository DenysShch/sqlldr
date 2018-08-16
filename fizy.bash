#!/bin/bash

FILES="/home/dschuren/work/*"
#list of services for processing
declare -a SERVICES=("fizy" "FIZY")

###############################################
# ! For each SERVICe should be exist ctl file #
###############################################

#init folders
if [ ! -d "$PWD/done/" ]; then
	mkdir -p $PWD/done/
else
	#remove previous csv files
	rm -rf $PWD/done/
fi

if [ ! -d "$PWD/data/" ]; then
	mkdir -p $PWD/data/
fi

if [ ! -d "$PWD/log/" ]; then
	mkdir -p $PWD/log/
else
	rm -f $PWD/log/*
fi

if [ ! -d "$PWD/bad/" ]; then
	mkdir -p $PWD/bad/
else
	rm -f $PWD/bad/*
fi

HOME=$PWD
POOL=$HOME/done/
PROCESSED_FILES=$HOME/data/

in_array() {
    local h=${1}[@]
    local n=${2}
    for i in ${!h}; do
        if [[ ${i} == ${n} ]]; then
            return 0
        fi
    done
    return 1
}

#for each archive in dir
for f in $FILES
do
	#get arch. name up to the first character '_'
	FILENAME=$(basename "$f") 
	SERVICE=$(echo $FILENAME | cut -d'_' -f 1)  

	#check if service(file name) in allowed SERVICES
	if in_array SERVICES "${SERVICE,,}"  == 1; then
		#make arch. name up to the two character '_'
		SUBSTR=$(echo $FILENAME | cut -d'_' -f 1,2)  
		SUBSTR="${SUBSTR,,}"
		SUB_DIR=$POOL$SUBSTR
		#check sql-loader file for specific archive
		if [ -f "$HOME/ctl/$SUBSTR/$SUBSTR.ctl" ]; then
			#if folder does`t exist then create folder [Fizy_Users_Ukraine_20180805.csv.gz --> fizy_users]
			if [ ! -d "$SUB_DIR" ]; then
				mkdir -p $SUB_DIR
			fi
			#unzip archive into 'done' folder  
			gunzip -c $f > $SUB_DIR/$(echo $FILENAME | cut -d'.' -f 1,2)
			#cut archive from work dir into 'data' folder
			mv $f $PROCESSED_FILES  	
		else
			echo "   ------------------------------------------------"
			echo "  /! $SUBSTR.cls"                   
			echo " / SQL-Loader configuration file doesn't exist!"
			echo "------------------------------------------------"
		fi
	fi
done

#for each folder in 'done' folder
for f in $POOL*
do
	FILENAME=$(basename "$f")
	#check sql-loader file for specific folder
	if [ -f "$HOME/ctl/$FILENAME/$FILENAME.ctl" ]; then 
		cd $POOL/$FILENAME/
		#collect csv in one file 'all_in_one'
		if [ "$FILENAME" = "fizy_users" ]; then
			n=1
			for f_l in $f/*
			do
				CSV_FILENAME=$(basename "$f_l")
				FILESPLIT=$(echo $CSV_FILENAME | cut -d'.' -f 1) 
				FILEDATE=${FILESPLIT: -8}		
				awk -v d="$FILEDATE" -F"|" 'BEGIN { OFS = "|" } {$5=d; print}' $f_l > $f$"/"$FILESPLIT"_"$n".csv"
				rm $f_l
				let "n += 1"
			done
			cat *.csv > all_in_one.csv
		else
			cat *.csv > all_in_one.csv
		fi
		#sqlldr HDS_DEV
		sqlldr HDS/call4_dev@//dn-mar.sdab.sn:1521/hdsdev CONTROL=$HOME/ctl/$FILENAME/$FILENAME.ctl, LOG=$HOME/log/$FILENAME.log, BAD=$HOME/bad/$FILENAME.bad, DATA=$f/all_in_one.csv PARALLEL=true
	else
		echo "   ------------------------------------------------"
		echo "  /!!! $FILENAME.cls"                   
		echo " / SQL-Loader configuration file doesn't exist!"
		echo "------------------------------------------------"
	fi
done