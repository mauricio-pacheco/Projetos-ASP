<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

if (!isset($min)) { $min = 0; }
$title = stripslashes(FixQuotes($title));
$url = stripslashes(FixQuotes($url));
$description = stripslashes(FixQuotes($description));
$name = stripslashes(FixQuotes($name));
$email = stripslashes(FixQuotes($email));
$db->sql_query("UPDATE ".$prefix."_nsngd_downloads SET cid='$cat', sid='$perm', title='$title', url='$url', description='$description', name='$rname', email='$email', hits='$hits', filesize='$filesize', version='$version', homepage='$homepage' WHERE lid='$lid'");
Header("Location: admin.php?op=Downloads&min=$min");

?>