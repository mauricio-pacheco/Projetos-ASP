<HTML 
lang=pt-br xml:lang="pt-br" xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>Companhia do Uniforme</TITLE>
<META content=Autobraz name=description>
<META content=pt-BR name=language>
<META content="" name=keywords>
<SCRIPT language=JavaScript type=text/javascript>
function horas(){
	var now = new Date();
	var hours = now.getHours();
	var minutes = now.getMinutes();
	var seconds = now.getSeconds()
	if (hours <=9)
hours="0"+hours;
	if (minutes<=9)
minutes="0"+minutes;
	if (seconds<=9)
seconds="0"+seconds;
	var cdate="<font color=#ffffff size=1 face=verdana>"+hours+":"+minutes+":"+seconds+" "+"</font>" 
	clock.innerHTML= cdate;
setTimeout("horas()",1000);
}
</SCRIPT>
<META http-equiv=content-type content="text/html; charset=ISO-8859-1"><LINK 
href="/_resources/media/img/favicon.ico" rel="shortcut icon"><LINK 
href="home_arquivos/stylesheet.css" rel=stylesheet>
<SCRIPT language=javascript src="home_arquivos/scripts.js" type=text/javascript></SCRIPT>
<META content="MSHTML 6.00.2900.2180" name=GENERATOR></HEAD>