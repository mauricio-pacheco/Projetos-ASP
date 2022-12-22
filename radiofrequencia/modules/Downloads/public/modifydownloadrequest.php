<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$lid = intval($lid);
include("header.php");
menu(1);
echo "<br>\n";
title(_REQUESTDOWNLOADMOD);
OpenTable();
if ($dl_config['blockunregmodify'] == 1 && !is_user($user)) {
  echo "<center><b>"._DONLYREGUSERSMODIFY."</b></center>\n";
} else {
  $result = $db->sql_query("SELECT * FROM ".$prefix."_nsngd_downloads WHERE lid=$lid AND active>'0'");
  $lidinfo = $db->sql_fetchrow($result);
  if ($lidinfo['lid'] == "") {
    echo "<center><b>"._INVALIDDOWNLOAD."</b></center>\n";
  } else {
    $lidinfo['title'] = stripslashes($lidinfo['title']);
    $lidinfo['description'] = stripslashes($lidinfo['description']);
    echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
    echo "<form action='modules.php?name=$module_name' method='post'>\n";
    echo "<tr><td bgcolor='$bgcolor2'><b>"._TITLE.":</b></td><td><input type='text' name='title' value='".$lidinfo['title']."' size='50' maxlength='100'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._URL.":</b></td><td><input type='text' name='url' value='' size='50' maxlength='255'><br>("._PATHHIDE.")</td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._DESCRIPTION.":</b></td><td><textarea name='description' cols='60' rows='10'>".$lidinfo['description']."</textarea></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'><b>"._CATEGORY.":</b></td><td><select name='cat'>\n";
    $result2 = $db->sql_query("SELECT * FROM ".$prefix."_nsngd_categories ORDER BY parentid,title");
    while($cidinfo = $db->sql_fetchrow($result2)) {
      if ($cidinfo['cid'] == $lidinfo['cid']) { $sel = "selected"; } else { $sel = ""; }
      if ($cidinfo['parentid'] != 0) $cidinfo['title'] = getparent($cidinfo['parentid'], $cidinfo['title']);
      echo "<option value='".$cidinfo['cid']."' $sel>".$cidinfo['title']."</option>\n";
    }
    echo "</select></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'><b>"._AUTHORNAME.":</b></td><td><input type='text' name='auth_name' value='".$lidinfo['name']."' size='30' maxlength='100'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'><b>"._AUTHOREMAIL.":</b></td><td><input type='text' name='email' value='".$lidinfo['email']."' size='30' maxlength='100'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'><b>"._FILESIZE.":</b></td><td><input type='text' name='filesize' value='".$lidinfo['filesize']."' size='20' maxlength='20'> ("._INBYTES.")</td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'><b>"._VERSION.":</b></td><td><input type='text' name='version' value='".$lidinfo['version']."' size='20' maxlength='20'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'><b>"._HOMEPAGE.":</b></td><td><input type='text' name='homepage' value='".$lidinfo['homepage']."' size='50' maxlength='255'></td></tr>\n";
    echo "<input type='hidden' name='lid' value='$lid'>\n";
    echo "<input type='hidden' name='op' value='modifydownloadrequestS'>\n";
    echo "<tr><td align='center' colspan='2'><input type='submit' value='"._SENDREQUEST."'></td></tr>\n";
    echo "</form>\n</table>\n";
  }
}
CloseTable();
include("footer.php");

?>