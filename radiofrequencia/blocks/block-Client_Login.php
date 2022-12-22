<?php

/********************************************************/
/* NSN Banner Ads                                       */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/

if (stristr($_SERVER['PHP_SELF'], "block-Client_Login") || stristr($_SERVER['SCRIPT_NAME'], "block-Client_Login.php")) { Header("Location: index.php"); }
$modname = "Banner_Ads";
get_lang($modname);
$content = "";
global $nukeurl, $client, $cookie2, $prefix, $db, $anonymous, $sitekey;
list ($usegfxcheck) = $db->sql_fetchrow($db->sql_query("SELECT usegfxcheck FROM ".$prefix."_nsnba_config WHERE id='1'"));

// Banner Client Login
if (is_client($client)) {
    $cltname = $cookie2[1];
    $content .= _BA_WEL.", <b>$cltname</b>.<br>(<a href='modules.php?name=$modname&amp;op=logout'>"._BA_LOGOUT."</a>)\n";
    $content .= "<hr noshade size='1'>\n";
        list($cid) = $db->sql_fetchrow($db->sql_query("SELECT cid FROM $prefix"._nsnba_clients." WHERE login='$cltname'"));
        $actban = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='$cid' AND active='1'"));
        $expban = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='$cid' AND active='0'"));
        $penban = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnba_banners WHERE cid='$cid' AND active='-1'"));
        $totban = $actban + $expban + $penban;
        $content .= "<b><a href='modules.php?name=$modname'>"._BA_BANS."</a>:</b><br>\n";
        $content .= "<big><b>&middot;</b></big> "._BA_PEN.": <b>$penban</b><br>\n";
        $content .= "<big><b>&middot;</b></big> "._BA_ACT.": <b>$actban</b><br>\n";
        $content .= "<big><b>&middot;</b></big> "._BA_INA.": <b>$expban</b><br>\n";
        $content .= "<big><b>&middot;</b></big> "._BA_TOT.": <b>$totban</b><br>\n";
} else {
    mt_srand ((double)microtime()*1000000);
    $maxran = 1000000;
    $random_num = mt_rand(0, $maxran);
    $content .= "Welcome, <b>$anonymous</b>.<br>\n";
    $content .= "<hr noshade size='1'>\n";
    $content .= "<table border=0 cellpadding=0 cellspacing=0>\n";
    $content .= "<tr><form action='modules.php?name=$modname' method='post'>\n";
    $content .= "<td>"._BA_CLTID.": <input type='text' name='login' size='12' maxlength='25'><br>\n";
    $content .= _BA_PASS.": <input type='password' name='pass' size='12' maxlength='10'><br>\n";
    if (extension_loaded("gd") AND ($usegfxcheck == 2 OR $usegfxcheck == 3)) {
        $content .=""._BA_SECCODE.": <img src='?gfx=gfx&random_num=$random_num' border='1' height='20' width='80' alt='"._BA_SECCODE."' title='"._BA_SECCODE."'><br>\n";
        $content .=""._BA_TYPECODE.": <input type='text' NAME='gfx_check' SIZE='10' MAXLENGTH='8'><br>\n";
        $content .="<input type='hidden' name='random_num' value='$random_num'>\n";
    }
    $content .= "<input type='submit' value='".strtoupper(_BA_LOGIN)."'> (<a href='modules.php?name=$modname&amp;op=ClientNew'>"._BA_REGS."</a>)\n";
    $content .= "<input type='hidden' name='op' value='login'></td>\n";
    $content .= "</form></tr>\n";
    $content .= "</table>\n";
}

?>
