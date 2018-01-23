create or replace package REPORTS_WORK is

  --   %date   - 20/07/2016
  --   %author - МАРЧЕНКО Д.С.
  --   %usage  - Пакет для работы с REPORTS


 -- ID отчета 
  c_REP_ID      rep_serv.reports.rep_id%Type;
  c_GID         rep_serv.pc_oper.gid%type;
  c_ID_PC_OPER  rep_serv.pc_oper.id%type;
  c_USER_       rep_serv.reports_result.user_%type default user;
  G_CIKL integer := 0;
  G_REP_ZIP_ID integer; --:= SEQ_REPORT_TO_ZIP.Nextval;
 -- G_REP_NAME PRC_LOADER.REPORT_TO_MBANK.rep_name  @krim%type;
  G_SYSDATE DATE := SYSDATE;

  
  --Тип для ускорения записи данных
 /* type RES_REP_TO_MBANK is record(
   rep_id      PRC_LOADER.REPORT_TO_MBANK.rep_id    @krim%type,
   rep_name     PRC_LOADER.REPORT_TO_MBANK.rep_name  @krim%type,  
   TEXT         PRC_LOADER.REPORT_TO_MBANK.TEXT      @krim%type,
   file_name    PRC_LOADER.REPORT_TO_MBANK.file_name @krim%type, 
   date1        PRC_LOADER.REPORT_TO_MBANK.date1     @krim%type,
   ORDER_PRTY   PRC_LOADER.REPORT_TO_MBANK.ORDER_PRTY    @krim%type);    */
    
  /* type tab_REP_TO_MBANK  is table of RES_REP_TO_MBANK  index by binary_integer;
   G_tab_REP_TO_MBANK   REPORTS_WORK.tab_REP_TO_MBANK;*/

  --DEF_V_MAILFROM constant varchar2(100) := 'AvtomatReport@rncb.ru' ; -- отправитель
  DBLINK_ABS constant varchar2(50) := 'KRIM' ;                        -- БД dblink к АБС


  --25.04.2016  Марченко Д.С. 
  --Инит глобальных переменых отчета
  procedure  INIT_REP_GlObals ;

  --  функция insert нового отчета
  --  %param  i_NAME         -- Имя отчета
  --  %param  i_SUB          -- Родительский отчет
  --  %param  i_DEVELOPER    -- разработчик отчета
  --  %return ID отчета или ошибку.                 
  FUNCTION NEW_REPORT(i_NAME      in reports.rep_name%type,
                      i_DEVELOPER in REPORTS_PARAMS.Value%type default USER,
                      i_SUB       in reports.SUB%type default 0)
    return varchar2;
    
   --  функция insert новой программы
  --  %param  i_NAME         -- Имя программы
  --  %param  i_SUB          -- Родительская программа
  --  %param  i_DEVELOPER    -- разработчикпрограмма
  --  %return ID отчета или ошибку.            
  FUNCTION NEW_PROGRAM(i_NAME      in reports.rep_name%type,
                      i_DEVELOPER in REPORTS_PARAMS.Value%type default USER,
                      i_SUB       in reports.SUB%type default 0)
    return varchar2;
       
   --  функция insert параметров новой страницы отчета
  --  %param  i_REP_ID        -- Имя отчета
   --   %return null  или ошибку.         
  FUNCTION NEW_PAGE_PARAM(i_REP_ID  in reports.rep_id%type, i_user_ in reports_params.user_%type ) return varchar2;
 
 
    --  функция insert параметров новой программы 
   --  %param  i_REP_ID        -- Имя отчета
  --   %return null  или ошибку.             
  FUNCTION NEW_PROGRAM_PARAM(i_REP_ID  in reports.rep_id%type, i_user_ in reports_params.user_%type )
    return varchar2;
    
  --  функция set  параметра
  --  %param  rep_id -- id отчета 
  --  %param  i_PARAM    -- Имя параметра
  --  %param  i_VALUE    -- значение параметра
  --  %param  i_TYPE     -- тип
  --  %param  i_subparam -- Корневой параметр для связи параметров
  --   %return значение параметра отчета или ошибку.   
  
    --  функция имя отчета по id
  --  %param  rep_id -- id отчета             
  FUNCTION GET_REPORT_NAME(i_REP_ID in reports.rep_id%type) return varchar2;
  
  FUNCTION  SET_REPORT_PARAM(i_REP_ID   in reports.rep_id%type,
                             i_PARAM    in reports_params.param%type,
                             i_VALUE    in reports_params.value%type,
                             i_SUBPARAM in reports_params.subparam%type default null,
                             i_TYPE     in reports_params.type%type default 'VARCHAR2',
                             i_default_value in reports_params.default_value%type default null,
                             i_user in reports_params.user_%type default user 
                             ) return varchar2 ;


  --  функция get параметра
  --  %param  rep_id -- id отчета 
  --  %param  i_PARAM    -- Имя параметра
  --  %param  i_SUBPARAM -- Имя суб параметра
  --  %param  i_STATE -- состояние параметра 
  --  %return значение параметра отчета или ошибку.            
  FUNCTION GET_REPORT_PARAM(i_REP_ID   in reports.rep_id%type,
                            i_PARAM    in reports_params.param%type,
                            i_SUBPARAM in reports_params.subparam%type default null,
                            i_STATE    IN reports_params.state%type default 'A')return varchar2;


  --  функция get рекорда параметра
  --  %param  rep_id -- id отчета 
  --  %param  i_PARAM    -- Имя параметра
  --  %param  i_SUBPARAM -- Имя суб параметра
  --  %param  i_STATE -- состояние параметра 
  --  %return значение параметра отчета или ошибку.            
  FUNCTION GET_REPORT_PARAM_REC(i_REP_ID   in reports.rep_id%type,
                            i_PARAM    in reports_params.param%type,
                            i_SUBPARAM in reports_params.subparam%type default null,
                            i_STATE    IN reports_params.state%type default 'A')
    return reports_params%rowtype;
    
    
  --  функция  set нового шаблона отчета
  --  %param  rep_id -- id отчета 
  --  %param  i_rep_blob --блоб с шаблоном
  --  %param  i_file_dtm -- дата файла шаблона
  --  %param  i_file_name --полный путь и имя загрузки шаблона

  FUNCTION SET_REPORT_TEMPLATE(i_REP_ID    in reports.rep_id%type,
                                i_rep_blob  in out reports_TEMPLATE.Rep_Blob%type,
                                i_file_dtm  in reports_TEMPLATE.file_dtm%type,
                                i_file_name in reports_TEMPLATE.file_name%type,
                                i_size_     in reports_TEMPLATE.Size_%type,
                                i_File_Term    in reports_TEMPLATE.File_Term%type,
                                i_User_   in reports_TEMPLATE.User_%type
                                )  return varchar2;

  --  процедура  set результата выполнения процедуры формирования отчета в XML
  --  %param  i_oper_id  --id операци
  --  %param  i_REP_XM -- XML отчеты
  --  %param i_file_name 
  
  PROCEDURE SET_REPORT_TO_XML(i_oper_id in rep_serv.pc_oper.id%type ,
    i_REP_XML in reports_result_XML.Xml_Data%type,
    i_file_name in reports_result.file_name%type default null
    );
    
    --  функция пишет открытый курсор в XML
  --  %param  i_PC_ORER_ID -- id операции
  --  %param  i_cursor    --  открытый курсор
  --  %param  i_file_neme -- Имя файла
  --  %return значение параметра отчета или ошибку.   
  
