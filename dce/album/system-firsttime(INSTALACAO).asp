<%@ LANGUAGE="VBSCRIPT" %>


<!--#include file = "include/adovbs.inc"-->
<!--#include file = "include/connection.inc"-->
<!--#INCLUDE FILE = "language/lang_global.inc"-->
<!--#INCLUDE FILE="language/lang_system.inc"-->

<%
'########## Database Write Permission Verification ##########
Dim DBPath

If SMPConn Then
DBPath = Server.MapPath(Replace(DBLocation,"igallery.mdb",""))
ElseIf DirectConn Then
DBPath = Replace(DBLocation,"igallery.mdb","")
End If

function TestDB()
TestDB = ""
Set fso = Server.CreateObject("Scripting.FileSystemObject")
if not fso.FolderExists(DBPath) then
response.redirect "error.asp?mode=folder"
exit function
else
TestDB = True
end if
fileName = DBPath & "\dbtest.txt"
on error resume next
Set testFile = fso.CreateTextFile(fileName, true)
If Err.Number<>0 then
response.redirect "error.asp?mode=write"
exit function
else
TestDB = True
end if
Err.Clear
testFile.Close
end function
TestDB()
'########## End Database Write Permission Verification ##########
%>

<%
Dim SysConn,SysRec,GalleryName,UploadPath,URLPath,NailerApp,DllPath,DateFormat,RecordsPerPage,MaxUploadSize,MailServer,MailAddress,EmailApp,Anonymous,MessageBoard,AllowedFiles,TitleMax,Vote,ToolBar,DescMax,Description,SlideShow,DelaySpeed,Transition,StartColor1,EndColor1,StartColor2,EndColor2,TitleColor,DateColor,FullScreen,ViewerBG
Set SysConn 	= Server.CreateObject ("ADODB.Connection")
SysConn.Open strConnect
Set SysRec 		= SysConn.Execute ("SELECT * FROM System;")
GalleryName 	= SysRec("GalleryName")
UploadPath 		= SysRec("UploadPath")
URLPath 		= SysRec("URLPath")
NailerApp 		= SysRec("NailerApp")
DllPath 		= SysRec("DllPath")
DateFormat 		= SysRec("DateFormat")
RecordsPerPage	= SysRec("RecordsPerPage")
MaxUploadSize   = SysRec("MaxUpload")
MailServer 		= SysRec("EmailServer")
MailAddress		= SysRec("EmailAddress")
EmailApp		= SysRec("EmailApp")
Anonymous		= SysRec("Anonymous")
MessageBoard	= SysRec("MessageBoard")
AllowedFiles	= SysRec("AllowedFiles")
TitleMax		= SysRec("TitleMax")
Vote			= SysRec("Vote")
ToolBar			= SysRec("ToolBar")
DescMax			= SysRec("DescMax")
Description	    = SysRec("Description")
SlideShow		= SysRec("SlideShow")
DelaySpeed		= SysRec("DelaySpeed")
Transition	    = SysRec("Transition")
StartColor1 	= SysRec("StartColor1")
EndColor1  		= SysRec("EndColor1")
DateColor 		= SysRec("DateColor")
StartColor2 	= SysRec("StartColor2")
EndColor2  		= SysRec("EndColor2")
TitleColor 		= SysRec("TitleColor")
FullScreen		= SysRec("FullScreen")
ViewerBG		= SysRec("ViewerBG")
%>

<%
'########## Image Directory Permission Verification ##########
function TestEnvironment()
TestEnvironment = ""
Set fso = Server.CreateObject("Scripting.FileSystemObject")
if not fso.FolderExists(UploadPath) then
TestEnvironment = IGsys_idpv1
exit function
end if
fileName = UploadPath & "\test.txt"
on error resume next
Set testFile = fso.CreateTextFile(fileName, true)
If Err.Number<>0 then
TestEnvironment = IGsys_idpv2
exit function
end if
Err.Clear
testFile.Close
fso.DeleteFile(fileName)
If Err.Number<>0 then
TestEnvironment = IGsys_idpv3
exit function
end if
Err.Clear
Set streamTest = Server.CreateObject("ADODB.Stream")
If Err.Number<>0 then
TestEnvironment = IGsys_idpv4
exit function
end if
Set streamTest = Nothing
end function

Dim igalleryNow
igalleryNow = Now

Function URLSpace(s)
URLSpace = replace(replace(s,"+","%2B")," ","+")
End Function
'########## End Image Directory Permission Verification ##########
%>

<html>
<head>

<title>.:: Galeria de Fotos da Vitrola ::.</title>

<link rel="stylesheet" type="text/css" href="style/style.css">

