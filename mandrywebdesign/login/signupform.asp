<%
Option Explicit
Dim username

username = Request.Cookies("username")
%>

<html>
<head>
<title>Cadastro Mandry Web Design</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="default.css" type=text/css rel=STYLESHEET>
<STYLE type="text/css">
<!--
BODY {
scrollbar-face-color:#000000;
scrollbar-highlight-color:#000000;
scrollbar-3dlight-color:#000000;
scrollbar-darkshadow-color:#000000;
scrollbar-shadow-color:#000000;
scrollbar-arrow-color:#000000;
scrollbar-track-color:#000000;
}
-->
</STYLE>

<body bgcolor="#292929" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size=2> 
<%'See if they're actually already logged in
if username <> "" then%>
</font> 
<p align="center">
  <embed src="../rodo.swf" width="90" height="90"></embed></p>
<p align="center"><font size="2" face="arial,helvetica"><b><font color="#FFFFFF">Voc&ecirc; 
  est&aacute; logado.</font></b></font></p>
<p align="center"><font color="#FFFFFF" size="2" face="arial,helvetica">Se voc&ecirc; 
  quer preencher um novo cadastro, precisa <b>sair do sistema </b>primeiro.</font></p>
<font face="arial,helvetica" size=2><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%'Otherwise display the sign up form
else%>
</font> </font>
<form name="signup" action="signupprocess.asp" method="post">
  <p align="center"><font color="#FFFFFF" size="2" face="arial,helvetica"> <strong>Cadastre-se 
    agora mesmo contamos com a sua colebora&ccedil;&atilde;o! O cadastro &eacute; 
    livre e gratuito.</strong></font></p>
  <table width="100%" border="0">
    <tr> 
      <td width="8%"><font color="#FFFFFF" size=2 face="arial,helvetica"><b>Nome:</b></font></td>
      <td width="27%"><font color="#FFFFFF" size=2 face="arial,helvetica"> 
        <input type="text" name="firstname" size=13>
        </font></td>
      <td width="19%"><font color="#FFFFFF" size=2 face="arial,helvetica"><b>Usu&aacute;rio</b>: 
        </font></td>
      <td width="46%"><font color="#FFFFFF" size=2 face="arial,helvetica"> 
        <input type="text" name="username" size=13 maxlenght="13">
        * max. 1 e 12 caract.</font></td>
    </tr>
    <tr> 
      <td><font color="#FFFFFF" size=2 face="arial,helvetica"><b>Sobrenome:</b> 
        </font></td>
      <td><font color="#FFFFFF" size=2 face="arial,helvetica"> 
        <input type="text" name="surname" size=13>
        </font></td>
      <td><font color="#FFFFFF" size=2 face="arial,helvetica"><b>Senha:</b> </font></td>
      <td><font color="#FFFFFF" size=2 face="arial,helvetica"> 
        <input type="password" name="password" size=13>
        * max. 5 e 15 caract.</font></td>
    </tr>
    <tr> 
      <td><font color="#FFFFFF" size=2 face="arial,helvetica"><b>Email:</b> </font></td>
      <td><font color="#FFFFFF" size=2 face="arial,helvetica"> 
        <input type="text" name="email" size=13>
        </font></td>
      <td><font color="#FFFFFF" size="2" face="arial,helvetica"><b>Confirma a 
        senha</b>: </font></td>
      <td><font color="#FFFFFF" size="2" face="arial,helvetica"> 
        <input type="password" name="passwordconfirm" size=13>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#FFFFFF" size=2 face="arial,helvetica"><b>Sexo: </b></font></td>
      <td><p><font color="#FFFFFF" size=2 face="arial,helvetica"><b> 
          <input type="radio" name="sex" value="male">
          Masculino </b></font></p>
        <p><font color="#FFFFFF" size=2 face="arial,helvetica"><b>
          <input type="radio" name="sex" value="female">
          Feminino</b></font><font color="#FFFFFF" size=2 face="arial,helvetica">&nbsp; 
          </font></p></td>
      <td><font color="#FFFFFF" size=2 face="arial,helvetica">&nbsp;</font></td>
      <td><p><font color="#FFFFFF" size=2 face="arial,helvetica"> <b>Data Nasc.:</b> 
          <input type="text" name="birth_day" value="dia" size="5" maxlength="2">
          / 
          <input type="text" name="birth_month" value="mês" size="5" maxlength="2">
          / 
          <input type="text" name="birth_year" value="ano" size="5" maxlength="4">
          </font></p>
        <p><font color="#FFFFFF" size=2 face="arial,helvetica">
          <input name="submit" type="submit" value="CADASTRAR">
          </font></p></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
<font face="arial,helvetica" size=2><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%end if%>
</font> </font> 
</body>
</html>
