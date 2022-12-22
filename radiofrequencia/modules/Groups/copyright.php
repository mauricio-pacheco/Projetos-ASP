<?php

/********************************************************/
/* NukeScripts Network (webmaster@nukescripts.net)      */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$module_name = basename(dirname(__FILE__));
$mod_name = "NSN Groups Universal";
$author_email = "";
$author_homepage = "http://www.nukescripts.net";
$author_name = "<a href=\"$author_homepage\">NukeScripts Network</a>";
$license = "All Modifications - Copyright &copy; 2000-2004 NukeScripts Network";
$download_location = "";
$module_version = "";
$release_date = "";
$module_description = "";
$mod_cost = "";

function show_copyright() {
    global $mod_cost, $mod_name, $module_name, $release_date, $author_name, $author_email, $author_homepage, $license, $download_location, $module_version, $module_description;
    if ($mod_name == "") { $mod_name = eregi_replace("_", " ", $module_name); }
    echo "<html>\n";
    echo "<head><title>$mod_name: Copyright Information</title></head>\n";
    echo "<body bgcolor=\"#FFFFFF\" link=\"#000000\" alink=\"#000000\" vlink=\"#000000\">\n";
    echo "<center><font size=\"2\" face=\"Arial, Helvetica\"><b>Module Copyright &copy; Information</b><br>";
    echo "$mod_name module for <a href=\"http://nsnnuke.org\" target=\"new\">NSN-Nuke</a><br>[<a href=\"javascript:void(0)\" onClick=javascript:self.close()>Close Window</a>]</font></td>\n";
    echo "</center>\n<hr>\n";
    echo "<font size=\"2\" face=\"Arial, Helvetica\">";
    echo "<img src=\"images/arrow.gif\" border=\"0\">&nbsp;<b>Module's Name:</b> $mod_name<br>\n";
    if ($module_version != "") { echo "<img src=\"images/arrow.gif\" border=\"0\">&nbsp;<b>Module's Version:</b> $module_version<br>\n"; }
    if ($release_date != "") { echo "<img src=\"images/arrow.gif\" border=\"0\">&nbsp;<b>Release Date:</b> $release_date<br>\n"; }
    if ($mod_cost != "") { echo "<img src=\"images/arrow.gif\" border=\"0\">&nbsp;<b>Module's Cost:</b> $mod_cost<br>\n"; }
    if ($license != "") { echo "<img src=\"images/arrow.gif\" border=\"0\">&nbsp;<b>License:</b> $license<br>\n"; }
    if ($author_name != "") { echo "<img src=\"images/arrow.gif\" border=\"0\">&nbsp;<b>Author's Name:</b> $author_name<br>\n"; }
    if ($author_email != "") { echo "<img src=\"images/arrow.gif\" border=\"0\">&nbsp;<b>Author's Email:</b> $author_email<br>\n"; }
    if ($module_description != "") { echo "<img src=\"images/arrow.gif\" border=\"0\">&nbsp;<b>Module's Description:</b> $module_description<br>\n"; }
    if ($download_location != "") { echo "<img src=\"images/arrow.gif\" border=\"0\">&nbsp;<b>Module's Download:</b> <a href=\"$download_location\" target=\"new\">Download</a><br>\n"; }
    echo "<hr>\n";
    echo "</font>\n";
    echo "</body>\n";
    echo "</html>";
}

show_copyright();

?>