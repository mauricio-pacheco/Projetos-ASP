/*
js_main
js_main.js
By Newtenberg Publicaciones Digitales Limitada.
*/
var _ie=document.all ? 1 : 0;
var _ns4=document.layers ? 1 : 0;
var _dom=document.getElementById ? 1 : 0;

function getElement(n, doc) {
	var p,i,obj;
	if(!doc) doc=document;
	if(_dom) obj=doc.getElementById(n);
	if(!obj) {
		if(_ie) obj = doc.all[n]
		if(!obj) for(i=0;i<doc.forms.length;i++) obj=doc.forms[i][n];
		if(!obj && doc.layers) for(i=0;i<doc.layers.length;i++) obj=getElement(n,doc.layers[i].document);
	}
	return obj;
}

function getValue(obj) {
	if(obj.length) {
		var resp='';
		for(var i=0;i < obj.length;i++) {
			if((obj[i] && obj[i].checked) || (obj.options && obj.options[i].selected)) {
				if(resp!='') resp+=',';
				resp+=obj.options ? obj.options[i].value : obj[i].value;
			}
		}
		return resp;
	} else {
		return obj.value;
	}
}

function setValue(obj,value,concat) {
	var use_default=(arguments.length>1)?arguments[1]:false;
	if(isArray(obj)&&(typeof(obj.type)=="undefined")){
		for(var i=0;i<obj.length;i++){
			setSingleFieldValue(obj[i],value,concat);
		}
	} else {
		setSingleFieldValue(obj,value,concat);
	}
}

function setSingleFieldValue(obj,value,concat) {
	switch(obj.type){
		case 'radio': 
		case 'checkbox': 
			if(obj.value==value) {
				obj.checked=true;return true;
			} else {
				obj.checked=false;return false;
			}
		case 'text': 
		case 'hidden': 
		case 'textarea': 
		case 'password': 
			if(concat == true) {
				obj.value= obj.value + '' + value;
			}
			else {
				obj.value=value;
			}
			return true;
		case 'select-one': 
		case 'select-multiple': 
			var option = obj.options;
			for(var i=0; i<option.length; i++){
				if(option[i].value==value){
					option[i].selected=true;
				}
			}
			return true;
	}
	return false;
}

function isArray(obj){
	return(typeof(obj.length)=="undefined")?false:true;
}

function changeImage(imgname,link,doc) {
	if(!doc) doc=document;
	if(imgname) {
		var img=getElement(imgname,doc);
		if(img) {
			img.lastsrc=img.src;
			doc.lastimg=img;
			img.src=link;
		}
	} else {
		if( doc.lastimg ) {
			if( doc.lastimg.lastsrc ) doc.lastimg.src=doc.lastimg.lastsrc;
		}
	}
}

function toStringDate(format,y,m,d,h,mi,s) {
	if(y=='' || m=='' || d=='') {
		return '';
	}
	y*=1; m*=1; d*=1; h*=1; mi*=1; s*=1;
	if(y==0 && m==0 && d==0 && h==0 && mi==0 && s==0) {
		return '';
	}
	if(format == 'ISO') {
		m+=1;
		var r =  y2k(y) + '-' + padout(m) + '-' + padout(d);
		if(h!=0 && mi!=0 && s!=0) {
			r += ' ' + padout(h) + ':' + padout(mi) + ':' + padout(s);
		}
		return r;
	} else {
		// unixtime
		h+=4;
		var ut=Date.UTC(y,m,d,h,mi,s,0);
		ut*=1;
		ut/=1000;       
		return '' + ut;
	}
}

function parseURL(prop,doc) {
	var result = Object();
	if(!prop || prop=='') prop='hash';
	if(!doc) doc=document;
	if(doc.location[prop].length > 0) {
		hs=doc.location[prop].substring(1, doc.location[prop].length);
		var hsa=hs.split("&");
		for(var i=0; i<=hsa.length - 1; i++) {
			var left=hsa[i].substring(0, hsa[i].indexOf("="));
			if(left!='') {
				var right=hsa[i].substring(hsa[i].indexOf("=") + 1, hs.length);
				if(isNaN(right)) {
					right='"' + right + '"';
				}
				if(right!="") right=" = " + unescape(right);
				eval("result[unescape(left)] " + right);
			}
		}
	}
	return result;
}

