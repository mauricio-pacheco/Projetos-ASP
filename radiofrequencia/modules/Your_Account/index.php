<?php

/*********************************************************************************/
/* CNB Your Account: An Advanced User Management System for phpnuke     		*/
/* ============================================                         		*/
/*                                                                      		*/
/* Copyright (c) 2004 by Comunidade PHP Nuke Brasil                     		*/
/* http://dev.phpnuke.org.br & http://www.phpnuke.org.br                		*/
/*                                                                      		*/
/* Contact author: escudero@phpnuke.org.br                              		*/
/* International Support Forum: http://ravenphpscripts.com/forum76.html 		*/
/*                                                                      		*/
/* This program is free software. You can redistribute it and/or modify 		*/
/* it under the terms of the GNU General Public License as published by 		*/
/* the Free Software Foundation; either version 2 of the License.       		*/
/*                                                                      		*/
/*********************************************************************************/
/* CNB Your Account it the official successor of NSN Your Account by Bob Marion	*/
/*********************************************************************************/

if (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) {
        die ("You can't access this file directly...");
}
$module_name = basename(dirname(__FILE__));
require_once("modules/Your_Account/includes/constants.php");
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }
require_once("mainfile.php");
include_once("modules/$module_name/includes/functions.php");

// menelaos: removed because it is already called in /modules/Your_Account/includes/mainfileend.php
$ya_config = ya_get_configs();

get_lang($module_name);
$userpage = 1;
$index    = 1;
include("modules/$module_name/navbar.php");
include("modules/$module_name/includes/cookiecheck.php"); 
cookiedecode($user);

