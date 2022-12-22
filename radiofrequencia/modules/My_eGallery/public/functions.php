<?php
function format_filesize($size) {
	if($size < 1024) {
		return number_format($size,0).' bytes';
	}
	elseif($size < 1024 * 1024) {
		return number_format(($size / 1024),0).' KB';
	}
	elseif($size < 1024 * 1024 * 1024) {
		return number_format(($size / (1024 * 1024)),0).' MB';
	}
	elseif($size < 1024 * 1024 * 1024 * 1024) {
		return number_format(($size / (1024 * 1024 * 1024)),0).' GB';
	}
}
?>