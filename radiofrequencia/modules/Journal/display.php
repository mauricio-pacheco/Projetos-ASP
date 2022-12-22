<?php

# $Author: chatserv $
# $Date: 2004/12/08 00:19:50 $
/************************************************************************/
/* Journal &#167 ZX                                                     */
/* ================                                                     */
/*                                                                      */
/* Original work done by Joseph Howard known as Member's Journal, which */
/* was based on Trevor Scott's vision of Atomic Journal.                */
/*                                                                      */
/* Modified on 25 May 2002 by Paul Laudanski (paul@computercops.biz)    */
/* Copyright (c) 2002 Modifications by Computer Cops.                   */
/* http://computercops.biz                                              */
/*                                                                      */
/* Member's Journal did not work on a PHPNuke 5.5 portal which had      */
/* phpbb2 port integrated.  Thus was Journal &#167 ZX created with the  */
/* Member's Journal author's blessings.                                 */
/*                                                                      */
/* To install, backup everything first and then FTP the Journal package */
/* files into your site's module directory.  Also run the tables.sql    */
/* script so the proper tables and fields can be created and used.  The */
/* default table prefix is "nuke" which is hard-coded throughout the    */
/* entire system as a left-over from Member's Journal.  If a demand     */
/* exists, that can be changed for a future release.                    */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/
/* Additional security checking code 2003 by chatserv                   */
/* http://www.nukefixes.com -- http://www.nukeresources.com             */
/************************************************************************/
    /* Journal 2.0 Enhanced and Debugged 2004                               */
    /* by sixonetonoffun -- http://www.netflake.com --                      */
    /* Images Created by GanjaUK -- http://www.GanjaUK.com                  */
    /************************************************************************/
if (!stristr($_SERVER['SCRIPT_NAME'], "modules.php")) {
    die ("You can't access this file directly...");
}

require_once("mainfile.php");
$module_name = basename(dirname(__FILE__));
get_lang($module_name);

$pagetitle = "- "._USERSJOURNAL."";
    include("modules/$module_name/header.php");
include("modules/$module_name/functions.php");
    include("modules/$module_name/kses.php");
    if (is_user($user)) {
cookiedecode($user);
$username = $cookie[1];
    }
    $username = check_html($username, nohtml);
    $sitename = check_html($sitename, nohtml);
    $debug = check_html($debug, nohtml);
if ($debug == "true") :
    echo ("UserName:$username<br>SiteName: $sitename");
endif;

startjournal($sitename,$user);
$jid = intval($jid);
if ($jid == "") :
    opentable();
    echo ("<div align=\"center\">"._ANERROR."</div>");
    closetable();
    echo ("<br><br>");
    journalfoot();
endif;

    $sql = "SELECT j.jid, j.aid, j.title, j.pdate, j.ptime, j.mdate, j.mtime, j.bodytext, j.status, j.mood, u.user_id, u.username FROM ".$user_prefix."_journal j, ".$user_prefix."_users u WHERE u.username=j.aid and j.jid = '$jid'";
$result = $db->sql_query($sql);