switch($op) {

    case "activate":
        include("modules/$module_name/public/activate.php");
    break;

    case "avatarlist":
        if (is_user($user)) {
            include("modules/$module_name/public/avatarlist.php");
        } else {
            notuser();
        }
    break;

    case "avatarsave":
        if (is_user($user)) {
            include("modules/$module_name/public/avatarsave.php");
        } else {
            notuser();
        }
    break;

    case "avatarlinksave":
        if (is_user($user)) {
            include("modules/$module_name/public/avatarlinksave.php");
        } else {
            notuser();
        }
    break;

    case "broadcast":
        if ($broadcast_msg == 1) {
            include("modules/$module_name/public/broadcast.php");
        } else {
            disabled();
        }
    break;

    case "delete":
        if ($ya_config['allowuserdelete'] == 1) {
            include("modules/$module_name/public/delete.php");
        } else {
            disabled();
        }
    break;

    case "deleteconfirm":
        if ($ya_config['allowuserdelete'] == 1) {
            include("modules/$module_name/public/deleteconfirm.php");
        } else {
            disabled();
        }
    break;

    case "editcomm":
        include("modules/$module_name/public/editcomm.php");
    break;

    case "edithome":
        include("modules/$module_name/public/edithome.php");
    break;

    case "edittheme":
    break;

	case "changemail":
		include("modules/$module_name/public/changemail.php");
		changemail();
	break;


    case "chgtheme":
        if ($ya_config['allowusertheme']==0) {
            include("modules/$module_name/public/chngtheme.php");
        } else {
            disabled();
        }
    break;

    case "edituser":
        include("modules/$module_name/public/edituser.php");
    break;

    case "gfxadminimage":
	// menelaos: dynamically insert the version number in the admin config panel image Copyright (c) 2004 :-)
	$icon		= "images/admin/users.png";
	$image		= ImageCreateFromPNG($icon);
	$text_color	= ImageColorAllocate($image, 0, 0, 0);
	Header("Content-type: image/png");
	ImageString ($image, 1, 7, 38, $cnbyaversion, $text_color);
	ImagePNG($image, '', 75);
	ImageDestroy($image);
    break;

    case "gfx":
    // Begin Copyright (c) 2004 by NukeScripts Network
     
	 include "modules/Your_Account/includes/gfx.php";
	 /*   $datekey = date("F j");
        $rcode = hexdec(md5($_SERVER[HTTP_USER_AGENT] . $sitekey . $random_num . $datekey));
        $code = substr($rcode, 2, $ya_config['codesize']);
        $ThemeSel = get_theme();
        if (file_exists("themes/$ThemeSel/images/code_bg.png")) {
            $codeimg = "themes/$ThemeSel/images/code_bg.png";
            include("themes/$ThemeSel/theme.php");
            $tcolor = str_replace("#", "", $textcolor1);
            $tc_r = hexdec(substr($tcolor, 0, 2));
            $tc_g = hexdec(substr($tcolor, 2, 2));
            $tc_b = hexdec(substr($tcolor, 4, 2));
        } else {
            $codeimg = "images/code_bg.png";
            $tc_r = $tc_g = $tc_b = 0;
        }
        $image = ImageCreateFromPNG($codeimg);
        $text_color = ImageColorAllocate($image, $tc_r, $tc_g, $tc_b);
        Header("Content-type: image/png");
        ImageString ($image, 5, 5, 2, $code, $text_color);
        ImagePNG($image, '', 75);
        ImageDestroy($image);
		*/
        die();
    // End Copyright (c) 2004 by NukeScripts Network
    break;

	case "login":
		$result  = $db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE username='$username'");
		$setinfo = $db->sql_fetchrow($result);

		// menelaos: check of the member agreed with the TOS and update the database field
		if (($ya_config['tos'] == intval(1)) AND ($_POST['tos_yes'] == intval(1))) {
		$db->sql_query("UPDATE ".$user_prefix."_users SET agreedtos='1' WHERE username='$username'");
		}
		$forward = ereg_replace("redirect=", "", "$redirect");
		if (ereg("privmsg", $forward)) { $pm_login = "active"; }
	if ($db->sql_numrows($result) == 0) {
		include("header.php");
		Show_CNBYA_menu();
		OpenTable();
		echo "<center><font class='title'>"._SORRYNOUSERINFO."</font></center>\n";
		CloseTable();
		include("footer.php");
	} elseif ($db->sql_numrows($result) == 1 AND $setinfo['user_id'] != 1 AND $setinfo['user_password'] != "" AND $setinfo['user_active'] >0 AND $setinfo['user_level'] >0) {
		$dbpass	  = $setinfo[user_password];
		$non_crypt_pass = $user_password;
		$old_crypt_pass = crypt($user_password,substr($dbpass,0,2));
		$new_pass = md5($user_password);
		if (($dbpass == $non_crypt_pass) OR ($dbpass == $old_crypt_pass)) {
			$db->sql_query("UPDATE ".$user_prefix."_users SET user_password='$new_pass'	WHERE username='$username'");
			$result = $db->sql_query("SELECT user_password FROM ".$user_prefix."_users	WHERE username='$username'");
			list($dbpass) = $db->sql_fetchrow($result);
		}
		if ($dbpass != $new_pass) {
			Header("Location: modules.php?name=$module_name&stop=1");
			return;
		}
		$datekey = date("F j");
		$rcode = hexdec(md5($_SERVER['HTTP_USER_AGENT'] . $sitekey . $random_num . $datekey));
		$code  = substr($rcode, 2, $ya_config['codesize']);
		if (extension_loaded("gd") AND $code != $gfx_check AND ($ya_config['usegfxcheck'] == 2 OR $ya_config['usegfxcheck'] == 3)) {
			Header("Location: modules.php?name=$module_name&stop=1");
			die();
		} else {
			// menelaos: show a member the current TOS if he has not agreed yet
			if (($ya_config['tos'] == intval(1)) AND ($ya_config['tosall'] == intval(1)) AND ($setinfo[agreedtos] != intval(1))) {
				if($_POST['tos_yes'] != intval(1)) {
				include("modules/$module_name/public/ya_tos.php");
				exit;
				}
			}
			// menelaos: show a member the current TOS if he has not agreed yet

		 	yacookie($setinfo[user_id], $setinfo[username], $new_pass, $setinfo[storynum], $setinfo[umode], $setinfo[uorder], $setinfo[thold], $setinfo[noscore], $setinfo[ublockon], $setinfo[theme], $setinfo[commentmax]);
			$uname = $_SERVER["REMOTE_ADDR"];
			$db->sql_query("DELETE FROM ".$prefix."_session WHERE uname='$uname' AND guest='1'");
			if ($Version_Num >= 7.4) $db->sql_query("UPDATE ".$prefix."_users SET last_ip='$uname' WHERE username='$username'");
		}

		// menelaos: the cookiecheck is run here
		if ($ya_config['cookiecheck']==1) {
		$cookiecheck	= yacookiecheckresults();
		}
			
		if ($pm_login != "") {
			Header("Location: modules.php?name=Private_Messages&file=index&folder=inbox");
		} else if ($redirect == "" ) {
			Header("Location: modules.php?name=Your_Account&op=userinfo&bypass=1&username=$username");
		} else if ($mode == "") {
			Header("Location: modules.php?name=Forums&file=$forward");
		} else if ($t !="")  {
			Header("Location: modules.php?name=Forums&file=$forward&mode=$mode&t=$t");
		} else {
			Header("Location: modules.php?name=Forums&file=$forward&mode=$mode&f=$f");
		}
		} elseif ($db->sql_numrows($result) == 1 AND ($setinfo['user_level'] < 1 OR $setinfo['user_active'] < 1)) {
			include("header.php");
			Show_CNBYA_menu();
			OpenTable();
			if ($setinfo['user_level'] == 0) {
				echo "<br><center><font class=\"title\"><b>"._ACCSUSPENDED."</b></font></center><br>\n";
			} elseif ($setinfo['user_level'] == -1) {
				echo "<br><center><font class=\"title\"><b>"._ACCDELETED."</b></font></center><br>\n";
			} else {
				echo "<br><center><font class=\"title\"><b>"._SORRYNOUSERINFO."</b></font></center><br>\n";
			}
		CloseTable();
		include("footer.php");
		} else {
		Header("Location: modules.php?name=$module_name&stop=1");
		}
		break;

    case "logout":
        cookiedecode($user);
        $r_uid = $cookie[0];
        $r_username = $cookie[1];
        setcookie("user");
        if (trim($ya_config[cookiepath]) != '') setcookie("user","expired",time()-604800,"$ya_config[cookiepath]"); //correct the problem of path change
        $db->sql_query("DELETE FROM ".$prefix."_session WHERE uname='$r_username'");
        $db->sql_query("OPTIMIZE TABLE ".$prefix."_session");
        //$db->sql_query("DELETE FROM ".$prefix."_bbsessions WHERE session_user_id='$r_uid'");
        //$db->sql_query("OPTIMIZE TABLE ".$prefix."_bbsessions");
        $user = "";
        include("header.php");
        if ($redirect != "") {
            echo "<META HTTP-EQUIV=\"refresh\" content=\"2;URL=modules.php?name=$redirect\">";
        } else {
            echo "<META HTTP-EQUIV=\"refresh\" content=\"2;URL=index.php\">";
        }
        title(_YOUARELOGGEDOUT);
        include("footer.php");
    break;

    case "mailpasswd":
        include("modules/$module_name/public/mailpass.php");
    break;

    case "my_headlines":
        include("modules/$module_name/public/headlines.php");
    break;

    case "new_user":
     if (is_user($user)) {
            mmain($user);
        } else {
if ($ya_config['allowuserreg']==0) {
    if ($ya_config['coppa'] == intval(1)) {
       if($_POST['coppa_yes']!= intval(1)) {
         include("modules/$module_name/public/ya_coppa.php");
         exit;
     }
          }
     if ($ya_config['tos'] == intval(1)) {
       if($_POST['tos_yes'] != intval(1)) {
         include("modules/$module_name/public/ya_tos.php");
         exit;
     }
          }
	     if ($ya_config['coppa'] !== intval(1) OR $ya_config['coppa'] == intval(1) AND $_POST['coppa_yes'] = intval(1)){ 
		 if ($ya_config['tos'] !== intval(1) OR $ya_config['tos'] == intval(1) AND $_POST['tos_yes']=intval(1)){       
           if ($ya_config['requireadmin'] == 1) {
                    include("modules/$module_name/public/new_user1.php");
                } elseif ($ya_config['requireadmin'] == 0 AND $ya_config['useactivate'] == 0) {
                    include("modules/$module_name/public/new_user2.php");
                } elseif ($ya_config['requireadmin'] == 0 AND $ya_config['useactivate'] == 1) {
                    include("modules/$module_name/public/new_user3.php");
                }
             }
         }
           }else { 
    disabled();   
  }
}
    break;

    case "new_confirm":
        if (is_user($user)) {
            mmain($user);
        } else {
            if ($ya_config['allowuserreg']==0) {
                if ($ya_config['requireadmin'] == 1) {
                    include("modules/$module_name/public/new_confirm1.php");
                } elseif ($ya_config['requireadmin'] == 0 AND $ya_config['useactivate'] == 0) {
                    include("modules/$module_name/public/new_confirm2.php");
                } elseif ($ya_config['requireadmin'] == 0 AND $ya_config['useactivate'] == 1) {
                    include("modules/$module_name/public/new_confirm3.php");
                }
            } else {
                disabled();
            }
        }
    break;

    case "new_finish":
        if (is_user($user)) {
            mmain($user);
        } else {
            if ($ya_config['allowuserreg']==0) {
                if ($ya_config['requireadmin'] == 1) {
                    include("modules/$module_name/public/new_finish1.php");
                } elseif ($ya_config['requireadmin'] == 0 AND $ya_config['useactivate'] == 0) {
                    include("modules/$module_name/public/new_finish2.php");
                } elseif ($ya_config['requireadmin'] == 0 AND $ya_config['useactivate'] == 1) {
                    include("modules/$module_name/public/new_finish3.php");
                }
            } else {
                disabled();
            }
        }
    break;

    case "pass_lost":
        include("modules/$module_name/public/passlost.php");
    break;

    case "saveactivate":
        include("modules/$module_name/public/saveactivate.php");
    break;

    case "savecomm":
        if (is_user($user)) {
            include("modules/$module_name/public/savecomm.php");
        } else {
            notuser();
        }
    break;

    case "savehome":
        if (is_user($user)) {
            include("modules/$module_name/public/savehome.php");
        } else {
            notuser();
        }
    break;

    case "savetheme":
        if (is_user($user)) {
            if ($ya_config['allowusertheme']==0) {
                include("modules/$module_name/public/savetheme.php");
            } else {
                disabled();
            }
        } else {
            notuser();
        }
    break;

    case "saveuser":
        if (is_user($user)) {
            include("modules/$module_name/public/saveuser.php");
        } else {
            notuser();
        }
    break;

    case "userinfo":
        include("modules/$module_name/public/userinfo.php");
    break;
	
	case "ShowCookiesRedirect":
        ShowCookiesRedirect();
    break;

    case "ShowCookies":
        ShowCookies();
    break;

    case "DeleteCookies":
        DeleteCookies();
    break;

    default:
        mmain($user);
    break;

}

?>