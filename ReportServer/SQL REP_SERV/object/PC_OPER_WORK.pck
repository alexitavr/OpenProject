create or replace package PC_OPER_WORK is

  --   %date   - 14/03/2016
  --   %author - МАРЧЕНКО Д.С.
  --   %usage  - Пакет для работы с pc_oper обработка событий и операций 
  -- Гид операции при инсерте зачищается после инсерта всех параметров
  c_GID rep_serv.pc_oper_PARAMS.gid%Type;
  c_ID rep_serv.pc_oper_PARAMS.id%Type;

  --Параметры статусов
  c_ST_new       rep_serv.pc_oper.op_status%Type := 'NEW'; -- новая запись
  c_ST_ENTRY     rep_serv.pc_oper.op_status%Type := 'ENTRY'; --готова к обработке роботом
  c_ST_START     rep_serv.pc_oper.op_status%Type := 'START'; --обработка роботом
  c_ST_COMPLETED rep_serv.pc_oper.op_status%Type := 'COMPLETED'; --обработана
  c_ST_ERR       rep_serv.pc_oper.op_status%Type := 'ERR';    --ошибка обрабтки


  -- передаем параметры из PHP постедствам данной коллекции
  TYPE ARR_TYPE IS TABLE OF VARCHAR2(200) INDEX BY varchar2(100);

  -- Новый Gid  
  -- %return - gid
  FUNCTION GetNewGid return varchar2;
  
  -- Получение партицwии делим на 31 партицию
  -- %return - N_Part
  FUNCTION GetNPart return varchar2;
  
  
  -- Текуший gid по ID операции Gid  
  -- %return - gid
  FUNCTION GET_PC_OPER_GID (i_PC_OPER_ID in pc_oper.id%type) return varchar2;
  --  процедура для очистки типа PC_OPER
  --  %param  PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_TYPE_CLEAR(PC_OPER IN OUT pc_oper%ROWTYPE);

  --  процедура для очистки типа PC_OPER_PARAM
  --  %param  PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_PARAMS_TYPE_CLEAR(PC_OPER_PARAM IN OUT pc_oper_PARAMS%ROWTYPE);

  --  Функция для insert операций
  --  %param PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_INSERT(PC_OPER IN OUT pc_oper%ROWTYPE);

  --  процедура для insert операций через параметры
  --  %param  PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_INSERT(i_OP_NAME      in rep_serv.pc_oper.op_name%type,
                           i_OP_CODE      in rep_serv.pc_oper.OP_CODE%type,
                           i_OWNER_MODIFY in rep_serv.pc_oper.OWNER_MODIFY%type default null,
                           i_URL          in rep_serv.pc_oper.URL%type default null);

  --  процедура для insert параметров операций
  --  %param  PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_PARAMS_INSERT(PC_OPER_PARAM IN OUT PC_OPER_PARAMS%ROWTYPE);


--  процедура для insert параметров операций по входным параметрам
--  %param  PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_PARAMS_INSERT (i_PARAM in rep_serv.PC_OPER_PARAMS.param%type,
   i_VALUE in rep_serv.PC_OPER_PARAMS.value%type,
   i_SUBPARAM in rep_serv.PC_OPER_PARAMS.subparam%type default null,
   i_OID_PC_OPER in rep_serv.PC_OPER_PARAMS.oid_pc_oper %type default null,   
   i_GID in rep_serv.PC_OPER_PARAMS.gid%type default null,
   i_TYPE in rep_serv.PC_OPER_PARAMS.type%type default null) ;
  
  --  процедура для set параметров операций по входным параметрам

PROCEDURE SET_PC_OPER_PARAMS (i_id in rep_serv.PC_OPER_PARAMS.id%type,
  i_PARAM in rep_serv.PC_OPER_PARAMS.param%type,
  i_VALUE in rep_serv.PC_OPER_PARAMS.value%type,
  i_SUBPARAM in rep_serv.PC_OPER_PARAMS.subparam%type default null,
  i_OID_PC_OPER in rep_serv.PC_OPER_PARAMS.oid_pc_oper %type default null, 
  i_GID in rep_serv.PC_OPER_PARAMS.gid%type default null,
  i_TYPE in rep_serv.PC_OPER_PARAMS.type%type default null
  ); 
 --Получение текушего сиквенса параметра
 FUNCTION GET_OPER_PARAMS_SEQ_CURRVAL return number;  
 
  --  Получение параметров  операций
  --  %param  i_ID - id операции
  --  %param  i_param - наименование параметра
  -- %return - значение параметра