<script language="JavaScript">
<!--
function OpenPopup(url,pwidth,pheight) {
var leftPos = (screen.availWidth-pwidth) / 2
var topPos = (screen.availHeight-pheight) / 2 
var vpop = window.open(url,'votepop','width=' + pwidth + ',height=' + pheight + ',scrollbars=yes,resizable=no,status=no,toolbar=no,location=no,top=' + topPos + ',left=' + leftPos);
if (window.focus) vpop.window.focus();
}

function checkOption() {
if (document.forms.system.nailerapp.value==3)
document.getElementById("additionalFields").style.display = "block";
else
document.getElementById("additionalFields").style.display = "none";
}

function checkOption1() {
if (document.forms.system.emailapp.value==1)
document.getElementById("additionalFields1").style.display = "block";
else if (document.forms.system.emailapp.value==2)
document.getElementById("additionalFields1").style.display = "block";
else if (document.forms.system.emailapp.value==3)
document.getElementById("additionalFields").style.display = "block";
else if (document.forms.system.emailapp.value==10)
document.getElementById("additionalFields1").style.display = "block";
else
document.getElementById("additionalFields1").style.display = "none";
}

<% If NOT NailerApp = 3 Then %>
function doLoad() {
document.getElementById("additionalFields").style.display = "none";
}
window.onload = doLoad;
<% End If %>
//-->
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="760" cellspacing="0" cellpadding="0" border="0">

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/header.asp"--></td>
</tr>

<tr>
<td style="padding-top:7px;" width="200" valign="top">

<% 
diagnostics = TestEnvironment()
If diagnostics <> "" Then
%>
<div align="center">
<font style="font-family: Verdana, Arial, Helvetica; font-size: 14pt; color: #CC0000;"><b><%= IGsys_ps %></b></font>
</font>
</div>
<font class="textsm">
<%= IGsys_psmsg %><br>
</font>
<% Else %>
<div align="center">
<font style="font-family: Verdana, Arial, Helvetica; font-size: 14pt; color: #5AAD7B;"><b>GOOD TO GO!</b></font>
</font>
</div>
<font class="textsm">
<%= IGsys_gtgmsg1 %>
<p>
<%= IGsys_gtgmsg2 %><br><br>
<div align="center">
<a class="link" href="igallery.asp"><b><%= IGsys_gtgmsg3 %></b></a><br>
<div>
</font>
<% End If %>

<img src="images/spacer.gif" width=200 height=5 border=0 alt=""><br>

</td>

<td width="20" valign="top"><img src="images/spacer-bevel.gif" width=20 height=235 border=0 alt=""></td>
<td style="padding-left:10px;padding-top:15px;" width="530" valign="top">

<font class="text">

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b>i-Gallery <%= IGsys_sec2 %></b></font>
<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<%= IGsys_sftmsg1 %>

<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
<font class="textxsm">
<%= IGsys_sftmsg2 %><br>
</font>
<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>

<% If Request("mode") = "update" Then %>

<% 
struploadpath 		= LCase(Request("uploadpath"))
If Right(struploadpath,1) = "\" Then struploadpath = Left(struploadpath,len(struploadpath)-1)
If struploadpath 	<> "" Then struploadpath = struploadpath Else struploadpath = UploadPath
strurlpath 			= LCase(Request("urlpath"))
If Right(strurlpath,1) = "/" Then strurlpath = Left(strurlpath,len(strurlpath)-1)
If strurlpath 		<> "" Then strurlpath = strurlpath Else strurlpath = URLPath
stremailserver 		= Request("mailserver")
If stremailserver 	<> "" Then stremailserver = stremailserver Else stremailserver = MailServer
stremailaddress 	= Request("emailaddress")
If stremailaddress 	<> "" Then stremailaddress = stremailaddress Else stremailaddress = MailAddress

SQL = "UPDATE System SET "

SQL = SQL & "UploadPath			='" & struploadpath & "',"
SQL = SQL & "URLPath			='" & strurlpath & "',"
SQL = SQL & "NailerApp			='" & Request("nailerapp") & "',"
SQL = SQL & "DllPath			='" & Request("dllpath") & "',"
SQL = SQL & "DateFormat			='" & Request("dateformat") & "',"
SQL = SQL & "RecordsPerPage		='" & Request("recordsperpage") & "',"
SQL = SQL & "MaxUpload			='" & Request("maxuploadsize") & "',"
SQL = SQL & "EmailServer		='" & stremailserver & "',"
SQL = SQL & "EmailAddress		='" & stremailaddress & "',"
SQL = SQL & "EmailApp			='" & Request("emailapp") & "' "

SysConn.Execute(SQL)

'response.redirect "system-firsttime.asp"

%>

<SCRIPT LANGUAGE="JavaScript">
<!--
function redirect() {
window.location.href="system-firsttime.asp"
}
setTimeout('redirect()',0)
// -->
</script>

