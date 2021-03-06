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


-- Create table
create table PC_OPER_RPOGRAM
(
  id          NUMBER not null,
  state       VARCHAR2(1) default 'I' not null,
  op_code     VARCHAR2(30) not null,
  scheme      VARCHAR2(30) not null,
  package     VARCHAR2(30),
  method      VARCHAR2(30) not null,
  date_create DATE default sysdate
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
comment on column PC_OPER_RPOGRAM.state
  is '������ A- �����, I- �� �����, H- �������';
comment on column PC_OPER_RPOGRAM.op_code
  is '��� �������� ��� PC_OPER';
comment on column PC_OPER_RPOGRAM.scheme
  is '����� ��';
comment on column PC_OPER_RPOGRAM.package
  is '�����';
comment on column PC_OPER_RPOGRAM.method
  is '�����';
comment on column PC_OPER_RPOGRAM.date_create
  is '���� ��������';
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
  add constraint UC_PC_OPER_RPOGRAM unique (ID, OP_CODE, SCHEME, PACKAGE, METHOD)
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


-- Create sequence 
create sequence PC_OPERATIONS_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 10861
increment by 1
cache 20;


-- Create sequence 
create sequence PC_OPER_LOG_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 15781
increment by 1
cache 20;


-- Create sequence 
create sequence PC_OPER_PARAM_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 208644
increment by 1
cache 20;


-- Create sequence 
create sequence PC_OPER_RPOGRAM_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 10
increment by 10
cache 20;


-- Create sequence 
create sequence PC_OPER_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 102671
increment by 1
cache 20;

