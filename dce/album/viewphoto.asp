<%@ LANGUAGE="VBSCRIPT" %>


<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="include/gfxSpex.inc"-->
<!--#INCLUDE FILE="language/lang_viewphoto.inc"-->

<%
strimage 		= Request("i")
strfolder 		= Request("f")

If Session("sh") = "" Then
If Instr(Request.ServerVariables("HTTP_USER_AGENT"),"SV1") OR NOT FullScreen Then
SH = Request("sh")-53
Session("sh") = SH
Else
SH = Request("sh") - 35
Session("sh") = SH
End If
Else
SH = Session("sh")
End If
SW = Request("sw")

Set RS 			= Server.CreateObject("ADODB.RecordSet")
Set imageConn 	= Server.CreateObject ("ADODB.Connection")
imageConn.Open strConnect

SQL = "SELECT * FROM Descriptions " & _
"WHERE imagename ='" & strimage & _
"' AND folder ='" & Replace(strfolder,"'","''") &  _
"' "

RS.Open SQL, imageConn, adOpenStatic, adLockReadOnly, adCmdText

If RS.EOF And RS.BOF Then
strTitle = strimage
Else

If RS("description") <> "" Then
strtitle = ""
strdesc = RS("description")
Else
If RS("title") <> "" Then
strtitle = RS("title")
Else
strtitle = strimage
End If
End If

End If

If DateFormat = 1 Then
strdate			= USDate(igalleryNow)
ElseIf DateFormat = 2 Then
strdate			= EuroDate(igalleryNow)
Else
strdate 		= FormatDateTime(igalleryNow,2)
End If
strtime 		= FormatDateTime(igalleryNow,3)

Set CountConn = Server.CreateObject("ADODB.Connection")
Set cRS = Server.CreateObject("ADODB.Recordset")
CountConn.Open strConnect
Set cRS.ActiveConnection = CountConn
cRS.CursorType = adOpenStatic
cSQL = "SELECT ID, imagename, folder, title, description, dateadded, lasttime, lastdate, total FROM Descriptions WHERE imagename='"&strimage&"' AND folder='"&Replace(strfolder,"'","''")&"'"
cRS.Open cSQL,,,adCmdTable
If cRS.recordcount = 0 Then
cRS.AddNew
cRS("imagename") 	= strimage
cRS("folder") 		= strfolder
cRS("dateadded") 	= strdate
cRS("lasttime") 	= strtime
cRS("lastdate") 	= strdate
cRS("total") = 0
End If
cRS("lasttime") 	= strtime
cRS("lastdate") 	= strdate
cRS("total") = CLng(cRS("total")) + 1
cRS.Update
cRS.Close
CountConn.Close

'DotPosition = InStrRev(strimage, ".")
'FileExt = Mid(strimage,DotPosition + 1)
'FileExt = LCase(FileExt)
FileExt = fExt(strimage)
%>

<html>
<head>

<% If  Transition = 1 Then %>
<meta http-equiv="Page-Enter" content="progid:DXImageTransform.Microsoft.GradientWipe(duration=2)">
<% ElseIf Transition = 2 Then %>
<meta http-equiv="Page-Enter" content="progid:DXImageTransform.Microsoft.Pixelate(MaxSquare=25,Duration=1,Enabled=false)">
<% ElseIf Transition = 3 Then %>
<meta http-equiv="Page-Enter" content="progid:DXImageTransform.Microsoft.Fade(Duration=2)">
<% ElseIf Transition = 4 Then %>
<meta http-equiv="Page-Enter" content="progid:DXImageTransform.Microsoft.Slide(Duration=2)">
<% ElseIf Transition = 5 Then %>
<meta http-equiv="Page-Enter" content="progid:DXImageTransform.Microsoft.RandomDissolve(Duration=2)">
<% ElseIf Transition = 6 Then %>

