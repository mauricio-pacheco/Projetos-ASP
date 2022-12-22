<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/security-admin.inc"-->
<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="include/testenvironment.asp"-->
<!--#INCLUDE FILE="language/lang_global.inc"-->
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

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<link rel="stylesheet" type="text/css" href="style/style.css">

<script language="JavaScript">
<!--
function OpenPopup(url,pwidth,pheight) {
var leftPos = (screen.availWidth-pwidth) / 2
var topPos = (screen.availHeight-pheight) / 2 
var vpop = window.open(url,'votepop','width=' + pwidth + ',height=' + pheight + ',scrollbars=yes,resizable=no,status=no,toolbar=no,location=no,top=' + topPos + ',left=' + leftPos);
if (window.focus) vpop.window.focus();
}
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
oPopup.show(lefter - leftoff - width-59, topper - topoff -15, width, height, document.body);
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

function showColor(oBox,oColor) {
oBox.innerHTML = oColor.style.backgroundColor.toUpperCase();
oBox.style.backgroundColor = oColor.style.backgroundColor
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

<!--#INCLUDE FILE="include/menu.asp"-->
<img src="images/spacer.gif" width=200 height=5 border=0 alt=""><br>

</td>

<td width="20" valign="top"><img src="images/spacer-bevel.gif" width=20 height=235 border=0 alt=""></td>
<td style="padding-left:10px;padding-top:15px;" width="530" valign="top">

<font class="text">

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGsys_titl %></b></font><br>

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
strtitlemax 		= Request("titlemax")
If strtitlemax 		<> "" Then strtitlemax = strtitlemax Else strtitlemax = TitleMax
strdescmax 			= Request("descmax")
If strdescmax 		<> "" Then strdescmax = strdescmax Else strdescmax = DescMax

strfoldersperrow	= Request("foldersperrow")
If strfoldersperrow <> "" Then strfoldersperrow = strfoldersperrow Else strfoldersperrow = 4

strrecordsperrow	= Request("recordsperrow")
If strrecordsperrow <> "" Then strrecordsperrow = strrecordsperrow Else strrecordsperrow = 3
strrecordsperpage	= Request("recordsperpage")
If strrecordsperpage <> "" Then strrecordsperpage = strrecordsperpage Else strrecordsperpage = 12

testgrid = (strrecordsperpage/strrecordsperrow)
If Instr(testgrid, ".") Then
strrecordsperpage = (strrecordsperrow*4)
End If

strstartcolor1 		= Request("startcolor1")
If strstartcolor1 	<> "" Then strstartcolor1 = strstartcolor1 Else strstartcolor1 = StartColor1
strendcolor1 		= Request("endcolor1")
If strendcolor1 	<> "" Then strendcolor1 = strendcolor1 Else strendcolor1 = EndColor1
strdatecolor 		= Request("datecolor")
If strdatecolor 	<> "" Then strdatecolor = strdatecolor Else strdatecolor = DateColor
strstartcolor2 		= Request("startcolor2")
If strstartcolor2 	<> "" Then strstartcolor2 = strstartcolor2 Else strstartcolor2 = StartColor2
strendcolor2 		= Request("endcolor2")
If strendcolor2 	<> "" Then strendcolor2 = strendcolor2 Else strendcolor2 = EndColor2
strtitlecolor 		= Request("titlecolor")
If strtitlecolor 	<> "" Then strtitlecolor = strtitlecolor Else strtitlecolor = TitleColor

strallowedfiles = Request("allowedfiles")
strallowedfiles = Replace(strallowedfiles,", ",",")
strallowedfiles = Replace(strallowedfiles," ,",",")
If strallowedfiles <> "" Then strallowedfiles = strallowedfiles Else strallowedfiles = AllowedFiles

SQL = "UPDATE System SET "

SQL = SQL & "GalleryName		='" & Replace(Request("galleryname"),"'","''") & "',"
SQL = SQL & "UploadPath			='" & struploadpath & "',"
SQL = SQL & "URLPath			='" & strurlpath & "',"
SQL = SQL & "NailerApp			='" & Request("nailerapp") & "',"
SQL = SQL & "DllPath			='" & Request("dllpath") & "',"
SQL = SQL & "DateFormat			='" & Request("dateformat") & "',"

SQL = SQL & "FoldersPerRow		='" & strfoldersperrow & "',"
SQL = SQL & "RecordsPerRow		='" & strrecordsperrow & "',"
SQL = SQL & "RecordsPerPage		='" & strrecordsperpage & "',"

SQL = SQL & "MaxUpload			='" & Request("maxuploadsize") & "',"
SQL = SQL & "EmailServer		='" & Replace(stremailserver,"'","''") & "',"
SQL = SQL & "EmailAddress		='" & Replace(stremailaddress,"'","''") & "',"
SQL = SQL & "EmailApp			='" & Request("emailapp") & "',"

If Request("emailapp") = 1 OR Request("emailapp") = 2 OR Request("emailapp") = 3 OR Request("emailapp") = 10 Then
SQL = SQL & "Anonymous		='" & Request("anonymous") & "',"
Else
SQL = SQL & "Anonymous		= 0,"
End if
SQL = SQL & "MessageBoard	='" & Request("messageboard") & "',"
SQL = SQL & "AllowedFiles	='" & strallowedfiles & "',"

SQL = SQL & "TitleMax		='" & strtitlemax & "',"
SQL = SQL & "History		='" & Request("history") & "',"
SQL = SQL & "Vote			='" & Request("vote") & "',"
SQL = SQL & "ToolBar		='" & Request("toolbar") & "',"
SQL = SQL & "DescMax		='" & strdescmax & "',"
SQL = SQL & "Description	='" & Request("description") & "',"

SQL = SQL & "SlideShow		='" & Request("slideshow") & "',"
SQL = SQL & "DelaySpeed		='" & Request("delayspeed") & "',"
SQL = SQL & "Transition		='" & Request("transition") & "',"

SQL = SQL & "StartColor1	='" & strstartcolor1 & "',"
SQL = SQL & "EndColor1		='" & strendcolor1 & "',"
SQL = SQL & "DateColor		='" & strdatecolor & "',"
SQL = SQL & "StartColor2	='" & strstartcolor2 & "',"
SQL = SQL & "EndColor2		='" & strendcolor2 & "',"
SQL = SQL & "TitleColor		='" & strtitlecolor & "',"

SQL = SQL & "ViewerBG		='" & Request("viewerbg") & "' "

SysConn.Execute(SQL)

response.redirect "system.asp"

%>

<% Else %>

<table width="510" cellspacing="0" cellpadding="0" border="0">
<form name="system" action="system.asp?mode=update" method="post">

<tr>
<td colspan="2">
<hr size="1" color="silver">
</td>
</tr>

<tr>
<td><font class="textmed"><b><%= IGsys_forml %>:</b></font></td>
<td><input class="textsm" name="galleryname" size="30" value="<%= GalleryName %>"></td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_notel %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

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
<%= IGsys_note2 %><br></font>
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
<td nowrap><font class="text"><%= IGsys_form7 %>:&nbsp;</td>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
	<td><input class="textsm" style="width: 30px;" name="foldersperrow" size="8" value="<%= FoldersPerRow %>"></td>
	<td style="padding-left: 5px;"><img src="images/fpr.gif" width=48 height=19 border=0 alt=""></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note7 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form8 %>:&nbsp;</td>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
	<td><input class="textsm" style="width: 30px;" name="recordsperrow" size="8" value="<%= RecordsPerRow %>"></td>
	<td style="padding-left: 8px;"><img src="images/rpr.gif" width=41 height=19 border=0 alt=""></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note8 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form9 %>:&nbsp;</td>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
	<td><input class="textsm" style="width: 30px;" name="recordsperpage" size="8" value="<%= RecordsPerPage %>"></td>
	<td style="padding-left: 8px;"><img src="images/rpp.gif" width=41 height=19 border=0 alt=""></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note9 %><br>
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
<td><font class="text"><%= IGsys_form15 %>:&nbsp;</td>
<td>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td valign="top"><input type="radio" name="messageboard" value="1" <% If MessageBoard Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_on %>&nbsp;&nbsp;</font></td>
<td valign="top"><input type="radio" name="messageboard" value="0" <% If NOT MessageBoard Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_off %>&nbsp;&nbsp;</font></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note15 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form16 %>:&nbsp;</td>
<td><input class="textsm" name="allowedfiles" size="60" value="<%= AllowedFiles %>"></td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note16 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td colspan="2">
<hr size="1" color="silver">
<font class="textmed"><b><%= IGsys_sec3 %>:</b><br></font>
<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
</td>
</tr>

<tr>
<td colspan="2">

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<table cellspacing="0" cellpadding="0" border="0">

<tr>
<td nowrap><font class="text"><%= IGsys_form17 %>:&nbsp;</td>
<td><input class="textsm" style="width: 30px;" name="titlemax" size="8" value="<%= TitleMax %>"></td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note17 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form18 %>:&nbsp;</td>
<td>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td valign="top"><input type="radio" name="history" value="1" <% If History Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_on %></font></td>
<td valign="top"><input type="radio" name="history" value="0" <% If NOT History Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_off %>&nbsp;&nbsp;</font></td>
<td><img src="images/history.gif" width=87 height=10 border=0 alt=""></td>
</tr>
</table>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form19 %>:&nbsp;</td>
<td>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td valign="top"><input type="radio" name="toolbar" value="1" <% If ToolBar Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_on %></font></td>
<td valign="top"><input type="radio" name="toolbar" value="0" <% If NOT ToolBar Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_off %></font></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note19 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form20 %>:&nbsp;</td>
<td>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td valign="top"><input type="radio" name="vote" value="1" <% If Vote Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_on %></font></td>
<td valign="top"><input type="radio" name="vote" value="0" <% If NOT Vote Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_off %>&nbsp;&nbsp;</font></td>
<td><img src="images/str-10.gif" width=41 height=8 border=0 alt=""></td>
</tr>
</table>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form21 %>:&nbsp;</td>
<td>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td valign="top"><input type="radio" name="description" value="1" <% If Description Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_on %></font></td>
<td valign="top"><input type="radio" name="description" value="0" <% If NOT Description Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_off %>&nbsp;</font></td>
<td><font class="text">|&nbsp;<%= IGsys_form21a %>:&nbsp;</td>
<td><input class="textsm" style="width: 30px;" name="descmax" size="8" value="<%= DescMax %>"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note21 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

</table>

</td>
<td><img src="images/thumbdisplay.gif" width=250 height=280 border=0 alt=""></td>
</tr>
</table>

</td>
</tr>

<tr>
<td colspan="2">
<hr size="1" color="silver">
<font class="textmed"><b><%= IGsys_sec4 %>:</b><br></font>
<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form22 %>:&nbsp;</td>
<td>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td valign="top"><input type="radio" name="slideshow" value="1" <% If Slideshow Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_on %></font></td>
<td valign="top"><input type="radio" name="slideshow" value="0" <% If NOT Slideshow Then response.write "checked" %>></td>
<td><font class="textsm"><%= IGsys_off %></font></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note22 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form23 %>:&nbsp;</td>
<td>
<% 
If  DelaySpeed = 10000 Then
DelaySpeedName = IGsys_form23a
ElseIf DelaySpeed = 15000 Then
DelaySpeedName = IGsys_form23b
ElseIf DelaySpeed = 20000 Then
DelaySpeedName = IGsys_form23c
ElseIf DelaySpeed = 25000 Then
DelaySpeedName = IGsys_form23d
ElseIf DelaySpeed = 30000 Then
DelaySpeedName = IGsys_form23e
ElseIf DelaySpeed = 60000 Then
DelaySpeedName = IGsys_form23f
End If
%>
<select class="textsm" name="delayspeed" size="1">
<option value="<%= DelaySpeed %>"><%= DelaySpeedName %></option>
<option value="<%= DelaySpeed %>">- - - - -</option>
<option value="10000"><%= IGsys_form23a %></option>
<option value="15000"><%= IGsys_form23b %></option>
<option value="20000"><%= IGsys_form23c %></option>
<option value="25000"><%= IGsys_form23d %></option>
<option value="30000"><%= IGsys_form23e %></option>
<option value="60000"><%= IGsys_form23f %></option>
</select><br>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note23 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsys_form24 %>:&nbsp;</td>
<td>
<% 
If  Transition = 1 Then
TransitionName = IGsys_form24a
ElseIf Transition = 2 Then
TransitionName = IGsys_form24b
ElseIf Transition = 3 Then
TransitionName = IGsys_form24c
ElseIf Transition = 4 Then
TransitionName = IGsys_form24d
ElseIf Transition = 5 Then
TransitionName = IGsys_form24e
ElseIf Transition = 6 Then
TransitionName = IGsys_form24f
End If
%>
<select class="textsm" name="transition" size="1">
<option value="<%= Transition %>"><%= TransitionName %></option>
<option value="<%= Transition %>">- - - - -</option>
<option value="1"><%= IGsys_form24a %></option>
<option value="2"><%= IGsys_form24b %></option>
<option value="3"><%= IGsys_form24c %></option>
<option value="4"><%= IGsys_form24d %></option>
<option value="5"><%= IGsys_form24e %></option>
<option value="6"><%= IGsys_form24f %></option>
</select><br>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note24 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
</td>
</tr>

<tr>
<td colspan="2">
<hr size="1" color="silver">
<font class="textmed"><b><%= IGsys_sec5 %>:</b><br></font>
<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
</td>
</tr>

<tr>
<td><font class="text"><%= IGsys_form25 %>:&nbsp;</td>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><font class="textxsm"><%= IGsys_strt %>:&nbsp;</td>
<td><input class="textsm" name="startcolor1" size="8" value="<%= StartColor1 %>"></td>
<td><font class="textxsm">&nbsp;<%= IGsys_end %>:&nbsp;</td>
<td><input class="textsm" name="endcolor1" size="8" value="<%= EndColor1 %>"></td>
<td><font class="textxsm">&nbsp;<%= IGsys_fnt %>:&nbsp;</td>
<td><input class="textsm" name="datecolor" size="8" value="<%= DateColor %>"></td>
</tr>
<tr>
<td><font class="textxsm"><%= IGsys_dflt %>:</td>
<td><font class="textxsm">&nbsp;#72AFE8</td>
<td><font class="textxsm">&nbsp;</td>
<td><font class="textxsm">&nbsp;#336EA5</td>
<td><font class="textxsm">&nbsp;</td>
<td><font class="textxsm">&nbsp;#FFFFFF</td>
</tr>
</table>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td height="24" bgcolor="#5090D0" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=<%= StartColor1 %>,endColorStr=<%= EndColor1 %>);">
<font style="color: <%= DateColor %>;" class="textsm">
&nbsp;&nbsp;<b>Font Color</b><br>
</font>
</td>
<td class="toolbar" align="center" width="22" height="23" onMouseUp="button_up(this);" onMouseDown="button_down(this);" onMouseOver="button_over(this)" onMouseOut="button_out(this);" onClick="showMenu('ColorMenu1',290,217);" nowrap><img src="images/gallery/color.gif" width=22 height=23 border="0" alt="Color Pallette"></td>
</tr>
</table>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</td>
</tr>