procedure set_REFCURSOR_TO_XML (i_oper_id IN PC_OPER.ID%TYPE,
                          i_cursor IN SYS_REFCURSOR ,
                          i_file_neme IN rep_serv.REPORTS.REP_NAME%TYPE DEFAULT NULL);
 
  --  функция получения названия файла
  --  i_pc_oper_id -- id операциии
  --  i_num_file_name  -- порядковый номер файла из параметров
  --        усли 'ZIP' название файла zip
  --  %RETURN названия файла
  
  FUNCTION GET_FILE_NAME (i_pc_oper_id in rep_serv.pc_oper.id%type,
                          i_num_file_name in varchar2 default '1') return varchar2;
    
  --  процедура get  шаблона отчета
  --  %param  rep_id -- id отчета 
  --  %return блоб шаблона.            
  FUNCTION GET_REPORT_TEMPLATE(i_REP_ID in reports.rep_id%type) return blob;

  --  процедура отправки отчета по почте
  --  %param  rep_id -- id отчета 
  --  %param  i_REP_BLOB    -- блоб с отчетом       
  PROCEDURE SEND_REPORT(i_REP_ID   in reports.rep_id%type,
                        i_REP_BLOB in rep_serv.reports_template.rep_blob%type);
                        
 

  --  функция создания отчета по шаблону и SQL запросам
  --  %param  rep_id -- id отчета     
  --FUNCTION GENERATE_REPORT(i_pc_oper_id  in rep_serv.pc_oper.id%type) RETURN VARCHAR2;
  

   --  Инит глобальных переменых отчета по id операции pc_oper.id
 
procedure  PC_OPER_INIT_REP( i_pc_oper_id in rep_serv.pc_oper.id%type);

  --  функция заказа отчета на выполнение четез PC_OPER
  --  %param  rep_id -- id отчета     
  --  %param i_user  -- пользователь)
  --  %RETURN null все ок  
   

FUNCTION ORDER_REPORT(i_REP_ID in reports.rep_id%type, 
                       i_user in  pc_oper.owner_modify%type default null) return varchar2 ;
                       
  --  функция заказа отчета на выполнение четез PC_OPER за период
 --  %param  rep_id -- id отчета     
 --  %param i_user  -- пользователь)
 --  %param i_DATE_START  -- период формирования отчета
 --  %param i_DATE_FINISH 
 --  %RETURN null все ок
 /*FUNCTION  ORDER_REPORT_BY_PERIOD(i_REP_ID in reports.rep_id%type,
                       i_user   in pc_oper.owner_modify%type default null,
                       i_DATE_START in date,
                       i_DATE_FINISH in date
                       )
   return varchar2
  ;*/
   
 --  Функция обработки генерации отчетов из PC_OPERATION
--  %RETURN NULL или Ошибка
--*/  
--PROCEDURE  OPER_GENERATE_RERORT_START ;--RETURN VARCHAR2;

  --  функция заменяет параметря вызова на переменку из PC_oper
  --  Переменяется для замены параметров ":name" в SQL
  --  %param  i_PC_ORER_ID -- id операции
  --  %param  i_PARAM    -- Имя параметра
  --  %param  i_SUBPARAM -- Имя суб параметра
  --  %return значение параметра отчета или ошибку.            
  FUNCTION REPLACE_PARAM_BY_PC_OPER_ID(i_PC_ORER_ID   in pc_oper.id%type,
                                       i_PARAM        in reports_params.value%type,
                                       i_SUBPARAM     in reports_params.subparam%type
                            ) return varchar2;    
                            
  --  процедура  set результата выполнения процедуры формирования отчета
  --  %param  i_oper_id  --id операци
  --  %param  i_rep_blob -- блоб с отчетом
  --  %param i_file_name 
  
  PROCEDURE SET_REPORT_RESULT(i_oper_id in rep_serv.pc_oper.id%type ,
    i_REP_BLOB in reports_result.rep_blob%type,
    i_file_name in reports_result.file_name%type default null);
    
       

--  функция получения ID отчета по OP_CODE из параметров
--  %param  i_op_code -код операци
--  %return ID отчета или null
FUNCTION GET_REPID_BY_OP_CODE(i_op_code in pc_oper.op_code%TYPE)
  return REP_SERV.Reports.REP_ID%type;
    
 /*-- 25.04.2016  Марченко Д.С. 
 -- пишем в таблишу report_to_zip   n кол отчетов дергаем метод pck_zip.blob_compress получаем zip блоб на выходе*/
  /*procedure INSERT_INTO_REP_TO_ZIP(i_rep_name varchar2,i_blob blob, i_file_name varchar2);
                               
*/
 -- 25.04.2016  Марченко Д.С.
 --  пишем в PRC_LOADER.REPORT_TO_MBANK для отчета, таблиц для выгрузки данных для отчетов в МБАНК
 --  %param  i_text -- Текст отчета
 --  %param  i_file_name - Имя файла для отправки
 --  %param  i_insert_to_mbank - false - заполняем записи
 --                                TRUE  - пишем записи в mbank

 
/*procedure INSERT_RES_REP_TO_MBANK (i_text      PRC_LOADER.REPORT_TO_MBANK.TEXT@krim%type,
                                 i_file_name PRC_LOADER.REPORT_TO_MBANK.file_name@krim%type,
                                 i_insert_to_mbank boolean
                             ) ;*/


-- Экспорт данных по линку
-- %param  i_PC_ORER_ID -- id операции
--procedure EXPORT_DATA_BY_LINK (i_oper_id   in pc_oper.id%type );  

-- Авто генерация отчета по достижении рнастроенного перииода и времени
procedure AUTO_SHEDULER;               
end REPORTS_WORK;
/
create or replace package body REPORTS_WORK is


--  Инит глобальных переменых отчета по id операции pc_oper.id 
procedure  PC_OPER_INIT_REP( i_pc_oper_id in rep_serv.pc_oper.id%type) is
 -- new_tab_REP_TO_MBANK   REPORTS_SHEDULLER.tab_REP_TO_MBANK;
begin
  c_REP_ID  := ''  ;
  c_ID_PC_OPER  :=  ''; 
  c_GID      :=  '' ;
  c_USER_    :=  '' ;
  c_REP_ID  :=  PC_OPER_WORK.GET_PC_OPER_PARAMS (i_pc_oper_id,'REP_ID')    ;
  c_ID_PC_OPER  :=  i_pc_oper_id; 
  c_GID      :=  PC_OPER_WORK.GET_PC_OPER_GID (i_pc_oper_id) ;
  c_USER_    :=  PC_OPER_WORK.GET_PC_OPER_PARAMS (i_pc_oper_id,'USER')    ;
end; 

/*
  25.04.2016  Марченко Д.С. 
   Инит глобальных переменых отчета
  */
procedure  INIT_REP_GlObals is
 -- new_tab_REP_TO_MBANK   REPORTS_WORK.tab_REP_TO_MBANK;

begin
 -- G_REP_ZIP_ID   := SEQ_REPORT_TO_ZIP.Nextval;
  --G_REP_NAME := null;
  G_SYSDATE  := SYSDATE; 
 -- G_tab_REP_TO_MBANK :=  new_tab_REP_TO_MBANK;
  