<% End If %>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<style type="text/css">
<!--
body {
margin-bottom: 	0px;
margin-left: 	0px;
margin-right: 	0px;
margin-top: 	0px;

scrollbar-face-color: 		#F5F5F5; 
scrollbar-shadow-color: 	#F5F5F5;
scrollbar-highlight-color: 	#F5F5F5; 
scrollbar-3dlight-color: 	#9C9E9C;
scrollbar-darkshadow-color: #9C9E9C; 
scrollbar-track-color: 		#F4F4F2;
scrollbar-arrow-color: 		#838383;
}
.text {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 9pt; 
color: #000000;
}
.textmed {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 10pt; 
color: #ffffff;
}
.linkmed {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 10pt; 
color: #ffffff;
}
.header {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 11pt; 
color: #000000;
}
.toolbar {
border: 1px solid #DDDDDD; 
background-color: #DEE6EE;
}
.toobig {
position: absolute; 
left: 	20px; 
top: 	50px; 
width: 	200px; 
height: 48px; 
clip: 	rect(0,200,48,0); 
filter: alpha(opacity=100); 
-moz-opacity: 100%; 
z-index: 2;
}
-->
</style>

<script language="JavaScript1.2" type="text/javascript">
<!--
var agt = navigator.userAgent.toLowerCase();
function printImage1() {
if (window.print) {
setTimeout('window.print();',200);
}
else if (agt.indexOf("mac") != -1) {
alert("Press 'Cmd+p' on your keyboard to print photo.");
}
else {
alert("Press 'Ctrl+p' on your keyboard to print photo.")
}}

function printImage2(url) {
var pfwidth  = (screen.availWidth-70)
var pfheight = (screen.availHeight-140)
var hdesk = window.open(url,'printImage2','width=' + pfwidth + ',height=' + pfheight + ',scrollbars=no,resizable=yes,status=no,toolbar=yes,location=no,top=20,left=20');
}

function blurit() {
if (imgViewer.style.filter.indexOf('Blur')!=-1) {
imgViewer.style.filter = ''
} else {
imgViewer.style.filter = ''
imgViewer.style.filter = "progid:DXImageTransform.Microsoft.Blur(PixelRadius=5,MakeShadow=false);"
oPopup.hide();
}}

function emboss() {
if (imgViewer.style.filter.indexOf('Emboss')!=-1) {
imgViewer.style.filter = ''
} else {
imgViewer.style.filter = ''
imgViewer.style.filter = imgViewer.style.filter + "progid:DXImageTransform.Microsoft.Emboss();"
oPopup.hide();
}}

function engrave()
{
if (imgViewer.style.filter.indexOf('Engrave')!=-1) {
imgViewer.style.filter = ''
} else {
imgViewer.style.filter = ''
imgViewer.style.filter ="progid:DXImageTransform.Microsoft.Engrave();"
oPopup.hide();
}}

function grayscale() {
if (imgViewer.style.filter.indexOf('Grayscale=1')!=-1) {
imgViewer.style.filter = ''
} else {
imgViewer.style.filter = ''
imgViewer.style.filter = "progid:DXImageTransform.Microsoft.BasicImage(Rotation=0,Mirror=0,Invert=0,XRay=0,Grayscale=1,Opacity=1.00);"
oPopup.hide();
}}

function invert() {
if (imgViewer.style.filter.indexOf('Invert=1')!=-1) {
imgViewer.style.filter = ''
} else {
imgViewer.style.filter = ''
imgViewer.style.filter = "progid:DXImageTransform.Microsoft.BasicImage(Rotation=0,Mirror=0,Invert=1,XRay=0,Grayscale=0,Opacity=1.00);"
oPopup.hide();
}}

function mirror() {
if (imgViewer.style.filter.indexOf('Mirror=1')!=-1) {
imgViewer.style.filter = ''
} else {
imgViewer.style.filter = ''
imgViewer.style.filter = "progid:DXImageTransform.Microsoft.BasicImage(Rotation=0,Mirror=1,Invert=0,XRay=0,Grayscale=0,Opacity=1.00);"
oPopup.hide();
}}