<tr>
<td><font class="text"><%= IGsys_form26 %>:&nbsp;</td>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><font class="textxsm"><%= IGsys_strt %>:&nbsp;</td>
<td><input class="textsm" name="startcolor2" size="8" value="<%= StartColor2 %>"></td>
<td><font class="textxsm">&nbsp;<%= IGsys_end %>:&nbsp;</td>
<td><input class="textsm" name="endcolor2" size="8" value="<%= EndColor2 %>"></td>
<td><font class="textxsm">&nbsp;<%= IGsys_fnt %>:&nbsp;</td>
<td><input class="textsm" name="titlecolor" size="8" value="<%= TitleColor %>"></td>
</tr>
<tr>
<td><font class="textxsm"><%= IGsys_dflt %>:</td>
<td><font class="textxsm">&nbsp;#3E96FF</td>
<td><font class="textxsm">&nbsp;</td>
<td><font class="textxsm">&nbsp;#0043CF</td>
<td><font class="textxsm">&nbsp;</td>
<td><font class="textxsm">&nbsp;#FFFFFF</td>
</tr>
</table>
</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td height="24" bgcolor="#5090D0" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=<%= StartColor2 %>,endColorStr=<%= EndColor2 %>);">
<font style="color: <%= TitleColor %>;" class="textsm">
&nbsp;&nbsp;<b>Font Color</b><br>
</font>
</td>
<td class="toolbar" align="center" width="22" height="23" onMouseUp="button_up(this);" onMouseDown="button_down(this);" onMouseOver="button_over(this)" onMouseOut="button_out(this);" onClick="showMenu('ColorMenu1',290,217);" nowrap><img src="images/gallery/color.gif" width=22 height=23 border="0" alt="Color Pallette"></td>
</tr>
</table>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</td>
</tr>




