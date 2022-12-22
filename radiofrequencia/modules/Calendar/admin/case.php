<?php

/********************************************************/
/* Event Calendar for PHP-Nuke 7.0                      */
/*                                                      */
/* Based on Event Calendar 1.5 by Rob Sutton            */
/* Development & enhancments by Holbrookau and friends  */
/* http://phpnuke.holbrookau.net                        */
/********************************************************/
if ( !defined('ADMIN_FILE') )
{
	die("Illegal File Access");
}
if (!stristr($_SERVER['SCRIPT_NAME'], "admin.php")) { die ("Access Denied"); }
$module_name = "Calendar";

switch($op) {

    case "CalendarAdmin":
    case "CalendarDisplayStory":
    case "CalendarPreviewAgain":
    case "CalendarPostStory":
    case "CalendarEditStory":
    case "CalendarRemoveStory":
    case "CalendarChangeStory":
    case "CalendarDeleteStory":
    case "CalendarConfig":
    include("modules/$module_name/admin/index.php");
    break;

}

?>