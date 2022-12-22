/* JavaScriptCompressor 0.8 [www.devpro.it], thanks to Dean Edwards for idea [dean.edwards.name] */
function tree (a_items,a_template){this.a_tpl=a_template;this.a_config=a_items;this.o_root=this;this.a_index=[];this.o_selected=null;this.n_depth=-1;var o_icone=new Image(),o_iconl=new Image();o_icone.src=a_template[
'icon_e'
];o_iconl.src=a_template[
'icon_l'
];a_template[
'im_e'
]=o_icone;a_template[
'im_l'
]=o_iconl;for (var i=0;i<64;i++){if (a_template[
'icon_'
+i]){var o_icon=new Image();a_template[
'im_'
+i]=o_icon;o_icon.src=a_template[
'icon_'
+i];}}
this.toggle=function (n_id){var o_item=this.a_index[n_id];o_item.open(o_item.b_opened)};this.select=function (n_id){return this.a_index[n_id].select();};this.mout=function (n_id){this.a_index[n_id].upstatus(true)};this.mover=function (n_id){this.a_index[n_id].upstatus()};this.a_children=[];for (var i=0;i<a_items.length;i++)
new tree_item(this,i);this.n_id=trees.length;trees[this.n_id]=this;for (var i=0;i<this.a_children.length;i++){document.write(this.a_children[i].init());this.a_children[i].open();}}
function tree_item (o_parent,n_order){this.n_depth=o_parent.n_depth+1;this.a_config=o_parent.a_config[n_order+(this.n_depth?2:0)];if (!this.a_config) return;this.o_root=o_parent.o_root;this.o_parent=o_parent;this.n_order=n_order;this.b_opened=!this.n_depth;this.n_id=this.o_root.a_index.length;this.o_root.a_index[this.n_id]=this;o_parent.a_children[n_order]=this;this.a_children=[];for (var i=0;i<this.a_config.length-2;i++)
new tree_item(this,i);this.get_icon=item_get_icon;this.open=item_open;this.select=item_select;this.init=item_init;this.upstatus=item_upstatus;this.is_last=function (){return this.n_order==this.o_parent.a_children.length-1};}
function item_open (b_close){var o_idiv=get_element(
'i_div'
+this.o_root.n_id+
'_'
+this.n_id);if (!o_idiv) return;if (!o_idiv.innerHTML){var a_children=[];for (var i=0;i<this.a_children.length;i++)
a_children[i]=this.a_children[i].init();o_idiv.innerHTML=a_children.join(
''
);}
o_idiv.style.display=(b_close?
'none'
:
'block'
);this.b_opened=!b_close;var o_jicon=document.images[
'j_img'
+this.o_root.n_id+
'_'
+this.n_id],o_iicon=document.images[
'i_img'
+this.o_root.n_id+
'_'
+this.n_id];if (o_jicon) o_jicon.src=this.get_icon(true);if (o_iicon) o_iicon.src=this.get_icon();this.upstatus();}
function item_select (b_deselect){if (!b_deselect){var o_olditem=this.o_root.o_selected;this.o_root.o_selected=this;if (o_olditem) o_olditem.select(true);}
var o_iicon=document.images[
'i_img'
+this.o_root.n_id+
'_'
+this.n_id];if (o_iicon) o_iicon.src=this.get_icon();get_element(
'i_txt'
+this.o_root.n_id+
'_'
+this.n_id).style.fontWeight=b_deselect?
'normal'
:
'bold'
;this.upstatus();return Boolean(this.a_config[1]);}
function item_upstatus (b_clear){
}
function item_init (){var a_offset=[],o_current_item=this.o_parent;for (var i=this.n_depth;i>=1;i--){a_offset[i]=
'<img src="'
+this.o_root.a_tpl[o_current_item.is_last()?
'icon_e'
:
'icon_l'
]+
'" border="0" align="absbottom">'
;o_current_item=o_current_item.o_parent;}
return
'<table cellpadding="0" cellspacing="0" border="0"><tr><td nowrap>'
+(this.n_depth>=0?a_offset.join(
''
)+(this.a_children.length?
'<a href="javascript: trees['
+this.o_root.n_id+
'].toggle('
+this.n_id+
')" onmouseover="trees['
+this.o_root.n_id+
'].mover('
+this.n_id+
')" onmouseout="trees['
+this.o_root.n_id+
'].mout('
+this.n_id+
')"><img src="'
+this.get_icon(true)+
'" border="0" align="absbottom" name="j_img'
+this.o_root.n_id+
'_'
+this.n_id+
'"></a>'
:
'<img src="'
+this.get_icon(true)+
'" border="0" align="absbottom">'
):
''
+this.n_depth)+this.a_config[0]+
'</td></tr></table>'
+(this.a_children.length?
'<div id="i_div'
+this.o_root.n_id+
'_'
+this.n_id+
'" style="display:none"></div>'
:
''
);}
function item_get_icon (b_junction){var icon_number=((this.n_depth>=0?0:32)+(this.a_children.length?16:0)+(this.a_children.length&&this.b_opened?8:0)+(!b_junction&&this.o_root.o_selected==this?4:0)+(b_junction?2:0)+(b_junction&&this.is_last()?1:0));if(icon_number==19&&this.n_depth==0){icon_number=20;} else if(icon_number==27&&this.n_depth==0){icon_number=28;}
return this.o_root.a_tpl[
'icon_'
+icon_number];}
var trees=[];get_element=document.all?function (s_id){return document.all[s_id]}:function (s_id){return document.getElementById(s_id)};var TREE_TPL_DEFAULT={
'target'
:
'_self'
,
'icon_e'
:
'_resources/media/img/tree/empty.gif'
,
'icon_l'
:
'_resources/media/img/tree/line.gif'
,
'icon_32'
:
'_resources/media/img/tree/base.gif'
,
'icon_36'
:
'_resources/media/img/tree/base.gif'
,
'icon_48'
:
'_resources/media/img/tree/empty.gif'
,
'icon_52'
:
'_resources/media/img/tree/empty.gif'
,
'icon_56'
:
'_resources/media/img/tree/empty.gif'
,
'icon_60'
:
'_resources/media/img/tree/empty.gif'
,
'icon_16'
:
'_resources/media/img/tree/empty.gif'
,
'icon_20'
:
'_resources/media/img/tree/empty.gif'
,
'icon_24'
:
'_resources/media/img/tree/empty.gif'
,
'icon_28'
:
'_resources/media/img/tree/empty.gif'
,
'icon_0'
:
'_resources/media/img/tree/empty.gif'
,
'icon_4'
:
'_resources/media/img/tree/empty.gif'
,
'icon_2'
:
'_resources/media/img/tree/joinbottom.gif'
,
'icon_3'
:
'_resources/media/img/tree/join.gif'
,
'icon_18'
:
'_resources/media/img/tree/plusbottom.gif'
,
'icon_19'
:
'_resources/media/img/tree/plus.gif'
,
'icon_20'
:
'_resources/media/img/tree/plusroot.gif'
,
'icon_26'
:
'_resources/media/img/tree/minusbottom.gif'
,
'icon_27'
:
'_resources/media/img/tree/minus.gif'
,
'icon_28'
:
'_resources/media/img/tree/minusroot.gif'
};
var loadingImage=
'/_resources/media/img/loading.gif'
;var closeButton=
'/_resources/media/img/close.gif'
;
function getPageScroll(){var yScroll;if (self.pageYOffset){yScroll=self.pageYOffset;} else if (document.documentElement&&document.documentElement.scrollTop){
yScroll=document.documentElement.scrollTop;} else if (document.body){
yScroll=document.body.scrollTop;}
arrayPageScroll=new Array(
''
,yScroll)
 return arrayPageScroll;}
