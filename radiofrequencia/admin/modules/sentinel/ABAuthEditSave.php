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
  $subject = _AB_ACCESSCHANGEDON." ".$nuke_config['sitename'];
  $message  = ""._AB_HTTPONLY."\n";
  $message .= ""._AB_LOGIN.": $xlogin\n";
  $message .= ""._AB_PASSWORD.": $xpassword\n";
  $message .= ""._AB_PROTECTED.": ";
  if($xprotected==0) { $message .= ""._AB_NO."\n"; } else { $message .= ""._AB_YES."\n"; }
  $xpassword_md5 = md5($xpassword);
  $xpassword_crypt = crypt($xpassword);
  $db->sql_query("UPDATE ".$prefix."_nsnst_admins SET login='$xlogin', password='$xpassword', password_md5='$xpassword_md5', password_crypt='$xpassword_crypt', protected='$xprotected' WHERE aid='$a_aid'");
  list($amail) = $db->sql_fetchrow($db->sql_query("SELECT email FROM ".$prefix."_authors WHERE aid='$a_aid'"));
  @mail($amail, $subject, $message,"From: ".$nuke_config['adminmail']."\r\nX-Mailer: "._AB_NUKESENTINEL."\r\n");
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