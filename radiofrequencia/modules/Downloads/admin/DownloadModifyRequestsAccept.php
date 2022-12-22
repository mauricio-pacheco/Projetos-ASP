<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$result = $db->sql_query("SELECT rid, lid, cid, sid, title, url, description, name, email, filesize, version, homepage FROM ".$prefix."_nsngd_mods WHERE rid='$rid'");
while(list($rid, $lid, $cid, $sid, $title, $url, $description, $aname, $email, $filesize, $version, $homepage) = $db->sql_fetchrow($result)) {
  $title = stripslashes($title);
  $title = addslashes($title);
  $description = stripslashes($description);
  $description = addslashes($description);
  $db->sql_query("UPDATE ".$prefix."_nsngd_downloads SET cid=$cid, sid=$sid, title='$title', url='$url', description='$description', name='$aname', email='$email', filesize='$filesize', version='$version', homepage='$homepage' WHERE lid='$lid'");
  $db->sql_query("DELETE FROM ".$prefix."_nsngd_mods WHERE rid='$rid'");
  $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngd_mods");
}
Header("Location: admin.php?op=DownloadModifyRequests");

?>