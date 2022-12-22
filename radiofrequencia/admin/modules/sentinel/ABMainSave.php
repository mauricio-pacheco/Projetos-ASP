<?php

/********************************************************/
/* NukeSentinel(tm) Universal                           */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/
/* CLIKE, UNION, & Email elements from HackAlert        */
/* HTTPAuth element                                     */
/* By: Raven PHP Scripts                                */
/* http://www.ravenphpscripts.com                       */
/* Copyright © 2004 by Raven PHP Scripts                */
/********************************************************/
/* Scripting Blocker elements                           */
/* By: ChatServ                                         */
/* http://www.nukeresources.com                         */
/* Copyright © 2004 by Nuke Resources                   */
/********************************************************/

$admin_list = explode("\r\n", $xadmin_contact);
sort($admin_list);
$xadmin_contact = implode("\r\n", $admin_list);
absave_config("admin_contact",$xadmin_contact);
absave_config("block_perpage",$xblock_perpage);
absave_config("block_sort_column",$xblock_sort_column);
absave_config("block_sort_direction",$xblock_sort_direction);
absave_config("crypt_salt",$xcrypt_salt);
absave_config("display_link",$xdisplay_link);
absave_config("display_reason",$xdisplay_reason);
absave_config("force_nukeurl",$xforce_nukeurl);
absave_config("help_switch",$xhelp_switch);
absave_config("htaccess_path",$xhtaccess_path);
absave_config("lookup_link",$xlookup_link);
absave_config("staccess_path",$xstaccess_path);
absave_config("http_auth",$xhttp_auth);
absave_config("prevent_dos",$xprevent_dos);
absave_config("proxy_reason",$xproxy_reason);
absave_config("proxy_switch",$xproxy_switch);
absave_config("search_block_perpage",$xsearch_block_perpage);
absave_config("search_block_sort_column",$xsearch_block_sort_column);
absave_config("search_block_sort_direction",$xsearch_block_sort_direction);
absave_config("search_track_perpage",$xsearch_track_perpage);
absave_config("search_track_sort_column",$xsearch_track_sort_column);
absave_config("search_track_sort_direction",$xsearch_track_sort_direction);
absave_config("search_user_perpage",$xsearch_user_perpage);
absave_config("search_user_sort_column",$xsearch_user_sort_column);
absave_config("search_user_sort_direction",$xsearch_user_sort_direction);
absave_config("self_expire",$xself_expire);
absave_config("site_reason",$xsite_reason);
absave_config("site_switch",$xsite_switch);
absave_config("track_active",$xtrack_active);
absave_config("track_del",$xtrack_del);
absave_config("track_max",$xtrack_max);
absave_config("track_perpage",$xtrack_perpage);
absave_config("track_sort_column",$xtrack_sort_column);
absave_config("track_sort_direction",$xtrack_sort_direction);
Header("Location: admin.php?op=ABMain");

?>