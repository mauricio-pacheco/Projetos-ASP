<?php
function RatioResizeImg($src_file, $dest_file, $gid) {
	global $gallerypath, $galleryvar, $prefix, $db	;

	list($newWidth) = $db->sql_fetchrow($db->sql_query("SELECT thumbwidth from $prefix"._gallery_categories." WHERE gallid=$gid"));
	if (intval($newWidth) == 0 ) {
	    return $src_file;
	}
	
	switch($galleryvar['imageSoftware']) {
		case 'GD': return RatioResizeImgGD($src_file, $dest_file, $newWidth); break;
		case 'ImageMagick': return RatioResizeImgImageMagick($src_file, $dest_file, $newWidth); break;
		case 'none': return $src_file; break;
		case 'browser': return 'browser'; break;
		case 'NetPBM': return RatioResizeImgNetPBM($src_file, $dest_file, $newWidth); break;
		default: return $src_file; break;
	}
}

function RatioResizeIcon($src_file, $dest_file, $gid) {
	global $gallerypath, $galleryvar, $prefix, $db	;

	$newWidth = $galleryvar['SubCatIconwidth'];
	if (intval($newWidth) == 0 ) {
	    return $src_file;
	}
	
	switch($galleryvar['imageSoftware']) {
		case 'GD': return RatioResizeImgGD($src_file, $dest_file, $newWidth); break;
		case 'ImageMagick': return RatioResizeImgImageMagick($src_file, $dest_file, $newWidth); break;
		case 'none': return $src_file; break;
		case 'browser': return 'browser'; break;
		case 'NetPBM': return RatioResizeImgNetPBM($src_file, $dest_file, $newWidth); break;
		default: return $src_file; break;
	}
}


// GD Library
function RatioResizeImgGD($src_file, $dest_file, $newWidth) {
	global $gallerypath, $galleryvar;

	// find the image size & type
	if(!function_exists('imagecreate')){return $src_file;}

	$imginfo = @getimagesize($src_file);
	switch($imginfo[2]) {
		case 1: $type = IMG_GIF; break;
		case 2: $type = IMG_JPG; break;
		case 3: $type = IMG_PNG; break;
		case 4: $type = IMG_WBMP; break;
		default: return $src_file; break;
	}

	switch($type) {
		case IMG_GIF:
			if(!function_exists('imagecreatefromgif')){return $src_file;}
			$srcImage = @imagecreatefromgif("$src_file");
			break;
		case IMG_JPG:
			if(!function_exists('imagecreatefromjpeg')){return $src_file;}
			$srcImage = @ImageCreateFromJpeg($src_file);
			break;
		case IMG_PNG:
			if(!function_exists('imagecreatefrompng')){return $src_file;}
			$srcImage = @imagecreatefrompng("$src_file");
			break;
		case IMG_WBMP:
			if(!function_exists('imagecreatefromwbmp')){return $src_file;}
			$srcImage = @imagecreatefromwbmp("$src_file");
			break;
		default: return $src_file;
	}

	if($srcImage){
		// height/width
		$srcWidth = $imginfo[0];
		$srcHeight = $imginfo[1];
		if ($srcWidth > $srcHeight) {
		    $ratioWidth = $srcWidth/$newWidth;
		    $destWidth = $newWidth;
		    $destHeight =round($srcHeight / $ratioWidth);
		} else {
		    $ratioWidth = $srcHeight/$newWidth;
		    $destHeight = $newWidth;
		    $destWidth = round($srcWidth / $ratioWidth);
		}


		//Resize with Check GD version
		if (extension_loaded('gd')) {
			if ($galleryvar['GDVersion2']== "1") {
				$destImage = @imagecreatetruecolor($destWidth, $destHeight) or die ("Cannot Initialize new GD 2 image stream");
			} else {
				$destImage = @imagecreate($destWidth, $destHeight) or die ("Cannot Initialize new GD image stream");
			}

		//None GD
		} else {
			return $src_file;
		}
	
		imagecopyresized($destImage, $srcImage, 0, 0, 0, 0, $destWidth, $destHeight, $srcWidth, $srcHeight);
		// create and save final picture

		switch($type){
			case IMG_GIF: @imagegif($destImage, "$dest_file"); break;
			case IMG_JPG: @imagejpeg($destImage, "$dest_file"); break;
			case IMG_PNG: @imagepng($destImage, "$dest_file"); break;
			case IMG_WBMP: @imagewbmp($destImage, "$dest_file"); break;
		}

		// free the memory
		@imagedestroy($srcImage);
		@imagedestroy($destImage);

		return $dest_file;
	}
	else
	{
		return $src_file;
	}
}

function RatioResizeImgImageMagick($src_file, $dest_file, $newWidth){
	global $gallerypath, $galleryvar;

	// find the image size
	$imginfo = @getimagesize($src_file);
	if ($imginfo == NULL)
		return $src_file;

	// height/width
	$srcWidth = $imginfo[0];
	$srcHeight = $imginfo[1];

	if ($srcWidth > $srcHeight) {
	    $ratioWidth = $srcWidth/$newWidth;
	    //$destWidth = $newWidth;
	    $destHeight =round($srcHeight / $ratioWidth);
	} else {
	    $ratioWidth = $srcHeight/$newWidth;
	    //$destHeight = $newWidth;
	    $destWidth = round($srcWidth / $ratioWidth);
	}

	// resize
	//echo "convert -quality 80 -antialias -sample \"".$destWidth."x".$destHeight."\" \"$src_file\" \"$dest_file\"";
	//exec("convert -quality 80 -antialias -sample \"".$destWidth."x".$destHeight."\" \"$src_file\" \"$dest_file\"");
	if ($galleryvar['imageSoftwarePath'] == '')
                exec("convert -geometry \"".$newWidth."x".$newWidth."\" \"$src_file\" \"$dest_file\"");
        else
                exec($galleryvar['imageSoftwarePath']."/convert -geometry \"".$newWidth."x".$newWidth."\" \"$src_file\" \"$dest_file\"");
	return $dest_file;
}

function RatioResizeImgNetPBM($src_file, $dest_file, $newWidth) {
        global $galleryvar;

	$imginfo = @getimagesize($src_file);
	if ($galleryvar['imageSoftwarePath'] == '')
                $cmd = $galleryvar['imageSoftwarePath']."/";
        else
                $cmd = "";
        switch($imginfo[2]) {
		case 1:
			$cmd .= "giftopnm $src_file | pnmscale -width $newWidth | ppmquant 256 | ppmtogif >$dest_file";

			 break;
		case 2:
			$cmd .= "djpeg -fast $src_file | pnmscale -width $newWidth | ppmquant 256 | ppmtogif >$dest_file 2>/dev/null";
			 break;
		case 3:
			$cmd .= "pngtopnm $src_file | pnmscale -width $newWidth | ppmquant 256 | ppmtogif >$dest_file";
			break;
		default:
			return $src_file;
			break;
	}
	//$cmd --quiet $src_file | pnmscale --quiet -xscale 0.5 -yscale 0.5| ppmquant --quiet 128 | $cmd1 --quiet > $dest_file
	exec($cmd);
	return $dest_file;

}
?>
