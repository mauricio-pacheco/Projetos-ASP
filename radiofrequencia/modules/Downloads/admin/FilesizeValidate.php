<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$pagetitle = _DOWNLOADSADMIN.": "._FILESIZEVALIDATION;
include("header.php");
title($pagetitle);
dladminmain();
echo "<br>\n";
OpenTable();
$cidtitle = str_replace ("_", "", $ttitle);
echo "<table align='center' cellpadding='2' cellspacing='2' border='0' width='80%'>\n";
if ($cid == 0) {
  echo "<tr><td align='center' colspan='3'><b>"._CHECKALLDOWNLOADS."</b><br>"._BEPATIENT."</td></tr>\n";
  $result = $db->sql_query("SELECT * FROM ".$prefix."_nsngd_downloads WHERE active>'0' ORDER BY title");
} else {
  echo "<tr><td align='center' colspan='3'><b>"._VALIDATINGCAT.": $cidtitle</b><br>"._BEPATIENT."</td></tr>\n";
  $result = $db->sql_query("SELECT * FROM ".$prefix."_nsngd_downloads WHERE cid='$cid' AND active>'0' ORDER BY title");
}
echo "<tr bgcolor='$bgcolor2'><td width='70%' valign='bottom'><b>"._FILENAME."</b></td>\n";
echo "<td align='right' width='15%'><b>"._OLDSIZE."<br>"._INBYTES."</b></td>\n";
echo "<td align='right' width='15%'><b>"._NEWSIZE."<br>"._INBYTES."</b></td></tr>\n";
while($dresult = $db->sql_fetchrow($result)) {
  echo "<tr bgcolor='$bgcolor1'><td>".stripslashes($dresult['title'])."</td>\n";
  echo "<td align='right'>".number_format($dresult['filesize'])."</td>\n";
  if (!eregi("http",$dresult['url'])) {
    if (!file_exists($dresult['url'])) {
      echo "<td align='right'>"._FAILED."</td></tr>\n";
      $date = date("M d, Y g:i:a");
      $sub_ip = $_SERVER['REMOTE_ADDR'];
      $db->sql_query("INSERT INTO ".$prefix."_nsngd_mods VALUES (NULL, ".$dresult['lid'].", 0, 0, '', '', '', '"._DSCRIPT."<br>$date', '$sub_ip', 1, '".$dresult['name']."', '".$dresult['email']."', '".$dresult['filesize']."', '".$dresult['version']."', '".$dresult['homepage']."')");
    } else {
      $newsize = filesize($dresult['url']);
      echo "<td align='right'>".number_format($newsize)."</td></tr>\n";
      $db->sql_query("UPDATE ".$prefix."_nsngd_downloads SET filesize='$newsize' WHERE lid='".$dresult['lid']."'");
    }
  } else {
    echo "<td align='right'>"._NOTLOCAL."</td></tr>\n";
  }
}
echo "</table>\n";
echo "<br><center>"._GOBACK."</center>\n";
CloseTable();
include("footer.php");

?>