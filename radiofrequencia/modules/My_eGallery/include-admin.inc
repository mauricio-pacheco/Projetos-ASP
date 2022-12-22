<?php

include("modules/$ModName/functions.inc");
$adminpath = "admin/modules/gallery";
$font['title'] = "title";
$font['normal'] = "content";
$font['tiny'] = "tiny";

include("admin/modules/gallery/config.php");
include("modules/$ModName/Version.php");

modules_get_language("global");
modules_get_language("admin");

?>