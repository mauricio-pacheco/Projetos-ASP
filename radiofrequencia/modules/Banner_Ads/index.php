<?php

/********************************************************/
/* NSN Banner Ads                                       */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/

if (!stristr($_SERVER['PHP_SELF'], "modules.php") && !stristr($_SERVER['SCRIPT_NAME'], "modules.php")) { die (_BA_NOTACC); }
require_once("mainfile.php");
cookierecode($client);
$module_name = basename(dirname(__FILE__));
get_lang($module_name);
$index=1;
$ban_config = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnba_config WHERE id='1'"));

function ClientCheck($cname, $email) {
    global $stop, $prefix, $db;
    if ((!$email) || ($email=="") || (!eregi("^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.)+[a-z]{2,6}$",$email))) $stop = "<center>"._BA_ERR_INVEML."</center>";
    if (strrpos($email,' ') > 0) $stop = "<center>"._BA_ERR_EMLNOSPC."</center>";
    if ((!$cname) || ($cname=="") || (ereg("[^a-zA-Z0-9_-]",$cname))) $stop = "<center>"._BA_ERR_INVCLT."</center>";
    if (strlen($cname) < 4 OR strlen($cname) > 25) $stop = "<center>"._BA_ERR_TOLONG."</center>";
    if (eregi("^((root)|(adm)|(linux)|(webmaster)|(admin)|(god)|(administrator)|(administrador)|(nobody)|(anonymous)|(anonimo)|(anónimo)|(operator))$",$cname)) $stop = "<center>"._BA_ERR_IDRESRV."</center>";
    if (eregi("(admin)|(nsn)|(nuke)|(staff)", $cname) ) $stop = "<center>"._BA_ERR_IDRESRV."</center>";
    if (strrpos($cname,' ') > 0) $stop = "<center>"._BA_ERR_IDNOSPC."</center>";
    if ($db->sql_numrows($db->sql_query("SELECT login FROM ".$prefix."_nsnba_clients WHERE login='$cname'")) > 0) $stop = "<center>"._BA_ERR_IDTAKEN."</center>";
    return($stop);
}

function BAMenu() {
    global $module_name, $cookie2, $wherefrom;
    echo "<script language='JavaScript'>\n";
    echo "<!-- Begin\n";
    echo "function NewWindow(mypage, myname, w, h, scroll) {\n";
    echo "var winl = (screen.width - w) / 2;\n";
    echo "var wint = (screen.height - h) / 2;\n";
    echo "winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable'\n";
    echo "win = window.open(mypage, myname, winprops)\n";
    echo "if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }\n";
    echo "}\n";
    echo "//  End -->\n";
    echo "</script>\n";
    OpenTable();
    echo "<center><b>"._BA_CLTID."&raquo; ".$cookie2[1]."</b></center><br>\n";
    echo "<center><table cellpadding='3'><td align='center' valign='top' width='150'>\n";
    echo "<a href='modules.php?name=$module_name&op=ClientView' onclick=\"NewWindow(this.href,'ClientView','400','200','no');return false;\">"._BA_VIEWCLT."</a><br>\n";
    echo "<a href='modules.php?name=$module_name&op=ClientEdit'>"._BA_EDITCLT."</a><br>\n";
    echo "</td><td align='center' valign='top' width='150'>\n";
    echo "<a href='modules.php?name=$module_name&op=BannerList'>"._BA_LISTBANN."</a><br>\n";
    echo "</td><td align='center' valign='top' width='150'>\n";
    echo "<a href='modules.php?name=$module_name&op=logout'>"._BA_CLTOUT."</a><br>\n";
    echo "</td></table></center>\n";
    CloseTable();
}

function BACookie($setcid, $login, $new_pass) {
    $info = base64_encode("$setcid:$login:$new_pass");
    setcookie("client","$info",time()+2419200);
}

function BAPass() {
    $lets = "abcdefghijklmnopqrstuvwxyz";
    $nums = "23456789";
    for ($x=0; $x < 6; $x++) {
        mt_srand ((double) microtime() * 1000000);
        $let[$x] = substr($lets, mt_rand(0, strlen($lets)-1), 1);
        $num[$x] = substr($nums, mt_rand(0, strlen($nums)-1), 1);
    }
    $BAPass = $let[0] . $num[0] .$let[2] . $let[1] . $num[1] . $let[3] . $num[3] . $let[4];
    return($BAPass);
}