function y2k(number) { return (number < 1000) ? number + 1900 : number; }
function padout(number) { return (number < 10) ? '0' + number : number; }
function makeArray0() { for (i = 0; i<makeArray0.arguments.length; i++) this[i] = makeArray0.arguments[i]; }

var monthName = new makeArray0('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
var monthDays = new makeArray0(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var weekdayShortName = new makeArray0('Dom','Lun','Mar','Mié','Jue','Vie','Sáb');

function getHTMLDateSelector(basename,Month,Year) {
	var output = '';
	output += '<form name="Cal"><table bgcolor="#C0C0C0" border="0"><tr><td align="left" width="100%">';
	output += '<font color="#0000BB" face="Arial" size="+1">' + monthName[Month] + ' ' + Year + '<\/font><\/td><td width="50%" align="right">';
	output += '<select name="Month" onChange="changeMonth();">';
	for(m=0; m<12; m++) {
		if(m==Month) output += '<option value="' + m + '" selected>' + monthName[m] + '<\/option>';
		else output += '<option value="' + m + '">'          + monthName[m] + '<\/option>';
	}
	output += '<\/select><select name="Year" onChange="changeYear();">';
	for(y=1900; y<2101; y++) {
		if(y==Year) output += '<option value="' + y + '" selected>' + y + '<\/option>'; else output += '<option value="' + y + '">'          + y + '<\/option>';
		}
	output += '<\/select><\/td><\/tr><tr><td align="center" colspan="2">';
	firstDay = new Date(Year,Month,1);
	startDay = firstDay.getDay();
	if(((Year % 4 == 0) && (Year % 100 != 0)) || (Year % 400 == 0))
		monthDays[1] = 29; 
	else
		monthDays[1] = 28;
	output += '<table cellspacing="0" cellpadding="0" border="1" bordercolordark="#FFFFFF" bordercolorlight="#C0C0C0"><tr>';
	for (i=0; i<7; i++)
		output += '<td width="50" align="center" valign="middle"><font size="-1" color="#000000" face="arial"><b>' + weekdayShortName[i] +'<\/b><\/font><\/td>';
	output += '<\/tr><tr align="center" valign="middle">';
	var column = 0;
	var lastMonth = Month - 1;
	if(lastMonth == -1) lastMonth = 11;
	for(i=0; i<startDay; i++, column++)
		output += '<td width="50" height="30"><font size="-1" color="#808080" face="arial">' + (monthDays[lastMonth]-startDay+i+1) + '<\/font><\/td>';
	for(i=1; i<=monthDays[Month]; i++, column++) {
		output += '<td width="50" height="30">' + '<a href="javascript:changeDay(' + i + ')"><font size="-1" face="arial" color="#0000ff">' + i + '<\/font><\/a>' +'<\/td>';
		if (column == 6) {
			output += '<\/tr><tr align="center" valign="middle">';
			column = -1;
		}
	}
	if(column > 0) {
		for(i=1; column<7; i++, column++)
			output +=  '<td width="50" height="30"><font size="-1" color="#808080" face="arial">' + i + '<\/font><\/td>';
	}
	output += '<\/tr><\/table><\/form><\/td><\/tr><\/table>';
	output +='<script type="text/javascript">';
	output += " function changeDay(day) { opener." + basename + "Day = day + ''; opener." + basename + "restart(); self.close; } ";
	output += " function changeMonth() { opener." + basename + "Month = document.Cal.Month.options[document.Cal.Month.selectedIndex].value + ''; opener." + basename + "NewCalWindow(true); } ";
	output += " function changeYear() { opener." + basename + "Year = document.Cal.Year.options[document.Cal.Year.selectedIndex].value + ''; opener." + basename + "NewCalWindow(true); } ";
	output +='<\/script>';
	return output;
}
