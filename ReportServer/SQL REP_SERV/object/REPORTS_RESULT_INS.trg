CREATE OR REPLACE TRIGGER REPORTS_RESULT_INS BEFORE INSERT ON REPORTS_RESULT
FOR EACH ROW
    WHEN (new."ID" IS NULL) BEGIN
  SELECT REPORTS_RESULT_SEQ.NEXTVAL
  INTO :new."ID"
  FROM dual;
END;
/