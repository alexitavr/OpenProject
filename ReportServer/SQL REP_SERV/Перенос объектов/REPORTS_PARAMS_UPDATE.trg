CREATE OR REPLACE TRIGGER REPORTS_PARAMS_UPDATE
  before UPDATE ON REPORTS_PARAMS
  FOR EACH ROW
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

  --Пишем историю параметров
  insert into REPORTS_PARAMS value
    (oid_rep_id,PARAM, value, type, default_value, subparam, state)
    (select RP.oid_rep_id, RP.PARAM, rp.value, rp.type, rp.default_value, rp.subparam, 'H'
       from REPORTS_PARAMS RP
      where rp.parms_id = :old.parms_id
          and  rp.oid_rep_id = :old.oid_rep_id);
commit;
END;
/
