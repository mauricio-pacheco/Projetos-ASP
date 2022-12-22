<%
Option Explicit
Dim sql,rsUsers
%>
<!--#include file="conn.asp"-->
<%
sql = "SELECT * FROM users ORDER BY email"
Set rsUsers = Server.CreateObject("ADODB.Recordset")
rsUsers.Open sql, conn, 3, 3
%>

<html>
<head>

<title>Grupo Vanguarda</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="default.css" type=text/css rel=STYLESHEET>
<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<font face="arial,helvetica" size="2"> 
<h3 align="center">&nbsp;</h3>
<h3 align="center"><img src="logo.JPG" width="102" height="114"></h3>
<h3 align="center"><font face="Verdana, Arial, Helvetica, sans-serif">E-mails 
  Cadastrados</font></h3>
</font> 
<p><font face="arial,helvetica" size="2"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
  <%if not rsUsers.EOF then%>
  </font></font></p>
<p align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Aqui est&atilde;o cadastrados 
  os E-mails que os usu&aacute;rios cadastram no site!</font></p>
<font face="arial,helvetica" size="2">
<table cellpadding="2" cellspacing="0" border="0" bordercolor="#FFFFFF" width="100%">
  <tr> 
    <th width="27%"><hr></th>
  </tr>
  <%rsUsers.Movefirst
do until rsUsers.EOF%>
  <tr> 
    <td><p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">E-mail: 
        <%=rsUsers("email")%></font></p>
      </td>
  </tr>
  <tr> 
    <td><hr> </td>
  </tr>
  <%rsUsers.Movenext
loop%>
</table>
</font><font face="arial,helvetica" size="2"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%else%>
</font></font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"></font><font face="arial,helvetica" size="2"><font color="#FFFFFF"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%end if%>
</font></font> </font> 
</body>
</html>

<%
rsUsers.close
set rsUsers = nothing
conn.close
set conn = nothing
%>
