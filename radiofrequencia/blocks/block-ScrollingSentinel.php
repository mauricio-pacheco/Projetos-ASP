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

if (stristr($_SERVER['PHP_SELF'], "block-ScrollingSentinel.php") OR stristr($_SERVER['SCRIPT_NAME'], "block-ScrollingSentinel.php")) {
    Header("Location: ../index.php");
    die();
}
global $prefix, $db, $user, $admin, $ab_config;
$usemarquee = 1;
$scrolldirection = "Down";
$content = "";
$content .= "<table border=1><tr><td ALIGN=\"center\" VALIGN=\"top\"> This is the list of Sentinel banned IP addresses. </td></tr></table><hr>\n";
$content .= "<Marquee Behavior=\"Scroll\" Direction=\"$scrolldirection\" Height=\"150\" ScrollAmount=\"1\" ScrollDelay=\"75\" onMouseOver=\"this.stop()\" onMouseOut=\"this.start()\"><br>";
$result = $db->sql_query("SELECT ip_addr, reason FROM $prefix"._nsnst_blocked_ips." ORDER BY date DESC LIMIT 30");
while (list($ip_addr, $ip_reason) = $db->sql_fetchrow($result)) {
  if((is_admin($admin) AND $ab_config['display_link']==1) OR ((is_user($user) OR is_admin($admin)) AND $ab_config['display_link']==2) OR $ab_config['display_link']==3) {
    $lookupip = str_replace("*", "0", $ip_addr);
    $content .= "<b><big>&middot;</big></b>&nbsp;<a href=\"".$ab_config['lookup_link']."$lookupip\" target=\"_blank\">$ip_addr</a>\n";
  } else {
    $content .= "<b><big>&middot;</big></b>&nbsp;$ip_addr\n";
  }
  if((is_admin($admin) AND $ab_config['display_reason']==1) OR ((is_user($user) OR is_admin($admin)) AND $ab_config['display_reason']==2) OR $ab_config['display_reason']==3) {
    $result2 = $db->sql_query("SELECT reason FROM $prefix"._nsnst_blockers." WHERE blocker='$ip_reason'");
    list($reason) = $db->sql_fetchrow($result2);
    $reason = str_replace("Abuse-","",$reason);
    $content .= "&nbsp;-&nbsp;$reason\n";
  }
  $content .= "<br />\n";
}
$content .= "</Marquee><br>";
$content .= "<hr><center><a href=\"http://www.nukescripts.net\" target=\"_blank\">"._AB_NUKESENTINEL." ".$ab_config['version_number']."</a></center>\n";

?>