function BAMain() {
    global $stop, $clientinfo, $sitename, $prefix, $db, $cookie2, $client, $module_name, $ban_config;
    include("header.php");
    if(is_client($client)) {
        title(_BA_CLTMENU);
        BAMenu();
    } else {
        mt_srand ((double)microtime()*1000000);
        $maxran = 1000000;
        $random_num = mt_rand(0, $maxran);
        title(_BA_CLTLOG);
        OpenTable();
        if ($stop) {
            echo "<center><font color='#ff0000'><b>"._BA_LOGINC."</b></font></center><br>\n";
        }
        echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<form action='modules.php?name=$module_name' method='post'>\n";
        echo "<input type='hidden' name='op' value='login'>\n";
        echo "<tr><td>"._BA_CLTID.":</td><td><input type='text' name='login' size='15' maxlength='25'></td></tr>\n";
        echo "<tr><td>"._BA_PASS.":</td><td><input type='password' name='pass' size='15' maxlength='20'></td></tr>\n";
        if (extension_loaded("gd") AND ($ban_config['usegfxcheck'] == 2 OR $ban_config['usegfxcheck'] == 3)) {
            echo "<tr><td>"._BA_SECCODE.":</td><td><img src='?gfx=gfx&random_num=$random_num' border='1' height='20' width='80' alt='"._SECURITYCODE."' title='"._SECURITYCODE."'></td></tr>\n";
            echo "<tr><td>"._BA_TYPCODE.":</td><td><input type='text' NAME='gfx_check' SIZE='10' MAXLENGTH='8'></td></tr>\n";
            echo "<input type='hidden' name='random_num' value='$random_num'>\n";
        }
        echo "<tr><td align='center' colspan='2'><input type='submit' value='"._BA_LOGIN."'></td></tr>\n";
        echo "</form></table></center><br>\n";
        echo "<center>[ <a href='modules.php?name=$module_name&amp;op=ClientPassLost'>"._BA_LOSTPASS."</a> |";
        echo " <a href='modules.php?name=$module_name&amp;op=ClientNew'>"._BA_CLTREG."</a> ]</center>\n";
        CloseTable();
    }
    include("footer.php");
}

function clear_text($str) {
    $str = trim($str);
    $str = stripslashes($str);
    $str = strip_tags($str);
    $str = ereg_replace("\"", "", $str);
    $str = ereg_replace("'", "", $str);
    return $str;
}

