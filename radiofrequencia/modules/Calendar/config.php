<?php

/********************************************************/
/* Event Calendar for PHP-Nuke 7.0                      */
/*                                                      */
/* Based on Event Calendar 1.5 by Rob Sutton            */
/* Development & enhancments by Holbrookau and friends  */
/* http://phpnuke.holbrookau.net                        */
/********************************************************/
/********************************************************/
if (eregi("config.php", $_SERVER['PHP_SELF'])) {
    die ("You can't access this file directly...");
}
// START COMMENTS

include ("modules/Calendar/configset.php");
// Insert new config variables here:

if(!IsSet($mainfile)) { include ("mainfile.php"); }
if (isset($newlang)) {
	include("modules/$module_name/language/lang-$newlang.php");
	$language = $newlang;
} elseif (isset($lang)) {
    include("modules/$module_name/language/lang-$lang.php");
    $language = $lang;
} else {
    include("modules/$module_name/language/lang-$language.php");
}

?>