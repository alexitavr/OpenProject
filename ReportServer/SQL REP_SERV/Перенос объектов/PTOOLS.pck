CREATE OR REPLACE PACKAGE PTOOLS IS
----пакет строковых функций без обращений к БД


  type T_Tools_Value is record (ParamName varchar2(20), ParamValue varchar2(200));
  type T_Tools_Table IS table of T_Tools_Value;


FUNCTION Translit_Uppper(aStr varchar2) return varchar2; 
  
FUNCTION Split(par_String VARCHAR2,
                                 par_Split_Symbol varchar2,
                                 par_Number_Of_Element number,
                                 par_Show_Error number default 0) return varchar2;
--PROCEDURE SET_PARAM(spString IN OUT VARCHAR2, spParam in VARCHAR2, spValue in VARCHAR2);
--PROCEDURE DEL_PARAM(dpString IN OUT VARCHAR2, dpParam in VARCHAR2);
-------------------------
FUNCTION TO_DATE_(tdSource IN VARCHAR2, tdFormat IN VARCHAR2 := null) RETURN DATE;
-------------------------
FUNCTION AS_DATE(adSource IN VARCHAR2, adFormat IN VARCHAR2 := null) RETURN DATE;
-------------------------
FUNCTION TO_NUMB(tnSource IN VARCHAR2, tnDefault IN NUMBER := 0) RETURN NUMBER;
-------------------------
FUNCTION AS_NUM(anSource IN VARCHAR2, anDefault IN NUMBER := 0) RETURN NUMBER;
-------------------------
Function READ_PARAM(rpValue in Varchar2, rpParam in Varchar2, rpDefault in Varchar2 := null)
return varchar2;
-------------------------
Function PARAM_NUM(pnValue in Varchar2, pnParam in Varchar2, pnDefault in Varchar2 := null)
return NUMBER ;
----------------------------------------
Function PARAM_DAT(pdValue in Varchar2, pdParam in Varchar2, pdDefault in Varchar2 := null)
return DATE ;
----------------------------------------
FUNCTION EXTRACT_WORD(ewPos IN NUMBER, ewSource IN VARCHAR2, ewDelim IN VARCHAR2 := ';') RETURN VARCHAR2;
----------------------------------------
function Pattern_Count(wcString in varchar2, wcSubString in varchar2) return number;
----------------------------------------
FUNCTION DATETOTEXT( dDate IN DATE)RETURN VARCHAR2;
FUNCTION NAME_MONTH( dDate IN DATE)RETURN VARCHAR2;
FUNCTION NAME_MONTH( numMonth IN NUMBER)RETURN VARCHAR2;
FUNCTION  MONTHS_AMOUNT(qnDateLo IN DATE ,qnDateHi IN DATE , qnMonths IN NUMBER := 1) RETURN NUMBER;
FUNCTION DAY_YEAR(dDate IN DATE) RETURN NUMBER;
FUNCTION MY_ADD_MONTHS (dDate IN DATE, nMonth IN NUMBER) RETURN DATE;
  -- отдаёт параметры в табличной переменной Name | Value
  -- %params Params - Параметры в виде [PARAM1=VALUE1]...
  function Get_Tools_Table(Params varchar2) return T_Tools_Table;
  
  -- Функция - аналог set_param, но результат возвращается функцией
  -- %param spString - Строка параметров
  -- %param spParam  - Наименование параметра
  -- %param spValue  - Значение
  /*function GetRaramStrSet(spString in varchar2, 
                          spParam  in varchar2, 
                          spValue  in varchar2) return varchar2;*/
END PTOOLS;
/
CREATE OR REPLACE PACKAGE BODY PTOOLS IS
----пакет строковых функций без обращений к БД


function Translit_Uppper(aStr varchar2) return varchar2 
  is
 ret varchar2(512);  
begin
  ret := upper(aStr);

  select 
  replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(translate(replace(UPPER(ret),
                         'КС','KS')
                        ,'АБВГДЕЗИЙКЛМНОПРСТУФЫ'
                        ,'ABVGDEZIYKLMNOPRSTUFY'),
                         'Ж','ZH')
                        ,'Ё','YO')
                        ,'Ц','TS')
                        ,'Ч','CH')
                        ,'Ш','SH')
                        ,'Щ','SCH')
                        ,'Э','E')
                        ,'Ю','YU')
                        ,'Я','YA')
                        ,'Х','KH')
                        ,'Ъ','')
                        ,'Ь','') into ret
  from dual;

  return ret;
  
end;

FUNCTION Split(par_String VARCHAR2,
                                 par_Split_Symbol varchar2,
                                 par_Number_Of_Element number,
                                 par_Show_Error number default 0) return varchar2
IS
  v_Res varchar2(200);
  v_Num_Of_Symbols number;
