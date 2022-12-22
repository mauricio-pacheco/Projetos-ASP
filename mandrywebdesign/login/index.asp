<%
Option Explicit
Dim sql,username,rsUser,rsMessages,newcount

username = Request.Cookies("username")

'If the username cookie is set, they must have logged in, so get their details from the database
if username <> "" then
%>
<!--#include file="conn.asp"-->
<%
  
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

<script language="JavaScript">
<!-- hide on

function popup(popupfile,winheight,winwidth)
{
open(popupfile,"PopupWindow","resizable=no,height=" + winheight + ",width=" + winwidth + ",scrollbars=no");
}

// hide off -->
</script>
<LINK href="default.css" type=text/css rel=STYLESHEET>
<title>Homepage</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body bgcolor="#454545" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size=2> 
<table width="144" cellpadding=3 cellspacing=0 border=0 bordercolor="#000000" align="left">
  <%'If they're not logged in, then display a login box
if username = "" then%>
  <tr> 
    <form name="login" action="signin.asp" method="post">
      <input type="hidden" name="page" value="index.asp">
      <td width="138" align="center" bgcolor="#000000"> <div align="left"> 
          <p align="center"><b><font color="#FFCC33" size="1" face="arial,helvetica"> 
            <embed src="../rodo.swf" width="50" height="50"></embed></font></b></p>
          <p align="center"><font face="arial,helvetica" size=1><b><font color="#FFFFFF">Usu&aacute;rio 
            :</font> 
            <input type="text" name="username" size="10" style="font-size: 8pt; font-family: Tahoma, Verdana Arial, Helvetica, sans-serif;">
            <br>
            <font color="#FFFFFF">Senha :</font> 
            <input type="password" name="password" size="10" style="font-size: 8pt; font-family: Arial, Helvetica, sans-serif;">
            </b></font></p>
          <p align="center"><font face="arial,helvetica" size=1><b>
            <input name="submit" type="submit" style="font-size: 8pt; font-family: Arial, Helvetica, sans-serif;" value="Login">
            </b></font><font face="arial,helvetica" size=1><b> </b></font></p>
          </div></td>
    </form>
  </tr>
  <%'If they are, show a mini profile box plus a sign out link
else%>
  <tr> 
    <td bgcolor="#000000"> <p align="center"><font face="arial,helvetica" size=1><b><font color="#00FF00" size="2">Seja 
        bem vindo <font face="arial,helvetica" size=1><b><font face="arial,helvetica" size=1><b><font face="arial,helvetica" size=1><b><font color="#FFCC33" size="1"><%=username%> 
        </font></b></font></b></font></b></font>!!!</font></b></font><font color="#FFFFFF" size=1 face="arial,helvetica"><b><a href="sair.asp"> 
        </a></b></font></p>
      <p align="center"><b><font color="#FFCC33" size="1" face="arial,helvetica"> 
        <embed src="../rodo.swf" width="60" height="60"></embed></font></b></p>
      <p align="center"><font color="#FFFFFF" size=1 face="arial,helvetica"><b><a href="sair.asp"> 
        SAIR!</a> </b></font> </p></td>
  </tr>
  <%
rsUser.close
set rsUser = nothing
rsMessages.close
set rsMessages = nothing
conn.close
set conn = nothing
end if
%>
</table>
</font> 
</body>
</html>
