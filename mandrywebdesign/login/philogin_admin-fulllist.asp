<%
Option Explicit
Dim sql,rsUsers

if Request.Cookies("philoginadmin") = "True" then
%>
<!--#include file="conn.asp"-->
<%
sql = "SELECT * FROM users ORDER BY username"
Set rsUsers = Server.CreateObject("ADODB.Recordset")
rsUsers.Open sql, conn, 3, 3
%>

<html>
<head>

<script language="JavaScript">
<!-- hide on

function popup(popupfile,winheight,winwidth,scrolls)
{
open(popupfile,"PopupWindow","resizable=no,height=" + winheight + ",width=" + winwidth + ",scrollbars=no" + scrolls);
}

// hide off -->
</script>

<title>Philogin User List</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="default.css" type=text/css rel=STYLESHEET>
<body bgcolor="#292929" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size="2"> 
<h3 align="center">&nbsp; </h3>
<h3 align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif">Administra&ccedil;&atilde;o 
  dos Ouvintes da Radio 95.9 Online.</font></h3>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><img src="menor.jpg" width="180" height="131"></font></p>
<font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%if not rsUsers.EOF then%>
</font> 
<table cellpadding="2" cellspacing="0" border="1" bordercolor="#B4B4B4" width="100%">
  <tr bgcolor="#B4B4B4"> 
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Membro</font></th>
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Senha</font></th>
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Nome</font></th>
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Sobrenome</font></th>
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Email</font></th>
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">DOB</font></th>
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Starsign</font></th>
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Sexo</font></th>
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Icone</font></th>
  </tr>
  <%rsUsers.Movefirst
do until rsUsers.EOF%>
  <tr> 
    <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("username")%></font></td>
    <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("password")%></font></td>
    <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("firstname")%></font></td>
    <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("surname")%></font></td>
    <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("email")%></font></td>
    <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("dob")%></font></td>
    <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("starsign")%></font></td>
    <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("sex")%></font></td>
    <td align="center"><img src="radio.gif" width="16" height="16"></td>
  </tr>
  <%rsUsers.Movenext
loop%>
</table>
<font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%else%>
</font><font color="#FFFFFF"> 
<p><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b>Desculpe, sem 
  membros cadastrados.</b></font></p>
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%end if%>
<%else
Response.Redirect("philogin_admin.asp")
end if%>
</font></font> </font> 
</body>
</html>

<%
rsUsers.close
set rsUsers = nothing
conn.close
set conn = nothing
%>
