<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$crawled = array($cid);
CrawlLevel($cid);
$x=0;
while ($x <= (sizeof($crawled)-1)) {
  $db->sql_query("DELETE FROM ".$prefix."_nsngd_categories WHERE cid='$crawled[$x]'");
  $db->sql_query("DELETE FROM ".$prefix."_nsngd_downloads WHERE cid='$crawled[$x]'");
  $x++;
}
$db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngd_categories");
$db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngd_downloads");
Header("Location: admin.php?op=Categories");

?>