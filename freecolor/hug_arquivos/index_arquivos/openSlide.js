var bFs = ($('barra-sup')) ? $('barra-sup').offsetWidth/76:0;
function changeOpac(opacity){
var obj = $('to-blend').style; 
obj.opacity=(opacity/100);
obj.MozOpacity=(opacity/100);
obj.KhtmlOpacity=(opacity/100);
}function blend(imagefile){var speed = 7;var timer = 0;
if(Item[atual][0]!=" B"){
for(i = 185; i > 0; i-=2){ setTimeout('changeOpac('+i+')', timer++ * speed);}
if(!d.all){ setTimeout('changeContent()', timer * speed);}
for(i = 0; i <= 185; i+=2){ setTimeout('changeOpac('+i+')', timer++ * speed);}
}else{if(!d.all){ setTimeout('changeContent()', timer * speed);}}
}function changeImg(id){clearTimeout(timeoutId);
atual+=parseInt(id);if(atual>Item.length-1) atual = 0;
if(atual<0) atual = Item.length-1;if(imgDsp[atual].complete==false){
atual--;timeoutId = setTimeout('changeImg('+id+')',500);return;} 
if(d.all && navigator.userAgent.indexOf('Opera')==-1){
try {oDiv = $('to-blend');oDiv.style.filter='blendTrans(duration=1.2)';
oDiv.filters.blendTrans.apply();oDiv.filters.blendTrans.play();changeContent();}catch(e){blend();}
}else{blend();}timeoutId = setTimeout('changeImg(1)',7000)}
function loadImages(){imgDsp = new Array();
for(n=0;n<Item.length;n++){
imgDsp[n] = new Array();
imgDsp[n].src = Item[n][1];
}okToGo = true;}function changeContent(){
var ig_swf_Clique = '';var ig_swf = '';var ig_swf_h = '';var ig_swf_w = '';var propagandaFlash = '';
if(trim(Item[atual][0].toString()) == "W" && Item[atual][3] == "FLASH") {
ig_swf_h = '227';ig_swf_w = '310';ig_swf_Clique = "#"; ig_swf = Item[atual][1];
$("anterior").style.visibility = 'hidden';
$("proximo").style.visibility = 'hidden';
propagandaFlash += '<div style="position:absolute;width:310px;height:227px;" style="display:none"><a href="'+ig_swf_Clique+'" target="_blank"><img src="http://image.ig.com.br/homev8/tv_dhtml/transp.gif" width="'+ig_swf_w+'" height="'+ig_swf_h+'" border="0"></a></div>';
propagandaFlash += '<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ig_swf_w+'" height="'+ig_swf_h+'" id="dhtmlig" ALIGN="">';
propagandaFlash += '<PARAM NAME="movie" VALUE="'+ig_swf+'">';propagandaFlash += '<PARAM NAME="quality" VALUE="high">';propagandaFlash += '<PARAM NAME="wmode" VALUE="transparent">';propagandaFlash += '<PARAM NAME="bgcolor" VALUE="#FFFFFF">';
propagandaFlash += '<EMBED src="'+ig_swf+'" quality="high" wmode="transparent" bgcolor="#FFFFFF"  WIDTH="'+ig_swf_w+'" HEIGHT="'+ig_swf_h+'" NAME="dhtmlig" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>';propagandaFlash += '</OBJECT>';
$("bann").style.display='block';
d.img1.src = 'http://image.ig.com.br/homev8/tv_dhtml/transp.gif';
$("bann").innerHTML = propagandaFlash;
} else if((trim(Item[atual][0].toString()) == "B") || (trim(Item[atual][0].toString()) == "W")){
$("anterior").style.visibility = 'visible';
$("proximo").style.visibility = 'visible';
if(trim(Item[atual][0].toString()) == "B"){
ig_swf_h = '227';ig_swf_w = '310';
ig_swf_Clique = 'http://adserver.ig.com.br/RealMedia/ads/click_nx.ads/www.homepage.com.br/homepage@Left1';
ig_swf = 'http://adserver.ig.com.br/RealMedia/ads/adstream_nx.cgi/www.homepage.com.br/homepage@Left1';
} else {
ig_swf_h = '227';ig_swf_w = '310';
ig_swf_Clique = Item[atual][3];ig_swf = Item[atual][1];}propagandaFlash += '<div style="position:absolute;width:310px;height:227px;"><a href="'+ig_swf_Clique+'" target="_blank"><img src="http://image.ig.com.br/homev8/tv_dhtml/transp.gif" width="'+ig_swf_w+'" height="'+ig_swf_h+'" border="0"></a></div>';
propagandaFlash += '<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ig_swf_w+'" height="'+ig_swf_h+'" id="dhtmlig" ALIGN="">';
propagandaFlash += '<PARAM NAME="movie" VALUE="'+ig_swf+'">';propagandaFlash += '<PARAM NAME="quality" VALUE="high">';propagandaFlash += '<PARAM NAME="wmode" VALUE="transparent">';propagandaFlash += '<PARAM NAME="bgcolor" VALUE="#FFFFFF">';
propagandaFlash += '<EMBED src="'+ig_swf+'" quality="high" wmode="transparent" bgcolor="#FFFFFF"  WIDTH="'+ig_swf_w+'" HEIGHT="'+ig_swf_h+'" NAME="dhtmlig" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>';propagandaFlash += '</OBJECT>';
if(trim(Item[atual][0].toString()) == "B"){
$("bann").style.display='block';
d.img1.src = 'http://image.ig.com.br/homev8/tv_dhtml/transp.gif';
$("bann").innerHTML = propagandaFlash;
} else {
$("flashW").style.display='block';
d.img1.src = 'http://image.ig.com.br/homev8/tv_dhtml/transp.gif';
$("flashW").innerHTML = propagandaFlash;
$("txt1").innerHTML = '<B>'+Item[atual][2]+'</B><BR/>'+Item[atual][5];
}} else if (trim(Item[atual][0].toString()) == "Z") {
$("anterior").style.visibility = 'visible';
$("proximo").style.visibility = 'visible';
$("imgslide").style.width='155px';
$("imgslide").style.height='227px';
$("chamadaLinks").style.display='none';
$("txt1").style.display='none';
$("imgZ").style.display='block';
$("imgZ").innerHTML= "<h2 align=\"center\" style=\"padding-top:15px\"><a href=\"http://contaclique.ig.com.br/contaclick/contaclick?canal=30031&campanha=" + _ck[atual] + "&url=" + Item[atual][3]+ "\"  target=\"_parent\"><span id=\"txt1\"><b>" + Item[atual][2] + "</b><BR/>\n" + Item[atual][5] + "</spam></a></h2>";
$("bann").innerHTML = '';
$("bann").style.display='none';$("flashW").innerHTML = '';
$("flashW").style.display='none';d.img1.src = imgDsp[atual].src;
$("chamadaImagem").href = 'http://contaclique.ig.com.br/contaclick/contaclick?canal=30031&campanha=' + _ck[atual] + '&url=' + Item[atual][3];
$('chamadaLinks').innerHTML = '<a href="http://contaclique.ig.com.br/contaclick/contaclick?canal=30031&campanha=' + _ck[atual] + '&url='+Item[atual][3]+ '" id="p-link" target="_parent"><span id="txt1"><B>'+Item[atual][2]+'</B><BR/>'+Item[atual][5]+'</span><span id="icon-area">'+(Item[atual][4]=''?'':Item[atual][4])+'</span></a>';
if(usaCredito!='') $('credito').innerHTML = Item[atual][0];$('icon-area').innerHTML = Item[atual][4]=''?'':Item[atual][4];
} else {
$("imgZ").style.display='none';
$("chamadaLinks").style.display='block';
$("txt1").style.display='block';
$("imgslide").style.width='310px';
$("imgslide").style.height='182px';
$("anterior").style.visibility = 'visible';
$("proximo").style.visibility = 'visible';
$("bann").innerHTML = '';
$("bann").style.display='none';$("flashW").innerHTML = '';
$("flashW").style.display='none';d.img1.src = imgDsp[atual].src;
$("chamadaImagem").href = 'http://contaclique.ig.com.br/contaclick/contaclick?canal=30031&campanha=' + _ck[atual] + '&url=' + Item[atual][3];
$('chamadaLinks').innerHTML = '<a href="http://contaclique.ig.com.br/contaclick/contaclick?canal=30031&campanha=' + _ck[atual] + '&url='+Item[atual][3]+ '" id="p-link" target="_parent"><span id="txt1"><B>'+Item[atual][2]+'</B><BR/>'+Item[atual][5]+'</span><span id="icon-area">'+(Item[atual][4]=''?'':Item[atual][4])+'</span></a>';
if(usaCredito!='') $('credito').innerHTML = Item[atual][0];$('icon-area').innerHTML = Item[atual][4]=''?'':Item[atual][4];}}
function trim(valor) {return valor.replace(/^\s*/, "").replace(/\s*$/, "");}