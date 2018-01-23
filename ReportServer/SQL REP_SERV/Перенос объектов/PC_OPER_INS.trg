CREATE OR REPLACE TRIGGER PC_OPER_INS BEFORE INSERT ON PC_OPER
FOR EACH ROW
    WHEN (new.id IS NULL) BEGIN
  IF :new.OWNER_MODIFY IS NULL THEN
    :new.OWNER_MODIFY := '[USER='||USER||'][TERMINAL='||userenv('terminal')||']';
  ELSE
    :new.OWNER_MODIFY := '[USER='||:new.OWNER_MODIFY||'][TERMINAL='||userenv('terminal')||']';
  END IF;
  

  IF :new.OP_STATUS IS NULL THEN
   :new.OP_STATUS := pc_oper_WORK.c_ST_new;
  END IF;  
  
  pc_oper_WORK.c_GID := '';
  pc_oper_WORK.c_GID := pc_oper_WORK.GetNewGid;
  
  pc_oper_WORK.c_ID := '';
 -- select  into  from dual;
  select pc_oper_SEQ.Nextval into pc_oper_WORK.c_ID from dual;
   
  
  SELECT pc_oper_SEQ.Currval, pc_oper_WORK.c_GID, sysdate
  INTO :new.ID,:new.GID,:new.WORK_DATE 
  FROM dual;
END;
/