<tr>
<td valign="top"><font class="text"><%= IGsys_form27 %>:&nbsp;</td>
<td>

<table cellspacing="2" cellpadding="2" border="0">
<tr>
	<td background="images/gallery/bg1.gif"><img src="images/spacer.gif" width=60 height=60 border=0 alt=""></td>
	<td background="images/gallery/bg2.gif"><img src="images/spacer.gif" width=60 height=60 border=0 alt=""></td>
	<td background="images/gallery/bg3.gif"><img src="images/spacer.gif" width=60 height=60 border=0 alt=""></td>
	<td background="images/gallery/bg4.gif"><img src="images/spacer.gif" width=60 height=60 border=0 alt=""></td>
	<td background="images/gallery/bg5.gif" style="border:1px solid silver;"><img src="images/spacer.gif" width=60 height=60 border=0 alt=""></td>
	<td background="images/gallery/bg6.gif" style="border:1px solid silver;"><img src="images/spacer.gif" width=60 height=60 border=0 alt=""></td>
</tr>
<tr>
	<td align="center"><input type="radio" name="viewerbg" value="1" <% If ViewerBG = "1" Then response.write "checked" %>></td>
	<td align="center"><input type="radio" name="viewerbg" value="2" <% If ViewerBG = "2" Then response.write "checked" %>></td>
	<td align="center"><input type="radio" name="viewerbg" value="3" <% If ViewerBG = "3" Then response.write "checked" %>></td>
	<td align="center"><input type="radio" name="viewerbg" value="4" <% If ViewerBG = "4" Then response.write "checked" %>></td>
	<td align="center"><input type="radio" name="viewerbg" value="5" <% If ViewerBG = "5" Then response.write "checked" %>></td>
	<td align="center"><input type="radio" name="viewerbg" value="6" <% If ViewerBG = "6" Then response.write "checked" %>></td>