BEGIN
  v_Num_Of_Symbols := length(par_String) - length(replace(par_String,par_Split_Symbol));


  IF v_Num_Of_Symbols = 0 then
    IF par_Show_Error = 1 then
      raise_application_error(-20012,'Подобные разделители отсутствуют в строке');
    else
      return par_String;
    END IF;
  END IF;
  IF par_Number_Of_Element > v_Num_Of_Symbols + 1 then
    IF par_Show_Error = 1 then
      raise_application_error(-20013,'Максимальный номер элемента - '||to_char(v_Num_Of_Symbols + 1));
    else
      return null;
    END IF;
  END IF;
  IF par_Number_Of_Element = 1 then
    v_Res := substr(par_String, 0, instr(par_String,par_Split_Symbol) - 1);
  elsif par_Number_Of_Element = v_Num_Of_Symbols + 1  then
    v_Res := substr(par_String,
                    instr(par_String,par_Split_Symbol,1,par_Number_Of_Element - 1) + 1,
                    length(par_String) - instr(par_String,par_Split_Symbol,1,par_Number_Of_Element));
  else
    v_Res := substr(par_String,
                    instr(par_String,par_Split_Symbol,1, par_Number_Of_Element - 1) + 1,
                    instr(par_String,par_Split_Symbol,1, par_Number_Of_Element) - instr(par_String,par_Split_Symbol,1, par_Number_Of_Element - 1) - 1);
  END IF;
  return v_Res;
END;

----------------------------
FUNCTION AS_num(anSource IN VARCHAR2, anDefault IN NUMBER := 0) RETURN NUMBER
IS
anResult    NUMBER;
BEGIN
  anResult := to_number(anSource);
  RETURN NVL(anResult, anDefault);
EXCEPTION
  WHEN OTHERS THEN Return anDefault;
 END;
----------------------------
FUNCTION to_numb(tnSource IN VARCHAR2, tnDefault IN NUMBER := 0) RETURN NUMBER
IS
BEGIN
  RETURN AS_NUM(tnSource , tnDefault );
END;
----------------------------
FUNCTION AS_date(adSource IN VARCHAR2, adFormat IN VARCHAR2 := null) RETURN DATE IS
adResult DATE;
adTmp_Fmt Varchar2(200);
BEGIN
 adTmp_Fmt := NVL(adFormat, 'dd.mm.yyyy');
 adResult := to_date(adSource, adTmp_Fmt);
 Return adResult;
EXCEPTION
WHEN OTHERS THEN
   RETURN Null;
END;
----------------------------
FUNCTION to_date_(tdSource IN VARCHAR2, tdFormat IN VARCHAR2 := null) RETURN DATE IS
BEGIN
  RETURN AS_date(tdSource , tdFormat );
END;
----------------------------
/*PROCEDURE DEL_PARAM(dpString IN OUT VARCHAR2, dpParam in VARCHAR2)
IS
dpStart NUMBER;
dpEnd   NUMBER;
dpTmp_Str  Variable_contracts.Value%type;
BEGIN
  IF Replace(dpParam, ' ') IS NOT NULL
  THEN
    dpStart := instr(UPPER(dpString), '['||UPPER(dpParam)||'=');
    IF dpStart > 0
    THEN NULL;
      dpTmp_Str := Substr(dpString, dpStart+Length(dpParam)+2);
      dpEnd := Instr(dpTmp_Str, ']');
      IF dpEnd > 0
      THEN
        dpString := Substr(dpString, 1, dpStart -1)||Substr(dpTmp_Str, dpEnd+1);
      ELSE
        dpString := Substr(dpString, 1, dpStart -1);
      END IF;
    END IF;
   END IF;
END;*/
----------------------------
/*PROCEDURE SET_PARAM(spString IN OUT VARCHAR2, spParam in VARCHAR2, spValue in VARCHAR2)
IS
BEGIN
  DEL_PARAM(spString , spParam );
  IF spValue IS NOT NULL
  THEN
    spString := spString||'['||UPPER(spParam)||'='||Replace(Replace(spValue, ']', '#93.#'),'[','#91.#')||']';
  END IF;
END;*/
----------------------------
FUNCTION READ_PARAM(rpValue in Varchar2, rpParam in Varchar2, rpDefault in Varchar2 := null)
return varchar2 is
rpResult  VARCHAR2(32000);
rpTmp_Value  VARCHAR2(32000);
rpPos Number;
Begin
  rpTmp_Value := rpValue;
  rpPos := instr(Upper(rpValue), '['||Upper(rpParam)||'=' );
  if rpPos>0
  Then
    rpTmp_Value := substr(rpTmp_Value, rpPos+length(rpParam)+2);
    rpPos := instr(rpTmp_Value, ']');
    if rpPos >0
    Then
      rpResult := substr(rpTmp_Value, 1, rpPos-1);
    else
      rpResult := rpTmp_Value;
    end if;
  end if;
  rpResult := Replace(Replace(rpResult, '#93.#', ']'),'#91.#', '[');
  return nvl(rpResult, rpDefault);