function pixelate() {
if (imgViewer.style.filter.indexOf('Pixelate')!=-1) {
imgViewer.style.filter = ''
} else {
imgViewer.style.filter = ''
imgViewer.style.filter = "progid:DXImageTransform.Microsoft.Pixelate(maxsquare=5);"
oPopup.hide();
}}

function rotation() {
if (imgViewer.style.filter.indexOf('Rotation=2')!=-1) {
imgViewer.style.filter = ''
} else {
imgViewer.style.filter = ''
imgViewer.style.filter ="progid:DXImageTransform.Microsoft.BasicImage(Rotation=2,Mirror=0,Invert=0,XRay=0,Grayscale=0,Opacity=1.00);"
oPopup.hide();
}}

function xray() {
if (imgViewer.style.filter.indexOf('XRay=1')!=-1) {
imgViewer.style.filter = ''
} else {
imgViewer.style.filter = ''
imgViewer.style.filter = "progid:DXImageTransform.Microsoft.BasicImage( Rotation=0,Mirror=0,Invert=0,XRay=1,Grayscale=0,Opacity=1.00);"
oPopup.hide();
}}

function revert() {
imgViewer.style.filter = ''
imgViewer.style.width  = '<%= width %>';
imgViewer.style.height = '<%= height %>';
oPopup.hide();
}

<% If Instr(Request.ServerVariables("HTTP_USER_AGENT"),"SV1") OR NOT FullScreen Then %>
function fittoscreen(w,h){
if (w > h) { 
imgViewer.style.width  = (screen.width - 24)
imgViewer.style.height = (screen.height - 110)
oPopup.hide();
} else {
imgViewer.style.height = (screen.height - 110)
oPopup.hide();
}}
<% Else %>
function fittoscreen(w,h){
if (w > h) { 
imgViewer.style.width  = (screen.width - 19)
imgViewer.style.height = (screen.height - 57)
oPopup.hide();
} else {
imgViewer.style.height = (screen.height - 57)
oPopup.hide();
}}
<% End If %>

function scalepic(w,h,scale){
if (w > h) { 
imgViewer.style.width  = (w * scale)
imgViewer.style.height = (h * scale)
oPopup.hide();
} else {
imgViewer.style.height = (h * scale)
oPopup.hide();
}}
//-->
</script>

<script  language="JavaScript">
<!--
// ##### POP-UP AFTER 6.0+ VALIDATION #####
if (document.all && document.getElementById) {
var oPopup = window.createPopup();
function showMenu(menu, width, height) {
var lefter 		= event.clientX;
var leftoff 	= event.offsetX
var topper 		= event.clientY;
var topoff 		= event.offsetY;
var oPopBody 	= oPopup.document.body;
var HTMLContent = eval(menu).innerHTML
oPopBody.innerHTML = HTMLContent
oPopup.show(lefter - leftoff + 10, topper - topoff + 15, width, height, document.body);
return false;
}}

// ##### MOUSEOVER FOR BUTTONS #####
function button_over(eButton){
eButton.style.backgroundColor 	= "#C1D2EE";
eButton.style.borderColor 		= "darkblue darkblue darkblue darkblue";
eButton = null; 
}
function button_out(eButton){
eButton.style.backgroundColor 	= "#DEE6EE";
eButton.style.borderColor 		= "#DDDDDD #DDDDDD #DDDDDD #DDDDDD"; 
}
function button_down(eButton){
eButton.style.backgroundColor 	= "#98B5E2";
eButton.style.borderColor 		= "darkblue darkblue darkblue darkblue";
}
function button_up(eButton){
eButton.style.backgroundColor 	= "#C1D2EE";
eButton.style.borderColor 		= "darkblue darkblue darkblue darkblue";
eButton.style.cursor 			= "hand"; 
}
//-->
</script>

</head>

<%
dim appPath, fol, fc

