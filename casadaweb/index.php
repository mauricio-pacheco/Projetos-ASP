<HTML><HEAD><TITLE>Casa da Web</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META 
content="Empresa destinada ao marketing digital: web design profissional, design, design gráfico, apresentação e animações em flash, soluções em comércio eletrônico, programação web" 
name=description>
<META 
content="web, site, design, website, web design, desenvolvimento, página, empresa, internet, portal, profissional, grafica, flash, comércio eletrônico, Frederico Westphalen, Rio Grande do Sul, firma" 
name=keywords>
<META content="Casa da Web" name=author>
<META 
content="Casa da Web - Soluções em Marketing Digital - Frederico Westphalen/RS" 
name=copyright>
<META content=English name=language>
<META content="All, FOLLOW" name=robots><LINK href="index_arquivos/style.css" 
type=text/css rel=stylesheet>
<script language="Javascript">
<!--
// 
//

function initArray(n) {
  this.length = n;
  for (var i =1; i <= n; i++) {
    this[i] = ' '
  }
}

slide = new initArray(4)
slide[0]="Casa da Web"
slide[1]="Websites - Multimidia - Banners - Animações"
slide[2]="Comércio Eletrônico - Portais Corporativos - Audio Visual"
slide[3]="Soluções em Marketing Digital!"

var delay1 = 3
var delay2 = 3000

var text = slide[0] + " "
var str = " " 
var leftmsg = "" 
var nextmsg = 0

function setMessage() {
    
if (str.length == 1) {

while (text.substring(0, 1) == " ") {

leftmsg += str
str = text.substring(0, 1)
text = text.substring(1, text.length) 
}

leftmsg += str            
str = text.substring(0, 1)
text = text.substring(1, text.length) 

for (var x = 0; x < 120; x++) {
str = " " + str
}
}

else {
str = str.substring(10, str.length)
}

window.status = leftmsg + str

if (text == "") {

str = " "
nextmsg++

if (nextmsg > slide.length) {
nextmsg = 0
}

text = slide[nextmsg] + " "
leftmsg = ""  

setTimeout('setMessage()',delay2)
}

else {
setTimeout('setMessage()',delay1)
}
}

setMessage();
//-->
</script>
<SCRIPT src="index_arquivos/chgimg.js"></SCRIPT>
<SCRIPT src="index_arquivos/preload.js"></SCRIPT>
<script language="JavaScript1.2">
if (document.all){
actualtitle=document.title;
var scroller; 
var ampm;
function antiMilitaryTime()
{
if (hr == "12"){
ampm="p.m."
}
else if (hr == "13"){
hr="1"
ampm="p.m."
}
else if (hr == "14"){
hr="2"
ampm="p.m."
}
else if (hr == "15"){
hr ="3"
ampm="p.m."
}
else if (hr == "16"){
hr = "4"
ampm="p.m."
}
else if (hr == "17"){
hr = "5"
ampm="p.m."
}
else if (hr == "18"){
hr = "6"
ampm="p.m."
}
else if (hr == "19"){
hr = "7"
ampm="p.m."
}
else if (hr == "20"){
hr = "8"
ampm="p.m."
}
else if (hr == "21"){
hr = "9"
ampm="p.m."
}
else if (hr == "22"){
hr = "10"
ampm="p.m."
}
else if (hr == "23"){
hr = "11"
ampm="p.m."
}
else if (hr == "24"){
hr = "12"
}
}
function addZero(){
if (min <= 9){
min = "0"+min
}
if (sec <= 9){
sec = "0"+sec
}
if (hr <= 9){
hr = "0"+hr
}
}
function time(){
dt=new Date()
date=dt.getDate()
month=dt.getMonth()
month=month+1
sec=dt.getSeconds()
hr=dt.getHours()
yr=dt.getYear()
ampm="A.M."
min=dt.getMinutes()
}
function scroll() {
time()
antiMilitaryTime()
addZero()
var scroller=" - HOJE: "+date+"/"+month+"/"+yr
var scroller2=" - HORA: "+hr+":"+min+":"+sec+" "+ampm
var timeout=setTimeout("scroll()", 1)
scroller=scroller+scroller2
  document.title = actualtitle+" "+scroller
  }
var timeout=setTimeout('scroll()',1000);
}
else{

}
</script>
<META content="MSHTML 6.00.2900.2180" name=GENERATOR><style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
.style1 {color: #0099CC}
-->
</style></HEAD>
<BODY text=#000000 leftMargin=0 topMargin=0 marginheight="0" 
marginwidth="0">
<p>&nbsp;</p>
<p align="center"><img src="fantasma.gif" width="160" height="160"></p>
<p align="center"><img src="aaaa.jpg" width="339" height="97"></p>
<p align="center"><img src="constru07.gif" width="40" height="40"></p>
<p align="center">Em constru&ccedil;&atilde;o...</p>
<table width="214" border="0" align="center">
  <tr>
    <td width="17"><img src="msn.gif" width="17" height="16"></td>
    <td width="35">&nbsp;<span class="style1">MSN:&nbsp;</span> </td>
    <td width="311">mandry@casadaweb.net</td>
  </tr>
</table>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
</BODY></HTML>
