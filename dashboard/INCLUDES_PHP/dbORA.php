<?php

// Работа с БД ORACLE
// 
//---------------------Общие фкнкции ORACLE--------------------------//
//Соединение с ORACLE
function getOracleSesion($database) {

    if (empty($database)) {
        echo '<script>alert("База данных не указана!");</script>';
    }
    $login = "";
    $password = "";
    switch ($database) {
        case "KRIMDSS":
            $login = "";
            $password = "";
            break;
        case "COTA_TEST":
            $login = "";
            $password = "";
            break;
        case "DWH":
            $login = "";
            $password = "";
            break;
    }

    if (isset($login) and isset($password) /* and isset($_SESSION['server']) */) {
        $link = OCILogon($login, $password, $database. ".world", 'AL32UTF8' /* $_SESSION['login'], $_SESSION['password'], $_SESSION['server'], 'AL32UTF8' */);
    } else {
        //   header('Location:dblogin.php');
        exit;
    }
    if (!$link) {
        echo '<script>alert("Ошибка при соединении с ORACLE !");</script>';
        // printf("Ошибка при соединении с ORACLE !");
        exit();
    }

    /* if ( $link) { 
      echo " Cоединение с ORACLE открыто !";
      // printf(" Cоединение с ORACLE открыто !");
      //exit();
      } */
    return $link;
}

// Функция select - а из запроса
function sql_select($a_sql, $database) {
    $items = array();

    //Коннектимся к ORACLE
    $link = getOracleSesion($database);



    // Подготовка выражения
    $stid = oci_parse($link, $a_sql);

    // echo($_SESSION['login']) ;
    // echo ($_SESSION['password']);
    //   echo (a_sql);
    /*  if (!$stid) {
      $e = oci_error($link);
      echo (htmlentities($e['message'], ENT_QUOTES));
      //  @trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
      } */

    // Выполним логику запроса
    $r = oci_execute($stid);
    // echo   $r; 

    /* if (!$r) {
      $e = oci_error($stid);
      // @trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
      } */

    $i = 0;

    while ($row = oci_fetch_array($stid, OCI_ASSOC + OCI_RETURN_NULLS + OCI_RETURN_LOBS)) {
        $items[$i] = array();
        $i_col = 0;
        foreach ($row as $item) {
            $items[$i][$i_col] = /* iconv ("CP1251", "UTF-8", */ $item; /* ); */ //Перекодируем в UTF-8
            // $items[$i][$i_col] = ($item !== null ? htmlentities($item, ENT_QUOTES,"UTF-8") : "") ;
            $i_col++;
        }
        $i++;
    }

    OCILogoff($link);

    return $items;
}

// Функция select - а из запроса
function sql_select_j($a_sql, $database, $asJson, $ERR) {


    $items = array();

    //Коннектимся к ORACLE
    $link = getOracleSesion($database);


    // Подготовка выражения
    $stid = oci_parse($link, $a_sql);

    // Выполним логику запроса
    $r = oci_execute($stid);
    // echo   $r; 

    $item = oci_fetch_all($stid, $res, null, null, OCI_FETCHSTATEMENT_BY_ROW + OCI_ASSOC);

    oci_free_statement($stid);

    $ERR = oci_error();
    oci_close($link);

  
    if ($asJson === 'JSON') {
        return json_encode($res, JSON_UNESCAPED_UNICODE | JSON_NUMERIC_CHECK); 
      
      //  return  str_replace("]\"", "]", str_replace("\"[", "[", $item));  
    } else {
        return $res;
    }
}

//---------------------END Общие фкнкции ORACLE--------------------------//

/* function Get_data($date1, $date2) {
  $sSQL = "select * from rep_serv.REPORTS t";

  $items = array();
  $items = sql_select($sSQL);


  return $items;
  }

  function Get_data_detail($date1, $date2) {
  $sSQL = "select * from rep_serv.REPORTS_PARAMS t";

  $items = array();
  $items = sql_select($sSQL);


  return $items;
  } */
