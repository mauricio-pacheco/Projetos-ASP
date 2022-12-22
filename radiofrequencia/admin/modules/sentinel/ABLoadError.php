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

$pagetitle = "NukeSentinel(tm): Error Loading Functions";
include("header.php");
title($pagetitle);
OpenTable();
echo "It appears that NukeSentinel(tm) has not been configured correctly.  The 
most common cause is that you either have an error in the syntax that is 
including includes/sentinel.php from your mainfile.php, or you have not 
added the NukeSentinel(tm) code to your mainfile.php.  This code must be placed 
immediately after the opening &lt;? tag in mainfile.php.  So your first 7 
lines in mainfile.php <b>must look like this</b>:<br /><br /><code>&lt;?php<br />if 
(\$forum_admin == 1) {<br />&nbsp;&nbsp;include(\"../../../includes/sentinel.php\");<br />} elseif (\$inside_mod 
== 1) {<br />&nbsp;&nbsp;include(\"../../includes/sentinel.php\");<br />} else {<br 
/>&nbsp;&nbsp;include(\"includes/sentinel.php\");<br />}</code>";
CloseTable();
include("footer.php");

?>