</tr>
</table>

</td>
</tr>
<tr>
<td><font class="textxsm">&nbsp;</font></td>
<td>
<font class="textxsm">
<%= IGsys_note28 %><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
</font>
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

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/footer.asp"--></td>
</tr>

</table>

<p>

<!-- Color Menu -->
<script language="JavaScript1.2">
<!--
function ClipBoard(oBox,oColor) 
{
holdtext.innerText = oColor.style.backgroundColor.toUpperCase();
Copied = holdtext.createTextRange();
Copied.execCommand("Copy");
oPopup.hide();
}
//-->
</script>
<textarea id="holdtext" style="display:none;"></textarea>
<div id="ColorMenu1" style="display: none;">
<table width="100%" cellpadding="1" cellspacing="1" style="font-family: Verdana; font-size: 7px; border-left: buttonhighlight 1px solid; border-right: buttonshadow 1px solid; border-top: buttonhighlight 1px solid; border-bottom: buttonshadow 1px solid; cursor: hand;" bgcolor="#dddddd">
<tr>
<td colspan="18" id=color style="height:16px; border:1px solid silver; font-family: verdana;  font-size: 7.5pt; font-weight: bold;" align="center">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#000000;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#000033;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#000066;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#000099;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#0000CC;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#0000FF;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#003300;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#003333;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#003366;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#0033CC;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#0000CC;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#0033FF;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#006600;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#006633;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#006666;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#006699;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#0066CC;">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#0066FF;">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#330000">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#330033">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#330066">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#330099">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#3300CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#3300FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#333300">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#333333">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#333366">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#333399">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#3333CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#3333FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#336600">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#336633">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#336666">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#336699">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#3366CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#3366FF">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#660000">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#660033">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#660066">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#660099">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#6600CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#6600FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#663300">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#663333">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#663366">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#663399">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#6633CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#6633FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#666600">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#666633">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#666666">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#666699">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#6666CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#6666FF">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#990000">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#990033">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#990066">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#990099">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#9900CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#9900FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#993300">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#993333">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#993366">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#993399">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#9933CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#9933FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#996600">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#996633">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#996666">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#996699">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#9966CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#9966FF">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#CC0000">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC0033">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC0066">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC0099">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC00CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC00FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC3300">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC3333">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC3366">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC3399">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC33CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC33FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC6600">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC6633">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC6666">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC6699">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC66CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC66FF">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#FF0000">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF0033">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF0066">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF0099">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF00CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF00FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF3300">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF3333">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF3366">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF3399">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF33CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF33FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF6600">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF6633">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF6666">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF6699">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF66CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF66FF">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#009900">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#009933">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#009966">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#009999">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#0099CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#0099FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00CC00">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00CC33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00CC66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00CC99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00CCCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00CCFF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00FF33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00FF66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00FF66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00FF99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00FFCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#00FFFF">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#339900">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#339933">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#339966">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#339999">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#3399CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#3399FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33CC00">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33CC33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33CC66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33CC99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33CCCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33CCFF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33FF00">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33FF33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33FF66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33FF99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33FFCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#33FFFF">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#669900">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#669933">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#669966">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#669999">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#6699CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#6699FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66CC00">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66CC33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66CC66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66CC99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66CCCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66CCFF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66FF00">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66FF33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66FF66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66FF99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66FFCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#66FFFF">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#999900">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#999933">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#999966">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#999999">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#9999CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#9999FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99CC00">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99CC33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99CC66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99CC99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99CCCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99CCFF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99FF00">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99FF33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99FF66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99FF99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99FFCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#99FFFF">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#CC9900">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC9933">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC9966">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC9999">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC99CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CC99FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCCC00">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCCC33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCCC66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCCC99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCCCCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCCCFF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCFF00">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCFF33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCFF66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCFF99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCFFCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#CCFFFF">&nbsp;</td>
</tr>

