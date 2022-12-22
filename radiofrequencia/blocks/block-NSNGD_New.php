<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

if (eregi("block-NSNGD_New.php", $_SERVER['PHP_SELF'])) {
    Header("Location: ../index.php");
    die();
}
global $prefix, $db;
$blkh = 20; // Number of lines high
$blkw = 20; // Number of characters wide 0 = unused
$scron = 0; // Turn scrolling on by setting to 1
$scrdr = up; // Scroll direction (up, down, left, or right)
$scrhg = 400; // Scroller height in pixels
$scrwd = 200; // Scroller width in pixels
$a = 1;
if ($scron == 1) {
    $content .= "<marquee behavior='scroll' direction='$scrdr' height='$scrhg' width='$scrwd' scrollamount='2' scrolldelay='100' onMouseOver='this.stop()' onMouseOut='this.start()'><br>";
}
$result = $db->sql_query("select lid, title from $prefix"._nsngd_downloads." order by date DESC limit 0,$blkh");
while(list($lid, $title) = $db->sql_fetchrow($result)) {
    $title2 = ereg_replace("_", " ", $title);
    $title = strtr($title, " ()", "_[]");
    if ($blkw > 0) { if (strlen($title2) > $blkw) { $title2 = substr($title2, 0, $blkw); } }
    if ($a < 10) { $content .= "0$a: "; } else { $content .= "$a: "; }
    $content .= "<a href='modules.php?name=Downloads&amp;op=getit&amp;lid=$lid'>$title2</a><br>";
    $a++;
}
if ($scron == 1) {
	$content .= "</marquee>";
}

?>