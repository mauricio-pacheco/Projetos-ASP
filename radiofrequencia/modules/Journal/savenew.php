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
/* Required: PHPNuke 5.5 ( http://www.phpnuke.org/ ) and phpbb2         */
/* ( http://bbtonuke.sourceforge.net/ ) forums port.                    */
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
    include("header.php");
    include("modules/$module_name/functions.php");
    include("modules/$module_name/kses.php");
    if (is_user($user)) {
        cookiedecode($user);
        $username = $cookie[1];
        $htime = date(h);
        $mtime = date(i);
        $ntime = date(a);
        $mtime = "$htime:$mtime $ntime";
        $mdate = date(m);
        $ddate = date(d);
        $ydate = date(Y);
        $ndate = "$mdate-$ddate-$ydate";
        $pdate = $ndate;
        $ptime = $mtime;
        if ($debug == "true") :
        echo ("UserName:$username<br>SiteName: $sitename");
        endif;
        startjournal($sitename, $user);
        echo "<br>";
        OpenTable();
        echo ("<div align=center class=title>"._ENTRYADDED."</div><br><br>");
        echo ("<div align=center> [ <a href=\"modules.php?name=$module_name&file=edit\">"._RETURNJOURNAL."</a> ]</div>");
        CloseTable();
        $username = $cookie[1];
        $user = check_html($user, nohtml);
        $username = check_html($username, nohtml);
        $sitename = check_html($sitename, nohtml);
        $jid = intval($jid);
        $title = check_html($title, nohtml);
        $title = addslashes($title);
        $mood = check_html($mood, nohtml);
        $jbodytext = kses(ADVT_stripslashes($jbodytext), $allowed);
        $jbodytext = addslashes($jbodytext);
        $sql = "INSERT INTO ".$user_prefix."_journal (jid,aid,title,bodytext,mood,pdate,ptime,status,mtime,mdate) VALUES ('','$username','$title','$jbodytext','$mood','$pdate','$ptime','$status','$mtime','$ndate')";
        $db->sql_query($sql);
        update_points(1);
        $sql = "SELECT * FROM ".$user_prefix."_journal_stats WHERE joid = '$username'";
        $result = $db->sql_query($sql);
        $row_count = $db->sql_numrows($result);
        if ($row_count == 0):
            $query = "INSERT INTO ".$user_prefix."_journal_stats (id,joid,nop,ldp,ltp,micro) VALUES ('','$username','1',now(),'$mtime',now())";
        $db->sql_query($query);
        else :
        $row = $db->sql_fetchrow($result);
        $nnop = $row[nop];
        $nnnop = ($nnop + 1);
        $micro = date(U);
        $nnnop = check_html($nnnop, nohtml);
        $ndate = check_html($ndate, nohtml);
        $mtime = check_html($mtime, nohtml);
        $micro = check_html($micro, nohtml);
        $query = "UPDATE ".$user_prefix."_journal_stats SET nop='$nnnop', ldp='$ndate', ltp='$mtime' micro='$micro' WHERE joid='$username'";
        $db->sql_query($query);
        endif;
        journalfoot();
    } else {
        $pagetitle = "- "._YOUMUSTBEMEMBER."";
        $pagetitle = check_html($pagetitle, nohtml);
        OpenTable();
        echo "<center><b>"._YOUMUSTBEMEMBER."</b></center>";
        CloseTable();
        include("footer.php");
        die();
    }
# $Log: savenew.php,v $
# Revision 1.3  2004/12/08 00:19:50  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.2  2004/10/08 19:20:00  chatserv
# Updated to match additional bug fixes by sixonetonoffun
#
# Revision 1.1  2004/10/05 18:05:08  chatserv
# Initial CVS Addition
#

?>