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
  $aidrow = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_admins WHERE aid='$a_aid'"));
  $subject = _AB_ACCESSFOR." ".$nuke_config['sitename'];
  $message  = ""._AB_HTTPONLY."\n";
  $message .= ""._AB_LOGIN.": ".$aidrow['login']."\n";
  $message .= ""._AB_PASSWORD.": ".$aidrow['password']."\n";
  $message .= ""._AB_PROTECTED.": ";
  if($aidrow['protected']==0) { $message .= ""._AB_NO."\n"; } else { $message .= ""._AB_YES."\n"; }
  list($amail) = $db->sql_fetchrow($db->sql_query("SELECT email FROM ".$prefix."_authors WHERE aid='$a_aid'"));
  @mail($amail, $subject, $message,"From: ".$nuke_config['adminmail']."\r\nX-Mailer: "._AB_NUKESENTINEL."\r\n");
  Header("Location: admin.php?op=ABAuthList");
} else {
  Header("Location: admin.php?op=ABMain");
}

?>