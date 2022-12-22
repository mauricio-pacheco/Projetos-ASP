<?php
/**************************************************************************/
/* PHP-NUKE: Advanced Content Management System                           */
/* ============================================                           */
/*                                                                        */
/* This is the language module with all the system messages               */
/*                                                                        */
/* If you made a translation, please go to the site and send to me        */
/* the translated file. Please keep the original text order by modules,   */
/* and just one message per line, also double check your translation!     */
/*                                                                        */
/* You need to change the second quoted phrase, not the capital one!      */
/*                                                                        */
/* If you need to use double quotes (") remember to add a backslash (\),  */
/* so your entry will look like: This is \"double quoted\" text.          */
/* And, if you use HTML code, please double check it.                     */
/**************************************************************************/
/* Translated to English from Brazilian Portuguese by:                    */
/**************************************************************************/
/* Luiz Gustavo Aleagi Nunes - aleagi - tatau                             */
/* aleagi@phpnuke.org.br - aleagi@gmail.com.br                            */
/* Comunidade PHP-Nuke Brasil - CNB - http://phpnuke.org.br               */
/**************************************************************************/
/* NOTE: English is NOT my first language, so if you have some suggestion */
/*       to made, please send it to me. @;D Thanx!                        */
/**************************************************************************/



define("_LAN_01","PHP-Nuke Install Program ( ALL versions )");
define("_LAN_02","Courtesy:");
define("_LAN_03","Intro");
define("_LAN_04","Conection");
define("_LAN_05","Tables");
define("_LAN_06","Prefix");
define("_LAN_07","Rename prefix");
define("_LAN_08","Ready");
define("_LAN_09","This is the digital ey for your site. It´s very important that you cahnge it. DON´T LEAVE THE DEFAULT VALUE!!!<br />You can use anything!!!");
define("_LAN_10","Security level: allows you to use or not the Security Code. <br />Recommended: <b>Level 7</b>");
define("_LAN_11","If you have a subscription option in your site type the URL here! <br /><br />Version: <b>7.1+</b>");
define("_LAN_12","Here you can type the words that will be censored in your portal. <br /><br />To include new words, just follow the example. <br /><br />Comma separate list. Attention: the words must be between quotation marks.");
define("_LAN_13","Here you can define the HTML tags that could be used in your portal. <br /><br />To inclulde a new one, just follow the examples. <br /><br />Comma separate list. Attention: the words must be between quotation marks. <br /><br />Recommendation: Don´t change it!.");
define("_LAN_14","MySQL server where is the DataBase... Please, verify the MySQL server name. <br />Default: <b>localhost</b>");
define("_LAN_15","Username to connect in the Database. Don´t forget to create a new user before we continue...<br />You can\´t use spaces or special characters. Ex.: <b>nuke_site</b>");
define("_LAN_16","Password used to connect in the Database. <b>REcommendation:</b> Use alphanumeric characters. <br />You CAN´T use space. ie.: <b>x6r#2p5</b>");
define("_LAN_17","The name of the Database. Some server don´t allow to create database using this scripts. So, if you can´t create the database from here, create one using your control Panel account, then return here to install the tables. <br />You CAN´T use spaces or special characters. Ex.: <b>nuke_site</b>");
define("_LAN_18","Name of the file that contain the sql instructions used to create de basic tables in the Database. This file MUST be in /'install/' <br /> ie. <b>nuke.sql</b>");
define("_LAN_19","This page was generated in:");
define("_LAN_20","seconds");
define("_LAN_21","by:");
define("_LAN_22","and");
define("_LAN_23","This Web Instalator is a FREE SFTWARE released under");
define("_LAN_24","GNU/GPL License");
define("_LAN_25","is");
define("_LAN_26","from");
define("_LAN_27","Intro");
define("_LAN_28","Welcome to the PHP-Nuke Web Instalator.<br /><br />
If you follow correctly the steps below, in a few minutes you´ll have your PHP-Nuke portal running and ready to receive your content!<br />
Before we continue...:<br /><br />
<li>Change the CHMOD permission of the file <b>config.php</b> to <b><font color=\"#FF0033\">666</font></b>. This file is in the root directory of your PHP ( for *NIX servers ONLY );</li>
<li>Copy the file <b>nuke.sql</b> from your PHP-Nuke package to the <b>INSTALL</b> directory;</li>
<li>Get the following data:</li><br /><br />
&nbsp;&nbsp;&nbsp;1- Server name or IP from your MySQL server ( usually: <b><i>localhost</i></b> );<br />
&nbsp;&nbsp;&nbsp;2- The username used to connect to the Database;<br />
&nbsp;&nbsp;&nbsp;3- The correspondent password;<br />
&nbsp;&nbsp;&nbsp;4- The name of the Database.<br /><br />
<b>Obs:</b> <li>In some servers you´ll have to create the Database using the Control Panel. the same for the username and password.</li>
<li>To upgrade your PHP-Nuke, use the correspondent upgrade script that can be found in the ugrades directory of your PHP-Nuke package.</li>");
define("_LAN_29","Database conection");
define("_LAN_30","Fill the form:");
define("_LAN_31","Server name:");
define("_LAN_32","Username:");
define("_LAN_33","Password:");
define("_LAN_34","Database name:");
define("_LAN_35","SQL file name:");
define("_LAN_36","Table prefix");
define("_LAN_37","Useres prefix");
define("_LAN_38","ATTENTION");
define("_LAN_39","Click just once in the <b>N E X T</b> and wait until the proccess is finished. It coult take several minutes, depending of the file size.");
define("_LAN_40","Creating tables");
define("_LAN_41","Ooooops... Houston, we have a problem... <br /><br /><font color=\"red\"><b>Server error message:</b></font>");
define("_LAN_42","The tables was created sucessfully!!!");
define("_LAN_43","Configuring ( CONFIG.PHP )");
define("_LAN_44","Please, fill the following form: <br /><br /><b>Obs.: </b>The config.php file MUST have write access <b>CHMOD 666</b> and be located in the root of your PHP-Nuke directory.");
define("_LAN_45","Site Key: <i>(sitekey)</i>");
define("_LAN_46","CHANGE THIS!!!");
define("_LAN_47","Security LEvel: <i>(gfx_chk)</i>");
define("_LAN_48","Database Server:");
define("_LAN_49","Level");
define("_LAN_50","URL subscription (7.1+): <i>(subscription_url)</i>");
define("_LAN_51","Bad words list:<br /><i>Include new ones as the example</i>");
define("_LAN_52","Allowed HTML tags:<br /><i>Include new ones as the example</i>");
define("_LAN_53","click ONCE in the <b>N E X T</b> button and wait until the end of the process.");
define("_LAN_54","\"bitch\", \"viado\", \"gay\"");
define("_LAN_55","Error");
define("_LAN_56","Oooops... That was an error when trying to write in the config.php file!<br /><br />
The major reasons to this:
<li>The config.php IS NOT seted with <b>CHMOD 666</b>;</li>
<li>The config.php file IS NOT in the root directory;</li><br /><br />
Some help:
<li>Using a FTP client ( REad the help file of the client to know how to change the CHMOD permissions ), change the CHMOD of the file config.php to <b>666</b>;</li>
<li>Send the config.php fle to the root of your PHP-Nuke;</li><br /><br /><br />
<b><center>Back and try again</center></b>");
define("_LAN_57","Rename prefixes");
define("_LAN_58","This is the last step of the instalation process!<br /><br />
All the table prefixes are being changed to ");
define("_LAN_59","<b>Rename tables prefix script is courtesy of</b>");
define("_LAN_60","Translated by:");
define("_LAN_61","Implementations by:");
define("_LAN_62","Comunidade PHP-Nuke Brasil - CNB");
define("_LAN_63","Developed by:");
define("_LAN_64","<center><h3>The prefix name was <b>SUCESSFULLY</b> changed</h3>
</center><br><br><br>
<b>Suas Your tables are now named:</b><br><br>");
define("_LAN_65","Ready");
define("_LAN_66","Your PHP-Nuke is instaled and ready to be used!.<br /><br />
For security reasons the best idea is to create the Super User ( Superadmin ), accessing the administration session, by clicking in the \"NEXT\" button.<br /><br />
DON´T FORGET to change the CHMOD PERMISSION of the CONFIG.PHP file to <b>644</b><br /><br /><hr />
<center><b>Thank you for using the PHP-Nuke Web Installer.</b><br /><br />And don´t forget to visit our portals: <a href=\"http://www.xnuke.com.br\" target=\"_blank\">XPK_FENIX</a> e <a href=\"http://www.phpnuke.org.br\" target=\"_blank\">aleagi</a>!</center>");
define("_LAN_68","The server was not selected.");
define("_LAN_69","The Database was not selected.");
define("_LAN_70","SQL file was not present. PLEASE send it to the INSTALL directory: ");
define("_LAN_71","Select your language:");
define("_LAN_72","Language");
define("_LAN_73","Please, type the prefix to be used in your PHP-Nuke Database. ( <b>CHANGE IT!!! Don´t use \"nuke\"</b> )");
define("_LAN_74","PHP-Nuke Web Installer v1.3 XPK_FENIX & Aleagi");
define("_LAN_75","ERROR");
define("_LAN_76","Please, verify the Username, the password and the name of the Database!!! ( You should get it from your host server ).");
define("_LAN_77","N E X T");
define("_LAN_78","B A C K");
define("_LAN_79","change");

define("_LAN_80","Localização");
define("_LAN_81","Ajuda Online");
?>