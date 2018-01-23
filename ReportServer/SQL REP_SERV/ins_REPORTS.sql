insert into REPORTS (REP_ID, REP_NAME, STATE, SUB, CREATE_DATE, MODIFY_DATE, VERSION, USER_)
values (0, 'Корневой шаблон для создания отчетов', 'A', 0, to_date('29-07-2016 15:48:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-07-2016 15:48:23', 'dd-mm-yyyy hh24:mi:ss'), 0, 'ADMIN');

insert into REPORTS (REP_ID, REP_NAME, STATE, SUB, CREATE_DATE, MODIFY_DATE, VERSION, USER_)
values (42, 'Отчет Фин.Мониторинг "Зачисление-списание на ПК для расшифровки в MBANK" ', 'A', 0, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 0, 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS (REP_ID, REP_NAME, STATE, SUB, CREATE_DATE, MODIFY_DATE, VERSION, USER_)
values (61, 'Отчет Кредитный портфель банка РНКБ физ и пц', 'A', 0, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 0, 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS (REP_ID, REP_NAME, STATE, SUB, CREATE_DATE, MODIFY_DATE, VERSION, USER_)
values (81, 'Отчет Зачисления на счета малого бизнеса ', 'A', 0, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 0, 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS (REP_ID, REP_NAME, STATE, SUB, CREATE_DATE, MODIFY_DATE, VERSION, USER_)
values (82, 'Отчет Дробление валюто обленных операций', 'A', 0, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 0, 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS (REP_ID, REP_NAME, STATE, SUB, CREATE_DATE, MODIFY_DATE, VERSION, USER_)
values (101, 'Отчет Дробление платежей 3 операции', 'I', 82, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 0, 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS (REP_ID, REP_NAME, STATE, SUB, CREATE_DATE, MODIFY_DATE, VERSION, USER_)
values (102, 'Отчет Дробление платежей 3 операции сводный', 'A', 101, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS (REP_ID, REP_NAME, STATE, SUB, CREATE_DATE, MODIFY_DATE, VERSION, USER_)
values (103, 'Отчет Дробление операций выдачи по ПК', 'A', 0, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 0, 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

