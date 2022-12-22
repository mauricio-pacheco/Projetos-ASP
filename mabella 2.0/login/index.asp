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
open(popupfile,"PopupWindow","resizable=no,height=" + winheight + ",width=" + winwidth + ",scrollbars=yes");
}

// hide off -->
</script>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>
<title>Frigor&iacute;fico Mabella</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<p>&nbsp;</p>
<p align="center"><img src="logo.jpg">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Venha 
  fazer parte da fam&iacute;lia Mabella. Seu curr&iacute;culo ser&aacute; recebido 
  e avaliado por nossa equipe de recursos humanos.<br>
  Para atualizar seu curr&iacute;culo utilize o Login abaixo. </font></p>
<p align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Se 
  ainda n&atilde;o enviou o seu Curriculum <a href="signupform.asp">CLIQUE AQUI</a> 
  !</font><font face="arial,helvetica" size=2></font></p>
<font face="arial,helvetica" size=2>
<table width="144" cellpadding=3 cellspacing=0 border=0 bordercolor="#000000" align="center">
  <%'If they're not logged in, then display a login box
if username = "" then%>
  <tr> 
    <th width="138" bgcolor="#FFFFFF"> <div align="center"><font color="#000000" size="2" face="arial,helvetica">Curriculum 
        Online ! </font></div></th>
  </tr>
  <tr> 
    <form name="login" action="signin.asp" method="post">
      <input type="hidden" name="page" value="index.asp">
      <td align="center" bgcolor="#FFFFFF"> <div align="left"> 
          <p align="center">&nbsp;</p>
          <p align="center"><font color="#000000" size=1 face="arial,helvetica"><b>Usu&aacute;rio 
            : 
            <input type="text" name="username" size="16" style="font-size: 8pt; font-family: Tahoma, Verdana Arial, Helvetica, sans-serif;">
            <br>
            Senha : 
            <input type="password" name="password" size="16" style="font-size: 8pt; font-family: Arial, Helvetica, sans-serif;">
            </b></font></p>
          <p align="center"><font color="#000000" size=1 face="arial,helvetica"><b> 
            <input name="submit" type="submit" style="font-size: 8pt; font-family: Arial, Helvetica, sans-serif;" value="Login">
            </b></font></p>
        </div></td>
    </form>
  </tr>
  <%'If they are, show a mini profile box plus a sign out link
else%>
  <tr> 
    <td bgcolor="#FFFFFF"> <div align="center"> 
        <p><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Seja 
          bem vindo!!!</strong></font><font color="#000000" size=1 face="arial,helvetica"><b><font size="2"><b> 
          </b><%=username%></font></b></font></p>
        <p><font color="#000000"><font size=1 face="Verdana, Arial, Helvetica, sans-serif"><a href="profile.asp">Editar 
          Perfil</a><b><br>
          <br>
          </b><a href="sair.asp">Sair do Sistema!</a></font><font color="#330099" size=1 face="Verdana, Arial, Helvetica, sans-serif"> 
          </font></font> </p>
      </div></td>
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