while ($row = $db->sql_fetchrow($result)) {
    $owner = $row[aid];
        $owner = check_html($owner, nohtml);
        $status = $row[status];
        $status = check_html($status, nohtml);
        $jaid = check_html($row[aid], nohtml);
        if (($status == 'no') && ($jaid != $username)):
	OpenTable();
	echo "<center><br>"._ISPRIVATE."<br></center>";
	CloseTable();
	journalfoot();
    endif;
    echo "<br>";
    OpenTable();
        $row[title] = check_html($row[title], nohtml);
        $jmood = check_html($row[mood], nohtml);
        if ($jmood != ""):
            printf ("<br><div align=center><img src=\"$jsmiles/%s\" alt=\"%s\" title=\"%s\"></div>", $jmood, $jmood, $jmood);
        endif;
        $title = check_html($row[title], nohtml);
        printf ("<div class=title align=center>%s</div>", $title);
//The Following line had an incorrect uname entry.//
        $username = check_html($row[username], nohtml);
        $jid = intval($row[jid]);
        $pdate = check_html($row[pdate], nohtml);
        $ptime = check_html($row[ptime], nohtml);
        printf ("<div align=center>"._BY.": <a href=\"modules.php?name=Your_Account&op=userinfo&username=$jaid\">%s</a></div>", $jaid, $jaid);
        printf ("<div align=center class=tiny>"._POSTEDON.": %s @ %s</div>", $pdate, $ptime);
    CloseTable();
    echo "<br>";
        OpenTable();
        // echo "<table>";
        $jbodytext = $row[bodytext];
        $jbodytext = kses(ADVT_stripslashes($jbodytext), $allowed);
        printf ("%s", $jbodytext);
        //  echo "</table>";
        CloseTable();
        printf ("<br><br><div class=tiny align=center>"._LASTUPDATED." %s @ %s</div><br>", $row[mdate], $row[mtime]);
        printf ("<div class=tiny align=center>[ <a href=\"modules.php?name=$module_name&file=friend&jid=%s\">"._SENDJFRIEND."</a> ]</div>", $row[jid]);
        print ("<br>");
        OpenTable();
        print ("<table width=\"100%\" align=\"center\"><tr>");
        if (is_user($user)) {
        cookiedecode($user);
        $username = $cookie[1];
        $username = check_html($username, nohtml);
        }
        if (is_user($user) && $owner == $username):
            echo "<td align=\"center\" width=\"15%\"><a href=\"modules.php?name=$module_name&file=modify&jid=$jid\"><img src=\"modules/$module_name/images/edit.gif\" border=0 alt=\""._EDIT."\" title=\""._EDIT."\"><br>"._EDIT."</a></td>";
        echo "<td align=\"center\" width=\"15%\"><a href=\"modules.php?name=$module_name&file=delete&jid=$jid&forwhat=$jid\"><img src=\"modules/$module_name/images/trash.gif\" border=0 alt=\""._DELETE."\" title=\""._DELETE."\"><br>"._DELETE."</a></td>";
        //   endif;
        elseif (is_admin($admin)):
        echo "<td align=\"center\" width=\"15%\"><a href=\"modules.php?name=$module_name&file=modify&jid=$jid\"><img src=\"modules/$module_name/images/edit.gif\" border=0 alt=\""._EDIT."\" title=\""._EDIT."\"><br>"._EDIT."</a></td>";
        echo "<td align=\"center\" width=\"15%\"><a href=\"modules.php?name=$module_name&file=delete&jid=$jid&forwhat=$jid\"><img src=\"modules/$module_name/images/trash.gif\" border=0 alt=\""._DELETE."\" title=\""._DELETE."\"><br>"._DELETE."</a></td>";
        endif;
        if ($username != ""):
            echo "<td align=\"center\" width=\"15%\"><a href=\"modules.php?name=$module_name&file=comment&onwhat=$jid\"><img src=\"modules/$module_name/images/write.gif\" border=0 alt=\""._WRITECOMMENT."\" title=\""._WRITECOMMENT."\"><br>"._WRITECOMMENT."</a></td>";
        endif;
        echo "<td align=\"center\" width=\"15%\"><a href=\"modules.php?name=$module_name&file=search&bywhat=aid&forwhat=$row[aid]\"><img src=\"modules/$module_name/images/binocs.gif\" border=0 alt=\""._VIEWMORE."\" title=\""._VIEWMORE."\"><br>"._VIEWMORE."</a></td>";
        //The following line had an incorrect uname entry.//
        echo "<td align=\"center\" width=\"15%\"><a href=\"modules.php?name=Your_Account&op=userinfo&username=$username\"><img src=\"modules/$module_name/images/nuke.gif\" border=0 alt=\""._USERPROFILE."\" title=\""._USERPROFILE."\"><br>"._USERPROFILE."</a></td>";
        if ($username != "" AND is_active("Private_Messages")):
            //the following line had a uname entry and a reference to reply.php which doesn't exist.//
        echo "<td align=\"center\" width=\"15%\"><a href=\"modules.php?name=Private_Messages&mode=post&u=$row[user_id]\"><img src=\"modules/$module_name/images/chat.gif\" border=0 alt=\""._SENDMESSAGE."\" title=\""._SENDMESSAGE."\"><br>"._SENDMESSAGE."</a></td>";
        endif;
        if ($username == ""):
            echo "<td align=\"center\" width=\"15%\"><a href=\"modules.php?name=Your_Account\"><img src=\"modules/$module_name/images/folder.gif\" border=0 alt=\"Create an account\" title=\"Create an account\"><br>"._CREATEACCOUNT."</a></td>";
        endif;
        print ("</tr></table>");
        closeTable();
    }
    $commentheader = "no";
    //The following line had an incorrect u.uid entry.//
    $sql = "SELECT j.cid, j.rid, j.aid, j.comment, j.pdate, j.ptime, u.user_id FROM ".$user_prefix."_journal_comments j, ".$user_prefix."_users u WHERE j.aid=u.username and j.rid = '$jid'";
    $result = $db->sql_query($sql);
    while ($row = $db->sql_fetchrow($result)) {
    	$row[cid] = intval($row[cid]);
        $row[rid] = check_html($row[rid], nohtml);
        $row[aid] = check_html($row[aid], nohtml);
        $row[comment] = check_html($row[comment], nohtml);
        $pdate = check_html($row[pdate], nohtml);
        $ptime = check_html($row[ptime], nohtml);
        $row[user_id] = check_html($row[user_id], nohtml);
        if ($row == 0):
            $commentheader = "yes";
        else:
            if ($commentheader == "no"):
            echo "<br>";
        if ($username == "" OR $username == $anonymous) {
            $ann_co = "<br><div align=center class=tiny>"._REGUSERSCOMM."</div>";
        } else {
            $ann_co = "";
        }
        title("Posted Comments$ann_co");
        $commentheader = "yes";
        elseif ($commentheader = "yes"):
        // Do not print comment header.
        endif;
        endif;
        openTable();
        //The following line had an incorrect uname entry.//
        printf (""._COMMENTBY.": <a href=\"modules.php?name=Your_Account&op=userinfo&username=$username\">%s</a> <div class=tiny>("._POSTEDON." $pdate @ $ptime)</div><br>", $row[aid], $row[aid], $pdate, $ptime);
        $row[comment] = stripslashes(check_html($row[comment], 'nohtml'));
        printf ("<strong>Comment:</strong> %s", $row[comment]);
        //    if ($username == $owner):
        if (is_user($user) && ($owner == $username)):
            printf ("<br><div align=center>[ <a href=\"modules.php?name=$module_name&file=commentkill&onwhat=%s&ref=$jid\">"._DELCOMMENT."</a> ]</div>", $row[cid], $row[jid]);
        endif;
        if (is_admin($admin)):
            printf ("<br><div align=center>[ <a href=\"modules.php?name=$module_name&file=commentkill&onwhat=%s&ref=$jid\">"._DELCOMMENT."</a> ]</div>", $row[cid], $row[jid]);
        endif;
        closeTable();
        print ("<br><br>");
    }
    journalfoot();
# $Log: display.php,v $
# Revision 1.4  2004/12/08 00:19:50  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.3  2004/11/26 02:36:48  chatserv
# additional bug fixes by sixonetonoffun
#
# Revision 1.2  2004/10/08 19:20:00  chatserv
# Updated to match additional bug fixes by sixonetonoffun
#
# Revision 1.1  2004/10/05 18:05:08  chatserv
# Initial CVS Addition
#

?>