-- Create table
create table REPORTS
(
  rep_id      NUMBER not null,
  rep_name    VARCHAR2(200) not null,
  state       VARCHAR2(1) default 'A',
  sub         NUMBER default 0 not null,
  create_date DATE default sysdate not null,
  modify_date DATE default sysdate not null,
  version     NUMBER default 0 not null,
  user_       VARCHAR2(30) default USER
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table REPORTS
  is '�� ������';
-- Add comments to the columns 
comment on column REPORTS.rep_id
  is 'ID ������';
comment on column REPORTS.rep_name
  is '�������� ������';
comment on column REPORTS.state
  is '������ A- �����, I- �� �����, H- �������';
comment on column REPORTS.sub
  is '����� ��������';
comment on column REPORTS.create_date
  is '���� ��������';
comment on column REPORTS.modify_date
  is '���� ���������';
comment on column REPORTS.version
  is '������ ������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table REPORTS
  add constraint PK_REPORTS primary key (REP_ID)
  using index 
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 160K
    next 1M
    minextents 1
    maxextents unlimited
  );


-- Create table
create table REPORTS_PARAMS
(
  parms_id      NUMBER not null,
  oid_rep_id    NUMBER not null,
  param         VARCHAR2(30) not null,
  value         VARCHAR2(4000),
  subparam      VARCHAR2(30),
  type          VARCHAR2(30) default 'VARCHAR2(30)' not null,
  default_value VARCHAR2(200),
  date_create   DATE default sysdate,
  state         VARCHAR2(1) default 'A' not null,
  user_         VARCHAR2(100) default USER
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table REPORTS_PARAMS
  is '�� ��������� ������';
-- Add comments to the columns 
comment on column REPORTS_PARAMS.parms_id
  is 'ID ���������';
comment on column REPORTS_PARAMS.oid_rep_id
  is 'ID ������';
comment on column REPORTS_PARAMS.param
  is '��� ���������';
comment on column REPORTS_PARAMS.value
  is '�������� ��������� �� ���������';
comment on column REPORTS_PARAMS.subparam
  is '������������ ��������, ����� ���������� ����� �����';
comment on column REPORTS_PARAMS.type
  is '��� ���������';
comment on column REPORTS_PARAMS.date_create
  is '���� ��������';
comment on column REPORTS_PARAMS.state
  is '������ A- �����, I- �� �����, H- ������� ';
comment on column REPORTS_PARAMS.user_
  is '������������ ��������� ��������� ';
-- Create/Recreate indexes 
create unique index UNIC_IND_REPORTS_PARAMS on REPORTS_PARAMS (OID_REP_ID, PARAM, SUBPARAM, CASE STATE WHEN 'H' THEN TO_CHAR(PARMS_ID) ELSE 'A' END)
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table REPORTS_PARAMS
  add constraint PK_REPORTS_PARAMS primary key (PARMS_ID)
  using index 
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REPORTS_PARAMS
  add constraint FK_REPORTS_PARAMS foreign key (OID_REP_ID)
  references REPORTS (REP_ID);


-- Create table
create table REPORTS_RESULT
(
  id          NUMBER not null,
  gid         VARCHAR2(50),
  oid_rep_id  NUMBER not null,
  oid_pc_oper NUMBER not null,
  work_date   DATE default sysdate,
  rep_blob    BLOB,
  file_name   VARCHAR2(2000),
  user_       VARCHAR2(30) default USER
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 800M
    next 100M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table REPORTS_RESULT
  is '�� ������, �������������� �����';
-- Add comments to the columns 
comment on column REPORTS_RESULT.id
  is '������������� ������';
comment on column REPORTS_RESULT.gid
  is 'GID';
comment on column REPORTS_RESULT.oid_rep_id
  is 'ID ������';
comment on column REPORTS_RESULT.oid_pc_oper
  is 'ID �������� �������� ������';
comment on column REPORTS_RESULT.work_date
  is '���� ���������� ��������';
comment on column REPORTS_RESULT.rep_blob
  is '���� � �������';
comment on column REPORTS_RESULT.file_name
  is '��� �����';
comment on column REPORTS_RESULT.user_
  is '������������ ��������� �����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table REPORTS_RESULT
  add constraint PK_REPORTS_RESULT primary key (ID)
  using index 
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 160K
    next 1M
    minextents 1
    maxextents unlimited
  );


-- Create table
create table REPORTS_RESULT_XML
(
  id          NUMBER not null,
  gid         VARCHAR2(50),
  oid_rep_id  NUMBER not null,
  oid_pc_oper NUMBER not null,
  work_date   DATE default sysdate,
  xml_data    SYS.XMLTYPE,
  file_name   VARCHAR2(2000),
  user_       VARCHAR2(30) default USER
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 10M
    next 10M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table REPORTS_RESULT_XML
  is '�� ������, �������������� �����';
-- Add comments to the columns 
comment on column REPORTS_RESULT_XML.id
  is '������������� ������';
comment on column REPORTS_RESULT_XML.gid
  is 'GID';
comment on column REPORTS_RESULT_XML.oid_rep_id
  is 'ID ������';
comment on column REPORTS_RESULT_XML.oid_pc_oper
  is 'ID �������� �������� ������';
comment on column REPORTS_RESULT_XML.work_date
  is '���� ���������� ��������';
comment on column REPORTS_RESULT_XML.xml_data
  is 'XML c �������';
comment on column REPORTS_RESULT_XML.file_name
  is '��� �����';
comment on column REPORTS_RESULT_XML.user_
  is '������������ ��������� �����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table REPORTS_RESULT_XML
  add constraint REPORTS_RESULT_XML primary key (ID)
  using index 
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


-- Create table
create table REPORTS_TEMPLATE
(
  rep_temp_id NUMBER not null,
  oid_rep_id  NUMBER not null,
  rep_blob    BLOB,
  version     NUMBER(3),
  file_name   VARCHAR2(2000),
  size_       NUMBER not null,
  file_dtm    DATE,
  extension   VARCHAR2(20) default 'XSLS' not null,
  rep_date    DATE default SYSDATE not null,
  file_term   VARCHAR2(30) default userenv('terminal') not null,
  user_       VARCHAR2(100) default USER not null
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 100M
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table REPORTS_TEMPLATE
  is '������� ��� �������� �������� WORD, EXEL';
-- Add comments to the columns 
comment on column REPORTS_TEMPLATE.rep_temp_id
  is 'ID �������';
comment on column REPORTS_TEMPLATE.oid_rep_id
  is 'ID ������';
comment on column REPORTS_TEMPLATE.rep_blob
  is '������ ������';
comment on column REPORTS_TEMPLATE.version
  is '������ �������';
comment on column REPORTS_TEMPLATE.file_name
  is '���� �������� �������';
comment on column REPORTS_TEMPLATE.size_
  is '������ �����';
comment on column REPORTS_TEMPLATE.file_dtm
  is '���� �������� ����� ������';
comment on column REPORTS_TEMPLATE.extension
  is '���������� �����';
comment on column REPORTS_TEMPLATE.rep_date
  is '���� ��������';
comment on column REPORTS_TEMPLATE.file_term
  is '�������� ��������';
comment on column REPORTS_TEMPLATE.user_
  is '����������� ������������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table REPORTS_TEMPLATE
  add constraint PK_REPORTS_TEMPLATE primary key (REP_TEMP_ID)
  using index 
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REPORTS_TEMPLATE
  add constraint FK_REPORTS_TEMPLATE foreign key (OID_REP_ID)
  references REPORTS (REP_ID);
  
  
  -- Create sequence 
create sequence REPORTS_PARAMS_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1359
increment by 1
cache 20;

-- Create sequence 
-- Create sequence 
create sequence REPORTS_RESULT_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 964
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
start with 121
increment by 1
cache 20;

-- Create sequence 
create sequence REPORTS_TEMPLATE_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 161
increment by 1
cache 20;