end; 


  --  функция insert нового отчета
  --  %param  i_NAME         -- Имя отчета
  --  %param  i_SUB          -- Родительский отчет
  --  %param  i_DEVELOPER    -- разработчик отчета
  --  %return ID отчета или ошибку.            
  FUNCTION NEW_REPORT(i_NAME      in reports.rep_name%type,
                      i_DEVELOPER in REPORTS_PARAMS.Value%type default USER,
                      i_SUB       in reports.SUB%type default 0)
    return varchar2 IS
    v_res varchar(4000); 
    next_seq  integer; 
    currv_seq integer; 
  BEGIN
   
  for cur_old in (select rp.rep_name
                from rep_serv.reports rp
               where upper(rp.rep_name) like upper(i_NAME)
                 and rp.state = 'A')loop
     return 'Отчет с таким именем уже существует!!!!';
   end loop;
   
   if trim(replace(UPPER(i_NAME),'ОТЧЕТ','1')) = '1' then
      return 'Введите название отчета!!!!';
   end if; 
         
  
    insert into REPORTS (REP_NAME, SUB,USER_) values (i_NAME, i_SUB,upper(i_DEVELOPER) );
   
   --Заполняем параметры по умолчанию болванка параметров из отчета Шаблона
         
    insert into REPORTS_PARAMS value
      (oid_rep_id, PARAM, value, type, default_value, subparam, user_)
      (select rep_serv.reports_seq.currval,
              a.PARAM,
              a.default_value,
              a.type,
              null,
              a.subparam,
              upper(i_DEVELOPER)
         from (select rp.PARAM, rp.default_value, rp.type, null, rp.subparam
                 from Reports_Params rp
                where rp.oid_rep_id = '0'
                  and rp.param != 'PAGE_'
                  and rp.subparam != 'PAGE_' -- отчет Шаблон
                  and rp.state = 'A'
               connect by prior rp.param = rp.subparam
                      and rp.oid_rep_id = '0'
                       and rp.state = 'A'
                start with rp.param = 'ADMIN'
                       and rp.oid_rep_id = '0'
                        and rp.state = 'A'
                order by rp.parms_id) a);
   
   select rep_serv.reports_seq.currval into next_seq from dual;
   v_res := SET_REPORT_PARAM(next_seq,
                             'DEVELOPER',
                             upper(i_DEVELOPER),
                             'REPORT_PARAM',
                             'VARCHAR2',
                             null,
                             upper(i_DEVELOPER) 
                             );
   select rep_serv.reports_seq.currval into currv_seq from dual   ;  
                        
   --Добавляем первую страниц отчета   
    v_res := v_res || NEW_PAGE_PARAM(currv_seq,upper(i_DEVELOPER) );
     if v_res != null then
       return v_res;
     end if; 
     
    IF v_res != null THEN
     rollback;
     return v_res;
    END IF;    
    commit;
    return v_res;--rep_serv.reports_seq.currval;
  EXCEPTION
    WHEN OTHERS THEN
      rollback;
      return 'Ошибка создания нового отчета ' || SQLERRM;
  END;
 
  --  функция insert новой программы
  --  %param  i_NAME         -- Имя программы
  --  %param  i_SUB          -- Родительская программа
  --  %param  i_DEVELOPER    -- разработчикпрограмма
  --  %return ID отчета или ошибку.            
  FUNCTION NEW_PROGRAM(i_NAME      in reports.rep_name%type,
                      i_DEVELOPER in REPORTS_PARAMS.Value%type default USER,
                      i_SUB       in reports.SUB%type default 0)
    return varchar2 IS
    v_res varchar(4000); 
    next_seq  integer; 
    currv_seq integer; 
  BEGIN
   
  for cur_old in (select rp.rep_name
                from rep_serv.reports rp
               where upper(rp.rep_name) like upper(i_NAME)
                 and rp.state = 'A')loop
     return 'Программа с таким именем уже существует!!!!';
   end loop;
   
   if trim(replace(UPPER(i_NAME),'ОТЧЕТ','1')) = '1' then
      return 'Введите название программы!!!!';
   end if; 
         
  
    insert into REPORTS (REP_NAME, SUB,USER_) values (i_NAME, i_SUB,upper(i_DEVELOPER) );
   
   --Заполняем параметры по умолчанию болванка параметров из отчета Шаблона
         
    insert into REPORTS_PARAMS value
      (oid_rep_id, PARAM, value, type, default_value, subparam, user_)
      (select rep_serv.reports_seq.currval,
              a.PARAM,
              a.default_value,
              a.type,
              null,
              a.subparam,
              upper(i_DEVELOPER)
         from (select rp.PARAM, rp.default_value, rp.type, null, rp.subparam
                 from Reports_Params rp
                where rp.oid_rep_id = '1'
                  and rp.param != 'PROGRAM_'
                  and rp.subparam != 'PROGRAM_' -- отчет Шаблон
                  and rp.state = 'A'
               connect by prior rp.param = rp.subparam
                      and rp.oid_rep_id = '1'
                       and rp.state = 'A'
                start with rp.param = 'ADMIN'
                       and rp.oid_rep_id = '1'
                        and rp.state = 'A'
                order by rp.parms_id) a);
   
   select rep_serv.reports_seq.currval into next_seq from dual;
   v_res := SET_REPORT_PARAM(next_seq,
                             'DEVELOPER',
                             upper(i_DEVELOPER),
                             'ADMIN',
                             'VARCHAR2',
                             null,
                             upper(i_DEVELOPER) 
                             );

                             
   select rep_serv.reports_seq.currval into currv_seq from dual   ;  
                        
   --Добавляем первую страниц отчета   
    v_res := v_res || NEW_PROGRAM_PARAM(currv_seq,upper(i_DEVELOPER) );
     if v_res != null then
       return v_res;
     end if; 
     
    IF v_res != null THEN
     rollback;
     return v_res;
    END IF;    
    commit;
    return v_res;--rep_serv.reports_seq.currval;
  EXCEPTION
    WHEN OTHERS THEN
      rollback;
      return 'Ошибка создания новой программы' || SQLERRM;
  END; 
  
  --  функция insert параметров новой страницы отчета
  --  %param  i_REP_ID        -- Имя отчета
  --   %return null  или ошибку.             
  FUNCTION NEW_PAGE_PARAM(i_REP_ID  in reports.rep_id%type, i_user_ in reports_params.user_%type )
    return varchar2 IS
    
    v_max_page integer; 
    
  BEGIN
  if i_REP_ID in('0','1') then
    return 'В корневой шаблон отчет запрещено добовлять страницы!!!';
   end if;
 --ищим максимальную страницу отчета 
 begin
  select nvl(max(nvl(REGEXP_REPLACE(rp.PARAM, '[^0-9]'), 0)),0) into v_max_page
   from Reports_Params rp
  where rp.oid_rep_id = i_REP_ID
    and rp.param like 'PAGE_%'
    and rp.subparam = 'TEMPLATE' 
    and rp.state = 'A';
  EXCEPTION
      WHEN no_data_found THEN
        v_max_page := 0;
      END;
     
    insert into REPORTS_PARAMS value
      (oid_rep_id, PARAM, value, type, default_value, subparam,user_ )
      (select i_REP_ID,
           case
             when rp.PARAM = 'PAGE_' then
              rp.PARAM || to_char(v_max_page + 1)
             else rp.PARAM end,
            case
             when rp.param like 'PAGE_%' then
                to_char(v_max_page + 1)
             else rp.default_value end,
           rp.type,
           null,
           case
             when rp.subparam = 'PAGE_' then
              rp.subparam || to_char(v_max_page + 1)
             else rp.subparam end,
           i_user_ 
            from Reports_Params rp
           where rp.oid_rep_id = '0'
             and rp.state = 'A'
             and rp.param = 'PAGE_'
              or rp.subparam = 'PAGE_' 
          connect by prior rp.param = rp.subparam
                 and rp.oid_rep_id = '0' -- отчет Шаблон
                 and rp.state = 'A'
           start with rp.param = 'ADMIN'
                  and rp.oid_rep_id = '0'
                  and rp.state = 'A');
        
    commit;
    return null;
  EXCEPTION
    WHEN OTHERS THEN
      rollback;
      return 'Ошибка добовления параметров новой страницы отчета' || SQLERRM;
  END;
  
   --  функция insert параметров новой программы 
   --  %param  i_REP_ID        -- Имя отчета
  --   %return null  или ошибку.             
  FUNCTION NEW_PROGRAM_PARAM(i_REP_ID  in reports.rep_id%type, i_user_ in reports_params.user_%type )
    return varchar2 IS
    
    v_max_page integer; 
    
  BEGIN
  if i_REP_ID in ('0','1')  then
    return 'В корневой шаблон отчет запрещено добовлять программы!!!';
   end if;
 --ищим максимальную страницу отчета 
 begin
 select nvl(max(nvl(REGEXP_REPLACE(rp.PARAM, '[^0-9]'), 0)),0) into v_max_page
   from Reports_Params rp
  where rp.oid_rep_id = i_REP_ID
    and rp.param like 'PROGRAM_%'
    and rp.subparam = 'PROGRAM_BLOCK' 
    and rp.state = 'A';
  EXCEPTION
      WHEN no_data_found THEN
        v_max_page := 0;
      END;
     
    insert into REPORTS_PARAMS value
      (oid_rep_id, PARAM, value, type, default_value, subparam,user_ )
      (select i_REP_ID,
           case
             when rp.PARAM = 'PROGRAM_' then
              rp.PARAM || to_char(v_max_page + 1)
             else rp.PARAM end,
            case
             when rp.param like 'PROGRAM_%' then
                to_char(v_max_page + 1)
             else rp.default_value end,
           rp.type,
           null,
           case
             when rp.subparam = 'PROGRAM_' then
              rp.subparam || to_char(v_max_page + 1)
             else rp.subparam end,
           i_user_ 
            from Reports_Params rp
           where rp.oid_rep_id = '1'
             and rp.state = 'A'
             and rp.param = 'PROGRAM_'
             or rp.subparam = 'PROGRAM_'

              
          connect by prior rp.param = rp.subparam
                 and rp.oid_rep_id = '1' -- программа Шаблон
                 and rp.state = 'A'
           start with rp.param = 'ADMIN'
                  and rp.oid_rep_id = '1'
                  and rp.state = 'A');
        
    commit;
    return null;
  EXCEPTION
    WHEN OTHERS THEN
      rollback;
      return 'Ошибка добовленияпараметров новой программы' || SQLERRM;
  END;
  --  функция имя отчета по id
  --  %param  rep_id -- id отчета             
  FUNCTION GET_REPORT_NAME(i_REP_ID in reports.rep_id%type) return varchar2 IS
    v_rep_name reports.rep_name%type;
  BEGIN
  
    select rp.rep_name
      into v_rep_name
      from rep_serv.reports rp
     where rp.rep_id = i_REP_ID
       and rp.state in ('A','I');
  

    return v_rep_name;
  EXCEPTION
    WHEN OTHERS THEN
      return 'Ошибка получения имени отчета ' || SQLERRM;
  END;

  --  функция set  параметра
  --  %param  rep_id -- id отчета 
  --  %param  i_PARAM    -- Имя параметра
  --  %param  i_VALUE    -- значение параметра
  --  %param  i_TYPE     -- тип
  --  %param  i_subparam -- Корневой параметр для связи параметров
  --   %return значение параметра отчета или ошибку.   
  FUNCTION  SET_REPORT_PARAM(i_REP_ID   in reports.rep_id%type,
                             i_PARAM    in reports_params.param%type,
                             i_VALUE    in reports_params.value%type,
                             i_SUBPARAM in reports_params.subparam%type default null,
                             i_TYPE     in reports_params.type%type default 'VARCHAR2',
                             i_default_value in reports_params.default_value%type default null,
                             i_user in reports_params.user_%type default user 
                             ) return varchar2 IS
                             
   v_parms_id reports_params.parms_id%type;
  BEGIN
  
    BEGIN
      select rp.parms_id
        into v_parms_id
        from REPORTS_PARAMS RP
       where upper(RP.PARAM) = Upper(i_PARAM)
         and nvl(RP.Subparam, '0') = nvl(Upper(i_SUBPARAM), '0')
         and rp.oid_rep_id = i_REP_ID
         and rp.state = 'A';
    EXCEPTION
      WHEN no_data_found THEN
        insert into REPORTS_PARAMS
          (oid_rep_id, param, value, type, subparam,default_value, user_)
        values
          (i_rep_id,
           upper(i_PARAM),
           replace(i_VALUE, chr(10), ''),
           upper(i_TYPE),
           upper(i_subparam),
           i_default_value,
           upper(i_user));
        COMMIT;      
      return null;
       
    END;
     
   
   update REPORTS_PARAMS rp set
           rp.param = upper(i_PARAM),
           rp.value = i_VALUE,  
           rp.subparam = upper(i_SUBPARAM),
           rp.type = i_TYPE,
           rp.default_value = i_default_value,
           rp.user_ = upper(i_user)
    where rp.parms_id = v_parms_id
       and   rp.oid_rep_id = i_REP_ID;

  
   COMMIT; 
   return null;
   EXCEPTION
      WHEN others THEN
      rollback;
      return 'Ошибка записи параметра ' || SQLERRM;
      
  END;

  --  функция get параметра
  --  %param  rep_id -- id отчета 
  --  %param  i_PARAM    -- Имя параметра
  --  %param  i_SUBPARAM -- Имя суб параметра
  --  %param  i_STATE -- состояние параметра 
  --  %return значение параметра отчета или ошибку.            
  FUNCTION GET_REPORT_PARAM(i_REP_ID   in reports.rep_id%type,
                            i_PARAM    in reports_params.param%type,
                            i_SUBPARAM in reports_params.subparam%type default null,
                            i_STATE    IN reports_params.state%type default 'A')
    return varchar2 IS
    v_value reports_params.value%type;
  BEGIN
  
    if nvl(i_SUBPARAM, '0') = '0' then
      select rp.value
        into v_value
        from REPORTS_PARAMS RP
       where rp.oid_rep_id = i_rep_id
         and upper(RP.PARAM) = Upper(i_PARAM)
         and rp.state = i_STATE ;
    
    else
      select rp.value
        into v_value
        from REPORTS_PARAMS RP
       where rp.oid_rep_id = i_rep_id
         and upper(RP.PARAM) = Upper(i_PARAM)
         and upper(RP.SUBPARAM) = Upper(i_SUBPARAM)
         and rp.state = i_STATE ;
    end if;
  
    return v_value;
  EXCEPTION
    WHEN OTHERS THEN
      return null;--'Ошибка получения параметра ' || SQLERRM;
  END;
  
  --  функция get рекорда параметра
  --  %param  rep_id -- id отчета 
  --  %param  i_PARAM    -- Имя параметра
  --  %param  i_SUBPARAM -- Имя суб параметра
  --  %param  i_STATE -- состояние параметра 
  --  %return значение параметра отчета или ошибку.            
  FUNCTION GET_REPORT_PARAM_REC(i_REP_ID   in reports.rep_id%type,
                            i_PARAM    in reports_params.param%type,
                            i_SUBPARAM in reports_params.subparam%type default null,
                            i_STATE    IN reports_params.state%type default 'A')
    return reports_params%rowtype IS
    v_PARAM_REC reports_params%rowtype;
  BEGIN
  
    if nvl(i_SUBPARAM, '0') = '0' then
      select rp.*
        into v_PARAM_REC
        from REPORTS_PARAMS RP
       where rp.oid_rep_id = i_rep_id
         and upper(RP.PARAM) = Upper(i_PARAM)
         and rp.state = i_STATE ;
    
    else
      select rp.*
        into v_PARAM_REC
        from REPORTS_PARAMS RP
       where rp.oid_rep_id = i_rep_id
         and upper(RP.PARAM) = Upper(i_PARAM)
         and upper(RP.SUBPARAM) = Upper(i_SUBPARAM)
         and rp.state = i_STATE ;
    end if;
  
    return v_PARAM_REC;
  EXCEPTION
    WHEN OTHERS THEN
      return null;--'Ошибка получения параметра ' || SQLERRM;
  END;

  --  функция  set нового шаблона отчета
  --  %param  rep_id -- id отчета 
  --  %param  i_rep_blob --блоб с шаблоном
  --  %param  i_file_dtm -- дата файла шаблона
  --  %param  i_file_name --полный путь и имя загрузки шаблона

  FUNCTION SET_REPORT_TEMPLATE(i_REP_ID    in reports.rep_id%type,
                                i_rep_blob  in out reports_TEMPLATE.Rep_Blob%type,
                                i_file_dtm  in reports_TEMPLATE.file_dtm%type,
                                i_file_name in reports_TEMPLATE.file_name%type,
                                i_size_     in reports_TEMPLATE.Size_%type,
                                i_File_Term    in reports_TEMPLATE.File_Term%type,
                                i_User_   in reports_TEMPLATE.User_%type
                                )  return varchar2 IS
  BEGIN
  
   -- Test statements here
