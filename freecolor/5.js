function carregaFlash(caminho,largura,altura)
{
document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="'+largura+'" height="'+altura+'">');
document.write('<param name="movie" value="'+caminho+'">');
document.write('<param name="quality" value="high">');
document.write('<param name="wmode" value="transparent">');
document.write('<param name="menu" value="false">');
document.write('<embed src="'+caminho+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="'+largura+'" height="'+altura+'"></embed>');
document.write('</object>');
}