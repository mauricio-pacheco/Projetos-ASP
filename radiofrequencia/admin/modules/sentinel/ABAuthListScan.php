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
  $importad = $db->sql_query("SELECT aid, name, pwd FROM ".$prefix."_authors");
  while(list($a_aid, $a_name, $a_pwd) = $db->sql_fetchrow($importad)) {
    $adminrow = $db->sql_numrows($db->sql_query("SELECT aid FROM ".$prefix."_nsnst_admins WHERE aid='$a_aid'"));
    if($adminrow == 0) {
      if(strtolower($a_name) == "god") { $is_god = 1; } else { $is_god = 0; }
      $result = $db->sql_query("INSERT INTO ".$prefix."_nsnst_admins (aid, login, protected) VALUES ('$a_aid', '$a_aid', '$is_god')");
      $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnst_admins");
    }
  }
  $exportad = $db->sql_query("SELECT aid FROM ".$prefix."_nsnst_admins");
  while(list($a_aid) = $db->sql_fetchrow($exportad)) {
    $adminrow = $db->sql_numrows($db->sql_query("SELECT aid FROM ".$prefix."_authors WHERE aid='$a_aid'"));
    if($adminrow == 0) {
      $result = $db->sql_query("DELETE FROM ".$prefix."_nsnst_admins WHERE aid='$a_aid'");
      $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnst_admins");
    }
  }
}
Header("Location: admin.php?op=ABAuthList");

?>