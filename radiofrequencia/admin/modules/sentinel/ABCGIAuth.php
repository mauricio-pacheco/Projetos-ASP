<?php

/********************************************************/
/* HTTP Authentication Using PHP CGI and Apache         */
/* CGIAdminAuth.php                                     */
/* By: Raven PHP Scripts                                */
/* http://www.ravenphpscripts.com                       */
/* Copyright © 2004 by Raven PHP Scripts                */
/********************************************************/

$pagetitle = _AB_NUKESENTINEL.": "._AB_CGIAUTHSETUP;
include("header.php");
title($pagetitle);
OpenTable();
$rp = strtolower(str_replace('index.php', '', realpath('index.php')));
$staccess = str_replace($rp, "", $abconfig['staccess_path']);
echo "<table align='center' border='0' cellpadding='2' cellspacing='2'><tr><td>\n";
echo _AB_SAVEIN." <b>".$abconfig['htaccess_path']." :</b><br /><br />\n";
echo "<b><code># -------------------------------------------<br />\n";
echo "# Start of NukeSentinel(tm) admin.php Auth<br />\n";
echo "# -------------------------------------------<br />\n";
echo "&lt;Files $staccess&gt;<br />\n";
echo "  deny from all<br />\n";
echo "&lt;/Files&gt;<br />\n";
echo "<br />\n";
echo "&lt;Files admin.php&gt;<br />\n";
echo "   &lt;Limit GET POST PUT&gt;<br />\n";
echo "require valid-user<br />\n";
echo "   &lt;/Limit&gt;<br />\n";
echo "   AuthName \"Restricted by NukeSentinel(tm)\"<br />\n";
echo "   AuthType Basic<br />\n";
echo "   AuthUserFile ".$abconfig['staccess_path']."<br />\n";
echo "&lt;/Files&gt;<br />\n";
echo "# -------------------------------------------<br />\n";
echo "# End of NukeSentinel(tm) admin.php Auth<br />\n";
echo "# -------------------------------------------</code></b>\n";
echo "</td></tr></table>\n";
CloseTable();
include("footer.php");

?>