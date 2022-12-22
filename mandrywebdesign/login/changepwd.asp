<%
Option Explicit
Dim username, icon

username = Request.Cookies("username")
icon = Request.QueryString("icon")
%>

<html>
<head>
<title>troca de senha</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="default.css" type=text/css rel=STYLESHEET>
<body bgcolor="#454545" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size="1"> 
<%
if username = "" then
  nologin()
end if
%>
<h3><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif">Troca de 
  senha</font> <font color="#FFFFFF">-</font> <font face="arial,helvetica" size="1"><img src="radio.gif" width="16" height="16"> 
  </font></h3>
<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"> 
<%if Request.QueryString("updated") = "true" then%>
</font><font color="#FFFFFF"> 
<p><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Sua senha foi trocada 
  com sucesso <%=Time()%></font></p>
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%else%>
<br clear="all">
<%end if%>
</font></font> 
<form action="pwd_update.asp" method="post" name="passwordform">
  <font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
  <input type="hidden" name="icon" value="<%=icon%>">
  </font> 
  <table width="100%" cellpadding="2" cellspacing="0" border="0">
    <tr> 
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Senha 
        antiga:</font></td>
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="password" name="oldpassword" size="20">
        </font></td>
    </tr>
    <tr> 
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nova 
        senha:</font></td>
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="password" name="newpassword" size="20">
        </font></td>
    </tr>
    <tr> 
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Confirme 
        a nova senha:</font></td>
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="password" name="newpasswordconfirm" size="20">
        </font></td>
    </tr>
    <tr> 
      <td colspan=2 align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="submit" name="submitbutton" value="Mude a senha" onClick="passwordform.submitbutton.value='Please wait...'">
        </font></td>
    </tr>
  </table>
  <center>
    <p><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><a href="profile.asp">voltar 
      ao perfil</a></b></font></p>
    <p><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b> 
      <a href="javascript:window.close()">fechar esta janela</a></b> </font></p>
  </center>
</form>
</font> 
</body>
</html>

<%Function nologin()%>

<p align="center"><b>Voc&ecirc; precisa estar logado para ver o seu perfil.</b></p>

<p align="center"><b><a href="javascript:window.close()">fechar esta janela</a></b></p>

</font>
</body>
</html>
<%Response.end
End Function%>