function Get_count_client() {
    $sSQL = "select 
               case
                when Type_doc=5 and sub_type =0 then
                 'ФЗ лица - '||count(*)   
                when Type_doc=4 and sub_type =0 then
                 'Юр лица - '||count(*)
                when Type_doc=4 and sub_type =1 then
                    'ИП лица - '||count(*)
                end
            from mbank.clients_all where Type_doc in (4,5) and  sub_type in (0,1) group by Type_doc,sub_type ";

    $items = array();
    $items = sql_select($sSQL, "KRIMDSS");

    return $items;
}

function Get_count_contract() {
    $sSQL = "select case
               when Type_client=5 then
               'Договора ФЗ лица - '||count(*)   
               when Type_client=4  then
               'Договора ЮР лица - '||count(*)  
               end ,Type_client dummy 
             from mbank.contracts_all a where Type_client in (4,5)  group by Type_client order by Type_client desc";

    $items = array();
    $items = sql_select($sSQL, "KRIMDSS");

    return $items;
}

function Get_count_account() {
    $sSQL = "select count(*)
                from account_all
               where bal like '4%'
                 and subdepartment like '401%'
                 and header = 'A'
                 and close_date is null
";

    $items = array();
    $items = sql_select($sSQL, "KRIMDSS");

    return $items;
}

function Get_data_bal($date1, $date2, $bal_type, $curr) {

    $bal_type = str_replace(",", "','", $bal_type);
    $curr = str_replace(",", "','", $curr);
 //   print_r (implode(",",$curr) );
    $sSQL = "select b.rk||b.currency_ccd||to_char(b.balance_date,'yyyymmdd') as ID1,
                b.*, to_char(b.balance_date,'dd.mm.yyyy') as BALANCE_DATE1
             from reports.DTM_BANK_BALANCE b
             where BALANCE_DATE = to_date('" . $date1 . "','dd.mm.yyyy')
               and BALANCE_TYPE in ('" . $bal_type . "')
               and CURRENCY_CCD in ( '" . $curr . "')";
    /* and BALANCE_DATE <= to_date('" . $date1 . "','dd.mm.yyyy') */
  
  //  echo ( $sSQL);
    $items = array();
    $r = '';
    $items = sql_select_j($sSQL, "DWH", 'JSON', $r);
    //  $items = sql_select($sSQL, "DWH");


    return $items;
}

