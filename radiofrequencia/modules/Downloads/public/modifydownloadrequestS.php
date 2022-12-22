<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$lid = intval($lid);
$cat = intval($cat);
$filesize = intval($filesize);
if(is_user($user)) {
  cookiedecode($user);
  $ratinguser = $cookie[1];
} else {
  $ratinguser = $anonymous;
}
if ($dl_config['blockunregmodify'] == 1 && !is_user($user)) {
  include("header.php");
  menu(1);
  echo "<br>\n";
  OpenTable();
  echo "<center><font class='content'>"._DONLYREGUSERSMODIFY."</font></center>\n";
  CloseTable();
  include("footer.php");
} else {
  $title = stripslashes(FixQuotes($title));
  $url = stripslashes(FixQuotes($url));
  $description = stripslashes(FixQuotes($description));
  $sub_ip = $_SERVER['REMOTE_ADDR'];
  $db->sql_query("INSERT INTO ".$prefix."_nsngd_mods VALUES (NULL, $lid, $cat, 0, '$title', '$url', '$description', '$ratinguser', '$sub_ip', 0, '$auth_name', '$email', '$filesize', '$version', '$homepage')");
  include("header.php");
  menu(1);
  echo "<br>\n";
  OpenTable();
  echo "<center><font class='content'>"._THANKSFORINFO." "._LOOKTOREQUEST."</font></center>\n";
  CloseTable();
  include("footer.php");
}

?>