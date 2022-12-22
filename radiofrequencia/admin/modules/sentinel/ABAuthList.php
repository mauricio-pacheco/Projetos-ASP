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

if(is_god($admin)) {
  $pagetitle = _AB_NUKESENTINEL.": "._AB_LISTHTTPAUTH;
  include("header.php");
  title($pagetitle);
  OpenMenu();
  ipbanmenu();
  CarryMenu();
  blankmenu();
  CloseMenu();
  echo "<br />\n";
  OpenTable();
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2' width='80%'>\n";
  if($abconfig['http_auth'] == 2){
    echo "<tr bgcolor='$bgcolor1'><td align='center' colspan='5'><b>"._AB_BUILDCGI.": <a href='admin.php?op=ABCGIBuild'>".$abconfig['staccess_path']."</a></b></td></tr>\n";
  }
  echo "<tr bgcolor='$bgcolor2'>\n";
  echo "<td width='30%'>".help_img(_AB_HELP_043)." <b>"._AB_ADMIN."</b></td>\n";
  echo "<td width='25%'><b>"._AB_AUTHLOGIN."</b></td>\n";
  echo "<td width='25%' align='center'><b>"._AB_PASSWORD."</b></td>\n";
  echo "<td width='10%' align='center'><b>"._AB_PROTECTED."</b></td>\n";
  echo "<td width='10%' align='center'><b>"._AB_FUNCTIONS."</b></td>\n";
  echo "</tr>\n";
  $adminresult = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_admins ORDER BY aid");
  while($adminrow = $db->sql_fetchrow($adminresult)) {
    if($adminrow['password'] > "") { $adminrow['password'] = _AB_SET; } else { $adminrow['password'] = _AB_UNSET; }
    if($adminrow['protected']==0) { $adminrow['protected'] = "<i>"._AB_NO."</i>"; } else { $adminrow['protected'] = _AB_YES; }
    echo "<tr onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\" bgcolor='$bgcolor1'>\n";
    echo "<td>".$adminrow['aid']."</td>\n";
    echo "<td>".$adminrow['login']."</td>\n";
    echo "<td align='center'>".$adminrow['password']."</td>\n";
    echo "<td align='center'>".$adminrow['protected']."</td>\n";
    echo "<td align='center'><a href='admin.php?op=";
    if($adminrow['password']==_AB_SET) { echo "ABAuthResend"; } else { echo "ABAuthEdit"; }
    echo "&amp;a_aid=".$adminrow['aid']."'><img src='images/sentinel/resend.png' height='16' width='16' border='0' alt='"._AB_RESEND."' title='"._AB_RESEND."'></a> ";
    echo "<a href='admin.php?op=ABAuthEdit&amp;a_aid=".$adminrow['aid']."'><img src='images/sentinel/edit.png' height='16' width='16' border='0' alt='"._AB_EDIT."' title='"._AB_EDIT."'></a></td>\n";
    echo "</tr>\n";
  }
  echo "</table>\n";
  CloseTable();
  include("footer.php");
} else {
  Header("Location: admin.php?op=ABMain");
}

?>