<%@ LANGUAGE="VBSCRIPT" %>

<html>
<head>

<title>.:: Galeria de Fotos da Vitrola ::.</title>

<link rel="stylesheet" type="text/css" href="style/style.css">

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10" marginwidth="10" marginheight="10">

<table width="760" cellspacing="0" cellpadding="0" border="0">
<tr>
<td height="75">

<!--#INCLUDE FILE="include/header1.asp"-->

</td>
</tr>
<tr>
<td height="24" bgcolor="#5090D0" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#72AFE8,endColorStr=#336EA5);" colspan="3">
<font style="color: #FFFFFF;" class="textsm">
&nbsp;&nbsp;<b></b><br>
</font>
</td>
</tr>
</table>

<table width="760" cellspacing="0" cellpadding="0" border="0">
<tr>
<td style="padding-top:7px;" width="200" valign="top">

<img src="images/spacer.gif" width=200 height=5 border=0 alt=""><br>

</td>

<td width="20" valign="top"><img src="images/spacer-bevel.gif" width=20 height=235 border=0 alt=""></td>
<td style="padding-left:10px;padding-top:15px;" width="530" valign="top">

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #CC0000;"><b>Database Error!</b><br></font>

<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>

<font class="text">
<% If Request("mode") = "folder" Then %>
The folder location you have identified in the <b>"include>>connection.asp"</b> page for the database <b>"igallery.mdb"</b> does not exsist.&nbsp; Please check the following connection string in that page to make sure it points to the correct location:<br>
<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
<font class="textxsm" style="font-weight:bold;">
If using MapPath method:<br>
DBLocation = "../database/igallery.mdb"<br>
<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>
-- OR --<br>
<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>
If using Direct connetion method:<br>
DBLocation = "C:\Inetpub\wwwroot\igallery41sub\database\igallery.mdb"<br>
</font>
<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
If you are using the "MapPath" connection method (default) and you have moved your i-Gallery database one level or two levels above your gallery folder you might need to begin the location string with a [<b>../ or ./</b>].  Consult your server administrator for the correct formatting.<br>
<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
When your ready to re-test your database string click on the link below.  A successful test will enable you to move on to the main set-up screen!<br>
<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
<div align="center">
<a class="linkmed" href="system-firsttime.asp"><b>Click Here To Re-Test Database Connection</b></a>
</div>
<% ElseIf Request("mode") = "write" Then  %>
The connection string to the folder the i-Gallery database is in is configured properly but the directory/folder the database is in does not have <b>"write"</b> poperties.  i-Gallery tested the folder by trying to write a small text file to the directory and the server rejected the request.  The i-Gallery database needs to be in a folder that has write properties.  Please adjust the settings of this folder then clcik on the link below to re-test the directory/folder.  A successful test will enable you to move on to the main set-up screen!<br>
<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
<div align="center">
<a class="linkmed" href="system-firsttime.asp"><b>Click Here To Re-Test Directory Properties</b></a>
</div>
<% End If %>
</font>

</td>
</tr>
</table>

</body>
</html>
