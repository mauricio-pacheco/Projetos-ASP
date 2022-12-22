<%@ LANGUAGE="VBSCRIPT" %>

<% 
Option Explicit 
Response.Expires = -1
Server.ScriptTimeout = 2400
%>

<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_upload.inc"-->

<%
Dim ImageDir, ImageFolder, UploadDir
ImageDir    = Request("D")
ImageFolder = Replace(ImageDir,UploadPath,"")
ImageFolder = Replace(ImageFolder,"\\","\")
UploadDir   = ImageDir

function TestEnvironment()
Dim fso, fileName, testFile, streamTest
TestEnvironment = ""

Set fso = Server.CreateObject("Scripting.FileSystemObject")
if not fso.FolderExists(UploadDir) then

TestEnvironment = "<table cellspacing=""0"" cellpadding=""0"" border=""0"">"
TestEnvironment = TestEnvironment & "<tr>"
TestEnvironment = TestEnvironment & "<td><img src=""images/sm-close.gif"" width=20 height=20 border=0></td>"
TestEnvironment = TestEnvironment & "<td><font style=""color:#CC0000; font-weight:bold;"" class=""textmed"">"&IGblnk_ferr1&": " & ImageFolder & "</font></td>"
TestEnvironment = TestEnvironment & "</tr>"
TestEnvironment = TestEnvironment & "</table>"
TestEnvironment = TestEnvironment & "<img src=""images/spacer.gif"" width=1 height=8 border=0><br>"
TestEnvironment = TestEnvironment & IGblnk_ferrmsg

exit function
end if

fileName = UploadDir & "\test.txt"
on error resume next
Set testFile = fso.CreateTextFile(fileName, true)
If Err.Number<>0 then

TestEnvironment = "<table cellspacing=""0"" cellpadding=""0"" border=""0"">"
TestEnvironment = TestEnvironment & "<tr>"
TestEnvironment = TestEnvironment & "<td><img src=""images/sm-close.gif"" width=20 height=20 border=0></td>"
TestEnvironment = TestEnvironment & "<td><font style=""color:#CC0000; font-weight:bold;"" class=""textmed"">"&IGblnk_ferr2&": " & ImageFolder & "</font></td>"
TestEnvironment = TestEnvironment & "</tr>"
TestEnvironment = TestEnvironment & "</table>"
TestEnvironment = TestEnvironment & "<img src=""images/spacer.gif"" width=1 height=8 border=0><br>"
TestEnvironment = TestEnvironment & IGblnk_write1

exit function
end if

Err.Clear
testFile.Close
fso.DeleteFile(fileName)
If Err.Number<>0 then

TestEnvironment = "<table cellspacing=""0"" cellpadding=""0"" border=""0"">"
TestEnvironment = TestEnvironment & "<tr>"
TestEnvironment = TestEnvironment & "<td><img src=""images/sm-close.gif"" width=20 height=20 border=0></td>"
TestEnvironment = TestEnvironment & "<td><font style=""color:#CC0000; font-weight:bold;"" class=""textmed"">"&IGblnk_ferr2&": " & ImageFolder & "</font></td>"
TestEnvironment = TestEnvironment & "</tr>"
TestEnvironment = TestEnvironment & "</table>"
TestEnvironment = TestEnvironment & "<img src=""images/spacer.gif"" width=1 height=8 border=0><br>"
TestEnvironment = TestEnvironment & IGblnk_mod1

exit function
end if
Err.Clear

Set streamTest = Server.CreateObject("ADODB.Stream")
If Err.Number<>0 then

TestEnvironment = "<table cellspacing=""0"" cellpadding=""0"" border=""0"">"
TestEnvironment = TestEnvironment & "<tr>"
TestEnvironment = TestEnvironment & "<td><img src=""images/sm-close.gif"" width=20 height=20 border=0></td>"
TestEnvironment = TestEnvironment & "<td><font style=""color:#CC0000; font-weight:bold;"" class=""textmed"">"&IGblnk_ferr3&"</font></td>"
TestEnvironment = TestEnvironment & "</tr>"
TestEnvironment = TestEnvironment & "</table>"
TestEnvironment = TestEnvironment & "<img src=""images/spacer.gif"" width=1 height=8 border=0><br>"
TestEnvironment = TestEnvironment & IGblnk_adodb1

exit function
end if

Set streamTest = Nothing

end function
%>
<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<style>
.text 			{font-family: Arial, Helvetica; font-size: 10pt; color: #000000;}
.textxsm 		{font-family: Verdana, Arial, Helvetica; font-size: 7pt; color: #004835;}
.link 			{font-family: Arial, Helvetica; font-size: 10pt; color: #3078BF;}
.link:hover 	{color: #5090CF;}
.textmed 		{font-family: Arial, Helvetica; font-size: 12pt; color: #000000;}
.linkmed 		{font-family: Arial, Helvetica; font-size: 12pt; color: #3078BF;}
.linkmed:hover 	{color: #5090CF;}
</style>

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<hr size="1" color="silver">

<font class="text">

<%
If Request("DN") = "yes" Then
Dim diagnostics
diagnostics = TestEnvironment()
If diagnostics <> "" Then
response.write diagnostics
End If
End If
%>

</font>

</body>
</html>