FUNCTION GET_PC_OPER_PARAMS (i_ID in pc_oper_params.oid_pc_oper%TYPE, 
                             i_param in pc_oper_params.param%TYPE,
                             i_par_id in pc_oper_params.id%TYPE default null,
                             i_subparam in pc_oper_params.subparam%TYPE default null
                             ) 
    return varchar2;

  /*--  процедура пишет статус новой операции 
  --  %param i_ID - ID операци
  PROCEDURE PC_OPER_NEW(i_id in pc_oper.ID%TYPE);*/

  --  процедура пишет статус Начала операции 
  --  %param i_ID - ID операци
  PROCEDURE PC_OPER_START(i_id in pc_oper.ID%TYPE);
  --  процедура пишет статус успешных операций 
  --  %param i_ID - ID операци
  PROCEDURE PC_OPER_OK(i_ID in pc_oper.ID%TYPE);

  --  процедура пишет статус операций с ошибкой ERR 
  --  %param  i_ID - ID операци
  --  %param  i_ERR - Ошибка операци
  PROCEDURE PC_OPER_ERR(i_ID in pc_oper.ID%TYPE, i_ERR in pc_oper.ERR%TYPE);
  
  --  процедура пишет статус операции
--  %param i_ID - ID операци
--  %param  i_op_status 
  -- c_ST_new       -- новая запись
  -- c_ST_ENTRY     --готова к обработке роботом
  -- c_ST_START     --обработка роботом
  -- c_ST_COMPLETED --обработана
  -- c_ST_ERR       --ошибка обрабтки
PROCEDURE PC_OPER_STATUS (i_id in pc_oper.ID%TYPE, i_op_status in pc_oper.op_status%TYPE);

 --  функция получения Статуса работы
 --  %param  i_OPER_STATUS -- статус на англ.
 --  %return Статус по русски.            
 FUNCTION GET_RUS_PC_OPER_STATUS(i_OPER_STATUS in rep_serv.pc_oper.op_status%Type)   return varchar2;

--  процедура пишет log выполнения опипаций
--  %param  i_ID - ID операци
--  %param  i_log_text- log операци-

PROCEDURE set_OPER_LOG (i_pc_oper_ID in pc_oper.ID%TYPE, 
                          i_log_text in pc_oper_log.text%TYPE,
                          i_user in pc_oper_log.user_%TYPE default user);
                          
--  процедура получения последнейзаписи  log выполнения опипаций
--  %param  i_ID - ID операци

function get_OPER_LOG(i_pc_oper_ID in pc_oper.ID%TYPE) return varchar2;  


--   функция получения всей записи PC_OPER_ID по ID 
--  %param  i_op_code -код операци

FUNCTION GET_PC_OPER_REC(i_id in pc_oper.id%TYPE) return PC_OPER%ROWTYPE;

 --ПОСТАНОВКА ЗАДАЧИ В ОЧЕТЕДЬ
  --  %param  i_OP_CODE - код задачи 
  --  %param  i_ARR_PARAMS - массив переменных с клиента
  --  %param  i_ARR_VALUE- массив значений с клиента
  --  %param  i_USER - пользователь
  --  %param  i_REP_ID - ID отчета или программы
  --  %return - null или ошибка 
  FUNCTION ORDER_OPER(i_ARR_PARAMS IN t_PC_OPER_PARAM,
                      i_ARR_VALUE IN t_PC_OPER_VALUE,
                      i_USER       pc_oper.owner_modify%type default user,
                      i_OP_CODE    pc_oper.op_code%type,
                      i_REP_ID     IN reports.rep_id%type default null)
    return varchar2;
                          
                          
/*  
--  функция получения названия программы по коду
--  %param  i_op_code -код операци
function GET_PROGRAM_NAME(i_op_code in pc_oper.op_code%TYPE)return varchar2;    
  
--  функция получения колличества тредов программы по коду 
--  %param  i_op_code -код операци

FUNCTION GET_PROGRAM_TREAD(i_op_code in pc_oper.op_code%TYPE)return number;  */
end PC_OPER_WORK; 
/
create or replace package body PC_OPER_WORK is
-- Новый Gid  
-- %return - gid
FUNCTION GetNewGid return varchar2
is
begin
  c_GID := to_char(sysdate,'dd')||'_'||upper(rawToHex(sys_guid()));
  return c_GID;
