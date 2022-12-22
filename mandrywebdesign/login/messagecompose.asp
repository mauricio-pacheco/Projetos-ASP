<%
Option Explicit
Dim username, senduser, subject

username = Request.Cookies("username")

'Clear off if you're not logged in
if username = "" then
  Response.Redirect("nologin.asp?page=messagecompose.asp")
end if

'If it's been sent a "senduser" variable it means this is a reply to someone, so put the value in a variable
if Request.QueryString("senduser") <> "" then
	senduser = Request.QueryString("senduser")
else
'If there's no querystring with senduser in, make the variable empty
	senduser = ""
end if

'If it's been send a querystring of "subject", prepare it with an "Re:" fot the new subject line
if Request.QueryString("subject") <> "" then
	subject = "Re: " & Server.HTMLEncode(Request.QueryString("subject"))
else
	subject = ""
end if
%>

<html>
<head>
<title>Philweb</title>
</head>
<body bgcolor="#FFFFFF" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size="2">
  
<h3>Compor uma mensagem</h3>
  
<form name="composeform" action="messagesend.asp" method="post">
<table width="400" cellspacing=0 cellpadding=2 border=1 bordercolor="#000000">
<tr>
      <th bgcolor="#000000"><font face="arial,helvetica" size="2" color="#FFFFFF"> 
        Entre com os detalhes da mensagem abaixo</font></th>
</tr>
<tr>
  <td>
  <table cellspacing=0 cellpadding=0 align="center">
  <tr>
	        <td width="85"><font face="arial,helvetica" size=2><b>Para :</b></font></td>
	<td><input type="text" name="sendto" size="25" value="<%=senduser%>"></td>
  </tr>
  <tr>
	        <td><font face="arial,helvetica" size=2><b>Assunto :</b></font></td>
	<td><input type="text" name="subject" size="25" maxlength="100" maxlength="50" value="<%=subject%>"></td>
  </tr>
  <tr>
	        <td><font face="arial,helvetica" size=2><b>Mensagem :</b></font></td>
	<td><textarea name="message" cols=21 rows=5></textarea></td>
  </tr>
  <tr>
	<td align="center" colspan=2><input type="submit" value="Enviar mensagem"></td>
  </tr>
  </table>
  </td>
</tr>
</table>
</form>
  
<br>
<p><a href="index.asp">Voltar &agrave; p&aacute;gina inicial</a></p>

</font>
</body>
</html>
