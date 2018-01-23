create or replace package PC_OPER_WORK is

  --   %date   - 14/03/2016
  --   %author - �������� �.�.
  --   %usage  - ����� ��� ������ � pc_oper ��������� ������� � �������� 
  -- ��� �������� ��� ������� ���������� ����� ������� ���� ����������
  c_GID rep_serv.pc_oper_PARAMS.gid%Type;
  c_ID rep_serv.pc_oper_PARAMS.id%Type;

  --��������� ��������
  c_ST_new       rep_serv.pc_oper.op_status%Type := 'NEW'; -- ����� ������
  c_ST_ENTRY     rep_serv.pc_oper.op_status%Type := 'ENTRY'; --������ � ��������� �������
  c_ST_START     rep_serv.pc_oper.op_status%Type := 'START'; --��������� �������
  c_ST_COMPLETED rep_serv.pc_oper.op_status%Type := 'COMPLETED'; --����������
  c_ST_ERR       rep_serv.pc_oper.op_status%Type := 'ERR';    --������ ��������

  -- ����� Gid  
  -- %return - gid
  FUNCTION GetNewGid return varchar2;
  
  -- ��������� ������w�� ����� �� 31 ��������
  -- %return - N_Part
  FUNCTION GetNPart return varchar2;
  
  
  -- ������� gid �� ID �������� Gid  
  -- %return - gid
  FUNCTION GET_PC_OPER_GID (i_PC_OPER_ID in pc_oper.id%type) return varchar2;
  --  ��������� ��� ������� ���� PC_OPER
  --  %param  PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_TYPE_CLEAR(PC_OPER IN OUT pc_oper%ROWTYPE);

  --  ��������� ��� ������� ���� PC_OPER_PARAM
  --  %param  PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_PARAMS_TYPE_CLEAR(PC_OPER_PARAM IN OUT pc_oper_PARAMS%ROWTYPE);

  --  ������� ��� insert ��������
  --  %param PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_INSERT(PC_OPER IN OUT pc_oper%ROWTYPE);

  --  ��������� ��� insert �������� ����� ���������
  --  %param  PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_INSERT(i_OP_NAME      in rep_serv.pc_oper.op_name%type,
                           i_OP_CODE      in rep_serv.pc_oper.OP_CODE%type,
                           i_OWNER_MODIFY in rep_serv.pc_oper.OWNER_MODIFY%type default null,
                           i_URL          in rep_serv.pc_oper.URL%type default null);

  --  ��������� ��� insert ���������� ��������
  --  %param  PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_PARAMS_INSERT(PC_OPER_PARAM IN OUT PC_OPER_PARAMS%ROWTYPE);


--  ��������� ��� insert ���������� �������� �� ������� ����������
--  %param  PC_OPER - pc_oper%ROWTYPE
  PROCEDURE PC_OPER_PARAMS_INSERT (i_PARAM in rep_serv.PC_OPER_PARAMS.param%type,
   i_VALUE in rep_serv.PC_OPER_PARAMS.value%type,
   i_SUBPARAM in rep_serv.PC_OPER_PARAMS.subparam%type default null,
   i_OID_PC_OPER in rep_serv.PC_OPER_PARAMS.oid_pc_oper %type default null,   
   i_GID in rep_serv.PC_OPER_PARAMS.gid%type default null,
   i_TYPE in rep_serv.PC_OPER_PARAMS.type%type default null) ;
   
   
  --  ��������� ����������  ��������
  --  %param  i_ID - id ��������
  --  %param  i_param - ������������ ���������
  -- %return - �������� ���������
  FUNCTION GET_PC_OPER_PARAMS(i_ID    in pc_oper_params.oid_pc_oper%TYPE,
                              i_param in pc_oper_params.param%TYPE)
    return varchar2;

  /*--  ��������� ����� ������ ����� �������� 
  --  %param i_ID - ID �������
  PROCEDURE PC_OPER_NEW(i_id in pc_oper.ID%TYPE);*/

  --  ��������� ����� ������ ������ �������� 
  --  %param i_ID - ID �������
  PROCEDURE PC_OPER_START(i_id in pc_oper.ID%TYPE);
  --  ��������� ����� ������ �������� �������� 
  --  %param i_ID - ID �������
  PROCEDURE PC_OPER_OK(i_ID in pc_oper.ID%TYPE);

  --  ��������� ����� ������ �������� � ������� ERR 
  --  %param  i_ID - ID �������
  --  %param  i_ERR - ������ �������
  PROCEDURE PC_OPER_ERR(i_ID in pc_oper.ID%TYPE, i_ERR in pc_oper.ERR%TYPE);
  
  --  ��������� ����� ������ ��������
--  %param i_ID - ID �������
--  %param  i_op_status 
  -- c_ST_new       -- ����� ������
  -- c_ST_ENTRY     --������ � ��������� �������
  -- c_ST_START     --��������� �������
  -- c_ST_COMPLETED --����������
  -- c_ST_ERR       --������ ��������
PROCEDURE PC_OPER_STATUS (i_id in pc_oper.ID%TYPE, i_op_status in pc_oper.op_status%TYPE);

 --  ������� ��������� ������� ������
 --  %param  i_OPER_STATUS -- ������ �� ����.
 --  %return ������ �� ������.            
 FUNCTION GET_RUS_PC_OPER_STATUS(i_OPER_STATUS in rep_serv.pc_oper.op_status%Type)   return varchar2;

--  ��������� ����� log ���������� ��������
--  %param  i_ID - ID �������
--  %param  i_log_text- log �������-

PROCEDURE set_OPER_LOG (i_pc_oper_ID in pc_oper.ID%TYPE, 
                          i_log_text in pc_oper_log.text%TYPE,
                          i_user in pc_oper_log.user_%TYPE default user);
                          
 --  ��������� ��������� ���������������  log ���������� ��������
--  %param  i_ID - ID �������

function get_OPER_LOG(i_pc_oper_ID in pc_oper.ID%TYPE) return varchar2;                         
end PC_OPER_WORK; 
/
create or replace package body PC_OPER_WORK is
-- ����� Gid  
-- %return - gid
FUNCTION GetNewGid return varchar2
is
begin
  c_GID := to_char(sysdate,'dd')||'_'||upper(rawToHex(sys_guid()));
  return c_GID;
end;



-- ��������� ������w�� ����� �� 31 ��������
-- %return - N_Part
FUNCTION GetNPart return varchar2
is
begin
  return to_char(sysdate,'dd');
end;

-- ������� gid �� ID �������� Gid  
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

--  ��������� ��� ������� ���� PC_OPER
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

--  ��������� ��� ������� ���� PC_OPER_PARAM
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

 
--  ��������� ��� insert ��������
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
 --commit; --�������� ORA-02064: �������������� �������� �� �������������� ��� ������� �� �����
END;

--  ��������� ��� insert �������� ����� ���������
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
 --commit; --�������� ORA-02064: �������������� �������� �� �������������� ��� ������� �� �����
END;



--  ��������� ��� insert ���������� ��������
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

  --����������� ���� �� �����!!!!
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

--  ��������� ��� insert ���������� �������� �� ������� ����������
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
  --����������� ���� �� �����!!!!
  --  PC_OPER_PARAM.PARENT      := pc_oper_param_SEQ.Currval; 
  
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
  


END;

--  ��������� ����������  ��������
--  %param  i_ID - id ��������
--  %param  i_param - ������������ ���������
-- %return - �������� ���������
FUNCTION GET_PC_OPER_PARAMS (i_ID in pc_oper_params.oid_pc_oper%TYPE, 
                             i_param in pc_oper_params.param%TYPE) return varchar2
IS
v_value pc_oper_params.value%TYPE;
BEGIN
    SELECT  
         pc.value into v_value
     FROM  rep_serv.PC_OPER_params pc
     WHERE  pc.oid_pc_oper = i_ID
      AND pc.param = i_param;
 return  v_value;
