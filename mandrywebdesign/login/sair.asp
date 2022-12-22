<%
Option Explicit
Dim sql,username,rsUser,rsMessages,newcount

username = Request.Cookies("username")

'If the username cookie is set, they must have logged in, so get their details from the database
if username <> "" then
%>
<!--#include file="conn.asp"-->
<%
  sql = "UPDATE users set stats = 0 WHERE username = '"& username &"'"
  Set rsUser = Server.CreateObject("ADODB.Recordset")
  rsUser.Open sql, conn, 3, 3
  
  sql = "SELECT icon FROM Users WHERE username = '" & username & "'"
  Set rsUser = Server.CreateObject("ADODB.Recordset")
  rsUser.Open sql, conn, 3, 3
  
  sql = "SELECT messageread FROM messages WHERE sendto = '" & username & "'"
  Set rsMessages = Server.CreateObject("ADODB.Recordset")
  rsMessages.Open sql, conn, 3, 3
  
  newcount = 0
  if not rsMessages.EOF then
	rsMessages.Movefirst
	do until rsMessages.EOF
		if rsMessages("messageread") = False then
			newcount = newcount + 1
		end if
		rsMessages.Movenext
	loop
	rsMessages.Movefirst
  end if
end if
%>


<html>
<head>


<LINK href="default.css" type=text/css rel=STYLESHEET>
<title>Homepage</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body bgcolor="#454545" link="#DD0000" vlink="#DD0000" alink="#000000">
<table width="144" cellpadding=3 cellspacing=0 border=0 bordercolor="#000000" align="left">
  <tr>
    <td><p align="center"><font color="#00FF00" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Obrigado 
        pela colabora&ccedil;&atilde;o! </strong></font></p>
      <p align="center"><strong><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="signout.asp"> 
        </a><b><font color="#FFCC33" size="1" face="arial,helvetica"> 
        <embed src="../rodo.swf" width="70" height="70"></embed></font></b></font></strong></p>
      <p align="center"><strong><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="signout.asp"> 
        LOGAR</a></font></strong></p>
      <font face="arial,helvetica" size=2>&nbsp;</font></td>
  </tr>
</table>
<p align="center">&nbsp;</p>
<p align="center"><font face="arial,helvetica" size=2> </font> </p>
</body>
</html>
