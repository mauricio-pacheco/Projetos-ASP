<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$pagetitle = _DOWNLOADSADMIN;
include ("header.php");
title($pagetitle);
dladminmain();
echo "<br>\n";
OpenTable();
$perpage = $dl_config['perpage'];
if (!isset($min)) $min=0;
if (!isset($max)) $max=$min+$perpage;
$totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngd_downloads"));
pagenums_admin($op, $totalselected, $perpage, $max);
echo "<table align='center' cellpadding='2' cellspacing='2' bgcolor='$textcolor1' border='0'>\n";
echo "<tr bgcolor='$bgcolor2'>\n<td><b>"._TITLE."</b></td>\n<td align='right'><b>"._FILESIZE."</b></td>\n";
echo "<td align='center'><b>"._ADDED."</b></td>\n<td align='center'><b>"._FUNCTIONS."</b></td>\n</tr>\n";
$x = 0;
$result = $db->sql_query("SELECT * FROM $prefix"._nsngd_downloads." ORDER BY title LIMIT $min,$perpage");
while($lidinfo = $db->sql_fetchrow($result)) {
  echo "<tr bgcolor='$bgcolor1'><form method='post' action='admin.php'>\n";
  echo "<input type='hidden' name='min' value='$min'>\n";
  echo "<input type='hidden' name='lid' value='".$lidinfo['lid']."'>\n";
  echo "<td>".$lidinfo['title']."</td>\n";
  echo "<td align='right'>".CoolSize($lidinfo['filesize'])."</td>\n";
  echo "<td align='center'>".CoolDate($lidinfo['date'])."</td>\n";
  echo "<td align='center'><select name='op'><option value='DownloadModify' selected>"._MODIFY."</option>\n";
  if ($lidinfo['active'] ==1) {
    echo "<option value='DownloadDeactivate'>"._DL_DEACTIVATE."</option>\n";
  } else {
    echo "<option value='DownloadActivate'>"._DL_ACTIVATE."</option>\n";
  }
  echo "<option value='DownloadDelete'>"._DL_DELETE."</option></select> ";
  echo "<input type='submit' value='"._DL_OK."'></td></tr>\n";
  echo "</form></tr>\n";
  $x++;
}
echo "</table>\n";
pagenums_admin($op, $totalselected, $perpage, $max);
CloseTable();
include ("footer.php");

?>