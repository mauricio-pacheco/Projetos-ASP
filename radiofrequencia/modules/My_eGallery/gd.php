<?php

if ( !eregi("modules.php", $_SERVER['SCRIPT_NAME']) ){
    die ("You can't access this file directly...");
}
$ModName = $name;

if(!isset($mainfile)){
	include("mainfile.php");
}

include("modules/$ModName/include-public.inc");

global $galleryvar;
	//test gd version info
	if (extension_loaded('gd')) {
		if ($galleryvar['GDVersion2']== "1") {
			$im = @imagecreatetruecolor(150, 42) or die ("Cannot Initialize new GD image stream");
			$text = "2.x";
		} else {
			$im = @imagecreate(150, 42) or die ("Cannot Initialize new GD image stream");
			$text = "1.x";
		}

    		$background_color = imagecolorallocate ($im, 0, 0, 0);
    		$foreground_color = imagecolorallocate ($im, 255, 255, 255);
    		$text_color = imagecolorallocate ($im, 0, 0, 224);
    		imagestring ($im, 5, 12, 5, "Used GD Version", $text_color);
		imagestring ($im, 5, 55, 22, "$text", $text_color);

    		header ("Content-type: image/jpeg");
    		imagejpeg($im);
    		imagedestroy($im);
	}

?>
