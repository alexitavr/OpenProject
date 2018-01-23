CREATE OR REPLACE TRIGGER REPORTS_TEMPLATE_INS BEFORE INSERT ON REPORTS_TEMPLATE
FOR EACH ROW
   WHEN (new."REP_TEMP_ID" IS NULL) BEGIN

 --ID шаблона
  SELECT REPORTS_TEMPLATE_SEQ.NEXTVAL INTO :new.REP_TEMP_ID FROM DUAL;
  SELECT upper(PTOOLS.split(substr(:new.file_name,-5),'.',2)) into :new.extension from DUAL ;

  --ѕрисваиваем новую версию шаблона
  for temp_create in (select max(rt.version) max_version from REPORTS_TEMPLATE rt
                      where rt.oid_rep_id= :new.oid_rep_id) loop

     :new.version :=  nvl(temp_create.max_version,0) + 1;

  end loop;

END;
/
