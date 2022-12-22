<?php

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
/*         Additional security & Abstraction layer conversion           */
/*                           2003 chatserv                              */
/*      http://www.nukefixes.com -- http://www.nukeresources.com        */
/************************************************************************/

if (!eregi("admin.php", $_SERVER['PHP_SELF'])) { die ("Access Denied"); }
global $prefix, $db;
$aid = substr("$aid", 0,25);
$row = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='Content'"));
$row2 = $db->sql_fetchrow($db->sql_query("SELECT name, radminsuper FROM ".$prefix."_authors WHERE aid='$aid'"));
$admins = explode(",", $row['admins']);
$auth_user = 0;
for ($i=0; $i < sizeof($admins); $i++) {
    if ($row2['name'] == "$admins[$i]" AND $row['admins'] != "") {
        $auth_user = 1;	
    }
}

if ($row2['radminsuper'] == 1 || $auth_user == 1) {

// include Editor Start
include("modules/FCKeditor/fckeditor.php");
// include Editor Ende  

/*********************************************************/
/* Sections Manager Functions                            */
/*********************************************************/

function content() {
    global $prefix, $db, $language, $multilingual, $bgcolor2, $copy;
    include("header.php");
    GraphicAdmin();
    title("" . _CONTENTMANAGER . "");
    OpenTable();
    echo "<table border=\"0\" width=\"100%\"><tr>"
	."<td bgcolor=\"$bgcolor2\"><b>" . _TITLE . "</b></td><td align=\"center\" bgcolor=\"$bgcolor2\"><b>" . _CURRENTSTATUS . "</b></td><td align=\"center\" bgcolor=\"$bgcolor2\"><b>" . _CATEGORY . "</b></td><td align=\"center\" bgcolor=\"$bgcolor2\"><b>" . _FUNCTIONS . "</b></td></tr>";
    $result = $db->sql_query("SELECT * from " . $prefix . "_pages order by pid");
    while ($mypages = $db->sql_fetchrow($result)) {
    $mycid = intval($mypages['cid']);
    $myactive = intval($mypages['active']);
    $mypid = intval($mypages['pid']);
    $mytitle = $mypages['title'];
	if ($mycid == "0" OR $mycid == "") {
            $cat_title = _NONE;
        } else {
    $row_res = $db->sql_fetchrow($db->sql_query("SELECT title from " . $prefix . "_pages_categories where cid='$mycid'"));
    $cat_title = $row_res['title'];
        }
	if ($myactive == 1) {
            $status = _ACTIVE;
            $status_chng = _DEACTIVATE;
            $active = 1;
        } else {
	    $status = "<i>" . _INACTIVE . "</i>";
            $status_chng = _ACTIVATE;
            $active = 0;
        }
	echo "<tr><td><a href=\"modules.php?name=Content&pa=showpage&pid=$mypid\">$mytitle</a></td><td align=\"center\">$status</td><td align=\"center\">$cat_title</td><td align=\"center\">[ <a href=\"admin.php?op=content_edit&pid=$mypid\">" . _EDIT . "</a> | <a href=\"admin.php?op=content_change_status&pid=$mypid&active=$active\">$status_chng</a> | <a href=\"admin.php?op=content_delete&pid=$mypid\">" . _DELETE . "</a> ]</td></tr>";
    }
    echo "</table>";
    CloseTable();
    echo "<br>";

    OpenTable();
    echo "<center><b>" . _ADDCATEGORY . "</b></center><br><br>"
        ."<form action=\"admin.php\" method=\"post\">"
	."<b>" . _TITLE . ":</b><br><input type=\"text\" name=\"cat_title\" size=\"50\"><br><br>"
	."<b>" . _DESCRIPTION . ":</b><br>"
#// Editor Start
#$oFCKeditor = new FCKeditor(description) ;
#$oFCKeditor->InstanceName = "description" ;
#$oFCKeditor->Value = "$description" ;
#$oFCKeditor->Width = "65%" ;
#$oFCKeditor->Height = "150" ;
#$oFCKeditor->ToolbarSet	= "Basic" ;
#$oFCKeditor->Create() ;
#// Editor Ende
  ."<textarea name=\"description\" rows=\"10\" cols=\"50\"></textarea><br><br>"
  ."<input type=\"hidden\" name=\"op\" value=\"add_category\">" 
	."<input type=\"submit\" value=\"" . _ADD . "\">"
        ."</form>";
    CloseTable();
    $rescat = $db->sql_query("SELECT cid, title from " . $prefix . "_pages_categories order by title");
    $numrows = $db->sql_numrows($rescat);
    if ($numrows > 0) {
        echo "<br>";
        OpenTable();
	echo "<center><b>" . _EDITCATEGORY . "</b></center><br><br>"
            ."<form action=\"admin.php\" method=\"post\">"
	    ."<b>" . _CATEGORY . ":</b> "
            ."<select name=\"cid\">";
    while ($row_cat = $db->sql_fetchrow($rescat)) {
	$cid = intval($row_cat['cid']);
	$cat_title = $row_cat['title'];
            echo "<option value=\"$cid\">$cat_title</option>";
        }
        echo "</select>&nbsp;&nbsp;"
            ."<input type=\"hidden\" name=\"op\" value=\"edit_category\">"
	    ."<input type=\"submit\" value=\"" . _EDIT . "\">"
            ."</form>";
        CloseTable();
    }

    echo "<br>";
    OpenTable();
    $res2 = $db->sql_query("SELECT cid, title from " . $prefix . "_pages_categories order by title");
    $numrows2 = $db->sql_numrows($res2);
    echo "<center><b>" . _ADDANEWPAGE . "</b></center><br><br>"
        ."<form action=\"admin.php\" method=\"post\">"
	."<b>" . _TITLE . ":</b><br>"
        ."<input type=\"text\" name=\"title\" size=\"50\"><br><br>";
    if ($numrows2 > 0) {
	echo "<b>" . _CATEGORY . ":</b>&nbsp;&nbsp;"
            ."<select name=\"cid\">"
	    ."<option value=\"0\" selected>" . _NONE . "</option>";
    while ($row_res2 = $db->sql_fetchrow($res2)) {
	$cid = intval($row_res2['cid']);
	$cat_title = $row_res2['title'];
            echo "<option value=\"$cid\">$cat_title</option>";
        }
        echo "</select><br><br>";
    } else {
        echo "<input type=\"hidden\" name=\"cid\" value=\"0\">";
    }
    echo "<b>" . _CSUBTITLE . ":</b><br>"
        ."<input type=\"text\" name=\"subtitle\" size=\"50\"><br><br>"
	."<b>" . _HEADERTEXT . ":</b><br>";
// Editor Start
$oFCKeditor = new FCKeditor(page_header) ;
$oFCKeditor->InstanceName = "page_header" ;
#$oFCKeditor->Value = "$page_header" ;
$oFCKeditor->ToolbarSet	= "PHPNuke" ;
$oFCKeditor->Create() ;
// Editor Ende
  #."<textarea name=\"page_header\" cols=\"60\" rows=\"10\"></textarea><br><br>"
	echo "<br><br><b>" . _PAGETEXT . ":</b><br>"
	."<font class=\"tiny\">" . _PAGEBREAK . "</font><br>";
// Editor Start
$oFCKeditor = new FCKeditor(text) ;
$oFCKeditor->InstanceName = "text" ;
#$oFCKeditor->Value = "$text" ;
$oFCKeditor->Height = "550" ;
$oFCKeditor->ToolbarSet	= "PHPNuke" ;
$oFCKeditor->Create() ;
// Editor Ende
#        ."<textarea name=\"text\" cols=\"60\" rows=\"40\"></textarea><br><br>"
echo "<br><br><b>" . _FOOTERTEXT . ":</b><br>";
// Editor Start
$oFCKeditor = new FCKeditor(page_footer) ;
$oFCKeditor->InstanceName = "page_footer" ;
#$oFCKeditor->Value = "$page_footer" ;
$oFCKeditor->ToolbarSet	= "PHPNuke" ;
$oFCKeditor->Create() ;
// Editor Ende
#        ."<textarea name=\"page_footer\" cols=\"60\" rows=\"10\"></textarea><br><br>"
	echo "<br><br><b>" . _SIGNATURE . ":</b><br>";
// Editor Start
$oFCKeditor = new FCKeditor(signature) ;
$oFCKeditor->InstanceName = "signature" ;
#$oFCKeditor->Value = "$signature" ;
$oFCKeditor->Width = "60%" ;
$oFCKeditor->Height = "150" ;
$oFCKeditor->ToolbarSet	= "Basic" ;
$oFCKeditor->Create() ;
// Editor Ende
#        ."<textarea name=\"signature\" cols=\"60\" rows=\"5\"></textarea><br><br>"; 
echo "<br><br>";
    if ($multilingual == 1) {
	echo "<br><b>" . _LANGUAGE . ": </b>"
            ."<select name=\"clanguage\">";
        $handle=opendir('language');
        while ($file = readdir($handle)) {
            if (preg_match("/^lang\-(.+)\.php/", $file, $matches)) {
                $langFound = $matches[1];
                $languageslist .= "$langFound ";
            }
        }
        closedir($handle);
        $languageslist = explode(" ", $languageslist);
        sort($languageslist);
        for ($i=0; $i < sizeof($languageslist); $i++) {
            if($languageslist[$i]!="") {
                echo "<option value=\"$languageslist[$i]\" ";
                if($languageslist[$i]==$language) echo "selected";
                echo ">".ucfirst($languageslist[$i])."</option>\n";
            }
        }
        echo "</select><br><br>";
    } else {
        echo "<input type=\"hidden\" name=\"clanguage\" value=\"$language\">";
    }
    echo "<b>" . _ACTIVATEPAGE . "</b><br>"
	."<input type=\"radio\" name=\"active\" value=\"1\" checked>&nbsp;" . _YES . "&nbsp;&nbsp;<input type=\"radio\" name=\"active\" value=\"0\">&nbsp;" . _NO . "<br><br>"
        ."<input type=\"hidden\" name=\"op\" value=\"content_save\">"
	."<input type=\"submit\" value=\"" . _SEND . "\">"
        ."</form>";
    CloseTable();
    include("footer.php");
}

function add_category($cat_title, $description) {
    global $prefix, $db;
    $db->sql_query("insert into " . $prefix . "_pages_categories values (NULL, '$cat_title', '$description')");
    Header("Location: admin.php?op=content");
}

function edit_category($cid) {
    global $prefix, $db, $copy;
    include("header.php");
    GraphicAdmin();
    title("" . _CONTENTMANAGER . "");
    OpenTable();
    $cid = intval($cid);
    $row = $db->sql_fetchrow($db->sql_query("SELECT title, description from " . $prefix . "_pages_categories where cid='$cid'"));
    $title = $row['title'];
    $description = $row['description'];
    echo "<center><b>" . _EDITCATEGORY . "</b></center><br><br>"
        ."<form action=\"admin.php\" method=\"post\">"
	."<b>" . _TITLE . "</b><br>"
        ."<input type=\"text\" name=\"cat_title\" value='$title' size=\"50\"><br><br>"
	."<b>" . _DESCRIPTION . "</b>:<br>"
#// Editor Start
#$oFCKeditor = new FCKeditor(description) ;
#$oFCKeditor->InstanceName = "description" ;
#$oFCKeditor->Value = "$description" ;
#$oFCKeditor->Width = "65%" ;
#$oFCKeditor->Height = "150" ;
#$oFCKeditor->ToolbarSet	= "Basic" ;
#$oFCKeditor->Create() ;
#// Editor Ende	
        ."<textarea cols=\"50\" rows=\"10\" name=\"description\">$description</textarea><br><br>"
    ."<input type=\"hidden\" name=\"cid\" value=\"$cid\">" 
        ."<input type=\"hidden\" name=\"op\" value=\"save_category\">"
	."<input type=\"submit\" value=\"" . _SAVECHANGES . "\">&nbsp;&nbsp;"
	."[ <a href=\"admin.php?op=del_content_cat&amp;cid=$cid\">" . _DELETE . "</a> ]"
        ."</form>";
    CloseTable();
    include("footer.php");
}

function save_category($cid, $cat_title, $description) {
    global $prefix, $db;
    $cid = intval($cid);
    $db->sql_query("update " . $prefix . "_pages_categories set title='$cat_title', description='$description' where cid='$cid'");
    Header("Location: admin.php?op=content");
}

function del_content_cat($cid, $ok=0) {
    global $prefix, $db;
    if ($ok==1) {
        $cid = intval($cid);
        $db->sql_query("delete from " . $prefix . "_pages_categories where cid='$cid'");
    $result = $db->sql_query("SELECT pid from " . $prefix . "_pages where cid='$cid'");
    while ($row = $db->sql_fetchrow($result)) {
	$pid = intval($row['pid']);
	    $db->sql_query("update " . $prefix . "_pages set cid='0' where pid='$pid'");
	}
        Header("Location: admin.php?op=content");
    } else {
        include("header.php");
        GraphicAdmin();
	title("" . _CONTENTMANAGER . "");
        $cid = intval($cid);
    $row2 = $db->sql_fetchrow($db->sql_query("SELECT title from " . $prefix . "_pages_categories where cid='$cid'"));
    $title = $row2['title'];
        OpenTable();
	echo "<center><b>" . _DELCATEGORY . ": $title</b><br><br>"
            .""._DELCONTENTCAT."<br><br>"
	    ."[ <a href=\"admin.php?op=content\">" . _NO . "</a> | <a href=\"admin.php?op=del_content_cat&amp;cid=$cid&amp;ok=1\">" . _YES . "</a> ]</center>";
        CloseTable();
        include("footer.php");
    }
}

function content_edit($pid) {
    global $prefix, $db, $language, $multilingual, $bgcolor2, $copy;
    include("header.php");
    GraphicAdmin();
    title(""._CONTENTMANAGER."");
    $pid = intval($pid);
    $mypages = $db->sql_fetchrow($db->sql_query("SELECT * from " . $prefix . "_pages WHERE pid='$pid'"));
    $mycid = intval($mypages['cid']);
    $myactive = intval($mypages['active']);
    $mytitle = $mypages['title'];
    $mysubtitle = $mypages['subtitle'];
    $mypage_header = $mypages['page_header'];
    $mytext = $mypages['text'];
    $mypage_footer = $mypages['page_footer'];
    $mysignature = $mypages['signature'];
    $myclanguage = $mypages['clanguage'];
	if ($myactive == 1) {
            $sel1 = "checked";
            $sel2 = "";
        } else {
            $sel1 = "";
            $sel2 = "checked";
        }
    OpenTable();
    echo "<center><b>" . _EDITPAGECONTENT . "</b></center><br><br>"
        ."<form action=\"admin.php\" method=\"post\">"
	."<b>" . _TITLE . ":</b><br>"
	."<input type=\"text\" name=\"title\" size=\"50\" value=\"$mytitle\"><br><br>";
    $res = $db->sql_query("SELECT cid, title from " . $prefix . "_pages_categories");
    $numrows = $db->sql_numrows($res);
    if ($numrows > 0) {
	echo "<b>" . _CATEGORY . ":</b>&nbsp;&nbsp;"
            ."<select name=\"cid\">";
	if ($mycid == 0) {
	    $sel = "selected";
	} else {
	    $sel = "";
	}
	echo "<option value=\"0\" $sel>" . _NONE . "</option>";
    while ($row_res = $db->sql_fetchrow($res)) {
	$cid = intval($row_res['cid']);
	$cat_title = $row_res['title'];
	    if ($mycid == $cid) {
                $sel = "selected";
            } else {
                $sel = "";
            }
            echo "<option value=\"$cid\" $sel>$cat_title</option>";
        }
        echo "</select><br><br>";
    } else {
        echo "<input type=\"hidden\" name=\"cid\" value=\"0\">";
    }
    echo "<b>" . _CSUBTITLE . ":</b><br>"
	."<input type=\"text\" name=\"subtitle\" size=\"50\" value=\"$mysubtitle\"><br><br>"
	."<b>" . _HEADERTEXT . ":</b><br>";
// Editor Start
$oFCKeditor = new FCKeditor(page_header) ;
$oFCKeditor->InstanceName = "page_header" ;
$oFCKeditor->Value = "$mypage_header" ;
$oFCKeditor->ToolbarSet	= "PHPNuke" ;
$oFCKeditor->Create() ;
// Editor Ende
#	."<textarea name=\"page_header\" cols=\"60\" rows=\"10\">$mypage_header</textarea><br><br>"
echo "<br><br><b>" . _PAGETEXT . ":</b><br>"
	."<font class=\"tiny\">" . _PAGEBREAK . "</font><br>";
// Editor Start
$oFCKeditor = new FCKeditor(text) ;
$oFCKeditor->InstanceName = "text" ;
$oFCKeditor->Value = "$mytext" ;
$oFCKeditor->Height = "550" ;
$oFCKeditor->ToolbarSet	= "PHPNuke" ;
$oFCKeditor->Create() ;
// Editor Ende
#	."<textarea name=\"text\" cols=\"60\" rows=\"40\">$mytext</textarea><br><br>"
echo "<br><br><b>" . _FOOTERTEXT . ":</b><br>";
// Editor Start
$oFCKeditor = new FCKeditor(page_footer) ;
$oFCKeditor->InstanceName = "page_footer" ;
$oFCKeditor->Value = "$mypage_footer" ;
$oFCKeditor->ToolbarSet	= "PHPNuke" ;
$oFCKeditor->Create() ;
// Editor Ende
#	."<textarea name=\"page_footer\" cols=\"60\" rows=\"10\">$mypage_footer</textarea><br><br>"
echo "<br><br><b>" . _SIGNATURE . ":</b><br>";
// Editor Start
$oFCKeditor = new FCKeditor(signature) ;
$oFCKeditor->InstanceName = "signature" ;
$oFCKeditor->Value = "$mysignature" ;
$oFCKeditor->Width = "60%" ;
$oFCKeditor->Height = "150" ;
$oFCKeditor->ToolbarSet	= "Basic" ;
$oFCKeditor->Create() ;
// Editor Ende
#	."<textarea name=\"signature\" cols=\"60\" rows=\"5\">$mysignature</textarea><br><br>";
echo "<br><br>"; 
    if ($multilingual == 1) {
	echo "<br><b>" . _LANGUAGE . ": </b>"
            ."<select name=\"clanguage\">";
        $handle=opendir('language');
        while ($file = readdir($handle)) {
            if (preg_match("/^lang\-(.+)\.php/", $file, $matches)) {
                $langFound = $matches[1];
                $languageslist .= "$langFound ";
            }
        }
        closedir($handle);
        $languageslist = explode(" ", $languageslist);
        sort($languageslist);
        for ($i=0; $i < sizeof($languageslist); $i++) {
            if($languageslist[$i]!="") {
                echo "<option value=\"$languageslist[$i]\" ";
                if($languageslist[$i]==$language) echo "selected";
                echo ">".ucfirst($languageslist[$i])."</option>\n";
            }
        }
        echo "</select><br><br>";
    } else {
	echo "<input type=\"hidden\" name=\"clanguage\" value=\"$myclanguage\">";
    }
    echo "<b>" . _ACTIVATEPAGE . "</b><br>"
	."<input type=\"radio\" name=\"active\" value=\"1\" $sel1>&nbsp;" . _YES . "&nbsp&nbsp;<input type=\"radio\" name=\"active\" value=\"0\" $sel2>&nbsp;" . _NO . "<br><br>"
        ."<input type=\"hidden\" name=\"pid\" value=\"$pid\">"
        ."<input type=\"hidden\" name=\"op\" value=\"content_save_edit\">"
	."<input type=\"submit\" value=\"" . _SAVECHANGES . "\">"
        ."</form>";
    CloseTable();
    include("footer.php");
}

function content_save($title, $subtitle, $page_header, $text, $page_footer, $signature, $clanguage, $active, $cid) {
    global $prefix, $db;
    $text = stripslashes(FixQuotes($text));
    $title = stripslashes(FixQuotes($title));
    $subtitle = stripslashes(FixQuotes($subtitle));
    $db->sql_query("insert into " . $prefix . "_pages values (NULL, '$cid', '$title', '$subtitle', '$active', '$page_header', '$text', '$page_footer', '$signature', now(), '0', '$clanguage')");
    Header("Location: admin.php?op=content");
}

function content_save_edit($pid, $title, $subtitle, $page_header, $text, $page_footer, $signature, $clanguage, $active, $cid) {
    global $prefix, $db;
    $text = stripslashes(FixQuotes($text));
    $title = stripslashes(FixQuotes($title));
    $subtitle = stripslashes(FixQuotes($subtitle));
    $pid = intval($pid);
    $db->sql_query("update " . $prefix . "_pages set cid='$cid', title='$title', subtitle='$subtitle', active='$active', page_header='$page_header', text='$text', page_footer='$page_footer', signature='$signature', clanguage='$clanguage' where pid='$pid'");
    Header("Location: admin.php?op=content");
}

function content_change_status($pid, $active) {
    global $prefix, $db;
    if ($active == 1) {
        $new_active = 0;
    } elseif ($active == 0) {
        $new_active = 1;
    }
    $pid = intval($pid);
    $db->sql_query("update " . $prefix . "_pages set active='$new_active' WHERE pid='$pid'");
    Header("Location: admin.php?op=content");
}

function content_delete($pid, $ok=0) {
    global $prefix, $db;
    $pid = intval($pid);
    if ($ok==1) {
        $db->sql_query("delete from " . $prefix . "_pages where pid='$pid'");
        Header("Location: admin.php?op=content");
    } else {
        include("header.php");
        GraphicAdmin();
	title("" . _CONTENTMANAGER . "");
	$row = $db->sql_fetchrow($db->sql_query("SELECT title from " . $prefix . "_pages where pid='$pid'"));
	$title = $row['title'];
        OpenTable();
	echo "<center><b>" . _DELCONTENT . ": $title</b><br><br>"
            .""._DELCONTWARNING." $title?<br><br>"
	    ."[ <a href=\"admin.php?op=content\">" . _NO . "</a> | <a href=\"admin.php?op=content_delete&amp;pid=$pid&amp;ok=1\">" . _YES . "</a> ]</center>";
        CloseTable();
        include("footer.php");
    }
}

switch ($op) {

    case "content":
    content();
    break;

    case "content_edit":
    content_edit($pid);
    break;

    case "content_delete":
    content_delete($pid, $ok);
    break;

    case "content_review":
    content_review($title, $subtitle, $page_header, $text, $page_footer, $signature, $clanguage, $active);
    break;

    case "content_save":
    content_save($title, $subtitle, $page_header, $text, $page_footer, $signature, $clanguage, $active, $cid);
    break;

    case "content_save_edit":
    content_save_edit($pid, $title, $subtitle, $page_header, $text, $page_footer, $signature, $clanguage, $active, $cid);
    break;

    case "content_change_status":
    content_change_status($pid, $active);
    break;

    case "add_category":
    add_category($cat_title, $description);
    break;

    case "edit_category":
    edit_category($cid);
    break;

    case "save_category":
    save_category($cid, $cat_title, $description);
    break;

    case "del_content_cat":
    del_content_cat($cid, $ok);
    break;
}

} else {
	include("header.php");
	GraphicAdmin();
	OpenTable();
	echo "<center><b>"._ERROR."</b><br><br>You do not have administration permission for module \"$module_name\"</center>";
	CloseTable();
	include("footer.php");
}

?>
