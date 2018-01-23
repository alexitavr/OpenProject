create or replace package PC_OPER_JOB is

  --   %date   - 02/08/2017
  --   %author - �������� �.�.
  --   %usage  - ����� ��� ������ � pc_oper ��������� ORA_JOB

  --��������� ��������
  c_ST_ENTRY     rep_serv.pc_oper_params.value%Type := 'ENTRY'; --������ � ��������� ORA_JOB
  c_ST_WORK      rep_serv.pc_oper_params.value%Type := 'WORK'; --��������� ORA_JOB
  c_ST_SUCCEEDED rep_serv.pc_oper_params.value%Type := 'SUCCEEDED'; --���������� ORA_JOB
  c_ST_FAILED    rep_serv.pc_oper_params.value%Type := 'FAILED'; --������ �������� ORA_JOB

  -- �������� ��������� �� PHP ����������� ������ ���������
  TYPE ARR_TYPE IS TABLE OF VARCHAR(200) INDEX BY varchar2(100);

  --  ������� �������� ��������� ���������� ������� 
  --  %param  i_pc_oper_ID - id PC_OPER �������
  --  %param  i_pc_STATUS - ������ ���������� �������
  --  %return - ����������� ������������ ������� �� ������� ��� ������ 

  FUNCTION ORA_JOB_STATUS(i_pc_oper_ID in pc_oper.ID%TYPE,
                          i_STATUS     rep_serv.pc_oper_params.value%Type)
    return number;

  --  ������� �������� ���������� ��������� ���������� ������� 
  --  %param  i_pc_oper_ID - id PC_OPER �������
  --  %return - ���������� �� ��������� �������

  FUNCTION ORA_JOB_STATUS_STAT(i_pc_oper_ID in pc_oper.ID%TYPE)
    return varchar2;

  --  �������� ���������� PC_OPER �������  � n-� ����������� ������� JOB
  --  %param  i_pc_oper_ID - id PC_OPER �������
  --  %return - null ��� ������ 
  FUNCTION ORA_JOB_CREATE(i_pc_oper_ID in pc_oper.ID%TYPE) return varchar;

  -- �������� ���������� ������� �� ���������� PC_OPER �������������� � PREPARE ������
  --  %param  i_pc_oper_ID - id PC_OPER �������
  --  %param  i_thread - ����������� ������������ ���������� ORA_JOB ���������� �������� �� rep_serv.pc_oper_rpogram.TREAD
  --  %return - null ��� ������ 
  PROCEDURE ORA_JOB_WORK(i_pc_oper_ID in pc_oper.ID%TYPE,
                         i_thread     in number default 1);

  --���������� ������ � �������
    --  %param  i_OP_CODE - ��� ������ 
    --  %param  i_ARR_PARAMS - ������ ���������� � �������
    --  %param  i_USER - ������������
    --  %param  i_REP_ID - ID ������ ��� ���������
    --  %return - null ��� ������ 
  FUNCTION CREATE_PC_OPER(i_ARR_PARAMS IN ARR_TYPE, 
                          i_USER pc_oper.owner_modify%type default user ,
                          i_OP_CODE pc_oper.op_code%type,
                          i_REP_ID IN reports.rep_id%type default null
                          ) return varchar2;
end PC_OPER_JOB;
/