insert into REPORTS_TEMPLATE
  (OID_REP_ID,
   REP_BLOB,
   FILE_NAME,
   SIZE_,
   FILE_DTM,
   FILE_TERM,
   USER_)
values
  (i_REP_ID,
   empty_blob(),
   i_file_name,
   i_size_,
   i_file_dtm,
   i_File_Term,
   upper(i_User_))
returning rep_blob into i_rep_blob ;

   -- commit;
    
  return null;
  
  EXCEPTION
    WHEN OTHERS THEN
      return 'Ошибка добавления шаблона ' || SQLERRM;
  
  END;

  --  процедура get  шаблона отчета
  --  %param  rep_id -- id отчета 
  --  %return блоб шаблона.            
  FUNCTION GET_REPORT_TEMPLATE(i_REP_ID in reports.rep_id%type) return blob IS
    v_repblob REPORTS_TEMPLATE.Rep_Blob%type;
  BEGIN
  
    select t.rep_blob
      into v_repblob
      from rep_serv.REPORTS_TEMPLATE t
     where t.oid_rep_id = i_REP_ID
       and T.REP_DATE = (select MAX(T1.REP_DATE)
                           from rep_serv.REPORTS_TEMPLATE t1
                          where t1.oid_rep_id = T.oid_rep_id);
  
    return v_repblob;
  
  END;

  --  функция получения названия файла
  --  i_pc_oper_id -- id операциии
  --  i_num_file_name  -- порядковый номер файла из параметров
  --        усли 'ZIP' название файла zip
  --  %RETURN названия файла
  
  FUNCTION GET_FILE_NAME (i_pc_oper_id in rep_serv.pc_oper.id%type,
                          i_num_file_name in varchar2 default '1') return varchar2 IS
   v_filename Reports_Params.Value %type; 
   
  BEGIN
    
  IF i_num_file_name not like '%ZIP%' then
    
   v_filename := rep_serv.ptools.Split(REPORTS_WORK.GET_REPORT_PARAM(rep_serv.PC_OPER_WORK.GET_PC_OPER_PARAMS(i_pc_oper_id,
                                                        'REP_ID'), 'NAME_FILE_DATA','REPORT_PARAM'),';',to_number(trim(i_num_file_name)));
  ELSE
    
    v_filename := REPORTS_WORK.GET_REPORT_PARAM(rep_serv.PC_OPER_WORK.GET_PC_OPER_PARAMS(i_pc_oper_id,
                                                        'REP_ID'), 'ZIP_NAME_FILE_DATA','ZIP');
  END IF;
 
 /*   select rep_serv.ptools.Split(t.value,';',to_number(trim(i_num_file_name))) into v_filename
      from Reports_Params t
     where t.oid_rep_id = rep_serv.PC_OPER_WORK.GET_PC_OPER_PARAMS(i_pc_oper_id,
                                                        'REP_ID')--REPORTS_WORK.c_REP_ID
       and t.param = 'NAME_FILE_DATA'
       and t.state = 'A'
       ;*/
       
      
    --Заменяем маски в названии файла 
    
    --нужна дру=гая маска пишем сюда метод ее обработки   
    IF v_filename like '%[REP_NAME]%' then
       v_filename :=  replace(v_filename, '[REP_NAME]', GET_REPORT_NAME(REPORTS_WORK.c_REP_ID) );   
    END if;   
   
    IF v_filename like '%[REP_ID]%' then
       v_filename :=  replace(v_filename, '[REP_ID]', REPORTS_WORK.c_REP_ID );   
    END if; 
    
    IF v_filename like '%[DATE=DDD]%' then
       v_filename :=  replace(v_filename,'[DATE=DDD]',to_char(reports_work.G_SYSDATE, 'ddd'));
    END if; 
    
    
    IF v_filename like '%[DATE%' and v_filename not like '%[DATE=DDD]%' then
       v_filename :=  replace(v_filename, PTOOLS.READ_PARAM(v_filename , 'DATE')||']', to_char(sysdate,PTOOLS.READ_PARAM(v_filename , 'DATE')));   
       v_filename :=  replace(v_filename,'[DATE=','');
    END if; 
    
    IF v_filename like '%[PC_OPER_ID]%' then
       v_filename :=  replace(v_filename, '[PC_OPER_ID]', i_pc_oper_id );   
    END if; 
    
    IF v_filename like '%[BRANCH]%' then
       v_filename :=  replace(v_filename, '[BRANCH]', '1' );   
    END if;
    
  --  v_filename := v_filename ||'_'|| ; 
    
    -- replace [REP_NAME]_ [REP_ID]_[DATE].XLSX
    
  return v_filename;
  END;
   
  --  процедура  set результата выполнения процедуры формирования отчета в XML
  --  %param  i_oper_id  --id операци
  --  %param  i_REP_XM -- XML отчеты
  --  %param i_file_name 
  
  PROCEDURE SET_REPORT_TO_XML(i_oper_id in rep_serv.pc_oper.id%type ,
    i_REP_XML in reports_result_XML.Xml_Data%type,
    i_file_name in reports_result.file_name%type default null
    ) IS
    v_file_name reports_result.file_name%type;
  BEGIN
  
    v_file_name := REPORTS_WORK.GET_FILE_NAME(rep_serv.PC_OPER_WORK.GET_PC_OPER_PARAMS(i_oper_id,
                                                        'REP_ID'));
                                                        

    INSERT INTO REPORTS_RESULT_XML
      (GID, OID_REP_ID, OID_PC_OPER, Xml_Data, FILE_NAME, USER_)
    VALUES
      (REPORTS_WORK.c_GID,
       REPORTS_WORK.c_REP_ID,
       i_oper_id,
       i_REP_XML,
        nvl(i_file_name, v_file_name),
       REPORTS_WORK.c_USER_);
   
   COMMIT;
                               
 EXCEPTION
   WHEN OTHERS THEN
     rep_serv.pc_oper_work.set_OPER_LOG (i_oper_id,'Ошибка записи в XML' || SQLERRM, 'SET_REPORT_TO_XML');
    

  END;
  
   --  функция пишет открытый курсор в XML
  --  %param  i_PC_ORER_ID -- id операции
  --  %param  i_cursor    --  открытый курсор
  --  %param  i_file_neme -- Имя файла
  --  %return значение параметра отчета или ошибку.   
  
