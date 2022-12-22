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

if (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) {
    header("Location: ../../../index.php");
    die ();
}
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }

    include("header.php");
    $avatarcatname = ereg_replace ("_", "&nbsp;", $avatarcategory);
    title($avatarcategory." "._YA_AVATARGALL);
    Opentable();
    nav();
    CloseTable();
    echo "<br>";
    Opentable();
    echo "<center><font class=\"title\"><b>"._AVAILABLEAVATARS." "._YA_ONCAT." ".$avatarcatname."</b></font><br><br>"; 
    echo "<b>"._YA_TOSELCTAVAT."</b><br><br></center>";
    Opentable2();
    echo "<center>";
	
    //avatarfix by menelaos dot hetnet dot nl
    $resultbc = $db->sql_query("SELECT * FROM ".$prefix."_bbconfig"); 
    while($rowbc = $db->sql_fetchrow($resultbc))
    {	$board_config[$rowbc[config_name]] = $rowbc[config_value];
    }
    $direktori = $board_config['avatar_gallery_path'];
    $d = dir("$direktori/$avatarcategory");
	
    $temcount = 1;
    while (false !== ($entry = $d->read())) {
        if( preg_match('/(\.gif$|\.png$|\.jpg|\.jpeg)$/is', $entry) ) {
            if( $entry != '.' && $entry != '..' && !is_file($d . '/' . $entry) && !is_link($d . '/' . $entry) ) {
                $patterns[0] = "/\.gif/";
                $patterns[1] = "/\.png/";
                $patterns[2] = "/\.jpg/";
                $patterns[3] = "/\.jpeg/";
                $patterns[4] = "/-/";
                $patterns[5] = "/_/";
                $replacements[5] = "";
                $replacements[4] = "&nbsp;";
                $replacements[3] = "";
                $replacements[2] = "";
                $replacements[1] = "";
                $replacements[0] = "";
                ksort($patterns);
                ksort($replacements);
                $entryname =  preg_replace($patterns, $replacements, $entry);
                $a=1;
                
                //avatarfix by menelaos dot hetnet dot nl
                echo "<a href=\"modules.php?name=$module_name&op=avatarsave&category=$avatarcategory&avatar=$entry\"><img src=\"$direktori/$avatarcategory/$entry\" border=\"0\" alt=\"$entryname\" title=\"$entryname\" hspace=\"10\" vspace=\"10\"></a>";
            }
            if ($temcount == 10) {
                echo "<br>";
                $temcount -= 10;
            }
            $temcount ++;
        }
    }
    echo "</center>";
    CloseTable2();
    echo "<center><br>"._GOBACK."<br></center>";
    $d->close();
    CloseTable();
    include("footer.php");

?>