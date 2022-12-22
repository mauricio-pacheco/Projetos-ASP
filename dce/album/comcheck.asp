<!--#INCLUDE FILE="include/security-admin.inc"-->
<!--#INCLUDE FILE="language/lang_system.inc"-->

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<link rel="stylesheet" type="text/css" href="style/style.css">

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10" marginwidth="10" marginheight="10">

<% If Request("mode") = "email" Then %>
<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGcom_em1 %></b></font>
<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
<font class="text">
<%= IGcom_em2 %><br>
</font>
<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
<table width="175" cellspacing="0" cellpadding="0" border="0">
<%
Dim myMail
Dim mycount
mycount = 0
On Error Resume Next
%>
<%
Set myMail = Server.CreateObject("SMTPsvg.Mailer")
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom1.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">ASPMail</font></td>
<td style="padding-left: 2px;"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">ASPMail</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount = mycount + 1
End if
Err.Clear		
%>
<%
Set myMail = CreateObject("Persits.MailSender") 
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom1.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">ASPEmail</font></td>
<td style="padding-left: 2px;"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">ASPEmail</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount = mycount + 1
End if
Err.Clear
%>
<%
Set myMail = Server.CreateObject("CDONTS.NewMail")
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom1.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">CDONTS</font></td>
<td style="padding-left: 2px;"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">CDONTS</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount = mycount + 1
End if
Err.Clear
%>
<%
Set myMail = Server.CreateObject("CDO.Message")
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom1.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">CDOSYS</font></td>
<td style="padding-left: 2px;"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">CDOSYS</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount = mycount + 1
End if
Err.Clear
%>
<%
Set myMail = Server.CreateObject("Dynu.Email")
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom1.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">Dynu Mail</font></td>
<td style="padding-left: 2px;"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">Dynu Mail</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount = mycount + 1
End if
Err.Clear
%>
<%
Set myMail= Server.CreateObject ("JMail.SMTPMail") 
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom1.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">JMail 3.7</font></td>
<td style="padding-left: 2px;"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">JMail 3.7</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount = mycount + 1
End if
Err.Clear		
%>
<%
Set myMail= Server.CreateObject ("JMail.Message") 
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom1.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">JMail 4.1</font></td>
<td style="padding-left: 2px;"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">JMail 4.1</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount = mycount + 1
End if
Err.Clear	
%>
<%
Set myMail = Server.CreateObject("ADISCON.SimpleMail.1")
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom1.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">Simple Mail</font></td>
<td style="padding-left: 2px;"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">Simple Mail</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount = mycount + 1
End if
Err.Clear
%>
<%
set myMail = Server.CreateObject("ASPMail.ASPMailCtrl.1")
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom1.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">OCXMail</font></td>
<td style="padding-left: 2px;"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">OCXMail</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount = mycount + 1
End if
Err.Clear
%>
<%
Set myMail = CreateObject("VSEmail.SMTPSendMail")
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom1.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">VSEmail</font></td>
<td style="padding-left: 2px;"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="30" nowrap><img src="images/sm-emailcom.gif" width="25" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">VSEmail</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount = mycount + 1
End if
Err.Clear
%>
<tr>
<td colspan="3"><font class="textxsm">Found <b>[<%= mycount %>]</b> email com's.</font></td>
</tr>
</table>
<% End If %>

<% If Request("mode") = "nailer" Then %>
<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGcom_tn1 %></b></font>
<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
<font class="text">
<%= IGcom_tn2 %><br>
</font>
<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
<table width="175" cellspacing="0" cellpadding="1" border="0">
<%
Dim Jpeg
Dim mycount1
mycount1 = 0
On Error Resume Next
%>
<%
Set Jpeg = Server.CreateObject("Persits.Jpeg")
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="20" nowrap><img src="images/sm-nailercom1.gif" width="15" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">ASPJpeg&nbsp;&nbsp;</font></td>
<td style="padding-left: 2px;" width="100%"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="20" nowrap><img src="images/sm-nailercom.gif" width="15" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">ASPJpeg&nbsp;&nbsp;</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount1 = mycount1 + 1
End if
Err.Clear
%>
<%
Set Jpeg = Server.CreateObject("aspimage.image")
If Err then
%>
<tr>
<td style="padding-right: 2px;" width="15" nowrap><img src="images/sm-nailercom1.gif" width="15" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">ASPImage&nbsp;&nbsp;</font></td>
<td style="padding-left: 2px;"></td>
</tr>
<%
else
%>
<tr>
<td style="padding-right: 2px;" width="15"nowrap><img src="images/sm-nailercom.gif" width="15" height="20" border="0" alt="Email"></td>
<td style="padding-left: 2px;" nowrap><font class="text">ASPImage&nbsp;&nbsp;</font></td>
<td style="padding-left: 2px;" width="100%" nowrap><font class="textsm" style="color: #5AAD7B"><b>Installed</b></font></td>
</tr>
<%
mycount1 = mycount1 + 1
End if
Err.Clear
%>
<% If mycount1 < "1" Then %>
<tr>
<td colspan="3">
<hr size="1" color="silver">
<font class="textxsm">
No thumbnailing components were located on your server.  You must select "No Component" in thumbnailer select box.  For more information on the supported thumbnail com's in i-Gallery you can view:<br> www.b-cp.com/igallery/system.asp<br>
</font>
</td>
</tr>
</table>
<% Else %>
<tr>
<td colspan="3"><font class="textxsm">Found <b>[<%= mycount1 %>]</b> thumbnailing com's.</font></td>
</tr>
</table>
<% End If %>
<% End If %>

</body>
</html>
