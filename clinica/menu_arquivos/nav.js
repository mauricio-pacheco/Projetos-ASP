//generic MM stuff
var menu_array = new Array('company','company1','products','product1','product2','product3','product4','product5','product6','product7','product8','product9','product10','product11','product12','product13','services','solutions','solutions1','solutions2','solutions3','solutions4','solutions5','press','investor','contact','investor1','hide')

function hideAllLayers(k) {
	for (i=0; i<menu_array.length; i++)
	{
		if (menu_array[i]!=k)
			MM_showHideLayers(menu_array[i],'','hide');
	}
	//resetTopMenu('all');
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

//Nav related functions
function fncMenu(objTR, objHREF,strStyle){
	//alert(objTR);
	//alert(objHREF);
	objTR.className=strStyle;
	objHREF.className=strStyle;
	
}

function CB_Show(){
  var i,p,v,obj,args=CB_Show.arguments;
  
  hideAllLayers(args[0]);

  for (i=0; i<(args.length); i++){ 
	 if ((obj=MM_findObj(args[i]))!=null) { 
		if (obj.style) { 
			obj=obj.style; 
		}
		obj.visibility='visible'; 
	}
  }
}

var Mac=(navigator.appVersion.indexOf("Mac")!=-1)? true:false;
var	Win=(navigator.appVersion.indexOf("Win")!=-1)? true:false;
var Opera=(navigator.userAgent.indexOf("Opera")!=-1)? true:false;
var IE = (document.all && window.print && !Opera) ? true : false;