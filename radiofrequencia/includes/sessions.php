<?php
# $Author: chatserv $
# $Date: 2004/10/05 02:27:50 $
/***************************************************************************
 *                                sessions.php
 *                            -------------------
 *   begin                : Saturday, Feb 13, 2001
 *   copyright            : (C) 2001 The phpBB Group
 *   email                : support@phpbb.com
 *
 *   Id: sessions.php,v 1.58.2.11 2004/07/11 16:46:19 acydburn Exp
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
if ( !defined('IN_PHPBB') )
{
        die("Hacking attempt");
        exit;
}

//
// Adds/updates a new session to the database for the given userid.
// Returns the new session ID on success.
//
function session_begin($user_id, $user_ip, $page_id, $auto_create = 0, $enable_autologin = 0)
{
	global $db, $board_config;
	global $HTTP_COOKIE_VARS, $HTTP_GET_VARS, $SID;

	$cookiename = $board_config['cookie_name'];
	$cookiepath = $board_config['cookie_path'];
	$cookiedomain = $board_config['cookie_domain'];
	$cookiesecure = $board_config['cookie_secure'];

	if ( isset($HTTP_COOKIE_VARS[$cookiename . '_sid']) || isset($HTTP_COOKIE_VARS[$cookiename . '_data']) )
	{
		$session_id = isset($HTTP_COOKIE_VARS[$cookiename . '_sid']) ? $HTTP_COOKIE_VARS[$cookiename . '_sid'] : '';
		$sessiondata = isset($HTTP_COOKIE_VARS[$cookiename . '_data']) ? unserialize(stripslashes($HTTP_COOKIE_VARS[$cookiename . '_data'])) : array();
		$sessionmethod = SESSION_METHOD_COOKIE;
	}
	else
	{
		$sessiondata = array();
		$session_id = ( isset($HTTP_GET_VARS['sid']) ) ? $HTTP_GET_VARS['sid'] : '';
		$sessionmethod = SESSION_METHOD_GET;
	}

	//
	if (!preg_match('/^[A-Za-z0-9]*$/', $session_id))
	{
		$session_id = '';
	}

	$last_visit = 0;
	$current_time = time();
	$expiry_time = $current_time - $board_config['session_length'];

	//
	// Try and pull the last time stored in a cookie, if it exists
	//
	$sql = "SELECT *
		FROM " . USERS_TABLE . "
		WHERE user_id = '$user_id'";
	if ( !($result = $db->sql_query($sql)) )
	{
		message_die(CRITICAL_ERROR, 'Could not obtain lastvisit data from user table', '', __LINE__, __FILE__, $sql);
	}

	$userdata = $db->sql_fetchrow($result);

	if ( $user_id != ANONYMOUS )
	{
		$auto_login_key = $userdata['user_password'];

		if ( $auto_create )
		{
			if ( isset($sessiondata['autologinid']) && $userdata['user_active'] )
			{
				// We have to login automagically
				if( $sessiondata['autologinid'] == $auto_login_key )
				{
					// autologinid matches password
					$login = 1;
					$enable_autologin = 1;
				}
				else
				{
					// No match; don't login, set as anonymous user
					$login = 0;
					$enable_autologin = 0;
					$user_id = $userdata['user_id'] = ANONYMOUS;
				}
			}
			else
			{
				// Autologin is not set. Don't login, set as anonymous user
				$login = 0;
				$enable_autologin = 0;
				$user_id = $userdata['user_id'] = ANONYMOUS;
			}
		}
		else
		{
			$login = 1;
		}
	}
	else
	{
		$login = 0;
		$enable_autologin = 0;
	}

	//
	// Initial ban check against user id, IP and email address
	//
	preg_match('/(..)(..)(..)(..)/', $user_ip, $user_ip_parts);

	$sql = "SELECT ban_ip, ban_userid, ban_email
		FROM " . BANLIST_TABLE . "
		WHERE ban_ip IN ('" . $user_ip_parts[1] . $user_ip_parts[2] . $user_ip_parts[3] . $user_ip_parts[4] . "', '" . $user_ip_parts[1] . $user_ip_parts[2] . $user_ip_parts[3] . "ff', '" . $user_ip_parts[1] . $user_ip_parts[2] . "ffff', '" . $user_ip_parts[1] . "ffffff')
			OR ban_userid = '$user_id'";
	if ( $user_id != ANONYMOUS )
	{
		$sql .= " OR ban_email LIKE '" . str_replace("\'", "''", $userdata['user_email']) . "'
			OR ban_email LIKE '" . substr(str_replace("\'", "''", $userdata['user_email']), strpos(str_replace("\'", "''", $userdata['user_email']), "@")) . "'";
	}
	if ( !($result = $db->sql_query($sql)) )
	{
		message_die(CRITICAL_ERROR, 'Could not obtain ban information', '', __LINE__, __FILE__, $sql);
	}

	if ( $ban_info = $db->sql_fetchrow($result) )
	{
		if ( $ban_info['ban_ip'] || $ban_info['ban_userid'] || $ban_info['ban_email'] )
		{
			message_die(CRITICAL_MESSAGE, 'You_been_banned');
		}
	}

	//
	// Create or update the session
	//
	$sql = "UPDATE " . SESSIONS_TABLE . "
		SET session_user_id = $user_id, session_start = $current_time, session_time = $current_time, session_page = $page_id, session_logged_in = $login
		WHERE session_id = '" . $session_id . "'
			AND session_ip = '$user_ip'";
	if ( !$db->sql_query($sql) || !$db->sql_affectedrows() )
	{
		$session_id = md5(uniqid($user_ip));

		$sql = "INSERT INTO " . SESSIONS_TABLE . "
			(session_id, session_user_id, session_start, session_time, session_ip, session_page, session_logged_in)
			VALUES ('$session_id', '$user_id', '$current_time', '$current_time', '$user_ip', '$page_id', '$login')";
		if ( !$db->sql_query($sql) )
		{
                $error = TRUE;
                if (SQL_LAYER == "mysql" || SQL_LAYER == "mysql4")
                {
                    $sql_error = $db->sql_error($result);
                    if ($sql_error["code"] == 1114)
                    {
                        $result = $db->sql_query('SHOW TABLE STATUS LIKE "'.SESSIONS_TABLE.'"');
                        $row = $db->sql_fetchrow($result);
                        if ($row["Type"] == "HEAP")
                        {
                            if ($row["Rows"] > 2500)
                            {
                                $delete_order = (SQL_LAYER=="mysql4") ? " ORDER BY session_time ASC" : "";
                                $db->sql_query("DELETE QUICK FROM ".SESSIONS_TABLE."$delete_order LIMIT 50");
                            }
                            else
                            {
                                $db->sql_query("ALTER TABLE ".SESSIONS_TABLE." MAX_ROWS=".($row["Rows"]+50));
                            }
                            if ($db->sql_query($sql))
                            {
                                $error = FALSE;
                            }
                        }
                    }
                }
                if ($error)
                {
                    message_die(CRITICAL_ERROR, "Error creating new session", "", __LINE__, __FILE__, $sql);
                }
                }
	}

	if ( $user_id != ANONYMOUS )
	{// ( $userdata['user_session_time'] > $expiry_time && $auto_create ) ? $userdata['user_lastvisit'] : (
		$last_visit = ( $userdata['user_session_time'] > 0 ) ? $userdata['user_session_time'] : $current_time;

		$sql = "UPDATE " . USERS_TABLE . "
			SET user_session_time = $current_time, user_session_page = $page_id, user_lastvisit = $last_visit
			WHERE user_id = '$user_id'";
		if ( !$db->sql_query($sql) )
		{
			message_die(CRITICAL_ERROR, 'Error updating last visit time', '', __LINE__, __FILE__, $sql);
		}

		$userdata['user_lastvisit'] = $last_visit;

		$sessiondata['autologinid'] = ( $enable_autologin && $sessionmethod == SESSION_METHOD_COOKIE ) ? $auto_login_key : '';
		$sessiondata['userid'] = $user_id;
	}

	$userdata['session_id'] = $session_id;
	$userdata['session_ip'] = $user_ip;
	$userdata['session_user_id'] = $user_id;
	$userdata['session_logged_in'] = $login;
	$userdata['session_page'] = $page_id;
	$userdata['session_start'] = $current_time;
	$userdata['session_time'] = $current_time;

	setcookie($cookiename . '_data', serialize($sessiondata), $current_time + 31536000, $cookiepath, $cookiedomain, $cookiesecure);
	setcookie($cookiename . '_sid', $session_id, 0, $cookiepath, $cookiedomain, $cookiesecure);
	$SID = ( $sessionmethod == SESSION_METHOD_GET ) ? 'sid=' . $session_id : '';

	return $userdata;
}

//
// Checks for a given user session, tidies session table and updates user
// sessions at each page refresh
//
function session_pagestart($user_ip, $thispage_id, $nukeuser)
{
	global $db, $lang, $board_config, $session_id;
	global $HTTP_COOKIE_VARS, $HTTP_GET_VARS, $SID;

	$cookiename = $board_config['cookie_name'];
	$cookiepath = $board_config['cookie_path'];
	$cookiedomain = $board_config['cookie_domain'];
	$cookiesecure = $board_config['cookie_secure'];

	$current_time = time();
	unset($userdata);

	if ( isset($HTTP_COOKIE_VARS[$cookiename . '_sid']) || isset($HTTP_COOKIE_VARS[$cookiename . '_data']) )
	{
		$sessiondata = isset( $HTTP_COOKIE_VARS[$cookiename . '_data'] ) ? unserialize(stripslashes($HTTP_COOKIE_VARS[$cookiename . '_data'])) : array();
		$session_id = isset( $HTTP_COOKIE_VARS[$cookiename . '_sid'] ) ? $HTTP_COOKIE_VARS[$cookiename . '_sid'] : '';
		$sessionmethod = SESSION_METHOD_COOKIE;
	}
	else
	{
		$sessiondata = array();
		$session_id = ( isset($HTTP_GET_VARS['sid']) ) ? $HTTP_GET_VARS['sid'] : '';
		$sessionmethod = SESSION_METHOD_GET;
	}
   if (!preg_match('/^[A-Za-z0-9]*$/', $session_id))
   {
      $session_id = '';
   }
        if ( ($nukeuser != "") && ($userdata['session_logged_in'] == "" )) {
                bblogin($nukeuser, $session_id);
        } else {
                $sessiondata = array();
        }

	//
	// Does a session exist?
	//
	if ( !empty($session_id) )
	{
		//
		// session_id exists so go ahead and attempt to grab all
		// data in preparation
		//
		$sql = "SELECT u.*, s.*
			FROM " . SESSIONS_TABLE . " s, " . USERS_TABLE . " u
			WHERE s.session_id = '$session_id'
				AND u.user_id = s.session_user_id";
		if ( !($result = $db->sql_query($sql)) )
		{
			message_die(CRITICAL_ERROR, 'Error doing DB query userdata row fetch', '', __LINE__, __FILE__, $sql);
		}

		$userdata = $db->sql_fetchrow($result);

		//
		// Did the session exist in the DB?
		//
		if ( isset($userdata['user_id']) )
		{
			//
			// Do not check IP assuming equivalence, if IPv4 we'll check only first 24
			// bits ... I've been told (by vHiker) this should alleviate problems with
			// load balanced et al proxies while retaining some reliance on IP security.
			//
			$ip_check_s = substr($userdata['session_ip'], 0, 6);
			$ip_check_u = substr($user_ip, 0, 6);

			if ($ip_check_s == $ip_check_u)
			{
				$SID = ($sessionmethod == SESSION_METHOD_GET || defined('IN_ADMIN')) ? 'sid=' . $session_id : '';

				//
				// Only update session DB a minute or so after last update
				//
				if ( $current_time - $userdata['session_time'] > 60 )
				{
					$sql = "UPDATE " . SESSIONS_TABLE . "
						SET session_time = '$current_time', session_page = '$thispage_id'
						WHERE session_id = '" . $userdata['session_id'] . "'";
					if ( !$db->sql_query($sql) )
					{
						message_die(CRITICAL_ERROR, 'Error updating sessions table', '', __LINE__, __FILE__, $sql);
					}

					if ( $userdata['user_id'] != ANONYMOUS )
					{
						$sql = "UPDATE " . USERS_TABLE . "
							SET user_session_time = '$current_time', user_session_page = '$thispage_id'
							WHERE user_id = " . $userdata['user_id'];
						if ( !$db->sql_query($sql) )
						{
							message_die(CRITICAL_ERROR, 'Error updating sessions table', '', __LINE__, __FILE__, $sql);
						}
					}

					//
					// Delete expired sessions
					//
					$expiry_time = $current_time - $board_config['session_length'];
					$sql = "DELETE FROM " . SESSIONS_TABLE . "
						WHERE session_time < '$expiry_time'
							AND session_id <> '$session_id'";
					if ( !$db->sql_query($sql) )
					{
						message_die(CRITICAL_ERROR, 'Error clearing sessions table', '', __LINE__, __FILE__, $sql);
					}

					setcookie($cookiename . '_data', serialize($sessiondata), $current_time + 31536000, $cookiepath, $cookiedomain, $cookiesecure);
					setcookie($cookiename . '_sid', $session_id, 0, $cookiepath, $cookiedomain, $cookiesecure);
				}

				return $userdata;
			}
		}
	}

	//
	// If we reach here then no (valid) session exists. So we'll create a new one,
	// using the cookie user_id if available to pull basic user prefs.
	//
	$user_id = ( isset($sessiondata['userid']) ) ? intval($sessiondata['userid']) : ANONYMOUS;

	if ( !($userdata = session_begin($user_id, $user_ip, $thispage_id, TRUE)) )
	{
		message_die(CRITICAL_ERROR, 'Error creating user session', '', __LINE__, __FILE__, $sql);
	}

	return $userdata;

}

//
// session_end closes out a session
// deleting the corresponding entry
// in the sessions table
//
function session_end($session_id, $user_id)
{
	global $db, $lang, $board_config;
	global $HTTP_COOKIE_VARS, $HTTP_GET_VARS, $SID;

	$cookiename = $board_config['cookie_name'];
	$cookiepath = $board_config['cookie_path'];
	$cookiedomain = $board_config['cookie_domain'];
	$cookiesecure = $board_config['cookie_secure'];

	$current_time = time();

	//
	// Pull cookiedata or grab the URI propagated sid
	//
	if ( isset($HTTP_COOKIE_VARS[$cookiename . '_sid']) )
	{
		$session_id = isset( $HTTP_COOKIE_VARS[$cookiename . '_sid'] ) ? $HTTP_COOKIE_VARS[$cookiename . '_sid'] : '';
		$sessionmethod = SESSION_METHOD_COOKIE;
	}
	else
	{
		$session_id = ( isset($HTTP_GET_VARS['sid']) ) ? $HTTP_GET_VARS['sid'] : '';
		$sessionmethod = SESSION_METHOD_GET;
	}

	if (!preg_match('/^[A-Za-z0-9]*$/', $session_id))
	{
		return;
	}
	
	//
	// Delete existing session
	//
	$sql = "DELETE FROM " . SESSIONS_TABLE . "
		WHERE session_id = '$session_id'
			AND session_user_id = '$user_id'";
	if ( !$db->sql_query($sql) )
	{
		message_die(CRITICAL_ERROR, 'Error removing user session', '', __LINE__, __FILE__, $sql);
	}

	setcookie($cookiename . '_data', '', $current_time - 31536000, $cookiepath, $cookiedomain, $cookiesecure);
	setcookie($cookiename . '_sid', '', $current_time - 31536000, $cookiepath, $cookiedomain, $cookiesecure);

	return true;
}

//
// Append $SID to a url. Borrowed from phplib and modified. This is an
// extra routine utilised by the session code above and acts as a wrapper
// around every single URL and form action. If you replace the session
// code you must include this routine, even if it's empty.
//
function append_sid($url, $non_html_amp = false)
{
	global $SID, $admin, $userdata;
	if (ereg("admin=1", $url) || ereg("admin_", $url) || ereg("pane=", $url)){
								//  The format is fine, don't change a thing.
	} else if (ereg("Your_Account", $url)){
    	    $url = str_replace(".php", "", $url); 		//  Strip the .php from all the files,
    	    $url = str_replace("modules", "modules.php", $url); //  and put it back for the modules.php
	}
	else if (ereg("redirect", $url))
	{
    	    $url = str_replace("login.php", "modules.php?name=Your_Account", $url); 		//  Strip the .php from all the files,
    	    $url = str_replace(".php", "", $url); 		//  Strip the .php from all the files,
    	    $url = str_replace("?redirect", "&redirect", $url); 		//  Strip the .php from all the files,
    	    $url = str_replace("modules", "modules.php", $url); //  and put it back for the modules.php
	}
	else if (ereg("menu=1", $url))
	{
    	    $url = str_replace("?", "&", $url); // As we are already in nuke, change the ? to &
    	    $url = str_replace(".php", "", $url); 		//  Strip the .php from all the files,
	    $url = "../../../modules.php?name=Forums&file=$url";
	}
	else if ((ereg("privmsg", $url)) && (!ereg("highlight=privmsg", $url)))
	{
    	    $url = str_replace("?", "&", $url); // As we are already in nuke, change the ? to &
    	    $url = str_replace("privmsg.php", "modules.php?name=Private_Messages&file=index", $url); //  and put it back for the modules.php
	}
	else if ((ereg("profile", $url)) && (!ereg("highlight", $url) && !ereg("profile", $url)))
	{
    	    $url = str_replace("?", "&", $url); // As we are already in nuke, change the ? to &
    	    $url = str_replace("profile.php", "modules.php?name=Forums&file=profile", $url); //  and put it back for the modules.php
	    $dummy = 1;
	}
	else if ((ereg("memberlist", $url)) && (!ereg("highlight=memberlist", $url)))
	{
    	    $url = str_replace("?", "&", $url); // As we are already in nuke, change the ? to &
    	    $url = str_replace("memberlist.php", "modules.php?name=Members_List&file=index", $url); //  and put it back for the modules.php
	} else {
    	    $url = str_replace("?", "&", $url); // As we are already in nuke, change the ? to &
    	    $url = str_replace(".php", "", $url);
    	    $url = "modules.php?name=Forums&file=".$url; //Change to Nuke format
	}

   if ($userdata['user_level'] > 1) { 
	if ( !empty($SID) && !eregi('sid=', $url) )
	{
	    if ( !empty($SID) && !eregi('sid=', $url) )	{
		$url .= ( ( strpos($url, '?') != false ) ?  ( ( $non_html_amp ) ? '&' : '&amp;' ) : '?' ) . $SID;
          } 
      }    
   }
	return($url);
}
function admin_sid($url, $non_html_amp = false)
{
	global $SID;
        $url = "../../../modules.php?name=Forums&file=$url";

	if ( !empty($SID) && !preg_match('#sid=#', $url) )
	{
		$url .= ( ( strpos($url, '?') != false ) ?  ( ( $non_html_amp ) ? '&' : '&amp;' ) : '?' ) . $SID;
	}

	return $url;
}
# $Log: sessions.php,v $
# Revision 1.1  2004/10/05 02:27:50  chatserv
# Initial CVS Addition
#

?>