appPath = UploadPath&"\"&Replace(strfolder,"/","\")
set fol = FSO.getfolder(appPath)
set fc  = fol.Files

' Count All Images
fcount="0"
Dim files
Set files = fol.Files
For Each file in files
If NOT InStr(file, "tn-") > 0 Then ' Hide NON-Thumnails In View
fcount=fcount+1
End If
Next

' Prev/Current/Next
icount = 0
for each f in fc
If NOT InStr(f, "tn-") > 0 Then ' Hide NON-Thumnails In View
icount = icount+1
If f.name = strimage then
If icount = fcount Then
strprev	= icount-1
stri 	= icount
strnext = 1
ElseIf icount = 1 Then
strprev	= fcount
stri 	= icount
strnext = icount+1
Else
strprev	= icount-1
stri 	= icount
strnext = icount+1
End If
exit for
end if
End If
next
%>

<%
If gfxSpex(appPath&"\"&f.name, width, height, colors, strType) = true then
End If
%>

<body background="images/gallery/bg<%= ViewerBG %>.gif">

<table width="100%" height="<%= SH %>" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td width="100%" height="<%= SH %>" align="center" valign="middle">

<table style="border:1px solid #9C9E9C;" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>

<table width="100%" border="0" cellspacing="0" cellpadding="2" align="center">
<tr>

<td bgcolor="#DEE6EE" nowrap style="cursor: hand;" onMouseOver="oPopup.hide();">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td class="toolbar" align="center" width="22" height="23" onMouseUp="button_up(this)" onMouseDown="button_down(this)" onMouseOver="button_over(this)" onMouseOut="button_out(this)" onClick="document.location='streamfile.asp?i=<%= URLSpace(strimage) %>&f=<%= URLSpace(Replace(strfolder,"'","\'")) %>';" nowrap><img src="images/gallery/download1.gif" width=22 height=23 border="0" alt="<%= IGvp_dimg %>"></td>
</tr>
</table>
</td>

<% 
If (ie) Then
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png"
%>
<td bgcolor="#DEE6EE" nowrap style="cursor: hand;" onMouseOver="oPopup.hide();">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
</tr>
</table>
</td>

<td bgcolor="#DEE6EE" nowrap style="cursor: hand;" onMouseOver="oPopup.hide();">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td class="toolbar" align="center" width="22" height="23" onMouseUp="button_up(this)" onMouseDown="button_down(this)" onMouseOver="button_over(this)" onMouseOut="button_out(this)" onClick="showMenu('printMenu',130,61);" nowrap><img src="images/gallery/print.gif" width=22 height=23 border="0" alt="<%= IGvp_pimg %>"></td>
</tr>
</table>
</td>
<%
End Select
End If
%>

<td bgcolor="<%= EndColor2 %>" align="center" width="100%" onMouseOver="oPopup.hide();" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=<%= StartColor2 %>,endColorStr=<%= EndColor2 %>);"><font class="textmed" style="color:<%= TitleColor %>">&nbsp;&nbsp;<% If strdesc <> "" Then %><a class="linkmed" style="color:<%= TitleColor %>" href="javascript:void(0);" onMouseOver="return escape('<%= strdesc %>')"><% End If %><b><%= strTitle %></b><% If strdesc <> "" Then %></a><% End If %>&nbsp;&nbsp;</font></td>

<% 
If (ie) Then
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png"
%>
<td bgcolor="#DEE6EE" nowrap style="cursor: hand;">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td class="toolbar" align="center" width="22" height="23" onMouseUp="button_up(this);" onMouseDown="button_down(this);" onMouseOver="button_over(this)" onMouseOut="button_out(this);" onClick="showMenu('zoomMenu',260,145);" nowrap><img src="images/gallery/zoom.gif" width=22 height=23 border="0" alt="<%= IGvp_rsmenu %>"></td>
</tr>
</table>
</td>

