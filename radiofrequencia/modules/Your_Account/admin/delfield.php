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
    $pagetitle = ": "._USERADMIN." - "._DELFIELD;
    include("header.php");
    title(_USERADMIN." - "._DELFIELD);
    amain();
    echo "<br>\n";
    OpenTable();
  	echo "<center><table border='0'>\n";
    echo "<form action='modules.php?name=$module_name&file=admin&op=delFieldConf' method='post'>\n";
    echo "<tr><td>"._CONFIRMDELLFIELD." $fid?</td></tr>";
	echo "\n";
	echo "<tr><td align='center'><input type='hidden' name='fid' value='$fid'><input type='submit' value='"._DELFIELD."'></td></tr>\n";
    echo "</form>\n";
    echo "<form action='modules.php?name=$module_name&file=admin&op=addField' method='post'>\n";
    echo "<tr><td align='center'><input type='submit' value='"._CANCEL."'></td></tr>\n";
    echo "</form>\n";
    echo "</table>\n";
    CloseTable();
    include("footer.php"); 
}

?>