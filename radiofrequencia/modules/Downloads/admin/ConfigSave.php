<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

gdsave_config("admperpage",$xadmperpage);
gdsave_config("blockunregmodify",$xblockunregmodify);
gdsave_config("dateformat",$xdateformat);
gdsave_config("mostpopular",$xmostpopular);
gdsave_config("mostpopulartrig",$xmostpopulartrig);
gdsave_config("perpage",$xperpage);
gdsave_config("popular",$xpopular);
gdsave_config("results",$xresults);
gdsave_config("show_download",$xshow_download);
gdsave_config("show_links_num",$xshow_links_num);
gdsave_config("usegfxcheck",$xusegfxcheck);
Header("Location: admin.php?op=DLConfig");

?>