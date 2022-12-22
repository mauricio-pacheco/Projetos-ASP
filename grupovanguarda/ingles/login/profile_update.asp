<%
Option Explicit
Dim sql, rsUser, username, firstname, surname, email, dob, sex, notfilled(5), badflag, count, calltype, starsign, dobmonth, dobday, sendemail, password, datanascimento, cidade, estado, pais, sugestao

username = Request.Cookies("username")

'Assign form values to variables

firstname = Request.Form("firstname")
surname = Request.Form("surname")
email = Request.Form("email")
sex = Request.Form("sex")
password = Request.Form("password")
datanascimento = Request.Form("datanascimento")
cidade = Request.Form("cidade")
estado = Request.Form("estado")
pais = Request.Form("pais")
sugestao = Request.Form("sugestao")

if Request.Form("sendemail") = "True" then
	sendemail = True
else
	sendemail = False
end if

'Check everything's been filled in, badflag determines whether error function is called
badflag = 0

if firstname = "" then
	notfilled(0) = "Nome"
	badflag = 1
end if
if surname = "" then
	notfilled(1) = "Sobrenome"
	badflag = 1
end if
if email = "" then
	notfilled(2) = "E-mail"
	badflag = 1
end if
if sex = "" then
	notfilled(3) = "Sexo"
	badflag = 1
end if
if password = "" then
	notfilled(5) = "Senha"
	badflag = 1
end if

if badflag = 1 then
	signuperror("nofield")
end if

'Open connection and insert user details into the database
%>
<!--#include file="conn.asp"-->
<%
getstarsign()

Set rsUser = Server.CreateObject("ADODB.Recordset")
rsUser.open "users WHERE username = '" & username & "'", conn, 3, 3

if rsUser("password") = password then
	rsUser("firstname") = firstname
	rsUser("surname") = surname
	rsUser("email") = email
	rsUser("dob") = dob
	rsUser("starsign") = starsign
	rsUser("sex") = sex
	rsUser("datanascimento") = datanascimento
	rsUser("cidade") = cidade
	rsUser("estado") = estado
	rsUser("pais") = pais
	rsUser("sugestao") = sugestao
	rsUser("sendemail") = sendemail
	
	rsUser.Update
else
	signuperror("badpwd")
end if
rsUser.close
set rsUser = nothing
conn.close
set conn = nothing

Response.Redirect("profile.asp?updated=true")
%>

<%
Function getstarsign()
dobmonth = Request.Form("birth_month")
dobday = Request.Form("birth_day")
Select Case dobmonth
	Case 1
		if dobday < 21 then
			starsign = "Capricórnio"
		else
			starsign = "Aquario"
		end if
	Case 2
		if dobday < 20 then
			starsign = "Aquario"
		else
			starsign = "Peixes"
		end if
	Case 3
		if dobday < 21 then
			starsign = "Peixes"
		else
			starsign = "Aries"
		end if
	Case 4
		if dobday < 21 then
			starsign = "Aries"
		else
			starsign = "Touro"
		end if
	Case 5
		if dobday < 22 then
			starsign = "Touro"
		else
			starsign = "Gemêos"
		end if
	Case 6
		if dobday < 22 then
			starsign = "Gemêos"
		else
			starsign = "Câncer"
		end if
	Case 7
		if dobday < 24 then
			starsign = "Câncer"
		else
			starsign = "Leão"
		end if
	Case 8
		if dobday < 24 then
			starsign = "Leão"
		else
			starsign = "Virgem"
		end if
	Case 9
		if dobday < 24 then
			starsign = "Virgem"
		else
			starsign = "Libra"
		end if
	Case 10
		if dobday < 24 then
			starsign = "Libra"
		else
			starsign = "Scorpião"
		end if
	Case 11
		if dobday < 23 then
			starsign = "Scorpião"
		else
			starsign = "Sargitário"
		end if
	Case 12
		if dobday < 22 then
			starsign = "Sargitário"
		else
			starsign = "Capricórnio"
		end if
End Select
End Function
%>

<%Function signuperror(errortype)%>
<STYLE type="text/css">
<!--
BODY {
scrollbar-face-color:#454545;
scrollbar-highlight-color:#454545;
scrollbar-3dlight-color:#454545;
scrollbar-darkshadow-color:#454545;
scrollbar-shadow-color:#454545;
scrollbar-arrow-color:#454545;
scrollbar-track-color:#454545;
}
-->
</STYLE>

<html>
<head>
<title>Grupo Vanguarda</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>
<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<div align="center"> 
  <p>&nbsp;</p>
  <p><font color="#0000FF"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">GRUPO</font></strong></font> 
    <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#009900">VANGUARDA</font></strong></font></p>
  <p>&nbsp;</p>
  <p><img src="../logo.JPG" width="102" height="114"></p>
  <p>&nbsp;</p>
  <p><font color="#000000" size="2" face="arial,helvetica"> 
    <%if errortype = "nofield" then%>
    </font></p>
</div>
<div align="center"></div>
<font face="arial,helvetica">
<p align="center"><font color="#000000" size="2"><b>Voc&ecirc; n&atilde;o preencheu 
  os seguintes dados corretamente:</b></font></p>
</font> 
<p align="center"> <font color="#000000" size="2" face="arial,helvetica"> 
  <%for count = 0 to 5%>
  <%if notfilled(count) <> "" then%>
  <b><%=notfilled(count)%></b><br>
  <%end if%>
  <%next%>
  </font></p>
<div align="center"><font color="#000000" size="2" face="arial,helvetica"> 
  <%else%>
  </font> </div>
<p align="center"><font color="#000000" size="2" face="arial,helvetica">Sua senha 
  est&aacute; incorreta</font></p>
<div align="center"><font color="#000000" size="2" face="arial,helvetica"> 
  <%end if%>
  </font> </div>
<p align="center"><font color="#000000" size="2" face="arial,helvetica"><a href="javascript:self.history.go(-1)">Tente 
  novamente</a></font></p>
<p align="center">&nbsp;</p>
</body>
</html>
<%Response.end
End Function%>