<% Else %>

<table width="510" cellspacing="0" cellpadding="0" border="0">
<form name="system" action="system-firsttime.asp?mode=update" method="post">

<tr>
<td colspan="2">
<hr size="1" color="silver">
<font class="textmed"><%= IGsys_data %>:<br></font>
<font class="textsm"><%= IGsys_datamsg %><br></font>
<img src="images/spacer.gif" width=1 height=4 border=0 alt=""><br>
<%
If SMPConn Then
DBFolderPath = Server.MapPath(Replace(DBLocation,"igallery.mdb",""))
ElseIf DirectConn Then
DBFolderPath = Replace(DBLocation,"igallery.mdb","")
End If

function TestDBFolder()
TestDBFolder = ""
Set fso = Server.CreateObject("Scripting.FileSystemObject")
fileName = DBFolderPath & "\dbtest.txt"
on error resume next
Set testFile = fso.CreateTextFile(fileName, true)
testFile.Close
fso.DeleteFile(fileName)
If Err.Number<>0 then
TestDBFolder = IGsys_modmsg
exit function
end if
Err.Clear
end function
diagnostics = TestDBFolder()
%>
</td>
</tr>
<tr>
<td height="22"><font class="text"><%= IGsys_datapth %>:&nbsp;</td>
<td><font class="text" style="background-color: #f0f0f0;">
<%
If SMPConn Then
DBFolderPath = Server.MapPath(Replace(DBLocation,"igallery.mdb",""))
ElseIf DirectConn Then
DBFolderPath = Replace(DBLocation,"igallery.mdb","")
End If
%>
<%= DBFolderPath %>
</font></td>
</tr>
<tr>
<td valign="top"><font class="text"><%= IGsys_prop1 %>:&nbsp;</td>
<td><font class="text" style="background-color: #f0f0f0;"><% If diagnostics <> "" Then %><%= IGsys_prop1a %><% Else %><%= IGsys_prop1b %><% End If %><br></font>
<% If diagnostics <> "" Then response.write diagnostics End If %>
<img src="images/spacer.gif" width=1 height=4 border=0 alt=""><br>
</td>
</tr>

<tr>
<td colspan="2">
<hr size="1" color="silver">
<font class="textmed"><%= IGsys_sec1 %>:<br></font>
<font class="textsm"><%= IGsys_sec1msg %><br></font>
<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
</td>
</tr>

<tr>
<td><font class="text"><%= IGsys_form2 %>:&nbsp;</td>
<td><input class="textsm" name="uploadpath" size="60" value="<%= UploadPath %>"></td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm" style="color: #CC0000;">
<% 
Dim diagnostics
diagnostics = TestEnvironment()
If diagnostics <> "" Then
response.write diagnostics&"<br>"
End If 
%>
</font>
<font class="textxsm"><b><%= IGsys_ex %>:</b> c:\inetpub\wwwroot\<b><%= IGsys_mf %></b><br></font>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td><font class="text"><%= IGsys_form3 %>:&nbsp;</td>
<td><input class="textsm" name="urlpath" size="60" value="<%= URLPath %>"></td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note3 %><br>
<b><%= IGsys_ex %>:</b> <%= "http://" & Request.ServerVariables("SERVER_NAME") %>/<b><%= IGsys_mf %></b><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td colspan="2">
<hr size="1" color="silver">
<font class="textmed"><b><%= IGsys_sec2 %>:</b><br></font>
<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
</td>
</tr>

<tr>
<td><font class="text"><%= IGsys_form4 %>:&nbsp;</td>
<td>
<select class="textsm" name="nailerapp" size="1" onChange="checkOption();">
<option value="1" <% If NailerApp = "1" Then response.write "selected" %>><%= IGsys_form4a %></option>
<option value="2" <% If NailerApp = "2" Then response.write "selected" %>><%= IGsys_form4b %></option>
<option value="3" <% If NailerApp = "3" Then response.write "selected" %>><%= IGsys_form4c %></option>
<option value="4" <% If NailerApp = "4" Then response.write "selected" %>><%= IGsys_form4d %></option>
</select>
<a class="linksm" href="javascript:void(0);" onClick="OpenPopup('comcheck.asp?mode=nailer','310','140')"><%= IGsys_form4e %></a><br>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note4 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr id="additionalFields">
<td colspan="2">

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="124" nowrap><font class="textsm"><%= IGsys_form5 %>:&nbsp;</td>
<td><input class="textsm" name="dllpath" size="60" value="<%= DLLPath %>"></td>
</tr>
<tr>
<td></td>
<td>
<font class="textxsm">
<b><%= IGsys_ex %>:</b> <%= "http://" & Request.ServerVariables("SERVER_NAME") %><b>/cgi-bin/Imager.dll</b><br><%= IGsys_note5 %><br>
<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>
</td>
</tr>
</table>

