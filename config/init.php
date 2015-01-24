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



    define('URL', 'http://localhost/negma/');
    define('PATH', $_SERVER['DOCUMENT_ROOT'].'/negma/');
    // LOCAL variable que define si el sitio esta local o en linea, si esta en linea el valor debe ser null sino debe ser /sitio/
    define('LOCAL', '/negma/');
    define('SITENAME', 'negma pro');
    define('DBNAME', 'couch');
    define('HOST', 'localhost');
    define('USER', 'root');
    define('PASSWORD', 'root');

  

    $files = glob(PATH.'vendor/*.php');
 

    foreach ($files as $file) {
         

        

        require_once $file;
        

    }



?>