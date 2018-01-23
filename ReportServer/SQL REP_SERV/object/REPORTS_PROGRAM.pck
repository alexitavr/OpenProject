create or replace package REPORTS_PROGRAM is

  -- Author  : �������� �.�.
  -- Created : 25.04.2016
  -- Purpose : ������ ��� ���������


    

 /* 25.04.2016  �������� �.�. , �Q BASE00188881 ������������ ����� �� OW4 �� ���������� ������
 "���������� 0409135 "���������� �� ������������ ���������� � � ������ ����������� ������������ ��������� �����������"
*/
 procedure Report_Account_Credit(v_mail_to in Long default 'MarchenkoDS@rncb.ru' );
 
 
 
/*
  25.04.2016  �������� �.�. ,BASE00188885 �������� ������ � �����, ��� ������������ ��������� ������� �� ������������������ �������� ������� �� ����������� ����� ���
 -- ������������ �������� sfk_rep ���������� ORACLE
*/
 procedure Rep_41(i_oper_id in rep_serv.pc_oper.id%type);
 
 --����� 119 
 procedure Rep_form_119(i_oper_id in rep_serv.pc_oper.id%type);
   
end REPORTS_PROGRAM;
/
create or replace package body REPORTS_PROGRAM is

  /*
    25.04.2016  �������� �.�. , �Q BASE00188881 ������������ ����� �� OW4 �� ���������� ������
   "���������� 0409135 "���������� �� ������������ ���������� � � ������ ����������� ������������ ��������� �����������"
  */
 
  
 /* 25.04.2016  �������� �.�. , �Q BASE00188881 ������������ ����� �� OW4 �� ���������� ������
 "���������� 0409135 "���������� �� ������������ ���������� � � ������ ����������� ������������ ��������� �����������"
*/
 procedure Report_Account_Credit(v_mail_to in Long default 'MarchenkoDS@rncb.ru' ) 
  is
  begin
    null;
  end;
 
 
 
/*
  25.04.2016  �������� �.�. ,BASE00188885 �������� ������ � �����, ��� ������������ ��������� ������� �� ������������������ �������� ������� �� ����������� ����� ���
 -- ������������ �������� sfk_rep ���������� ORACLE
*/
 procedure Rep_41(i_oper_id in rep_serv.pc_oper.id%type)
  is
  begin
    null;
  end;
  
--����� 119  
procedure Rep_form_119(i_oper_id in rep_serv.pc_oper.id%type)
  is
    v_date_from       date;
    v_date_to         date;
    v_user varchar2(30);
  begin
  
    v_date_from := to_date(REP_SERV.PC_OPER_WORK.GET_PC_OPER_PARAMS(i_oper_id,
                                                        'DATE_START'),'dd.mm.yyyy') ; --to_date('15.05.2016','dd.mm.yyyy');--trunc(sysdate - 40);
    v_date_to   := to_date(REP_SERV.PC_OPER_WORK.GET_PC_OPER_PARAMS(i_oper_id,
                                                        'DATE_FINISH'),'dd.mm.yyyy') + 1; -- to_date('17.05.2016','dd.mm.yyyy');--trunc(sysdate - 39);
    v_user    := REP_SERV.PC_OPER_WORK.GET_PC_OPER_PARAMS(i_oper_id,
                                                       'REAL_USER'); 
    
    COTA.COTA_DRB_V2.vklad_flm(v_date_from , v_date_to,  v_user);
    commit;
 /* EXCEPTION               
  WHEN OTHERS  THEN  null  ;
 
   null;*/
  end;
  
end REPORTS_PROGRAM;
/
