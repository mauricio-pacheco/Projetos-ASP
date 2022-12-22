<%
Option Explicit
Dim username, icon

username = Request.Cookies("username")
icon = Request.QueryString("icon")
%>

<html>
<head>
<title>Grupo Vanguarda</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>

<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<font color="#000000" size="1" face="arial,helvetica"> 
<%
if username = "" then
  nologin()
end if
%>
</font>
<h3 align="center"><font color="#0000FF"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">GRUPO</font></strong></font> 
  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#009900">VANGUARDA</font></strong></font><font face="arial,helvetica" size="1"></h3>
<p align="center">&nbsp;</p>

<h3 align="center"><img src="../logo.JPG" width="102" height="114"></h3>
<h3>&nbsp;</h3>
<h3><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif">Troca de 
  senha</font></h3>
<font color="#000000" face="Verdana, Arial, Helvetica, sans-serif"> 
<%if Request.QueryString("updated") = "true" then%>
</font><font color="#FFFFFF"> 
<p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Sua 
  senha foi trocada com sucesso <%=Time()%></font></p>
<font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%else%>
<br clear="all">
<%end if%>
</font></font> 
<form action="pwd_update.asp" method="post" name="passwordform">
  <font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
  <input type="hidden" name="icon" value="<%=icon%>">
  </font> 
  <table width="100%" cellpadding="2" cellspacing="0" border="0">
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Senha 
        antiga:</font></td>
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="password" name="oldpassword" size="20">
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nova 
        senha**:</font></td>
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="password" name="newpassword" size="20">
        **entre 5 e 15 caracteres</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Confirme 
        a nova senha:</font></td>
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="password" name="newpasswordconfirm" size="20">
        </font></td>
    </tr>
    <tr> 
      <td colspan=2 align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="submit" name="submitbutton" value="Mude a senha" onClick="passwordform.submitbutton.value='Please wait...'">
        </font></td>
    </tr>
  </table>
  <center>
    <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><a href="profile.asp">VOLTAR 
      AO PERFIL</a></b></font></p>
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