end;



-- Получение партицwии делим на 31 партицию
-- %return - N_Part
FUNCTION GetNPart return varchar2
is
begin
  return to_char(sysdate,'dd');
end;

-- Текуший gid по ID операции Gid  
-- %return - gid
FUNCTION GET_PC_OPER_GID (i_PC_OPER_ID in pc_oper.id%type) return varchar2
is
 v_gid  pc_oper.gid%type;
begin
 
   SELECT  
         pc.gid into v_gid
     FROM  rep_serv.PC_OPER pc
     WHERE  pc.id = i_PC_OPER_ID;
  

  return v_gid;
end;

--  процедура для очистки типа PC_OPER
--  %param  PC_OPER - pc_oper%ROWTYPE
PROCEDURE PC_OPER_TYPE_CLEAR (PC_OPER IN OUT pc_oper%ROWTYPE) 
IS
BEGIN
     PC_OPER.ID := null;
     PC_OPER.GID := null;
     PC_OPER.WORK_DATE := null;
     PC_OPER.DATE_MODIFY := null;
     PC_OPER.CLOSE_DATE := null;
     PC_OPER.OP_NAME := null;
     PC_OPER.OP_CODE := null;
     PC_OPER.OP_STATUS := null;
     PC_OPER.OWNER_MODIFY := null;
     PC_OPER.ERR := null;
     PC_OPER.URL := null;
END;

--  процедура для очистки типа PC_OPER_PARAM
--  %param  PC_OPER - pc_oper%ROWTYPE
PROCEDURE PC_OPER_PARAMS_TYPE_CLEAR (PC_OPER_PARAM IN OUT pc_oper_PARAMS%ROWTYPE) 
IS
BEGIN
   PC_OPER_PARAM.GID:= null; 
   PC_OPER_PARAM.OID_PC_OPER := null;
 --  PC_OPER_PARAM.PARENT:= null;
   PC_OPER_PARAM.DIR:= null;
   PC_OPER_PARAM.TYPE:= null;
   PC_OPER_PARAM.PARAM:= null;
   PC_OPER_PARAM.VALUE:= null;
 --  PC_OPER_PARAM.SUBFIELD:= null;
   PC_OPER_PARAM.DATE_CREATE:= null;
   PC_OPER_PARAM.N_PART:= null;                      
END;

 
--  процедура для insert операций
--  %param  PC_OPER - pc_oper%ROWTYPE
PROCEDURE PC_OPER_INSERT (PC_OPER IN OUT pc_oper%ROWTYPE) 
IS
BEGIN
 /* c_GID             := '';
  PC_OPER.ID        := pc_oper_SEQ.Nextval;
  PC_OPER.GID       := GetNewGid;
  PC_OPER.WORK_DATE := sysdate; 
  PC_OPER.OP_STATUS := PC_OPER_WORK.c_ST_ENTRY ;*/
  insert into rep_serv.pc_oper
                (ID,
                 GID,
                 WORK_DATE, 
                 DATE_MODIFY,
                 CLOSE_DATE,
                 OP_NAME,
                 OP_CODE,
                 OP_STATUS,
                 OWNER_MODIFY,
                 ERR,
                 URL)
    values (PC_OPER.ID, 
            PC_OPER.GID,
            PC_OPER.WORK_DATE,
            PC_OPER.DATE_MODIFY,
            PC_OPER.CLOSE_DATE,
            PC_OPER.OP_NAME,
            PC_OPER.OP_CODE,
            PC_OPER.OP_STATUS,
            PC_OPER.OWNER_MODIFY,
            PC_OPER.ERR,
            PC_OPER.URL);
 --commit; --Вызывает ORA-02064: распределенные операции не поддерживаются при запуске по линку
END;

--  процедура для insert операций через параметры
--  %param  PC_OPER - pc_oper%ROWTYPE
PROCEDURE PC_OPER_INSERT (i_OP_NAME in rep_serv.pc_oper.op_name%type,
                          i_OP_CODE  in rep_serv.pc_oper.OP_CODE%type,
                          i_OWNER_MODIFY in rep_serv.pc_oper.OWNER_MODIFY%type default null,
                          i_URL in rep_serv.pc_oper.URL%type default null) 