procedure set_REFCURSOR_TO_XML (i_oper_id IN PC_OPER.ID%TYPE,
                          i_cursor IN SYS_REFCURSOR ,
                          i_file_neme IN rep_serv.REPORTS.REP_NAME%TYPE DEFAULT NULL) is 

BEGIN

   rep_serv.reports_work.SET_REPORT_TO_XML(i_oper_id,
                                          XMLTYPE(i_cursor),
                                          i_file_neme);
 EXCEPTION
   WHEN OTHERS THEN
     rep_serv.pc_oper_work.set_OPER_LOG (i_oper_id,'Ошибка записи курсора в XML' || SQLERRM, 'set_REFCURSOR_to_xml');
                                               
END;
 
  --  процедура  set результата выполнения процедуры формирования отчета
  --  %param  i_oper_id  --id операци
  --  %param  i_rep_blob -- блоб с отчетом
  --  %param i_file_name 
  
  PROCEDURE SET_REPORT_RESULT(i_oper_id in rep_serv.pc_oper.id%type ,
    i_REP_BLOB in reports_result.rep_blob%type,
    i_file_name in reports_result.file_name%type default null
    ) IS
    v_file_name reports_result.file_name%type;
    v_rep_id  reports.rep_id%type;
  BEGIN
  if i_file_name is null then
    v_file_name := REPORTS_WORK.GET_FILE_NAME(REPORTS_WORK.c_ID_PC_OPER);
  else
    v_file_name :=i_file_name;
  end if;
    
    --10.08.2017 ДОРАБОТКА ПОЛУЧЕНИЕ ID ОТЧЕТА ИЗ ПАРАМЕТРОВ ЗАКАЗА 
    v_rep_id := PC_OPER_WORK.GET_PC_OPER_PARAMS (i_oper_id,'REP_ID');
    
    INSERT INTO REPORTS_RESULT
      (GID, OID_REP_ID, OID_PC_OPER, REP_BLOB, FILE_NAME, USER_)
    VALUES
      (REPORTS_WORK.c_GID,
       v_rep_id,
      /* REPORTS_WORK.c_REP_ID,*/
       i_oper_id,
      -- REPORTS_WORK.c_ID_PC_OPER,
       i_REP_BLOB,
       v_file_name ,
       REPORTS_WORK.c_USER_);
   
   PC_OPER_WORK.PC_OPER_OK (i_oper_id);
   COMMIT;
   
   if i_file_name is null and REPORTS_WORK.GET_REPORT_PARAM(REPORTS_WORK.c_REP_ID, 'SEND_MAIL','MAIL') = '1' then
      --Отправляем на почту                
      rep_serv.reports_work.send_report(REPORTS_WORK.c_REP_ID,i_REP_BLOB);   
   END IF;
   
      --отгружаем все записи в Mbank
  /* IF REPORTS_WORK.GET_REPORT_PARAM(i_oper_id, 'DATA_TO_DB ','MAIL') = '1' THEN     
      reports_work.INSERT_RES_REP_TO_MBANK ( null,null,TRUE);
   COMMIT;
   
   
   end if;*/
  EXCEPTION
   WHEN OTHERS THEN
     rep_serv.pc_oper_work.set_OPER_LOG (i_oper_id,'Ошибка записи ' || SQLERRM, 'SET_REPORT_RESULT');
      

  END;

  --  функция замены параметров тэгов
  --  i_pc_oper_id -- id операциии
  --  i_param - значение 
  FUNCTION REPLACE_PARAM(i_pc_oper_id in rep_serv.pc_oper.id%type,i_param varchar2) RETURN VARCHAR2 
    is
    v_result  VARCHAR2(500);    
  BEGIN
    v_result := i_param;
       IF v_result like '%[REP_NAME]%' then
        v_result :=  replace(v_result, '[REP_NAME]', GET_REPORT_NAME(REPORTS_WORK.c_REP_ID) );   
    END if;   
   
    IF v_result like '%[REP_ID]%' then
       v_result :=  replace(v_result, '[REP_ID]', REPORTS_WORK.c_REP_ID );   
    END if; 
    
    IF v_result like '%[DATE=DDD]%' then
       v_result :=  replace(v_result,'[DATE=DDD]',to_char(reports_work.G_SYSDATE, 'ddd'));
    END if; 
    
    
    IF v_result like '%[DATE%' and v_result not like '%[DATE=DDD]%' then
       v_result :=  replace(v_result, PTOOLS.READ_PARAM(v_result , 'DATE')||']', to_char(sysdate,PTOOLS.READ_PARAM(v_result , 'DATE')));   
       v_result :=  replace(v_result,'[DATE=','');
    END if; 
    
    IF v_result like '%[PC_OPER_ID]%' then
       v_result :=  replace(v_result, '[PC_OPER_ID]', i_pc_oper_id );   
    END if; 
    
    IF v_result like '%[BRANCH]%' then
       v_result :=  replace(v_result, '[BRANCH]', '1' );   
    END if;
    
    return v_result;
    
  END;      

  --  процедура отправки отчета по почте
  --  %param  rep_id -- id отчета 
  --  %param  i_REP_BLOB    -- блоб с отчетом       
  PROCEDURE SEND_REPORT(i_REP_ID   in reports.rep_id%type,
                        i_REP_BLOB in rep_serv.reports_template.rep_blob%type) IS
  
     v_REP_BLOB rep_serv.reports_template.rep_blob%type;

    /* v_SUBJECT        analyser_rncb.universal_mailer.subject%type;
     v_DATA_TEXT      analyser_rncb.universal_mailer.data_text%type;
     v_MAIL_RECIPIENT analyser_rncb.universal_mailer.recipients%type;
     v_MAIL_SENDER    analyser_rncb.universal_mailer.mail_from%type;
     v_NAME_FILE_DATA analyser_rncb.universal_mailer.NAME_FILE_DATA%type default null;*/
     
   BEGIN
   null;
  /*   IF REPORTS_WORK.GET_REPORT_PARAM(REPORTS_WORK.c_REP_ID, 'SEND_DATA','MAIL') = '1' then              
       v_REP_BLOB :=i_REP_BLOB;
     END IF;  
 
     v_SUBJECT   := REPLACE_PARAM(i_REP_ID, REPORTS_WORK.GET_REPORT_PARAM(i_REP_ID, 'MAIL_SUBJECT')) ;
     v_DATA_TEXT := REPLACE_PARAM(i_REP_ID, REPORTS_WORK.GET_REPORT_PARAM(i_REP_ID, 'MAIL_TEXT')) ; 
     v_MAIL_RECIPIENT := REPLACE_PARAM(i_REP_ID,REPORTS_WORK.GET_REPORT_PARAM(i_REP_ID, 'RECIPIENTS'));
     v_MAIL_SENDER := 'WAY4@RNCB.RU';
     v_NAME_FILE_DATA := REPLACE_PARAM(i_REP_ID,REPORTS_WORK.GET_REPORT_PARAM(i_REP_ID, 'NAME_FILE_DATA'));


     rep_serv.SEND_MAIL( v_SUBJECT,
                     v_DATA_TEXT,
                     v_MAIL_RECIPIENT,
                     v_MAIL_SENDER,
                     v_REP_BLOB,
                     v_NAME_FILE_DATA);

    commit;*/
  
  END;