switch($op) {

    case "BannerEdit":
        $pagetitle = "> "._BA_BANCLT."&raquo; "._BA_EDITBANN;
        if (is_client($client)) {
            include("header.php");
            if (is_numeric($bid)) {
                title(_BA_EDITBANN);
                BAMenu();
                echo"<br>\n";
                OpenTable();
                $bidinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE bid='$bid' AND cid='$cookie2[0]'"));
                echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
                echo "<form action='modules.php?name=$module_name' method='post'>\n";
                echo "<input type='hidden' name='bid' value='$bid'>\n";
                echo "<input type='hidden' name='op' value='BannerEditSave'>\n";
                echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._BA_BANNED."</b></td></tr>\n";
                echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_NEWSRC.":</td><td><input type='text' name='new_image' value='".$bidinfo['imageurl']."' size='40'></td></tr>\n";
                if ($bidinfo['flash'] == 0 && $bidinfo['code'] == 0) {
                    echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CLKU.":</td><td><input type='text' name='new_url' size='50' maxlength='200' value='".$bidinfo['clickurl']."'></td></tr>\n";
                    echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_ALTTXT.":</td><td><input type='text' name='new_alttext' size='50' maxlength='255' value='".$bidinfo['alttext']."'></td></tr>\n";
                } else {
                    echo "<input type='hidden' name='new_url' value=''>\n";
                    echo "<input type='hidden' name='new_alttext' value=''>\n";
                }
                echo "<tr><td align='center' colspan='2'><input type='submit' value='"._BA_SUBMIT."'></td></tr>\n";
                echo "</form>\n</table></center>\n";
                CloseTable();
            } else {
                title(_BA_HCKATP);
                OpenTable();
                echo "<b>"._BA_HCKAMP."</b>\n";
                CloseTable();
                $fecha = date("F jS Y, h:iA.");
                $subject  = _BA_HCKATPON." $sitename";
                $message  = _BA_HCKATPON." $sitename:\n";
                $message .= "----------------------------------------\n";
                $message .= _BA_IP."&raquo; ".$_SERVER['REMOTE_ADDR']."\n";
                $message .= _BA_HCKSTR."&raquo; ".$_SERVER['QUERY_STRING']."\n";
                $message .= "----------------------------------------\n";
                $message .= _BA_REPORTON.": $fecha";
                $from = "$sitename <$adminmail>";
                mail($adminmail, $subject, $message, "From: $from\nX-Mailer: PHP/" . phpversion());
            }
            include("footer.php");
        } else {
            Header("Refresh:0 url=modules.php?name=$module_name");
        }
        break;

    case "BannerEditSave":
        if (is_client($client)) {
            $cid = $cookie2[0];
            $bid = intval($bid);
            $cid = intval($cid);
            $flash = intval($flash);
            $code = intval($code);
            $new_url = clear_text($newimage);
            $new_alttext = clear_text($new_alttext);
            $db->sql_query("UPDATE ".$prefix."_nsnba_banners SET imageurl='$imgurl', clickurl='$new_url', alttext='$new_alttext' WHERE bid='$bid' and cid='$cookie2[0]'");
            Header("Refresh:0 url=modules.php?name=$module_name");
        } else {
            Header("Refresh:0 url=modules.php?name=$module_name");
        }
        break;

    case "BannerList":
        $pagetitle = "> "._BA_BANCLT."&raquo; "._BA_LISTBANN;
        if (is_client($client)) {
            include("header.php");
            title(_BA_LISTBANN);
            BAMenu();
            echo "<br>\n";
            $anumrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='$cookie2[0]'"));
            if ($anumrows < 1) {
                OpenTable();
                echo "<center><b>"._BA_NOBANFOR." $cookie2[1]</b></center>";
                CloseTable();
            } else {
                OpenTable();
                echo "<table width='100%' border='0' bgcolor='#000000'>\n<tr bgcolor='$bgcolor2'>\n";
                echo "<td align='center' valign='bottom'><b>"._BA_ID."</b></td>\n";
                echo "<td align='center' valign='bottom'><b>"._BA_IMPMAD."</b></td>\n";
                echo "<td align='center' valign='bottom'><b>"._BA_CLKS."</b></td>\n";
                echo "<td align='center' valign='bottom'><b>"._BA_CLKP."</b></td>\n";
                echo "<td align='center' valign='bottom'><b>"._BA_ENDDTE."</b></td>\n";
                echo "<td align='center' valign='bottom'><b>"._BA_PLCM."</b></td>\n";
                echo "<td align='center' valign='bottom'><b>"._BA_STAT."</b></td>\n";
                echo "<td align='center' valign='bottom'><b>"._BA_FUNC."</b></td>\n";
                echo "</tr>\n";
                $result = $db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='$cookie2[0]' ORDER BY datestr");
                while ($bidinfo = $db->sql_fetchrow($result)) {
                    if ($bidinfo['impmade']==0) { $percent = 0; } else { $percent = substr(100 * $bidinfo['clicks'] / $bidinfo['impmade'], 0, 5); }
                    if ($bidinfo['dateend']=="0000-00-00") { $remaining = _BA_NOTPUR; } else { $remaining = $bidinfo['dateend']; }
                    if ($bidinfo['active'] == -1) { $status = _BA_PEN; } elseif ($bidinfo['active'] == 0) { $status = _BA_INA; } elseif ($bidinfo['active'] == 1) { $status = _BA_ACT; }
                    if ($bidinfo['pid'] == 1) { $bantype = _BA_HEAD; } elseif ($bidinfo['pid'] == 2) { $bantype = _BA_FOOT; } elseif ($bidinfo['pid'] == 3) { $bantype = _BA_LEFT; } elseif ($bidinfo['pid'] == 4) { $bantype = _BA_RIGHT; } 
                    echo "<tr bgcolor='$bgcolor1'>\n";
                    echo "<td align='center'>$bid";
                    if ($bidinfo['code'] > 0) { echo " <img src='modules/$module_name/images/code.png' height='16' width='16' border='0' alt='"._BA_CDE."' title='"._BA_CDE."'>"; }
                    if ($bidinfo['flash'] > 0) { echo " <img src='modules/$module_name/images/flash.png' height='16' width='16' border='0' alt='"._BA_FLH."' title='"._BA_FLH."'>"; }
                    echo "</td>\n<td align='center'>".$bidinfo['impmade']."</td>\n";
                    echo "<td align='center'>".$bidinfo['clicks']."</td>\n";
                    echo "<td align='center'>$percent%</td>\n";
                    echo "<td align='center'>$remaining</td>\n";
                    echo "<td align='center'>$bantype</td>\n";
                    echo "<td align='center'>$status</td>\n";
                    echo "<td align='center'>";
                    if ($bidinfo['height'] > $bidinfo['width'] AND $bidinfo['height'] > 400) {
                        $height = $bidinfo['height'] + 50;
                        $width = 500;
                    } elseif ($bidinfo['width'] > $bidinfo['height'] AND $bidinfo['width'] > 400) {
                        $height = 400;
                        $width = $bidinfo['width'] + 50;
                    } else {
                        $height = 400;
                        $width = 400;
                    }
                    echo " <a href='modules.php?name=$module_name&op=BannerView&bid=".$bidinfo['bid']."' onclick=\"NewWindow(this.href,'BannerView".$bidinfo['bid']."','$width','$height','yes');return false;\"><img src='modules/$module_name/images/view.png' height='16' width='16' border='0' alt='"._BA_VIEW."' title='"._BA_VIEW."'></a> ";
                    echo " <a href='modules.php?name=$module_name&op=BannerMail&bid=".$bidinfo['bid']."' onclick=\"NewWindow(this.href,'BannerMail".$bidinfo['bid']."','400','50','no');return false;\"><img src='modules/$module_name/images/email.png' height='16' width='16' border='0' alt='"._BA_MAIL."' title='"._BA_MAIL."'></a> ";
                    if ($bidinfo['active'] == 1) {
                        echo " <a href='modules.php?name=$module_name&op=BannerEdit&bid=".$bidinfo['bid']."'><img src='modules/$module_name/images/edit.png' height='16' width='16' border='0' alt='"._BA_EDIT."' title='"._BA_EDIT."'></a> ";
                    } else { echo " <img src='modules/$module_name/images/edit-no.png' height='16' width='16' border='0' alt='"._BA_NOTALW."' title='"._BA_NOTALW."'> "; }
                    echo "</td>\n";
                    echo "</tr>\n";
                }
                echo "</table>\n";
                CloseTable();
            }
            include("footer.php");
        } else {
            Header("Refresh:0 url=modules.php?name=$module_name");
        }
        break;

    case "BannerMail":
        $bid = intval($bid);
        echo "<html>\n";
        echo "<head><title>"._BA_MAILBANNSTAT.": $bid</title></head>\n";
        echo "<body bgcolor=\"#FFFFFF\" link=\"#000000\" alink=\"#000000\" vlink=\"#000000\">\n";
        if (is_client($client)) {
            list ($cname, $email) = $db->sql_fetchrow($db->sql_query("SELECT name, email FROM ".$prefix."_nsnba_clients WHERE cid='$cookie2[0]'"));
            if ($email=="") {
                echo "<center><b>"._BA_STATNOTSENT."</b></center><br>\n";
            } else {
                $bidinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE bid='$bid' and cid='$cookie2[0]'"));
                if ($bidinfo['impmade']==0) {
                    $percent = 0;
                } else {
                    $percent = substr(100 * $bidinfo['clicks'] / $bidinfo['impmade'], 0, 5);
                }
                $remaining = $bidinfo['dateend'];
                $fecha = date("F jS Y, h:iA.");
                $subject  = _BA_BANSTATAT." $sitename";
                $message  = _BA_COMPSTAT." $sitename:\n\n";
                $message .= _BA_CONNME.": $cname\n";
                $message .= _BA_BANNUM.": $bid\n";
                $message .= _BA_IMGSRC."&raquo; ".$bidinfo['imageurl']."\n";
                $message .= _BA_CLKU."&raquo; ".$bidinfo['clickurl']."\n\n";
                $message .= _BA_IMPMAD."&raquo; ".$bidinfo['impmade']."\n";
                $message .= _BA_CLKS."&raquo; ".$bidinfo['clicks']."\n";
                $message .= _BA_CLKP."&raquo; ".$bidinfo['percent']."%\n";
                $message .= _BA_STRDTE."&raquo; ".$bidinfo['datestr']."\n";
                if ($bidinfo['dateend']!="0000-00-00") {
                    $message .= _BA_ENDDTE."&raquo; ".$bidinfo['dateend']."\n";
                }
                $message .= _BA_REPORTON.": $fecha";
                $from = "$sitename";
                mail($email, $subject, $message, "From: $from\nX-Mailer: PHP/" . phpversion());
                echo "<center><b>"._BA_STATSENT."</b></center>\n";
            }
        } else {
            echo "<center><b>"._BA_HCKATP."</b></center>\n";
        }
        echo "</body>\n";
        echo "</html>";
        break;

    case "BannerView":
        $bid = intval($bid);
        echo "<html>\n";
        echo "<head><title>"._BA_VIEWBANN.": $bid</title></head>\n";
        echo "<body bgcolor=\"#FFFFFF\" link=\"#000000\" alink=\"#000000\" vlink=\"#000000\">\n";
        if (is_client($client)) {
            $baninfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE bid='$bid' AND cid='$cookie2[0]'"));
            list ($bantype) = $db->sql_fetchrow($db->sql_query("SELECT title FROM ".$prefix."_nsnba_placements WHERE pid='".$baninfo['pid']."'"));
            echo "<center><table border='0' cellpadding='0' cellspacing='0'>\n";
            echo "<tr><td>\n";
            echo "<table border='0' cellpadding='2' cellspacing='2'>\n";
            echo "<tr><td>\n";
            if ($baninfo['flash']==1) {
                echo "<center>";
                echo " <object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0' width='468' height='60'>";
                echo " <param name=movie value='".$baninfo['imageurl']."'>";
                echo " <param name=quality value=high>";
                echo " <embed src='".$baninfo['imageurl']."' quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width='468' height='60'>";
                echo " </embed> ";
                echo " </object>";
                echo "</center>\n";
            } elseif ($baninfo['code']==1) {
                $fp = fopen ($baninfo['imageurl'], "rb");
                $contents = fread ($fp, filesize ($baninfo['imageurl']));
                fclose ($fp);
                echo "<center>$contents</center>\n";
            } else {
                echo "<center><img src='".$baninfo['imageurl']."' border='0' alt='".$baninfo['alttext']."'></center><br>\n";
            }
            if ($baninfo['impmade']==0) {
                $percent = 0;
            } else {
                $percent = substr(100 * $baninfo['clicks'] / $baninfo['impmade'], 0, 5);
            }
            $left = $baninfo['imptotal']-$baninfo['impmade'];
            echo "</td></tr>\n";
            echo "</table></center>\n";
            if ($baninfo['height'] > $baninfo['width']) {
                echo "</td>\n<td valign='top'>\n";
            } else {
                echo "</td></tr>\n<tr><td>\n";
            }
            echo "<table border='0' cellpadding='2' cellspacing='2'>\n";
            echo "<tr><td align='right'>"._BA_IMGSRC.":</td><td>".$baninfo['imageurl']."</td></tr>\n";
            if ($baninfo['clickurl'] != "") { echo "<tr><td align='right'>"._BA_CLKU.":</td><td>".$baninfo['clickurl']."</td></tr>\n"; }
            if ($baninfo['alttext'] != "") { echo "<tr><td align='right'>"._BA_ALTTXT.":</td><td>".$baninfo['alttext']."</td></tr>\n"; }
            echo "<tr><td align='right'>"._BA_PLCM.":</td><td>$bantype</td></tr>\n";
            if ($baninfo['imptotal'] == 0) {
                echo "<tr><td align='right'>"._BA_IMPMAD.":</td><td>".$baninfo['impmade']."</td></tr>\n";
            } else {
                echo "<tr><td align='right'>"._BA_IMPPUR.":</td><td>".$baninfo['imptotal']."</td></tr>\n";
                echo "<tr><td align='right'>"._BA_IMPMAD.":</td><td>".$baninfo['impmade']."</td></tr>\n";
                echo "<tr><td align='right'>"._BA_IMPLFT.":</td><td>$left</td></tr>\n";
            }
            if ($baninfo['dateend'] != "0000-00-00") {
                echo "<tr><td align='right''>"._BA_ENDDTE.":</td><td>".$baninfo['dateend']."</td></tr>\n";
            }
            echo "</table>\n";
            echo "</td></tr>\n";
            echo "</table></center>\n";
        } else {
            echo "<center><b>"._BA_HCKATP."</b></center>\n";
        }
        echo "</body>\n";
        echo "</html>";
        break;

    case "ClientEdit":
        $pagetitle = "> "._BA_BANCLT."&raquo; "._BA_EDITCLNT;
        if (is_client($client)) {
            include("header.php");
            title(_BA_EDITCLNT);
            BAMenu();
            echo "<br>\n";
            OpenTable();
            $result = $db->sql_query("SELECT name, email FROM ".$prefix."_nsnba_clients WHERE login='$cookie2[1]'");
            list ($cname, $email) = $db->sql_fetchrow($result);
            echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
            echo "<form action='modules.php?name=$module_name' method='post'>\n";
            echo "<input type='hidden' name='op' value='ClientEditSave'>\n";
            echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._BA_BANNED."</b></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CLTID.":</td><td>$cookie2[1]</td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CONNME.":</td><td><input type='text' name='chng_name' size='40' maxlength='60' value='$cname'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CONEML.":</td><td><input type='text' name='chng_email' size='40' maxlength='60' value='$email'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_NEWPASS.":</td><td><input type='password' name='new_pass1' size='10' maxlength='20'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CNFPASS.":</td><td><input type='password' name='new_pass2' size='10' maxlength='20'></td></tr>\n";
            echo "<tr><td align='center' colspan='2'><input type='submit' value='"._BA_SUBMIT."'></td></tr>\n";
            echo "</form>\n</table></center>\n";
            CloseTable();
            include("footer.php");
        } else {
            Header("Refresh:0 url=modules.php?name=$module_name");
        }
        break;

    case "ClientEditSave":
        $pagetitle = "> "._BA_BANCLT."&raquo; "._BA_UPDTCLNT;
        if (is_client($client)) {
            $chng_name = clear_text($chng_name);
            $chng_email = clear_text($chng_email);
            $new_pass1 = clear_text($new_pass1);
            $new_pass2 = clear_text($new_pass2);
            include("header.php");
            title(_BA_UPDTCLNT);
            $new_pass1 = trim ("$new_pass1");
            $new_pass2 = trim ("$new_pass2");
            BAMenu();
            echo "<br>\n";
            OpenTable();
            if (($new_pass1 != $new_pass2) AND ($new_pass1 != "" AND $new_pass2 != "")) {
                echo "<center><b>"._BA_ERR_NOMATCH."</b></center>\n";
            } elseif ($new_pass1 > "") {
                $new_pass = md5($new_pass1);
                $db->sql_query("UPDATE ".$prefix."_nsnba_clients SET name='$chng_name', email='$chng_email', passwd='$new_pass' WHERE cid='$cookie2[0]'");
                $info = base64_encode("$cid:$login:$new_pass");
                setcookie("client","$info",time()+3024000);
                echo "<center><b>"._BA_ACCPASUPD."</b></center>\n";
            } else {
                $chng_extra = ereg_replace("\"", "", $chng_extra);
                $chng_extra = ereg_replace("'", "", $chng_extra);
                $db->sql_query("UPDATE ".$prefix."_nsnba_clients SET name='$chng_name', email='$chng_email' WHERE cid='$cookie2[0]'");
                echo "<center><b>"._BA_ACCUPD."</b></center>\n";
            }
            CloseTable();
            include("footer.php");
        } else {
            Header("Refresh:0 url=modules.php?name=$module_name");
        }
        break;

    case "ClientNew":
        $pagetitle = "> "._BA_BANCLT."&raquo; "._BA_CLTREG;
        if (!is_client($client)) {
            mt_srand ((double)microtime()*1000000);
            $maxran = 1000000;
            $random_num = mt_rand(0, $maxran);
            include ("header.php");
            title(_BA_CLTREG);
            $new_login = $cookie[1];
            $userinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$user_prefix."_users where username='$new_login'"));
            OpenTable();
            echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
            echo "<form action='modules.php?name=$module_name' method='post'>\n";
            echo "<input type='hidden' name='op' value='ClientNewSave'>\n";
            echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._BA_BANNED."</b></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CLTID.":</td><td><input type='text' name='new_login' size='30' maxlength='26' value='$new_login'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CONNME.":</td><td><input type='text' name='new_name' size='30' maxlength='60' value='".$userinfo['name']."'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CONEML.":</td><td><input type='text' name='new_email' size='30' maxlength='60' value='".$userinfo['user_email']."'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_PASS.":</td><td><input type='password' name='new_pass1' size='10' maxlength='20'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_PASSRE.":</td><td><input type='password' name='new_pass2' size='10' maxlength='20'></td></tr>\n";
            if (extension_loaded("gd") AND ($ban_config['usegfxcheck'] == 1 OR $ban_config['usegfxcheck'] == 3)) {
                echo "<tr><td>"._BA_SECCODE.":</td><td><img src='?gfx=gfx&random_num=$random_num' border='1' height='20' width='80' alt='"._SECURITYCODE."' title='"._SECURITYCODE."'></td></tr>\n";
                echo "<tr><td>"._BA_TYPCODE.":</td><td><input type='text' NAME='gfx_check' SIZE='10' MAXLENGTH='8'></td></tr>\n";
                echo "<input type='hidden' name='random_num' value='$random_num'>\n";
            }
            echo "<tr><td align='center' colspan='2'><input type='submit' value='"._BA_SUBMIT."'></td></tr>\n";
            echo "</form>\n";
            echo "</table></center>\n";
            CloseTable();
            include ("footer.php");
        } else {
            Header("Refresh:0 url=modules.php?name=$module_name");
        }
        break;

    case "ClientNewSave":
        $stop = "";
        $pagetitle = "> "._BA_BANCLT."&raquo; "._BA_CLTREG;
        if (!is_client($client)) {
            include("header.php");
            title(_BA_CLTREG);
            if ($new_name == "") { $new_name = $new_login; }
            $new_login = clear_text($new_login);
            $new_name = clear_text($new_name);
            $new_email = clear_text($new_email);
            $new_pass1 = clear_text($new_pass1);
            $new_pass2 = clear_text($new_pass2);
            $datekey = date("F j");
            $rcode = hexdec(md5($_SERVER[HTTP_USER_AGENT] . $sitekey . $_POST[random_num] . $datekey));
            $code = substr($rcode, 2, 6);
            if (extension_loaded("gd") AND $code != $gfx_check AND ($ban_config['usegfxcheck'] == 1 OR $ban_config['usegfxcheck'] == 3)) {
                OpenTable();
                echo "<center><b>"._BA_ERRSECCODE."</b><br><br>"
                    .""._GOBACK."</center>";
                CloseTable();
                include("footer.php");
                die();
            }
            if ($new_pass1 != $new_pass2) {
                OpenTable();
                echo "<center><b>"._BA_ERR_NOMATCH."</b></center>\n";
                CloseTable();
            } else {
                clientCheck($new_login, $new_email);
                if ($stop <= "") {
                    $cryptpass = md5($new_pass1);
                    $tempto = $db->sql_query("SELECT max(cid) AS new_cid FROM ".$prefix."_nsnba_clients");
                    list ($new_cid) = $db->sql_fetchrow($tempto);
                    $new_cid = $new_cid + 1;
                    $result = $db->sql_query("INSERT INTO ".$prefix."_nsnba_clients (cid, name, email, login, passwd) VALUES ('$new_cid','$new_name','$new_email','$new_login','$cryptpass')");
                    $message = _BA_WELTO." $sitename!\n\n";
                    $message .= _BA_USEDMAIL." $sitename. ";
                    $message .= _BA_CLNTINFO.":\n\n- "._BA_CLTID.": $new_login\n- "._BA_PASS.": $new_pass1";
                    $subject = _BA_CLNTPASS." $new_login";
                    $from = "$adminmail";
                    mail($new_email, $subject, $message, "From: $from\nReturn-Path: $from\nX-Mailer: PHP/" . phpversion());
                    $to = $adminmail;
                    $from = $new_email;
                    $subject = "$sitename - "._BA_NCLTADD;
                    $message = "$new_login "._BA_HASADD." $sitename.";
                    mail($to, $subject, $message, "From: $from\nReturn-Path: $from\nX-Mailer: PHP/" . phpversion());
                    OpenTable();
                    echo "<center><b>"._BA_ACCCREATE."</b><br><br>";
                    echo _BA_NOWREG."<br>";
                    echo "<a href='modules.php?name=$module_name'>"._BA_CLTLOG."</a><br><br>";
                    echo _BA_THNKREG." $sitename!</center>";
                    CloseTable();
                } else {
                    OpenTable();
                    echo "$stop";
                    CloseTable();
                }
            }
            include("footer.php");
        } else {
            Header("Refresh:0 url=modules.php?name=$module_name");
        }
        break;

    case "ClientPassLost":
        $pagetitle = "> "._BA_BANCLT."&raquo; "._BA_CLTPASLOST;
        if (!is_client($client)) {
            include("header.php");
            title(_BA_CLTPASLOST);
            OpenTable();
            echo "<b>"._BA_LOSTPASS."</b><br><br>\n";
            echo _BA_SENDCODE."<br><br>\n";
            echo "<center><table border='0'>\n";
            echo "<form action='modules.php?name=$module_name' method='post'>\n";
            echo "<input type='hidden' name='op' value='ClientPassMail'>\n";
            echo "<tr><td>"._BA_CLTID.":</td><td><input type='text' name='cname' size='15' maxlength='25'></td></tr>\n";
            echo "<tr><td>"._BA_CONFCODE.":</td><td><input type='text' name='code' size='11' maxlength='10'></td></tr>\n";
            echo "<tr><td align='center' colspan='2'><input type='submit' value='"._BA_SUBMIT."'></td></tr>\n";
            echo "</form>\n</table>\n</center><br>\n";
            echo "<center>[ <a href='modules.php?name=$module_name'>"._BA_CLTLOG."</a> |";
            echo " <a href='modules.php?name=$module_name&amp;op=ClientNew'>"._BA_CLTREG."</a> ]</center>\n";
            CloseTable();
            include("footer.php");
        } else {
            Header("Refresh:0 url=modules.php?name=$module_name");
        }
        break;

    case "ClientPassMail":
        $pagetitle = "> "._BA_BANCLT."&raquo; "._BA_CLTPASMAIL;
        if (!is_client($client)) {
            $cname = clear_text($cname);
            $code = clear_text($code);
            $result = $db->sql_query("SELECT email, passwd FROM ".$prefix."_nsnba_clients WHERE login='$cname'");
            $numrows = $db->sql_numrows($result);
            include("header.php");
            if ($numrows == 0) {
                title(_BA_CLTNOCLT);
                OpenTable();
                echo "<center>"._BA_NOINFO."</center>";
                CloseTable();
            } else {
                $host_name = $_SERVER['REMOTE_ADDR'];
                $result = $db->sql_query("SELECT email, passwd FROM ".$prefix."_nsnba_clients WHERE login='$cname'");
                list ($email, $pass) = $db->sql_fetchrow($result);
                $areyou = substr($pass, 0, 10);
                if ($areyou==$code) {
                    $newpass=BAPass();
                    $message = _BA_CLTACC." '$cname' "._BA_AT." $sitename "._BA_CLTACC2." $host_name "._BA_CLTACC3.": $newpass\n\n "._BA_CLTACC4." $nukeurl/modules.php?name=$module_name\n\n"._BA_CLTACC5;
                    $subject = _BA_CLTPASSFOR." $cname";
                    if ($email != "") {
                        mail($email, $subject, $message, "From: $adminmail\nReturn-Path: $adminmail\nX-Mailer: PHP/" . phpversion());
                    }
                    $cryptpass = md5($newpass);
                    $query="UPDATE ".$prefix."_nsnba_clients SET passwd='$cryptpass' WHERE login='$cname'";
                    if (!$db->sql_query($query)) {
                        title(_BA_CLTDBERR);
                        OpenTable();
                        echo _BA_CONTADMN;
                        echo "<center>"._GOBACK."</center>";
                        CloseTable();
                    } elseif ($email=="") {
                        title(_BA_ERR_INVEML);
                        OpenTable();
                        echo _BA_CONTADMN2;
                        echo "<center>"._GOBACK."</center>";
                        CloseTable();
                    } else {
                        title(_BA_CLTPASMAIL);
                        OpenTable();
                        echo "<center>"._BA_MAILPASS." $cname.</center>";
                        echo "<center>"._GOBACK."</center>";
                        CloseTable();
                    }
                } else {
                    $host_name = $_SERVER['REMOTE_ADDR'];
                    $result = $db->sql_query("SELECT email, passwd FROM ".$prefix."_nsnba_clients WHERE login='$cname'");
                    list ($email, $pass) = $db->sql_fetchrow($result);
                    $areyou = substr($pass, 0, 10);
                    $message =  _BA_CLTACC." '$cname' "._BA_AT." $sitename "._BA_CLTACC2." $host_name "._BA_CLTACC6.": $areyou \n\n"._BA_CLTACC7." $nukeurl/modules.php?name=$module_name&op=ClientPassLost\n"._BA_CLTACC8;
                    $subject= _BA_CLTCODEFOR." $cname";
                    if ($email != "") {
                        mail($email, $subject, $message, "From: $adminmail\nReturn-Path: $adminmail\nX-Mailer: PHP/" . phpversion());
                    }
                    title(_BA_CLTCODMAIL);
                    OpenTable();
                    echo "<center>"._BA_MAILCODE." $cname</center><br>\n";
                    echo "<center>"._GOBACK."</center>";
                    CloseTable();
                }
            }
            include ("footer.php");
        } else {
            Header("Refresh:0 url=modules.php?name=$module_name");
        }
        break;

    case "ClientView":
        echo "<html>\n";
        echo "<head><title>"._BA_VIEWCLNT.": $cookie2[1]</title></head>\n";
        echo "<body bgcolor=\"#FFFFFF\" link=\"#000000\" alink=\"#000000\" vlink=\"#000000\">\n";
        if (is_client($client)) {
            $result = $db->sql_query("SELECT name, email FROM ".$prefix."_nsnba_clients WHERE login='$cookie2[1]'");
            list ($cname, $email) = $db->sql_fetchrow($result);
            echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
            echo "<tr><td align='right'>"._BA_CLTID.":</td><td>$cookie2[1]</td></tr>\n";
            echo "<tr><td align='right'>"._BA_CONNME.":</td><td>$cname</td></tr>\n";
            echo "<tr><td align='right'>"._BA_CONEML.":</td><td>$email</td></tr>\n";
            echo "</table></center>\n";
        } else {
            echo "<center><b>"._BA_HCKATP."</b></center>\n";
        }
        echo "</body>\n";
        echo "</html>";
        break;

    default:
        $pagetitle = "> "._BA_BANCLT."&raquo; "._BA_CLTMENU;
        BAMain();
        break;

    case "login":
        $pagetitle = "> "._BA_BANCLT."&raquo; "._BA_CLTLOG;
        $login = clear_text($login);
        $pass = clear_text($pass);
        $referer = $_SERVER['HTTP_REFERER'];
        if ($referer == "") { $referer = $nukeurl; }
        $setinfo = $db->sql_fetchrow($db->sql_query("SELECT passwd, cid FROM ".$prefix."_nsnba_clients WHERE login='$login'"));
        if (($db->sql_numrows($result)==1) AND ($setinfo[cid] != 0) AND ($setinfo[passwd] != "")) {
            $dbpass=$setinfo[passwd];
            $new_pass = md5($pass);
            if ($dbpass != $new_pass) {
                header("Location: modules.php?name=$module_name&stop=1");
                return;
            }
            $datekey = date("F j");
            $rcode = hexdec(md5($_SERVER[HTTP_USER_AGENT] . $sitekey . $random_num . $datekey));
            $code = substr($rcode, 2, 6);
            if (extension_loaded("gd") AND $code != $gfx_check AND ($ban_config['usegfxcheck'] == 2 OR $ban_config['usegfxcheck'] == 3)) {
                header("Location: modules.php?name=$module_name&stop=1");
                die();
            } else {
                $setcid = $setinfo[cid];
                BACookie($setcid, $login, $new_pass);
                header("Location: $referer");
            }
        } else {
            header("Location: modules.php?name=$module_name&stop=1");
        }
        break;

    case "logout":
        $pagetitle = "> "._BA_BANCLT."&raquo; "._BA_CLTOUT;
        $referer = $_SERVER['HTTP_REFERER'];
        if ($referer == "") { $referer = $nukeurl; }
        cookierecode($client);
        $c_uname = $cookie2[1];
        setcookie("client");
        header("Location: $referer");
        break;

}

?>