IS
BEGIN 

  insert into rep_serv.pc_oper
    (OP_NAME, OP_CODE, OWNER_MODIFY, URL)
  values
    (i_OP_NAME, i_OP_CODE, i_OWNER_MODIFY, i_URL);
 --commit; --Вызывает ORA-02064: распределенные операции не поддерживаются при запуске по линку
END;



--  процедура для insert параметров операций
--  %param  PC_OPER - pc_oper%ROWTYPE
PROCEDURE PC_OPER_PARAMS_INSERT (PC_OPER_PARAM IN OUT PC_OPER_PARAMS%ROWTYPE) 
IS
BEGIN
  select pc_oper_param_SEQ.Nextval into PC_OPER_PARAM.ID  from dual;  
  select pc_oper_SEQ.Currval into PC_OPER_PARAM.OID_PC_OPER from dual;
  PC_OPER_PARAM.GID         := c_GID;
  PC_OPER_PARAM.DATE_CREATE := sysdate; 
  PC_OPER_PARAM.DIR         := 'I' ;
  PC_OPER_PARAM.N_PART      := GetNPart; 

  --Вложенность пока не нужна!!!!
--  PC_OPER_PARAM.PARENT      := pc_oper_param_SEQ.Currval; 
  
  insert into rep_serv.PC_OPER_params 
                      (ID, 
                       GID, 
                       OID_PC_OPER, 
                       DIR, 
                       TYPE, 
                       PARAM, 
                       VALUE, 
                       DATE_CREATE, 
                       N_PART,
                       SUBPARAM
                       )
  values (PC_OPER_PARAM.ID, 
                       PC_OPER_PARAM.GID, 
                       PC_OPER_PARAM.OID_PC_OPER, 
                       PC_OPER_PARAM.DIR, 
                       PC_OPER_PARAM.TYPE, 
                       PC_OPER_PARAM.PARAM, 
                       PC_OPER_PARAM.VALUE, 
                       PC_OPER_PARAM.DATE_CREATE, 
                       PC_OPER_PARAM.N_PART,
                       PC_OPER_PARAM.SUBPARAM
                       );
  


END;
                            

--  процедура для insert параметров операций по входным параметрам
--  %param  PC_OPER - pc_oper%ROWTYPE
PROCEDURE PC_OPER_PARAMS_INSERT (i_PARAM in rep_serv.PC_OPER_PARAMS.param%type,
  i_VALUE in rep_serv.PC_OPER_PARAMS.value%type,
  i_SUBPARAM in rep_serv.PC_OPER_PARAMS.subparam%type default null,
  i_OID_PC_OPER in rep_serv.PC_OPER_PARAMS.oid_pc_oper %type default null, 
  i_GID in rep_serv.PC_OPER_PARAMS.gid%type default null,
  i_TYPE in rep_serv.PC_OPER_PARAMS.type%type default null
  ) 
IS
   
BEGIN
  --Вложенность пока не нужна!!!!
  --  PC_OPER_PARAM.PARENT      := pc_oper_param_SEQ.Currval; 
 
 
 /* if i_SUBPARAM = 1 then
   select pc_oper_param_seq.currval into v_parent_seq from dual;
  else  
     v_parent_seq:= i_SUBPARAM;
  end if;*/
  
  insert into rep_serv.PC_OPER_params
    (GID,
     OID_PC_OPER,
     TYPE,
     PARAM,
     VALUE,
     SUBPARAM)
  values
    (i_GID,
     i_OID_PC_OPER,
     i_TYPE,
     i_PARAM,
     i_VALUE,
     i_SUBPARAM);
  
commit;

END;

--  процедура для set параметров операций по входным параметрам

PROCEDURE SET_PC_OPER_PARAMS (i_id in rep_serv.PC_OPER_PARAMS.id%type,
  i_PARAM in rep_serv.PC_OPER_PARAMS.param%type,
  i_VALUE in rep_serv.PC_OPER_PARAMS.value%type,
  i_SUBPARAM in rep_serv.PC_OPER_PARAMS.subparam%type default null,
  i_OID_PC_OPER in rep_serv.PC_OPER_PARAMS.oid_pc_oper %type default null, 
  i_GID in rep_serv.PC_OPER_PARAMS.gid%type default null,
  i_TYPE in rep_serv.PC_OPER_PARAMS.type%type default null
  ) 
