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

$module_name = basename(dirname(__FILE__));
if (!stristr($_SERVER['PHP_SELF'], "modules.php") AND !stristr($_SERVER['SCRIPT_NAME'], "modules.php")) { header ("Location: ../modules.php?name=$module_name"); }
require_once("mainfile.php");
$index = 1;
$abconfig = abget_configs();
switch ($op) {

  default:
    $pagetitle = _AB_BLOCKEDREFERERS;
    include("header.php");
    title($pagetitle);
    OpenTable();
    $blocker_row = abget_blocker("referer");
    $blockedreferers = explode("\r\n",$blocker_row['list']);
    echo "<table align='center' border='0' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2'>\n";
    echo "<tr bgcolor='$bgcolor2'>\n";
    echo "<td>&nbsp;</td><td align='center'><b>"._AB_BLOCKEDREFERERS." (".count($blockedreferers).")</b></td>\n";
    echo "</tr>\n";
    for ($i=0; $i < count($blockedreferers); $i++) {
      $j = $i + 1;
      echo "<tr bgcolor='$bgcolor1'>\n";
      echo "<td align='right'>&nbsp;$j&nbsp;</td>\n";
      echo "<td>&nbsp;$blockedreferers[$i]&nbsp;</td>\n";
      echo "</tr>\n";
    }
    echo "</table>\n";
    CloseTable();
    include("footer.php");
  break;

}
?>