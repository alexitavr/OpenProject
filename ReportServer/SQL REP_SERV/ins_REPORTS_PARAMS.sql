
insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (404, 42, 'ADMIN', null, '-', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (405, 42, 'REPORT_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (406, 42, 'DEVELOPER', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ', 'REPORT_PARAM', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (407, 42, 'DATABASE_CONNECTION', 'REPO', 'REPORT_PARAM', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (408, 42, 'NAME_FILE_DATA', 'W[DATE=DDD]_[BRANCH].all;W[DATE=DDD]_[BRANCH].tot;', 'REPORT_PARAM', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (409, 42, 'ZIP', '1', 'REPORT_PARAM', 'INTEGER', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (410, 42, 'REPORT_PROGRAM', '1', 'REPORT_PARAM', 'INTEGER', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (416, 42, 'AUTO_CREATE', null, 'ADMIN', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (417, 42, 'AUTO_WORK', '0', 'AUTO_CREATE', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (418, 42, 'AUTO_WORK_PARAM', null, 'AUTO_CREATE', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (419, 42, 'MAIL', null, 'ADMIN', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (420, 42, 'SEND_MAIL', '1', 'MAIL', 'INTEGER', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (421, 42, 'SEND_DATA', '1', 'MAIL', 'INTEGER', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (422, 42, 'RECIPIENTS', '@RNCB.RU;@RNCB.RU;', 'MAIL', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (423, 42, 'MAIL_SUBJECT', 'Рассылка отчетности процесингового центра [BANK_NAME]=[BANK_CUT]', 'MAIL', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (424, 42, 'MAIL_TEXT', 'Автоматически сформированный [REP_NAME]', 'MAIL', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (425, 42, 'SQL_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (426, 42, 'DATE_START', 'select to_char(trunc(sysdate) -1,''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (427, 42, 'DATE_FINISH', 'select to_char(trunc(sysdate) ,''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (430, 42, 'TEMPLATE', null, 'ADMIN', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (431, 42, 'PAGE_1', '1', 'TEMPLATE', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (432, 42, 'PROGRAM', 'epec.reports_program.rep_41(?)', 'PAGE_1', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (433, 42, 'SQL_1', 'Select * from dual', 'PAGE_1', 'VARCHAR2', null, to_date('06-10-2016 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (567, 42, 'TEXT_PARAМ', '100000', 'SQL_PARAM', 'VARCHAR2', '100000', to_date('06-10-2016 17:49:00', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (568, 42, 'TEXT_PARAМ', '100000', 'REPORT_PARAM', 'VARCHAR2', '100000', to_date('06-10-2016 17:50:13', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (569, 42, 'REPORT_PROGRAM', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('06-10-2016 18:03:35', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (570, 42, 'PROGRAM', 'declare v_res varchar(4000); begin v_res :=null; :v_res; end;', 'PAGE_1', 'VARCHAR2', null, to_date('06-10-2016 18:31:07', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (571, 42, 'PROGRAM', 'begin ? := epec.reports_program.rep_41(?); end;', 'PAGE_1', 'VARCHAR2', null, to_date('06-10-2016 18:38:20', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (572, 42, 'SEND_MAIL', '0', 'MAIL', 'INTEGER', null, to_date('06-10-2016 20:43:52', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (573, 42, 'SEND_DATA', '0', 'MAIL', 'INTEGER', null, to_date('06-10-2016 20:43:52', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (574, 42, 'ZIP', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('07-10-2016 10:07:27', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (751, 42, 'XML_DATA', '1', 'REPORT_PARAM', 'INTEGER', null, to_date('13-10-2016 16:51:45', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'ROOT');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (757, 42, 'DATA_TO_DB', 'MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('13-10-2016 16:57:57', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (758, 42, 'DATA_BY_LINK', '@KRIM', 'XML_DATA', 'VARCHAR2', null, to_date('13-10-2016 16:57:57', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'ROOT');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (759, 42, 'DATA_BY_LINK', '@MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('14-10-2016 15:41:48', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (760, 42, 'NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].XLSX', 'REPORT_PARAM', 'VARCHAR2', null, to_date('17-10-2016 09:45:14', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (795, 42, 'NAME_FILE_DATA', 'W[DATE=DDD]_[BRANCH].all;W[DATE=DDD]_[BRANCH].tot;W[DATE=DDD]_[BRANCH].zip;', 'REPORT_PARAM', 'VARCHAR2', null, to_date('17-10-2016 10:19:52', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (796, 42, 'ZIP_NAME_FILE_DATA', 'W[DATE=DDD]_[BRANCH].zip', 'ZIP', 'VARCHAR2', ' ', to_date('17-10-2016 10:21:05', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (869, 42, 'AUTO_SHEDULER', '1', 'ADMIN', 'VARCHAR2', null, to_date('17-10-2016 13:10:57', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (870, 42, 'SHEDULER_PARAM', ' ', 'AUTO_SHEDULER', 'VARCHAR2', null, to_date('17-10-2016 13:10:57', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (871, 42, 'SHED_NAME', 'SHEDULER_1', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('17-10-2016 13:10:57', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (872, 42, 'WORK_TIME', '00:00 - 24:00', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('17-10-2016 13:10:57', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (873, 42, 'WORK_PERIOD', 'EVERYDAY', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('17-10-2016 13:10:57', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (874, 42, 'WORK_PARAM', null, 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('17-10-2016 13:10:57', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (875, 42, 'AUTO_SHEDULER', 'Авто генерация отчета по периоду 0-Нет, 1-Да', 'ADMIN', 'VARCHAR2', null, to_date('17-10-2016 13:21:42', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (911, 0, 'ADMIN', 'Админ параметры', '-', 'VARCHAR2', null, to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (912, 0, 'REPORT_PARAM', 'Параметры отчета', 'ADMIN', 'VARCHAR2', null, to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (913, 0, 'DEVELOPER', 'Разработчик отчета', 'REPORT_PARAM', 'VARCHAR2', null, to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (914, 0, 'DATABASE_CONNECTION', 'Соединение с базой для получения данных', 'REPORT_PARAM', 'VARCHAR2', 'REPO', to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (915, 0, 'NAME_FILE_DATA', 'Маска названия файлов отчета, через ";"', 'REPORT_PARAM', 'VARCHAR2', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].XLSX', to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (916, 0, 'ZIP', 'Сжатие отчета (0-не сжимаем, 1-сжимаем)', 'REPORT_PARAM', 'INTEGER', '0', to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (917, 0, 'ZIP_NAME_FILE_DATA', 'Маска названия ZIP файла', 'ZIP', 'VARCHAR2', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].ZIP', to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (918, 0, 'REPORT_PROGRAM', 'Формируем отчет програмно 0-Нет, 1-Да', 'REPORT_PARAM', 'INTEGER', '0', to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (919, 0, 'XML_DATA', 'Сформировать XML документ 0-Нет, 1-Да', 'REPORT_PARAM', 'INTEGER', '1', to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (920, 0, 'DATA_TO_DB', 'Отгружаем данные в другой инстанс базы данных', 'XML_DATA', 'VARCHAR2', 'MBANK', to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (921, 0, 'DATA_BY_LINK', 'Отгружаем данные по линку', 'XML_DATA', 'VARCHAR2', '@MBANK', to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (922, 0, 'AUTO_SHEDULER', 'Авто генерация отчета по периоду 0-Нет, 1-Да', 'ADMIN', 'VARCHAR2', '0', to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (923, 0, 'SHEDULER_PARAM', 'Параметры шедулера', 'AUTO_SHEDULER', 'VARCHAR2', null, to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (924, 0, 'SHED_NAME', 'Имя шедулера', 'SHEDULER_PARAM', 'VARCHAR2', 'SHEDULER_1', to_date('17-10-2016 13:22:15', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (925, 0, 'WORK_TIME', 'Время работы шедулера', 'SHEDULER_PARAM', 'VARCHAR2', '00:00 - 24:00', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (926, 0, 'WORK_PERIOD', 'Время работы шедулера', 'SHEDULER_PARAM', 'VARCHAR2', 'EVERYDAY', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (927, 0, 'WORK_PARAM', 'Параметры работы шедулера', 'SHEDULER_PARAM', 'VARCHAR2', ' ', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (928, 0, 'AUTO_CREATE', 'Параметры автоматического формирования отчетов', 'ADMIN', 'VARCHAR2', null, to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (929, 0, 'AUTO_WORK', 'Формировать отчет автоматически 0-Нет, 1-Да', 'AUTO_CREATE', 'VARCHAR2', '0', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (930, 0, 'AUTO_WORK_PARAM', 'Параметры авто формирования', 'AUTO_CREATE', 'VARCHAR2', null, to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (931, 0, 'MAIL', 'Параметры отправки почты', 'ADMIN', 'VARCHAR2', null, to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (932, 0, 'SEND_MAIL', 'Отпавляем или не отправляем отчет', 'MAIL', 'INTEGER', '0', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (933, 0, 'SEND_DATA', 'Отпавка сформинованного отчет 0-Нет, 1-Да', 'MAIL', 'INTEGER', '0', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (934, 0, 'RECIPIENTS', 'Почта получателей', 'MAIL', 'VARCHAR2', '@RNCB.RU;@RNCB.RU;', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (935, 0, 'MAIL_SUBJECT', 'Тема письма', 'MAIL', 'VARCHAR2', 'Рассылка отчетности процесингового центра [BANK_NAME]=[BANK_CUT]', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (936, 0, 'MAIL_TEXT', 'Текст письма', 'MAIL', 'VARCHAR2', 'Автоматически сформированный [REP_NAME]', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (937, 0, 'SQL_PARAM', 'Параметры переменки SQL запросов', 'ADMIN', 'VARCHAR2', null, to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (938, 0, 'DATE_START', 'Дата с ', 'SQL_PARAM', 'DATE', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (939, 0, 'DATE_FINISH', 'Дата по ', 'SQL_PARAM', 'DATE', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (940, 0, 'TEXT_PARAМ', 'Введите значение', 'SQL_PARAM', 'VARCHAR2', null, to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'I', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (941, 0, 'RARIO_PARAМ', 'Выбирите значение', 'SQL_PARAM', 'SELECT', 'select ''1''  as ''значение 1'' from dual union all select ''2''  as ''значение 2'' from dual', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'I', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (942, 0, 'TEMPLATE', 'Параметры шаблона', 'ADMIN', 'VARCHAR2', null, to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (943, 0, 'PAGE_', 'Страница шаблона', 'TEMPLATE', 'VARCHAR2', '1', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (944, 0, 'PROGRAM', 'Блок предподготовки данных для запроса', 'PAGE_', 'VARCHAR2', null, to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (945, 0, 'SQL_1', 'SQL Запрос для страницы шаблона', 'PAGE_', 'VARCHAR2', 'Select * from dual', to_date('17-10-2016 13:22:16', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (949, 42, 'WORK_PARAM', ' ', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('17-10-2016 13:43:47', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (950, 42, 'WORK_PARAM', '[DATE_START= trunc(SYSDATE)] ;', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('17-10-2016 13:44:26', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (951, 42, 'DATE_FINISH', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('17-10-2016 13:46:53', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (952, 42, 'DATE_START', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('17-10-2016 14:10:07', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (953, 42, 'DATE_FINISH', 'select to_char(trunc(sysdate) - 1,''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('17-10-2016 14:10:07', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (961, 61, 'ADMIN', null, '-', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (962, 61, 'REPORT_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (963, 61, 'DEVELOPER', 'ghgkkjk', 'REPORT_PARAM', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (964, 61, 'DATABASE_CONNECTION', 'KRIMDSS', 'REPORT_PARAM', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (965, 61, 'NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].XLSX', 'REPORT_PARAM', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (966, 61, 'ZIP', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (967, 61, 'ZIP_NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].ZIP', 'ZIP', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (968, 61, 'REPORT_PROGRAM', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (969, 61, 'XML_DATA', '1', 'REPORT_PARAM', 'INTEGER', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (970, 61, 'DATA_TO_DB', 'MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (971, 61, 'DATA_BY_LINK', '@MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (972, 61, 'AUTO_SHEDULER', '0', 'ADMIN', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (973, 61, 'SHEDULER_PARAM', null, 'AUTO_SHEDULER', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (974, 61, 'SHED_NAME', 'SHEDULER_1', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (975, 61, 'WORK_TIME', '00:00 - 24:00', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (976, 61, 'WORK_PERIOD', 'EVERYDAY', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (977, 61, 'WORK_PARAM', ' ', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (978, 61, 'AUTO_CREATE', null, 'ADMIN', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (979, 61, 'AUTO_WORK', '0', 'AUTO_CREATE', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (980, 61, 'AUTO_WORK_PARAM', null, 'AUTO_CREATE', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (981, 61, 'MAIL', null, 'ADMIN', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (982, 61, 'SEND_MAIL', '0', 'MAIL', 'INTEGER', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (983, 61, 'SEND_DATA', '0', 'MAIL', 'INTEGER', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (984, 61, 'RECIPIENTS', '@RNCB.RU;@RNCB.RU;', 'MAIL', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (985, 61, 'MAIL_SUBJECT', 'Рассылка отчетности процесингового центра [BANK_NAME]=[BANK_CUT]', 'MAIL', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (986, 61, 'MAIL_TEXT', 'Автоматически сформированный [REP_NAME]', 'MAIL', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (987, 61, 'SQL_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (988, 61, 'DATE_START', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (992, 61, 'TEMPLATE', null, 'ADMIN', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (993, 61, 'PAGE_1', '1', 'TEMPLATE', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (994, 61, 'PROGRAM', '  mbank.p_3462y_xml.init_portf(?)', 'PAGE_1', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (995, 61, 'SQL_1', 'select a.reference,a.name,a.inn,a.rezident from mbank.portfel a
', 'PAGE_1', 'VARCHAR2', null, to_date('28-03-2017 16:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (996, 61, 'SQL_1', 'Select * from dual', 'PAGE_1', 'VARCHAR2', null, to_date('28-03-2017 17:29:25', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (997, 61, 'DATABASE_CONNECTION', 'REPO', 'REPORT_PARAM', 'VARCHAR2', null, to_date('28-03-2017 17:30:06', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (998, 61, 'SQL_1', 'select rowid,a.* from mbank.tmp_audit_fiz_1 a', 'PAGE_1', 'VARCHAR2', null, to_date('28-03-2017 17:41:54', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (999, 61, 'DATABASE_CONNECTION', 'KRIMDSS', 'REPORT_PARAM', 'VARCHAR2', null, to_date('29-03-2017 10:19:10', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1000, 61, 'SQL_1', 'select a.* from mbank.tmp_audit_fiz_1 a', 'PAGE_1', 'VARCHAR2', null, to_date('29-03-2017 13:11:47', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1001, 61, 'SQL_1', 'select * FROM mbank.tmp_audit_osv a where a.work_date >= to_date(''01.01.2016'',''dd.mm.yyyy'')
and a.work_date <= to_date(''02.01.2016'',''dd.mm.yyyy'') and rownum <10', 'PAGE_1', 'VARCHAR2', null, to_date('29-03-2017 15:36:36', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1002, 61, 'PROGRAM', 'declare v_res varchar(4000); begin v_res :=null; :v_res; end;', 'PAGE_1', 'VARCHAR2', null, to_date('29-03-2017 15:53:04', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1003, 61, 'PROGRAM', '  mbank.p_3462y_xml2.init_portf(?);', 'PAGE_1', 'VARCHAR2', null, to_date('29-03-2017 16:02:39', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1004, 61, 'REPORT_PROGRAM', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('29-03-2017 16:20:26', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1005, 61, 'PROGRAM', '  mbank.p_3462y_xml.init_portf(?);', 'PAGE_1', 'VARCHAR2', null, to_date('29-03-2017 16:28:18', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1006, 61, 'REPORT_PROGRAM', '1', 'REPORT_PARAM', 'INTEGER', null, to_date('29-03-2017 16:32:27', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1007, 61, 'SQL_1', 'select * from mbank.portfel', 'PAGE_1', 'VARCHAR2', null, to_date('29-03-2017 17:06:37', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1021, 61, 'DEVELOPER', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ', 'REPORT_PARAM', 'VARCHAR2', null, to_date('05-04-2017 18:56:47', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1022, 61, 'TEXT_PARAМ', 'вася1', 'SQL_PARAM', 'VARCHAR2', 'вася', to_date('05-04-2017 19:01:33', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1023, 81, 'ADMIN', null, '-', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1024, 81, 'REPORT_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1025, 81, 'DEVELOPER', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ', 'REPORT_PARAM', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1026, 81, 'DATABASE_CONNECTION', 'KRIMDSS', 'REPORT_PARAM', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1027, 81, 'NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].XLSX', 'REPORT_PARAM', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1028, 81, 'ZIP', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1029, 81, 'ZIP_NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].ZIP', 'ZIP', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1030, 81, 'REPORT_PROGRAM', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1031, 81, 'XML_DATA', '1', 'REPORT_PARAM', 'INTEGER', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1032, 81, 'DATA_TO_DB', 'MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1033, 81, 'DATA_BY_LINK', '@MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1034, 81, 'AUTO_SHEDULER', '0', 'ADMIN', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1035, 81, 'SHEDULER_PARAM', null, 'AUTO_SHEDULER', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1036, 81, 'SHED_NAME', 'SHEDULER_1', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1037, 81, 'WORK_TIME', '00:00 - 24:00', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1038, 81, 'WORK_PERIOD', 'EVERYDAY', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1039, 81, 'WORK_PARAM', ' ', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1040, 81, 'AUTO_CREATE', null, 'ADMIN', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1041, 81, 'AUTO_WORK', '0', 'AUTO_CREATE', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1042, 81, 'AUTO_WORK_PARAM', null, 'AUTO_CREATE', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1043, 81, 'MAIL', null, 'ADMIN', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1044, 81, 'SEND_MAIL', '0', 'MAIL', 'INTEGER', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1045, 81, 'SEND_DATA', '0', 'MAIL', 'INTEGER', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1046, 81, 'RECIPIENTS', '@RNCB.RU;@RNCB.RU;', 'MAIL', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1047, 81, 'MAIL_SUBJECT', 'Рассылка отчетности процесингового центра [BANK_NAME]=[BANK_CUT]', 'MAIL', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1048, 81, 'MAIL_TEXT', 'Автоматически сформированный [REP_NAME]', 'MAIL', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1049, 81, 'SQL_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1050, 81, 'DATE_START', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1051, 81, 'DATE_FINISH', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1054, 81, 'TEMPLATE', null, 'ADMIN', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1055, 81, 'PAGE_1', '1', 'TEMPLATE', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1056, 81, 'PROGRAM', null, 'PAGE_1', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1057, 81, 'SQL_1', 'select/*+parrallel(8)*/
nvl(ddoc.payers_inn,'' '') "ИНН плательщика"
,ddoc.payers "Плательщик"
,nvl(ddoc.payers_account, '' '') "Счет плательщика"
,ddoc.eid "ЕИД Получателя"
,to_char(ddoc.okv) "ОКВЭД Получателя"
,nvl(ddoc.ogrn_reg,to_date(''01.01.3000'',''dd.mm.yyyy''))"Дата регистрации"
,ddoc.summa "Сумма платежа"
,nvl(ddoc.date_work, to_date(''01.01.3000'',''dd.mm.yyyy'')) "Дата платежа"
,nvl(ddoc.receivers_inn, '' '') "ИНН Получателя"
,ddoc.receivers  "Получатель"
,ddoc.receivers_account "Счет получателя"
,replace(replace(ddoc.memo,chr(10),'' ''), chr(13),'' '')  "Назначение платежа"from 
(select /*+parrallel(8)*/ * from
--- 1432 - списание  с  ПК, 36- удаленные
(select/*+parrallel(8)*/ * from archive where   substr(receivers_account,1,5) in ( ''40702'',''40802'')  and status!=36 and summa>0 and  date_work  between  :DATE_START and  :DATE_FINISH
                                             and type_doc not in (1432,108,200,3322,5087,8270,2244,2233,5508)) dd
left join 
 account_all acc 
 on  dd.receivers_account=acc.code
left join
(select /*+parrallel(8)*/ reference,mb.eid eid  from 
 ---определение малого бизнеса
(select /*+parrallel(8)*/  distinct eid from eid.eid_firma_variable where type=''CATEGORY'' and value=3 ) mb
left join
---связка ЕИД  и референц  клиента
( select /*+parrallel(8)*/ value,reference from variable_clients where name=''EID'' ) ref
on mb.eid=ref.value) cli
on acc.client=cli.reference
left join
(select /*+parrallel(8)*/ * from (select row_number() over ( partition by eid order by  date_modify desc ) as rn,value okv,eid from eid.eid_firma_variable where   type=''OKVED'' and status=1 ) where rn=1) okv
on cli.eid=okv.eid
left join
(select /*+parrallel(8)*/eid,ogrn_reg from (select row_number() over ( partition by eid order by  date_modify desc ) as rn,ef.* from eid.eid_firma ef ) where rn=1) efi
on cli.eid=efi.eid
where not  cli.eid is null) ddoc
order by ddoc.date_work,ddoc.receivers_account,ddoc.summa

', 'PAGE_1', 'VARCHAR2', null, to_date('10-04-2017 14:42:40', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1058, 81, 'SQL_1', 'Select * from dual', 'PAGE_1', 'VARCHAR2', null, to_date('10-04-2017 14:47:09', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1059, 81, 'SQL_1', '----Зачисление на счета малого бизнеса

select /*+parrallel(8)*/
ddoc.payers_inn "ИНН плательщика"
,ddoc.payers "Плательщик"
,ddoc.payers_account "Счет плательщика"
,ddoc.eid "ЕИД Получателя"
,to_char(ddoc.okv) "ОКВЭД Получателя"
,ddoc.ogrn_reg "Дата регистрации"
,ddoc.summa "Сумма платежа"
,ddoc.date_work "Дата платежа"
,ddoc.receivers_inn "ИНН Получателя"
,ddoc.receivers  "Получатель"
,ddoc.receivers_account "Счет получателя"
,replace(replace(ddoc.memo,chr(10),'' ''), chr(13),'' '')  "Назначение платежа"
from 
(select /*+parrallel(8)*/ * from
--- 1432 - списание  с  ПК, 36- удаленные
(select/*+parrallel(8)*/ * from archive where   substr(receivers_account,1,5) in ( ''40702'',''40802'')  and status!=36 and summa>0 and  date_work  between  :DATE_START and  :DATE_FINISH
                                             and type_doc not in (1432,108,200,3322,5087,8270,2244,2233,5508)) dd
left join 
 account_all acc 
 on  dd.receivers_account=acc.code
left join
(select /*+parrallel(8)*/ reference,mb.eid eid  from 
 ---определение малого бизнеса
(select /*+parrallel(8)*/  distinct eid from eid.eid_firma_variable where type=''CATEGORY'' and value=3 ) mb
left join
---связка ЕИД  и референц  клиента
( select /*+parrallel(8)*/ value,reference from variable_clients where name=''EID'' ) ref
on mb.eid=ref.value) cli
on acc.client=cli.reference
left join
(select /*+parrallel(8)*/ * from (select row_number() over ( partition by eid order by  date_modify desc ) as rn,value okv,eid from eid.eid_firma_variable where   type=''OKVED'' and status=1 ) where rn=1) okv
on cli.eid=okv.eid
left join
(select /*+parrallel(8)*/eid,ogrn_reg from (select row_number() over ( partition by eid order by  date_modify desc ) as rn,ef.* from eid.eid_firma ef ) where rn=1) efi
on cli.eid=efi.eid
where not  cli.eid is null) ddoc
order by ddoc.date_work,ddoc.receivers_account,ddoc.summa

', 'PAGE_1', 'VARCHAR2', null, to_date('10-04-2017 14:47:27', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1060, 81, 'DATABASE_CONNECTION', 'REPO', 'REPORT_PARAM', 'VARCHAR2', null, to_date('10-04-2017 14:48:36', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1061, 81, 'PROGRAM', 'declare v_res varchar(4000); begin v_res :=null; :v_res; end;', 'PAGE_1', 'VARCHAR2', null, to_date('10-04-2017 14:57:16', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1062, 81, 'SQL_1', 'select /*+parrallel(8)*/
ddoc.payers_inn "ИНН плательщика"
,ddoc.payers "Плательщик"
,ddoc.payers_account "Счет плательщика"
,ddoc.eid "ЕИД Получателя"
,to_char(ddoc.okv) "ОКВЭД Получателя"
,ddoc.ogrn_reg "Дата регистрации"
,ddoc.summa "Сумма платежа"
,ddoc.date_work "Дата платежа"
,ddoc.receivers_inn "ИНН Получателя"
,ddoc.receivers  "Получатель"
,ddoc.receivers_account "Счет получателя"
,replace(replace(ddoc.memo,chr(10),'' ''), chr(13),'' '')  "Назначение платежа"
from 
(select /*+parrallel(8)*/ * from
--- 1432 - списание  с  ПК, 36- удаленные
(select/*+parrallel(8)*/ * from archive where   substr(receivers_account,1,5) in ( ''40702'',''40802'')  and status!=36 and summa>0 and  date_work  between  :DATE_START and  :DATE_FINISH
                                             and type_doc not in (1432,108,200,3322,5087,8270,2244,2233,5508)) dd
left join 
 account_all acc 
 on  dd.receivers_account=acc.code
left join
(select /*+parrallel(8)*/ reference,mb.eid eid  from 
 ---определение малого бизнеса
(select /*+parrallel(8)*/  distinct eid from eid.eid_firma_variable where type=''CATEGORY'' and value=3 ) mb
left join
---связка ЕИД  и референц  клиента
( select /*+parrallel(8)*/ value,reference from variable_clients where name=''EID'' ) ref
on mb.eid=ref.value) cli
on acc.client=cli.reference
left join
(select /*+parrallel(8)*/ * from (select row_number() over ( partition by eid order by  date_modify desc ) as rn,value okv,eid from eid.eid_firma_variable where   type=''OKVED'' and status=1 ) where rn=1) okv
on cli.eid=okv.eid
left join
(select /*+parrallel(8)*/eid,ogrn_reg from (select row_number() over ( partition by eid order by  date_modify desc ) as rn,ef.* from eid.eid_firma ef ) where rn=1) efi
on cli.eid=efi.eid
where not  cli.eid is null) ddoc
order by ddoc.date_work,ddoc.receivers_account,ddoc.summa

', 'PAGE_1', 'VARCHAR2', null, to_date('10-04-2017 15:11:00', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1063, 81, 'SQL_1', 'select/*+parrallel(8)*/
nvl(ddoc.payers_inn,'' '') "ИНН плательщика"
,ddoc.payers "Плательщик"
,nvl(ddoc.payers_account, '' '') "Счет плательщика"
,ddoc.eid "ЕИД Получателя"
,to_char(ddoc.okv) "ОКВЭД Получателя"
,ddoc.ogrn_reg "Дата регистрации"
,ddoc.summa "Сумма платежа"
,ddoc.date_work "Дата платежа"
,nvl(ddoc.receivers_inn, '' '') "ИНН Получателя"
,ddoc.receivers  "Получатель"
,ddoc.receivers_account "Счет получателя"
,replace(replace(ddoc.memo,chr(10),'' ''), chr(13),'' '')  "Назначение платежа"
from 
(select /*+parrallel(8)*/ * from
--- 1432 - списание  с  ПК, 36- удаленные
(select/*+parrallel(8)*/ * from archive where   substr(receivers_account,1,5) in ( ''40702'',''40802'')  and status!=36 and summa>0 and  date_work  between  :DATE_START and  :DATE_FINISH
                                             and type_doc not in (1432,108,200,3322,5087,8270,2244,2233,5508)) dd
left join 
 account_all acc 
 on  dd.receivers_account=acc.code
left join
(select /*+parrallel(8)*/ reference,mb.eid eid  from 
 ---определение малого бизнеса
(select /*+parrallel(8)*/  distinct eid from eid.eid_firma_variable where type=''CATEGORY'' and value=3 ) mb
left join
---связка ЕИД  и референц  клиента
( select /*+parrallel(8)*/ value,reference from variable_clients where name=''EID'' ) ref
on mb.eid=ref.value) cli
on acc.client=cli.reference
left join
(select /*+parrallel(8)*/ * from (select row_number() over ( partition by eid order by  date_modify desc ) as rn,value okv,eid from eid.eid_firma_variable where   type=''OKVED'' and status=1 ) where rn=1) okv
on cli.eid=okv.eid
left join
(select /*+parrallel(8)*/eid,ogrn_reg from (select row_number() over ( partition by eid order by  date_modify desc ) as rn,ef.* from eid.eid_firma ef ) where rn=1) efi
on cli.eid=efi.eid
where not  cli.eid is null) ddoc
order by ddoc.date_work,ddoc.receivers_account,ddoc.summa

', 'PAGE_1', 'VARCHAR2', null, to_date('10-04-2017 15:15:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1064, 82, 'ADMIN', null, '-', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1065, 82, 'REPORT_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1066, 82, 'DEVELOPER', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ', 'REPORT_PARAM', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1067, 82, 'DATABASE_CONNECTION', 'KRIMDSS', 'REPORT_PARAM', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1068, 82, 'NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].XLSX', 'REPORT_PARAM', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1069, 82, 'ZIP', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1070, 82, 'ZIP_NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].ZIP', 'ZIP', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1071, 82, 'REPORT_PROGRAM', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1072, 82, 'XML_DATA', '1', 'REPORT_PARAM', 'INTEGER', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1073, 82, 'DATA_TO_DB', 'MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1074, 82, 'DATA_BY_LINK', '@MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1075, 82, 'AUTO_SHEDULER', '0', 'ADMIN', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1076, 82, 'SHEDULER_PARAM', null, 'AUTO_SHEDULER', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1077, 82, 'SHED_NAME', 'SHEDULER_1', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1078, 82, 'WORK_TIME', '00:00 - 24:00', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1079, 82, 'WORK_PERIOD', 'EVERYDAY', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1080, 82, 'WORK_PARAM', ' ', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1081, 82, 'AUTO_CREATE', null, 'ADMIN', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1082, 82, 'AUTO_WORK', '0', 'AUTO_CREATE', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1083, 82, 'AUTO_WORK_PARAM', null, 'AUTO_CREATE', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1084, 82, 'MAIL', null, 'ADMIN', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1085, 82, 'SEND_MAIL', '0', 'MAIL', 'INTEGER', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1086, 82, 'SEND_DATA', '0', 'MAIL', 'INTEGER', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1087, 82, 'RECIPIENTS', '@RNCB.RU;@RNCB.RU;', 'MAIL', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1088, 82, 'MAIL_SUBJECT', 'Рассылка отчетности процесингового центра [BANK_NAME]=[BANK_CUT]', 'MAIL', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1089, 82, 'MAIL_TEXT', 'Автоматически сформированный [REP_NAME]', 'MAIL', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1090, 82, 'SQL_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1091, 82, 'DATE_START', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1092, 82, 'DATE_FINISH', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1095, 82, 'TEMPLATE', null, 'ADMIN', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1096, 82, 'PAGE_1', '1', 'TEMPLATE', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1097, 82, 'PROGRAM', null, 'PAGE_1', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1098, 82, 'SQL_1', 'with

tmp_irk_vo as
 ( --- валютообменные операции   нумеруем в разрезе кассиров  с  сортировкой  по времени
  select /* +MATERIALIZE+ +parrallel(8) */
   row_number() over(partition by owner, date_work order by date_create) as rn,
    ar.reference,
    ar.type_doc,
    ar.date_create,
    ar.date_work,
    ar.summa,
    ar.payers_currency,
    ar.receivers_currency,
    ar.xsummacredit,
    ar.xsubdepartment,
    Ar.OWNER,
    ato.time,
    ato.user_id,
    ato.branch
  --- выбор данных   из аудита  о пользователе ( кто провел документ)     
    from archive ar, audit_table ato
   where ar.type_doc in (18, 19)
     and ar.date_work between :DATE_START and
         :DATE_FINISH
     and ar.reference = ato.reference
     and ato.table_name = ''DOCUMENTS''
     and ato.action = ''Обработка''),
ref_dubl as
 (select v.reference ref, v1.reference ref1, v2.reference ref2
    from tmp_irk_vo v
    left join ---  склеиваем с  предыдущей операцией 
   (select * from tmp_irk_vo where rn > 1) v1
      ON V.RN = V1.RN - 1
     and V.OWNER = V1.OWNER
     AND V.DATE_WORK = V1.DATE_WORK
    left join ---  склеиваем с  предыдущей операцией
   (select * from tmp_irk_vo where rn > 1) v2
      ON V.RN = V2.RN - 2
     and V.OWNER = V2.OWNER
     AND V.DATE_WORK = V2.DATE_WORK
   where ((v1.time - v.time) * 24 * 60) <= 2
     and ((v2.time - v1.time) * 24 * 60) <= 2
     and v.payers_currency = v1.payers_currency
     and v.payers_currency = v2.payers_currency
     and v.type_doc = v1.type_doc
     and v.type_doc = v2.type_doc),
reff as
 (SELECT DISTINCT *
    FROM (SELECT REF
            FROM ref_dubl
          UNION ALL
          SELECT REF1 REF
            FROM ref_dubl
          UNION ALL
          SELECT REF2 REF
            FROM ref_dubl))

---ВО_до_2-х_мин_3_ОП_DDMMYYYY
select (select USER_NAME from users where user_id = iv.owner) "ФИО",
       (select name from subdepartments where id = iv.branch) "ОО №",
       (select gd.name
          from guides_all gd, eid.eid_subdep_variable es
         where es.value = gd.code
           and es.subd_id = iv.branch
           and es.type = ''BG''
           and es.status = 1
           and gd.type_doc = 6938) "БГ",
       case payers_currency
         when ''810'' then
          receivers_currency
         else
          payers_currency
       end "Код валюты",
       iv.time "Дата/время",
       iv.summa "Сумма",
       (case iv.type_doc
         when 18 then
          ''Покупка''
         else
          ''Продажа''
       end) "Операция"
  from tmp_irk_vo iv
  left join REFF RD
    on iv.reference = rd.ref
 where NOT rd.ref is null
 order by owner, time

', 'PAGE_1', 'VARCHAR2', null, to_date('11-04-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1099, 82, 'DATABASE_CONNECTION', 'REPO', 'REPORT_PARAM', 'VARCHAR2', null, to_date('11-04-2017 16:09:01', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1100, 82, 'SQL_1', 'Select * from dual', 'PAGE_1', 'VARCHAR2', null, to_date('11-04-2017 16:09:59', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1101, 82, 'PROGRAM', 'declare v_res varchar(4000); begin v_res :=null; :v_res; end;', 'PAGE_1', 'VARCHAR2', null, to_date('11-04-2017 16:10:13', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1121, 101, 'ADMIN', null, '-', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1122, 101, 'REPORT_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1123, 101, 'DEVELOPER', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1124, 101, 'DATABASE_CONNECTION', 'KRIMDSS', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1125, 101, 'NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].XLSX', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1126, 101, 'ZIP', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1127, 101, 'ZIP_NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].ZIP', 'ZIP', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1128, 101, 'REPORT_PROGRAM', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1129, 101, 'XML_DATA', '1', 'REPORT_PARAM', 'INTEGER', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1130, 101, 'DATA_TO_DB', 'MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1131, 101, 'DATA_BY_LINK', '@MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1132, 101, 'AUTO_SHEDULER', '0', 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1133, 101, 'SHEDULER_PARAM', null, 'AUTO_SHEDULER', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1134, 101, 'SHED_NAME', 'SHEDULER_1', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1135, 101, 'WORK_TIME', '00:00 - 24:00', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1136, 101, 'WORK_PERIOD', 'EVERYDAY', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1137, 101, 'WORK_PARAM', ' ', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1138, 101, 'AUTO_CREATE', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1139, 101, 'AUTO_WORK', '0', 'AUTO_CREATE', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1140, 101, 'AUTO_WORK_PARAM', null, 'AUTO_CREATE', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1141, 101, 'MAIL', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1142, 101, 'SEND_MAIL', '0', 'MAIL', 'INTEGER', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1143, 101, 'SEND_DATA', '0', 'MAIL', 'INTEGER', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1144, 101, 'RECIPIENTS', '@RNCB.RU;@RNCB.RU;', 'MAIL', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1145, 101, 'MAIL_SUBJECT', 'Рассылка отчетности процесингового центра [BANK_NAME]=[BANK_CUT]', 'MAIL', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1146, 101, 'MAIL_TEXT', 'Автоматически сформированный [REP_NAME]', 'MAIL', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1147, 101, 'SQL_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1148, 101, 'DATE_START', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1149, 101, 'DATE_FINISH', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1152, 101, 'TEMPLATE', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1153, 101, 'PAGE_1', '1', 'TEMPLATE', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1154, 101, 'PROGRAM', null, 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1155, 101, 'SQL_1', 'with tmp_irk_vop as
 (select row_number() over(partition by a.owner, a.date_work, upper(replace(a.payers, '' '')), a.receivers_account, a.receivers_bik, a.receivers_INN, nvl(a.receivers_bank, 0), a.receivers, a.memo order by a.date_create) as rn,
         a.reference,
         a.refer_from,
         a.date_create,
         a.date_work,
         a.payers,
         a.receivers_account,
         a.receivers_bik,
         a.receivers_INN,
         nvl(a.receivers_bank, 0) receivers_bank,
         a.receivers,
         a.summa,
         a.memo,
         a.xsummacredit,
         a.xsubdepartment,
         A.OWNER
    from archive a
   where type_doc = 26
     and date_work between :DATE_START and
         :DATE_FINISH
     and owner <> 2005906476),
ref_dubl as
 (select v.reference ref, v1.reference ref1, v2.reference ref2
    from tmp_irk_vop v
    left join (select * from tmp_irk_vop where rn > 1) v1
      ON V.RN = V1.RN - 1
     and V.OWNER = V1.OWNER
     AND V.DATE_WORK = V1.DATE_WORK
     and v.payers = v1.payers
     and v.receivers_account = v1.receivers_account
     and v.receivers_bik = v1.receivers_bik
     and v.receivers_INN = v1.receivers_INN
     and v.receivers_bank = v1.receivers_bank
     and v.receivers = v1.receivers
     and v.memo = v1.memo
    left join
  ---  склеиваем с  3-й  операцией
   (select * from tmp_irk_vop where rn > 1) v2
      ON V.RN = V2.RN - 2
     and V.OWNER = V2.OWNER
     AND V.DATE_WORK = V2.DATE_WORK
     and v.payers = v2.payers
     and v.receivers_account = v2.receivers_account
     and v.receivers_bik = v2.receivers_bik
     and v.receivers_INN = v2.receivers_INN
     and v.receivers_bank = v2.receivers_bank
     and v.receivers = v2.receivers
     and v.memo = v2.memo
  --- отбираем операции, где  собралось 3 одинаковых платежа 
   where v1.reference is not null
     and v2.reference is not null),
reff as
 (SELECT DISTINCT *
    FROM (SELECT REF
            FROM ref_dubl
          UNION ALL
          SELECT REF1 REF
            FROM ref_dubl
          UNION ALL
          SELECT REF2 REF
            FROM ref_dubl))

---Расшифровка_Одинаковые платежи_от_3-х_DDMMYYYY

select /*+parrallel(8)*/
 iv.owner,
 (select USER_NAME from users where user_id = iv.owner) "ФИО",
 (select name from subdepartments where id = iv.xsubdepartment) "ОО №",
 (select gd.name
    from guides_all gd, eid.eid_subdep_variable es
   where es.value = gd.code
     and es.subd_id = iv.xsubdepartment
     and es.type = ''BG''
     and es.status = 1
     and gd.type_doc = 6938) "БГ",
 iv.payers "Плательщик",
 iv.receivers_account "Счет получателя",
 iv.receivers_bik "Бик получателя",
 iv.receivers_INN "ИНН получателя",
 iv.receivers_bank "Банк получателя",
 iv.receivers "Получатель",
 iv.memo "Назначение платежа",
 iv.date_work "Дата/время",
 iv.summa "Сумма"
  from tmp_irk_vop iv
  left join REFF RD
    on iv.reference = rd.ref
 where NOT rd.ref is null
 order by owner, rn, date_work
', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 14:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1156, 101, 'DATABASE_CONNECTION', 'REPO', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 14:48:29', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1157, 101, 'PROGRAM', 'declare v_res varchar(4000); begin v_res :=null; :v_res; end;', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 14:48:41', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1158, 101, 'SQL_1', 'Select * from dual', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 14:51:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1159, 102, 'ADMIN', null, '-', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1160, 102, 'REPORT_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1161, 102, 'DEVELOPER', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1162, 102, 'DATABASE_CONNECTION', 'KRIMDSS', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1163, 102, 'NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].XLSX', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1164, 102, 'ZIP', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1165, 102, 'ZIP_NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].ZIP', 'ZIP', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1166, 102, 'REPORT_PROGRAM', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1167, 102, 'XML_DATA', '1', 'REPORT_PARAM', 'INTEGER', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1168, 102, 'DATA_TO_DB', 'MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1169, 102, 'DATA_BY_LINK', '@MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1170, 102, 'AUTO_SHEDULER', '0', 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1171, 102, 'SHEDULER_PARAM', null, 'AUTO_SHEDULER', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1172, 102, 'SHED_NAME', 'SHEDULER_1', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1173, 102, 'WORK_TIME', '00:00 - 24:00', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1174, 102, 'WORK_PERIOD', 'EVERYDAY', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1175, 102, 'WORK_PARAM', ' ', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1176, 102, 'AUTO_CREATE', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1177, 102, 'AUTO_WORK', '0', 'AUTO_CREATE', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1178, 102, 'AUTO_WORK_PARAM', null, 'AUTO_CREATE', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1179, 102, 'MAIL', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1180, 102, 'SEND_MAIL', '0', 'MAIL', 'INTEGER', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1181, 102, 'SEND_DATA', '0', 'MAIL', 'INTEGER', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1182, 102, 'RECIPIENTS', '@RNCB.RU;@RNCB.RU;', 'MAIL', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1183, 102, 'MAIL_SUBJECT', 'Рассылка отчетности процесингового центра [BANK_NAME]=[BANK_CUT]', 'MAIL', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1184, 102, 'MAIL_TEXT', 'Автоматически сформированный [REP_NAME]', 'MAIL', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1185, 102, 'SQL_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1186, 102, 'DATE_START', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1187, 102, 'DATE_FINISH', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1190, 102, 'TEMPLATE', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1191, 102, 'PAGE_1', '1', 'TEMPLATE', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1192, 102, 'PROGRAM', null, 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1193, 102, 'SQL_1', 'with tmp_irk_vop as
 (select row_number() over(partition by a.owner, a.date_work, upper(replace(a.payers, '' '')), a.receivers_account, a.receivers_bik, a.receivers_INN, nvl(a.receivers_bank, 0), a.receivers, a.memo order by a.date_create) as rn,
         a.reference,
         a.refer_from,
         a.date_create,
         a.date_work,
         a.payers,
         a.receivers_account,
         a.receivers_bik,
         a.receivers_INN,
         nvl(a.receivers_bank, 0) receivers_bank,
         a.receivers,
         a.summa,
         a.memo,
         a.xsummacredit,
         a.xsubdepartment,
         A.OWNER
    from archive a
   where type_doc = 26
     and date_work between :DATE_START  and
         :DATE_FINISH
     and owner <> 2005906476),
ref_dubl as
 (select v.reference ref, v1.reference ref1, v2.reference ref2
    from tmp_irk_vop v
    left join (select * from tmp_irk_vop where rn > 1) v1
      ON V.RN = V1.RN - 1
     and V.OWNER = V1.OWNER
     AND V.DATE_WORK = V1.DATE_WORK
     and v.payers = v1.payers
     and v.receivers_account = v1.receivers_account
     and v.receivers_bik = v1.receivers_bik
     and v.receivers_INN = v1.receivers_INN
     and v.receivers_bank = v1.receivers_bank
     and v.receivers = v1.receivers
     and v.memo = v1.memo
    left join
  ---  склеиваем с  3-й  операцией
   (select * from tmp_irk_vop where rn > 1) v2
      ON V.RN = V2.RN - 2
     and V.OWNER = V2.OWNER
     AND V.DATE_WORK = V2.DATE_WORK
     and v.payers = v2.payers
     and v.receivers_account = v2.receivers_account
     and v.receivers_bik = v2.receivers_bik
     and v.receivers_INN = v2.receivers_INN
     and v.receivers_bank = v2.receivers_bank
     and v.receivers = v2.receivers
     and v.memo = v2.memo
  --- отбираем операции, где  собралось 3 одинаковых платежа 
   where v1.reference is not null
     and v2.reference is not null),
reff as
 (SELECT DISTINCT *
    FROM (SELECT REF
            FROM ref_dubl
          UNION ALL
          SELECT REF1 REF
            FROM ref_dubl
          UNION ALL
          SELECT REF2 REF
            FROM ref_dubl))

select (select USER_NAME from users where user_id = iv.owner) "Сотрудник",
       (select name from subdepartments where id = iv.xsubdepartment) "ОО №",
       (select gd.name
          from guides_all gd, eid.eid_subdep_variable es
         where es.value = gd.code
           and es.subd_id = iv.xsubdepartment
           and es.type = ''BG''
           and es.status = 1
           and gd.type_doc = 6938) "БГ",
       iv.date_work "Дата",
       count(iv.receivers) "Кол-во оп",
       sum(iv.summa) "Сумма оп "
  from tmp_irk_vop iv
  left join REFF RD
    on iv.reference = rd.ref
 where NOT rd.ref is null
 group by iv.owner,
          iv.xsubdepartment,
          iv.date_work,
          iv.payers,
          iv.receivers_account,
          iv.receivers_bik,
          iv.receivers_INN,
          iv.receivers_bank,
          iv.receivers,
          iv.memo
having count (iv.receivers) > 2
', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 15:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1194, 102, 'SQL_1', 'Select * from dual', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 15:18:11', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1195, 102, 'PROGRAM', 'declare v_res varchar(4000); begin v_res :=null; :v_res; end;', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 15:18:19', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1196, 102, 'DATABASE_CONNECTION', 'REPO', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 15:18:43', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1197, 0, 'PROGRAM', 'Блок предподготовки данных для запроса', 'PAGE_', 'VARCHAR2', null, to_date('14-04-2017 15:23:24', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1198, 0, 'PROGRAM', 'Блок предподготовки данных для запроса', 'PAGE_', 'VARCHAR2', 'declare v_res varchar(4000); begin v_res :=null; :v_res; end;', to_date('14-04-2017 15:24:43', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1199, 0, 'RARIO_PARAМ', 'Выбирите значение', 'SQL_PARAM', 'SELECT', 'select ''1''  as ''значение 1'' from dual union all select ''2''  as ''значение 2'' from dual', to_date('14-04-2017 15:24:43', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1200, 0, 'TEXT_PARAМ', 'Введите значение', 'SQL_PARAM', 'VARCHAR2', null, to_date('14-04-2017 15:24:43', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1201, 102, 'PAGE_2', '2', 'TEMPLATE', 'VARCHAR2', null, to_date('14-04-2017 15:55:32', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'Марченко Данил Сергеевич');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1202, 102, 'PROGRAM', null, 'PAGE_2', 'VARCHAR2', null, to_date('14-04-2017 15:55:32', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'Марченко Данил Сергеевич');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1203, 102, 'SQL_1', 'with tmp_irk_vop as
 (select row_number() over(partition by a.owner, a.date_work, upper(replace(a.payers, '' '')), a.receivers_account, a.receivers_bik, a.receivers_INN, nvl(a.receivers_bank, 0), a.receivers, a.memo order by a.date_create) as rn,
         a.reference,
         a.refer_from,
         a.date_create,
         a.date_work,
         a.payers,
         a.receivers_account,
         a.receivers_bik,
         a.receivers_INN,
         nvl(a.receivers_bank, 0) receivers_bank,
         a.receivers,
         a.summa,
         a.memo,
         a.xsummacredit,
         a.xsubdepartment,
         A.OWNER
    from archive a
   where type_doc = 26
     and date_work between :DATE_START and
         :DATE_FINISH
     and owner <> 2005906476),
ref_dubl as
 (select v.reference ref, v1.reference ref1, v2.reference ref2
    from tmp_irk_vop v
    left join (select * from tmp_irk_vop where rn > 1) v1
      ON V.RN = V1.RN - 1
     and V.OWNER = V1.OWNER
     AND V.DATE_WORK = V1.DATE_WORK
     and v.payers = v1.payers
     and v.receivers_account = v1.receivers_account
     and v.receivers_bik = v1.receivers_bik
     and v.receivers_INN = v1.receivers_INN
     and v.receivers_bank = v1.receivers_bank
     and v.receivers = v1.receivers
     and v.memo = v1.memo
    left join
  ---  склеиваем с  3-й  операцией
   (select * from tmp_irk_vop where rn > 1) v2
      ON V.RN = V2.RN - 2
     and V.OWNER = V2.OWNER
     AND V.DATE_WORK = V2.DATE_WORK
     and v.payers = v2.payers
     and v.receivers_account = v2.receivers_account
     and v.receivers_bik = v2.receivers_bik
     and v.receivers_INN = v2.receivers_INN
     and v.receivers_bank = v2.receivers_bank
     and v.receivers = v2.receivers
     and v.memo = v2.memo
  --- отбираем операции, где  собралось 3 одинаковых платежа 
   where v1.reference is not null
     and v2.reference is not null),
reff as
 (SELECT DISTINCT *
    FROM (SELECT REF
            FROM ref_dubl
          UNION ALL
          SELECT REF1 REF
            FROM ref_dubl
          UNION ALL
          SELECT REF2 REF
            FROM ref_dubl))

---Расшифровка_Одинаковые платежи_от_3-х_DDMMYYYY

select /*+parrallel(8)*/
 iv.owner,
 (select USER_NAME from users where user_id = iv.owner) "ФИО",
 (select name from subdepartments where id = iv.xsubdepartment) "ОО №",
 (select gd.name
    from guides_all gd, eid.eid_subdep_variable es
   where es.value = gd.code
     and es.subd_id = iv.xsubdepartment
     and es.type = ''BG''
     and es.status = 1
     and gd.type_doc = 6938) "БГ",
 iv.payers "Плательщик",
 iv.receivers_account "Счет получателя",
 iv.receivers_bik "Бик получателя",
 iv.receivers_INN "ИНН получателя",
 iv.receivers_bank "Банк получателя",
 iv.receivers "Получатель",
 iv.memo "Назначение платежа",
 iv.date_work "Дата/время",
 iv.summa "Сумма"
  from tmp_irk_vop iv
  left join REFF RD
    on iv.reference = rd.ref
 where NOT rd.ref is null
 order by owner, rn, date_work
', 'PAGE_2', 'VARCHAR2', null, to_date('14-04-2017 15:55:32', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1204, 102, 'SQL_1', 'Select * from dual', 'PAGE_2', 'VARCHAR2', null, to_date('14-04-2017 15:55:43', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1205, 82, 'SQL_1', 'with
tmp_irk_vo as
 ( --- валютообменные операции   нумеруем в разрезе кассиров  с  сортировкой  по времени
  select /* +MATERIALIZE+ +parrallel(8) */
   row_number() over(partition by owner, date_work order by date_create) as rn,
    ar.reference,
    ar.type_doc,
    ar.date_create,
    ar.date_work,
    ar.summa,
    ar.payers_currency,
    ar.receivers_currency,
    ar.xsummacredit,
    ar.xsubdepartment,
    Ar.OWNER,
    ato.time,
    ato.user_id,
    ato.branch
  --- выбор данных   из аудита  о пользователе ( кто провел документ)     
    from archive ar, audit_table ato
   where ar.type_doc in (18, 19)
     and ar.date_work between  :DATE_START and
         :DATE_FINISH
     and ar.reference = ato.reference
     and ato.table_name = ''DOCUMENTS''
     and ato.action = ''Обработка'')

---ВО_до_2-х_мин_3_ОП_DDMMYYYY
select (select USER_NAME from users where user_id = iv.owner) "ФИО",
       (select name from subdepartments where id = iv.branch) "ОО №",
       (select gd.name
          from guides_all gd, eid.eid_subdep_variable es
         where es.value = gd.code
           and es.subd_id = iv.branch
           and es.type = ''BG''
           and es.status = 1
           and gd.type_doc = 6938) "БГ",
       case payers_currency
         when ''810'' then
          receivers_currency
         else
          payers_currency
       end "Код валюты",
       iv.time "Дата/время",
       iv.summa "Сумма",
       (case iv.type_doc
         when 18 then
          ''Покупка''
         else
          ''Продажа''
       end) "Операция"
  from tmp_irk_vo iv
  left join (select v.reference ref, v1.reference ref1, v2.reference ref2
               from tmp_irk_vo v
               left join
             ---  склеиваем с  предыдущей операцией
              (select * from tmp_irk_vo where rn > 1) v1
                 ON V.RN = V1.RN - 1
                and V.OWNER = V1.OWNER
                AND V.DATE_WORK = V1.DATE_WORK
               left join
             ---  склеиваем с  предыдущей операцией
              (select * from tmp_irk_vo where rn > 1) v2
                 ON V.RN = V2.RN - 2
                and V.OWNER = V2.OWNER
                AND V.DATE_WORK = V2.DATE_WORK
             
              where ((v1.time - v.time) * 24 * 60) <= 2
                and ((v2.time - v1.time) * 24 * 60) <= 2
                and v.payers_currency = v1.payers_currency
                and v.payers_currency = v2.payers_currency
                and v.type_doc = v1.type_doc
                and v.type_doc = v2.type_doc) pod
    on iv.reference = pod.ref
    or iv.reference = pod.ref1
    or iv.reference = pod.ref2
order by owner,time
', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 16:10:07', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1206, 103, 'ADMIN', null, '-', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1207, 103, 'REPORT_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1208, 103, 'DEVELOPER', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1209, 103, 'DATABASE_CONNECTION', 'KRIMDSS', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1210, 103, 'NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].XLSX', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1211, 103, 'ZIP', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1212, 103, 'ZIP_NAME_FILE_DATA', '[REP_NAME]_ Отчет №[REP_ID]_[DATE=DD-MM-YYYY]_[PC_OPER_ID].ZIP', 'ZIP', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1213, 103, 'REPORT_PROGRAM', '0', 'REPORT_PARAM', 'INTEGER', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1214, 103, 'XML_DATA', '1', 'REPORT_PARAM', 'INTEGER', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1215, 103, 'DATA_TO_DB', 'MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1216, 103, 'DATA_BY_LINK', '@MBANK', 'XML_DATA', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1217, 103, 'AUTO_SHEDULER', '0', 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1218, 103, 'SHEDULER_PARAM', null, 'AUTO_SHEDULER', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1219, 103, 'SHED_NAME', 'SHEDULER_1', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1220, 103, 'WORK_TIME', '00:00 - 24:00', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1221, 103, 'WORK_PERIOD', 'EVERYDAY', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1222, 103, 'WORK_PARAM', ' ', 'SHEDULER_PARAM', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1223, 103, 'AUTO_CREATE', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1224, 103, 'AUTO_WORK', '0', 'AUTO_CREATE', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1225, 103, 'AUTO_WORK_PARAM', null, 'AUTO_CREATE', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1226, 103, 'MAIL', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1227, 103, 'SEND_MAIL', '0', 'MAIL', 'INTEGER', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1228, 103, 'SEND_DATA', '0', 'MAIL', 'INTEGER', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1229, 103, 'RECIPIENTS', '@RNCB.RU;@RNCB.RU;', 'MAIL', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1230, 103, 'MAIL_SUBJECT', 'Рассылка отчетности процесингового центра [BANK_NAME]=[BANK_CUT]', 'MAIL', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1231, 103, 'MAIL_TEXT', 'Автоматически сформированный [REP_NAME]', 'MAIL', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1232, 103, 'SQL_PARAM', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1233, 103, 'DATE_START', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1234, 103, 'DATE_FINISH', 'select to_char(trunc(sysdate),''DD.MM.YYYY'') from dual', 'SQL_PARAM', 'DATE', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1235, 103, 'TEMPLATE', null, 'ADMIN', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1236, 103, 'PAGE_1', '1', 'TEMPLATE', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1237, 103, 'PROGRAM', null, 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1238, 103, 'SQL_1', 'with 

tmp_irk_voc as ( SELECT /*+parrallel(8)*/ row_number() over ( partition by a.TYPE_DOC,a.date_work,a.owner,card.value  order by  date_create ) as rn,a.reference,A.TYPE_DOC,a.date_create,a.date_work,a.summa,a.payers,a.xsummacredit,
                                    a.xsubdepartment,A.OWNER,ato.time,ato.user_id,ato.branch,card.value PK 
                        FROM archive a,  audit_table ato, VARIABLE_ARCHIVE  card   where type_doc IN (215,1342) 
                                                                                                                    and date_work between :DATE_START and :DATE_FINISH
                                                                                                                    and a.reference=ato.reference
                                                                                                                    and  ato.table_name=''DOCUMENTS'' and ato.action=''Обработка''  
                                                                                                                    and  a.reference=CARD.reference 
                                                                                                                    and  card.NAME=''PK_NUMBER'' AND card.ROWNUMBER = 0),
ref_dubl as (select v.reference ref ,v1.reference ref1,v2.reference ref2 from --- операции с ПК
                          tmp_irk_voc v
                      ---  склеиваем с  предыдущей операцией при условии что совпадает дата, пользователь,тип операции и номер карты     
                    left join (select * from tmp_irk_voc where rn>1) v1
                                    ON v.type_doc=v1.type_doc and V.OWNER=V1.OWNER  AND V.RN=V1.RN-1 and V.DATE_WORK=V1.DATE_WORK and v.pk=v1.pk
                    left join ---  склеиваем с  3-й операцией при условии что совпадает дата, пользователь,тип операции и номер карты
                               (select * from tmp_irk_voc where rn>1) v2
                                     ON v.type_doc=v2.type_doc and V.OWNER=V2.OWNER  AND V.RN=V2.RN-2 and V.DATE_WORK=V2.DATE_WORK and v.pk=v2.pk
                             --- отбираем операции, где  разница  меньше 2-х минут
                     where  ((v1.time-v.time)*24*60)<=2  and  ((v2.time-v1.time)*24*60)<=2  ),
reff as ( SELECT DISTINCT * FROM (SELECT REF  FROM   ref_dubl  UNION ALL    SELECT REF1 REF   FROM   ref_dubl  UNION ALL    SELECT REF2  REF  FROM   ref_dubl   ) )    


-----ПК_выдача до 2-х минут _3_ОП_ DDMMYYYY
  select
  (select USER_NAME from users  where user_id=iv.owner ) "ФИО" ,
 (select name from subdepartments  where id=iv.xsubdepartment ) "ОО №", 
   (select gd.name 
        from guides_all gd, eid.eid_subdep_variable es 
        where 
                es.value = gd.code and
                es.subd_id = iv.xsubdepartment and
                es.type = ''BG'' and es.status = 1 and gd.type_doc = 6938)  "БГ",
                iv.time "Дата/время",
                iv.summa "Сумма",
                iv.pk "Карта",
                iv.payers "Клиент",
               (select name from types where type_id=iv.type_doc )  "Операция"
  
           
from 
---- выбираем все проводки, попавшие в  выборку
tmp_irk_voc  iv
left join  REFF RD on  iv.reference=rd.ref                                              
where  NOT rd.ref  is null', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 16:50:44', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'УДОДОВА ИРИНА ЕВГЕНЬЕВНА');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1239, 103, 'DATABASE_CONNECTION', 'REPO', 'REPORT_PARAM', 'VARCHAR2', null, to_date('14-04-2017 16:51:39', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1240, 103, 'SQL_1', 'Select * from dual', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 16:53:27', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1241, 103, 'SQL_1', 'with 

tmp_irk_voc as ( ---- нумерация  операций в зависимости от типа операции, даты  операционного дня, пользователя  и номера карты  по которой  совершается операция 
                                                select  /*+parrallel(8)*/ row_number() over ( partition by a.TYPE_DOC,a.date_work,a.owner,card.PK order by  date_create ) as rn,a.reference,A.TYPE_DOC,a.date_create,a.date_work,a.summa,a.payers,a.xsummacredit,
                                                            a.xsubdepartment,A.OWNER,ato.time,ato.user_id,ato.branch,card.PK
                                                 from     --- все нужные документы  за  период  
                                             ( SELECT  /*+parrallel(8)*/ *  FROM archive ar where type_doc IN (215,1342) and date_work between :DATE_START and :DATE_FINISH)  a
                                             left join 
                                                        --- выбор данных   из аудита  о пользователе ( кто провел документ)
                                            (select  /*+parrallel(8)*/ *  from  audit_table where table_name=''DOCUMENTS'' and action=''Обработка'' ) ato
                                                ON a.reference=ato.reference 
                                              LEFT JOIN    ---номер карты  по которой  проведена  операция     
                                             ( SELECT  /*+parrallel(8)*/   REFERENCE, VALUE PK  FROM VARIABLE_ARCHIVE WHERE NAME=''PK_NUMBER'' AND ROWNUMBER = 0) CARD
                                              ON a.reference=CARD.reference ),
                                              
ref_dubl as (select v.reference ref ,v1.reference ref1,v2.reference ref2 from --- операции с ПК
                          tmp_irk_voc v
                      ---  склеиваем с  предыдущей операцией при условии что совпадает дата, пользователь,тип операции и номер карты     
                    left join (select * from tmp_irk_voc where rn>1) v1
                                    ON v.type_doc=v1.type_doc and V.OWNER=V1.OWNER  AND V.RN=V1.RN-1 and V.DATE_WORK=V1.DATE_WORK and v.pk=v1.pk
                    left join ---  склеиваем с  3-й операцией при условии что совпадает дата, пользователь,тип операции и номер карты
                               (select * from tmp_irk_voc where rn>1) v2
                                     ON v.type_doc=v2.type_doc and V.OWNER=V2.OWNER  AND V.RN=V2.RN-2 and V.DATE_WORK=V2.DATE_WORK and v.pk=v2.pk
                             --- отбираем операции, где  разница  меньше 2-х минут
                     where  ((v1.time-v.time)*24*60)<=2  and  ((v2.time-v1.time)*24*60)<=2  ),
                     
reff as ( SELECT DISTINCT * FROM (SELECT REF  FROM   ref_dubl  UNION ALL    SELECT REF1 REF   FROM   ref_dubl  UNION ALL    SELECT REF2  REF  FROM   ref_dubl   ) )    


-----ПК_выдача до 2-х минут _3_ОП_ DDMMYYYY
--- разница <2 минут 
  select
  u.USER_NAME  "ФИО" ,
  sd.name  "ОО №", 
   (select gd.name 
        from guides_all gd, eid.eid_subdep_variable es 
        where 
                es.value = gd.code and
                es.subd_id = iv.xsubdepartment and
                es.type = ''BG'' and es.status = 1 and gd.type_doc = 6938)  "БГ",
                iv.time "Дата/время",
                iv.summa "Сумма",
                iv.pk "Карта",
                iv.payers "Клиент",
                tp.name   "Операция"
  
           
from 
---- выбираем все проводки, попавшие в  выборку
tmp_irk_voc  iv
left join  REFF RD on  iv.reference=rd.ref
left join  types tp ON   tp.type_id=iv.type_doc 
left join  users  u  ON   u.user_id=iv.owner  
left join  subdepartments sd  ON  sd.id=iv.xsubdepartment                                     
where  NOT rd.ref  is null', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 17:40:01', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1242, 103, 'SQL_1', 'with

tmp_irk_voc as
 ( ---- нумерация  операций в зависимости от типа операции, даты  операционного дня, пользователя  и номера карты  по которой  совершается операция 
  select /*+parrallel(8)*/
   row_number() over(partition by a.TYPE_DOC, a.date_work, a.owner, a.PK order by date_create) as rn,
    a.reference,
    A.TYPE_DOC,
    a.date_create,
    a.date_work,
    a.summa,
    a.payers,
    a.xsummacredit,
    a.xsubdepartment,
    A.OWNER,
    a.time,
    a.user_id,
    a.branch_ato as branch,
    a.PK
    from --- все нужные документы  за  период  
          (SELECT /*+parrallel(8)*/
            ar.*,ato.time,ato.user_id, ato.branch as branch_ato  , CARD.VALUE PK
             FROM archive ar, VARIABLE_ARCHIVE CARD , audit_table ato
            where type_doc IN (215, 1342)
              and date_work between to_date(''&from_datev1'',''DD.MM.RRRR'') and to_date(''&from_datev2'',''DD.MM.RRRR'')
           and ar.reference = CARD.reference  
           and  CARD.NAME = ''PK_NUMBER''
           AND CARD.ROWNUMBER = 0
           and ar.reference = ato.reference
           and  ato.table_name = ''DOCUMENTS''
           and ato.action = ''Обработка''
     
              
              ) a),
 /*   left join
  --- выбор данных   из аудита  о пользователе ( кто провел документ)
   (select /*+parrallel(8)*/
  /*   *
      from audit_table
     where table_name = ''DOCUMENTS''
       and action = ''Обработка'') ato
      ON a.reference = ato.reference
    LEFT JOIN ---номер карты  по которой  проведена  операция     
   (SELECT /*+parrallel(8)*/
  /*   REFERENCE, VALUE PK
      FROM VARIABLE_ARCHIVE
     WHERE NAME = ''PK_NUMBER''
       AND ROWNUMBER = 0) CARD
      ON a.reference = CARD.reference),*/

ref_dubl as
 (select v.reference ref, v1.reference ref1, v2.reference ref2
    from --- операции с ПК
         tmp_irk_voc v
  ---  склеиваем с  предыдущей операцией при условии что совпадает дата, пользователь,тип операции и номер карты     
    left join (select * from tmp_irk_voc where rn > 1) v1
      ON v.type_doc = v1.type_doc
     and V.OWNER = V1.OWNER
     AND V.RN = V1.RN - 1
     and V.DATE_WORK = V1.DATE_WORK
     and v.pk = v1.pk
    left join ---  склеиваем с  3-й операцией при условии что совпадает дата, пользователь,тип операции и номер карты
   (select * from tmp_irk_voc where rn > 1) v2
      ON v.type_doc = v2.type_doc
     and V.OWNER = V2.OWNER
     AND V.RN = V2.RN - 2
     and V.DATE_WORK = V2.DATE_WORK
     and v.pk = v2.pk
  --- отбираем операции, где  разница  меньше 2-х минут
   where ((v1.time - v.time) * 24 * 60) <= 2
     and ((v2.time - v1.time) * 24 * 60) <= 2),

reff as
 (SELECT DISTINCT *
    FROM (SELECT REF
            FROM ref_dubl
          UNION ALL
          SELECT REF1 REF
            FROM ref_dubl
          UNION ALL
          SELECT REF2 REF
            FROM ref_dubl))

-----ПК_выдача до 2-х минут _3_ОП_ DDMMYYYY
--- разница <2 минут 
select u.USER_NAME "ФИО",
       sd.name "ОО №",
       (select gd.name
          from guides_all gd, eid.eid_subdep_variable es
         where es.value = gd.code
           and es.subd_id = iv.xsubdepartment
           and es.type = ''BG''
           and es.status = 1
           and gd.type_doc = 6938) "БГ",
       iv.time "Дата/время",
       iv.summa "Сумма",
       iv.pk "Карта",
       iv.payers "Клиент",
       tp.name "Операция"

  from ---- выбираем все проводки, попавшие в  выборку
        tmp_irk_voc iv
  left join REFF RD
    on iv.reference = rd.ref
  left join types tp
    ON tp.type_id = iv.type_doc
  left join users u
    ON u.user_id = iv.owner
  left join subdepartments sd
    ON sd.id = iv.xsubdepartment
 where NOT rd.ref is null
', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 17:47:18', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1243, 103, 'SQL_1', 'with

tmp_irk_voc as
 ( ---- нумерация  операций в зависимости от типа операции, даты  операционного дня, пользователя  и номера карты  по которой  совершается операция 
  select /*+parrallel(8)*/
   row_number() over(partition by a.TYPE_DOC, a.date_work, a.owner, a.PK order by date_create) as rn,
    a.reference,
    A.TYPE_DOC,
    a.date_create,
    a.date_work,
    a.summa,
    a.payers,
    a.xsummacredit,
    a.xsubdepartment,
    A.OWNER,
    a.time,
    a.user_id,
    a.branch_ato as branch,
    a.PK
    from --- все нужные документы  за  период  
          (SELECT /*+parrallel(8)*/
            ar.*,ato.time,ato.user_id, ato.branch as branch_ato  , CARD.VALUE PK
             FROM archive ar, VARIABLE_ARCHIVE CARD , audit_table ato
            where type_doc IN (215, 1342)
              and date_work between :DATE_START and :DATE_FINISH
           and ar.reference = CARD.reference  
           and  CARD.NAME = ''PK_NUMBER''
           AND CARD.ROWNUMBER = 0
           and ar.reference = ato.reference
           and  ato.table_name = ''DOCUMENTS''
           and ato.action = ''Обработка''
     
              
              ) a),
 /*   left join
  --- выбор данных   из аудита  о пользователе ( кто провел документ)
   (select /*+parrallel(8)*/
  /*   *
      from audit_table
     where table_name = ''DOCUMENTS''
       and action = ''Обработка'') ato
      ON a.reference = ato.reference
    LEFT JOIN ---номер карты  по которой  проведена  операция     
   (SELECT /*+parrallel(8)*/
  /*   REFERENCE, VALUE PK
      FROM VARIABLE_ARCHIVE
     WHERE NAME = ''PK_NUMBER''
       AND ROWNUMBER = 0) CARD
      ON a.reference = CARD.reference),*/

ref_dubl as
 (select v.reference ref, v1.reference ref1, v2.reference ref2
    from --- операции с ПК
         tmp_irk_voc v
  ---  склеиваем с  предыдущей операцией при условии что совпадает дата, пользователь,тип операции и номер карты     
    left join (select * from tmp_irk_voc where rn > 1) v1
      ON v.type_doc = v1.type_doc
     and V.OWNER = V1.OWNER
     AND V.RN = V1.RN - 1
     and V.DATE_WORK = V1.DATE_WORK
     and v.pk = v1.pk
    left join ---  склеиваем с  3-й операцией при условии что совпадает дата, пользователь,тип операции и номер карты
   (select * from tmp_irk_voc where rn > 1) v2
      ON v.type_doc = v2.type_doc
     and V.OWNER = V2.OWNER
     AND V.RN = V2.RN - 2
     and V.DATE_WORK = V2.DATE_WORK
     and v.pk = v2.pk
  --- отбираем операции, где  разница  меньше 2-х минут
   where ((v1.time - v.time) * 24 * 60) <= 2
     and ((v2.time - v1.time) * 24 * 60) <= 2),

reff as
 (SELECT DISTINCT *
    FROM (SELECT REF
            FROM ref_dubl
          UNION ALL
          SELECT REF1 REF
            FROM ref_dubl
          UNION ALL
          SELECT REF2 REF
            FROM ref_dubl))

-----ПК_выдача до 2-х минут _3_ОП_ DDMMYYYY
--- разница <2 минут 
select u.USER_NAME "ФИО",
       sd.name "ОО №",
       (select gd.name
          from guides_all gd, eid.eid_subdep_variable es
         where es.value = gd.code
           and es.subd_id = iv.xsubdepartment
           and es.type = ''BG''
           and es.status = 1
           and gd.type_doc = 6938) "БГ",
       iv.time "Дата/время",
       iv.summa "Сумма",
       iv.pk "Карта",
       iv.payers "Клиент",
       tp.name "Операция"

  from ---- выбираем все проводки, попавшие в  выборку
        tmp_irk_voc iv
  left join REFF RD
    on iv.reference = rd.ref
  left join types tp
    ON tp.type_id = iv.type_doc
  left join users u
    ON u.user_id = iv.owner
  left join subdepartments sd
    ON sd.id = iv.xsubdepartment
 where NOT rd.ref is null
', 'PAGE_1', 'VARCHAR2', null, to_date('14-04-2017 17:52:37', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1263, 0, 'REAL_RECIPIENT', 'Расссылка результата обработки отчета на адреса:', 'SQL_PARAM', 'TEXT', null, to_date('25-04-2017 15:50:04', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1264, 0, 'REAL_REСIPIENT', 'Текуший получатель письма', 'SQL_PARAM', 'TEXT', null, to_date('25-04-2017 15:51:03', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1266, 0, 'REAL_REСIPIENT', 'Текуший получатель письма', 'SQL_PARAM', 'TEXT', null, to_date('25-04-2017 15:51:40', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1267, 0, 'REAL_RECIPIENT', 'Текуший получатель письма', 'SQL_PARAM', 'TEXT', null, to_date('25-04-2017 15:54:17', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1268, 0, 'SEND_MAIL', 'Отпавляем или не отправляем отчет', 'MAIL', 'INTEGER', '0', to_date('25-04-2017 15:56:38', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1269, 0, 'RECIPIENTS', 'Почта получателей', 'MAIL', 'VARCHAR2', '@RNCB.RU;@RNCB.RU;', to_date('25-04-2017 15:57:59', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1274, 42, 'PROGRAM', 'epec.reports_program.rep_41(?)', 'PAGE_1', 'VARCHAR2', null, to_date('25-04-2017 16:17:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1280, 0, 'PROGRAM', 'Блок предподготовки данных для запроса', 'PAGE_', 'VARCHAR2', null, to_date('25-04-2017 16:17:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1282, 102, 'PROGRAM', null, 'PAGE_2', 'VARCHAR2', null, to_date('25-04-2017 16:17:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1283, 101, 'PROGRAM', null, 'PAGE_1', 'VARCHAR2', null, to_date('25-04-2017 16:17:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1284, 102, 'PROGRAM', null, 'PAGE_1', 'VARCHAR2', null, to_date('25-04-2017 16:17:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1285, 81, 'PROGRAM', null, 'PAGE_1', 'VARCHAR2', null, to_date('25-04-2017 16:17:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1286, 82, 'PROGRAM', null, 'PAGE_1', 'VARCHAR2', null, to_date('25-04-2017 16:17:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1287, 61, 'PROGRAM', '  mbank.p_3462y_xml.init_portf(?)', 'PAGE_1', 'VARCHAR2', null, to_date('25-04-2017 16:17:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1288, 103, 'PROGRAM', null, 'PAGE_1', 'VARCHAR2', null, to_date('25-04-2017 16:17:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1300, 0, 'REAL_RECIPIENT', 'Предупредить об окончании формирования отчета', 'SQL_PARAM', 'TEXT', null, to_date('25-04-2017 16:34:27', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1322, 0, 'SAVE_BLOB', 'Режим сохранения файла в блоб БД 0-Нет, 1-Да', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('05-05-2017 12:28:30', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1326, 42, 'SAVE_BLOB', '0', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('05-05-2017 12:28:30', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1327, 61, 'SAVE_BLOB', '0', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('05-05-2017 12:28:30', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1328, 81, 'SAVE_BLOB', '1', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('05-05-2017 12:28:30', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'РЊР°СЂС‡РµРЅРЄРЅ Р”Р°РЅРЁР» РЎРµСЂРІРµРµРІРЁС‡');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1329, 82, 'SAVE_BLOB', '0', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('05-05-2017 12:28:30', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1330, 101, 'SAVE_BLOB', '0', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('05-05-2017 12:28:30', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1331, 102, 'SAVE_BLOB', '1', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('05-05-2017 12:28:30', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'МАРЧЕНКО ДАНИЛ СЕРГЕЕВИЧ');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1332, 103, 'SAVE_BLOB', '0', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('05-05-2017 12:28:30', 'dd-mm-yyyy hh24:mi:ss'), 'A', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1333, 102, 'SAVE_BLOB', '0', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('05-05-2017 12:43:55', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1334, 102, 'SAVE_BLOB', '1', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('05-05-2017 13:02:56', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1335, 102, 'SAVE_BLOB', '0', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('05-05-2017 14:30:19', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

insert into REPORTS_PARAMS (PARMS_ID, OID_REP_ID, PARAM, VALUE, SUBPARAM, TYPE, DEFAULT_VALUE, DATE_CREATE, STATE, USER_)
values (1339, 81, 'SAVE_BLOB', '0', 'REPORT_PARAM', 'VARCHAR2', '0', to_date('08-06-2017 15:45:58', 'dd-mm-yyyy hh24:mi:ss'), 'H', 'EPEC');