<td bgcolor="#DEE6EE" nowrap style="cursor: hand;">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td class="toolbar" align="center" width="22" height="23" onMouseUp="button_up(this);" onMouseDown="button_down(this);" onMouseOver="button_over(this)" onMouseOut="button_out(this);" onClick="showMenu('effectsMenu',120,285);" nowrap><img src="images/gallery/effects.gif" width=22 height=23 border="0" alt="<%= IGvp_aemenu %>"></td>
</tr>
</table>
</td>
<%
End Select
End If
%>

<td bgcolor="#DEE6EE" nowrap style="cursor:hand;" onMouseOver="oPopup.hide();" onClick="top.window.close();"><img src="images/gallery/close.gif" width=21 height=21 border="0" alt="<%= IGvp_close %>"></td>

</tr>
</table>

</td>
</tr>

<tr>
<td bgcolor="#ffffff">

<table cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF">
<tr>
<%
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png"
%>
<td><img id="imgViewer" src="<%= URLPath &"/"& strfolder %>/<%= strimage %>" border="0" alt="<%= strTitle %>"></td>
<%
Case "mid", "midi", "au", "aif", "aiff", "snd", "wav", "mp3", "mpga"
%>
<td style="padding:10px;" width="60" align="center"><img src="images/file-audio1.gif" height="60" width="60" border="0" alt="<%= IGvp_dwnaudio %>"></td>
<td><font class="header"><b><%= IGvp_audio %>&nbsp;&nbsp;</b></font></td>
<%
Case "avi", "mpg", "mpeg", "mov", "rm", "ram", "swf", "wmv", "qt"
%>
<td style="padding:10px;" width="60" align="center"><img src="images/file-video1.gif" height="60" width="60" border="0" alt="<%= IGvp_dwnvideo %>"></td>
<td><font class="header"><b><%= IGvp_video %>&nbsp;&nbsp;</b></font></td>
<%
Case Else
%>
<td style="padding:10px;" width="60" align="center"><img src="images/file-unknown.gif" height="60" width="82" border="0" alt="<%= IGvp_unknwn %>&nbsp;.<%= UCase(FileExt) %>&nbsp;<%= IGvp_f %>"></td>
<td><font class="header"><b><%= IGvp_unknwn %>&nbsp;<%= IGvp_f %>&nbsp;&nbsp;</b></font></td>
<%
End Select 
%>
</tr>
</table>

</td>
</tr>

<tr>
<td>

<table width="100%" border="0" cellspacing="0" cellpadding="3" align="center">
<tr>
<%
myvalue = strprev 
iprev = 0
for each f in fc
If NOT InStr(f, "tn-") > 0 AND NOT InStr(LCase(f), "thumbs.db") > 0 Then ' Hide NON-Thumnails In View
iprev = iprev+1
if iprev >= myvalue then
imageprev = f.name
exit for
end if
End If
next
%>
<td bgcolor="#DEE6EE" align="left" nowrap  nowrap style="cursor:hand;" onClick="document.location='viewphoto.asp?i=<%= URLSpace(imageprev) %>&f=<%= URLSpace(Replace(strfolder,"'","\'")) %>&sh=<%= SH %>'"  onmouseover="oPopup.hide();"><img src="images/gallery/prev.gif" width=18 height=18 border="0" alt="<%= IGvp_pi %>"></td>
<%
myvalue = strnext 
inext = 0
for each f in fc
If NOT InStr(f, "tn-") > 0 AND NOT InStr(LCase(f), "thumbs.db") > 0 Then ' Hide NON-Thumnails In View
inext = inext+1
if inext >= myvalue then
imagenext = f.name
exit for
end if
End if
next
%>

<% If Request("slide") = "on" Then %>
<SCRIPT LANGUAGE="JavaScript">
function redirect() {
window.location.href="viewphoto.asp?i=<%= imagenext %>&f=<%= Replace(strfolder,"'","\'") %>&sh="+screen.height+"&sw="+screen.width+"&slide=on"
}
setTimeout('redirect()',10000)
</script>
<% End If %>

