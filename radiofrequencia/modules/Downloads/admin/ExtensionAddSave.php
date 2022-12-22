<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$numrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngd_extensions WHERE ext='$xext'"));
if ($numrows>0) {
  $pagetitle = _EXTENSIONSADMIN.": "._DL_ERROR;
  include("header.php");
  title($pagetitle);
  dladminmain();
  echo "<br>\n";
  OpenTable();
  echo "<center><b>"._ERRORTHEEXTENSION." $xext "._ALREADYEXIST."</b></center><br>\n";
  echo "<center>"._GOBACK."</center>\n";
  CloseTable();
  include("footer.php");
} else {
  $db->sql_query("INSERT INTO ".$prefix."_nsngd_extensions VALUES (NULL, '$xext', '$xfile', '$ximage')");
  Header("Location: admin.php?op=Extensions");
}

?>