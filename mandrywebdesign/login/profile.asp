<%
Option Explicit
Dim sql, rsProfile, username, malechecked, femalechecked, sendemailchecked

username = Request.Cookies("username")
%>

<html>
<head>
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<title>Perfil</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="default.css" type=text/css rel=STYLESHEET>
<body bgcolor="#454545" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size="1"> 
<%
if username = "" then
  nologin()
end if
%>
<!--#include file="conn.asp"-->
<%
sql = "SELECT * FROM Users WHERE username = '" & username & "'"
Set rsProfile = Server.CreateObject("ADODB.Recordset")
rsProfile.Open sql, conn, 3, 3
%>
<h3><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"> Perfil 
  de <img src="radio.gif" width="16" height="16"> -<font face="arial,helvetica" size="1"> 
  <%=username%></font> </font></h3>
<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"> 
<%if Request.QueryString("updated") = "true" then%>
</font><font color="#FFFFFF"> 
<p><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Seu perfil foi 
  alterado com sucesso <%=Time()%></font></p>
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%else%>
<br clear="all">
<%end if%>
</font></font> 
<form action="profile_update.asp" method="post" name="profileform">
  <table width="100%" cellpadding="2" cellspacing="0" border="0">
    <tr> 
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        :</font></td>
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="firstname" size="20" value="<%=rsProfile("firstname")%>">
        </font></td>
    </tr>
    <tr> 
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Sobrenome 
        :</font></td>
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="surname" size="20" value="<%=rsProfile("surname")%>">
        </font></td>
    </tr>
    <tr> 
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Email 
        :</font></td>
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="email" size="20" value="<%=rsProfile("email")%>">
        </font></td>
    </tr>
    <tr> 
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nascimento:</font></td>
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="birth_day" value="<%=day(rsProfile("dob"))%>" size="2" maxlength="2">
        <input type="text" name="birth_month" value="<%=month(rsProfile("dob"))%>" size="2" maxlength="2">
        <input type="text" name="birth_year" value="<%=year(rsProfile("dob"))%>" size="4" maxlength="4">
        </font></td>
    </tr>
    <tr> 
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Signo:</font></td>
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsProfile("starsign")%></font></td>
    </tr>
    <tr> 
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Sexo 
        :</font></td>
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
  if rsProfile("sex") = "male" then
    malechecked = " checked"
  else
    femalechecked = " checked"
  end if
  %>
        <input type="radio" name="sex" value="male"<%=malechecked%>>
        Masculino 
        <input type="radio" name="sex" value="female"<%=femalechecked%>>
        Feminino</font></td>
    </tr>
    <tr> 
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Entrar 
        senha:</font></td>
      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="password" name="password" size="20">
        </font></td>
    </tr>
    <tr> 
      <td colspan=2 align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="submit" name="submitbutton" value="Mudar detalhes" onClick="profileform.submitbutton.value='Please wait...'">
        </font></td>
    </tr>
  </table>
  <center>
    <p><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><a href="changepwd.asp?icon=<%=rsProfile("icon")%>">Mudar 
      senha</a></b></font></p>
    <p><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><br>
      <a href="javascript:window.close()">Fechar esta janela</a></b> </font> </p>
  </center>
</form>
</font> 
</body>
</html>

<%
rsProfile.close
set rsProfile = nothing
conn.close
set conn = nothing
%>

<%Function nologin()%>

<p align="center"><b>Voc&ecirc; precisa estar logado para mudar seu perfil.</b></p>

<p align="center"><b><a href="javascript:window.close()">Fechar esta janela</a></b></p>

</font>
</body>
</html>
<%Response.end
End Function%>