CREATE TABLE FIZY_TRANSACTIONS
( 
  ACCOUNT_ID NUMBER(15),
  MSISDN VARCHAR2(15),
  UNIQUE_TRANSACTION_ID VARCHAR2(60),
  TRANSACTION_DATE DATE,
  TRANSACTION_TYPE VARCHAR2(30),
  USAGE_CHANNEL VARCHAR2(20),
  MOBILE_WIFI VARCHAR2(10)
)
 TABLESPACE HDS_DATA_DEFAULT
 PARTITION BY RANGE (TRANSACTION_DATE)
 ( PARTITION M201807 VALUES LESS THAN (TO_DATE('01-AUG-2018','dd-MON-yyyy'))
 , PARTITION M201808 VALUES LESS THAN (TO_DATE('01-SEP-2018','dd-MON-yyyy'))
 , PARTITION M201809 VALUES LESS THAN (TO_DATE('01-OCT-2018','dd-MON-yyyy'))
 , PARTITION M201810 VALUES LESS THAN (TO_DATE('01-NOV-2018','dd-MON-yyyy'))
 , PARTITION M201811 VALUES LESS THAN (TO_DATE('01-DEC-2018','dd-MON-yyyy'))
 , PARTITION M201812 VALUES LESS THAN (TO_DATE('01-JAN-2019','dd-MON-yyyy'))
 );
 

CREATE TABLE FIZY_USERS
(
  ACCOUNT_ID NUMBER(15),
  MSISDN VARCHAR2(15),
  CREATE_DATE DATE,
  GSMOPERATOR VARCHAR2(50),
  SNAPSHOT_DATE DATE
)
 TABLESPACE HDS_DATA_DEFAULT
 PARTITION BY RANGE (SNAPSHOT_DATE)
 ( PARTITION D20180731 VALUES LESS THAN (TO_DATE('01-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180801 VALUES LESS THAN (TO_DATE('02-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180802 VALUES LESS THAN (TO_DATE('03-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180803 VALUES LESS THAN (TO_DATE('04-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180804 VALUES LESS THAN (TO_DATE('05-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180805 VALUES LESS THAN (TO_DATE('06-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180806 VALUES LESS THAN (TO_DATE('07-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180807 VALUES LESS THAN (TO_DATE('08-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180808 VALUES LESS THAN (TO_DATE('09-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180809 VALUES LESS THAN (TO_DATE('10-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180810 VALUES LESS THAN (TO_DATE('11-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180811 VALUES LESS THAN (TO_DATE('12-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180812 VALUES LESS THAN (TO_DATE('13-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180813 VALUES LESS THAN (TO_DATE('14-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180814 VALUES LESS THAN (TO_DATE('15-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180815 VALUES LESS THAN (TO_DATE('16-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180816 VALUES LESS THAN (TO_DATE('17-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180817 VALUES LESS THAN (TO_DATE('18-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180818 VALUES LESS THAN (TO_DATE('19-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180819 VALUES LESS THAN (TO_DATE('20-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180820 VALUES LESS THAN (TO_DATE('21-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180821 VALUES LESS THAN (TO_DATE('22-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180822 VALUES LESS THAN (TO_DATE('23-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180823 VALUES LESS THAN (TO_DATE('24-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180824 VALUES LESS THAN (TO_DATE('25-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180825 VALUES LESS THAN (TO_DATE('26-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180826 VALUES LESS THAN (TO_DATE('27-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180827 VALUES LESS THAN (TO_DATE('28-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180828 VALUES LESS THAN (TO_DATE('29-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180829 VALUES LESS THAN (TO_DATE('30-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180830 VALUES LESS THAN (TO_DATE('31-AUG-2018','dd-MON-yyyy'))
 , PARTITION D20180831 VALUES LESS THAN (TO_DATE('01-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180901 VALUES LESS THAN (TO_DATE('02-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180902 VALUES LESS THAN (TO_DATE('03-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180903 VALUES LESS THAN (TO_DATE('04-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180904 VALUES LESS THAN (TO_DATE('05-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180905 VALUES LESS THAN (TO_DATE('06-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180906 VALUES LESS THAN (TO_DATE('07-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180907 VALUES LESS THAN (TO_DATE('08-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180908 VALUES LESS THAN (TO_DATE('09-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180909 VALUES LESS THAN (TO_DATE('10-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180910 VALUES LESS THAN (TO_DATE('11-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180911 VALUES LESS THAN (TO_DATE('12-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180912 VALUES LESS THAN (TO_DATE('13-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180913 VALUES LESS THAN (TO_DATE('14-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180914 VALUES LESS THAN (TO_DATE('15-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180915 VALUES LESS THAN (TO_DATE('16-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180916 VALUES LESS THAN (TO_DATE('17-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180917 VALUES LESS THAN (TO_DATE('18-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180918 VALUES LESS THAN (TO_DATE('19-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180919 VALUES LESS THAN (TO_DATE('20-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180920 VALUES LESS THAN (TO_DATE('21-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180921 VALUES LESS THAN (TO_DATE('22-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180922 VALUES LESS THAN (TO_DATE('23-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180923 VALUES LESS THAN (TO_DATE('24-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180924 VALUES LESS THAN (TO_DATE('25-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180925 VALUES LESS THAN (TO_DATE('26-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180926 VALUES LESS THAN (TO_DATE('27-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180927 VALUES LESS THAN (TO_DATE('28-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180928 VALUES LESS THAN (TO_DATE('29-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180929 VALUES LESS THAN (TO_DATE('30-SEP-2018','dd-MON-yyyy'))
 , PARTITION D20180930 VALUES LESS THAN (TO_DATE('01-OCT-2018','dd-MON-yyyy'))
 );