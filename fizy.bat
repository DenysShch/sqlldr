@echo off
setlocal
set t0=%time: =0%

sqlldr dschuren/October_2018@//dm02-scan.sdab.sn:1521/dwh CONTROL=E:\3_Work\04_Fizy\ctl\test_fizy_user.ctl, LOG=E:\3_Work\04_Fizy\log.log, BAD=E:\3_Work\04_Fizy\bad\err.bad, DATA=E:\3_Work\04_Fizy\all_in_one.csv PARALLEL=true 


set t=%time: =0%
set /a d_h = (1%t:~0,2%-100) - (1%t0:~0,2%-100) 
set /a d_m = (1%t:~3,2%-100) - (1%t0:~3,2%-100) 
set /a d_s = (1%t:~6,2%-100) - (1%t0:~6,2%-100) 

echo.
echo  ------------------------
echo  \ Execution time: %d_h%:%d_m%:%d_s% \
echo   ------------------------
echo.
ping 127.0.0.1 -n 5 > nul