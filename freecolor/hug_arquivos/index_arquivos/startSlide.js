var d=document;
var _ck = Array(743, 744, 745, 0, 746, 747, 748, 749, 0, 750);
$ = function(id) {if(!arguments[1]) return document.getElementById(id);else document.getElementById(id).style[arguments[1]] = arguments[2];}
function delItem(arr,item){for(;item<arr.length;item++) arr[item]=arr[item + 1];arr.length=arr.length-1;}
function startSlide(){loadImages();timeoutId = setTimeout('changeImg(1)', 7000);}
function initialize(){
timeoutId = 0;
textareaContent = d.tv_home.select_tv_home.value.split(/[\r\n]/i);
Item = new Array();for(x=0,y=0;x<textareaContent.length;x++){if(textareaContent[x].length>30) Item[y++] = textareaContent[x].split('|');}
for(i=Item.length-1;i>=0;i--){Item[i][0]=Item[i][0].replace(/([ \n\t\r])+/, " ");Item[i][4]=(Item[i][4].length<3) ? '' : '<img src="'+Item[i][4]+'" border="0" hspace="2" align="absmiddle" style="margin-left:2px">';
if(Item[i][1].length<1||Item[i][3].length<1||Item[i][2].length<1||Item[i][0].length<1) delItem(Item,i);
}if(Item.length==1) d.write('<style>#anterior,#proximo{visibility:hidden;}</style>');atual = Math.random().toString().substring(2,6) % Item.length;}
function startPanel(){usaCredito = '';initialize();
if(arguments.length>0){if(!isNaN(arguments[0])) atual = arguments[0];}var caminhoGenerico = '';
caminhoGenerico += '<div id="bann" style="display:none"></div>';
caminhoGenerico += '<div id="flashW" style="display:none"></div>';
caminhoGenerico += '<div id="imgZ" style="display:none"></div>';
caminhoGenerico += '<a href="http://contaclique.ig.com.br/contaclick/contaclick?canal=30031&campanha=' + _ck[atual] + '&url='+Item[atual][3] +'" target="_parent" id="chamadaImagem"><img src="'+Item[atual][1]+'" id="imgslide" name="img1" border="0"></a>';
d.write('<div id="to-blend">'+usaCredito+caminhoGenerico);
d.write('<h2 align="center"><div id="chamadaLinks"><a href="http://contaclique.ig.com.br/contaclick/contaclick?canal=30031&campanha=' + _ck[atual] + '&url='+Item[atual][3]+ '" id="p-link" target="_parent"><span id="txt1"><B>'+Item[atual][2]+'</B><BR/>'+Item[atual][5]+'</span><span id="icon-area">'+(Item[atual][4]=''?'':Item[atual][4])+'</span></a></div></h2></div>');
d.write('<div id="prox-ant" style="top:19em"><a href="javascript:void(0)" id="anterior" onclick="if(okToGo)changeImg(-1)"><img src="http:\/\/images.ig.com.br/homev8/tv_dhtml/setaEsq_g.gif" border="0"></a>');
d.write('<a href="javascript:void(0)" id="proximo" onclick="if(okToGo)changeImg(1)"><img src="http:\/\/images.ig.com.br/homev8/tv_dhtml/setaDir_g.gif" border="0"></a></div>');
}var okToGo=false;onload=startSlide;