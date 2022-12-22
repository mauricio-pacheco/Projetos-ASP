<?php
// define directory path
define('INCLUDEPATH', 'include/');
define('LANGPATH', 'lang/');
define('LIBPATH', 'lib/');

// require config file and database class
require_once(INCLUDEPATH . 'config.inc.php');
require_once(INCLUDEPATH . 'database.class.php');
require_once(INCLUDEPATH . 'functions.php');

// create database connection
$db = new database($cfg['dbHost'], $cfg['dbUser'], $cfg['dbPass'], $cfg['dbName']);
?>