IS  
BEGIN
  if i_SUBPARAM is not null then    
    update rep_serv.PC_OPER_params rp set
      rp.value = i_VALUE
    where rp.subparam = i_SUBPARAM 
      and rp.param = i_PARAM ;
   
  else
    update rep_serv.PC_OPER_params rp set
      rp.value = i_VALUE
     where rp.id = i_id
       and rp.param = i_PARAM ;
  end if;
  
 commit;   
END;

--Получение текушего сиквенса параметра
FUNCTION GET_OPER_PARAMS_SEQ_CURRVAL return number is
  v_PARAMS_SEQ number := null;
BEGIN
  select pc_oper_param_seq.currval into v_PARAMS_SEQ from dual;
  return v_PARAMS_SEQ;
EXCEPTION
  WHEN OTHERS THEN
    return null;  
END;

--  Получение параметров  операций
--  %param  i_ID - id операции
--  %param  i_param - наименование параметра
--  %param  i_par_id --id параметра
-- %return - значение параметра
FUNCTION GET_PC_OPER_PARAMS (i_ID in pc_oper_params.oid_pc_oper%TYPE, 
                             i_param in pc_oper_params.param%TYPE,
                             i_par_id in pc_oper_params.id%TYPE default null,
                             i_subparam in pc_oper_params.subparam%TYPE default null
                             ) return varchar2
IS
v_value pc_oper_params.value%TYPE;
BEGIN
  
IF i_par_id is not null THEN   
  -- поиск параметра в лоб по по oid_pc_oper и i_param i_par_id
   SELECT  
         pc.value into v_value
     FROM  rep_serv.PC_OPER_params pc
     WHERE  pc.oid_pc_oper = i_ID
      AND pc.param = i_param
      AND pc.id = i_par_id;
 
 ELSE IF i_subparam is not null then
     -- поиск параметра по oid_pc_oper и i_param и i_subparam
   SELECT  
         pc.value into v_value
     FROM  rep_serv.PC_OPER_params pc
     WHERE  pc.oid_pc_oper = i_ID
      AND pc.param = i_param
      AND pc.subparam = i_subparam;
 ELSE
  -- стандартный поиск параметра по oid_pc_oper и i_param
   SELECT  
         pc.value into v_value
     FROM  rep_serv.PC_OPER_params pc
     WHERE  pc.oid_pc_oper = i_ID
      AND pc.param = i_param;
 END IF; 
   
end if;
     
 return  v_value;
EXCEPTION               
  WHEN OTHERS  THEN return  null;    
 
null;
END;

--  процедура пишет статус новой операции 
--  %param i_ID - ID операци
/*PROCEDURE PC_OPER_NEW (i_id in pc_oper.ID%TYPE)
IS
BEGIN
  UPDATE rep_serv.pc_oper pco SET
    pco.op_status   = PC_OPER_WORK.c_ST_new
  WHERE pco.id = i_ID ;
 -- COMMIT;
  
END;*/


--  процедура пишет статус успешных операций 
--  %param i_ID - ID операци
PROCEDURE PC_OPER_OK (i_id in pc_oper.ID%TYPE)
IS
BEGIN
  UPDATE rep_serv.pc_oper pco SET
    pco.close_date  = sysdate,
    pco.op_status   = PC_OPER_WORK.c_ST_COMPLETED,
    pco.err = null
  WHERE pco.id = i_ID AND  pco.op_status != 'ERR' ;
 -- COMMIT;
  
END;

--  процедура пишет статус Начала операции 
--  %param i_ID - ID операци
PROCEDURE PC_OPER_START (i_id in pc_oper.ID%TYPE)
IS
BEGIN
  UPDATE rep_serv.pc_oper pco SET
    pco.date_modify = sysdate,
    pco.op_status   = PC_OPER_WORK.c_ST_START
  WHERE pco.id = i_ID AND  pco.op_status != 'ERR';
 -- COMMIT;
END;