end READ_PARAM;
------------------------------
FUNCTION PARAM_NUM(pnValue in Varchar2, pnParam in Varchar2, pnDefault in Varchar2 := null)
return NUMBER is
pnResult  NUMBER;
pnTmp_Str  VARCHAR2(32000);
Begin
  pnTmp_Str := READ_PARAM(pnValue , pnParam , pnDefault );
  pnResult  := TO_NUMB(pnTmp_Str, 0);
  pnResult  := Nvl(pnResult, 0);
  return pnResult;
end PARAM_NUM;
----------------------------------------
Function PARAM_DAT(pdValue in Varchar2, pdParam in Varchar2, pdDefault in Varchar2 := null)
return DATE is
pdResult  DATE;
pdTmp_Str  VARCHAR2(32000);
Begin
  pdTmp_Str := READ_PARAM(pdValue , pdParam , null );
  if pdTmp_Str is not null
  Then
    pdResult := TO_DATE_(pdTmp_Str, pdDefault);
  end if;
  return pdResult;
end PARAM_DAT;
----------------------------------------
FUNCTION NAME_MONTH( numMonth IN NUMBER)
RETURN VARCHAR2
IS
BEGIN
  IF    numMonth = 1 THEN
          RETURN('январь');
  ELSIF numMonth = 2 THEN
          RETURN('февраль');
  ELSIF numMonth = 3 THEN
          RETURN('март');
  ELSIF numMonth = 4 THEN
          RETURN('апрель');
  ELSIF numMonth = 5 THEN
          RETURN('май');
  ELSIF numMonth = 6 THEN
          RETURN('июнь');
  ELSIF numMonth = 7 THEN
          RETURN('июль');
  ELSIF numMonth = 8 THEN
          RETURN('август');
  ELSIF numMonth = 9 THEN
          RETURN('сентябрь');
  ELSIF numMonth = 10 THEN
          RETURN('октябрь');
  ELSIF numMonth = 11 THEN
          RETURN('ноябрь');
  ELSIF numMonth = 12 THEN
          RETURN('декабрь');
  END IF;
  RETURN('');
END;
-- *************************************************************
FUNCTION NAME_MONTH( dDate IN DATE)
RETURN VARCHAR2
IS
BEGIN
  RETURN( NAME_MONTH( TO_NUMBER( TO_CHAR( dDate, 'MM' ) ) ) );
END;
----------------------------------
FUNCTION DATETOTEXT( dDate IN DATE)
RETURN VARCHAR2
IS
        numMonth        NUMBER;
        varMonth        VARCHAR2(10);
BEGIN
  IF dDate is null THEN
     RETURN ('');
  END IF;
  numMonth := TO_NUMBER( TO_CHAR( dDate, 'MM' ) );
  varMonth := '';
  IF    numMonth = 1 THEN
          varMonth := 'января';
  ELSIF numMonth = 2 THEN
          varMonth := 'февраля';
  ELSIF numMonth = 3 THEN
          varMonth := 'марта';
  ELSIF numMonth = 4 THEN
          varMonth := 'апреля';
  ELSIF numMonth = 5 THEN
          varMonth := 'мая';
  ELSIF numMonth = 6 THEN
          varMonth := 'июня';
  ELSIF numMonth = 7 THEN
          varMonth := 'июля';
  ELSIF numMonth = 8 THEN
          varMonth := 'августа';
  ELSIF numMonth = 9 THEN
          varMonth := 'сентября';
  ELSIF numMonth = 10 THEN
          varMonth := 'октября';
  ELSIF numMonth = 11 THEN
          varMonth := 'ноября';
  ELSIF numMonth = 12 THEN
          varMonth := 'декабря';
  END IF;
  RETURN( TO_CHAR( dDate, 'DD' ) || ' ' || varMonth || ' ' || TO_CHAR( dDate, 'YYYY' ) || ' г.');
END;
------------------------------------------
FUNCTION MY_ADD_MONTHS (dDate IN DATE, nMonth IN NUMBER)
RETURN DATE
IS
        DateNew DATE;
        nDay    NUMBER;
        nDayNew NUMBER;
BEGIN
        DateNew  := ADD_MONTHS( dDate, nMonth);
        nDay     := TO_NUMBER(TO_CHAR( dDate, 'DD') );
        nDayNew  := TO_NUMBER(TO_CHAR( DateNew, 'DD') );

        IF nDayNew > nDay THEN
                DateNew := TRUNC(DateNew,'MM') + nDay - 1;
        END IF;
        RETURN(DateNew);