function getPageSize(){var xScroll,yScroll;if (window.innerHeight&&window.scrollMaxY){xScroll=document.body.scrollWidth;yScroll=window.innerHeight+window.scrollMaxY;} else if (document.body.scrollHeight>document.body.offsetHeight){
xScroll=document.body.scrollWidth;yScroll=document.body.scrollHeight;} else {
xScroll=document.body.offsetWidth;yScroll=document.body.offsetHeight;}
var windowWidth,windowHeight;if (self.innerHeight){
windowWidth=self.innerWidth;windowHeight=self.innerHeight;} else if (document.documentElement&&document.documentElement.clientHeight){
windowWidth=document.documentElement.clientWidth;windowHeight=document.documentElement.clientHeight;} else if (document.body){
windowWidth=document.body.clientWidth;windowHeight=document.body.clientHeight;}
if(yScroll<windowHeight){pageHeight=windowHeight;} else {pageHeight=yScroll;}
if(xScroll<windowWidth){pageWidth=windowWidth;} else {pageWidth=xScroll;}
arrayPageSize=new Array(pageWidth,pageHeight,windowWidth,windowHeight)
 return arrayPageSize;}
function pause(numberMillis){var now=new Date();var exitTime=now.getTime()+numberMillis;while (true){now=new Date();if (now.getTime()>exitTime)
return;}}
function getKey(e){if (e==null){
keycode=event.keyCode;} else {
keycode=e.which;}
key=String.fromCharCode(keycode).toLowerCase();if(key==
'x'
){hideLightbox();}}
function listenKey (){document.onkeypress=getKey;}
function showLightbox(objLink){
var objOverlay=document.getElementById(
'overlay'
);var objLightbox=document.getElementById(
'lightbox'
);var objCaption=document.getElementById(
'lightboxCaption'
);var objImage=document.getElementById(
'lightboxImage'
);var objLoadingImage=document.getElementById(
'loadingImage'
);var objLightboxDetails=document.getElementById(
'lightboxDetails'
);var arrayPageSize=getPageSize();var arrayPageScroll=getPageScroll();
if (objLoadingImage){objLoadingImage.style.top=(arrayPageScroll[1]+((arrayPageSize[3]-35-objLoadingImage.height) / 2)+
'px'
);objLoadingImage.style.left=(((arrayPageSize[0]-20-objLoadingImage.width) / 2)+
'px'
);objLoadingImage.style.display=
'block'
;}
objOverlay.style.height=(arrayPageSize[1]+
'px'
);objOverlay.style.display=
'block'
;
imgPreload=new Image();imgPreload.onload=function(){objImage.src=objLink.href;
var lightboxTop=arrayPageScroll[1]+((arrayPageSize[3]-35-imgPreload.height) / 2);var lightboxLeft=((arrayPageSize[0]-20-imgPreload.width) / 2);objLightbox.style.top=(lightboxTop<0)?
"0px"
:lightboxTop+
"px"
;objLightbox.style.left=(lightboxLeft<0)?
"0px"
:lightboxLeft+
"px"
;objLightboxDetails.style.width=imgPreload.width+
'px'
;if(objLink.getAttribute(
'title'
)){objCaption.style.display=
'block'
;
objCaption.innerHTML=objLink.getAttribute(
'title'
);} else {objCaption.style.display=
'none'
;}
if (navigator.appVersion.indexOf(
"MSIE"
)!=-1){pause(250);}
 if (objLoadingImage){objLoadingImage.style.display=
'none'
;}
selects=document.getElementsByTagName(
"select"
);for (i=0;i !=selects.length;i++){selects[i].style.visibility=
"hidden"
;}
objLightbox.style.display=
'block'
;
arrayPageSize=getPageSize();objOverlay.style.height=(arrayPageSize[1]+
'px'
);
listenKey();return false;}
imgPreload.src=objLink.href;}
function hideLightbox(){
objOverlay=document.getElementById(
'overlay'
);objLightbox=document.getElementById(
'lightbox'
);
objOverlay.style.display=
'none'
;objLightbox.style.display=
'none'
;
selects=document.getElementsByTagName(
"select"
);for (i=0;i !=selects.length;i++){selects[i].style.visibility=
"visible"
;}
document.onkeypress=
''
;}
function initLightbox(){if (!document.getElementsByTagName){return;}
var anchors=document.getElementsByTagName(
"a"
);
for (var i=0;i<anchors.length;i++){var anchor=anchors[i];if (anchor.getAttribute(
"href"
)&&(anchor.getAttribute(
"rel"
)==
"lightbox"
)){anchor.onclick=function (){showLightbox(this);return false;}}}
var objBody=document.getElementsByTagName(
"body"
).item(0);
var objOverlay=document.createElement(
"div"
);objOverlay.setAttribute(
'id'
,
'overlay'
);objOverlay.onclick=function (){hideLightbox();return false;}
objOverlay.style.display=
'none'
;objOverlay.style.position=
'absolute'
;objOverlay.style.top=
'0'
;objOverlay.style.left=
'0'
;objOverlay.style.zIndex=
'90'
;objOverlay.style.width=
'100%'
;objBody.insertBefore(objOverlay,objBody.firstChild);var arrayPageSize=getPageSize();var arrayPageScroll=getPageScroll();
var imgPreloader=new Image();
imgPreloader.onload=function(){var objLoadingImageLink=document.createElement(
"a"
);objLoadingImageLink.setAttribute(
'href'
,
'#'
);objLoadingImageLink.onclick=function (){hideLightbox();return false;}
objOverlay.appendChild(objLoadingImageLink);var objLoadingImage=document.createElement(
"img"
);objLoadingImage.src=loadingImage;objLoadingImage.setAttribute(
'id'
,
'loadingImage'
);objLoadingImage.style.position=
'absolute'
;objLoadingImage.style.zIndex=
'150'
;objLoadingImageLink.appendChild(objLoadingImage);imgPreloader.onload=function(){};
return false;}
imgPreloader.src=loadingImage;
var objLightbox=document.createElement(
"div"
);objLightbox.setAttribute(
'id'
,
'lightbox'
);objLightbox.style.display=
'none'
;objLightbox.style.position=
'absolute'
;objLightbox.style.zIndex=
'100'
;objBody.insertBefore(objLightbox,objOverlay.nextSibling);
var objLink=document.createElement(
"a"
);objLink.setAttribute(
'href'
,
'#'
);objLink.setAttribute(
'title'
,
''
);objLink.onclick=function (){hideLightbox();return false;}
objLightbox.appendChild(objLink);
var imgPreloadCloseButton=new Image();
imgPreloadCloseButton.onload=function(){var objCloseButton=document.createElement(
"img"
);objCloseButton.src=closeButton;objCloseButton.setAttribute(
'id'
,
'closeButton'
);objCloseButton.style.position=
'absolute'
;objCloseButton.style.zIndex=
'200'
;objLink.appendChild(objCloseButton);return false;}
imgPreloadCloseButton.src=closeButton;
var objImage=document.createElement(
"img"
);objImage.setAttribute(
'id'
,
'lightboxImage'
);objLink.appendChild(objImage);
var objLightboxDetails=document.createElement(
"div"
);objLightboxDetails.setAttribute(
'id'
,
'lightboxDetails'
);objLightbox.appendChild(objLightboxDetails);
var objCaption=document.createElement(
"div"
);objCaption.setAttribute(
'id'
,
'lightboxCaption'
);objCaption.style.display=
'none'
;objLightboxDetails.appendChild(objCaption);}
function addLoadEvent(func){var oldonload=window.onload;if (typeof window.onload !=
'function'
){window.onload=func;} else {window.onload=function(){oldonload();func();}}}
addLoadEvent(initLightbox);
var xVersion=
'3.15.2'
,xNN4,xOp7,xOp5or6,xIE4Up,xIE4,xIE5,xMac,xUA=navigator.userAgent.toLowerCase();if (window.opera){xOp7=(xUA.indexOf(
'opera 7'
)!=-1||xUA.indexOf(
'opera/7'
)!=-1);if (!xOp7)
 xOp5or6=(xUA.indexOf(
'opera 5'
)!=-1||xUA.indexOf(
'opera/5'
)!=-1||xUA.indexOf(
'opera 6'
)!=-1||xUA.indexOf(
'opera/6'
)!=-1);} else if (document.all&&xUA.indexOf(
'msie'
)!=-1){xIE4Up=parseInt(navigator.appVersion)>=4;xIE4=xUA.indexOf(
'msie 4'
)!=-1;xIE5=xUA.indexOf(
'msie 5'
)!=-1;} else if (document.layers){xNN4=true;}
xMac=xUA.indexOf(
'mac'
)!=-1;
function xGetElementById(e){if(typeof(e)!=
'string'
)
 return e;if(document.getElementById)
 e=document.getElementById(e);else if(document.all)
 e=document.all[e];else
 e=null;return e;}
