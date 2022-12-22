function ExibeFlash(w,h,wmode,movie) {
	document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="'+w+'" height="'+h+'">');
	document.write('<param name="wmode" value="'+wmode+'"/>');
	document.write('<param name="quality" value="high"/>');
	document.write('<param name="movie" value="'+movie+'"/>');
	document.write('<embed src="'+movie+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="'+wmode+'" width="'+w+'" height="'+h+'"></embed>');
	document.write('</object>');
}