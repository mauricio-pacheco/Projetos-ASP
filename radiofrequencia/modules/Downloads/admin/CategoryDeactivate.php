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
  $db->sql_query("UPDATE ".$prefix."_nsngd_categories SET active='0' WHERE cid='$crawled[$x]'");
  $db->sql_query("UPDATE ".$prefix."_nsngd_downloads SET active='0' WHERE cid='$crawled[$x]'");
  $x++;
}
Header("Location: admin.php?op=Categories&min=$min");

?>