function xParent(e,bNode){if (!(e=xGetElementById(e))) return null;var p=null;if (!bNode&&xDef(e.offsetParent)) p=e.offsetParent;else if (xDef(e.parentNode)) p=e.parentNode;else if (xDef(e.parentElement)) p=e.parentElement;return p;}
function xDef(){for(var i=0;i<arguments.length;++i){if(typeof(arguments[i])==
'undefined'
)
 return false;}
return true;}
function xStr(s){for(var i=0;i<arguments.length;++i){if(typeof(arguments[i])!=
'string'
)
 return false;}
return true;}
function xNum(n){for(var i=0;i<arguments.length;++i){if(typeof(arguments[i])!=
'number'
)
 return false;}
return true;}
function xShow(e){if(!(e=xGetElementById(e)))
 return;if(e.style&&xDef(e.style.visibility))
 e.style.visibility=
'visible'
;}
function xHide(e){if(!(e=xGetElementById(e)))
 return;if(e.style&&xDef(e.style.visibility))
 e.style.visibility=
'hidden'
;}
function xZIndex(e,uZ){if(!(e=xGetElementById(e)))
 return 0;if(e.style&&xDef(e.style.zIndex)){if(xNum(uZ))
 e.style.zIndex=uZ;uZ=parseInt(e.style.zIndex);}
return uZ;}
function xColor(e,sColor){if(!(e=xGetElementById(e)))
 return
''
;var c=
''
;if(e.style&&xDef(e.style.color)){if(xStr(sColor))
 e.style.color=sColor;c=e.style.color;}
return c;}
function xBackground(e,sColor,sImage){if(!(e=xGetElementById(e)))
 return
''
;var bg=
''
;if(e.style){if(xStr(sColor)){if(!xOp5or6)
 e.style.backgroundColor=sColor;else e.style.background=sColor;}
if(xStr(sImage))
 e.style.backgroundImage=(sImage!=
''
)?
'url('
+sImage+
')'
:null;if(!xOp5or6)
 bg=e.style.backgroundColor;else
 bg=e.style.background;}
return bg;}
function xMoveTo(e,iX,iY){xLeft(e,iX);xTop(e,iY);}
function xLeft(e,iX){if(!(e=xGetElementById(e)))
 return 0;var css=xDef(e.style);if (css&&xStr(e.style.left)){if(xNum(iX))
 e.style.left=iX+
'px'
;else {iX=parseInt(e.style.left);if(isNaN(iX))
 iX=0;}} else if(css&&xDef(e.style.pixelLeft)){if(xNum(iX))
 e.style.pixelLeft=iX;else
 iX=e.style.pixelLeft;}
return iX;}
function xTop(e,iY){if(!(e=xGetElementById(e)))
 return 0;var css=xDef(e.style);if(css&&xStr(e.style.top)){if(xNum(iY))
 e.style.top=iY+
'px'
;else {iY=parseInt(e.style.top);if(isNaN(iY))
 iY=0;}} else if(css&&xDef(e.style.pixelTop)){if(xNum(iY))
 e.style.pixelTop=iY;else
 iY=e.style.pixelTop;}
return iY;}
function xPageX(e){if (!(e=xGetElementById(e)))
 return 0;var x=0;while (e){if (xDef(e.offsetLeft))
 x+=e.offsetLeft;e=xDef(e.offsetParent)?e.offsetParent:null;}
return x;}
function xPageY(e){if (!(e=xGetElementById(e)))
 return 0;var y=0;while (e){if (xDef(e.offsetTop))
 y+=e.offsetTop;e=xDef(e.offsetParent)?e.offsetParent:null;}
return y;}
function xOffsetLeft(e){if (!(e=xGetElementById(e)))
 return 0;if (xDef(e.offsetLeft))
 return e.offsetLeft;else return 0;}