</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form6 %>:&nbsp;</td>
<td>
<select class="textsm" name="dateformat" size="1">
<option value="1" <% If DateFormat = "1" Then response.write "selected" %>>MM/DD/YYYY - U.S.</option>
<option value="2" <% If DateFormat = "2" Then response.write "selected" %>>DD/MM/YYYY - EURO</option>
</select><br>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note6 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form9 %>:&nbsp;</td>
<td>
<select class="textsm" name="recordsperpage" size="1">
<option value="<%= RecordsperPage %>"><%= RecordsperPage %></option>
<option value="<%= RecordsperPage %>">- - - - -</option>
<option value="6">6</option>
<option value="12">12</option>
<option value="18">18</option>
<option value="24">24</option>
<option value="30">30</option>
<option value="36">36</option>
<option value="42">42</option>
<option value="48">48</option>
</select><br>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note9a %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form10 %>:&nbsp;</td>
<td>
<select class="textsm" name="maxuploadsize" size="1">
<option value="25600" <% If MaxUploadSize = "25600" Then response.write "selected" %>>25 KB</option>
<option value="51200" <% If MaxUploadSize = "51200" Then response.write "selected" %>>50 KB</option>
<option value="102400" <% If MaxUploadSize = "102400" Then response.write "selected" %>>100 KB</option>
<option value="512000" <% If MaxUploadSize = "512000" Then response.write "selected" %>>500 KB</option>
<option value="1048576" <% If MaxUploadSize = "1048576" Then response.write "selected" %>>1 MB</option>
<option value="2097152" <% If MaxUploadSize = "2097152" Then response.write "selected" %>>2 MB</option>
<option value="5242880" <% If MaxUploadSize = "5242880" Then response.write "selected" %>>5 MB</option>
<option value="10485760" <% If MaxUploadSize = "10485760" Then response.write "selected" %>>10 MB</option>
</select><br>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note10 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td><font class="text"><%= IGsys_form11 %>:&nbsp;</td>
<td><input class="textsm" name="emailaddress" size="30" value="<%= MailAddress %>"></td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note11 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td><font class="text"><%= IGsys_form12 %>:&nbsp;</td>
<td><input class="textsm" name="mailserver" size="30" value="<%= MailServer %>"></td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note12 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td><font class="text"><%= IGsys_form13 %>:&nbsp;</td>
<td>
<select class="textsm" name="emailapp" size="1" onChange="checkOption1();">
<option value="0">Choose One</option>
<option value="1" <% If EmailApp = "1" Then response.write "selected" %>>ASPMail</option>
<option value="2" <% If EmailApp = "2" Then response.write "selected" %>>ASPEmail</option>
<option value="3" <% If EmailApp = "3" Then response.write "selected" %>>CDONTS</option>
<option value="10" <% If EmailApp = "10" Then response.write "selected" %>>CDOSYS</option>
<option value="4" <% If EmailApp = "4" Then response.write "selected" %>>Dynu Email</option>
<option value="5" <% If EmailApp = "5" Then response.write "selected" %>>W3 Jmail v4.1</option>
<option value="6" <% If EmailApp = "6" Then response.write "selected" %>>W3 Jmail v4.1 (HTML)</option>
<option value="7" <% If EmailApp = "7" Then response.write "selected" %>>Simple Mail</option>
<option value="8" <% If EmailApp = "8" Then response.write "selected" %>>OCXMail</option>
<option value="9" <% If EmailApp = "9" Then response.write "selected" %>>VSMail 1.x</option>
</select>
<a class="linksm" href="javascript:void(0);" onClick="OpenPopup('comcheck.asp?mode=email','280','290')"><%= IGsys_form13a %></a><br>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note13 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr id="additionalFields1">
<td colspan="2">
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td nowrap><font class="text"><%= IGsys_form14 %>:&nbsp;</td>
<td>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td valign="top"><input type="radio" name="anonymous" value="1" <% If Anonymous Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_yes %>&nbsp;&nbsp;</font></td>
<td valign="top"><input type="radio" name="anonymous" value="0" <% If NOT Anonymous Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_no %>&nbsp;&nbsp;</font></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note14 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>
</table>
</td>
</tr>

<tr>
<td colspan="2">
<hr size="1" color="silver">
<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>
</td>
</tr>

<tr>
<td colspan="2"><input class="button" style="font-size: 8.5pt;" type="submit" value="<%= IGsys_but %>"></td>
</tr></form>
</table>

<br><br>

<% End If %>

</font>

</td>
</tr>
</table>

</body>
</html>

