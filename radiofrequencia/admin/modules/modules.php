<?php

# $Author: chatserv $
# $Date: 2004/12/07 22:20:10 $
/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/*                                                                      */
/************************************************************************/
/* Additional security checking code 2003 by chatserv                   */
/* http://www.nukefixes.com -- http://www.nukeresources.com             */
/************************************************************************/

if ( !defined('ADMIN_FILE') )
{
	die("Illegal File Access");
}
if (!stristr($_SERVER['SCRIPT_NAME'], "admin.php")) { die ("Access Denied"); }
global $prefix, $db;
$aid = substr("$aid", 0,25);
$row = $db->sql_fetchrow($db->sql_query("SELECT radminsuper FROM " . $prefix . "_authors WHERE aid='$aid'"));
if ($row['radminsuper'] == 1) {

/*********************************************************/
/* Modules Functions                                     */
/*********************************************************/

function modules() {
    global $prefix, $db, $multilingual, $bgcolor2;
    include ("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _MODULESADMIN . "</b></font></center>";
    CloseTable();
    $handle=opendir('modules');
    while ($file = readdir($handle)) {
	if ( (!ereg("[.]",$file)) ) {
		$modlist .= "$file ";
	}
    }
    closedir($handle);
    $modlist = explode(" ", $modlist);
    sort($modlist);
    for ($i=0; $i < sizeof($modlist); $i++) {
	if($modlist[$i] != "") {
	    $row = $db->sql_fetchrow($db->sql_query("SELECT mid from " . $prefix . "_modules where title='$modlist[$i]'"));
	    $mid = intval($row['mid']);
	    if ($mid == "") {
		$db->sql_query("INSERT INTO ".$prefix."_modules VALUES (NULL, '$modlist[$i]', '$mod_uname', '0', '0', '1', '0', '0', '')");
//		$db->sql_query("insert into " . $prefix . "_modules values (NULL, '$modlist[$i]', '$modlist[$i]', '0', '0', '1', '0', '')");
	    }
	}
    }
    $result2 = $db->sql_query("SELECT title from " . $prefix . "_modules");
    while ($row2 = $db->sql_fetchrow($result2)) {
	$title = $row2['title'];
	$a = 0;
	$handle=opendir('modules');
	while ($file = readdir($handle)) {
	    if ($file == $title) {
		$a = 1;
	    }
	}
	closedir($handle);
	if ($a == 0) {
	    $db->sql_query("delete from " . $prefix . "_modules where title='$title'");
	}
    }
    echo "<br>";
    OpenTable();
    echo "<br><center><font class=\"option\">" . _MODULESADDONS . "</font><br><br>"
	."<font class=\"content\">" . _MODULESACTIVATION . "</font><br><br>"
	."" . _MODULEHOMENOTE . "<br><br>" . _NOTINMENU . "<br><br>"
	."<form action=\"admin.php\" method=\"post\">"
        ."<table border=\"1\" align=\"center\" width=\"90%\"><tr><td align=\"center\" bgcolor=\"$bgcolor2\">"
	."<b>"._TITLE."</b></td><td align=\"center\" bgcolor=\"$bgcolor2\"><b>"._CUSTOMTITLE."</b></td><td align=\"center\" bgcolor=\"$bgcolor2\"><b>"._STATUS."</b></td><td align=\"center\" bgcolor=\"$bgcolor2\"><b>"._VIEW."</b></td><td align=\"center\" bgcolor=\"$bgcolor2\"><b>"._GROUP."</b></td><td align=\"center\" bgcolor=\"$bgcolor2\"><b>"._FUNCTIONS."</b></td></tr>";
    $main_m = $db->sql_fetchrow($db->sql_query("SELECT main_module from " . $prefix . "_main"));
    $main_module = $main_m['main_module'];
    $result3 = $db->sql_query("SELECT mid, title, custom_title, active, view, inmenu, mod_group from " . $prefix . "_modules order by title ASC");
    while ($row3 = $db->sql_fetchrow($result3)) {
	$mid = intval($row3['mid']);
	$title = $row3['title'];
	$custom_title = $row3['custom_title'];
	$active = intval($row3['active']);
	$view = intval($row3['view']);
	$inmenu = intval($row3['inmenu']);
	$mod_group = intval($row3['mod_group']);
	if ($custom_title == "") {
	    $custom_title = ereg_replace("_"," ",$title);
	    $db->sql_query("update " . $prefix . "_modules set custom_title='$custom_title' where mid='$mid'");
	}
	if ($active == 1) {
	    $active = _ACTIVE;
	    $change = _DEACTIVATE;
	    $act = 0;
	} else {
	    $active = "<i>" . _INACTIVE . "</i>";
	    $change = _ACTIVATE;
	    $act = 1;
	}
	if ($custom_title == "") {
	    $custom_title = ereg_replace("_", " ", $title);
	}
	if ($view == 0) {
	    $who_view = _MVALL;
	} elseif ($view == 1) {
	    $who_view = _MVUSERS;
/*	} elseif ($view == 2) {
	    $who_view = _MVADMIN;
	} elseif ($view == 3) {
	    $who_view = _SUBUSERS;
	} */
	} elseif ($view == 2) {
	    $who_view = _MVADMIN;
	} elseif ($view == 3) {
	    $who_view = _SUBUSERS;
        } elseif ($view > 3) {
            $who_view = _MVGROUPS;
	}
	if ($title != $main_module AND $inmenu == 0) {
	    $title = "[ <big><strong>&middot;</strong></big> ] $title";
	}
	if ($title == $main_module) {
	    $title = "<b>$title</b>";
	    $custom_title = "<b>$custom_title</b>";
	    $active = "<b>$active (" . _INHOME . ")</b>";
	    $who_view = "<b>$who_view</b>";
	    $puthome = "<i>" . _PUTINHOME . "</i>";
	    $change_status = "<i>$change</i>";
	    $background = "bgcolor=\"$bgcolor2\"";
	} else {
	    $puthome = "<a href=\"admin.php?op=home_module&mid=$mid\">" . _PUTINHOME . "</a>";
	    $change_status = "<a href=\"admin.php?op=module_status&mid=$mid&active=$act\">$change</a>";
	    $background = "";
	}
	if ($mod_group != 0) {
	    $grp = $db->sql_fetchrow($db->sql_query("SELECT name FROM ".$prefix."_groups WHERE id='$mod_group'"));
	    $mod_group = $grp['name'];
	} else {
	    $mod_group = _NONE;
	}
	echo "<tr><td $background>&nbsp;$title</td><td align=\"center\" $background>$custom_title</td><td align=\"center\" $background>$active</td><td align=\"center\" $background>$who_view</td><td align=\"center\" $background>$mod_group</td><td align=\"center\" $background nowrap>[ <a href=\"admin.php?op=module_edit&mid=$mid\">"._EDIT."</a> | $change_status | $puthome ]</td></tr>";
    }
    echo "</table></form></center>";
    CloseTable();
    include ("footer.php");
}

function home_module($mid, $ok=0) {
    global $prefix, $db;
    $mid = intval($mid);
    if ($ok == 0) {
	include ("header.php");
	GraphicAdmin();
	title("" . _HOMECONFIG . "");
	OpenTable();
        $row = $db->sql_fetchrow($db->sql_query("SELECT title from " . $prefix . "_modules where mid='$mid'"));
        $new_m = $row['title'];
        $row2 = $db->sql_fetchrow($db->sql_query("SELECT main_module from " . $prefix . "_main"));
        $old_m = $row2['main_module'];
	echo "<center><b>" . _DEFHOMEMODULE . "</b><br><br>"
	    ."" . _SURETOCHANGEMOD . " <b>$old_m</b> " . _TO . " <b>$new_m</b>?<br><br>"
	    ."[ <a href=\"admin.php?op=modules\">" . _NO . "</a> | <a href=\"admin.php?op=home_module&mid=$mid&ok=1\">" . _YES . "</a> ]</center>";
	CloseTable();
	include("footer.php");
    } else {
        $row3 = $db->sql_fetchrow($db->sql_query("SELECT title from " . $prefix . "_modules where mid='$mid'"));
        $title = $row3['title'];
	$active = 1;
	$view = 0;
	$res = $db->sql_query("update " . $prefix . "_main set main_module='$title'");
	$res2 = $db->sql_query("update " . $prefix . "_modules set active='$active', view='$view' where mid='$mid'");
	Header("Location: admin.php?op=modules");
    }
}

function module_status($mid, $active) {
    global $prefix, $db;
    $mid = intval($mid);
    $db->sql_query("update " . $prefix . "_modules set active='$active' where mid='$mid'");
    Header("Location: admin.php?op=modules");
}

function module_edit($mid) {
    global $prefix, $db;
    $main_m = $db->sql_fetchrow($db->sql_query("SELECT main_module from " . $prefix . "_main"));
    $main_module = $main_m['main_module'];
    $mid = intval($mid);
//    $row = $db->sql_fetchrow($db->sql_query("SELECT title, custom_title, view, inmenu, mod_group from " . $prefix . "_modules where mid='$mid'"));
//	$title = $row['title'];
	$row = $db->sql_fetchrow($db->sql_query("SELECT * from " . $prefix . "_modules where mid='$mid'"));
    $groups = $row['groups'];
	$title = $row['title'];
	$custom_title = $row['custom_title'];
	$view = intval($row['view']);
	$inmenu = intval($row['inmenu']);
	$mod_group = intval($row['mod_group']);
    include ("header.php");
    GraphicAdmin();
    title("" . _MODULEEDIT . "");
    OpenTable();
/*    if ($view == 0) {
	$sel1 = "selected";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "";
    } elseif ($view == 1) {
	$sel1 = "";
	$sel2 = "selected";
	$sel3 = "";
	$sel4 = "";
    } elseif ($view == 2) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "selected";    
	$sel4 = "";
    } elseif ($view == 3) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "selected";
    } */
	if ($view == 0) {
	$sel1 = "selected";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "";
	$sel5 = "";
    } elseif ($view == 1) {
	$sel1 = "";
	$sel2 = "selected";
	$sel3 = "";
	$sel4 = "";
	$sel5 = "";
    } elseif ($view == 2) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "selected";    
	$sel4 = "";
	$sel5 = "";
    } elseif ($view == 3) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "selected";
	$sel5 = "";
    } elseif ($view > 3) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "";
        $sel5 = "selected";
    }
    if ($title == $main_module) {
	$a = " - " . _INHOME . "";
    } else {
	$a = "";
    }
    if ($inmenu == 1) {
	$insel1 = "checked";
	$insel2 = "";
    } elseif ($inmenu == 0) {
	$insel1 = "";
	$insel2 = "checked";
    }
    echo "<center><b>" . _CHANGEMODNAME . "</b><br>($title$a)</center><br><br>"
	."<form action=\"admin.php\" method=\"post\">"
	."<table border=\"0\"><tr><td>"
	."" . _CUSTOMMODNAME . "</td><td>"
	."<input type=\"text\" name=\"custom_title\" value=\"$custom_title\" size=\"50\"></td></tr>";
    if ($title == $main_module) {
	echo "<input type=\"hidden\" name=\"view\" value=\"0\">"
	    ."<input type=\"hidden\" name=\"inmenu\" value=\"$inmenu\">"
	    ."</table><br><br>";
    } else {
/*	echo "<tr><td>" . _VIEWPRIV . "</td><td><select name=\"view\">"
	    ."<option value=\"0\" $sel1>" . _MVALL . "</option>"
	    ."<option value=\"1\" $sel2>" . _MVUSERS . "</option>"
	    ."<option value=\"2\" $sel3>" . _MVADMIN . "</option>"
	    ."<option value=\"3\" $sel4>" . _SUBUSERS . "</option>"
	    ."</select></td></tr>"; */
	echo "<tr><td>" . _VIEWPRIV . "</td><td><select name=\"view\">"
	    ."<option value=\"0\" $sel1>" . _MVALL . "</option>"
	    ."<option value=\"1\" $sel2>" . _MVUSERS . "</option>"
	    ."<option value=\"2\" $sel3>" . _MVADMIN . "</option>"
	    ."<option value=\"3\" $sel4>" . _SUBUSERS . "</option>"
            ."<option value=\"4\" $sel5>"._MVGROUPS."</option>"
	    ."</select></td></tr>";
   	echo "<tr><td valign='top'><b>"._WHATGROUPS.":</b></td><td><font class='tiny'>"._WHATGRDESC."</font><br><select name='groups[]' multiple size='5'>";
        $ingroups = explode("-",$groups);
        $groupsResult = $db->sql_query("select gid, gname from ".$prefix."_nsngr_groups");
        while(list($gid, $gname) = $db->sql_fetchrow($groupsResult)) {
            if(in_array($gid,$ingroups)) { $sel = " selected"; } else { $sel = ""; }
            echo "<OPTION VALUE='$gid'$sel>$gname</option>";
        }
        echo "</select></td></tr>";
	$numrow = $db->sql_numrows($db->sql_query("SELECT * FROM " . $prefix . "_groups"));
	if ($numrow > 0) {
	    echo "<tr><td>" . _UGROUP . "</td><td><select name=\"mod_group\">";
        $result2 = $db->sql_query("SELECT id, name FROM " . $prefix . "_groups");
        while ($row2 = $db->sql_fetchrow($result2)) {
		if ($row2[id] == $mod_group) { $gsel = "selected"; } else { $gsel = ""; }
		if ($dummy != 1) {
		    if ($mod_group == 0) { $ggsel = "selected"; } else { $ggsel = ""; }
		    echo "<option value=\"0\" $ggsel>" . _NONE . "</option>";
		    $dummy = 1;
		}
		echo "<option value=\"$row2[id]\" $gsel>$row2[name]</option>";
		$gsel = "";
	    }
	    echo "</select>&nbsp;<i>(" . _VALIDIFREG . ")</i></td></tr>";
	} else {
	    echo "<input type=\"hidden\" name=\"mod_group\" value=\"0\">";
	}
	echo "<tr><td>"._SHOWINMENU."</td><td>"
	    ."<input type=\"radio\" name=\"inmenu\" value=\"1\" $insel1> " . _YES . " &nbsp;&nbsp; <input type=\"radio\" name=\"inmenu\" value=\"0\" $insel2> " . _NO . ""
	    ."</td></tr></table><br><br>";
    }
    if ($title != $main_module) {
	
    }
    echo "<input type=\"hidden\" name=\"mid\" value=\"$mid\">"
	."<input type=\"hidden\" name=\"op\" value=\"module_edit_save\">"
	."<input type=\"submit\" value=\"" . _SAVECHANGES . "\">"
	."</form>"
	."<br><br><center>" . _GOBACK . "</center>";
    CloseTable();
    include("footer.php");
}