function xOffsetTop(e){if (!(e=xGetElementById(e)))
 return 0;if (xDef(e.offsetTop))
 return e.offsetTop;else return 0;}
function xScrollLeft(e){var offset=0;if (!(e=xGetElementById(e))){if(document.documentElement&&document.documentElement.scrollLeft)
 offset=document.documentElement.scrollLeft;else if(document.body&&xDef(document.body.scrollLeft))
 offset=document.body.scrollLeft;} else {if (xNum(e.scrollLeft))
 offset=e.scrollLeft;}
return offset;}
function xScrollTop(e){var offset=0;if (!(e=xGetElementById(e))){if(document.documentElement&&document.documentElement.scrollTop)
 offset=document.documentElement.scrollTop;else if(document.body&&xDef(document.body.scrollTop))
 offset=document.body.scrollTop;} else {if (xNum(e.scrollTop))
 offset=e.scrollTop;}
return offset;}
function xHasPoint(ele,iLeft,iTop,iClpT,iClpR,iClpB,iClpL){if (!xNum(iClpT)){iClpT=iClpR=iClpB=iClpL=0;} else if (!xNum(iClpR)){iClpR=iClpB=iClpL=iClpT;} else if (!xNum(iClpB)){iClpL=iClpR;iClpB=iClpT;}
var thisX=xPageX(ele),thisY=xPageY(ele);return (iLeft>=thisX+iClpL&&iLeft<=thisX+xWidth(ele)-iClpR&&iTop>=thisY+iClpT&&iTop<=thisY+xHeight(ele)-iClpB);}
function xResizeTo(e,uW,uH){xWidth(e,uW);xHeight(e,uH);}
function xWidth(e,uW){if(!(e=xGetElementById(e)))
 return 0;if (xNum(uW)){if (uW<0)
 uW=0;else
 uW=Math.round(uW);} else
 uW=-1;var css=xDef(e.style);if(css&&xDef(e.offsetWidth)&&xStr(e.style.width)){if(uW>=0)
 xSetCW(e,uW);uW=e.offsetWidth;} else if(css&&xDef(e.style.pixelWidth)){if(uW>=0)
 e.style.pixelWidth=uW;uW=e.style.pixelWidth;}
return uW;}
function xHeight(e,uH){if(!(e=xGetElementById(e)))
 return 0;if (xNum(uH)){if (uH<0)
 uH=0;else
 uH=Math.round(uH);} else
 uH=-1;var css=xDef(e.style);if(css&&xDef(e.offsetHeight)&&xStr(e.style.height)){if(uH>=0)
 xSetCH(e,uH);uH=e.offsetHeight;} else if(css&&xDef(e.style.pixelHeight)){if(uH>=0)
 e.style.pixelHeight=uH;uH=e.style.pixelHeight;}
return uH;}
function xGetCS(ele,sP){return parseInt(document.defaultView.getComputedStyle(ele,
''
).getPropertyValue(sP));}
function xSetCW(ele,uW){var pl=0,pr=0,bl=0,br=0;if(xDef(document.defaultView)&&xDef(document.defaultView.getComputedStyle)){pl=xGetCS(ele,
'padding-left'
);pr=xGetCS(ele,
'padding-right'
);bl=xGetCS(ele,
'border-left-width'
);br=xGetCS(ele,
'border-right-width'
);}else if(xDef(ele.currentStyle,document.compatMode)){if(document.compatMode==
'CSS1Compat'
){pl=parseInt(ele.currentStyle.paddingLeft);pr=parseInt(ele.currentStyle.paddingRight);bl=parseInt(ele.currentStyle.borderLeftWidth);br=parseInt(ele.currentStyle.borderRightWidth);}} else if(xDef(ele.offsetWidth,ele.style.width)){
ele.style.width=uW+
'px'
;pl=ele.offsetWidth-uW;}
if(isNaN(pl))
 pl=0;if(isNaN(pr))
 pr=0;if(isNaN(bl))
 bl=0;if(isNaN(br))
 br=0;var cssW=uW-(pl+pr+bl+br);if(isNaN(cssW)||cssW<0)
 return;else
 ele.style.width=cssW+
'px'
;}
function xSetCH(ele,uH){var pt=0,pb=0,bt=0,bb=0;if(xDef(document.defaultView)&&xDef(document.defaultView.getComputedStyle)){pt=xGetCS(ele,
'padding-top'
);pb=xGetCS(ele,
'padding-bottom'
);bt=xGetCS(ele,
'border-top-width'
);bb=xGetCS(ele,
'border-bottom-width'
);} else if(xDef(ele.currentStyle,document.compatMode)){if(document.compatMode==
'CSS1Compat'
){pt=parseInt(ele.currentStyle.paddingTop);pb=parseInt(ele.currentStyle.paddingBottom);bt=parseInt(ele.currentStyle.borderTopWidth);bb=parseInt(ele.currentStyle.borderBottomWidth);}} else if(xDef(ele.offsetHeight,ele.style.height)){
ele.style.height=uH+
'px'
;pt=ele.offsetHeight-uH;}
if(isNaN(pt))
 pt=0;if(isNaN(pb))
 pb=0;if(isNaN(bt))
 bt=0;if(isNaN(bb))
 bb=0;var cssH=uH-(pt+pb+bt+bb);if(isNaN(cssH)||cssH<0)
 return;else
 ele.style.height=cssH+
'px'
;}
function xClip(e,iTop,iRight,iBottom,iLeft){if(!(e=xGetElementById(e)))
 return;if(e.style){if (xNum(iLeft))
 e.style.clip=
'rect('
+iTop+
'px '
+iRight+
'px '
+iBottom+
'px '
+iLeft+
'px)'
;else
 e.style.clip=
'rect(0 '
+parseInt(e.style.width)+
'px '
+parseInt(e.style.height)+
'px 0)'
;}}
function xClientWidth(){var w=0;if(xOp5or6) w=window.innerWidth;else if(!window.opera&&document.documentElement&&document.documentElement.clientWidth)
w=document.documentElement.clientWidth;else if(document.body&&document.body.clientWidth)
w=document.body.clientWidth;else if(xDef(window.innerWidth,window.innerHeight,document.height)){w=window.innerWidth;if(document.height>window.innerHeight) w-=16;}
return w;}
function xClientHeight(){var h=0;if(xOp5or6) h=window.innerHeight;else if(!window.opera&&document.documentElement&&document.documentElement.clientHeight)
h=document.documentElement.clientHeight;else if(document.body&&document.body.clientHeight)
h=document.body.clientHeight;else if(xDef(window.innerWidth,window.innerHeight,document.width)){h=window.innerHeight;if(document.width>window.innerWidth) h-=16;}
return h;}
function xInnerHtml(e,sHtml){if(!(e=xGetElementById(e)))
 return
''
;if (xStr(e.innerHTML)){if (xStr(sHtml))
 e.innerHTML=sHtml;else
 return e.innerHTML;}}
