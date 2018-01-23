CREATE OR REPLACE TRIGGER PC_OPER_PARAMS_INS BEFORE INSERT ON pc_oper_params
FOR EACH ROW
    WHEN (new.id IS NULL) BEGIN
      
  select pc_oper_param_SEQ.Nextval into :new.ID from dual;
  --:new.ID := pc_oper_param_SEQ.Nextval;
  :new.DIR  := 'A';
  :new.N_PART      := PC_OPER_WORK.GetNPart;
  
  if :new.GID is null then
    :new.GID:= PC_OPER_WORK.c_GID;
  end if;
  
  if :new.OID_PC_OPER is null then
    :new.OID_PC_OPER := PC_OPER_WORK.c_ID;
  end if;
 
 --Переводим все одноименные параметры в статус I -Неактивный
  for par_create in (select rp.id from rep_serv.pc_oper_params RP
                     where upper(RP.PARAM) =  Upper( :new.PARAM )
                      and nvl(RP.Subparam,'0') =  Upper( :new.Subparam)     
                      and rp.oid_pc_oper = :new.oid_pc_oper) loop

   update rep_serv.pc_oper_params  set
           DIR = 'I'
   where id = par_create.id;
  end loop;

END;
/