EXCEPTION               
  WHEN OTHERS  THEN return  null;    
 
null;
END;

--  ��������� ����� ������ ����� �������� 
--  %param i_ID - ID �������
/*PROCEDURE PC_OPER_NEW (i_id in pc_oper.ID%TYPE)
IS
BEGIN
  UPDATE rep_serv.pc_oper pco SET
    pco.op_status   = PC_OPER_WORK.c_ST_new
  WHERE pco.id = i_ID ;
 -- COMMIT;
  
END;*/


--  ��������� ����� ������ �������� �������� 
--  %param i_ID - ID �������
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

--  ��������� ����� ������ ������ �������� 
--  %param i_ID - ID �������
PROCEDURE PC_OPER_START (i_id in pc_oper.ID%TYPE)
IS
BEGIN
  UPDATE rep_serv.pc_oper pco SET
    pco.date_modify = sysdate,
    pco.op_status   = PC_OPER_WORK.c_ST_START
  WHERE pco.id = i_ID AND  pco.op_status != 'ERR';
 -- COMMIT;
END;

--  ��������� ����� ������ �������� � ������� ERR 
--  %param  i_ID - ID �������
--  %param  i_ERR - ������ �������
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


--  ��������� ����� ������ ��������
--  %param i_ID - ID �������
--  %param  i_op_status 
  -- c_ST_new       -- ����� ������
  -- c_ST_ENTRY     --������ � ��������� �������
  -- c_ST_START     --��������� �������
  -- c_ST_COMPLETED --����������
  -- c_ST_ERR       --������ ��������
PROCEDURE PC_OPER_STATUS (i_id in pc_oper.ID%TYPE, i_op_status in pc_oper.op_status%TYPE)
IS
BEGIN
  UPDATE rep_serv.pc_oper pco SET
    pco.op_status   = i_op_status
  WHERE pco.id = i_ID ;
 -- COMMIT;
  
END;


 --  ������� ��������� ������� ������
 --  %param  i_OPER_STATUS -- ������ �� ����.
 --  %return ������ �� ������.            
 FUNCTION GET_RUS_PC_OPER_STATUS(i_OPER_STATUS in rep_serv.pc_oper.op_status%Type)
   return varchar2 IS
   v_RUS_PC_OPER_STATUS varchar2(100);
 BEGIN
   case
     when i_OPER_STATUS = PC_OPER_WORK.c_ST_new then
       v_RUS_PC_OPER_STATUS  := '����� �����';
     when i_OPER_STATUS = PC_OPER_WORK.c_ST_ENTRY then
       v_RUS_PC_OPER_STATUS  := '������ � ���������';
     when i_OPER_STATUS = PC_OPER_WORK.c_ST_START  then
       v_RUS_PC_OPER_STATUS  := '��������� �������';
     when i_OPER_STATUS = PC_OPER_WORK.c_ST_COMPLETED  then
       v_RUS_PC_OPER_STATUS  := '����������';
     when i_OPER_STATUS = PC_OPER_WORK.c_ST_ERR then
       v_RUS_PC_OPER_STATUS := '������!';
     else
       v_RUS_PC_OPER_STATUS := null;
   end case;
   return v_RUS_PC_OPER_STATUS;
 end;


--  ��������� ����� log ���������� ��������
--  %param  i_ID - ID �������
--  %param  i_log_text- log �������-

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

--  ��������� ��������� ���������������  log ���������� ��������
--  %param  i_ID - ID �������

function get_OPER_LOG(i_pc_oper_ID in pc_oper.ID%TYPE) return varchar2 IS
  v_text PC_OPER_LOG.TEXT%type;
BEGIN
  
 select lg.text into v_text from PC_OPER_LOG lg where lg.id =
(select max(lg.id) from PC_OPER_LOG lg where lg.oid_pc_oper = i_pc_oper_ID);

return v_text;
EXCEPTION               
  WHEN OTHERS  THEN return  null;    
 
END;

end PC_OPER_WORK;
/