/* function module_edit_save($mid, $custom_title, $view, $inmenu, $mod_group) {
    global $prefix, $db;
    $mid = intval($mid);
    if ($view != 1) { $mod_group = 0; }
    $result = $db->sql_query("update " . $prefix . "_modules set custom_title='$custom_title', view='$view', inmenu='$inmenu', mod_group='$mod_group' where mid='$mid'");
    Header("Location: admin.php?op=modules");
} */

function module_edit_save($mid, $custom_title, $view, $groups, $inmenu, $mod_group) {
    global $prefix, $db;
    if($view == 4) { $ingroups = implode("-",$groups); }
    if($view < 4) { $ingroups = ""; }
    $mid = intval($mid);
    if ($view != 1) { $mod_group = 0; }
    $result = $db->sql_query("update " . $prefix . "_modules set custom_title='$custom_title', view='$view', groups='$ingroups', inmenu='$inmenu', mod_group='$mod_group' where mid='$mid'");
    Header("Location: admin.php?op=modules");
}

switch ($op){

    case "modules":
    modules();
    break;

    case "module_status":
    module_status($mid, $active);
    break;

    case "module_edit":
    module_edit($mid);
    break;
    
    case "module_edit_save":
//    module_edit_save($mid, $custom_title, $view, $inmenu, $mod_group);
	module_edit_save($mid, $custom_title, $view, $groups, $inmenu, $mod_group);
    break;

    case "home_module":
    home_module($mid, $ok);
    break;

}

} else {
    echo "Access Denied";
}
# $Log: modules.php,v $
# Revision 1.3  2004/12/07 22:20:10  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.2  2004/11/24 22:40:13  chatserv
# Version 2.7 Release
#
# Revision 1.1  2004/10/04 23:27:53  chatserv
# Initial CVS Addition
#

?>