function xDisplay(e){if(!(e=xGetElementById(e)))
 return;if(e.style&&xDef(e.style.display))
 e.style.display=
'inline'
;}
function xDisplay2(e){if(!(e=xGetElementById(e)))
 return;if(e.style&&xDef(e.style.display))
 e.style.display=
''
;}
function xChangeDisplay(e){if(!(e=xGetElementById(e)))
 return;if(e.style&&xDef(e.style.display)){if(e.style.display==
'none'
)
e.style.display=
'inline'
;else
e.style.display=
'none'
;}}
function xNoDisplay(e){if(!(e=xGetElementById(e)))
 return;if(e.style&&xDef(e.style.display))
 e.style.display=
'none'
;}
function xChangeImageSrc(e,source){if(!(e=xGetElementById(e)))
 return;if(e.src)
 e.src=source;}
function xDisplayPos(e,e2,x,y){if(!(e=xGetElementById(e)))
return;if(e.style&&xDef(e.style.display))
e.style.display=
''
;var left=xPageX(e2)+x;var top=xPageY(e2)+y;xLeft(e,left);xTop(e,top)}
var flashVersion=6;
var flashRelease=
"6,0,67,0"
;
function isFlashCompatible(){var pluginVersion;if(navigator.plugins&&navigator.mimeTypes.length){var words=navigator.plugins[
"Shockwave Flash"
].description.split(
" "
);for (var i=0;i<words.length;++i){if (isNaN(parseInt(words[i])))
continue;pluginVersion=words[i];}}else{try{var axo=new ActiveXObject(
"ShockwaveFlash.ShockwaveFlash"
);for (var i=3;axo!=null;i++){axo=new ActiveXObject(
"ShockwaveFlash.ShockwaveFlash."
+i);pluginVersion=i;}}catch(e){}}
return pluginVersion>=flashVersion;}
function writeFlash(swf,flashVarString,w,h,bgcolor,menu,mode,q,id){if (isFlashCompatible()){document.write(
'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" '
+
'codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version='
+flashRelease+
'" '
+
'width="'
+w+
'" height="'
+h+
'" id="'
+id+
'" align="" />'
+
'<param name="movie" value="'
+swf+
'" />'
+
'<param name="menu" value="'
+menu+
'" /> '
+
'<param name="quality" value="'
+q+
'" /> '
+
'<param name="wmode" value="'
+mode+
'" /> '
+
'<param name="bgcolor" value="'
+bgcolor+
'" /> '
+
'<param name="flashvars" value="'
+flashVarString+
'" /> '
+
'<embed src="'
+swf+
'" flashvars="'
+flashVarString+
'" menu="'
+menu+
'" quality="'
+q+
'" wmode="'
+mode+
'" '
+
' bgcolor="'
+bgcolor+
'"  width="'
+w+
'" height="'
+h+
'" name="'
+swf+
'" '
+
' align=""  type="application/x-shockwave-flash" '
+
' pluginspage="http://www.macromedia.com/go/getflashplayer"></embed></object> '
);} else {
document.write(
'You require Flash Player '
+flashVersion+
' or later to use this site. '
);document.write(
'<em><a href="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" target="_blank">'
);document.write(
'Click here to install it now.</a></em>'
);
}}
function isEmpty(value){return ((value==null)||(value.length==0));}
function isWhitespace(value){if(isEmpty(value)) return true;for(i=0;i<value.length;i++){if(value.charAt(i) !=
' '
){return false;}}
return true;}
function isNumber(value){if(isEmpty(value)) return false;var reg=new RegExp(
'^[0-9]{1,15}(\,[0-9]{1,2}){0,1}$'
);if(value.match(reg))
return true;return false;}
function isDigits(value){if(isEmpty(value)) return false;var reg=new RegExp(
'^[0-9]+$'
);if(value.match(reg))
return true;return false;}
function isPhone(value){if(isEmpty(value)) return false;var reg=new RegExp(
'^[0-9]{3,4}[\-]{1}[0-9]{4}$'
);if(value.match(reg))
return true;if(isDigits(value)&&(value.length==7||value.length==8))
return true;return false;}
function isCep(value){if(isEmpty(value)) return false;var reg=new RegExp(
'^[0-9]{5}[\-]{1}[0-9]{3}$'
);if(value.match(reg))
return true;if(isDigits(value)&&value.length==8)
return true;return false;}
function isEmail(value){if(isEmpty(value)) return false;var reg=new RegExp(
'^([0-9,a-z,A-Z]+)([.,_,-]([0-9,a-z,A-Z]+))*[@]([0-9,a-z,A-Z]+)([.,_,-]([0-9,a-z,A-Z]+))*[.]([0-9,a-z,A-Z]){2}([0-9,a-z,A-Z])?$'
);if(value.match(reg))
return true;return false;}
function isUrl(value){if(isEmpty(value)) return false;var reg=new RegExp(
'^(http|https|ftp)\://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&%\$#\=~])*[^\.\,\)\(\s]$'
);if(value.match(reg))
return true;return false;}
function isDate(value){if(isEmpty(value)) return false;var reg=new RegExp(
'^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}$'
);var data;var a_data;if(value.match(reg)){a_data=value.split(
'/'
);} else {reg=new RegExp(
'^[0-9]{1,2}\-[0-9]{1,2}\-[0-9]{4}$'
);if(value.match(reg)){a_data=value.split(
'-'
);} else {return false;}}
a_data[0]=parseInt(a_data[0]);a_data[1]=parseInt(a_data[1])-1;a_data[2]=parseInt(a_data[2]);data=new Date(a_data[2],a_data[1],a_data[0]);if(data.getMonth()==a_data[1])
return true;return false;}
var undefined;
function formSubmit (go,form){if(go !=
''
){form.go.value=go;}
form.submit();}
function formCancel(){if (window.history.length){history.back();} else if (window.opener&&!window.opener.closed){self.close();}}
function getCookie(name){if (document.cookie.length>0){var begin=document.cookie.indexOf(name+
"="
);if (begin !=-1){begin+=name.length+1;var end=document.cookie.indexOf(
";"
,begin);if (end==-1) end=document.cookie.length;return unescape(document.cookie.substring(begin,end));}}
return null;}
function setCookie(name,value,expiredays){var ExpireDate=new Date ();ExpireDate.setTime(ExpireDate.getTime()+(expiredays * 24 * 3600 * 1000));document.cookie=name+
"="
+escape(value)+((expiredays==null)?
""
:
"; expires="
+ExpireDate.toGMTString());}
function delCookie (name){document.cookie=name+
"="
+
"; expires=Thu, 01-Jan-70 00:00:01 GMT"
;}
function setStatus(message){window.status=message;}
function updateParent(){if (window.opener&&!window.opener.closed){window.opener.location.href=window.opener.document.URL;}
self.close();}
function hrefPopup(url,width,height,scroll,name){var win=null;var winl=(screen.width-width)/2;var wint=(screen.height-height)/2;settings=
'height='
+height+
',width='
+width+
',top='
+wint+
',left='
+winl+
',scrollbars='
+scroll+
',toolbar=no,location=no,status=no,menubar=no,resizable=no,dependent=yes'
if (name==
''
){name=
'_window'
;}
win=window.open (
''
+url+
''
,
''
+name+
''
,settings);if (parseInt(navigator.appVersion)>=4){win.window.focus();}}
function reload(){window.location.reload();}
function refresh(time){setTimeout(
"reload()"
,time);}
function textCounter(field,countfield,maxlimit){if (field.value.length>maxlimit){field.value=field.value.substring(0,maxlimit);} else {countfield.value=maxlimit-field.value.length;}}
function changeCheck(check,form,name){var field=form.elements[name];if(!field) return;if(!field.length){field.checked=check.checked;} else {for(var i=0;i<field.length;i++){field[i].checked=check.checked;}}}
function anyChecked(form,name,msg){var field=form.elements[name];if(!field) return;if(!field.length){if(field.checked){return true;}} else {for(var i=0;i<field.length;i++){if(field[i].checked){return true;}}}
if(msg.length){alert(msg);}
return false;}
function selected(name){var select=xGetElementById(name);return select.options[select.selectedIndex].value;}
function list_limit(select){var limit=select.options[select.selectedIndex].value;var url=location.href;if(url.indexOf(
'&limit='
) !=-1){url=url.replace(
/limit=[0-9]*/,
'limit='
+limit);} else {url=url+
'&limit='
+limit;}
location.href=url;}
function list_search(form){var search=xGetElementById(
'SEARCH'
);var ssel=form.elements[
'SEARCH_SELECT[]'
];var schk=form.elements[
'SEARCH_CHECK[]'
];var url=location.href;if(search){if(url.indexOf(
'&search='
) !=-1){url=url.replace(
/search=[^&]*/,
'search='
+escape(search.value));} else {url=url+
'&search='
+escape(search.value);}
if(ssel){if(ssel.selectedIndex !=undefined){if(url.indexOf(
'&ssel1='
) !=-1){url=url.replace(
/ssel1=[^&]*/,
'ssel1='
+ssel.options[ssel.selectedIndex].value);} else {url=url+
'&ssel1='
+ssel.options[ssel.selectedIndex].value;}} else {for(var i=0;i<ssel.length;i++){if(url.indexOf(
'&ssel'
+(i+1)+
'='
) !=-1){url=url.replace(
"&ssel"
+(i+1)+
'='
,
'&ssel0='
);url=url.replace(
/ssel0=[^&]*/,
'ssel'
+(i+1)+
'='
+ssel[i].options[ssel[i].selectedIndex].value);} else {url=url+
'&ssel'
+(i+1)+
'='
+ssel[i].options[ssel[i].selectedIndex].value;}}}}
if(schk){if(!schk.length){if(url.indexOf(
'&schk1='
) !=-1){url=url.replace(
/schk1=[^&]*/,(schk.checked?
'schk1='
+schk.value:
''
));} else {url=url+(schk.checked?
'&schk1='
+schk.value:
''
);}} else {for(var i=0;i<schk.length;i++){if(url.indexOf(
'&schk'
+(i+1)+
'='
) !=-1){url=url.replace(
"&schk"
+(i+1)+
'='
,
'&schk0='
);url=url.replace(
/schk0=[^&]*/,(schk[i].checked?
'schk'
+(i+1)+
'='
+schk[i].value:
''
));} else {url=url+(schk[i].checked?
'&schk'
+(i+1)+
'='
+schk[i].value:
''
);}}}}}
location.href=url;}
function list_search_default(form){var ssel=form.elements[
'SEARCH_SELECT[]'
];var schk=form.elements[
'SEARCH_CHECK[]'
];var stex=form.elements[
'SEARCH_TEXT[]'
];var url=location.href;if(form.elements[
'URL'
]){url=form.elements[
'URL'
].value;}
if(ssel){if(ssel.selectedIndex !=undefined){if(url.indexOf(
'&ssel1='
) !=-1){url=url.replace(
/ssel1=[^&]*/,
'ssel1='
+ssel.options[ssel.selectedIndex].value);} else {url=url+
'&ssel1='
+ssel.options[ssel.selectedIndex].value;}} else {for(var i=0;i<ssel.length;i++){if(url.indexOf(
'&ssel'
+(i+1)+
'='
) !=-1){url=url.replace(
"&ssel"
+(i+1)+
'='
,
'&ssel0='
);url=url.replace(
/ssel0=[^&]*/,
'ssel'
+(i+1)+
'='
+ssel[i].options[ssel[i].selectedIndex].value);} else {url=url+
'&ssel'
+(i+1)+
'='
+ssel[i].options[ssel[i].selectedIndex].value;}}}}
if(schk){if(!schk.length){if(url.indexOf(
'&schk1='
) !=-1){url=url.replace(
/schk1=[^&]*/,(schk.checked?
'schk1='
+schk.value:
''
));} else {url=url+(schk.checked?
'&schk1='
+schk.value:
''
);}} else {for(var i=0;i<schk.length;i++){if(url.indexOf(
'&schk'
+(i+1)+
'='
) !=-1){url=url.replace(
"&schk"
+(i+1)+
'='
,
'&schk0='
);url=url.replace(
/schk0=[^&]*/,(schk[i].checked?
'schk'
+(i+1)+
'='
+schk[i].value:
''
));} else {url=url+(schk[i].checked?
'&schk'
+(i+1)+
'='
+schk[i].value:
''
);}}}}
if(stex){if(!stex.length){if(url.indexOf(
'&stex1='
) !=-1){url=url.replace(
/stex1=[^&]*/,
'stex1='
+escape(stex.value));} else {url=url+
'&stex1='
+escape(stex.value);}} else {for(var i=0;i<stex.length;i++){if(url.indexOf(
'&stex'
+(i+1)+
'='
) !=-1){url=url.replace(
"&stex"
+(i+1)+
'='
,
'&stex0='
);url=url.replace(
/stex0=[^&]*/,
'stex'
+(i+1)+
'='
+escape(stex[i].value));} else {url=url+
'&stex'
+(i+1)+
'='
+stex[i].value;}}}}
location.href=url;}
function list_search_default_url(form,link){var ssel=form.elements[
'SEARCH_SELECT[]'
];var schk=form.elements[
'SEARCH_CHECK[]'
];var stex=form.elements[
'SEARCH_TEXT[]'
];var url=location.href;if(form.elements[
'URL'
]){url=form.elements[
'URL'
].value;}
if(ssel){if(ssel.selectedIndex !=undefined){if(url.indexOf(
'&ssel1='
) !=-1){url=url.replace(
/ssel1=[^&]*/,
'ssel1='
+ssel.options[ssel.selectedIndex].value);} else {url=url+
'&ssel1='
+ssel.options[ssel.selectedIndex].value;}} else {for(var i=0;i<ssel.length;i++){if(url.indexOf(
'&ssel'
+(i+1)+
'='
) !=-1){url=url.replace(
"&ssel"
+(i+1)+
'='
,
'&ssel0='
);url=url.replace(
/ssel0=[^&]*/,
'ssel'
+(i+1)+
'='
+ssel[i].options[ssel[i].selectedIndex].value);} else {url=url+
'&ssel'
+(i+1)+
'='
+ssel[i].options[ssel[i].selectedIndex].value;}}}}
if(schk){if(!schk.length){if(url.indexOf(
'&schk1='
) !=-1){url=url.replace(
/schk1=[^&]*/,(schk.checked?
'schk1='
+schk.value:
''
));} else {url=url+(schk.checked?
'&schk1='
+schk.value:
''
);}} else {for(var i=0;i<schk.length;i++){if(url.indexOf(
'&schk'
+(i+1)+
'='
) !=-1){url=url.replace(
"&schk"
+(i+1)+
'='
,
'&schk0='
);url=url.replace(
/schk0=[^&]*/,(schk[i].checked?
'schk'
+(i+1)+
'='
+schk[i].value:
''
));} else {url=url+(schk[i].checked?
'&schk'
+(i+1)+
'='
+schk[i].value:
''
);}}}}
if(stex){if(!stex.length){if(url.indexOf(
'&stex1='
) !=-1){url=url.replace(
/stex1=[^&]*/,
'stex1='
+escape(stex.value));} else {url=url+
'&stex1='
+escape(stex.value);}} else {for(var i=0;i<stex.length;i++){if(url.indexOf(
'&stex'
+(i+1)+
'='
) !=-1){url=url.replace(
"&stex"
+(i+1)+
'='
,
'&stex0='
);url=url.replace(
/stex0=[^&]*/,
'stex'
+(i+1)+
'='
+escape(stex[i].value));} else {url=url+
'&stex'
+(i+1)+
'='
+stex[i].value;}}}}
url=url.substring(url.indexOf(
"&"
));location.href=link+url;}
function list_orderby(name){var url=location.href;if(url.indexOf(
'&order='
) !=-1){url=url.replace(
/order=[^&]*/,
'order='
+escape(name));} else {url=url+
'&order='
+escape(name);}
location.href=url;}
function OpenFile(fileUrl){window.top.opener.SetUrl(fileUrl);window.top.close();window.top.opener.focus();}
function showImage(s_arquivo,n_largura,n_altura,s_titulo,s_id){var n_left=xPageX(s_id);var n_top=xPageY(s_id);xWidth(
'box_image_window'
,n_largura+14);xHeight(
'box_image_window'
,n_altura+14+20);xWidth(
'box_image'
,n_largura);xHeight(
'box_image'
,n_altura);xWidth(
'box_image_title'
,n_largura);xLeft(
'box_image_window'
,n_left);xTop(
'box_image_window'
,n_top);xInnerHtml(
'box_image'
,
'<a href="javascript:void(0)" onclick="javascript:closeImage()"><img src="'
+s_arquivo+
'" width="'
+n_largura+
'" height="'
+n_altura+
'" hspace="0" border="0" id="imgAlbumBig" /></a>'
);if (s_titulo){xInnerHtml(
'box_image_title'
,s_titulo);} else {xHide(
'box_image_title'
);}
xShow(
'box_image_window'
);scrollTo(n_left,n_top);}
function closeImage(){xHide(
'box_image_window'
);}
function preloadImages(){var d=document;if(d.images){if(!d.p) d.p=new Array();var i,j=d.p.length,a=preloadImages.arguments;for(i=0;i<a.length;i++)
if (a[i].indexOf(
"#"
)!=0){d.p[j]=new Image;d.p[j++].src=a[i];}}}
function showMenu(id,file){xGetElementById(id).src=
'/_resources/media/img/'
+file;}
function bannerClose(){xNoDisplay(
'banner_fly'
);}