<tr>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="height: 14px;background-color:#FF9900">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF9933">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF9966">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF9999">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF99CC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FF99FF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFCC00">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFCC33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFCC66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFCC99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFCCCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFCCFF">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFFF00">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFFF33">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFFF66">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFFF99">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFFFCC">&nbsp;</td>
<td title="Copy to Clipboard" onClick="parent.ClipBoard(color,this);" onMouseOver="parent.showColor(color,this)" style="background-color:#FFFFFF">&nbsp;</td>
</tr>

<tr>
<td colspan="18" style="height: 16px; font-family: Verdana; font-size: 7.5pt; color:gray;" onClick="parent.oPopup.hide();" align="center"><b><u>Close Pallette</u></b></td>
</tr>
</table>
</div>
<!-- End Color Menu -->

<script language="JavaScript" type="text/javascript">
<!-- 
var Today = new Date;
var mm1 = Today.getMonth() + 1;
if (mm1<10){mm1="0"+ mm1;}
var dd1 = Today.getDate();
if (dd1<10){dd1="0"+dd1;}
var yy1= Today.getFullYear();
if((yy1 >= 0) &&  (yy1 < 50)) {yy1=yy1+2000;}
if ((yy1 >= 50) && (yy1<100)){yy1=yy1+1900;}
var hh1= Today.getHours()	
var min1= Today.getMinutes()
var min2 = min1 + 10;
if (min1<10){min1="0"+ min1;}	
var chkDATE1=mm1+ "/" + dd1+ "/" + yy1 + " " + hh1 + ":" + min1;	
if(min2 >= 60) {
hh1=hh1+1;
min2=min2-60;}
if (min2<10){min2="0"+ min2;}		
var chkDATE2=mm1+ "/" + dd1+ "/" + yy1 + " " + hh1 + ":" + min2;			
var AlertMessage = "<%= IG_timeout %>";
var TimeOutMinutes = 1;	
function AlertUser()
{
switch(TimeOutMinutes)
{
case 1:
break;
case 2:
alert(AlertMessage);
break;
default:
break;								
}
TimeOutMinutes++;
setTimeout('AlertUser()', <%= OutMinusTwo %>);
}
AlertUser();
// -->
</script>

</body>
</html>