/*  --  функция создания отчета по шаблону и SQL запросам
  --  %param  rep_id -- id отчета     
  FUNCTION GENERATE_REPORT(i_pc_oper_id  in rep_serv.pc_oper.id%type) return varchar2 IS
  
   v_REP_BLOB blob;
   v_REP_ID  rep_serv.reports.rep_id%type;
  BEGIN

  
  -- v_REP_ID := PC_OPER_WORK.GET_PC_OPER_PARAMS(i_pc_oper_id ,'REP_ID');

  -- PC_OPER_INIT_REP( i_pc_oper_id);

  -- v_REP_BLOB := Get_Exel_rep (c_REP_ID, i_pc_oper_id );
  
  
   --Отправляем на почту    
   if REPORTS_WORK.GET_REPORT_PARAM(c_REP_ID, 'SEND_MAIL','MAIL') = '1' then              
      rep_serv.reports_work.send_report(c_REP_ID,v_REP_BLOB);   
   END IF;
  
    REPORTS_WORK.SET_REPORT_RESULT(i_pc_oper_id,v_REP_BLOB);
    
   RETURN  null;
 EXCEPTION
   WHEN OTHERS THEN
     return 'Ошибка вызова генерации отчета' || SQLERRM;  
   
   END;*/
   

 
 --  функция заказа отчета на выполнение четез PC_OPER
 --  %param  rep_id -- id отчета     
 --  %param i_user  -- пользователь)
 --  %RETURN null все ок
 FUNCTION ORDER_REPORT(i_REP_ID in reports.rep_id%type,
                       i_user   in pc_oper.owner_modify%type default null)
   return varchar2 
   IS
 
   v_PC_OPER       pc_oper%ROWTYPE;
   v_PC_OPER_PARAM rep_serv.PC_OPER_PARAMS%ROWTYPE;
 BEGIN
 
   PC_OPER_WORK.PC_OPER_INSERT(GET_REPORT_NAME(i_REP_ID),
                               'CREATE_REPORT',
                               i_user);
 
  
   rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('REP_ID', i_REP_ID);
 
   --Заполняем параметрами для формы из параметров отчета  
 /* FOR cur_SQL_PARAM IN (select t.param, t.value, t.subparam
                           from Reports_Params t
                          where t.oid_rep_id = i_REP_ID
                            and t.subparam like '%PARAM'
                            and t.state = 'A') LOOP
   
     rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT(cur_SQL_PARAM.param,
                                             trim(cur_SQL_PARAM.value),
                                             cur_SQL_PARAM.Subparam);
   END LOOP;
   COMMIT;*/
 
   RETURN rep_serv.PC_OPER_WORK.c_ID;--null;