<td bgcolor="<%= EndColor2 %>" width="100%" align="center" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=<%= StartColor2 %>,endColorStr=<%= EndColor2 %>);" onMouseOver="oPopup.hide();">
<table cellspacing="0" cellpadding="0" border="0">
<tr>

<% If SlideShow Then %>
<% If Request("slide") = "on" Then %>
<td><a class="linkmed" style="color:<%= TitleColor %>" href="viewphoto.asp?i=<%= strimage %>&f=<%= strfolder %>&sh=<%= SH %>"><b><%= IGvp_stop %></b></a><br><img src="images/spacer.gif" width=1 height=4 border="0" alt=""></td>
<% Else %>
<td><a class="linkmed" style="color:<%= TitleColor %>" href="viewphoto.asp?i=<%= imagenext %>&f=<%= strfolder %>&sh=<%= SH %>&slide=on"><b><%= IGvp_start %></b></a><br><img src="images/spacer.gif" width=1 height=4 border="0" alt=""></td>
<% End If %>
<% End If %>

</tr>
</table>
</td>

<td bgcolor="#DEE6EE" align="right" nowrap  nowrap style="cursor:hand;" onClick="document.location='viewphoto.asp?i=<%= URLSpace(imagenext) %>&f=<%= URLSpace(Replace(strfolder,"'","\'")) %>&sh=<%= SH %>'" onmouseover="oPopup.hide();"><img src="images/gallery/next.gif" width=18 height=18 border="0" alt="<%= IGvp_ni %>"></td>
</tr>
</table>

</td>
</tr>
</table>

</td>
</tr>
</table>

<%
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png"
%>
<script language="JavaScript">
<!--
ie  = (document.all && document.getElementById);
ns  = (!document.all && document.getElementById);
var opac2 = 100;

if (document.images) {
vprev = new Image();
vprev.src = "<%= URLPath &"/"& strfolder %>/<%= imageprev %>";
vnext = new Image();
vnext.src = "<%= URLPath &"/"& strfolder %>/<%= imagenext %>";
}

function fadeOut() {
if(opac2 > 0){
opac2-=1;
if (ie || ns) document.getElementById('fadeO').style.display = "block";
if(ie) document.getElementById('fadeO').filters.alpha.opacity = opac2;
if(ns) document.getElementById('fadeO').style.MozOpacity = opac2/100;
setTimeout('fadeOut()', 50);
}}

function waytobig() {
var w = <%= width %>;
var h = <%= height %>;
if(screen.availWidth>=w && screen.availHeight>=h) {
}
else {
<% If Instr(Request.ServerVariables("HTTP_USER_AGENT"),"SV1") OR NOT FullScreen Then %>
if (w/h > (screen.availWidth-24)/(screen.availHeight-110)) {
imgViewer.style.width = (screen.width - 24);
imgViewer.style.height = (screen.width - 24)*h/w;
}
else {
imgViewer.style.height = (screen.height - 110);
imgViewer.style.width = (screen.height - 110)*w/h;
}
<% Else %>
if (w/h > (screen.availWidth-19)/(screen.availHeight-57)) {
imgViewer.style.width = (screen.width - 19);
imgViewer.style.height = (screen.width - 19)*h/w;
}
else {
imgViewer.style.height = (screen.height - 57);
imgViewer.style.width = (screen.height - 57)*w/h;
}
<% End If %>
fadeOut();
}}
function init() {
waytobig();
}
window.onload = init;
//-->
</script>


<div id="fadeO" class="toobig" style="display: none;">
<table background="images/gallery/opop-bg.jpg" width="200" cellpadding="0" cellspacing="3">
<tr>
<td onClick="parent.revert();" style="font-family: Arial,Verdana; font-size: 8pt; color: #ffffff;padding-left: 3px; cursor: hand;">
<%= IGvp_rszmsg %><br>
</td>
</tr>
</table>
</div>

