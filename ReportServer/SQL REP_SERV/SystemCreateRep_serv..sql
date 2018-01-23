-- SystemCreateEpec.sql
/* Создание табличной области */
create tablespace REP_SERV_DATA
datafile '/u01/oracle/data/COTA/REP_SERV_DATA.ora' size 1024M 
autoextend on next 512M;

/* Создание теневой табличной области */
/*create tablespace REP_SERV_DATA_SHADOW
datafile '/u01/oracle/data/COTA/REP_SERV_DATA_SHADOW.ora' size 512M 
autoextend on next 256M;*/

/* Создание пользователя */
--drop user REP_SERV;
create user REP_SERV identified by REP2017
default tablespace REP_SERV_DATA
temporary tablespace TEMP--temp_TS_GROUP --Поставить текущий!!!!!!!!!!!
quota unlimited on REP_SERV_DATA;



--SELECT *FROM sys.v_$parameter

--select file_name, tablespace_name FROM DBA_DATA_FILES;
