CREATE OR REPLACE TRIGGER REPORTS_RESULT_XML_INS BEFORE INSERT ON REPORTS_RESULT_XML
FOR EACH ROW
   WHEN (new."ID" IS NULL) BEGIN
  SELECT REPORTS_RESULT_XML_SEQ.NEXTVAL
  INTO :new."ID"
  FROM dual;
END;
/