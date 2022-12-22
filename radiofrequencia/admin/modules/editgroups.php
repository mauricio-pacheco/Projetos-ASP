<?php

/********************************************************/
/* NSN Groups Universal                                 */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

if (!eregi("admin.php", $_SERVER['PHP_SELF']) AND !eregi("admin.php", $_SERVER['SCRIPT_NAME'])) { die ("Access Denied"); }
$result = $db->sql_query("select aid, email, radminsuper from $prefix"._authors." where aid='$aid'");
list($aname, $amail, $radminsuper) = $db->sql_fetchrow($result);
if ($radminsuper==1) {
$grconfig = grget_configs();

function grsave_config($config_name, $config_value){
    global $prefix, $db;
    $db->sql_query("UPDATE ".$prefix."_nsngr_config SET config_value='$config_value' WHERE config_name='$config_name'");
}

function NSNGroupsAdmin() {
    global $db, $prefix;
    $grpnum = $db->sql_numrows($db->sql_query("SELECT gname FROM ".$prefix."_nsngr_groups"));
    $usrnum = $db->sql_numrows($db->sql_query("SELECT gid FROM ".$prefix."_nsngr_users"));
    OpenTable();
    echo "<center>\n<table cellpadding='3'>\n<tr>\n";
    echo "<td align='center' valign='top' width='150'>";
    echo "<a href='admin.php?op=NSNGroupsAdd'>"._GR_GROUPSADD."</a><br>";
    echo "<a href='admin.php?op=NSNGroupsView'>"._GR_GROUPSVIEW."</a> ($grpnum)<br>";
    echo "</td>\n";
    echo "<td align='center' valign='top' width='150'>";
    echo "<a href='admin.php?op=NSNGroupsUsersEmail'>"._GR_GROUPSEMAIL."</a><br>";
    echo "</td>\n";
    echo "<td align='center' valign='top' width='150'>";
    echo "<a href='admin.php?op=NSNGroupsUsersAdd'>"._GR_GROUPSUSERSADD."</a><br>";
    echo "<a href='admin.php?op=NSNGroupsUsersView'>"._GR_GROUPSUSERSVIEW."</a> ($usrnum)<br>";
    echo "</td>\n";
    echo "</tr>\n";
    echo "<tr>\n<td colspan='3' align='center'><a href='admin.php'>"._MAINADMINMENU."</a></td>\n</tr>\n";
    echo "</table>\n</center>\n";
    CloseTable();
}

function grpagenums($op, $totalselected, $perpage, $max, $gid) {
    $pagesint = ($totalselected / $perpage);
    $pageremainder = ($totalselected % $perpage);
    if ($pageremainder != 0) {
        $pages = ceil($pagesint);
        if ($totalselected < $perpage) { $pageremainder = 0; }
    } else {
        $pages = $pagesint;
    }
    if ($pages != 1 && $pages != 0) {
        $counter = 1;
        $currentpage = ($max / $perpage);
        echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<tr><form action='admin.php' method='post'>\n";
        echo "<input type='hidden' name='op' value='$op'>\n";
        echo "<input type='hidden' name='gid' value='$gid'>\n";
        echo "<td align='center'><b>"._GR_SELECTPAGE.": </b><select name='min'>\n";
        while ($counter <= $pages ) {
            $cpage = $counter;
            $mintemp = ($perpage * $counter) - $perpage;
            echo "<option value='$mintemp'";
            if ($counter == $currentpage) { echo " selected"; }
            echo ">$counter</option>\n";
            $counter++;
        }
        echo "</select><b> "._GR_OF." $pages "._GR_PAGES."</b> <input type='submit' value='"._GR_GO."'></td>\n";
        echo "</form>\n</tr>\n</table>\n";
    }
}

switch($op) {

    case "NSNGroups":
        $pagetitle = _GR_ADMIN;
        include ("header.php");
        title("$pagetitle");
        NSNGroupsAdmin();
        include("footer.php");
    break;

    case "NSNGroupsAdd":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSADD;
        include ("header.php");
        title("$pagetitle");
        NSNGroupsAdmin();
        echo "<br>\n";
        OpenTable();
        echo "<center><table border='0' cellpadding='0' cellspacing='2'>\n";
        echo "<form method='post' action='admin.php?op=NSNGroupsAddSave'>\n";
        echo "<tr><td bgcolor='$bgcolor2'><b>"._GR_GROUPNAME.":</b></td>";
        echo "<td><input type='text' name='gname' size='40' maxlength='32'></td></tr>\n";
        echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._GR_DESCRIPTION.":</b></td>";
        echo "<td><textarea name='gdesc' cols='40' rows='10'></textarea></td></tr>\n";
        echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._GR_PUBLIC.":</b></td>";
        echo "<td><select name='gpublic'><option value='0'>"._NO."</option>";
        echo "<option value='1'>"._YES."</option></select><br>"._GR_PUBLICNOTE."</td></tr>\n";
        echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._GR_LIMIT.":</b></td>";
        echo "<td><input type='text' name='glimit' size='4' maxlength='4' value='0'><br>"._GR_LIMITNOTE."</td></tr>\n";
        echo "<tr><td align='center' colspan='2'><input type='submit' value='"._GR_ADDGRP."'></td></tr>\n";
        echo "</form>\n";
        echo "</table></center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsAddSave":
        $gname = strip_tags($gname, "<b><i><u>");
        $gdesc = strip_tags($gdesc, "<br><b><i><u>");
        $gname = stripslashes($gname);
        $gdesc = stripslashes($gdesc);
        if ($gname == "") { $gname = "Un-named"; }
        if (!get_magic_quotes_gpc()) { $gname = addslashes($gname); $gdesc = addslashes($gdesc); }
        $db->sql_query("INSERT INTO ".$prefix."_nsngr_groups VALUES (NULL, '$gname', '$gdesc' , '$gpublic', '$glimit')");
        Header("Location: admin.php?op=NSNGroupsView");
    break;

    case "NSNGroupsDelete":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSDELETE;
        include("header.php");
        title("$pagetitle");
        NSNGroupsAdmin();
        echo "<br>\n";
        OpenTable();
        list($gname) = $db->sql_fetchrow($db->sql_query("SELECT gname FROM ".$prefix."_nsngr_groups WHERE gid='$gid'"));
        echo "<center><table><tr>\n";
        echo "<form action='admin.php' method='post'>\n";
        echo "<input type='hidden' name='op' value='NSNGroupsDeleteConf'>\n";
        echo "<input type='hidden' name='gid' value='$gid'>\n";
        echo "<td align='center'>"._GR_DELGROUP." #$gid ($gname)?</td>\n";
        echo "</tr><tr>\n";
        echo "<td align='center'><input type='submit' value='"._GR_DELETE." &quot;$gname&quot;'></td>\n";
        echo "</form>\n";
        echo "</tr></table></center>\n";
        echo "<center>"._GOBACK."</center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsDeleteConf":
        $db->sql_query("DELETE FROM ".$prefix."_nsngr_groups WHERE gid='$gid'");
        $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngr_groups");
        $db->sql_query("DELETE FROM ".$prefix."_nsngr_users WHERE gid='$gid'");
        $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngr_users");
        Header("Location: admin.php?op=NSNGroupsView");
    break;

    case "NSNGroupsEdit":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSEDIT;
        include ("header.php");
        title("$pagetitle");
        NSNGroupsAdmin();
        echo "<br>\n";
        OpenTable();
        echo "<center><table border='0' cellpadding='0' cellspacing='2'>\n";
        echo "<form method='post' action='admin.php?op=NSNGroupsEditSave'>\n";
        echo "<input type='hidden' name='gid' value='$gid'>\n";
        echo "\n";
        $grow = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsngr_groups WHERE gid='$gid'"));
        echo "<tr><td bgcolor='$bgcolor2'><b>"._GR_GROUP.":</b></td>";
        echo "<td><input type='text' name='gname' size='40' maxlength='32' value=\"".$grow['gname']."\"></td></tr>\n";

        echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._GR_DESCRIPTION.":</b></td>";
        echo "<td><textarea name='gdesc' cols='40' rows='10'>".$grow['gdesc']."</textarea></td></tr>\n";
        $sel1 = $sel2 = "";
        if ($grow['public'] == 0) { $sel1 = " selected"; } else { $sel2 = " selected"; }
        echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._GR_PUBLIC.":</b></td>";
        echo "<td><select name='gpublic'><option value='0'$sel1>"._NO."</option>";
        echo "<option value='1'$sel2>"._YES."</option></select><br>"._GR_PUBLICNOTE."</td></tr>\n";
        echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._GR_LIMIT.":</b></td>";
        echo "<td><input type='text' name='glimit' size='4' maxlength='4' value='".$grow['limit']."'><br>"._GR_LIMITNOTE."</td></tr>\n";

        echo "<tr><td align='center' colspan='2'><input type='submit' value='"._GR_EDITGRP."'></td></tr>\n";
        echo "</form>\n";
        echo "</table></center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsEditSave":
        $gname = strip_tags($gname, "<b><i><u>");
        $gdesc = strip_tags($gdesc, "<br><b><i><u>");
        $gname = stripslashes($gname);
        $gdesc = stripslashes($gdesc);
        if ($gname == "") { $gname = "Un-named"; }
        if (!get_magic_quotes_gpc()) { $gname = addslashes($gname); $gdesc = addslashes($gdesc); }
        $db->sql_query("UPDATE ".$prefix."_nsngr_groups SET gname='$gname', gdesc='$gdesc', gpublic='$gpublic', glimit='$glimit' WHERE gid='$gid'");
        Header("Location: admin.php?op=NSNGroupsView");
    break;

    case "NSNGroupsEmpty":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSEMPTY;
        include("header.php");
        title("$pagetitle");
        NSNGroupsAdmin();
        echo "<br>\n";
        OpenTable();
        list($gname) = $db->sql_fetchrow($db->sql_query("SELECT gname FROM ".$prefix."_nsngr_groups WHERE gid='$gid'"));
        echo "<center><table><tr>\n";
        echo "<form action='admin.php' method='post'>\n";
        echo "<input type='hidden' name='op' value='NSNGroupsEmptyConf'>\n";
        echo "<input type='hidden' name='gid' value='$gid'>\n";
        echo "<td align='center'>"._GR_EMPGROUP." #$gid ($gname)?</td>\n";
        echo "</tr><tr>\n";
        echo "<td align='center'><input type='submit' value='"._GR_EMPTY." &quot;$gname&quot;'></td>\n";
        echo "</form>\n";
        echo "</tr></table></center>\n";
        echo "<center>"._GOBACK."</center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsEmptyConf":
        $db->sql_query("DELETE FROM ".$prefix."_nsngr_users WHERE gid='$gid'");
        $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngr_users");
        Header("Location: admin.php?op=NSNGroupsView");
    break;

    case "NSNGroups":
    case "NSNGroupsView":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSVIEW;
        include ("header.php");
            if (!isset($min)) $min=0;
            if (!isset($max)) $max=$min+$grconfig['perpage'];
        title("$pagetitle");
        NSNGroupsAdmin();
        echo "<br>\n";
        OpenTable();
            $totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngr_groups"));
            grpagenums($op, $totalselected, $grconfig['perpage'], $max, $gid);
        echo "<center><table border='0' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2'>\n";
        echo "<tr bgcolor='$bgcolor2'>\n";
        echo "<td align='center' width='200'><b>"._GR_GRPNAME."</b></td>\n";
        echo "<td align='center' width='70'><b>"._GR_NUMUSERS."</b></td>\n";
        echo "<td align='center' width='70'><b>"._GR_TYPE."</b></td>\n";
        echo "<td align='center' width='70'><b>"._GR_LIMIT."</b></td>\n";
        echo "<td align='center' width='100'><b>"._FUNCTIONS."</b></td>\n";
        echo "</tr>\n";
        $result = $db->sql_query("SELECT gid, gname, gpublic, glimit FROM ".$prefix."_nsngr_groups ORDER BY gname LIMIT $min,".$grconfig['perpage']."");
        if ($db->sql_numrows($result) > 0) {
            while(list($gid, $gname, $gpublic, $glimit) = $db->sql_fetchrow($result)) {
                echo "<tr bgcolor='$bgcolor1' onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\">\n";
                echo "<td align='center'><a href='admin.php?op=NSNGroupsUsersView&amp;gid=$gid'>$gname</a> ($gid)</td>\n";
                $numusers = $db->sql_numrows($db->sql_query("SELECT uid FROM ".$prefix."_nsngr_users WHERE gid='$gid'"));
                echo "<td align='center'>$numusers</td>\n";
                if($gpublic == 1) { $grtype = _GR_PUBLIC; } else { $grtype = _GR_PRIVATE; }
                echo "<td align='center'>$grtype</td>\n";
                if($glimit == 0) { $grlimit = _GR_NOLIMIT; } else { $grlimit = $glimit; }
                echo "<td align='center'>$grlimit</td>\n";
                echo "<td align='center'>\n";
                echo "<a href='admin.php?op=NSNGroupsUsersAdd&amp;gid=$gid'><img src='images/groups/add.png' height='16' width='16' border='0' alt='"._GR_ADDUSR."' title='"._GR_ADDUSR."'></a>\n";
                echo "<a href='admin.php?op=NSNGroupsEdit&amp;gid=$gid'><img src='images/groups/edit.png' height='16' width='16' border='0' alt='"._GR_EDIT."' title='"._GR_EDIT."'></a>\n";
                echo "<a href='admin.php?op=NSNGroupsDelete&amp;gid=$gid'><img src='images/groups/delete.png' height='16' width='16' border='0' alt='"._GR_DELETE."' title='"._GR_DELETE."'></a>\n";
                echo "<a href='admin.php?op=NSNGroupsEmpty&amp;gid=$gid'><img src='images/groups/empty.png' height='16' width='16' border='0' alt='"._GR_EMPTY."' title='"._GR_EMPTY."'></a>\n";
                echo "</td>\n";
                echo "</tr>\n";
            }
        } else {
            echo "<tr bgcolor='$bgcolor1'><td align='center' colspan='5'>"._GR_NOGROUPS."</td></tr>\n";
        }
        echo "</table></center>\n";
            grpagenums($op, $totalselected, $grconfig['perpage'], $max, $gid);
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsUsersAdd":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSUSERSADD;
        include ("header.php");
            if (!isset($min)) $min=0;
            if (!isset($max)) $max=$min+$grconfig['perpage'];
        title("$pagetitle");
        NSNGroupsAdmin();
        echo "<br>\n";
        OpenTable();
        if ($gid > 0) {
            $totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE user_level>'0'"));
            grpagenums($op, $totalselected, $grconfig['perpage'], $max, $gid);
            echo "<center><table border='0' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2'>\n";
            echo "<form method='post' action='admin.php?op=NSNGroupsUsersAddSave'>\n";
            echo "<input type='hidden' name='gid' value='$gid'>\n";
            echo "<input type='hidden' name='min' value='$min'>\n";
            list($grpName) = $db->sql_fetchrow($db->sql_query("select gname from ".$prefix."_nsngr_groups where gid='$gid'"));
            echo "<tr><td align='center' colspan='2' bgcolor='$bgcolor2'>"._GR_ADDUSRTO." <a href='admin.php?op=NSNGroupsUsersView&amp;gid=$gid'><b>$grpName</b></a></td></tr>";
            $result3 = $db->sql_query("SELECT user_id, username FROM ".$user_prefix."_users WHERE user_level>'0' ORDER BY username LIMIT $min,".$grconfig['perpage']."");
            while(list($thisUID, $thisUNAME) = $db->sql_fetchrow($result3)) {
                echo "<tr bgcolor='$bgcolor1' onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\">\n";
                echo "<td>$thisUNAME</td>\n";
                if (!is_ingroup($thisUID,$gid)) {
                    echo "<td align='center'><input name='add_uid[]' type='checkbox' value='$thisUID'></td>\n";
                } else {
                    echo "<td align='center'><input name='add_uid[]' type='checkbox' value='$thisUID' disabled></td>\n";
                }
                echo "</tr>";
            }
//
            echo "<tr><td align='center' colspan='2'><nobr>"._GR_EXPIRES.": <select name='newmonth'>\n<option value='00'>--</option>\n";
            for($i = 1; $i <= 12; $i++){
                if($i == $fmon){ $sel = "selected"; } else { $sel = ""; }
                if($i < 10) { $r = "0".$i; } else { $r = $i; }
                echo "<option value='$r' $sel>$i</option>\n";
            }
            echo "</select><b>/</b><select name='newday'>\n<option value='00'>--</option>\n";
            for($i = 1; $i <= 31; $i++){
                if($i == $fday){ $sel = "selected"; } else { $sel = ""; }
                if($i < 10) { $r = "0".$i; } else { $r = $i; }
                echo "<option value='$r' $sel>$i</option>\n";
            }
            echo "</select><b>/</b><select name='newyear'>\n<option value='0000'>----</option>\n";
            for($i = date("Y"); $i <= date("Y")+5; $i++){
                if($i == $fyear){ $sel = "selected"; } else { $sel = ""; }
                if($i < 10) { $r = "0".$i; } else { $r = $i; }
                echo "<option value='$r' $sel>$i</option>\n";
            }
            echo "</select> <select name='newhour'>\n<option value='00'>--</option>\n";
            for($i = 0; $i <= 23; $i++){
                if($i == $fhour AND $fhour > 0){ $sel = "selected"; } else { $sel = ""; }
                if($i < 10) { $r = "0".$i; } else { $r = $i; }
                echo "<option value='$r' $sel>$i</option>\n";
            }
            echo "</select><b>:</b><select name='newmin'>\n<option value='00'>--</option>\n";
            for($i = 0; $i <= 59; $i++){
                if($i == $fmin AND $fmin > 0){ $sel = "selected"; } else { $sel = ""; }
                if($i < 10) { $r = "0".$i; } else { $r = $i; }
                echo "<option value='$r' $sel>$i</option>\n";
            }
            echo "</select><b>:00</b></nobr><br>"._GR_EXPIRENOTE."</td></tr>\n";
//
            echo "<tr><td align='center' colspan='2'><input type='submit' value='"._GR_ADDUSR."'></td></tr>\n";
            echo "</form>\n";
            echo "</table></center>\n";
            grpagenums($op, $totalselected, $grconfig['perpage'], $max, $gid);
        } else {
            echo "<center><table border='0' cellpadding='0' cellspacing='2'>\n";
            echo "<form method='post' action='admin.php?op=NSNGroupsUsersAdd'>\n";
            echo "<tr>\n";
            echo "<td align='center'>"._GR_ADDUSRTO."<br>";
            echo "<SELECT NAME='gid' size='5'>\n";
            $result3 = $db->sql_query("select gid, gname from ".$prefix."_nsngr_groups order by gname");
            while(list($thisGID, $thisGNAME) = $db->sql_fetchrow($result3)) {
                echo "<option value='$thisGID'>$thisGNAME</option><br>\n"; 
            }
            echo "</SELECT><br><input type='submit' value='"._GR_SELECTGRP."'></td>\n";
            echo "</tr>\n";
            echo "</form>\n";
            echo "</table></center>\n";
        }
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsUsersAddSave":
        $xdate = time();
        $datenew = $newyear."-".$newmonth."-".$newday." ".$newhour.":".$newmin.":00";
        if ($datenew == "0000-00-00 00:00:00") { $ydate = "0"; } else { $ydate = strtotime($datenew); }
        $j = count($add_uid);
        for ($i=0; $i < $j; $i++) {
            if (!is_ingroup($add_uid[$i],$gid)) {
                list($u_name) = $db->sql_fetchrow($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE user_id='$add_uid[$i]'"));
                $db->sql_query("INSERT INTO ".$prefix."_nsngr_users (gid, uid, uname, sdate, edate) VALUES ('$gid', '$add_uid[$i]', '$u_name', '$xdate', '$ydate')");
            }
        }
        Header("Location: admin.php?op=NSNGroupsUsersAdd&gid=$gid&min=$min");
    break;

    case "NSNGroupsUsersDelete":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSUSERSDELETE;
        include("header.php");
        title("$pagetitle");
        NSNGroupsAdmin();
        echo "<br>\n";
        OpenTable();
        list($gname) = $db->sql_fetchrow($db->sql_query("SELECT gname FROM ".$prefix."_nsngr_groups WHERE gid='$gid'"));
        echo "<center>"._GR_DELUSER." $chng_uid "._GR_FROM." #".$gid." (".$gname.")?</center><br>";
        echo "<center>[ <a href='admin.php?op=NSNGroupsUsersDeleteConf&amp;gid=$gid&amp;uid=$chng_uid'>"._GR_YES."</a> | <a href='admin.php?op=NSNGroupsView&amp;gid=$gid'>"._GR_NO."</a> ]</center>";
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsUsersDeleteConf":
        $db->sql_query("DELETE FROM ".$prefix."_nsngr_users WHERE gid='$gid' AND uid='$uid'");
        $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngr_users");
        Header("Location: admin.php?op=NSNGroupsUsersView&gid=$gid");
    break;

    case "NSNGroupsUsersDeleteSave":
        die("Delete Save Routine");
        //$j = count($del_uid);
        //for ($i=0; $i < $j; $i++) {
        //    $db->sql_query("DELETE FROM ".$prefix."_nsngr_users WHERE uid='$del_uid[$i]' AND gid='$gid'");
        //    $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngr_users");
        //}
        //Header("Location: admin.php?op=NSNGroupsUsersView&gid=$gid");
    break;

    case "NSNGroupsUsersExpire":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSUSERSEXPIRE;
        include("header.php");
        title("$pagetitle");
        NSNGroupsAdmin();
        echo "<br>\n";
        OpenTable();
        list($uname) = $db->sql_fetchrow($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE user_id='$chng_uid'"));
        list($gname) = $db->sql_fetchrow($db->sql_query("SELECT gname FROM ".$prefix."_nsngr_groups WHERE gid='$gid'"));
        echo "<center><table><tr>\n";
        echo "<form action='admin.php' method='post'>\n";
        echo "<input type='hidden' name='op' value='NSNGroupsUsersExpireDone'>\n";
        echo "<input type='hidden' name='gid' value='$gid'>\n";
        echo "<input type='hidden' name='uid' value='$chng_uid'>\n";
        echo "<td align='center'>"._GR_EXPUSER." #$chng_uid ($uname) "._GR_FROM." $gname?</td>\n";
        echo "</tr><tr>\n";
        echo "<td align='center'><input type='submit' value='"._GR_EXPIRE." &quot;$uname&quot;'></td>\n";
        echo "</form>\n";
        echo "</tr></table></center>\n";
        echo "<center>"._GOBACK."</center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsUsersExpireDone":
        $newDate = time() - 86400;
        $db->sql_query("UPDATE ".$prefix."_nsngr_users SET edate='$newDate' WHERE gid='$gid' AND uid='$uid'");
        Header("Location: admin.php?op=NSNGroupsUsersView&gid=$gid");
    break;

    case "NSNGroupsUsersExpireSave":
        $newDate = time() - 86400;
        $j = count($exp_uid);
        for ($i=0; $i < $j; $i++) {
            $db->sql_query("UPDATE ".$prefix."_nsngr_users SET edate='$newDate' WHERE gid='$gid' AND uid='$exp_uid[$i]'");
            $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngr_users");
        }
        Header("Location: admin.php?op=NSNGroupsUsersView&gid=$gid");
    break;

    case "NSNGroupsUsersMove":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSUSERSMOVE;
        include ("header.php");
        title("$pagetitle");
        NSNGroupsAdmin();
        echo "<br>\n";
        OpenTable();
        echo "<center><table border='0' cellpadding='0' cellspacing='2'>\n";
        echo "<form method='post' action='admin.php?op=NSNGroupsUsersMoveSave'>\n";
        echo "<input type='hidden' name='gid' value='$gid'>\n";
        echo "<input type='hidden' name='uid' value='$chng_uid'>\n";
        echo "<tr>\n";
        list($uname) = $db->sql_fetchrow($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE user_id='$chng_uid'"));
        echo "<td class='content' align='center'>"._GR_USRNAME.": $uname<br>\n";
        list($gname) = $db->sql_fetchrow($db->sql_query("SELECT gname FROM ".$prefix."_nsngr_groups WHERE gid='$gid'"));
        echo ""._GR_CURRGROUP.": $gname<br>\n";
        echo ""._GR_NEWGROUP.": <SELECT NAME='new_gid'>\n";
        $result3 = $db->sql_query("select gid, gname from ".$prefix."_nsngr_groups order by gname");
        while(list($thisGID, $thisGNAME) = $db->sql_fetchrow($result3)) {
            if ($thisGID != $gid) {
                echo "<option value='$thisGID'>$thisGNAME</option><br>\n";
            }
        }
        echo "</select><br>\n";
        echo "<input type='submit' value='"._GR_MOVEUSR."'></td>\n";
        echo "</tr>\n";
        echo "</form>\n";
        echo "</table></center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsUsersMoveSave":
        if (!is_ingroup($uid,$new_gid)) {
            $db->sql_query("UPDATE ".$prefix."_nsngr_users SET gid='$new_gid' WHERE gid='$gid' AND uid='$uid'");
        }
        Header("Location: admin.php?op=NSNGroupsUsersView&gid=$new_gid");
    break;

    case "NSNGroupsUsersUpdate":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSUSERSUPDATE;
        include("header.php");
        title("$pagetitle");
        NSNGroupsAdmin();
        echo "<br>\n";
        OpenTable();
        list($uemail) = $db->sql_fetchrow($db->sql_query("SELECT user_email FROM ".$user_prefix."_users WHERE user_id='$chng_uid'"));
        list($uname, $edate) = $db->sql_fetchrow($db->sql_query("SELECT uname, edate FROM ".$prefix."_nsngr_users WHERE uid='$chng_uid' AND gid='$gid'"));
        echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<form action='admin.php' method='post'>\n";
        echo "<input type='hidden' name='op' value='NSNGroupsUsersUpdateSave'>\n";
        echo "<input type='hidden' name='gid' value='$gid'>\n";
        echo "<input type='hidden' name='chng_uid' value='$chng_uid'>\n";
        echo "<tr><td bgcolor='$bgcolor2'>"._GR_USRNAME.":</td><td bgcolor='$bgcolor1'><b>$uname</b></td></tr>\n";
        echo "<tr><td bgcolor='$bgcolor2'>"._GR_USRMAIL.":</td><td bgcolor='$bgcolor1'><b>$uemail</b></td></tr>\n";
        if ($edate > 0) {
            $fday = date("j",$edate);
            $fmon = date("n",$edate);
            $fyear = date("Y",$edate);
            $fhour = date("G",$edate);
            $fmin = date("i",$edate);
        } else {
            $fday = "00";
            $fmon = "00";
            $fyear = "0000";
            $fhour = "00";
            $fmin = "00";
        }
        echo "<tr><td bgcolor='$bgcolor2' valign='top'>"._GR_EXPIRES.":</td><td bgcolor='$bgcolor1'><select name='newmonth'>\n<option value='00'>--</option>\n";
        for($i = 1; $i <= 12; $i++){
            if($i == $fmon){ $sel = "selected"; } else { $sel = ""; }
            if($i < 10) { $r = "0".$i; } else { $r = $i; }
            echo "<option value='$r' $sel>$i</option>\n";
        }
        echo "</select><b>/</b><select name='newday'>\n<option value='00'>--</option>\n";
        for($i = 1; $i <= 31; $i++){
            if($i == $fday){ $sel = "selected"; } else { $sel = ""; }
            if($i < 10) { $r = "0".$i; } else { $r = $i; }
            echo "<option value='$r' $sel>$i</option>\n";
        }
        echo "</select><b>/</b><select name='newyear'>\n<option value='0000'>----</option>\n";
        for($i = date("Y"); $i <= date("Y")+5; $i++){
            if($i == $fyear){ $sel = "selected"; } else { $sel = ""; }
            if($i < 10) { $r = "0".$i; } else { $r = $i; }
            echo "<option value='$r' $sel>$i</option>\n";
        }
        echo "</select> <select name='newhour'>\n<option value='00'>--</option>\n";
        for($i = 0; $i <= 23; $i++){
            if($i == $fhour AND $fhour > 0){ $sel = "selected"; } else { $sel = ""; }
            if($i < 10) { $r = "0".$i; } else { $r = $i; }
            echo "<option value='$r' $sel>$i</option>\n";
        }
        echo "</select><b>:</b><select name='newmin'>\n<option value='00'>--</option>\n";
        for($i = 0; $i <= 59; $i++){
            if($i == $fmin AND $fmin > 0){ $sel = "selected"; } else { $sel = ""; }
            if($i < 10) { $r = "0".$i; } else { $r = $i; }
            echo "<option value='$r' $sel>$i</option>\n";
        }
        echo "</select><b>:00</b><br>"._GR_EXPIRENOTE."</td></tr>\n";
        echo "<tr><td align='center' bgcolor='$bgcolor1' colspan='2'><input type='submit' value='"._GR_UPDATE." &quot;$uname&quot;'></td></tr>\n";
        echo "</form></table></center>\n";
        echo "<center>"._GOBACK."</center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsUsersUpdateSave":
        $datenew = $newyear."-".$newmonth."-".$newday." ".$newhour.":".$newmin.":00";
        if ($datenew == "0000-00-00 00:00:00") { $newdate = "0"; } else { $newdate = strtotime($datenew); }
        $db->sql_query("UPDATE ".$prefix."_nsngr_users SET edate='$newdate', notice='0' WHERE gid='$gid' AND uid='$chng_uid'");
        Header("Location: admin.php?op=NSNGroupsUsersView&gid=$gid");
    break;

    case "NSNGroupsUsersView":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSUSERSVIEW;
        include ("header.php");
        if (!isset($min)) $min=0;
        if (!isset($max)) $max=$min+$grconfig['perpage'];
        title("$pagetitle");
        NSNGroupsAdmin();
        echo "<br>\n";
        OpenTable();
        echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<form method='post' action='admin.php?op=NSNGroupsUsersView'>\n";
        echo "<tr>\n<td align='center'><SELECT NAME='gid'>\n";
        echo "<option value='0'";
        if ($gid == 0) { echo " selected"; }
        echo ">"._GR_ALLGROUP."</option><br>\n";
        $result3 = $db->sql_query("select gid, gname from ".$prefix."_nsngr_groups order by gname");
        while(list($thisGID, $thisGNAME) = $db->sql_fetchrow($result3)) {
            echo "<option value='$thisGID'";
            if ($gid == $thisGID) { echo " selected"; }
            echo ">$thisGNAME</option><br>\n";
        }
        echo "</SELECT> <input type='submit' value='"._GR_SELECTGRP."'></td>\n</tr>\n";
        echo "</form>\n";
        echo "</table></center>\n";
        if ($gid > 0) { echo "<center><a href='admin.php?op=NSNGroupsUsersAdd&amp;gid=$gid'>"._GR_ADDUSRS."</a></center>"; }
        echo "<br>\n";
        if ($gid == 0) {
           $totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngr_users ORDER BY uname,gid"));
        } else {
           $totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngr_users WHERE gid=$gid ORDER BY uname"));
        }
        grpagenums($op, $totalselected, $grconfig['perpage'], $max, $gid);
        echo "<center><table border='0' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2'>\n";
        echo "<form method='post' action='admin.php?op=NSNGroupsUsersExpireSave'>\n";
        if ($gid > 0) { echo "<input name='gid' type='hidden' value='$gid'>\n"; }
        echo "<tr>\n";
        echo "<td align='center'><b>"._GR_USERNAME."</b></td>\n";
        echo "<td align='center'><b>"._GR_GROUP."</b></td>\n";
        echo "<td align='center'><b>"._GR_START."</b></td>\n";
        echo "<td align='center'><b>"._GR_EXPIRES."</b></td>\n";
        if ($gid > 0) { echo "<td align='center'><b>"._GR_EXPUSR."</b></td>\n"; }
        echo "<td align='center'><b>"._FUNCTIONS."</b></td>\n";
        echo "</tr>\n";
        if ($gid == 0) {
           $result = $db->sql_query("SELECT gid, uid, uname, sdate, edate FROM ".$prefix."_nsngr_users ORDER BY uname,gid LIMIT $min,".$grconfig['perpage']."");
        } else {
           $result = $db->sql_query("SELECT gid, uid, uname, sdate, edate FROM ".$prefix."_nsngr_users WHERE gid=$gid ORDER BY uname LIMIT $min,".$grconfig['perpage']."");
        }
        if ($db->sql_numrows($result) > 0) {
            while(list($thisGroup, $thisUser, $thisName, $sDate, $eDate) = $db->sql_fetchrow($result)) {
                list($grpName) = $db->sql_fetchrow($db->sql_query("select gname from ".$prefix."_nsngr_groups where gid='$thisGroup'"));
                $thisDate = time();
                if ($eDate=="0") {
                    $eDate = "<i>"._GR_NOLIMIT."</i>";
                } elseif ($eDate < $thisDate) {
                    $eDate = "<b>"._GR_EXPIRED."</b>";
                } else {
                    $eDate = date("Y-m-d",$eDate);
                }
                echo "<tr bgcolor='$bgcolor1' onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\">\n";
                echo "<td align='center'>&nbsp;$thisName&nbsp;</td>\n";
                echo "<td align='center'>&nbsp;$grpName&nbsp;</td>\n";
                echo "<td align='center'>&nbsp;".date("Y-m-d",$sDate)."&nbsp;</td>\n";
                echo "<td align='center'>&nbsp;$eDate&nbsp;</td>\n";
                if ($gid > 0) { echo "<td align='center'><input name='exp_uid[]' type='checkbox' value='$thisUser'></td>\n"; }
                echo "<td align='center'>&nbsp;\n";
                echo "<a href='admin.php?op=NSNGroupsUsersMove&amp;chng_uid=$thisUser&amp;gid=$thisGroup'><img src='images/groups/move.png' height='16' width='16' border='0' alt='"._GR_MOVE."' title='"._GR_MOVE."'></a>\n";
                if ($gid == 0) { echo "<a href='admin.php?op=NSNGroupsUsersExpire&amp;chng_uid=$thisUser&amp;gid=$thisGroup'><img src='images/groups/expire.png' height='16' width='16' border='0' alt='"._GR_EXPIRE."' title='"._GR_EXPIRE."'></a>\n"; }
                echo "<a href='admin.php?op=NSNGroupsUsersUpdate&amp;chng_uid=$thisUser&amp;gid=$thisGroup'><img src='images/groups/edit.png' height='16' width='16' border='0' alt='"._GR_UPDATE."' title='"._GR_UPDATE."'></a>\n";
                if ($gid == 0) { echo "<a href='admin.php?op=NSNGroupsUsersDelete&amp;chng_uid=$thisUser&amp;gid=$thisGroup'><img src='images/groups/delete.png' height='16' width='16' border='0' alt='"._GR_DELETE."' title='"._GR_DELETE."'></a>\n"; }
                echo "&nbsp;</td>\n";
                echo "</tr>\n";
            }
            if ($gid > 0) {
                echo "<tr bgcolor='$bgcolor2'><td align='center' colspan='4'>&nbsp;</td>";
                echo "<td align='center'><input type='submit' value='"._GR_EXPUSR."'></td>";
                echo "<td>&nbsp;</td></tr>\n";
            }
        } else {
            echo "<tr bgcolor='$bgcolor1'><td align='center' ";
            if ($gid > 0) { echo "colspan='6'>"; } else { echo "colspan='5'>"; }
            if ($gid == 0) { echo _GR_NOUSERS; } else { echo _GR_NOUSER; }
            echo "</td></tr>\n";
        }
        echo "</form>\n";
        echo "</table></center>\n";
            grpagenums($op, $totalselected, $grconfig['perpage'], $max, $gid);
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsUsersEmail":
        $pagetitle = _GR_ADMIN.": "._GR_GROUPSEMAIL;
        include ("header.php");
        NSNGroupsAdmin();
        echo "<br>\n";
        title("$pagetitle");
        OpenTable();
        echo "<center><form method='post' action='admin.php'>\n";
        echo "<b>"._GR_TYPE.":</b> <select name='etype'>\n";
        echo "<option value='0'>"._GR_TEXT."</option>\n<option value='1'>"._GR_HTML."</option>\n";
        echo "</select><br><br>\n";
        echo "<b>"._GR_FROMA.":</b> $aname<br><br>\n";
        echo "<b>"._GR_TO.":</b> <select name='gid'>\n";
        echo "<option value='0'>"._GR_ALLGR."</option>\n";
        $result = $db->sql_query("SELECT gid, gname FROM ".$prefix."_nsngr_groups ORDER BY gname");
        while (list($gid, $gname) = $db->sql_fetchrow($result)) { echo "<option value='$gid'>$gname</option>\n"; }
        echo "</select><br><br>\n";
        echo "<b>"._GR_SUB.":</b> <input type='text' name='gsubject' size='50'><br><br>\n";
        echo "<b>"._GR_MES.":</b><br><textarea name='gcontent' cols='60' rows='20'></textarea><br><br>\n";
        echo "<input type='hidden' name='aname' value='$aname'>\n";
        echo "<input type='hidden' name='amail' value='$amail'>\n";
        echo "<input type='hidden' name='op' value='NSNGroupsUsersEmailSend'>\n";
        echo "<input type='submit' value='"._GR_SEND."'>\n";
        echo "</form>";
        CloseTable();
        include("footer.php");
    break;

    case "NSNGroupsUsersEmailSend":
        $gcontent = stripslashes($gcontent);
        $headers  = "MIME-Version: 1.0\n";
        if ($etype < 1) {
            $headers .= "Content-Type: text/plain; charset=iso-8859-1\n";
            $gcontent .= "\n--------------------\n"._GR_THANK.";\n$aname <$amail>";
        } else {
            $headers .= "Content-Type: text/html; charset=iso-8859-1\n";
            $gcontent .= "<hr>"._GR_THANK.";<br><a href='mailto:$amail'>$aname</a>";
        }
        $headers .= "From: $aname <$amail>\r\n";
        $headers .= "Return-Path: $amail\r\n";
        $headers .= "Reply-To: $amail\r\n";
        $headers .= "X-Mailer: NSN Groups";
        if ($gid == 0) {
            $gsubject = "[$sitename "._GR_GLET."]: ".stripslashes($gsubject)."";
            $result = $db->sql_query("SELECT uid FROM ".$user_prefix."_nsngr_users");
            while(list($guid) = $db->sql_fetchrow($result)) {
                list($email) = $db->sql_fetchrow($db->sql_query("SELECT user_email FROM ".$user_prefix."_users WHERE user_id='$guid'"));
                $to = ""._GR_GLET." <$email>";
                mail($to, $gsubject, $gcontent, $headers);
            }
            Header("Location: admin.php?op=NSNGroups");
        } else {
            list($gname) = $db->sql_fetchrow($db->sql_query("SELECT gname FROM ".$prefix."_nsngr_groups WHERE gid='$gid'"));
            $gsubject = "[$gname "._GR_GLET."]: ".stripslashes($gsubject)."";
            $result = $db->sql_query("SELECT uid FROM ".$prefix."_nsngr_users WHERE gid='$gid'");
            while(list($guid) = $db->sql_fetchrow($result)) {
                list($email) = $db->sql_fetchrow($db->sql_query("SELECT user_email FROM ".$user_prefix."_users WHERE user_id='$guid'"));
                $to = "$gname <$email>";
                mail($to, $gsubject, $gcontent, $headers);
            }
            Header("Location: admin.php?op=NSNGroups");
        }
    break;

}

} else {
    echo "Access Denied";
}

?>
