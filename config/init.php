<?php


    /*
    |--------------------------------------------------------------------------
    | Configuracion General
    |--------------------------------------------------------------------------
    |
    |
    */
    
    //echo ini_get('display_errors');
    // error_reporting(E_ALL); 



    define('URL', 'http://localhost/couch/');
    define('PATH', $_SERVER['DOCUMENT_ROOT'].'/couch/');
    // LOCAL variable que define si el sitio esta local o en linea, si esta en linea el valor debe ser null sino debe ser /sitio/
    define('LOCAL', '/couch/');
    define('SITENAME', 'couch');
    define('DBNAME', 'couch');
    define('HOST', 'localhost');
    define('USER', 'root');
    define('PASSWORD', 'root');

  

    $files = glob(PATH.'/vendor/*.php');
 

    foreach ($files as $file) {
         

        

        require_once $file;
        

    }



?>