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
    include("modules/$module_name/functions.php");
    include("modules/$module_name/kses.php");
    $pagetitle = "- "._USERSJOURNAL."";
    include("header.php");
    if (is_user($user)) {
        cookiedecode($user);
        $username = $cookie[1];
        $user = check_html($user, nohtml);
        $username = check_html($username, nohtml);
        $sitename = check_html($sitename, nohtml);
        $jid = intval($jid);
        if ($debug == "true") :
        echo ("UserName:$username<br>SiteName: $sitename<br>JID: $jid");
        endif;
        startjournal($sitename, $user);
        echo "<br>";
        OpenTable();
        echo ("<div align=center class=title>"._EDITJOURNAL."</div><br>");
        echo ("<div align=center> [ <a href=\"modules.php?name=$module_name&file=add\">"._ADDENTRY."</a> | <a href=\"modules.php?name=$module_name&file=edit&op=last\">"._YOURLAST20."</a> | <a href=\"modules.php?name=$module_name&file=edit&op=all\">"._LISTALLENTRIES."</a> ]</div>");
        CloseTable();
        echo "<br>";
        OpenTable();
        $jid = intval($jid);
        $sql = "SELECT * FROM ".$user_prefix."_journal WHERE jid = '$jid'";
        $result = $db->sql_query($sql);
        while ($row = $db->sql_fetchrow($result)) {
            $jaid = check_html($row[aid], nohtml);
            if (!is_admin($admin)):
            if ($username != $jaid):
                echo ("<br>");
            OpenTable();
            echo ("<div align=center>"._NOTYOURS2."</div>");
            CloseTable();
            CloseTable();
            journalfoot();
            include("footer.php");
            die();
            endif;
            endif;
            $jid = intval($jid);
            $jtitle = check_html($row[title], nohtml);
            $jbodytext = $row[bodytext];
            $jbodytext = kses(ADVT_stripslashes($jbodytext), $allowed);
            $jmood = check_html($row[mood], nohtml);
            print ("<form action='modules.php?name=$module_name&file=edit' method='post'>");
            print ("<input type='hidden' name='edit' value='1'>");
            print ("<input type='hidden' name='jid' value='$jid'>");
            print ("<table align=center border=0>");
            print ("<tr>");
            print ("<td align=right valign=top><strong>"._TITLE.": </strong></td>");
            printf ("<td valign=top><input type='text' value='%s' size=50 maxlength=80 name='title'></td>", $jtitle);
            print ("</tr>");
            print ("<tr>");
            print ("<td align=right valign=top><strong>"._BODY.": </strong></td>");
            printf ("<td valign=top><textarea name='jbodytext' wrap=virtual cols=55 rows=10>%s</textarea><br>"._WRAP."</td>", $jbodytext);
            print ("</tr>");
            print ("<tr>");
            print ("<td align=right valign=top><strong>"._LITTLEGRAPH.": </strong><br>"._OPTIONAL."</td>");
            echo "<td valign=top><table cellpadding=3><tr>";
            $tempcount = 0;
            $tempcount = intval($tempcount);
            $checked = htmlspecialchars($checked);
            $direktori = "$jsmiles";
            $handle = opendir($direktori);
            while ($file = readdir($handle)) {
                if (is_file($file) && strtolower(substr($file, -4)) == '.gif' || '.jpg') {
                    $filelist[] = $file;
                } else {
                    OpenTable();
                    echo "<center><b>"._ANERROR."</b></center>";
                    CloseTable();
                    include("footer.php");
                    exit;
                }
            }
            closedir($handle);
            asort($filelist);
            while (list ($key, $file) = each ($filelist)) {
                ereg(".gif|.jpg", $file);
                if ($file == "." || $file == "..") {
                    $a = 1;
                } else {
                    if ($file == $jmood) {
                        $checked = "checked";
                    } else {
                        $checked = "";
                    }
                    if ($tempcount == 6):
                        echo "</tr><tr>";
                    echo "<td><input type='radio' name='mood' value='$file' $checked></td><td><img src=\"$jsmiles/$file\" alt=\"$file\" title=\"$file\"></td>";
                    $tempcount = 0;
                    else :
                    echo "<td><input type='radio' name='mood' value='$file' $checked></td><td><img src=\"$jsmiles/$file\" alt=\"$file\" title=\"$file\"></td>";
                    endif;
                    $tempcount = $tempcount + 1;
                }
            }
            echo "</tr></table>";
            print ("</td>");
            print ("</tr>");
            print ("<tr>");
            print ("<td align=right valign=top><strong>"._PUBLIC.": </strong></td>");
            print ("<td align=left valign=top>");
            print ("<select name='status'>");
            $jstatus = check_html($row[status], nohtml);
            if ($jstatus == 'yes'):
                print ("<option value=\"yes\" SELECTED>"._YES."</option>");
            else :
            print ("<option value=\"yes\">"._YES."</option>");
            endif;
            if ($jstatus == 'no'):
                print ("<option value=\"no\" SELECTED>"._NO."</option>");
            else :
            print ("<option value=\"no\">"._NO."</option>");
            endif;
            print ("</select>");
            print ("</td>");
            print ("</tr>");
            print ("<td colspan=2 align=center><input type='submit' name='submit' value='"._MODIFYENTRY."'><br><br>"._TYPOS."</td>");
            print ("</tr>");
            print ("</table>");
            echo "<script language=\"Javascript1.2\"><!-- // load htmlArea files\n";
            echo "_editor_url = \"./modules/Journal/\";\n";
            echo "var win_ie_ver = parseFloat(navigator.appVersion.split(\"MSIE\")[1]);\n";
            echo "if (navigator.userAgent.indexOf('Mac')        >= 0) { win_ie_ver = 0; }\n";
            echo "if (navigator.userAgent.indexOf('Windows CE') >= 0) { win_ie_ver = 0; }\n";
            echo "if (navigator.userAgent.indexOf('Opera')      >= 0) { win_ie_ver = 0; }\n";
            echo "if (win_ie_ver >= 5.5) {\n";
            echo " document.write('<scr' + 'ipt src=\"' +_editor_url+ 'editor.js\" language=\"Javascript1.2\"></scr'+'ipt>');\n";
            echo "} else { document.write('<scr'+'ipt>function editor_generate() { return false; }";
            echo "</scr'+'ipt>'); }\n";
            echo "//--></script>\n";
            echo "<script language=\"JavaScript1.2\" defer>\n";
            echo "editor_generate('jbodytext');\n";
            echo "</script>\n";
            print ("</form>");
        }
        CloseTable();
        journalfoot();
    }
    if (is_admin($admin)) {
        cookiedecode($user);
        $username = $cookie[1];
        $user = check_html($user, nohtml);
        $username = check_html($username, nohtml);
        $sitename = check_html($sitename, nohtml);
        $jid = intval($jid);
        if ($debug == "true") :
        echo ("UserName:$username<br>SiteName: $sitename<br>JID: $jid");
        endif;
        startjournal($sitename, $user);
        echo "<br>";
        OpenTable();
        echo ("<div align=center class=title>"._EDITJOURNAL."</div><br>");
        echo ("<div align=center> [ <a href=\"modules.php?name=$module_name&file=add\">"._ADDENTRY."</a> | <a href=\"modules.php?name=$module_name&file=edit&op=last\">"._YOURLAST20."</a> | <a href=\"modules.php?name=$module_name&file=edit&op=all\">"._LISTALLENTRIES."</a> ]</div>");
        CloseTable();
        echo "<br>";
        OpenTable();
        $jid = intval($jid);
        $sql = "SELECT * FROM ".$user_prefix."_journal WHERE jid = '$jid'";
        $result = $db->sql_query($sql);
        while ($row = $db->sql_fetchrow($result)) {
            $jaid = check_html($row[aid], nohtml);
            $jid = intval($jid);
            $jtitle = check_html($row[title], nohtml);
            $jbodytext = $row[bodytext];
            $jbodytext = kses(ADVT_stripslashes($jbodytext), $allowed);
            $jmood = check_html($row[mood], nohtml);
            print ("<form action='modules.php?name=$module_name&file=edit' method='post'>");
            print ("<input type='hidden' name='edit' value='1'>");
            print ("<input type='hidden' name='jid' value='$jid'>");
            print ("<table align=center border=0>");
            print ("<tr>");
            print ("<td align=right valign=top><strong>"._TITLE.": </strong></td>");
            printf ("<td valign=top><input type='text' value='%s' size=50 maxlength=80 name='title'></td>", $jtitle);
            print ("</tr>");
            print ("<tr>");
            print ("<td align=right valign=top><strong>"._BODY.": </strong></td>");
            printf ("<td valign=top><textarea name='jbodytext' wrap=virtual cols=55 rows=10>%s</textarea><br>"._WRAP."</td>", $jbodytext);
            print ("</tr>");
            print ("<tr>");
            print ("<td align=right valign=top><strong>"._LITTLEGRAPH.": </strong><br>"._OPTIONAL."</td>");
            echo "<td valign=top><table cellpadding=3><tr>";
            $tempcount = 0;
            $tempcount = intval($tempcount);
            $checked = htmlspecialchars($checked);
            $direktori = "$jsmiles";
            $handle = opendir($direktori);
            while ($file = readdir($handle)) {
                if (is_file($file) && strtolower(substr($file, -4)) == '.gif' || '.jpg') {
                    $filelist[] = $file;
                } else {
                    include("header.php");
                    OpenTable();
                    echo "<center><b>"._ANERROR."</b></center>";
                    CloseTable();
                    include("footer.php");
                    exit;
                }
            }
            closedir($handle);
            asort($filelist);
            while (list ($key, $file) = each ($filelist)) {
                ereg(".gif|.jpg", $file);
                if ($file == "." || $file == "..") {
                    $a = 1;
                } else {
                    if ($file == $jmood) {
                        $checked = "checked";
                    } else {
                        $checked = "";
                    }
                    if ($tempcount == 6):
                        echo "</tr><tr>";
                    echo "<td><input type='radio' name='mood' value='$file' $checked></td><td><img src=\"$jsmiles/$file\" alt=\"$file\" title=\"$file\"></td>";
                    $tempcount = 0;
                    else :
                    echo "<td><input type='radio' name='mood' value='$file' $checked></td><td><img src=\"$jsmiles/$file\" alt=\"$file\" title=\"$file\"></td>";
                    endif;
                    $tempcount = $tempcount + 1;
                }
            }
            echo "</tr></table>";
            print ("</td>");
            print ("</tr>");
            print ("<tr>");
            print ("<td align=right valign=top><strong>"._PUBLIC.": </strong></td>");
            print ("<td align=left valign=top>");
            print ("<select name='status'>");
            $jstatus = check_html($row[status], nohtml);
            if ($jstatus == 'yes'):
                print ("<option value=\"yes\" SELECTED>"._YES."</option>");
            else :
            print ("<option value=\"yes\">"._YES."</option>");
            endif;
            if ($jstatus == 'no'):
                print ("<option value=\"no\" SELECTED>"._NO."</option>");
            else :
            print ("<option value=\"no\">"._NO."</option>");
            endif;
            print ("</select>");
            print ("</td>");
            print ("</tr>");
            print ("<td colspan=2 align=center><input type='submit' name='submit' value='"._MODIFYENTRY."'><br><br>"._TYPOS."</td>");
            print ("</tr>");
            print ("</table>");
            echo "<script language=\"Javascript1.2\"><!-- // load htmlArea files\n";
            echo "_editor_url = \"./modules/Journal/\";\n";
            echo "var win_ie_ver = parseFloat(navigator.appVersion.split(\"MSIE\")[1]);\n";
            echo "if (navigator.userAgent.indexOf('Mac')        >= 0) { win_ie_ver = 0; }\n";
            echo "if (navigator.userAgent.indexOf('Windows CE') >= 0) { win_ie_ver = 0; }\n";
            echo "if (navigator.userAgent.indexOf('Opera')      >= 0) { win_ie_ver = 0; }\n";
            echo "if (win_ie_ver >= 5.5) {\n";
            echo " document.write('<scr' + 'ipt src=\"' +_editor_url+ 'editor.js\" language=\"Javascript1.2\"></scr'+'ipt>');\n";
            echo "} else { document.write('<scr'+'ipt>function editor_generate() { return false; }";
            echo "</scr'+'ipt>'); }\n";
            echo "//--></script>\n";
            echo "<script language=\"JavaScript1.2\" defer>\n";
            echo "editor_generate('jbodytext');\n";
            echo "</script>\n";
            print ("</form>");
        }
        CloseTable();
        journalfoot();
    }
    $pagetitle = "- "._YOUMUSTBEMEMBER."";
    $pagetitle = check_html($pagetitle, nohtml);
    OpenTable();
    echo "<center><b>"._YOUMUSTBEMEMBER."</b></center>";
    CloseTable();
    include("footer.php");
    die();
# $Log: modify.php,v $
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