<!-- Begin Print Menu -->
<div id="printMenu" style="display: none;">
<table width="130" cellpadding="0" cellspacing="3" border="1" bordercolor="#dddddd" style="border-left: buttonhighlight 1px solid; border-right: buttonshadow 1px solid; border-top: buttonhighlight 1px solid; border-bottom: buttonshadow 1px solid;" bgcolor="#DEE6EE">
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.printImage1();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/print.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_p1 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.printImage2('<%= URLPath &"/"& Replace(strfolder,"'","\'") %>/<%= strimage %>');" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/print.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_p2 %></td>
</tr>
</table>
</td>
</tr>
</table>
</div>
<!-- End Print Menu -->

<!-- Begin Zoom Menu -->
<div id="zoomMenu" style="display: none;">
<table width="260" cellpadding="0" cellspacing="3" border="1" bordercolor="#dddddd" style="border-left: buttonhighlight 1px solid; border-right: buttonshadow 1px solid; border-top: buttonhighlight 1px solid; border-bottom: buttonshadow 1px solid;" bgcolor="#DEE6EE">
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.scalepic(<%= width %>,<%= height %>,'.25');" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/zoomout.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_zoom3 %></td>
</tr>
</table>
</td>
<td width="1" bgcolor="silver"></td>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.scalepic(<%= width %>,<%= height %>,'1.25');" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/zoomin.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_zoom4 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.scalepic(<%= width %>,<%= height %>,'.5');" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/zoomout.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_zoom2 %></td>
</tr>
</table>
</td>
<td width="1" bgcolor="silver"></td>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.scalepic(<%= width %>,<%= height %>,'1.5');" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/zoomin.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_zoom5 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.scalepic(<%= width %>,<%= height %>,'.75');" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/zoomout.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_zoom1 %></td>
</tr>
</table>
</td>
<td width="1" bgcolor="silver"></td>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.scalepic(<%= width %>,<%= height %>,'1.75');" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/zoomin.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_zoom6 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.fittoscreen(<%= width %>,<%= height %>);" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/fullscreen.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_zoom8 %></td>
</tr>
</table>
</td>
<td width="1" bgcolor="silver"></td>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.scalepic(<%= width %>,<%= height %>,'2');" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/zoomin.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_zoom7 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="3" class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.revert();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/actual-size.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_zoom9 %></td>
</tr>
</table>
</td>
</tr>
</table>
</div>
<!-- End Zoom Menu -->

<!-- Begin Effects Menu -->
<div id="effectsMenu" style="display: none;">
<table width="120" cellpadding="0" cellspacing="3" border="1" bordercolor="#dddddd" style="border-left: buttonhighlight 1px solid; border-right: buttonshadow 1px solid; border-top: buttonhighlight 1px solid; border-bottom: buttonshadow 1px solid;" bgcolor="#DEE6EE">
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.blurit();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/blur.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_eff1 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.emboss();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/emboss.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_eff2 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.engrave();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/engrave.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_eff3 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.grayscale();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/greyscale.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_eff4 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.invert();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/invert.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_eff5 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.mirror();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/mirror.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_eff6 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.pixelate();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/pixelate.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_eff7 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.rotation();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/flip.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_eff8 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.xray();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/xray.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_eff9 %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="toolbar" style="border: 1px solid #dddddd; cursor: hand;" align="center" height="23" onClick="parent.revert();" onMouseUp="parent.button_up(this)" onMouseDown="parent.button_down(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" nowrap>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="22" nowrap><img src="images/gallery/actual-size.gif" width=22 height=23 border="0" alt=""></td>
<td width="100%" style="font-family: Verdana; font-size: 10px;">&nbsp;<%= IGvp_eff10 %></td>
</tr>
</table>
</td>
</tr>
</table>
</div>
<!-- End Effects Menu -->
<%
End Select
%>

<script language="JavaScript" type="text/javascript" src="scripts/wz_tooltip.js"></script>  

</body>
</html>
