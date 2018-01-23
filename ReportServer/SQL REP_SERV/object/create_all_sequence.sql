-- Create sequence 
create sequence BOOK_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 22
increment by 1
cache 20;
-- Create sequence 
create sequence GUIDES_ID
minvalue 1
maxvalue 1000000000000000000000000000
start with 916
increment by 1
cache 5
cycle
order;
-- Create sequence 
create sequence GUIDES_REFERENCE
minvalue 1
maxvalue 1000000000000000000000000000
start with 108272233
increment by 1
cache 5
cycle
order;
-- Create sequence 
create sequence PC_OPERATIONS_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 2
increment by 1
cache 20;
-- Create sequence 
create sequence PC_OPER_LOG_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 23684
increment by 1
cache 20;
-- Create sequence 
create sequence PC_OPER_PARAM_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 28476
increment by 1
cache 20;
-- Create sequence 
create sequence PC_OPER_RPOGRAM_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 25
increment by 1
cache 20;
-- Create sequence 
create sequence PC_OPER_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 103342
increment by 1
cache 20;
-- Create sequence 
create sequence REPORTS_PARAMS_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 2793
increment by 1
cache 20;
-- Create sequence 
create sequence REPORTS_RESULT_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1460
increment by 1
cache 20;
-- Create sequence 
create sequence REPORTS_RESULT_XML_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 81
increment by 1
cache 20;
-- Create sequence 
create sequence REPORTS_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 182
increment by 1
cache 20;
-- Create sequence 
create sequence REPORTS_TEMPLATE_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 206
increment by 1
cache 20;
-- Create sequence 
create sequence VARIABLE_GUIDES_ID
minvalue 1
maxvalue 1000000000000000000000000000
start with 14919873
increment by 1
cache 5
cycle
order;
