<?php

# $Author: chatserv $
# $Date: 2004/10/06 01:59:25 $
/***************************************************************************
 *                               pagestart.php
 *                            -------------------
 *   begin                : Thursday, Aug 2, 2001
 *   copyright            : (C) 2001 The phpBB Group
 *   email                : support@phpbb.com
 *
 *   Id: pagestart.php,v 1.1.2.7 2004/03/24 14:43:31 psotfx Exp
 *
 *
 ***************************************************************************/
/***************************************************************************
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 ***************************************************************************/

if (!defined('IN_PHPBB'))
{
        die("Hacking attempt");
}

define('IN_ADMIN', true);
//$forum_admin = 1;
define('FORUM_ADMIN', true); 
include("../../../mainfile.php");
include($phpbb_root_path.'common.'.$phpEx);
//
// Do a check to see if the nuke user is still valid.
//

global $admin, $prefix, $db, $cookie, $nukeuser, $user;
$admin = base64_decode($admin);
$admin = explode(":", $admin);
$aid = "$admin[0]";
$row = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='Forums'"));
$row2 = $db->sql_fetchrow($db->sql_query("SELECT name, pwd, radminsuper FROM ".$prefix."_authors WHERE aid='$aid'"));
$admins = explode(",", $row['admins']);
$auth_user = 0;
for ($i=0; $i < sizeof($admins); $i++) {
    if ($row2['name'] == "$admins[$i]" AND $row['admins'] != "") {
        $auth_user = 1;	
    }
}

$user = addslashes(base64_decode($user));
$cookie = explode(":", $user);
$sql3 = "SELECT user_id, user_password, user_level FROM " . USERS_TABLE . "
        WHERE username='$cookie[1]'";
$result3 = $db->sql_query($sql3);
if(!$result3) {
    message_die(GENERAL_ERROR, 'Could not query user account', '', __LINE__, __FILE__, $sql);
}
$row3 = $db->sql_fetchrow($result3);
if ((is_admin($admin)) AND ($admin[1] == $row2['pwd'] && $row2['pwd'] != "") AND ($row3['user_level'] == 2 or $row2[radminsuper] == 1 or $auth_user == 1)) {
} elseif ((is_user($user)) AND ($cookie[2] == $row3['user_password'] && $row3['user_password'] != "") AND ($row3['user_level'] == 2)) {
    $nukeuser = $user;
} else {
    unset($user);
    unset($cookie);
    message_die(GENERAL_MESSAGE, "You are not authorised to administer this board");
}

//
// Start session management
//
$userdata = session_pagestart($user_ip, PAGE_INDEX, $nukeuser);
init_userprefs($userdata);
//
// End session management
//
/*
if( !$userdata['session_logged_in'] )
{
        $header_location = ( @preg_match('/Microsoft|WebSTAR|Xitami/', $_SERVER['SERVER_SOFTWARE']) ) ? 'Refresh: 0; URL=' : 'Location: ';
        header($header_location . '../../../' . append_sid("login.$phpEx?redirect=admin/"));
        exit;
}
else if( $userdata['user_level'] != ADMIN )
{
        message_die(GENERAL_MESSAGE, $lang['Not_admin']);
}
*/
if ( empty($no_page_header) )
{
        // Not including the pageheader can be neccesarry if META tags are
        // needed in the calling script.
        include('./page_header_admin.'.$phpEx);
}
# $Log: pagestart.php,v $
# Revision 1.2  2004/10/06 01:59:25  chatserv
# Fixed access validation to match 7.5's structure
#
# Revision 1.1  2004/10/05 18:04:51  chatserv
# Initial CVS Addition
#

?>