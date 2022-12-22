<?php

/********************************************************/
/* NSN Banner Ads                                       */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/

$modname = "Banner_Ads";
if (!stristr($_SERVER['PHP_SELF'], "admin.php") && !stristr($_SERVER['SCRIPT_NAME'], "admin.php")) {
    Header("Location: ../../../admin.php");
    die();
}
require_once("mainfile.php");
get_lang($modname);
$index=1;
$aid = substr("$aid", 0,25);
$row = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='$modname'"));
$row2 = $db->sql_fetchrow($db->sql_query("SELECT name, radminsuper FROM ".$prefix."_authors WHERE aid='$aid'"));
$admins = explode(",", $row['admins']);
$auth_user = 0;
for ($i=0; $i < sizeof($admins); $i++) {
    if ($row2['name'] == "$admins[$i]" AND $row['admins'] != "") {
        $auth_user = 1;	
    }
}

if ($row2['radminsuper'] == 1 || $auth_user == 1) {
$ban_config = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnba_config WHERE id='1'"));

function BAAdmin() {
    global $prefix, $db, $modname, $bgcolor2;
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
    echo "<center>\n<table cellpadding='3'>\n<tr>\n<td align='center' valign='top' width='150'>\n";
    echo "<a href='admin.php?op=BABannerAdd'>"._BA_ADDBAN."</a><br>";
    echo "<a href='admin.php?op=BAClientAdd'>"._BA_ADDCLT."</a><br>";
    echo "</td>\n";
    echo "<td align='center' valign='top' width='150'>\n";
    echo "<a href='admin.php?op=BCConfig'>"._BA_CFGSET."</a><br>";
    $clrows = $db->sql_numrows($db->sql_query("SELECT cid FROM ".$prefix."_nsnba_clients"));
    echo "<a href='admin.php?op=BAClient'>"._BA_CLTLST."</a> ($clrows)<br>";
    echo "</td>\n";
    echo "<td align='center' valign='top' width='150'>\n";
    $ablrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE active='1'"));
    echo "<a href='admin.php?op=BABanner&amp;active=1'>"._BA_ABANLST."</a> ($ablrows)<br>";
    $iblrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE active='0'"));
    echo "<a href='admin.php?op=BABanner&amp;active=0'>"._BA_IBANLST."</a> ($iblrows)<br>";
    $pblrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE active='-1'"));
    echo "<a href='admin.php?op=BABanner&amp;active=-1'>"._BA_PBANLST."</a> ($pblrows)<br>";
    echo "</td>\n</tr>\n</table>\n</center>\n";
    CloseTable();
}

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

function clear_text($str) {
    $str = trim($str);
    $str = stripslashes($str);
    $str = strip_tags($str);
    $str = ereg_replace("\"", "", $str);
    $str = ereg_replace("'", "", $str);
    return $str;
}

switch($op) {

    case "BABannerAds":
        $pagetitle = "> "._BA_ADMIN;
        include ("header.php");
        title(_BA_ADMIN);
        BAAdmin();
        include ("footer.php");
    break;

    case "BABanner":
        $pagetitle = "> "._BA_ADMIN."&raquo; "._BA_LISTBANN;
        include ("header.php");
        title(_BA_LISTBANN);
        BAAdmin();
        echo "<br>\n";
        $result = $db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE active='$active' ORDER BY pid,cid");
        $numrows = $db->sql_numrows($result);
        if($numrows > 0) {
            OpenTable();
            echo "<center><table border='0' bgcolor='$bgcolor2' cellpadding='2' width='100%'>\n";
            echo "<tr bgcolor='$bgcolor2'>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_CLTID."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_IMPTOT."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_IMPLFT."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_CLKS."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_CLKP."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_PLCM."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_STAT."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_FUNC."</b></td>\n";
            echo "</tr>\n";
            while ($bidinfo = $db->sql_fetchrow($result)) {
                $result2 = $db->sql_query("SELECT login FROM ".$prefix."_nsnba_clients WHERE cid='$cid'");
                list ($login) = $db->sql_fetchrow($result2);
                if ($bidinfo['impmade'] == 0) { $percent = 0; } else { $percent = substr(100 * $bidinfo['clicks'] / $bidinfo['impmade'], 0, 5); }
                if ($bidinfo['imptotal'] == 0) { $left = ""._BA_UNLIMT.""; } else { $left = $bidinfo['imptotal'] - $bidinfo['impmade']; }
                if ($bidinfo['pid'] == 1) { $bantype = _BA_HEAD; } elseif ($bidinfo['pid'] == 2) { $bantype = _BA_FOOT; } elseif ($bidinfo['pid'] == 3) { $bantype = _BA_LEFT; } elseif ($bidinfo['pid'] == 4) { $bantype = _BA_RIGHT; }
                if ($bidinfo['active'] == -1) { $status = ""._BA_PEN.""; } elseif ($bidinfo['active'] == 0) { $status = ""._BA_INA.""; } elseif ($bidinfo['active'] == 1) { $status = ""._BA_ACT.""; }
                echo "<tr bgcolor='$bgcolor1'>\n";
                echo "<td>$login";
                if ($bidinfo['code'] > 0) { echo " <img src='modules/$modname/images/code.png' height='16' width='16' alt='"._BA_CDE."' title='"._BA_CDE."'>"; }
                if ($bidinfo['flash'] > 0) { echo " <img src='modules/$modname/images/flash.png' height='16' width='16' alt='"._BA_FLH."' title='"._BA_FLH."'>"; }
                echo "</td>\n";
                echo "<td align=center>".$bidinfo['impmade']."</td>\n";
                echo "<td align=center>$left</td>\n";
                echo "<td align=center>".$bidinfo['clicks']."</td>\n";
                echo "<td align=center>$percent%</td>\n";
                echo "<td align=center>$bantype</td>\n";
                echo "<td align=center>$status</td>\n";
                echo "<td align=center>";
                if ($bidinfo['height'] > $bidinfo['width'] AND $bidinfo['height'] > 400) {
                    $bidinfo['height'] = $bidinfo['height'] + 50;
                    $bidinfo['width'] = 500;
                } elseif ($bidinfo['width'] > $bidinfo['height'] AND $bidinfo['width'] > 400) {
                    $bidinfo['height'] = 400;
                    $bidinfo['width'] = $bidinfo['width'] + 50;
                } else {
                    $bidinfo['height'] = 400;
                    $bidinfo['width'] = 400;
                }
                echo " <a href='admin.php?op=BABannerView&amp;bid=".$bidinfo['bid']."' onclick=\"NewWindow(this.href,'BABannerView".$bidinfo['bid']."','".$bidinfo['width']."','".$bidinfo['height']."','yes');return false;\"><img src='modules/$modname/images/view.png' height='16' width='16' border='0' alt='"._BA_VIEW."' title='"._BA_VIEW."'></a>";
                echo " <a href='admin.php?op=BABannerMail&amp;bid=".$bidinfo['bid']."' onclick=\"NewWindow(this.href,'BABannerMail".$bidinfo['bid']."','400','50','no');return false;\"><img src='modules/$modname/images/email.png' height='16' width='16' border='0' alt='"._BA_MAIL."' title='"._BA_MAIL."'></a> ";
                echo " <a href='admin.php?op=BABannerEdit&amp;bid=".$bidinfo['bid']."'><img src='modules/$modname/images/edit.png' height='16' width='16' border='0' alt='"._BA_EDIT."' title='"._BA_EDIT."'></a>";
                echo " <a href='admin.php?op=BABannerDelete&amp;bid=".$bidinfo['bid']."'><img src='modules/$modname/images/delete.png' height='16' width='16' border='0' alt='"._BA_DELT."' title='"._BA_DELT."'></a>";
                echo " </td>\n</tr>\n";
            }
            echo "</table></center>\n";
            CloseTable();
        } else {
            OpenTable();
            echo "<center><b>"._BA_NOBANNTYPE."</b></center>\n";
            CloseTable();
        }
        include ("footer.php");
    break;

    case "BABannerAdd":
        $pagetitle = "> "._BA_ADMIN."&raquo; "._BA_ADDBAN;
        include ("header.php");
        title(_BA_ADDBAN);
        BAAdmin();
        echo "<br>\n";
        $cnumrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_clients"));
        if ($cnumrows > 0) {
            OpenTable();
            echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
            echo "<form action='admin.php' method='post'>\n";
            echo "<input type='hidden' name='op' value='BABannerAddSave'>\n";
            echo "<tr><td colspan='2' align='center'><b>"._BA_BAN."&raquo; "._BA_OPT."</b></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CLTID.":</td><td><select name='cid'>\n";
            $result = $db->sql_query("SELECT cid, login FROM ".$prefix."_nsnba_clients ORDER BY login");
            while (list ($cid, $login) = $db->sql_fetchrow($result)) { echo "<option value='$cid'>$login</option>"; }
            echo "</select></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_IMGSRC.":</td><td><input type='text' name='imageurl' size='40'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CLKU.":</td><td><input type='text' name='clickurl' size='50' maxlength='200'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_ALTTXT.":</td><td><input type='text' name='alttext' size='50' maxlength='255'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_HEI.":</td><td><input type='text' name='height' size='5' maxlength='4' value='60'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_WID.":</td><td><input type='text' name='width' size='5' maxlength='4' value='468'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_FLH.":</td><td><select name='flash'><option value='0' selected>"._BA_NO."</option><option value='1'>"._BA_YES."</option></select></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CDE.":</td><td><select name='code'><option value='0' selected>"._BA_NO."</option><option value='1'>"._BA_YES."</option></select></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_STRDTE.":</td><td><input type='text' name='strdate' size='15' maxlength='15' value='".date("Y-m-d", strtotime("+1 week"))."'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_ENDDTE.":</td><td><input type='text' name='enddate' size='15' maxlength='15' value='".date("Y-m-d", strtotime("+1 week +1 month"))."'></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_IMPPUR.":</td><td><select name='imptotal'>\n";
            $i = 0;
            while ($i <= 12) { $j = $i * $ban_config['impamnt']; echo "<option value='$j'>$j "._BA_IMPS."</option>"; $i++; }
            echo "</select></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_PLCM.":</td><td><select name='pid'>\n";
            echo "<option value='1'>"._BA_HEAD."</option>\n";
            echo "<option value='2'>"._BA_FOOT."</option>\n";
            echo "<option value='3'>"._BA_LEFT."</option>\n";
            echo "<option value='4'>"._BA_RIGHT."</option>\n";
            echo "</select></td></tr>\n";
            echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_STAT.":</td><td><select name='active'>\n";
            echo "<option value='-1'>"._BA_PEN."</option>\n";
            echo "<option value='0'>"._BA_INA."</option>\n<option value='1'>"._BA_ACT."</option></td></tr>\n";
            echo "<tr><td align='center' colspan='2'><input type='submit' value='"._BA_SUBMIT."'></td></tr>\n";
            echo "</form>\n";
            echo "</table></center>\n";
            CloseTable();
        } else {
            OpenTable();
            echo "<center><b>"._BA_NOCLTNOBAN."</b></center>\n";
            CloseTable();
        }
        include ("footer.php");
    break;

    case "BABannerAddSave":
        list($latest_bid) = $db->sql_fetchrow($db->sql_query("SELECT max(bid) AS latest_bid FROM ".$prefix."_nsnba_banners"));
        $latest_bid = $latest_bid + 1;
        $imageurl = clear_text($imageurl);
        $clickurl = clear_text($clickurl);
        $alttext = clear_text($alttext);
        $db->sql_query("INSERT INTO ".$prefix."_nsnba_banners VALUES ($latest_bid, $cid, $pid, $imptotal, 0, 0, '$imageurl', '$clickurl', '$alttext', $code, $flash, $height, $width, '$strdate', '$enddate', $active)");
        header("Location: admin.php?op=BABannerAds");
    break;

    case "BABannerDelete":
        $pagetitle = "> "._BA_ADMIN."&raquo; "._BA_DELBANN;
        include("header.php");
        title(_BA_DELBANN);
        BAAdmin();
        echo "<br>\n";
        OpenTable();
        echo "<center><b>"._BA_DELBAN."</b></center><br>\n";
        echo "<center><table><tr>\n";
        echo "<form action='admin.php' method='post'>\n";
        echo "<input type='hidden' name='op' value='BABannerDeleteConf'>\n";
        echo "<input type='hidden' name='bid' value='$bid'>\n";
        echo "<td><input type='submit' value='  "._BA_YES."  '></td>\n";
        echo "</form>\n";
        echo "</tr></table></center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "BABannerDeleteConf":
        $bid = intval($bid);
        $db->sql_query("DELETE FROM ".$prefix."_nsnba_banners WHERE bid='$bid'");
        $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnba_banners");
        header("Location: admin.php?op=BABanner&active=$status");
    break;

    case "BABannerEdit":
        $bid = intval($bid);
        $pagetitle = "> "._BA_ADMIN."&raquo; "._BA_EDITBANN;
        include("header.php");
        title(_BA_EDITBANN);
        BAAdmin();
        echo "<br>\n";
        OpenTable();
        $result = $db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE bid='$bid'");
        $bidinfo = $db->sql_fetchrow($result);
        if ($bidinfo['imptotal'] == 0) { $impressions = ""._BA_UNLIMT.""; } else { $impressions = $bidinfo['imptotal']; }
        if ($bidinfo['active'] == -1) { $sels1 = "selected"; } elseif ($bidinfo['active'] == 0) { $sels2 = "selected"; } elseif ($bidinfo['active'] == 1) { $sels3 = "selected"; }
        if ($bidinfo['flash'] == 0) { $self1 = "selected"; } elseif ($bidinfo['flash'] == 1) { $self2 = "selected"; }
        if ($bidinfo['code'] == 0) { $selc1 = "selected"; } elseif ($bidinfo['code'] == 1) { $selc2 = "selected"; }
        echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<form action='admin.php' method='post'>\n";
        echo "<input type='hidden' name='op' value='BABannerEditSave'>\n";
        echo "<input type='hidden' name='bid' value='".$bidinfo['bid']."'>\n";
        echo "<tr><td colspan='2' align='center'><b>"._BA_BAN."&raquo; "._BA_OPT."</b></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CLTID.":</td><td><select name='chng_cid'>\n";
        $result = $db->sql_query("SELECT * FROM ".$prefix."_nsnba_clients ORDER BY login");
        while ($cidinfo = $db->sql_fetchrow($result)) {
            if ($bidinfo['cid'] != $cidinfo['cid']) { echo "<option value='".$cidinfo['cid']."'>".$cidinfo['login']."</option>"; } else { echo "<option value='".$cidinfo['cid']."' selected>".$cidinfo['login']."</option>"; }
        }
        echo "</select></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_NEWSRC.":</td><td><input type='text' name='chng_imageurl' value='".$bidinfo['imageurl']."' size='40'></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CLKU.":</td><td><input type='text' name='chng_clickurl' size='50' maxlength='200' value='".$bidinfo['clickurl']."'></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_ALTTXT.":</td><td><input type='text' name='chng_alttext' size='50' maxlength='255' value='".$bidinfo['alttext']."'></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_HEI.":</td><td><input type='text' name='chng_height' size='5' maxlength='4' value='".$bidinfo['height']."'></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_WID.":</td><td><input type='text' name='chng_width' size='5' maxlength='4' value='".$bidinfo['width']."'></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_FLH.":</td><td><select name='chng_flash'><option value='0' $self1>"._BA_NO."</option><option value='1' $self2>"._BA_YES."</option></select></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CDE.":</td><td><select name='chng_code'><option value='0' $selc1>"._BA_NO."</option><option value='1' $selc2>"._BA_YES."</option></select></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_STRDTE.":</td><td><input type='text' name='strdate' size='15' maxlength='15' value='".$bidinfo['datestr']."'></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_ENDDTE.":</td><td><input type='text' name='enddate' size='15' maxlength='15' value='".$bidinfo['dateend']."'></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_ADDIMP.":</td><td><select name='chng_imptotal'>\n";
        $i = 0;
        while ($i <= 12) { $j = $i * $ban_config['impamnt']; echo "<option value='$j'>$j "._BA_IMPS."</option>"; $i++; }
        echo "</select></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_PLCM.":</td><td><select name='chng_pid'>\n";
        $sel1 = $sel2 = $sel3 = $sel4 = "";
        if ($bidinfo['pid'] == 1) { $sel1 = " selected"; } else if ($bidinfo['pid'] == 2) { $sel2 = " selected"; } else if ($bidinfo['pid'] == 3) { $sel3 = " selected"; } else if ($bidinfo['pid'] == 4) { $sel4 = " selected"; }
        echo "<option value='1'$sel1>"._BA_HEAD."</option>\n";
        echo "<option value='2'$sel2>"._BA_FOOT."</option>\n";
        echo "<option value='3'$sel3>"._BA_LEFT."</option>\n";
        echo "<option value='4'$sel4>"._BA_RIGHT."</option>\n";
        echo "</select></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_STAT.":</td><td><select name='chng_status'>\n";
        echo "<option value='-1' $sels1>"._BA_PEN."</option>\n";
        echo "<option value='0' $sels2>"._BA_INA."</option>\n<option value='1' $sels3>"._BA_ACT."</option>\n";
        echo "</select></td></tr>\n";
        echo "<tr><td align='center' colspan='2'><input type='submit' value='"._BA_SUBMIT."'></td></tr>\n";
        echo "</form>\n";
        echo "</table></center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "BABannerEditSave":
        $chng_imageurl = clear_text($chng_imageurl);
        $chng_clickurl = clear_text($chng_clickurl);
        $chng_alttext = clear_text($chng_alttext);
        $imgurl = clear_text($chng_imageurl);
        $imptotal = $imptotal + $chng_imptotal;
        $db->sql_query("UPDATE ".$prefix."_nsnba_banners SET cid='$chng_cid', imptotal='$imptotal', imageurl='$imgurl', clickurl='$chng_clickurl', alttext='$chng_alttext', code='$chng_code', flash='$chng_flash', height='$chng_height', width='$chng_width', datestr='$strdate', dateend='$enddate', pid='$chng_pid', active='$chng_status' WHERE bid='$bid'");
        header("Location: admin.php?op=BABanner&active=$chng_status");
    break;

    case "BABannerMail":
        $bid = intval($bid);
        echo "<html>\n";
        echo "<head><title>"._BA_MAILBANNSTAT.": $bid</title></head>\n";
        echo "<body bgcolor=\"#FFFFFF\" link=\"#000000\" alink=\"#000000\" vlink=\"#000000\">\n";
        $bidinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE bid='$bid'"));
        $cidinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnba_clients WHERE cid='".$bidinfo['cid']."'"));
        if ($cidinfo['email'] == "") {
            echo "<center><b>"._BA_STATNOTSENT."</b></center>\n";
        } else {
            if($bidinfo['impmade'] == 0) {
                $percent = 0;
            } else {
                $percent = substr(100 * ($bidinfo['clicks'] / $bidinfo['impmade']), 0, 5);
            }
            if($bidinfo['imptotal'] == 0) {
                $left = _BA_NOTSET;
                $imptotal = _BA_NOTSET;
            } else {
                $left = $bidinfo['imptotal'] - $bidinfo['impmade'];
            }
            if($bidinfo['dateend'] == "0000-00-00") { $remaining = _BA_NOTSET; } else { $remaining = $bidinfo['dateend']; }
            $fecha = date("F jS Y, h:iA.");
            $subject  = _BA_BANSTATAT." $sitename";
            $message  = _BA_COMPSTAT." $sitename:\n";
            $message .= "----------------------------------------\n";
            $message .= _BA_CONNME.": ".$cidinfo['name']."\n";
            $message .= _BA_BANNUM.": $bid\n";
            $message .= _BA_IMGSRC.": ".$bidinfo['imageurl']."\n";
            $message .= _BA_CLKU.": ".$bidinfo['clickurl']."\n";
            $message .= _BA_IMPPUR.": ".$bidinfo['imptotal']."\n";
            $message .= _BA_IMPMAD.": ".$bidinfo['impmade']."\n";
            $message .= _BA_IMPLFT.": $left\n";
            $message .= _BA_CLKS.": ".$bidinfo['clicks']."\n";
            $message .= _BA_CLKP.": $percent%\n";
            $message .= _BA_STRDTE.": ".$bidinfo['datestr']."\n";
            $message .= _BA_ENDDTE.": $remaining\n";
            $message .= _BA_REPORTON.": $fecha";
            $from = "$sitename <$adminmail>";
            mail($cidinfo['email'], $subject, $message, "From: $from\n");
            echo "<center><b>"._BA_STATSENT."</b></center>\n";
        }
        echo "</body>\n";
        echo "</html>";
    break;

    case "BABannerView":
        $bid = intval($bid);
        echo "<html>\n";
        echo "<head><title>"._BA_VIEWBANN.": $bid</title></head>\n";
        echo "<body bgcolor=\"#FFFFFF\" link=\"#000000\" alink=\"#000000\" vlink=\"#000000\">\n";
        $bidinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE bid='$bid'"));
        $cidinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnba_clients WHERE cid='".$bidinfo['cid']."'"));
        if ($bidinfo['dateend'] == "0000-00-00") { $dateend = ""._BA_NOTSET.""; } else { $dateend = $bidinfo['dateend']; }
        if ($bidinfo['active'] == -1) { $activated = ""._BA_PEN.""; } elseif ($bidinfo['active'] == 0) { $activated = ""._BA_INA.""; } elseif ($bidinfo['active'] == 1) { $activated = ""._BA_ACT.""; }
        if ($bidinfo['imptotal'] == 0) { $imptotal = ""._BA_NOTSET.""; }
        if ($bidinfo['pid'] == 1) { $bantype = _BA_HEAD; } elseif ($bidinfo['pid'] == 2) { $bantype = _BA_FOOT; } elseif ($bidinfo['pid'] == 3) { $bantype = _BA_LEFT; } elseif ($bidinfo['pid'] == 4) { $bantype = _BA_RIGHT; }
        echo "<center><table border='0' cellpadding='0' cellspacing='0'>\n";
        echo "<tr><td>\n";
        echo "<table border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<tr><td>\n";
        if ($bidinfo['flash'] == 1 AND $bidinfo['code'] == 0) {
            echo "<center>";
            echo " <object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' width='".$bidinfo['width']."' height='".$bidinfo['height']."'>";
            echo " <param name=movie value='".$bidinfo['imageurl']."'>";
            echo " <param name=quality value=high>";
            echo " <embed src='".$bidinfo['imageurl']."' quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width='".$bidinfo['width']."' height='".$bidinfo['height']."'>";
            echo " </embed> ";
            echo " </object>";
            echo "</center>\n";
        } elseif ($bidinfo['flash'] == 0 AND $bidinfo['code'] == 1) {
            $fp = fopen ("$imageurl", "rb");
            $contents = fread ($fp, filesize ($bidinfo['imageurl']));
            fclose ($fp);
            echo "<center>$contents</center>";
        } else {
            echo "<center><img src='".$bidinfo['imageurl']."' border='1' alt='".$bidinfo['alttext']."' width='".$bidinfo['width']."' height='".$bidinfo['height']."'></center><br>\n";
        }
        echo "</td></tr>\n";
        echo "</table></center>\n";
        if ($bidinfo['height'] > $bidinfo['width']) {
            echo "</td>\n<td valign='top'>\n";
        } else {
            echo "</td></tr>\n<tr><td>\n";
        }
        echo "<table border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<tr><td align='right'>"._BA_CLTID.":</td><td>".$cidinfo['login']."</td></tr>\n";
        echo "<tr><td align='right'>"._BA_IMPTOT.":</td><td>".$bidinfo['imptotal']."</td></tr>\n";
        echo "<tr><td align='right'>"._BA_ENDDTE.":</td><td>$dateend</td></tr>\n";
        echo "<tr><td align='right'>"._BA_IMGSRC.":</td><td>".$bidinfo['imageurl']."</td></tr>\n";
        if ($bidinfo['code'] == 0 AND $bidinfo['flash'] == 0) {
            echo "<tr><td align='right'>"._BA_CLKU.":</td><td>$clickurl</td></tr>\n";
            echo "<tr><td align='right'>"._BA_ALTTXT.":</td><td>$alttext</td></tr>\n";
            echo "<tr><td align='right'>"._BA_FLH.":</td><td>"._BA_NO."</td></tr>\n";
            echo "<tr><td align='right'>"._BA_CDE.":</td><td>"._BA_NO."</td></tr>\n";
            echo "<tr><td align='right''>"._BA_HEI.":</td><td>".$bidinfo['height']."</td></tr>\n";
            echo "<tr><td align='right'>"._BA_WID.":</td><td>".$bidinfo['width']."</td></tr>\n";
        } else {
            echo "<tr><td align='right'>"._BA_FLH.":</td><td>";
            if ($bidinfo['flash'] == 0) { echo ""._BA_NO.""; } else { echo ""._BA_YES.""; }
            echo "</td></tr>\n";
            echo "<tr><td align='right'>"._BA_CDE.":</td><td>";
            if ($bidinfo['code'] == 0) { echo ""._BA_NO.""; } else { echo ""._BA_YES.""; }
            echo "</td></tr>\n";
        }
        echo "<tr><td align='right'>"._BA_PLCM.":</td><td>$bantype</td></tr>\n";
        echo "<tr><td align='right'>"._BA_STAT.":</td><td>$activated</td></tr>\n";
        echo "</table>\n";
        echo "</td></tr>\n";
        echo "</table></center>\n";
        echo "</body>\n";
        echo "</html>";
    break;

    case "BAClient":
        $pagetitle = "> "._BA_ADMIN."&raquo; "._BA_LISTCLNT;
        include ("header.php");
        title(_BA_LISTCLNT);
        BAAdmin();
        echo "<br>\n";
        $result = $db->sql_query("SELECT * FROM ".$prefix."_nsnba_clients ORDER BY login");
        $numrows = $db->sql_numrows($result);
        if($numrows > 0) {
            OpenTable();
            echo "<center><table border='0' cellpadding='2' bgcolor='$bgcolor2'><tr bgcolor='$bgcolor2'>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_CLTID."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_ACT."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_INA."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_PEN."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_UNP."</b></td>\n";
            echo "<td align='center' valign='bottom'><b>"._BA_FUNC."</b></td>\n";
            echo "</tr>\n";
            while ($cidinfo = $db->sql_fetchrow($result)) {
                $actrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='".$cidinfo['cid']."' AND active='1'"));
                $inarows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='".$cidinfo['cid']."' AND active='0'"));
                $penrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='".$cidinfo['cid']."' AND active='-1'"));
                $uknrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='".$cidinfo['cid']."' AND active='-2'"));
                echo "<tr bgcolor='$bgcolor1'>\n";
                echo "<td align='center'><a href='mailto:".$cidinfo['email']."'>".$cidinfo['login']."</a> (".$cidinfo['cid'].")</td>\n";
                echo "<td align='center'>$actrows</td>\n";
                echo "<td align='center'>$inarows</td>\n";
                echo "<td align='center'>$penrows</td>\n";
                echo "<td align='center'>$uknrows</td>\n";
                echo "<td align='center'> ";
                echo "<a href='admin.php?op=BAClientView&amp;cid=".$cidinfo['cid']."' onclick=\"NewWindow(this.href,'BAClientView".$cidinfo['cid']."','400','300','yes');return false;\"><img src='modules/$modname/images/view.png' height='16' width='16' border='0' alt='"._BA_VIEW."' title='"._BA_VIEW."'></a> ";
                echo "<a href='admin.php?op=BAClientEdit&amp;cid=".$cidinfo['cid']."'><img src='modules/$modname/images/edit.png' height='16' width='16' border='0' alt='"._BA_EDIT."' title='"._BA_EDIT."'></a> ";
                echo "<a href='admin.php?op=BAClientDelete&amp;cid=".$cidinfo['cid']."'><img src='modules/$modname/images/delete.png' height='16' width='16' border='0' alt='"._BA_DELT."' title='"._BA_DELT."'></a> ";
                echo "</td>\n";
                echo "</tr>\n";
            }
            echo "</table></center>\n";
            CloseTable();
        } else {
            OpenTable();
            echo "<center><b>"._BA_NOCLTFILE."</b></center>\n";
            CloseTable();
        }
        include ("footer.php");
    break;

    case "BAClientAdd":
        $pagetitle = "> "._BA_ADMIN."&raquo; "._BA_ADDCLT;
        include ("header.php");
        title(_BA_ADDCLT);
        BAAdmin();
        echo "<br>\n";
        OpenTable();
        echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<form action='admin.php' method='post'>";
        echo "<input type='hidden' name='op' value='BAClientAddSave'>";
        echo "<tr><td colspan='2' align='center'><b>"._BA_CLT."&raquo; "._BA_OPT."</b></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CONNME.":</td><td><input type='text' name='new_name' size='30' maxlength='60'></td></tr>";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CONEML.":</td><td><input type='text' name='new_email' size='30' maxlength='60'></td></tr>";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CLTID.":</td><td><input type='text' name='new_login' size='12' maxlength='25'></td></tr>";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_PASS.":</td><td><input type='text' name='new_passwd' size='12' maxlength='10'></td></tr>";
        echo "<tr><td align='center' colspan='2'><input type='submit' value='"._BA_SUBMIT."'></td></tr>";
        echo "</form>\n";
        echo "</table></center>\n";
        CloseTable();
        include ("footer.php");
    break;

    case "BAClientAddSave":
        $new_name = clear_text($new_name);
        $new_email = clear_text($new_email);
        $new_login = clear_text($new_login);
        $new_pass = md5($new_passwd);
        $db->sql_query("INSERT INTO ".$prefix."_nsnba_clients VALUES (NULL, '$new_name', '$new_email', '$new_login', '$new_pass')");
        header("Location: admin.php?op=BABannerAds");
    break;

    case "BAClientDelete":
        $cid = intval($cid);
        $pagetitle = "> "._BA_ADMIN."&raquo; "._BA_DELCLNT;
        include("header.php");
        title(_BA_DELCLNT);
        BAAdmin();
        echo "<br>\n";
        OpenTable();
        echo "<center><b>"._BA_DELCLT."</b></center><br>";
        echo "<center><table><tr>\n";
        echo "<form action='admin.php' method='post'>\n";
        echo "<input type='hidden' name='op' value='BAClientDeleteConf'>\n";
        echo "<input type='hidden' name='cid' value='$cid'>\n";
        echo "<td><input type='submit' value='  "._BA_YES."  '></td>\n";
        echo "</form>\n";
        echo "</tr></table></center><br>\n";
        $numrows = $db->sql_numrows($db->sql_query("SELECT imageurl FROM ".$prefix."_nsnba_banners WHERE cid='$cid'"));
        if ($numrows==0) {
            echo "<center>"._BA_CLTNOBAN."</center>\n";
        } else {
            echo "<center>"._BA_CLTBANDEL."</center>\n";
        }
        CloseTable();
        include("footer.php");
    break;

    case "BAClientDeleteConf":
        $cid = intval($cid);
        $db->sql_query("DELETE FROM ".$prefix."_nsnba_banners WHERE cid='$cid'");
        $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnba_banners");
        $db->sql_query("DELETE FROM ".$prefix."_nsnba_clients WHERE cid='$cid'");
        $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnba_clients");
        header("Location: admin.php?op=BAClient");
    break;

    case "BAClientEdit":
        $cid = intval($cid);
        $pagetitle = "> "._BA_ADMIN."&raquo; "._BA_EDITCLNT;
        include("header.php");
        title(_BA_EDITCLNT);
        BAAdmin();
        echo "<br>\n";
        $cidinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnba_clients WHERE cid='$cid'"));
        OpenTable();
        echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<form action='admin.php' method='post'>";
        echo "<input type='hidden' name='cid' value='$cid'>";
        echo "<input type='hidden' name='op' value='BAClientEditSave'>";
        echo "<tr><td colspan='2' align='center'><b>"._BA_CLT."&raquo; "._BA_OPT."</b></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CLTNUM.":</td><td>$cid</td></tr>";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CLTID.":</td><td><input type='text' name='chng_login' size='12' maxlength='25' value='".$cidinfo['login']."'></td></tr>";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CONNME.":</td><td><input type='text' name='chng_name' size='30' maxlength='60' value='".$cidinfo['name']."'></td></tr>";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CONEML.":</td><td><input type='text' name='chng_email' size='30' maxlength='60' value='".$cidinfo['email']."'></td></tr>";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_PASS.":</td><td><input type='text' name='chng_passwd' size='12' maxlength='10'></td></tr>";
        echo "<tr><td align='center' colspan='2'><input type='submit' value='"._BA_SUBMIT."'></td></tr>";
        echo "</form>";
        echo "</table></center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "BAClientEditSave":
        $chng_name = clear_text($chng_name);
        $chng_email = clear_text($chng_email);
        $chng_login = clear_text($chng_login);
        if ($chng_passwd != "") {
            $new_pass = md5($chng_passwd);
            $db->sql_query("UPDATE ".$prefix."_nsnba_clients SET name='$chng_name', email='$chng_email', login='$chng_login', passwd='$new_passwd' WHERE cid='$cid'");
        } else {
            $db->sql_query("UPDATE ".$prefix."_nsnba_clients SET name='$chng_name', email='$chng_email', login='$chng_login' WHERE cid='$cid'");
        }
        header("Location: admin.php?op=BAClient");
    break;

    case "BAClientView":
        $cid = intval($cid);
        echo "<html>\n";
        echo "<head><title>"._BA_VIEWCLNT.": $cid</title></head>\n";
        echo "<body bgcolor=\"#FFFFFF\" link=\"#000000\" alink=\"#000000\" vlink=\"#000000\">\n";
        $cidinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnba_clients WHERE cid='$cid'"));
        echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CLTID.":</td><td>".$cidinfo['login']." (".$cidinfo['cid'].")</td></tr>";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CONNME.":</td><td>".$cidinfo['name']."</td></tr>";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_CONEML.":</td><td><a href='mailto:".$cidinfo['email']."'>".$cidinfo['email']."</a></td></tr>";
        echo "<tr><td colspan='2'>&nbsp;</td></tr>";
        echo "<tr><td align='right'><b>"._BA_PLCM."</b></td><td><b>#</b></td></tr>";
        $actrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='$cid' AND active='1'"));
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_ACT.":</td><td>$actrows</td></tr>";
        $inarows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='$cid' AND active='0'"));
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_INA.":</td><td>$inarows</td></tr>";
        $penrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='$cid' AND active='-1'"));
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_PEN.":</td><td>$penrows</td></tr>";
        $uknrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='$cid' AND active='-2'"));
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_UNP.":</td><td>$uknrows</td></tr>";
        echo "</table></center>\n";
        echo "</body>\n";
        echo "</html>";
    break;

    case "BCConfig":
        $pagetitle = "> "._BA_CONFG;
        include("header.php");
        title(_BA_CONFG);
        BAAdmin();
        echo "<br>\n";
        OpenTable();
        echo "<center><table border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<form action='admin.php' method='post'>\n";
        echo "<input type='hidden' name='op' value='BCConfigSave'>\n";
        echo "<tr><td colspan='2' align='center'><b>"._BA_CFG."&raquo; "._BA_OPT."</b></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_IPP.":</td><td><input type='text' size='5' name='xipp' value='".$ban_config['ipp']."'></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2'>"._BA_IMPAMT.":</td><td><input type='text' name='ximpamnt' size='5' value='".$ban_config['impamnt']."'></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2' valign='top'>"._BA_USEGFXCHECK."</td>\n<td>";
        if (extension_loaded("gd")) {
            $ck0 = $ck1 = $ck2 = $ck3 = "";
            if ($ban_config['usegfxcheck']==0) { $ck0 = " checked"; } elseif ($ban_config['usegfxcheck']==1) { $ck1 = " checked"; } elseif ($ban_config['usegfxcheck']==2) { $ck2 = " checked"; } elseif ($ban_config['usegfxcheck']==3) { $ck3 = " checked"; }
            echo "<input type='radio' name='xusegfxcheck' value='0'$ck0>"._BA_NC."<br>\n";
            echo "<input type='radio' name='xusegfxcheck' value='1'$ck1>"._BA_RC."<br>\n";
            echo "<input type='radio' name='xusegfxcheck' value='2'$ck2>"._BA_LC."<br>\n";
            echo "<input type='radio' name='xusegfxcheck' value='3'$ck3>"._BA_CA."";
        } else {
            echo "<input type='hidden' name='xusegfxcheck' value='0'>"._BA_GD."";
        }
        echo "</td></tr>\n";
        echo "<tr><td align='center' colspan='2'><input type='submit' value='"._BA_SUBMIT."'></td></tr>";
        echo "</form>\n";
        echo "</table></center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "BCConfigSave":
        $db->sql_query("UPDATE ".$prefix."_nsnba_config SET ipp='$xipp', impamnt='$ximpamnt',usegfxcheck='$xusegfxcheck' WHERE id='1'");
        header("Location: admin.php?op=BABannerAds");
    break;

}

} else {
    echo _BA_ACCDEN;
}

?>
