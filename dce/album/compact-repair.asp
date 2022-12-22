<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/security-admin.inc"-->
<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_compact-repair.inc"-->

<%
If SMPConn Then
DBPath = Server.MapPath(Replace(DBLocation,"igallery.mdb",""))
ElseIf DirectConn Then
DBPath = Replace(DBLocation,"igallery.mdb","")
End If
function TestEnvironment()
TestEnvironment = ""
Set fso = Server.CreateObject("Scripting.FileSystemObject")
fileName = DBPath & "\dbtest.txt"
on error resume next
Set testFile = fso.CreateTextFile(fileName, true)
testFile.Close
fso.DeleteFile(fileName)
If Err.Number<>0 then
TestEnvironment = IGcr_cr
exit function
end if
Err.Clear
end function

Function FormatDBSize(intFileSize)
const DecimalPlaces = 1
const FileSizeBytes = 1
const FileSizeKiloByte = 1024
const FileSizeMegaByte = 1048576
const FileSizeGigaByte = 1073741824
const FileSizeTeraByte = 1099511627776
Dim strFileSize, newFilesize
If (Int(intFileSize / FileSizeTeraByte) <> 0) Then
newFilesize = Round(intFileSize / FileSizeTeraByte, DecimalPlaces)
strFileSize = newFilesize & " TB"
ElseIf (Int(intFileSize / FileSizeGigaByte) <> 0) Then
newFilesize = Round(intFileSize / FileSizeGigaByte, DecimalPlaces)
strFileSize = newFilesize & " GB"
ElseIf (Int(intFileSize / FileSizeMegaByte) <> 0) Then
newFilesize = Round(intFileSize / FileSizeMegaByte, DecimalPlaces)
strFileSize = newFilesize & " MB"
ElseIf (Int(intFileSize / FileSizeKiloByte) <> 0) Then
newFilesize = Round(intFileSize / FileSizeKiloByte, DecimalPlaces)
strFileSize = newFilesize & " KB"
ElseIf (Int(intFileSize / FileSizeBytes) <> 0) Then
newFilesize = intFilesize
strFileSize = newFilesize & " Bytes"
ElseIf Int(intFileSize) = 0 Then
strFilesize = 0 & " Bytes"
End If
FormatDBSize = strFileSize
End Function
%>

<%
If SMPConn Then
MyDirectory = Server.MapPath(Replace(DBLocation,"igallery.mdb",""))
ElseIf DirectConn Then
MyDirectory = Replace(DBLocation,"igallery.mdb","")
End If

Set MyDir 	= FSO.GetFolder(MyDirectory)
Set DBNames = Mydir.Files

CmpctFile = Request("compact")

If Len(CmpctFile) > 4 then
MyPos = Instr(1,CmpctFile,".mdb",1) - 1
CmpctFileDst = Mid(CmpctFile,1,MyPos) & "Cmpcted" & ".mdb"
AccessDB = MyDirectory & "\" & CmpctFile
DestDB = MyDirectory &  "\" & CmpctFileDst

Set objJetEngine = Server.CreateObject("JRO.JetEngine")

objJetEngine.CompactDatabase _
"Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & AccessDB & ";", _
"Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & DestDB & ";"
Set objJetEngine = Nothing

FSO.DeleteFile AccessDB, True
FSO.CopyFile DestDB, AccessDB
FSO.DeleteFile DestDB, True
Session(CmpctFile) = 1
Response.Redirect "compact-repair.asp?compactedDB=" & CmpctFile & "&dbsize=" & Request.QueryString ("dbsize")
End If
%>

<html>
<head>

<title>.:: Galeria de Fotos da Vitrola ::.</title>

<link rel="stylesheet" type="text/css" href="style/style.css">

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10" marginwidth="10" marginheight="10">

<% 
diagnostics = TestEnvironment()
If diagnostics <> "" Then
%>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #CC0000;"><b><%= IGcr_cr1 %></b></font><br>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td colspan="2">
<hr size="1" color="silver">
<font class="text">
<% 
Dim diagnostics
diagnostics = TestEnvironment()
If diagnostics <> "" Then
response.write diagnostics&"<br>"
End If 
%>
</font>
</td>
</tr>
</table>

