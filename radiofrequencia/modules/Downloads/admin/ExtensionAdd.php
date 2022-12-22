<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$pagetitle = _EXTENSIONSADMIN.": "._ADDEXTENSION;
include ("header.php");
title(_EXTENSIONSADMIN);
dladminmain();
echo "<br>\n";
OpenTable();
echo "<table align='center' cellpadding='2' cellspacing='2' border='0'>\n";
echo "<form action='admin.php' method='post'>\n";
echo "<tr><td align='center' colspan='2'><b>"._ADDEXTENSION."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>"._EXTENSION.":</td><td><input type='text' name='xext' size='10' maxlength='6'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>"._FILETYPE.":</td><td><select name='xfile'>\n";
echo "<option value='0' selected>"._DL_NO."</option>\n";
echo "<option value='1'>"._DL_YES."</option>\n";
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>"._IMAGETYPE.":</td><td><select name='ximage'>\n";
echo "<option value='0' selected>"._DL_NO."</option>\n";
echo "<option value='1'>"._DL_YES."</option>\n";
echo "</select></td></tr>\n";
echo "<input type='hidden' name='op' value='ExtensionAddSave'>\n";
echo "<tr><td align='center' colspan='2'><input type='submit' value='"._ADDEXTENSION."'></td></tr></form>\n";
echo "</table>\n";
CloseTable();
include("footer.php");

?>