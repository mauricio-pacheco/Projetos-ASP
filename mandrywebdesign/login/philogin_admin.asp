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
<LINK href="default.css" type=text/css rel=STYLESHEET>
<STYLE type="text/css">
<!--
BODY {
scrollbar-face-color:#0080C0;
scrollbar-highlight-color:#0080C0;
scrollbar-3dlight-color:#454545;
scrollbar-darkshadow-color:#454545;
scrollbar-shadow-color:#454545;
scrollbar-arrow-color:#FFFFFF;
scrollbar-track-color:#454545;
}
-->
</STYLE>

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
</head>
<body bgcolor="#292929" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size="2"> 
<h3 align="center"> <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif">Administra&ccedil;&atilde;o 
  dos ouvintes Radio 95.9 FM Online</font></h3>
<p align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"><img src="menor.jpg" width="180" height="131"></font></p>
<font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%if Request.Cookies("philoginadmin") = "True" then%>
</font><font color="#FFFFFF"> 
<p><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="philogin_admin-signout.asp">Sair 
  do sistema</a></font></p>
</font> 
<table cellpadding="2" cellspacing="0" border="0" bordercolor="#B4B4B4" width="100%">
  <tr> 
    <td align="center" id="cell123"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><a href="philogin_admin.asp?startletter=nonalphabet" onMouseOver="cell123.bgColor='#B4B4B4'" onMouseOut="cell123.bgColor='#FFFFFF'">123</a></b></font> 
      <font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
      <%'Loop through alphabet (chars 65 to 90 are A-Z)
for alphabet = 65 to 90%>
      </font> 
    <td align="center" id="cell<%=chr(alphabet)%>"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><a href="philogin_admin.asp?startletter=<%=chr(alphabet)%>" onMouseOver="cell<%=chr(alphabet)%>.bgColor='#B4B4B4'" onMouseOut="cell<%=chr(alphabet)%>.bgColor='#FFFFFF'"><%=chr(alphabet)%></a></b></font></td>
    <%next%>
  </tr>
</table>
<font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%if not rsUsers.EOF then%>
</font> 
<table cellpadding="2" cellspacing="0" border="1" bordercolor="#B4B4B4" width="100%">
  <tr bgcolor="#B4B4B4"> 
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Membro</font></th>
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Icone</font></th>
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Perfil</font></th>
    <th bgcolor="#0099cc"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Apagar 
      membro</font></th>
  </tr>
  <%rsUsers.Movefirst
do until rsUsers.EOF%>
  <tr> 
    <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("username")%></font></td>
    <td align="center"><img src="radio.gif" width="16" height="16"></td>
    <td align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="javascript:popup('philogin_admin-profile.asp?username=<%=rsUsers("username")%>',350,275,'no')">Ver/editar 
      perfil </a></font></td>
    <td align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="philogin_admin-delete.asp?username=<%=rsUsers("username")%>&startletter=<%=startletter%>">Apagar 
      usu&aacute;rio</a></font></td>
  </tr>
  <%rsUsers.Movenext
loop%>
</table>
</font> 
<p>&nbsp;</p>
<p><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
  <%else%>
  </font><font face="arial,helvetica" size="2"> </font></p>
<font face="arial,helvetica" size="2"> 
<p><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Desculpe, 
  n&atilde;o existem membros com esta letra<%=startletter%>.</font></b></p>
<%end if%>
<%else%>
</font>
<p align="center"><font size="2" face="arial,helvetica"><b><font color="#FFFFFF">Voc&ecirc; 
  n&atilde;o est&aacute; logado como administrador, por favor logue-se abaixo:</font></b></font></p>
<form action="philogin_admin-login.asp" method="post">
  <div align="center">
    <table cellpadding=2 cellspacing=0 border=0>
      <tr> 
        <td><font color="#FFFFFF" size="2" face="arial,helvetica"><b>Usu&aacute;rio</b></font></td>
        <td><font color="#FFFFFF" size="2" face="arial,helvetica"> 
          <input type="text" name="username" size="20">
          </font></td>
      </tr>
      <tr> 
        <td><font color="#FFFFFF" size="2" face="arial,helvetica"><b>Senha</b></font></td>
        <td><font color="#FFFFFF" size="2" face="arial,helvetica"> 
          <input type="password" name="password" size="20">
          </font></td>
      </tr>
      <tr> 
        <td colspan="2"><font color="#FFFFFF" size="2" face="arial,helvetica"> 
          <input type="submit" value="Log In">
          </font></td>
      </tr>
    </table>
  </div>
</form>
<font face="arial,helvetica" size="2"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%end if%>
</font> </font> 
</body>
</html>

<%
rsUsers.close
set rsUsers = nothing
conn.close
set conn = nothing
%>