<% Else %>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGcr_cr1 %></b></font>
<br><img src="images/spacer.gif" width=1 height=4 border=0 alt=""><br>
<font class="text">
<%= IGcr_cr2 %>
</font>
<br><img src="images/spacer.gif" width=1 height=6 border=0 alt=""><br>
<table width="100%" bgcolor="gray" cellpadding=0 cellspacing=0 border=0><tr>
<td>
<table width="100%" cellpadding=1 cellspacing=1 border=0>

<tr bgcolor="#C4CFDE">
<td width="16" height="20" nowrap><font class="textsm">&nbsp;</td>
<td width="100%" style="padding-left: 3px;" nowrap><font class="textsm"><%= IGcr_cr3 %>:</td>
<td width="50" style="padding-left: 3px;" nowrap><font class="textsm"><%= IGcr_cr4 %>:</td>
<td width="150" style="padding-left: 3px;" nowrap><font class="textsm"><%= IGcr_cr5 %>:</td>
<td width="19" nowrap>&nbsp;</td>
</tr>

<%
iCount = 0
For Each f In DBNames
MapPathLen = Len(MyDirectory) + 2

If Instr(1,f,".mdb",1) > 0 then
strdbname = Mid(f,MappathLen)
%>

<% If Eval(iCount\2 = iCount/2) Then %>

<tr bgcolor="#ffffff" style="cursor:default;" onMouseOver="this.bgColor='#DDE3EB'" onMouseOut="this.bgColor='#FFFFFF'">
<td width="16"><A href="compact-repair.asp?compact=<%= strdbname %>&dbsize=<%= f.Size %>"><img src="images/sm-gear.gif" width=20 height=20 border=0 alt="Click To Compact & Repair"></a></td>
<td style="padding-left: 3px;" nowrap><font class="textsm"><%= strdbname %></td>
<td style="padding-left: 3px;" nowrap><font class="textsm"><%= FormatDBSize(f.Size) %></td>
<td style="padding-left: 3px;" nowrap><font class="textsm"><%= f.DateLastModified %></td>
<td width="21" nowrap><% If Session(strdbname) = 1 then %><img src="images/sm-repaired.gif" width=21 height=20 border=0 alt="Compact & Repair Complete"><% Else %><img src="images/spacer.gif" width=21 height=20 border=0 alt=""><% End If %></td>
</tr>

<% Else %>

<tr bgcolor="#F9F9F9" style="cursor:default;" onMouseOver="this.bgColor='#DDE3EB'" onMouseOut="this.bgColor='#F9F9F9'">
<td width="16"><A href="compact-repair.asp?compact=<%= strdbname %>&dbsize=<%= f.Size %>"><img src="images/sm-gear.gif" width=20 height=20 border=0 alt="Click To Compact & Repair"></a></td>
<td style="padding-left: 3px;" nowrap><font class="textsm"><%= strdbname %></td>
<td style="padding-left: 3px;" nowrap><font class="textsm"><%= FormatDBSize(f.Size) %></td>
<td style="padding-left: 3px;" nowrap><font class="textsm"><%= f.DateLastModified %></td>
<td width="21" nowrap><% If Session(strdbname) = 1 then %><img src="images/sm-repaired.gif" width=21 height=20 border=0 alt="Compact & Repair Complete"><% Else %><img src="images/spacer.gif" width=21 height=20 border=0 alt=""><% End If %></td>
</tr>

<%
End If
iCount = iCount +1 
End If
%>

<%

Next
%>
</table>

</td></tr>
</table>
<% If Not Request("compactedDB") = "" Then %>
<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>
<font class="textsm">
<%= IGcr_cr6 %>&nbsp;<%= Request("compactedDB") %>&nbsp;<%= IGcr_cr7 %>&nbsp;<%= FormatDBSize(Request("dbsize")) %>.<br>
</font>
<% End If %>

<% End If %>

</body>
</html>