<%
Option Explicit
Dim sql,rsUsers,username,startletter,alphabet,newcount

startletter = Request.QueryString("startletter")

if startletter = "" then
  startletter = "A"
end if
%>
<!--#include file="conn.asp"-->
<%
if startletter = "nonalphabet" then
  sql = "SELECT username, icon FROM users WHERE username Not Like 'a%'"
  for alphabet = 98 to 122
	sql = sql & " AND username Not Like '" & chr(alphabet) & "%'"
  next
  sql = sql & " ORDER BY username"
else
  sql = "SELECT username, icon FROM users WHERE username Like '" & startletter & "%' ORDER BY username"
end if
Set rsUsers = Server.CreateObject("ADODB.Recordset")
rsUsers.Open sql, conn, 3, 3
%>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>
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

<title>Vista M&oacute;veis - Administra&ccedil;&atilde;o</title>
</head>
<body bgcolor="#efefe7" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<p align="center"><img src="logi.gif" width="151" height="97"> <font color="#000000" size="2" face="arial,helvetica"> 
  </font></p>
<font color="#000000" size="2" face="arial,helvetica">
<div align="center"><font color="#000000" size="2" face="arial,helvetica">
  <div align="center"></div>
  </font><strong><font color="#000000" size="2" face="arial,helvetica">Administra&ccedil;&atilde;o 
  dos Cadastros Vista M&oacute;veis 
  <%if Request.Cookies("philoginadmin") = "True" then%>
  </font></strong></div>
</font> 
<div align="center"> 
  <div align="center">
<p><font color="#000000" size="2" face="arial,helvetica"><strong>Administra&ccedil;&atilde;o 
      do conte&uacute;do</strong></font></p>
  </div>
  <h3 align="center"><font color="#000000" size="2" face="arial,helvetica"><a onClick="window.open('submit.asp','Janela','toolbar=no,location=no,width=500,height=500,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes'); return false;" href="submit.asp">ENVIAR 
    CONTE&Uacute;DO</a></font></h3>
</div>
<p align="center"><font color="#000000" size="2" face="arial,helvetica"><a href="philogin_admin-signout.asp">Sair 
  do sistema</a> - <a href="philogin_admin-fulllist.asp">Lista Completa</a></font></p>
<table cellpadding="2" cellspacing="0" border="0" bordercolor="#B4B4B4" width="100%">
  <tr> 
    <td align="center" bgcolor="#efefe7" id="cell123"><font color="#000000" size="2" face="arial,helvetica"><b><a href="philogin_admin.asp?startletter=nonalphabet">123</a></b></font> 
      <font color="#000000" size="2" face="arial,helvetica"> 
      <%'Loop through alphabet (chars 65 to 90 are A-Z)
for alphabet = 65 to 90%>
      </font> 
    <td align="center" id="cell<%=chr(alphabet)%>"><font color="#000000" size="2" face="arial,helvetica"><b><a href="philogin_admin.asp?startletter=<%=chr(alphabet)%>"><%=chr(alphabet)%></a></b></font></td>
    <%next%>
  </tr>
</table>
<font color="#000000" size="2" face="arial,helvetica"> 
<%if not rsUsers.EOF then%>
</font> 
<table cellpadding="2" cellspacing="0" border="1" bordercolor="#B4B4B4" width="100%">
  <tr> 
    <th><font face="arial,helvetica" size="2" color="#000000">Usu&aacute;rio</font></th>
    <th><font face="arial,helvetica" size="2" color="#000000">Apagar Usu&aacute;rio</font></th>
  </tr>
  <%rsUsers.Movefirst
do until rsUsers.EOF%>
  <tr> 
    <td><font color="#000000" size="2" face="arial,helvetica"><%=rsUsers("username")%></font></td>
    <td align="center"><font color="#000000" size="2" face="arial,helvetica"><a href="philogin_admin-delete.asp?username=<%=rsUsers("username")%>&startletter=<%=startletter%>">Apagar 
      Usu&aacute;rio</a></font></td>
  </tr>
  <%rsUsers.Movenext
loop%>
</table>
<p>&nbsp;</p>
<p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
  <%else%>
  </font></p>
<font face="arial,helvetica" size="2">
<p align="center"><font color="#000000"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">N&atilde;o 
  existem usu&aacute;rios com a letra <%=startletter%>.</font></b></font></p>
<font color="#000000"> 
<%end if%>
<%else%>
</font></font> 
<p align="center"><font color="#000000" size="2" face="arial,helvetica"><b>Voc&ecirc; 
  n&atilde;o est&aacute; logado como administrador, por favor logue-se abaixo:</b></font></p>
<form action="philogin_admin-login.asp" method="post">
  <div align="center">
<table cellpadding=2 cellspacing=0 border=0>
      <tr> 
        <td><font color="#000000" size="2" face="arial,helvetica"><b>Usu&aacute;rio</b></font></td>
        <td><font color="#000000" size="2" face="arial,helvetica"> 
          <input type="text" name="username" size="22">
          </font></td>
      </tr>
      <tr> 
        <td><font color="#000000" size="2" face="arial,helvetica"><b>Senha</b></font></td>
        <td><font color="#000000" size="2" face="arial,helvetica"> 
          <input type="password" name="password" size="11">
          <input name="submit" type="submit" value="Log In">
          </font></td>
      </tr>
    </table>
  </div>
</form>
<font color="#000000" size="2" face="arial,helvetica"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%end if%>
</font></font> 
</body>
</html>

<%
rsUsers.close
set rsUsers = nothing
conn.close
set conn = nothing
%>
