<?php

/*********************************************************************************/
/* CNB Your Account: An Advanced User Management System for phpnuke     		*/
/* ============================================                         		*/
/*                                                                      		*/
/* Copyright (c) 2004 by Comunidade PHP Nuke Brasil                     		*/
/* http://dev.phpnuke.org.br & http://www.phpnuke.org.br                		*/
/*                                                                      		*/
/* Contact author: escudero@phpnuke.org.br                              		*/
/* International Support Forum: http://ravenphpscripts.com/forum76.html 		*/
/*                                                                      		*/
/* This program is free software. You can redistribute it and/or modify 		*/
/* it under the terms of the GNU General Public License as published by 		*/
/* the Free Software Foundation; either version 2 of the License.       		*/
/*                                                                      		*/
/*********************************************************************************/
/* CNB Your Account it the official successor of NSN Your Account by Bob Marion	*/
/*********************************************************************************/

if (!defined('YA_ADMIN')) { echo "CNBYA admin protection"; exit; }
if (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) {
    header("Location: ../../../index.php");
    die ();
}
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }

if (($radminsuper==1) OR ($radminuser==1)) {

    ya_save_config('cookiecheck', $xcookiecheck);
    ya_save_config('cookiecleaner', $xcookiecleaner);
    ya_save_config('cookietimelife', $xcookietimelife, 'nohtml');
    ya_save_config('cookiepath', $xcookiepath, 'nohtml');
    ya_save_config('cookieinactivity', $xcookieinactivity, 'nohtml');

//    echo "<META HTTP-EQUIV=\"refresh\" content=\"2;URL=modules.php?name=$module_name&file=admin&op=UsersConfig\">";

    $pagetitle = ": "._COOKIECONFIG." - "._YA_USERS;
    include("header.php");
    title(_USERADMIN.": "._COOKIECONFIG);
    amain();
    echo "<br>\n";
    OpenTable();
    echo "<center><h4>"._YACONFIGSAVED."</h4></center>";
    echo "<table align=\"center\"><tr><td><form><input type=\"button\" value=\""._COOKIECONFIG."\" onclick=\"javascript:location='modules.php?name=".$module_name."&file=admin&op=CookieConfig';\"></form></td></tr></table>";
    CloseTable();
    include("footer.php");
}

?>