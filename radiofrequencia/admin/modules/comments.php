<?PHP

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
/*         Additional security & Abstraction layer conversion           */
/*                           2003 chatserv                              */
/*      http://www.nukefixes.com -- http://www.nukeresources.com        */
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
/* Comments Delete Function                              */
/*********************************************************/

/* Thanks to Oleg [Dark Pastor] Martos from http://www.rolemancer.ru */
/* to code the comments childs deletion function!                    */

function removeSubComments($tid) {
    global $prefix, $db;
    $tid = intval($tid);
    $result = $db->sql_query("SELECT tid from " . $prefix . "_comments where pid='$tid'");
    $numrows = $db->sql_numrows($result);
    if($numrows>0) {
    while ($row = $db->sql_fetchrow($result)) {
	$stid = intval($row['tid']);
            removeSubComments($stid);
            $stid = intval($stid);
            $db->sql_query("delete from " . $prefix . "_comments where tid='$stid'");
        }
    }
    $db->sql_query("delete from " . $prefix . "_comments where tid='$tid'");
}

function removeComment ($tid, $sid, $ok=0) {
    global $ultramode, $prefix, $db;
    if($ok) {
        $tid = intval($tid);
        $result = $db->sql_query("SELECT date from " . $prefix . "_comments where pid='$tid'");
        $numresults = $db->sql_numrows($result);
        $sid = intval($sid);
        $db->sql_query("update " . $prefix . "_stories set comments=comments-1-'$numresults' where sid='$sid'");
    /* Call recursive delete function to delete the comment and all its childs */
        removeSubComments($tid);
        if ($ultramode) {
    	    ultramode();
        }
        Header("Location: modules.php?name=News&file=article&sid=$sid");
    } else {
	include("header.php");
        GraphicAdmin();
	OpenTable();
	echo "<center><font class=\"title\"><b>" . _REMOVECOMMENTS . "</b></font></center>";
	CloseTable();
	echo "<br>";
	OpenTable();
        echo "<center>" . _SURETODELCOMMENTS . "";
        echo "<br><br>[ <a href=\"javascript:history.go(-1)\">" . _NO . "</a> | <a href=\"admin.php?op=RemoveComment&tid=$tid&sid=$sid&ok=1\">" . _YES . "</a> ]</center>";
	CloseTable();
        include("footer.php");
    }
}

function removePollSubComments($tid) {
    global $prefix, $db;
    $tid = intval($tid);
    $result = $db->sql_query("SELECT tid from " . $prefix . "_pollcomments where pid='$tid'");
    $numrows = $db->sql_numrows($result);
    if($numrows>0) {
    while ($row = $db->sql_fetchrow($result)) {
	$stid = intval($row['tid']);
            removePollSubComments($stid);
            $db->sql_query("delete from " . $prefix . "_pollcomments where tid='$stid'");
        }
    }
    $db->sql_query("delete from " . $prefix . "_pollcomments where tid='$tid'");
}

function RemovePollComment ($tid, $pollID, $ok=0) {
    if($ok) {
        removePollSubComments($tid);
        Header("Location: modules.php?name=Surveys&op=results&pollID=$pollID");
    } else {
	include("header.php");
        GraphicAdmin();
	OpenTable();
	echo "<center><font class=\"title\"><b>" . _REMOVECOMMENTS . "</b></font></center>";
	CloseTable();
	echo "<br>";
	OpenTable();
        echo "<center>" . _SURETODELCOMMENTS . "";
        echo "<br><br>[ <a href=\"javascript:history.go(-1)\">" . _NO . "</a> | <a href=\"admin.php?op=RemovePollComment&tid=$tid&pollID=$pollID&ok=1\">" . _YES . "</a> ]</center>";
	CloseTable();
        include("footer.php");
    }
}

switch ($op) {

    case "RemoveComment":
    removeComment ($tid, $sid, $ok);
    break;

    case "removeSubComments":
    removeSubComments($tid);
    break;

    case "removePollSubComments":
    removePollSubComments($tid);
    break;

    case "RemovePollComment":
    RemovePollComment($tid, $pollID, $ok);
    break;

}

} else {
    echo "Access Denied";
}
# $Log: comments.php,v $
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