function Get_data_detail($POST) {
    
    
   // $sSQL = "select b.*, to_char(b.balance_date,'dd.mm.yyyy') from reports.dtm_bank_balance_dtl b where b.id = '" . $id . "'";
   
    if ($POST['BBBU'] == 'BU'){
      $sSQL = "WITH
                      acc_ag as
                       (select count(ax.acc_rk), ax.acc_rk
                          from dds.account a
                          join dds.agreem_x_acc ax
                            on a.account_rk = ax.acc_rk
                           and ax.valid_to_dttm = dt_inf(1)
                           and to_date(:bdate, 'dd.mm.yyyy') between ax.effective_from_dt and
                               ax.effective_to_dt
                         where a.valid_to_dttm = dt_inf(1)
                           and a.currency_ccd = :currency_ccd
                         group by ax.acc_rk
                        having count(ax.acc_rk) = 1)

                      select /*+parallel(8)*/

                       :BDATE AS BALANCE_DATE,
                       BAL.RK,
                       BAL.BALANCE_ARTICLE_NM,
                       BA.BALANCE_ACCOUNT_NUMBER,
                       A.ACCOUNT_NUMBER,
                       A.ACCOUNT_DESC,
                       A.CURRENCY_CCD,
                       R.REST_AMT,
                       R.REST_AMT_NC,
                       A.BRANCH_SERVICE_CCD,
                       BR.BRANCH_NM,
                       nvl(BR.BUSINESS_GROUP_NM,'-') as BUSINESS_GROUP_NM,
                       nvl(XREF.COUNTERPARTY_GROUP_NM,'-') as COUNTERPARTY_GROUP_NM,
                       nvl(P.CCD,'-') as CCD,
                       nvl(P.PRODUCT_NM,'-') as PRODUCT_NM

                        from dds.account_rest r
                        join dds.account a
                          on r.account_rk = a.account_rk
                         and a.source_system_ccd = '001'
                         and a.valid_to_dttm = dt_inf(1)
                         and a.currency_ccd = :currency_ccd
                        join dds.balance_account ba
                          on a.balance_account_rk = ba.balance_account_rk
                         and ba.valid_to_dttm = dt_inf(1)
                        join dds.account_pic_attr_value attr
                          on r.account_rk = attr.account_rk
                         and attr.valid_to_dttm = dt_inf(1)
                         and attr.account_pic_attr_rk = 3
                         and r.account_rk not in ('6230166', '7322615')
                        join dds.xref_balance_article bal
                          on attr.account_pic_attr_value = :rk
                         and bal.valid_to_dttm = dt_inf(1)
                         and bal.rk = :rk
                        left join dds.xref_branch br
                          on a.branch_service_ccd = br.ccd
                         and br.valid_to_dttm = dt_inf(1)
                        left join DDS.CNTRP_UNIFICATION uni
                          on a.cntrp_ccd = uni.cntrp_ccd
                         and uni.valid_to_dttm = dt_inf(1)
                        left join dds.counterp_x_counterp_group gr
                          on uni.cntrp_rk = gr.counterparty_rk
                         and gr.source_system_ccd = '007'
                         and gr.valid_to_dttm = dt_inf(1)
                         and to_date(:bdate, 'dd.mm.yyyy') between gr.effective_from_dt and
                             gr.effective_to_dt
                        left join dds.xref_counterparty_group xref
                          on gr.counterparty_group_rk = xref.rk
                         and xref.valid_to_dttm = dt_inf(1)
                        left join acc_ag
                          on r.account_rk = acc_ag.acc_rk
                        left join dds.agreem_x_acc ax
                          on acc_ag.acc_rk = ax.acc_rk
                         and ax.valid_to_dttm = dt_inf(1)
                         and to_date(:bdate, 'dd.mm.yyyy') between ax.effective_from_dt and
                             ax.effective_to_dt

                        left join dds.agreem_x_product pr
                          on ax.agreem_rk = pr.agreem_rk
                         and pr.valid_to_dttm = dt_inf(1)
                         and to_date(:bdate, 'dd.mm.yyyy') between pr.effective_from_dt and
                             pr.effective_to_dt
                        left join dds.xref_product p
                          on pr.product_rk = p.rk
                         and p.valid_to_dttm = dt_inf(1)
                       where r.logic_system_ccd = '001'
                         and r.source_system_ccd = '001'
                         and r.valid_to_dttm = dt_inf(1)
                       -- and  r.effective_from_dt < to_date(:bdate,'dd.mm.yyyy')
                      --  and  r.effective_to_dt >= to_date(:bdate,'dd.mm.yyyy')+1
                         and to_date(:bdate, 'dd.mm.yyyy') between r.effective_from_dt and r.effective_to_dt
                             ";
    } elseif ($POST['BBBU'] == 'BB') {
        $sSQL = "WITH
     acc_ag as ( select count(ax.acc_rk), ax.acc_rk
               from dds.account a
                 join dds.agreem_x_acc ax on   a.account_rk = ax.acc_rk and ax.valid_to_dttm = dt_inf(1)                                                                       
                                          and to_date(:bdate,'dd.mm.yyyy') between ax.effective_from_dt and ax.effective_to_dt  
                where a.valid_to_dttm = dt_inf(1) 
                      and a.currency_ccd = :currency_ccd           
                group by  ax.acc_rk
                having count(ax.acc_rk)=1      )
   
  
            select /*+parallel(8)*/
                    :BDATE  as BALANCE_DATE
                    ,BA.BALANCE_ACCOUNT_RK  as RK
                    ,BA.BALANCE_ACCOUNT_DESC as BALANCE_ARTICLE_NM
                    ,BA.BALANCE_ACCOUNT_NUMBER             
                    ,to_char(A.ACCOUNT_NUMBER) as ACCOUNT_NUMBER
                    ,A.ACCOUNT_DESC
                    ,A.CURRENCY_CCD
                    ,R.REST_AMT, R.REST_AMT_NC
                    ,A.BRANCH_SERVICE_CCD
                    ,BR.BRANCH_NM
                    ,nvl(BR.BUSINESS_GROUP_NM,'-') as BUSINESS_GROUP_NM                   
                    ,nvl(XREF.COUNTERPARTY_GROUP_NM,'-') as  COUNTERPARTY_GROUP_NM
                    ,nvl(P.CCD,'-')  as CCD
                    ,nvl(P.PRODUCT_NM,'-') as PRODUCT_NM                                  
            from dds.account_rest r
             join dds.account a on r.account_rk = a.account_rk and a.source_system_ccd = '001' and a.valid_to_dttm = dt_inf(1)
                                 and a.currency_ccd = :currency_ccd
             join dds.balance_account ba on a.balance_account_rk = :rk and ba.valid_to_dttm = dt_inf(1)
                                          and  ba.balance_account_rk = :rk           
            left join dds.xref_branch br on a.branch_service_ccd = br.ccd and br.valid_to_dttm = dt_inf(1)
            left join DDS.CNTRP_UNIFICATION uni on a.cntrp_ccd=uni.cntrp_ccd and uni.valid_to_dttm = dt_inf(1)
            left join dds.counterp_x_counterp_group gr on uni.cntrp_rk=gr.counterparty_rk and gr.source_system_ccd='007' 
                                                         and gr.valid_to_dttm = dt_inf(1)                 
                                                         and to_date(:bdate,'dd.mm.yyyy') between gr.effective_from_dt and gr.effective_to_dt
            left join dds.xref_counterparty_group xref on gr.counterparty_group_rk=xref.rk and xref.valid_to_dttm = dt_inf(1)     
            
            left join  acc_ag on r.account_rk = acc_ag.acc_rk
                 left join  dds.agreem_x_acc ax on acc_ag.acc_rk = ax.acc_rk and ax.valid_to_dttm = dt_inf(1)                                                                       
                                                 and to_date(:bdate,'dd.mm.yyyy') between ax.effective_from_dt and ax.effective_to_dt  
                 left join  dds.agreem_x_product pr on ax.agreem_rk = pr.agreem_rk and pr.valid_to_dttm = dt_inf(1)
                                                and to_date(:bdate,'dd.mm.yyyy') between pr.effective_from_dt and pr.effective_to_dt
                                              
                 left join dds.xref_product p on pr.product_rk = p.rk and p.valid_to_dttm = dt_inf(1)  
            where r.logic_system_ccd= '001' and r.source_system_ccd = '001' and r.valid_to_dttm = dt_inf(1) 
             -- and  r.effective_from_dt < to_date(:bdate,'dd.mm.yyyy')
             -- and  r.effective_to_dt >= to_date(:bdate,'dd.mm.yyyy')+1
            and to_date(:bdate,'dd.mm.yyyy') between r.effective_from_dt and r.effective_to_dt";
    }
    
   
    $items = array();
    
    $link = getOracleSesion("DWH");
    $stid = oci_parse($link, $sSQL);
    
    
    oci_bind_by_name($stid, ':rk', $POST["RK"], 4000);
    oci_bind_by_name($stid, ':currency_ccd', $POST["CUR"], 4000);
    oci_bind_by_name($stid, ':bdate', $POST["BAL_DATE"], 4000);
    
    // Выполним логику запроса
    $r = oci_execute($stid);
    // echo   $r; 

    $item = oci_fetch_all($stid, $res, null, null, OCI_FETCHSTATEMENT_BY_ROW + OCI_ASSOC);

    oci_free_statement($stid);
    
    $ERR = oci_error();
    oci_close($link);

    return json_encode($res, JSON_UNESCAPED_UNICODE); 
    
    
    
   // print_r ($POST);
   // $items = sql_select($sSQL, "DWH");
    
    
  //  return $items;
}


?>