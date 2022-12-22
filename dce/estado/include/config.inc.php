<?php
/* define database connection information */
$cfg['dbHost'] = "localhost";   // your database hostname
$cfg['dbUser'] = "locadora";      // your database username
$cfg['dbPass'] = "987000";      // your database password
$cfg['dbName'] = "estado";      // your database name


/* define general website inforamtion */
$cfg['sitename'] = "Vitrola";
$cfg['siteurl'][] = "http://www.vitrolalocadora.com";   // list all of your possible url here
$cfg['siteurl'][] = "http://vitrolalocadora.com";



/* select language file in 'lang' directory */
$cfg['langFile'] = "english.php";


/* choose pages counter's title options */
$cfg['pagestats'] = "fulladd";   // fulladd: url with _GET variables, like index.php?action=make
								 // filename: count with filename only, like index.php or article.php
								 // title: html title (not suggest for high performace website)
								 // DEFAULT: 'fulladd'


/* set the permission for yor statistics */
$cfg['public'] = TRUE;   // change it to FALSE if you don't want public your statistics

$cfg['username'] = "locadora";      // statistics access username and password, just ignore this if
$cfg['password'] = "987000";		// you set $cfg['public'] to TRUE
?>