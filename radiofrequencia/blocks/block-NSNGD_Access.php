<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

if (eregi("block-NSNGD_Access.php",$PHP_SELF)) {
    Header("Location: ../index.php");
    die();
}
$modname = "Downloads";
get_lang($modname);

global $prefix, $user_prefix, $db;
$content .= "<img src='images/blocks/uploads.png' height='16' width='16'> <b>"._DL_UP.":</b><br>\n";
$result = $db->sql_query("SELECT username, uploads FROM ".$prefix."_nsngd_accesses WHERE uploads>0 ORDER BY uploads DESC LIMIT 0,5");
$a = 1;
while(list($uname, $uloads) = $db->sql_fetchrow($result)) {
    $content .= "<strong><big>&middot;</big></strong>&nbsp;$a: <a href='modules.php?name=Your_Account&amp;op=userinfo&amp;username=$uname'>$uname</a> ($uloads) "._DL_FILES."<br>";
    $a++;
}
$content .= "<hr>\n";
$content .= "<img src='images/blocks/downloads.png' height='16' width='16'> <b>"._DL_DN.":</b><br>\n";
$result = $db->sql_query("SELECT username, downloads FROM ".$prefix."_nsngd_accesses WHERE downloads>0 ORDER BY downloads DESC LIMIT 0,5");
$a = 1;
while(list($uname, $dloads) = sql_fetch_row($result, $dbi)) {
    $unum = $db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE username='$uname'"));
    if ($unum==0) { $uname = "Anonymous"; }
    $content .= "<strong><big>&middot;</big></strong>&nbsp;$a: <a href='modules.php?name=Your_Account&amp;op=userinfo&amp;username=$uname'>$uname</a> ($dloads) "._DL_FILES."<br>";
    $a++;
}
$content .= "<hr>\n";
$result = $db->sql_query("select hits from ".$prefix."_nsngd_downloads WHERE active='1'");
$totdld = $db->sql_numrows($result);
while(list($hits) = sql_fetch_row($result, $dbi)) {
    $total_hits = $total_hits + $hits;
}
$content .= "<img src='images/blocks/totals.png' height='16' width='16'> <b>"._DL_TDN.":</b><br>\n";
$content .= "$totdld "._DL_FILESDL." $total_hits "._DL_TIMES."<br>";
?>
