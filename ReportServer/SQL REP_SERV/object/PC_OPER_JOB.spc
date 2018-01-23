create or replace package PC_OPER_JOB is

  --   %date   - 02/08/2017
  --   %author - МАРЧЕНКО Д.С.
  --   %usage  - Пакет для работы с pc_oper обработка ORA_JOB

  --Параметры статусов
  c_ST_ENTRY     rep_serv.pc_oper_params.value%Type := 'ENTRY'; --готова к обработке ORA_JOB
  c_ST_WORK      rep_serv.pc_oper_params.value%Type := 'WORK'; --обработка ORA_JOB
  c_ST_SUCCEEDED rep_serv.pc_oper_params.value%Type := 'SUCCEEDED'; --обработана ORA_JOB
  c_ST_FAILED    rep_serv.pc_oper_params.value%Type := 'FAILED'; --ошибка обрабтки ORA_JOB

  -- передаем параметры из PHP постедствам данной коллекции
  TYPE ARR_TYPE IS TABLE OF VARCHAR(200) INDEX BY varchar2(100);

  --  функция проверки состояния выполнения заданий 
  --  %param  i_pc_oper_ID - id PC_OPER задания
  --  %param  i_pc_STATUS - статус выполнения задания
  --  %return - колличество обработанных заданий по статусу или ошибка 

  FUNCTION ORA_JOB_STATUS(i_pc_oper_ID in pc_oper.ID%TYPE,
                          i_STATUS     rep_serv.pc_oper_params.value%Type)
    return number;

  --  функция проверки статистики состояния выполнения заданий 
  --  %param  i_pc_oper_ID - id PC_OPER задания
  --  %return - статистика по обработке заданий

  FUNCTION ORA_JOB_STATUS_STAT(i_pc_oper_ID in pc_oper.ID%TYPE)
    return varchar2;

  --  Стартуем выполнение PC_OPER задания  в n-м колличестве роботов JOB
  --  %param  i_pc_oper_ID - id PC_OPER задания
  --  %return - null или ошибка 
  FUNCTION ORA_JOB_CREATE(i_pc_oper_ID in pc_oper.ID%TYPE) return varchar;

  -- Стартуем выполнение праграм из параметров PC_OPER подготовленных в PREPARE пакете
  --  %param  i_pc_oper_ID - id PC_OPER задания
  --  %param  i_thread - колличество одновременно запушенных ORA_JOB шедулееров параметр из rep_serv.pc_oper_rpogram.TREAD
  --  %return - null или ошибка 
  PROCEDURE ORA_JOB_WORK(i_pc_oper_ID in pc_oper.ID%TYPE,
                         i_thread     in number default 1);

  --ПОСТАНОВКА ЗАДАЧИ В ОЧЕТЕДЬ
    --  %param  i_OP_CODE - код задачи 
    --  %param  i_ARR_PARAMS - массив переменных с клиента
    --  %param  i_USER - пользователь
    --  %param  i_REP_ID - ID отчета или программы
    --  %return - null или ошибка 
  FUNCTION CREATE_PC_OPER(i_ARR_PARAMS IN ARR_TYPE, 
                          i_USER pc_oper.owner_modify%type default user ,
                          i_OP_CODE pc_oper.op_code%type,
                          i_REP_ID IN reports.rep_id%type default null
                          ) return varchar2;
end PC_OPER_JOB;
/
