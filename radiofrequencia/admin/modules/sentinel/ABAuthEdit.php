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
  $pagetitle = _AB_NUKESENTINEL.": "._AB_EDITADMINS;
  include("header.php");
  $sapi_name = strtolower(php_sapi_name());
  title($pagetitle);
  OpenMenu();
  ipbanmenu();
  CarryMenu();
  blankmenu();
  CloseMenu();
  echo "<br />\n";
  OpenTable();
  $admin_row = abget_admin($a_aid);
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
  echo "<form action='admin.php' method='post'>\n";
  echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_ADMIN.":</b></td><td><b>$a_aid</b></td></tr>\n";
  echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_AUTHLOGIN.":</b></td>";
  echo "<td><input type='text' name='xlogin' size='20' maxlength='25' value='".$admin_row['login']."'></td></tr>\n";
  echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_PASSWORD.":</b></td>";
  echo "<td><input type='text' name='xpassword' size='20' maxlength='20' value='".$admin_row['password']."'></td></tr>\n";
  echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_PROTECTED.":</b></td>";
  if ($admin_row['protected']==0) { $sel1 = " selected"; } else { $sel2 = " selected"; }
  echo "<td><select name='xprotected'>\n";
  echo "<option value='0'$sel1>"._AB_NOTPROTECTED."</option>\n<option value='1'$sel2>"._AB_ISPROTECTED."</option>\n";
  echo "</td></tr>\n";
  echo "<input type='hidden' name='op' value='ABAuthEditSave'>\n";
  echo "<input type='hidden' name='a_aid' value='$a_aid'>\n";
  echo "<tr><td align='center' colspan='2'><input type=submit value='"._AB_SAVECHANGES."'></td></tr>\n";
  echo "</form></table>\n";
  CloseTable();
  include("footer.php");
} else {
  Header("Location: admin.php?op=ABMain");
}

?>