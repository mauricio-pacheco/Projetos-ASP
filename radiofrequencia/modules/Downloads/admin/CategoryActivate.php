<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$crawler = array($cid);
CrawlLevelR($cid);
$x=0;
while ($x <= (sizeof($crawler)-1)) {
  $db->sql_query("UPDATE ".$prefix."_nsngd_categories SET active='1' WHERE cid='$crawler[$x]'");
  $db->sql_query("UPDATE ".$prefix."_nsngd_downloads SET active='1' WHERE cid='$crawler[$x]'");
  $x++;
}
//$db->sql_query("UPDATE ".$prefix."_nsngd_downloads SET active='1' WHERE lid='$lid'");
Header("Location: admin.php?op=Categories&min=$min");

?>