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
    if (is_active("Private_Messages") AND ($username == $cookie[1]) AND ($usrinfo[user_password] == $cookie[2])) {
        echo "<br>";
        OpenTable();
      
        if (is_active("Members_List")) {
            $mem_list = "<a href=\"modules.php?name=Members_List\">"._BROWSEUSERS."</a>";
        } else {
            $mem_list = "";
        }
        if (is_active("Search")) {
            $mod_search = "<a href=\"modules.php?name=Search&type=users\">"._SEARCHUSERS."</a>";
        } else {
            $mod_search = "";
        }
        if ($mem_list != "" AND $mod_search != "") { $a = " | "; } else { $a = ""; }
        if ($mem_list != "" OR $mod_search != "") {
            $links = "[ $mem_list $a $mod_search ]";
        } elseif ($mem_list == "" AND $mod_search == "") {
            $links = "";
        }
        $ya_memname = htmlspecialchars($username);
        $uid = intval($uid);
        list($uid) = $db->sql_fetchrow($db->sql_query("select user_id from $user_prefix"._users." where username='$ya_memname'"));
        $ya_newpms = $db->sql_numrows($db->sql_query("select privmsgs_to_userid from $prefix"._bbprivmsgs." where privmsgs_to_userid='$uid' and (privmsgs_type='1' OR privmsgs_type='5')"));
        $ya_savpms = $db->sql_numrows($db->sql_query("select privmsgs_to_userid from $prefix"._bbprivmsgs." where privmsgs_to_userid='$uid' and privmsgs_type='3'"));
        $ya_oldpms = $db->sql_numrows($db->sql_query("select privmsgs_to_userid from $prefix"._bbprivmsgs." where privmsgs_to_userid='$uid' and privmsgs_type='0'"));
        $ya_outpms = $db->sql_numrows($db->sql_query("select privmsgs_from_userid from $prefix"._bbprivmsgs." where privmsgs_to_userid='$uid'and privmsgs_type='1'"));
        $ya_totpms = intval($ya_totpms);
        $ya_newpms = intval($ya_newpms);
        $ya_oldpms = intval($ya_oldpms);
        $ya_savpms = intval($ya_savpms);
        $ya_totpms = $ya_newpms + $ya_oldpms + $ya_savpms;
        $pm_uname = htmlspecialchars($pm_uname);

	// menelaos: function changed to reflect the default phpbb2 style icons (in a future version they will show the users phpnuke forum theme icons)
	$configresult = $db->sql_query("SELECT config_name, config_value FROM ".$prefix."_bbconfig");
	while (list($config_name, $config_value) = $db->sql_fetchrow($configresult)) {
	$bbconfig[$config_name] = $config_value; 
	}
	$bbstyle	= $bbconfig['default_style'];

	$sql	    = "SELECT template_name FROM nuke_bbthemes WHERE themes_id='$bbstyle'";
	$result  = $db->sql_query($sql);
	$row     = $db->sql_fetchrow($result);
	$bbtheme = $row[template_name];

	echo "<table align=\"center\"><tr><td><b>"._YAMESSAGES."</b></td></tr></table>\n";
	echo "<table align=\"center\" border=\"0\"><tr align=\"center\">";
	echo "<td align=\"left\"><a href=\"modules.php?name=Private_Messages\"><img src=./modules/Forums/templates/$bbtheme/images/whosonline.gif style=\"border:none;\"></a></td>";
	echo "<td valign=\"middle\"><a href=\"modules.php?name=Private_Messages\"><b>"._YAPM."&nbsp;: &nbsp;$ya_totpms</b></a><br></td><td width=\"%33\">&nbsp;</td>\n";
	echo "<td><a href=\"modules.php?name=Private_Messages\"><img src=\"./modules/Forums/templates/$bbtheme/images/msg_inbox.gif\" style=\"border:none;\"></a></td>";
	echo "<td valign=\"middle\"><a href=\"modules.php?name=Private_Messages\"><b>&nbsp; "._YAUNREAD.":&nbsp;$ya_newpms</b></a></td><td width=\"%33\">&nbsp;</td>\n";
	echo "<td><a href=\"modules.php?name=Private_Messages\"><img src=\"modules/Forums/templates/$bbtheme/images/msg_inbox.gif\" style=\"border:none;\"></a></td>";
	echo "<td valign=\"middle\"><a href=\"modules.php?name=Private_Messages\"><b>&nbsp; "._YAREAD.":&nbsp;$ya_oldpms</b></a></td><td width=\"%33\">&nbsp;</td>\n";
	echo "<td><a href=\"modules.php?name=Private_Messages&file=index&folder=savebox\"><img src=\"modules/Forums/templates/$bbtheme/images/msg_savebox.gif\" style=\"border:none;\"></a></td>";
	echo "<td valign=\"middle\"><a href=\"modules.php?name=Private_Messages&file=index&folder=savebox\"><b>&nbsp; "._YASAVED.":&nbsp;$ya_savpms</b></a></td>\n";
	echo "<td width=\"%33\">&nbsp;</td><td><a href=\"modules.php?name=Private_Messages&file=index&folder=outbox\"><img src=\"./modules/Forums/templates/$bbtheme/images/msg_inbox.gif\" style=\"border:none;\"></a></td>";
	echo "<td valign=\"middle\"><a href=\"modules.php?name=Private_Messages&file=index&folder=outbox\"><b>&nbsp; "._YAOUTBOX.":&nbsp;$ya_outpms</b></a></td></tr>\n";
	echo "</table>\n";
	echo "<table width=\"100%\" align=\"center\" border=\"0\">\n";
	echo "<tr><td align=\"right\"><form action=\"modules.php?name=Private_Messages&mode=post&pm_uname=$pm_uname\" method=\"post\">";
	echo ""._USENDPRIVATEMSG.": <input type=\"text\" name=\"pm_uname\" size=\"25\"></td><td align=\"left\" valign=\"middle\">$links";
	echo "<input type=\"hidden\" name=\"send\" value=\"1\">";
	echo "</td></form></tr></table>";
	CloseTable();
    }

?>