--  процедура пишет статус операций с ошибкой ERR 
--  %param  i_ID - ID операци
--  %param  i_ERR - Ошибка операци
PROCEDURE PC_OPER_ERR (i_ID in pc_oper.ID%TYPE, i_ERR in pc_oper.ERR%TYPE)
IS
BEGIN
  UPDATE rep_serv.pc_oper pco SET
    pco.date_modify = sysdate,
  --  pco.close_date  = sysdate,
    pco.op_status   = PC_OPER_WORK.c_ST_ERR,
    pco.err =  substr(i_ERR,1,4000)  
  WHERE pco.id = i_ID;
--  COMMIT;
  
END;


--  процедура пишет статус операции
--  %param i_ID - ID операци
--  %param  i_op_status 
  -- c_ST_new       -- новая запись
  -- c_ST_ENTRY     --готова к обработке роботом
  -- c_ST_START     --обработка роботом
  -- c_ST_COMPLETED --обработана
  -- c_ST_ERR       --ошибка обрабтки
PROCEDURE PC_OPER_STATUS (i_id in pc_oper.ID%TYPE, i_op_status in pc_oper.op_status%TYPE)
IS
BEGIN
  UPDATE rep_serv.pc_oper pco SET
    pco.op_status   = i_op_status
  WHERE pco.id = i_ID ;
 -- COMMIT;
  
END;


 --  функция получения Статуса работы
 --  %param  i_OPER_STATUS -- статус на англ.
 --  %return Статус по русски.            
 FUNCTION GET_RUS_PC_OPER_STATUS(i_OPER_STATUS in rep_serv.pc_oper.op_status%Type)
   return varchar2 IS
   v_RUS_PC_OPER_STATUS varchar2(100);
 BEGIN
   case
     when i_OPER_STATUS = PC_OPER_WORK.c_ST_new then
       v_RUS_PC_OPER_STATUS  := 'Новый заказ';
     when i_OPER_STATUS = PC_OPER_WORK.c_ST_ENTRY then
       v_RUS_PC_OPER_STATUS  := 'Готово к обработке';
     when i_OPER_STATUS = PC_OPER_WORK.c_ST_START  then
       v_RUS_PC_OPER_STATUS  := 'Обработка роботом';
     when i_OPER_STATUS = PC_OPER_WORK.c_ST_COMPLETED  then
       v_RUS_PC_OPER_STATUS  := 'ОБРАБОТАНО';
     when i_OPER_STATUS = PC_OPER_WORK.c_ST_ERR then
       v_RUS_PC_OPER_STATUS := 'ОШИБКА!';
     else
       v_RUS_PC_OPER_STATUS := null;
   end case;
   return v_RUS_PC_OPER_STATUS;
 end;


--  процедура пишет log выполнения опипаций
--  %param  i_ID - ID операци
--  %param  i_log_text- log операци-

PROCEDURE set_OPER_LOG(i_pc_oper_ID in pc_oper.ID%TYPE,
                   i_log_text   in pc_oper_log.text%TYPE,
                   i_user       in pc_oper_log.user_%TYPE default user) IS
BEGIN
  insert into PC_OPER_LOG
    (id,OID_PC_OPER, text, USER_)
  values
    (pc_oper_log_SEQ.NEXTVAL,i_pc_oper_ID, i_log_text, i_user);

  COMMIT;

END;

--  процедура получения последнейзаписи  log выполнения опипаций
--  %param  i_ID - ID операци

function get_OPER_LOG(i_pc_oper_ID in pc_oper.ID%TYPE) return varchar2 IS
  v_text PC_OPER_LOG.TEXT%type;
BEGIN
  
 select lg.text into v_text from PC_OPER_LOG lg where lg.id =
(select max(lg.id) from PC_OPER_LOG lg where lg.oid_pc_oper = i_pc_oper_ID);

return v_text;
EXCEPTION               
  WHEN OTHERS  THEN return  null;    
 
END;

--   функция получения всей записи PC_OPER_ID по ID 
--  %param  i_op_code -код операци

FUNCTION GET_PC_OPER_REC(i_id in pc_oper.id%TYPE) return PC_OPER%ROWTYPE is
  v_PC_OPER_REC PC_OPER%ROWTYPE := null;
begin

  select po.* into v_PC_OPER_REC from pc_oper po where id = i_id;

  return v_PC_OPER_REC;
EXCEPTION
  WHEN OTHERS THEN
    return null;
