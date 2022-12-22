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
if ($radminsuper == 1) { 

    $num = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_authors WHERE aid='$add_aid'"));
    if ($num > 0) {
        $pagetitle = ": "._USERADMIN." - "._PROMOTEUSER;
        include("header.php");
        title(_USERADMIN." - "._PROMOTEUSER);
        amain();
        echo "<br>\n";
        OpenTable();
        echo "<center><b>"._NAMEERROR."<b></center><br>";
        CloseTable();
        include("footer.php");
    } else {
	//[vecino398(curt)]  www.vecino398.com -Modification- 
	if   ($Version_Num >= 7.5)  { 
       $add_pwd = md5($add_pwd); 
        for ($i=0; $i < sizeof($auth_modules); $i++) { 
            $row = $db->sql_fetchrow($db->sql_query("SELECT admins FROM ".$prefix."_modules WHERE mid='$auth_modules[$i]'")); 
            $adm = "$row[admins]$add_name"; 
            $db->sql_query("UPDATE ".$prefix."_modules SET admins='$adm,' WHERE mid='$auth_modules[$i]'"); 
        } 
         $add_password = check_html($add_password, 'nohtml');
         $add_aid = check_html($add_aid, 'nohtml');
         $add_name = check_html($add_name, 'nohtml');
         $add_url = check_html($add_url, 'nohtml');
         $add_email = check_html($add_email, 'nohtml');
         $add_password = check_html($add_password, 'nohtml');
         $add_radminsuper = intval($add_radminsuper);
         $add_admlanguage = check_html($add_admlanguage, 'nohtml');
        $result = $db->sql_query("insert into " . $prefix . "_authors values ('$add_aid', '$add_name', '$add_url', '$add_email', '$add_password', '0', '$add_radminsuper', '$add_admlanguage')"); 
    } 
    elseif ($Version_Num >= 7.4){ 
    
    $add_aid = check_html($add_aid, 'nohtml');
    $add_name = check_html($add_name, 'nohtml');
    $add_url = check_html($add_url, 'nohtml');
    $add_email = check_html($add_email, 'nohtml');
    $add_password = check_html($add_password, 'nohtml');
    $add_radminarticle = intval($add_radminarticle);
    $add_radmintopic = intval($add_radmintopic);
    $add_radminuser = intval($add_radminuser);
    $add_radminsurvey = intval($add_radminsurvey);
    $add_radminlink = intval($add_radminlink);
    $add_radminfaq = intval($add_radminfaq);
    $add_radmindownload = intval($add_radmindownload);
    $add_radminreviews = intval($add_radminreviews);
    $add_radminnewsletter = intval($add_radminnewsletter);
    $add_radminforum = intval($add_radminforum);
    $add_radmincontent = intval($add_radmincontent);
    $add_radminency = intval($add_radminency);
    $add_radminsuper = intval($add_radminsuper);
    $add_admlanguage = check_html($add_admlanguage, 'nohtml');
    $result = $db->sql_query("insert into " . $prefix . "_authors values ('$add_aid', '$add_name', '$add_url', '$add_email', '$add_password', '0', '$add_radminarticle','$add_radmintopic','$add_radminuser','$add_radminsurvey','$add_radminlink','$add_radminfaq','$add_radmindownload','$add_radminreviews','$add_radminnewsletter','$add_radminforum','$add_radmincontent','$add_radminency','$add_radminsuper','$add_admlanguage')");
    } 
    else { 
    
    $add_aid = check_html($add_aid, 'nohtml');
    $add_name = check_html($add_name, 'nohtml');
    $add_url = check_html($add_url, 'nohtml');
    $add_email = check_html($add_email, 'nohtml');
    $add_password = check_html($add_password, 'nohtml');
    $add_radminarticle = intval($add_radminarticle);
    $add_radmintopic = intval($add_radmintopic);
    $add_radminuser = intval($add_radminuser);
    $add_radminsurvey = intval($add_radminsurvey);
    $add_radminlink = intval($add_radminlink);
    $add_radminfaq = intval($add_radminfaq);
    $add_radmindownload = intval($add_radmindownload);
    $add_radminreviews = intval($add_radminreviews);
    $add_radminnewsletter = intval($add_radminnewsletter);
    $add_radminforum = intval($add_radminforum);
    $add_radmincontent = intval($add_radmincontent);
    $add_radminency = intval($add_radminency);
    $add_radminsuper = intval($add_radminsuper);
    $add_admlanguage = check_html($add_admlanguage, 'nohtml');
    $result = $db->sql_query("insert into " . $prefix . "_authors values ('$add_aid', '$add_name', '$add_url', '$add_email', '$add_password', '0', '$add_radminarticle','$add_radmintopic','$add_radminuser','$add_radminsurvey','$add_radminsection','$add_radminlink','$add_radminephem','$add_radminfaq','$add_radmindownload','$add_radminreviews','$add_radminnewsletter','$add_radminforum','$add_radmincontent','$add_radminency','$add_radminsuper','$add_admlanguage')");
        }
		/////////////////////END/////////////////////////////	 
        if (!$result) {
            $pagetitle = ": "._USERADMIN." - "._PROMOTEUSER;
            include("header.php");
            title(_USERADMIN." - "._PROMOTEUSER);
            amain();
            echo "<br>\n";
            OpenTable();
            echo "<center><b>"._ADDERROR."<b></center><br>";
            CloseTable();
            include("footer.php");
        } else {
            $pagetitle = ": "._USERADMIN." - "._PROMOTEUSER;
            include("header.php");
            title(_USERADMIN." - "._PROMOTEUSER);
            amain();
            echo "<br>\n";
            OpenTable();
            echo "<center><b>"._USERPROMOTED."<b></center>";
            CloseTable();
            include("footer.php");
            if ($ya_config['servermail'] == 0) {
                $message = _SORRYTO." $sitename "._HASPROMOTE;
                $subject = _ACCTPROMOTE;
                $from  = "From: $adminmail\r\n";
                $from .= "Reply-To: $adminmail\r\n";
                $from .= "Return-Path: $adminmail\r\n";
                mail($add_email, $subject, $message, $from);
            }
        }
        if ($add_radminforum == "1") { $db->sql_query("UPDATE ".$user_prefix."_users SET user_level='2' WHERE user_id='$chng_uid'"); }
    }

}else{
header("Location: ../../../index.php");
    die ();
}

?>