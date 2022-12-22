<?php

/********************************************************/
/* NukeSentinel(tm) Universal                           */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/
/* CLIKE, UNION, & Email elements from HackAlert        */
/* HTTPAuth element                                     */
/* By: Raven PHP Scripts                                */
/* http://www.ravenphpscripts.com                       */
/* Copyright © 2004 by Raven PHP Scripts                */
/********************************************************/
/* Scripting Blocker elements                           */
/* By: ChatServ                                         */
/* http://www.nukeresources.com                         */
/* Copyright © 2004 by Nuke Resources                   */
/********************************************************/

if(is_god($admin)) {
  if($abconfig['http_auth'] == 2 AND $abconfig['staccess_path'] > "") {
    $stwrite = "";
    $adminresult = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_admins WHERE password_crypt>'' ORDER BY aid");
    while($adminrow = $db->sql_fetchrow($adminresult)) {
      $stwrite .= $adminrow['aid'].":".$adminrow['password_crypt']."\n";
      $doit = fopen($abconfig['staccess_path'], "w");
      fwrite($doit, $stwrite);
      fclose($doit);
    }
  }
  Header("Location: admin.php?op=ABAuthList");
} else {
  Header("Location: admin.php?op=ABMain");
}

?>