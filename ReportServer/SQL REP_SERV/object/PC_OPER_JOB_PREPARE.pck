create or replace package PC_OPER_JOB_PREPARE is

  --   %date   - 02/08/2017
  --   %author - МАРЧЕНКО Д.С.
  --   %usage  - Пакет для Подготовки сложных заданий к выполнению в ORA_JOB
                         
  --  Подготовка задания торент расчета 303 формы через PC_OPER
  --  %param  i_op_code       -- код задачи на выполнение из rep_serv.pc_oper_rpogram 
  --  %param  i_DATE1         -- дата начала периода      
  --  %param  i_DATE2         -- дата конца периода        
  --  %param  i_Div_Code      -- филиалы головной офис для 303 формы
  --  %param  i_Type_Doc_list -- типы договоров
  --  %param  i_REP_ID        -- id отчета
  --  %return - null или ошибка 

  FUNCTION F303_PREPARE_JOB(i_op_code       in pc_oper.op_code%TYPE,
                            i_DATE1         IN VARCHAR2,
                            i_DATE2         IN VARCHAR2,
                            i_Div_Code      IN VARCHAR2,
                            i_Type_Doc_list IN VARCHAR2,
                            i_REP_ID        IN VARCHAR2) RETURN VARCHAR2;
end PC_OPER_JOB_PREPARE;
/
create or replace package body PC_OPER_JOB_PREPARE is
  
  --   %date   - 02/08/2017
  --   %author - МАРЧЕНКО Д.С.
  --   %usage  - Пакет для Подготовки сложных заданий к выполнению в ORA_JOB

 
  --  Подготовка задания торент расчета 303 формы через PC_OPER
  --  %param  i_op_code       -- код задачи на выполнение из rep_serv.pc_oper_rpogram 
  --  %param  i_DATE1         -- дата начала периода      
  --  %param  i_DATE2         -- дата конца периода        
  --  %param  i_Div_Code      -- филиалы головной офис для 303 формы
  --  %param  i_Type_Doc_list -- типы договоров
  --  %param  i_REP_ID        -- id отчета
  --  %return - null или ошибка 

  FUNCTION F303_PREPARE_JOB(i_op_code       in pc_oper.op_code%TYPE,
                            i_DATE1         IN VARCHAR2,
                            i_DATE2         IN VARCHAR2,
                            i_Div_Code      IN VARCHAR2,
                            i_Type_Doc_list IN VARCHAR2,
                            i_REP_ID        IN VARCHAR2) RETURN VARCHAR2 IS
  
    v_program    varchar2(2000) := '';
    v_parent_seq number;
  BEGIN
  
    PC_OPER_WORK.PC_OPER_INSERT(pc_oper_work.GET_PROGRAM_NAME(i_op_code),
                                i_op_code,
                                user);
  
    v_program := 'cota_web.PHP_F303.F303_clear_all;';
    rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('JOBACTION', v_program);
    v_parent_seq := pc_oper_WORK.GET_OPER_PARAMS_SEQ_CURRVAL;
    rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('PRIORITY',
                                                '1',
                                                v_parent_seq);
    rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('STATUS',
                                                'ENTRY',
                                                v_parent_seq);
  
    for cur_div_cod in (SELECT --+ parallel(STR,4)
                         REGEXP_SUBSTR(STR, '[^,]+', 1, LEVEL) STR
                          FROM (SELECT i_Div_Code as STR FROM DUAL)
                         WHERE STR IS NOT NULL
                        CONNECT BY ROWNUM <=
                                   length(i_Div_Code) -
                                   length(replace(i_Div_Code, ',', '')) + 1) loop
    
      v_program := 'cota_web.PHP_F303.Delete_Div_Code_Clients (to_date(''' ||
                   i_DATE2 || ''',''dd.mm.yyyy''), ''' || cur_div_cod.str ||
                   ''');';
    
      rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('JOBACTION', v_program);
      v_parent_seq := pc_oper_WORK.GET_OPER_PARAMS_SEQ_CURRVAL;
      rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('PRIORITY',
                                                  '2',
                                                  v_parent_seq);
      rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('STATUS',
                                                  'ENTRY',
                                                  v_parent_seq);
    
      for cur_type_doc in (SELECT --+ parallel(STR,4)
                            REGEXP_SUBSTR(STR, '[^,]+', 1, LEVEL) STR
                             FROM (SELECT i_Type_Doc_list as STR FROM DUAL)
                            WHERE STR IS NOT NULL
                           CONNECT BY ROWNUM <=
                                      length(i_Type_Doc_list) -
                                      length(replace(i_Type_Doc_list,
                                                     ',',
                                                     '')) + 1) loop
      
        for cur_digit in 0 .. 9 loop
          v_program := 'cota_web.PHP_F303.Process_Div_Code_Type_Doc (to_date(''' ||
                       i_DATE1 || ''',''dd.mm.yyyy''),to_date(''' ||
                       i_DATE2 || ''',''dd.mm.yyyy''), ''' ||
                       cur_div_cod.str || ''',''' || cur_type_doc.STR ||
                       ''',''' || cur_digit || ''');';
        
          rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('JOBACTION',
                                                      v_program);
          v_parent_seq := pc_oper_WORK.GET_OPER_PARAMS_SEQ_CURRVAL;
        
          rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('PRIORITY',
                                                      '3',
                                                      v_parent_seq);
          rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('STATUS',
                                                      'ENTRY',
                                                      v_parent_seq);
        end loop;
      end loop;
      v_program := 'cota_web.PHP_F303.Output_Div_Code (to_date(''' ||
                   i_DATE2 || ''',''dd.mm.yyyy''),''' || cur_div_cod.str ||
                   ''', ''' || i_REP_ID || ''');';
      rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('JOBACTION', v_program);
      v_parent_seq := pc_oper_WORK.GET_OPER_PARAMS_SEQ_CURRVAL;
      rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('PRIORITY',
                                                  '4',
                                                  v_parent_seq);
      rep_serv.PC_OPER_WORK.PC_OPER_PARAMS_INSERT('STATUS',
                                                  'ENTRY',
                                                  v_parent_seq);
      commit;
    
    end loop;
    return null;
  END;

end PC_OPER_JOB_PREPARE;
/
