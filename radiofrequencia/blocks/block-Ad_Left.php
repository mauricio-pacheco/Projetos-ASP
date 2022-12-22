<?php

/********************************************************/
/* NSN Banner Ads                                       */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/

if (stristr($_SERVER['PHP_SELF'], "block-Ad_Left.php") || stristr($_SERVER['SCRIPT_NAME'], "block-Ad_Left.php")) { Header("Location: index.php"); }
$content = "";
global $nukeurl, $client, $cookie2, $prefix, $db, $anonymous;
include("includes/banners3.php");
$content = "<center>$tbanners3</center>";

?>
