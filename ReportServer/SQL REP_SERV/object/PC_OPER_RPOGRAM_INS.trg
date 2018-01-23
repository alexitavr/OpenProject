CREATE OR REPLACE TRIGGER PC_OPER_RPOGRAM_INS BEFORE INSERT ON PC_OPER_RPOGRAM
FOR EACH ROW
    WHEN (new.id IS NULL) BEGIN
  IF :new.OWNER_MODIFY IS NULL THEN
    :new.OWNER_MODIFY := '[USER='||USER||'][TERMINAL='||userenv('terminal')||']';
  ELSE
    :new.OWNER_MODIFY := '[USER='||:new.OWNER_MODIFY||'][TERMINAL='||userenv('terminal')||']';
  END IF;

  SELECT PC_OPER_RPOGRAM_SEQ.Nextval, 'A',sysdate
  INTO :new.ID,:new.state, :new.date_create
  FROM dual;
END;
/