-- EXCEPTION
 --  WHEN OTHERS THEN
    -- return 'Ошибка вызова построения отчета' || SQLERRM;
   
 END;

 --  функция заказа отчета на выполнение четез PC_OPER за период
 --  %param  rep_id -- id отчета     
 --  %param i_user  -- пользователь)
 --  %param i_DATE_START  -- период формирования отчета
 --  %param i_DATE_FINISH 
 --  %RETURN null все ок
 /*FUNCTION  ORDER_REPORT_BY_PERIOD(i_REP_ID in reports.rep_id%type,
                       i_user   in pc_oper.owner_modify%type default null,
                       i_DATE_START in date,
                       i_DATE_FINISH in date
                       )
  return varchar2 
 IS
 
   v_PC_OPER       pc_oper%ROWTYPE;
   v_PC_OPER_PARAM rep_serv.PC_OPER_PARAMS%ROWTYPE;
 BEGIN
 
   PC_OPER_WORK.PC_OPER_INSERT(GET_REPORT_NAME(i_REP_ID),
                               'CREATE_REPORT',
                               upper(i_user));
 
  
   rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('REP_ID', i_REP_ID);
 
   --Заполняем параметрами для формы из параметров отчета  
   FOR cur_SQL_PARAM IN (select t.param, t.value, t.subparam
                           from Reports_Params t
                          where t.oid_rep_id = i_REP_ID
                            and t.subparam like '%PARAM'
                            and t.state = 'A') LOOP
   
     rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT(cur_SQL_PARAM.param,
                                             trim(cur_SQL_PARAM.value),
                                             cur_SQL_PARAM.Subparam);
   END LOOP;


   --Сетим нужные параметры
   PC_OPER_WORK.PC_OPER_PARAMS_INSERT ('DATE_START',to_char(i_DATE_START,'dd.mm.yyyy'),'SQL_PARAM',null,null,'DATE'); 
   PC_OPER_WORK.PC_OPER_PARAMS_INSERT ('DATE_FINISH',to_char(i_DATE_FINISH,'dd.mm.yyyy'),'SQL_PARAM',null,null,'DATE'); 
   PC_OPER_WORK.PC_OPER_PARAMS_INSERT ('USER',i_USER ,'PC_OPER_PARAM'); 

   --Переводим статус ENTRY в готово для обработки роботом
   PC_OPER_WORK.PC_OPER_STATUS (PC_OPER_WORK.c_ID, PC_OPER_WORK.c_ST_ENTRY);
   COMMIT;
 
 /*  RETURN null;
 EXCEPTION
   WHEN OTHERS THEN
     return 'Ошибка вызова построения отчета' || SQLERRM;
  */ 
 --END;*/
 
 
 --  Функция обработки генерации отчетов из PC_OPERATION
