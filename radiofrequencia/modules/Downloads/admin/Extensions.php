<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$pagetitle = _EXTENSIONSADMIN;
include("header.php");
title($pagetitle);
dladminmain();
echo "<br>";
OpenTable();
$perpage = $dl_config['perpage'];
if (!isset($min)) $min=0;
if (!isset($max)) $max=$min+$perpage;
$totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngd_extensions"));
pagenums_admin($op, $totalselected, $perpage, $max);
echo "<table align='center' cellpadding='2' cellspacing='2' bgcolor='$textcolor1' border='0'>\n";
echo "<tr bgcolor='$bgcolor2'>\n<td><b>"._EXTENSION."</b></td>\n";
echo "<td><b>"._FILETYPE."</b></td>\n";
echo "<td><b>"._IMAGETYPE."</b></td>\n";
echo "<td align='center'><b>"._FUNCTIONS."</b></td>\n</tr>\n";
$x = 0;
$result = $db->sql_query("SELECT * FROM $prefix"._nsngd_extensions." ORDER BY ext,eid LIMIT $min,$perpage");
while($eidinfo = $db->sql_fetchrow($result)) {
  echo "<tr bgcolor='$bgcolor1'><form method='post' action='admin.php'>\n";
  echo "<input type='hidden' name='min' value='$min'>\n";
  echo "<input type='hidden' name='eid' value='".$eidinfo['eid']."'>\n";
  echo "<td>".$eidinfo['ext']."</td>\n";
  if ($eidinfo['file'] == 1) { $ftype = "<b>"._YES."</b>"; } else { $ftype = _NO; }
  echo "<td align='center'>$ftype</td>\n";
  if ($eidinfo['image'] == 1) { $itype = "<b>"._YES."</b>"; } else { $itype = _NO; }
  echo "<td align='center'>$itype</td>\n";
  echo "<td align='center'><select name='op'><option value='ExtensionModify' selected>"._MODIFY."</option>\n";
  echo "<option value='ExtensionDelete'>"._DL_DELETE."</option></select> ";
  echo "<input type='submit' value='"._DL_OK."'></td></tr>\n";
  echo "</form></tr>\n";
  $x++;
}
echo "</table>\n";
pagenums_admin($op, $totalselected, $perpage, $max);
CloseTable();
include("footer.php");

?>