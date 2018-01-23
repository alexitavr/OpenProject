  GRANT SELECT ON "SYS"."DICTIONARY" TO "ANALYSER_RNCB"
  GRANT SELECT ON "SYS"."DBA_USERS" TO "ANALYSER_RNCB"
  GRANT SELECT ON "SYS"."DBA_TS_QUOTAS " TO "ANALYSER_RNCB"
  GRANT SELECT ON "SYS"."DBA_DATA_FILES" TO "ANALYSER_RNCB"
  GRANT SELECT ON "SYS"."ALL_USERS" TO "ANALYSER_RNCB"
  GRANT SELECT ON "SYS"."DBA_SYS_PRIVS" TO "ANALYSER_RNCB"
  GRANT SELECT ON "SYS"."DBA_ROLE_PRIVS" TO "ANALYSER_RNCB"
  GRANT SELECT ON "SYS"."DBA_TAB_PRIVS " TO "ANALYSER_RNCB"

  


select 'create tablespace '|| tablespace_name ||
          ' datafile '''|| file_name ||
          ''' size '|| bytes/1024/1024 ||
          'M autoextend on next '|| increment_by||';' command 
from dba_data_files where tablespace_name in 
            (select tablespace_name from dba_ts_quotas where username='COTA'
              union
            select default_tablespace from dba_users where username='COTA')
order by command;

select 'create user '||username||' identified by '|| username
  ||' default tablespace '||default_tablespace||' quota unlimited on '
  ||default_tablespace||';' command 
from dba_users 
where username='COTA_SEL';

select 'alter user ' || username || ' unlimited quota on '|| tablespace_name ||';' command 
from dba_ts_quotas 
where username='COTA_SEL';

select 'grant '|| privilege||' to '|| grantee||';' command 
from dba_sys_privs 
where grantee='COTA_SEL'
union
select 'grant '|| granted_role ||' to '|| grantee||';' command 
from dba_role_privs 
where grantee='COTA_SEL'
union
select 'grant '|| privilege ||' on ' || owner||'.'|| table_name||' to '|| grantee||';' command 
from dba_tab_privs 
where owner != 'SYS' and grantee='COTA_SEL';