end;


 --ПОСТАНОВКА ЗАДАЧИ В ОЧЕТЕДЬ
  --  %param  i_OP_CODE - код задачи 
  --  %param  i_ARR_PARAMS - массив переменных с клиента
  --  %param  i_ARR_VALUE- массив значений с клиента
  --  %param  i_USER - пользователь
  --  %param  i_REP_ID - ID отчета или программы
  --  %return - null или ошибка 
  FUNCTION ORDER_OPER(i_ARR_PARAMS IN t_PC_OPER_PARAM,
                      i_ARR_VALUE IN t_PC_OPER_VALUE,
                      i_USER       pc_oper.owner_modify%type default user,
                      i_OP_CODE    pc_oper.op_code%type,
                      i_REP_ID     IN reports.rep_id%type default null)
    return varchar2 as
    v_gid        REP_SERV.PC_OPER.gid%type;
    v_pc_oper_id REP_SERV.PC_OPER.gid%type;
    v_PARAM_REC  reports_params%rowtype := null;
    v_rep_ID     REP_SERV.Reports.REP_ID%type;
    v_OP_CODE   REP_SERV.PC_OPER.OP_CODE%type;
    
  begin
  
    --если передаем i_OP_CODE
    if i_REP_ID is null then
      v_rep_ID := reports_work.GET_REPID_BY_OP_CODE(i_OP_CODE);
      if v_rep_ID is null then
        return 'ОШИБКА REP_ID отчета или программы не найден!!!!!';
      end if;
    else
      v_rep_ID := i_REP_ID;
    end if;
   
  --если передаем i_OP_CODE не передан
   if i_OP_CODE  is null then
        v_OP_CODE := REPORTS_WORK.GET_REPORT_PARAM(v_rep_ID,'OP_CODE','ADMIN');
        if v_OP_CODE is null then
        return 'ОШИБКА v_OP_CODE отчета или программы не найден!!!!!';
      end if;

    else
      v_OP_CODE := i_OP_CODE;
    end if;
   -- v_pc_oper_id := REP_SERV.reports_work.order_report(v_rep_ID, i_USER);
    
    PC_OPER_WORK.PC_OPER_INSERT(REPORTS_WORK.GET_REPORT_NAME(v_rep_ID),v_OP_CODE,i_USER);
    rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('REP_ID', v_REP_ID);
    v_pc_oper_id := rep_serv.PC_OPER_WORK.c_ID;
    
  
    v_gid := REP_SERV.PC_OPER_WORK.GET_PC_OPER_GID(v_pc_oper_id);
  
    --пройдем по всем параметрам массива и пеепишем их в заказ  
  
  
  for i in 1 .. i_ARR_PARAMS.count loop
  --   v_PARAMS := i_ARR_PARAMS.first;
  --  while v_PARAMS is not null loop
      --Читаем оригинальные праметры и типы
      v_PARAM_REC := null;
      v_PARAM_REC := REPORTS_WORK.GET_REPORT_PARAM_REC(v_rep_ID,
                                                       i_ARR_PARAMS(i),
                                                       'SQL_PARAM');
    
      -- пишем в заказ       
      REP_SERV.PC_OPER_WORK.PC_OPER_PARAMS_INSERT(i_ARR_PARAMS(i),
                                                  i_ARR_VALUE(i),
                                                  v_PARAM_REC.Subparam,
                                                  v_pc_oper_id,
                                                  v_gid,
                                                  v_PARAM_REC.Type);

    --   v_PARAMS := i_ARR_PARAMS.next(v_PARAMS);
    end loop;
  
    REP_SERV.PC_OPER_WORK.PC_OPER_STATUS (v_pc_oper_id,'ENTRY' );   
    commit;
    return 'Задание поставлено в очередь!';
  
 -- EXCEPTION               
 -- WHEN OTHERS  THEN return  substr(sqlerrm,0,4000);    
  
  end;

/*--  функция получения названия программы по коду
--  %param  i_op_code -код операци
FUNCTION GET_PROGRAM_NAME(i_op_code in pc_oper.op_code%TYPE)return varchar2 is
   v_OP_NAME REP_SERV.PC_OPER_RPOGRAM.OP_NAME%type :='';
begin
 select distinct t.op_name into v_OP_NAME
                        from PC_OPER_RPOGRAM t 
                      where t.op_code = i_op_code;
   return   v_OP_NAME;   
EXCEPTION               
  WHEN OTHERS  THEN return  null;                 
end;
*/

end PC_OPER_WORK;
/
