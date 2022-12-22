<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$pagetitle = _NEWDOWNLOADS;
include("header.php");
menu(1);
echo "<br>";
title(_NEWDOWNLOADS);
OpenTable();
$counter = 0;
$allweekdownloads = 0;
while ($counter <= 7-1){
  $newdownloaddayRaw = (time()-(86400 * $counter));
  $newdownloadDB = Date("Y-m-d", $newdownloaddayRaw);
  $totaldownloads = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngd_downloads WHERE date LIKE '%$newdownloadDB%' AND active>'0'"));
  $counter++;
  $allweekdownloads = $allweekdownloads + $totaldownloads;
}
$counter = 0;
$allmonthdownloads = 0;
while ($counter <=30-1){
  $newdownloaddayRaw = (time()-(86400 * $counter));
  $newdownloadDB = Date("Y-m-d", $newdownloaddayRaw);
  $totaldownloads = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngd_downloads WHERE date LIKE '%$newdownloadDB%' AND active>'0'"));
  $allmonthdownloads = $allmonthdownloads + $totaldownloads;
  $counter++;
}
echo "<center><b>"._TOTALNEWDOWNLOADS.":</b> "._LASTWEEK." - $allweekdownloads \ "._LAST30DAYS." - $allmonthdownloads<br>\n";
echo ""._SHOW.": <a href='modules.php?name=$module_name&amp;op=NewDownloads&amp;newdownloadshowdays=7'>"._1WEEK."</a> - <a href='modules.php?name=$module_name&amp;op=NewDownloads&amp;newdownloadshowdays=14'>"._2WEEKS."</a> - <a href='modules.php?name=$module_name&amp;op=NewDownloads&amp;newdownloadshowdays=30'>"._30DAYS."</a>\n";
echo "</center><br>\n";
if (!isset($newdownloadshowdays)) { $newdownloadshowdays = 7; }
echo "<br><center><b>"._DTOTALFORLAST." $newdownloadshowdays "._DAYS.":</b><br><br>\n";
$counter = 0;
$allweekdownloads = 0;
while ($counter <= $newdownloadshowdays-1) {
  $newdownloaddayRaw = (time()-(86400 * $counter));
  $newdownloadDB = Date("Y-m-d", $newdownloaddayRaw);
  $totaldownloads = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngd_downloads WHERE date LIKE '%$newdownloadDB%' AND active>'0'"));
  $counter++;
  $allweekdownloads = $allweekdownloads + $totaldownloads;
  echo "<strong><big>&middot;</big></strong> <a href='modules.php?name=$module_name&amp;op=NewDownloadsDate&amp;selectdate=$newdownloaddayRaw'>$newdownloadDB</a>&nbsp($totaldownloads)<br>\n";
}
$counter = 0;
$allmonthdownloads = 0;
echo "</center>\n";
CloseTable();
include("footer.php");

?>