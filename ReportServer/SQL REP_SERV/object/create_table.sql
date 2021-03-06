-- Create table
create table BIND_EXAMPLE
(
  name VARCHAR2(20)
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table BOOK
(
  id       INTEGER not null,
  author   VARCHAR2(100),
  title    VARCHAR2(100),
  image    VARCHAR2(100),
  category NUMBER
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table BOOK
  add constraint ID primary key (ID)
  using index 
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create table
create table CATEGORY
(
  id     INTEGER not null,
  title  CHAR(50),
  parent INTEGER
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create table
create table EMAILS
(
  user_id       VARCHAR2(10),
  friend_name   VARCHAR2(20),
  email_address VARCHAR2(20)
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create table
create table GUIDES_ALL
(
  reference NUMBER not null,
  branch    NUMBER not null,
  id        NUMBER,
  folder    NUMBER not null,
  type_doc  NUMBER not null,
  status    NUMBER default 0,
  owner     NUMBER,
  version   NUMBER default 0,
  child     NUMBER default 0,
  date_work DATE not null,
  code      VARCHAR2(200) not null,
  name      VARCHAR2(2000),
  str1      VARCHAR2(2000),
  str2      VARCHAR2(2000),
  str3      VARCHAR2(2000),
  str4      VARCHAR2(2000),
  str5      VARCHAR2(2000),
  num1      NUMBER,
  num2      NUMBER,
  num3      NUMBER,
  num4      NUMBER,
  num5      NUMBER,
  date1     DATE,
  date2     DATE,
  date3     DATE,
  code1     VARCHAR2(200) default ' ' not null,
  filial    NUMBER
)
tablespace REP_SERV_DATA
  pctfree 25
  initrans 1
  maxtrans 255
  storage
  (
    initial 64M
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create unique index GUIDES_CODE_DATE_WORK_INDEX on GUIDES_ALL (TYPE_DOC, CODE, CODE1, DATE_WORK, FILIAL)
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 664M
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table GUIDES_ALL
  add constraint GUIDES_PRIMARY_KEY primary key (REFERENCE, BRANCH)
  using index 
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 248M
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Grant/Revoke object privileges 
grant select on GUIDES_ALL to REESTR_USER;
grant select on GUIDES_ALL to UKM with grant option;
-- Create table
create table PC_OPER
(
  id           NUMBER not null,
  gid          VARCHAR2(50),
  work_date    DATE,
  date_modify  DATE default SYSDATE,
  close_date   DATE,
  op_name      VARCHAR2(2000),
  op_code      VARCHAR2(30),
  op_status    VARCHAR2(10),
  owner_modify VARCHAR2(100),
  err          VARCHAR2(4000),
  url          VARCHAR2(500)
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column PC_OPER.id
  is '������������� ������';
comment on column PC_OPER.gid
  is 'GID';
comment on column PC_OPER.work_date
  is '���� ���������� ��������';
comment on column PC_OPER.date_modify
  is '���� � ����� ���������';
comment on column PC_OPER.close_date
  is '���� ��������� ��������';
comment on column PC_OPER.op_name
  is '������������ ��������';
comment on column PC_OPER.op_code
  is '��� ��������';
comment on column PC_OPER.op_status
  is '������ ��������';
comment on column PC_OPER.owner_modify
  is '������������ ���������';
comment on column PC_OPER.err
  is '������';
comment on column PC_OPER.url
  is 'URL';
-- Create/Recreate indexes 
create index PC_OPER on PC_OPER (GID, OP_CODE, WORK_DATE)
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table PC_OPER
  add constraint PC_OPER_ID primary key (ID)
  using index 
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Grant/Revoke object privileges 
grant select on PC_OPER to CT_ADM;
grant select on PC_OPER to CT_USER;
-- Create table
create table PC_OPER_LOG
(
  id          NUMBER not null,
  oid_pc_oper NUMBER not null,
  log_date    DATE default sysdate,
  text        VARCHAR2(4000),
  user_       VARCHAR2(100) default USER
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
comment on table PC_OPER_LOG
  is '����������� �������� ��';
-- Add comments to the columns 
comment on column PC_OPER_LOG.id
  is 'ID �����������';
comment on column PC_OPER_LOG.oid_pc_oper
  is 'ID ��������';
comment on column PC_OPER_LOG.text
  is '����� ����';
comment on column PC_OPER_LOG.user_
  is '������������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PC_OPER_LOG
  add constraint PC_OPER_LOG primary key (ID)
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
create table PC_OPER_PARAMS
(
  id          NUMBER not null,
  gid         VARCHAR2(50) not null,
  oid_pc_oper NUMBER,
  dir         VARCHAR2(1) not null,
  type        VARCHAR2(30) default 'VARCHAR2(30)',
  param       VARCHAR2(30) not null,
  value       VARCHAR2(2000),
  date_create DATE default sysdate,
  n_part      NUMBER not null,
  subparam    VARCHAR2(30)
)
partition by list (N_PART)
(
  partition PC_OPER_PARAMS_1 values (1)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_2 values (2)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_3 values (3)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_4 values (4)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_5 values (5)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_6 values (6)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_7 values (7)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_8 values (8)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_9 values (9)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_10 values (10)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_11 values (11)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_12 values (12)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_13 values (13)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_14 values (14)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_15 values (15)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_16 values (16)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_17 values (17)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_18 values (18)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_19 values (19)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_20 values (20)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_21 values (21)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_22 values (22)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_23 values (23)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_24 values (24)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_25 values (25)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_26 values (26)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_27 values (27)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_28 values (28)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_29 values (29)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_30 values (30)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PC_OPER_PARAMS_31 values (31)
    tablespace REP_SERV_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
-- Add comments to the table 
comment on table PC_OPER_PARAMS
  is '������� ��� ���������� ���������� ������ �������';
-- Add comments to the columns 
comment on column PC_OPER_PARAMS.id
  is '���������� ����� ������ ��������';
comment on column PC_OPER_PARAMS.gid
  is '���������� ����� ������ ���������';
comment on column PC_OPER_PARAMS.oid_pc_oper
  is '������������� ��������';
comment on column PC_OPER_PARAMS.type
  is '��� ��������� varchar2, integer, number.....';
comment on column PC_OPER_PARAMS.param
  is '������������ ���������';
comment on column PC_OPER_PARAMS.value
  is '�������� ���������';
comment on column PC_OPER_PARAMS.subparam
  is '��� ��������';
-- Create/Recreate indexes 
create index PC_OPER_PARAMS_IDX4 on PC_OPER_PARAMS (DATE_CREATE)
  nologging  local;
create unique index PC_OPER_PARAMS_UNIQ on PC_OPER_PARAMS (ID, GID, OID_PC_OPER, PARAM, N_PART)
  nologging  local;
-- Create/Recreate primary, unique and foreign key constraints 
alter table PC_OPER_PARAMS
  add constraint PC_OPER_PARAMS_PK primary key (GID, ID, DIR, N_PART)
  using index 
  local;
alter index PC_OPER_PARAMS_PK nologging;
-- Grant/Revoke object privileges 
grant select on PC_OPER_PARAMS to CT_ADM;
grant select on PC_OPER_PARAMS to CT_USER;
-- Create table
create table PC_OPER_RPOGRAM
(
  id           NUMBER not null,
  parent_id    NUMBER,
  state        VARCHAR2(1) default 'I' not null,
  op_name      VARCHAR2(200) not null,
  op_code      VARCHAR2(30) not null,
  program      VARCHAR2(500) not null,
  date_create  DATE default sysdate,
  owner_modify VARCHAR2(100) not null,
  owner_job    VARCHAR2(30),
  tread        NUMBER
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PC_OPER_RPOGRAM
  is '������� ��� ����������������� ������ �������';
-- Add comments to the columns 
comment on column PC_OPER_RPOGRAM.id
  is 'ID ������';
comment on column PC_OPER_RPOGRAM.parent_id
  is '������������ ��������';
comment on column PC_OPER_RPOGRAM.state
  is '������ A- �����, I- �� �����, H- �������';
comment on column PC_OPER_RPOGRAM.op_name
  is '�������� �������� ��� PC_OPER';
comment on column PC_OPER_RPOGRAM.op_code
  is '��� �������� ��� PC_OPER';
comment on column PC_OPER_RPOGRAM.program
  is '��������';
comment on column PC_OPER_RPOGRAM.date_create
  is '���� ��������';
comment on column PC_OPER_RPOGRAM.owner_modify
  is '������������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PC_OPER_RPOGRAM
  add constraint PK_PC_OPER_RPOGRAM primary key (ID)
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
alter table PC_OPER_RPOGRAM
  add constraint UC_PC_OPER_RPOGRAM unique (ID, OP_CODE, PROGRAM)
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
-- Grant/Revoke object privileges 
grant select on REPORTS_RESULT to CT_ADM;
grant select on REPORTS_RESULT to CT_USER;
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
-- Create table
create table TYPES
(
  type_id   NUMBER not null,
  name      VARCHAR2(50) not null,
  shortname VARCHAR2(15),
  manual    NUMBER default 0,
  code      NUMBER default 0,
  action    NUMBER(1) default 0,
  priority  NUMBER default 0
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index TYPES_TYPE_INDEX on TYPES (CODE)
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TYPES
  add constraint TYPES_PRIMARY_KEY primary key (TYPE_ID)
  using index 
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TYPES
  add constraint TYPES_UNIQUE1 unique (NAME, CODE)
  using index 
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 960K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Grant/Revoke object privileges 
grant select on TYPES to UKM;
-- Create table
create table VARIABLE_GUIDES
(
  name      VARCHAR2(30) not null,
  reference NUMBER not null,
  branch    NUMBER default 0 not null,
  subnumber NUMBER default 0,
  rownumber NUMBER default 0,
  colnumber NUMBER default 0,
  value     VARCHAR2(2000),
  subfield  VARCHAR2(30),
  id        NUMBER not null
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table VARIABLE_GUIDES
  add constraint VAR_GUIDES_PKEY primary key (BRANCH, REFERENCE, ID)
  using index 
  tablespace REP_SERV_DATA
  pctfree 0
  initrans 2
  maxtrans 255
  storage
  (
    initial 298M
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Grant/Revoke object privileges 
grant select on VARIABLE_GUIDES to BONDARCHUK_AY;
-- Create table
create table VARIABLE_TYPES
(
  name      VARCHAR2(30) not null,
  type      NUMBER not null,
  rownumber NUMBER default 0 not null,
  value     VARCHAR2(2000)
)
tablespace REP_SERV_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index VAR_TYPES_NAME on VARIABLE_TYPES (NAME, VALUE)
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 960K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table VARIABLE_TYPES
  add constraint VAR_TYPES_PKEY primary key (TYPE, NAME, ROWNUMBER)
  using index 
  tablespace REP_SERV_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VARIABLE_TYPES
  add constraint VAR_TYPES_FK foreign key (TYPE)
  references TYPES (TYPE_ID) on delete cascade;
-- Grant/Revoke object privileges 
grant select on VARIABLE_TYPES to BONDARCHUK_AY;
grant select on VARIABLE_TYPES to CPMS;

