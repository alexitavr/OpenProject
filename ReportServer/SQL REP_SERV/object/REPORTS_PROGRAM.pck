create or replace package REPORTS_PROGRAM is

  -- Author  : Марченко Д.С.
  -- Created : 25.04.2016
  -- Purpose : Отчеты для шедуллера


    

 /* 25.04.2016  Марченко Д.С. , СQ BASE00188881 Формирование отчет из OW4 на ежедневной основе
 "отчетность 0409135 "Информация об обязательных нормативах и о других показателях деятельности кредитной организации"
*/
 procedure Report_Account_Credit(v_mail_to in Long default 'MarchenkoDS@rncb.ru' );
 
 
 
/*
  25.04.2016  Марченко Д.С. ,BASE00188885 Создание отчета в МБанк, для формирования детальной выписки по зачислениюсписанию денежных средств на пластиковые карты РНК
 -- ПЕРЕПИСАННая апликуха sfk_rep средствами ORACLE
*/
 procedure Rep_41(i_oper_id in rep_serv.pc_oper.id%type);
 
 --ФОРМА 119 
 procedure Rep_form_119(i_oper_id in rep_serv.pc_oper.id%type);
   
end REPORTS_PROGRAM;
/
create or replace package body REPORTS_PROGRAM is

  /*
    25.04.2016  Марченко Д.С. , СQ BASE00188881 Формирование отчет из OW4 на ежедневной основе
   "отчетность 0409135 "Информация об обязательных нормативах и о других показателях деятельности кредитной организации"
  */
 
  
 /* 25.04.2016  Марченко Д.С. , СQ BASE00188881 Формирование отчет из OW4 на ежедневной основе
 "отчетность 0409135 "Информация об обязательных нормативах и о других показателях деятельности кредитной организации"
*/
 procedure Report_Account_Credit(v_mail_to in Long default 'MarchenkoDS@rncb.ru' ) 
  is
  begin
    null;
  end;
 
 
 
/*
  25.04.2016  Марченко Д.С. ,BASE00188885 Создание отчета в МБанк, для формирования детальной выписки по зачислениюсписанию денежных средств на пластиковые карты РНК
 -- ПЕРЕПИСАННая апликуха sfk_rep средствами ORACLE
*/
 procedure Rep_41(i_oper_id in rep_serv.pc_oper.id%type)
  is
  begin
    null;
  end;
  
--ФОРМА 119  
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
