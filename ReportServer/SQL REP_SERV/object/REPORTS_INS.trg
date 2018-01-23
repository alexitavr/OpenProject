CREATE OR REPLACE TRIGGER REPORTS_INS BEFORE INSERT ON REPORTS
FOR EACH ROW
    WHEN (new."REP_ID" IS NULL) BEGIN
  SELECT REPORTS_SEQ.NEXTVAL
  INTO :new."REP_ID"
  FROM dual;
END;
/
