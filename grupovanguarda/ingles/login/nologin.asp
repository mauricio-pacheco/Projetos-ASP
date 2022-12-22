<html>
<head>
<title>Must be logged in to view this page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>
<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<font face="arial,helvetica" size=2 color="#FFFFFF"> </font>
<form name="signin" action="signin.asp" method="post">
  <p><font color="#FFFFFF" size="2" face="arial,helvetica">
    <input type="hidden" name="page" value="<%=Request.QueryString("page")%>">
    </font></p>
  <p align="center"><font color="#0000FF"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">GRUPO</font></strong></font> 
    <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#009900">VANGUARDA</font></strong></font></p>
  <p align="center">&nbsp;</p>
  <p align="center"><font color="#FFFFFF" size="2" face="arial,helvetica"><img src="../logo.JPG" width="102" height="114"></font></p>
  <p>&nbsp;</p>
  <table width="420" cellpadding=2 cellspacing=0 align="center" border=0 bordercolor="#000000">
    <tr> 
      <th bgcolor="#FFFFFF"><font face="arial,helvetica" size=2 color="#000000">Login</font></th>
      <th bgcolor="#FFFFFF"><font face="arial,helvetica" size="2" color="#000000">Cadastro</font></th>
    </tr>
    <tr> 
      <td align="center"> <font color="#000000" size=2 face="arial,helvetica"><b> 
        Usu&aacute;rio : 
        <input type="text" name="username" size="12" style="font-family: tahoma,verdana, Arial, Helvetica, sans-serif;">
        <br>
        Senha : 
        <input type="password" name="password" size="12" style="font-family: tahoma,verdana, Arial, Helvetica, sans-serif;">
        <br>
        Lembrar senha: 
        <input type="checkbox" name="stayloggedin" value="yes">
        <br>
        <input type="submit" value="Login" style="font-family: tahoma,verdana, Arial, Helvetica, sans-serif;">
        </b></font> </td>
      <td align="center"> <font color="#000000" size=2 face="arial,helvetica">&nbsp; 
        <b><a href="signupform.asp">Ainda n&atilde;o sou membro<br>
        inscreva-me agora!</a></b>&nbsp; </font> </td>
    </tr>
  </table>
</form>
  </td>
</tr>
</table>

</body>
</html>
