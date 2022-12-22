<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/security.inc"-->
<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_syncimage.inc"-->

<%
strimage 		= Request("image")
strfolder 		= Request("folder")

If DateFormat = 1 Then
strdate			= USDate(igalleryNow)
ElseIf DateFormat = 2 Then
strdate			= EuroDate(igalleryNow)
Else
strdate 		= FormatDateTime(igalleryNow,2)
End If

Set SyncConn = Server.CreateObject("ADODB.Connection")
Set cRS = Server.CreateObject("ADODB.Recordset")
SyncConn.Open strConnect
Set cRS.ActiveConnection = SyncConn
cRS.CursorType = adOpenStatic
cSQL = "SELECT ID, imagename, folder, title, description, dateadded, lasttime, lastdate, total FROM Descriptions WHERE imagename='"&strimage&"' AND folder='"&Replace(strfolder,"'","''")&"'"
cRS.Open cSQL,,,adCmdTable
If cRS.recordcount = 0 Then
cRS.AddNew
cRS("imagename") 	= strimage
cRS("folder") 		= strfolder
cRS("dateadded") 	= strdate
End If
cRS.Update
cRS.Close
SyncConn.Close
%>

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<link rel="stylesheet" type="text/css" href="style/style.css">

<script language="JavaScript">
<!--
function editImage() {
window.open("editimage.asp?image=<%= strimage %>&folder=<%= strfolder %>","igallery");
setTimeout("window.close()",1000);
}
//-->
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10" marginwidth="10" marginheight="10">

<font class="textmed">

<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
<img src="images/sm-renameas.gif" alt="" width="23" height="18" border="0" align="left" vspace="5" hspace="5">
<%= IGsync_msg %><br>
<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
<table align="center" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="25"><img src="images/sm-editimage.gif" height="20" width="25" border="0" alt="Edit File Information"></td>
<td nowrap><a class="linkmed" href="javascript:void(0);" onClick="editImage()"><b><%= IGsync_link1 %></b></a></td>
<td width="15"></td>
<td width="20"><img src="images/sm-close.gif" height="19" width="19" border="0" alt="Edit File Information"></td>
<td nowrap><a class="linkmed" href="javascript:window.close();"><b><%= IGsync_link2 %></b></a></td>
</tr>
</table>

</font>

</body>
</html>