END;
------------------------------------------
FUNCTION DAY_YEAR(dDate IN DATE)
RETURN NUMBER
IS
BEGIN
        RETURN(TO_NUMBER(TO_CHAR(TO_DATE('31.12.' || TO_CHAR(dDate,'YYYY'), 'DD.MM.YYYY'),'DDD')));
END DAY_YEAR;
------------------------------------------
FUNCTION  MONTHS_AMOUNT(qnDateLo IN DATE ,qnDateHi IN DATE , qnMonths IN NUMBER := 1) RETURN NUMBER IS
qnResult NUMBER:=0;
qnDate1  DATE;
qnDate2  DATE;
qnTimes  NUMBER := 3;
BEGIN
   IF  qnMONTHS <1 THEN
       RETURN 1;
   END IF;
   qnTimes := qnMONTHS;
   qnDate1 := LEAST(qnDateLo , qnDateHi);
   qnDate2 := GREATEST(qnDateLo , qnDateHi);
   WHILE  MY_ADD_MONTHS(qnDate1, qnTimes * qnResult ) <= qnDate2
   LOOP
    qnResult := qnResult + 1;
   END LOOP;
   RETURN qnResult;
END MONTHS_AMOUNT;
----------------------------------
FUNCTION EXTRACT_WORD(ewPos IN NUMBER, ewSource IN VARCHAR2, ewDelim IN VARCHAR2 := ';') RETURN VARCHAR2
IS
  ewIndex NUMBER;
  ewStart NUMBER;
BEGIN
  IF ewPos <= 0 THEN
    RETURN NULL;
  ELSIF ewPos = 1 THEN
    ewStart:=1;
  ELSE
    ewStart:=1+INSTR(ewSource, ewDelim, 1, ewPos-1);
    IF ewStart=1 THEN RETURN NULL; END IF;
  END IF;
  ewIndex:=ewStart;
  WHILE (ewIndex<=LENGTH(ewSource)) AND NOT (SUBSTR(ewSource,ewIndex,1)=ewDelim)
  LOOP
    ewIndex:=ewIndex+1;
  END LOOP;
  RETURN SUBSTR(ewSource,ewStart,ewIndex-ewStart);
END;
----------------------------------
function Pattern_Count(wcString in varchar2, wcSubString in varchar2) return number
as
  wcResult number := 0;
  wcPos number;
begin
  wcPos := 0;
  loop
    wcPos := instr(wcString, wcSubString, wcPos + 1);
    exit when wcPos = 0;
    wcResult := wcResult + 1;
  end loop;
  return wcResult;
end Pattern_Count;
----------------------------------.
  function Get_Tools_Table(Params varchar2) return T_Tools_Table
  IS
    v_Exit number :=0;
    i number := 0;
    v_Start_Char_Place number := 1;
    v_Equal_Char_Place number := 0;
    v_Finish_Char_Place number;
    v_Tools_Table T_Tools_Table := T_Tools_Table();
    v_Par_Name varchar2(200);
    v_Par_Value varchar2(2000);
    v_Params varchar2(2000);
    v_Len number;
  BEGIN
    v_Tools_Table.delete;
    v_Params := replace(Params,']','');
    v_Len := length(v_Params);
    while v_Exit = 0
    loop
      --get param name
      i := i + 1;
      v_Finish_Char_Place := instr(v_Params,'[',v_Start_Char_Place + 1);
      v_Equal_Char_Place := instr(v_Params,'=',v_Start_Char_Place + 1);
      IF v_Finish_Char_Place = 0 then
        v_Finish_Char_Place := v_Len + 1;
        v_Exit := 1;
      END IF;
      v_Par_Name := substr(v_Params, v_Start_Char_Place + 1, v_Equal_Char_Place - v_Start_Char_Place - 1 );
      v_Par_Value := substr(v_Params, v_Equal_Char_Place + 1, v_Finish_Char_Place - v_Equal_Char_Place - 1 );
      v_Tools_Table.extend;
      v_Tools_Table(i).ParamName := v_Par_Name;
      v_Tools_Table(i).ParamValue := v_Par_Value;

      v_Start_Char_Place := v_Finish_Char_Place;

    END loop;
    return v_Tools_Table;
  END Get_Tools_Table;
----------------------------------.
  -- Функция - аналог set_param, но результат возвращается функцией
  -- %param spString - Строка параметров
  -- %param spParam  - Наименование параметра
  -- %param spValue  - Значение
 /* function GetRaramStrSet(spString in varchar2, 
                          spParam  in varchar2, 
                          spValue  in varchar2) return varchar2 is
      res varchar2(32000);
    begin
      res := spString;
      set_param(spString => res, spParam => spParam, spValue => spValue);
    return res;
    end GetRaramStrSet;*/
    
END PTOOLS;
/
