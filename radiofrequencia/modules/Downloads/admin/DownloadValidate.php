<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

set_time_limit( 600 );
$pagetitle = _DOWNLOADSADMIN.": "._DOWNLOADVALIDATION;
include ("header.php");
title(_DOWNLOADSADMIN.": "._DOWNLOADVALIDATION);
dladminmain();
echo "<br>\n";
OpenTable();
$cidtitle = str_replace ("_", "", $ttitle);
echo "<table align='center' cellpadding='2' cellspacing='2' border='0' width='80%'>\n";
if ($cid == 0) {
  echo "<tr><td align='center' colspan='3'><b>"._CHECKALLDOWNLOADS."</b><br>"._BEPATIENT."</td></tr>\n";
  $result = $db->sql_query("SELECT * FROM ".$prefix."_nsngd_downloads ORDER BY title");
} else {
  echo "<tr><td align='center' colspan='3'><b>"._VALIDATINGCAT.": $cidtitle</b><br>"._BEPATIENT."</td></tr>\n";
  $result = $db->sql_query("SELECT * FROM ".$prefix."_nsngd_downloads WHERE cid='$cid' ORDER BY title");
}
echo "<tr><td bgcolor='$bgcolor2' align='center'><b>"._STATUS."</b></td><td bgcolor='$bgcolor2' width='80%'><b>"._TITLE."</b></td><td bgcolor='$bgcolor2' align='center'><b>"._FUNCTIONS."</b></td></tr>\n";
while($lidinfo = $db->sql_fetchrow($result)) {
  if (!eregi("http://", $lidinfo['url']) AND !eregi("ftp://", $lidinfo['url'])) { $lidinfo['url'] = $nukeurl."/".$lidinfo['url']; }
  if (!@file($lidinfo['url'])){
    echo "<tr><td align='center' bgcolor='$bgcolor2'><b>&nbsp;&nbsp;"._FAILED."&nbsp;&nbsp;</b></td>\n";
    echo "<td>&nbsp;&nbsp;<a href='".$lidinfo['url']."' target='new'>".$lidinfo['title']."</a>&nbsp;&nbsp;</td>\n";
    echo "<td align='center'>&nbsp;&nbsp;[ <a href='admin.php?op=DownloadModify&amp;lid=".$lidinfo['lid']."'>"._DL_EDIT."</a>";
    echo " | <a href='admin.php?op=DownloadDelete&amp;lid=".$lidinfo['lid']."'>"._DL_DELETE."</a> ]&nbsp;&nbsp;</font></td></tr>\n";
    $date = date("M d, Y g:i:a");
    $sub_ip = $_SERVER['REMOTE_ADDR'];
    $db->sql_query("INSERT INTO ".$prefix."_nsngd_mods VALUES (NULL, ".$lidinfo['lid'].", 0, 0, '', '', '', '"._DSCRIPT."<br>$date', '$sub_ip', 1, '".$lidinfo['name']."', '".$lidinfo['email']."', '".$lidinfo['filesize']."', '".$lidinfo['version']."', '".$lidinfo['homepage']."')");
  } else {
    echo "<tr><td align='center'>&nbsp;&nbsp;"._OK."&nbsp;&nbsp;</td>\n";
    echo "<td>&nbsp;&nbsp;<a href='".$lidinfo['url']."' target='new'>".$lidinfo['title']."</a>&nbsp;&nbsp;</td>\n";
    echo "<td align='center'>&nbsp;&nbsp;"._DL_NONE."&nbsp;&nbsp;</td></tr>\n";
  }
}
echo "<tr><td align='center' colspan='3'>"._GOBACK."</td></tr>\n";
echo "</table>\n";
CloseTable();
include ("footer.php");

?>