--  %RETURN NULL или Ошибка
--*/  
/*PROCEDURE OPER_GENERATE_RERORT_START --RETURN VARCHAR2
IS
  ERRMSG  varchar2(4000);--bwx.DTYPE.NAME%TYPE;
  PC_OPER_ID number;

  v_metod_name varchar2(92);
BEGIN
  null;
 FOR PC_OPER IN  ( SELECT pc.*
                   FROM rep_serv.PC_OPER pc
                   WHERE  pc.op_status in ('ENTRY','ERR') 
                     AND pc.op_code = 'CREATE_REPORT') LOOP
    
     
     --Инициируем глобальные переменные отчета
     PC_OPER_INIT_REP( PC_OPER.ID);
     
     PC_OPER_ID :=  PC_OPER.ID;
                  
     SELECT  t.scheme ||'.'||t.package||'.'||t.method
       INTO v_metod_name
     FROM PC_OPER_RPOGRAM t 
     WHERE STATE = 'A' 
        AND OP_CODE = PC_OPER.op_code;
   
   
   --Стартуем генерацию отчета
   rep_serv.PC_OPER_WORK.PC_OPER_START (PC_OPER.ID);  
   COMMIT;
  
  ERRMSG := GENERATE_REPORT(PC_OPER.ID);
   
 /*   EXECUTE IMMEDIATE  'BEGIN  :st :=' || v_metod_name||'(:1);  END;'
      USING  OUT ERRMSG , PC_OPER.ID;*/
                     

 /* IF  ERRMSG IS NULL THEN
    PC_OPER_WORK.PC_OPER_OK (PC_OPER.ID);
    COMMIT;
  ELSE
    PC_OPER_WORK.PC_OPER_ERR (PC_OPER.ID, ERRMSG) ;
     COMMIT;
  END IF;
  
 END LOOP;*
  
 -- return  ERRMSG;
  
EXCEPTION               
  WHEN OTHERS  THEN  
    ROLLBACK;
    
    ERRMSG := substr( ' REPORTS_WORK.OPER_GENERATE_RERORT_START ERROR:'||'ORA-'||abs(SQLCODE)||' '||substr(SQLERRM,1,200),1,255);
    rep_serv.pc_oper_work.PC_OPER_ERR(PC_OPER_ID, ERRMSG);

  --  PC_OPER_WORK.PC_OPER_ERR (PC_OPER_ID, ERRMSG) ;
 --   bwx.stnd.process_message(bwx.stnd.Error, ERRMSG );
  --  rep_serv.SEND_MAIL ('ОШИБКА! CHANGE_SERV_PACK.CHANGE_SERV_PACK',ERRMSG, c_MAIL_RECIPIENT ,c_MAIL_SENDER);

  --  bwx.stnd.FINISH_SESSION;  
  
   -- RETURN ERRMSG;
END;
 */

  --  функция заменяет параметря вызова на переменку из PC_oper
  --  Переменяется для замены параметров ":name" в SQL
  --  %param  i_PC_ORER_ID -- id операции
  --  %param  i_PARAM    -- Имя параметра
  --  %param  i_SUBPARAM -- Имя суб параметра
  --  %return значение параметра отчета или ошибку.            
  FUNCTION REPLACE_PARAM_BY_PC_OPER_ID(i_PC_ORER_ID   in pc_oper.id%type,
                                       i_PARAM        in reports_params.value%type,
                                       i_SUBPARAM     in reports_params.subparam%type
                            )
    return varchar2 IS
    v_PARAM  varchar2(4000);/*reports_params.value%type;*/
  BEGIN
  v_PARAM := i_PARAM ;
 
 for cur_pc_raram in ( select 
                          rp.param,
                          case 
                               when upper(rp.type) = 'DATE' then 'to_date('''||RP.value  ||''',''dd.mm.yyyy'')'
                               when UPPER(rp.type) = 'VARCHAR2' then ''''||RP.value||''''
                          else   RP.value end   as value
                     from rep_serv.pc_oper_params RP 
                     where rp.oid_pc_oper = i_PC_ORER_ID  
                       and upper(RP.Subparam) =  upper(i_SUBPARAM)
                       and rp.dir = 'A') loop
 
     v_PARAM   := replace (v_PARAM, ':'||cur_pc_raram.param,cur_pc_raram.value);
 
  end loop;


    return v_PARAM  ;
  EXCEPTION
    WHEN OTHERS THEN
      return 'Ошибка получения параметра ' || SQLERRM;
  END;


--  функция получения ID отчета по OP_CODE из параметров
--  %param  i_op_code -код операци
--  %return ID отчета или null
FUNCTION GET_REPID_BY_OP_CODE(i_op_code in pc_oper.op_code%TYPE)
  return REP_SERV.Reports.REP_ID%type is
  v_REP_ID REP_SERV.Reports.REP_ID%type := 1;
begin
  select rp.oid_rep_id into v_REP_ID
    from REPORTS_PARAMS RP
   where rp.param = 'OP_CODE'
     and upper(RP.Value) = Upper(i_op_code)
     and rp.state = 'A';
     
  return v_REP_ID;
EXCEPTION
  WHEN OTHERS THEN
    return null;
end;


-- Экспорт данных по линку
-- %param  i_PC_ORER_ID -- id операции
/*procedure EXPORT_DATA_BY_LINK (i_oper_id   in pc_oper.id%type )  is

v_link rep_serv.reports_params.value%type;
ccSQL varchar2(200);
begin
 
 v_link := rep_serv.REPORTS_WORK.GET_REPORT_PARAM(rep_serv.PC_OPER_WORK.GET_PC_OPER_PARAMS(i_oper_id,'REP_ID'),
                                     'DATA_BY_LINK','XML_DATA') ;

  ccSQL := '';
  
 -- begin  
    insert into PRC_LOADER.REPORTS_RESULT_XML@krim /*||v_link */  /*value(
                         id,
                          gid,
                          oid_rep_id,
                          oid_pc_oper,
                          work_date,
                          xml_data,
                          file_name,
                          user_)*/
          /*       (select  t.id,
                          t.gid,
                          t.oid_rep_id,
                          t.oid_pc_oper,
                          t.work_date,
                          t.xml_data,
                          t.file_name,
                          t.user_
                    from REPORTS_RESULT_XML t
                   where t.oid_pc_oper =  i_oper_id) ; --end;
 -- execute immediate ccSQL ;

  begin
    dbms_session.close_database_link('MBANK.WORLD');
  exception
    when others then null;
  end;
 
/* EXCEPTION
   WHEN OTHERS THEN
     rep_serv.pc_oper_work.set_OPER_LOG (i_oper_id,'Ошибка записи в XML' || SQLERRM, 'SET_REPORT_TO_XML');
     
  
end;  */  


-- Авто генерация отчета по достижении рнастроенного перииода и времени
procedure AUTO_SHEDULER is

  v_res         varchar2(4000);
  v_param_value varchar2(4000);
begin
null;
  -- Ходим по всем отчетам смотрим статус авто генерации
 /* for cur_auto_shed in (select REPORTS_WORK.GET_REPORT_PARAM(r.rep_id,'AUTO_SHEDULER','ADMIN') as AUTO_SHEDULER,
                               REPORTS_WORK.GET_REPORT_PARAM(r.rep_id,'SHED_NAME','SHEDULER_PARAM') as SHED_NAME,
                               REPORTS_WORK.GET_REPORT_PARAM(r.rep_id, 'WORK_TIME', 'SHEDULER_PARAM') as WORK_TIME,
                               REPORTS_WORK.GET_REPORT_PARAM(r.rep_id, 'WORK_PERIOD','SHEDULER_PARAM') as WORK_PERIOD,
                               REPORTS_WORK.GET_REPORT_PARAM(r.rep_id,'WORK_PARAM', 'SHEDULER_PARAM') as WORK_PARAM,
                               r.*
                          from rep_serv.reports r
                         where REPORTS_WORK.GET_REPORT_PARAM(r.rep_id,
                                                             'AUTO_SHEDULER',
                                                             'ADMIN') = '1') loop
  
    --Проверяем не поставлен ли уже отчет в очередь на сегодня
    BEGIN
      EXECUTE IMMEDIATE 'select to_char(o.work_date, ''dd.mm.yyyy'') 
                             from rep_serv.pc_oper o, rep_serv.pc_oper_params op
                          where o.id = op.oid_pc_oper
                          and param = ''REP_ID''
                          and value = ' ||
                        cur_auto_shed.rep_id || '
                          and trunc(o.work_date) = trunc(sysdate)'
        INTO v_res;
    
    EXCEPTION
      WHEN OTHERS THEN
        v_res := null;
    END;
    --Если не поставлен ставим в очередь 
    if v_res is null then
      -- Отчеты автоформирования каждый день
      if cur_auto_shed.work_period like 'EVERYDAY' then
      
        v_res := ORDER_REPORT(cur_auto_shed.rep_id, cur_auto_shed.SHED_NAME);
        commit;
        FOR cur_SQL_PARAM IN (select t.param, t.value, t.subparam
                                from Reports_Params t
                               where t.oid_rep_id = cur_auto_shed.rep_id
                                 and t.subparam like 'SQL_PARAM'
                                 and t.state = 'A'
                               order by t.parms_id) LOOP
          v_param_value := null;
          EXECUTE IMMEDIATE 'SELECT (' || cur_SQL_PARAM.Value ||
                            ') from dual'
            INTO v_param_value;
        
          rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT(cur_SQL_PARAM.param,
                                                  trim(v_param_value),
                                                  cur_SQL_PARAM.Subparam);
        END LOOP;
      
        PC_OPER_WORK.PC_OPER_STATUS(SEQ_pc_oper.Currval,
                                    PC_OPER_WORK.c_ST_ENTRY);
        -- PC_OPER_WORK.PC_OPER_OK(SEQ_pc_oper.Currval);
        commit;
      end if;
      -- Отчеты автоформирования каждый месяц
      if cur_auto_shed.work_period like 'EVERYMONTH' and
         to_char(sysdate, 'DD') = '01' then
      
        null;
      
      end if;
    
      -- Отчеты автоформирования каждый квартал первого числа.
      IF CUR_AUTO_SHED.WORK_PERIOD LIKE 'EVERYQUARTER' and
         to_char(sysdate, 'DD') = '01' and
         to_char(sysdate, 'MM') in ('01', '04', '07', '10') then
      
        null;
      
      end if;
    
    end if;
  
  end loop;

  commit;*/

end;



end REPORTS_WORK;
/
