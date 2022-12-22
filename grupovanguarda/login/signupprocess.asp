<%
Option Explicit
Dim sql, rsUser, username, password, passwordconfirm, firstname, surname, email, sex, notfilled(7), badflag, count, passwordLength, calltype, starsign, dobmonth, dobday, sendemail, cidade, estado, sugestao, pais, outropais, datanascimento, vinculo, area, cargo, estadocivil, natural, nacional, cpf, endereco, numero, complemento, cep, telefone, celular, nivel, status_, inst, nivel2, status2, inst2, nivel3, status3, inst3, nomecurso, entidadecurso, datacurso, cargacurso, nomecurso2, entidadecurso2, datacurso2, cargacurso2, nomecurso3, entidadecurso3, datacurso3, cargacurso3, ingles, espanhol, italiano, alemao, inglesc, espanholc, italianoc, alemaoc, outroidioma, outroidiomac, editort, editortc, planilha, planilhac, programas, programasc, conhecimento, conhecimentoc, infoutros, nomeempresa, cargoempresa, estadoemp, cidadeemp, paisemp, nomeempresa2, cargoempresa2, estadoemp2, cidadeemp2, paisemp2, nomeempresa3, cargoempresa3, estadoemp3, cidadeemp3, paisemp3

'Assign form values to variables
username = Request.Form("username")

'Make sure they've not put any quotation marks in their username
If InStr(username,chr(34)) <> 0 or InStr(username,chr(39)) <> 0 then
	errorfunction("invalidchars")
end if

firstname = Request.Form("firstname")
surname = Request.Form("surname")
email = Request.Form("email")
sex = Request.Form("sex")
password = Request.Form("password")
passwordconfirm = Request.Form("passwordconfirm")
cidade = Request.Form("cidade")
estado = Request.Form("estado")
sugestao = Request.Form("sugestao")
pais = Request.Form("pais")
outropais = Request.Form("outropais")
datanascimento = Request.Form("datanascimento")
vinculo = Request.Form("vinculo")
area = Request.Form("area")
cargo = Request.Form("cargo")
estadocivil = Request.Form("estadocivil")
natural = Request.Form("natural")
nacional = Request.Form("nacional")
cpf = Request.Form("cpf")
endereco = Request.Form("endereco")
numero = Request.Form("numero")
complemento = Request.Form("complemento")
cep = Request.Form("cep")
telefone = Request.Form("telefone")
celular = Request.Form("celular")
nivel = Request.Form("nivel")
status_ = Request.Form("status_")
inst = Request.Form("inst")
nivel2 = Request.Form("nivel2")
status2 = Request.Form("status2")
inst2 = Request.Form("inst2")
nivel3 = Request.Form("nivel3")
status3 = Request.Form("status3")
inst3 = Request.Form("inst3")
nomecurso = Request.Form("nomecurso")
entidadecurso = Request.Form("entidadecurso")
datacurso = Request.Form("datacurso")
cargacurso = Request.Form("cargacurso")
nomecurso2 = Request.Form("nomecurso2")
entidadecurso2 = Request.Form("entidadecurso2")
datacurso2 = Request.Form("datacurso2")
cargacurso2 = Request.Form("cargacurso2")
nomecurso3 = Request.Form("nomecurso3")
entidadecurso3 = Request.Form("entidadecurso3")
datacurso3 = Request.Form("datacurso3")
cargacurso3 = Request.Form("cargacurso3")
ingles = Request.Form("ingles")
espanhol = Request.Form("espanhol")
italiano = Request.Form("italiano")
alemao = Request.Form("alemao")
inglesc = Request.Form("inglesc")
espanholc = Request.Form("espanholc")
italianoc = Request.Form("italianoc")
alemaoc = Request.Form("alemaoc")
outroidioma = Request.Form("outroidioma")
outroidiomac = Request.Form("outroidiomac")
editort = Request.Form("editort")
editortc = Request.Form("editortc")
planilha = Request.Form("planilha")
planilhac = Request.Form("planilhac")
programas = Request.Form("programas")
programasc = Request.Form("programasc")
conhecimento = Request.Form("conhecimento")
conhecimentoc = Request.Form("conhecimentoc")
infoutros = Request.Form("infoutros")
nomeempresa = Request.Form("nomeempresa")
cargoempresa = Request.Form("cargoempresa")
estadoemp = Request.Form("estadoemp")
cidadeemp = Request.Form("cidadeemp")
paisemp = Request.Form("paisemp")
nomeempresa2 = Request.Form("nomeempresa2")
cargoempresa2 = Request.Form("cargoempresa2")
estadoemp2 = Request.Form("estadoemp2")
cidadeemp2 = Request.Form("cidadeemp2")
paisemp2 = Request.Form("paisemp2")
nomeempresa3 = Request.Form("nomeempresa3")
cargoempresa3 = Request.Form("cargoempresa3")
estadoemp3 = Request.Form("estadoemp3")
cidadeemp3 = Request.Form("cidadeemp3")
paisemp3 = Request.Form("paisemp3")

'Only way to set a variable from a checkbox:
if Request.Form("sendemail") = "on" then sendemail = True else sendemail = False end if

'Check everything's been filled in, badflag determines whether error function is called
badflag = 0

'nofilled() is an array that will store the fields which are not filled in

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
if username = "" then
	notfilled(3) = "Ouvinte"
	badflag = 1
end if
if password = "" then
	notfilled(4) = "Senha"
	badflag = 1
end if
if sex = "" then
	notfilled(5) = "Sexo"
	badflag = 1
end if
if badflag = 1 then
	signuperror()
end if

'Check password length is between 5 and 15 characters long
passwordLength = Len(password)
if passwordLength < 5 or passwordLength > 15 then
	errorfunction("length")
end if

'Check password and confirmed password are the same
if password <> passwordconfirm then
	errorfunction("confirm")
end if

'Open connection and insert user details into the database
%>
<!--#include file="conn.asp"-->
<%

'For a bit of profiling fun, get their star sign
getstarsign()

'Then add it to the database. It's in a seperate function because we need to error trap to see if there's been a duplicate entry. It's not good form to have On Error Resume Next throughout your whole page

UserUpdate()

Function UserUpdate()
On Error Resume Next

Set rsUser = Server.CreateObject("ADODB.Recordset")
rsUser.open "users", conn, 3, 3
rsUser.AddNew
rsUser("username") = username
rsUser("password") = password
rsUser("firstname") = firstname
rsUser("surname") = surname
rsUser("email") = email
rsUser("starsign") = starsign
rsUser("sex") = sex
rsUser("sendemail") = sendemail
rsUser("cidade") = cidade
rsUser("estado") = estado
rsUser("sugestao") = sugestao
rsUser("pais") = pais
rsUser("outropais") = outropais
rsUser("datanascimento") = datanascimento
rsUser("vinculo") = vinculo
rsUser("area") = area
rsUser("cargo") = cargo
rsUser("estadocivil") = estadocivil
rsUser("natural") = natural
rsUser("nacional") = nacional
rsUser("cpf") = cpf
rsUser("endereco") = endereco
rsUser("numero") = numero
rsUser("complemento") = complemento
rsUser("cep") = cep
rsUser("telefone") = telefone
rsUser("celular") = celular
rsUser("nivel") = nivel
rsUser("status_") = status_
rsUser("inst") = inst
rsUser("nivel2") = nivel2
rsUser("status2") = status2
rsUser("inst2") = inst2
rsUser("nivel3") = nivel3
rsUser("status3") = status3
rsUser("inst3") = inst3
rsUser("nomecurso") = nomecurso
rsUser("entidadecurso") = entidadecurso
rsUser("datacurso") = datacurso
rsUser("cargacurso") = cargacurso
rsUser("nomecurso2") = nomecurso2
rsUser("entidadecurso2") = entidadecurso2
rsUser("datacurso2") = datacurso2
rsUser("cargacurso2") = cargacurso2
rsUser("nomecurso3") = nomecurso3
rsUser("entidadecurso3") = entidadecurso3
rsUser("datacurso3") = datacurso3
rsUser("cargacurso3") = cargacurso3
rsUser("ingles") = ingles
rsUser("espanhol") = espanhol
rsUser("italiano") = italiano
rsUser("alemao") = alemao
rsUser("inglesc") = inglesc
rsUser("espanholc") = espanholc
rsUser("italianoc") = italianoc
rsUser("alemaoc") = alemaoc
rsUser("outroidioma") = outroidioma
rsUser("outroidiomac") = outroidiomac
rsUser("editort") = editort
rsUser("editortc") = editortc
rsUser("planilha") = planilha
rsUser("planilhac") = planilhac
rsUser("programas") = programas
rsUser("programasc") = programasc
rsUser("conhecimento") = conhecimento
rsUser("conhecimentoc") = conhecimentoc
rsUser("infoutros") = infoutros
rsUser("nomeempresa") = nomeempresa
rsUser("cargoempresa") = cargoempresa
rsUser("estadoemp") = estadoemp
rsUser("cidadeemp") = cidadeemp
rsUser("paisemp") = paisemp
rsUser("nomeempresa2") = nomeempresa2
rsUser("cargoempresa2") = cargoempresa2
rsUser("estadoemp2") = estadoemp2
rsUser("cidadeemp2") = cidadeemp2
rsUser("paisemp2") = paisemp2
rsUser("nomeempresa3") = nomeempresa3
rsUser("cargoempresa3") = cargoempresa3
rsUser("estadoemp3") = estadoemp3
rsUser("cidadeemp3") = cidadeemp3
rsUser("paisemp3") = paisemp3

rsUser.Update

if Err.Number = -2147217887 then
	Err.clear
	errorfunction("badusername")
else
	'Set username cookie to sign them in now
	Response.Cookies("username") = username
%>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>

<html>
<head>
<title>Grupo Vanguarda</title>
</head>
<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<font face="arial,helvetica" size=2> </font> 
<p align="center">&nbsp;</p>
<p align="center"><font color="#0000FF"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">GRUPO</font></strong></font> 
  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#009900">VANGUARDA</font></strong></font></p>
<p align="center">&nbsp;</p>
<p align="center"><img src="../logo.JPG" width="102" height="114"></p>
<p align="center">&nbsp;</p>
<p align="center"><font color="#000000" size="2" face="arial,helvetica"><b>O seu 
  curriculum foi cadastrado com sucesso<font color="#0000FF"> <%=firstname%>&nbsp;<%=surname%></font> 
  !</b></font></p>
<p align="center"><font color="#000000" size="2" face="arial,helvetica"><b>Voc&ecirc; 
  agora possui um nome de Usu&aacute;rio <font color="#0000FF"><%=username%> <font color="#000000">!</font> 
  </font></b></font></p>
<p align="center"><font color="#000000" size="2" face="arial,helvetica"><b>Fa&ccedil;a 
  j&aacute; o seu login se quiser fazer alguma altera&ccedil;&atilde;o nos seus 
  dados.</b></font></p>
<p align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="index.asp">LOGIN</a></font></p>
<p align="center">&nbsp;</p>
<font face="arial,helvetica" size=2></font> 
<p>&nbsp; 
</body>
</html>

<%
rsUser.close
set rsUser = nothing
conn.close
set conn = nothing
%>
<%
end if
End Function%>


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
			starsign = "Cancer"
		end if
	Case 7
		if dobday < 24 then
			starsign = "Cancer"
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

<%Function signuperror()%>
<html>
<head>
<title>Philweb - Free ASP Applications</title>
</head>
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

<body bgcolor="#292929" text="#FFFFFF" link="#DD0000" vlink="#DD0000" alink="#000000">
<font color="#FFFFFF" face="arial,helvetica" size=2>

<p align="center"><b>Você deve preencher os campos corretamente:</b></p>

<%for count = 0 to 7%>
	<%if notfilled(count) <> "" then%>
	<b><%=notfilled(count)%></b><br>
	<%end if%>
<%next%>

<p align="center"><a href="javascript:self.history.go(-1)">Tente Novamente</a></p>

</font>
</table>

</body>
</html>
<%Response.end
End Function%>


<%Function errorfunction(calltype)%>
<html>
<head>
<title>Grupo Vanguarda</title>
</head>
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

<body bgcolor="#292929" text="#FFFFFF" link="#DD0000" vlink="#DD0000" alink="#000000">
<font color="#FFFFFF" face="arial,helvetica" size=2>

<%if calltype = "confirm" then%>
<p align="center"><b>Sua senha está incorreta:</b></p>
<p align="center"><a href="javascript:self.history.go(-1)">Tente Novamente</a></p>

</font>
</body>
</html>
<%Response.end%>
<%elseif calltype = "length" then%>
<p align="center"><b>Sua senha deve ter no minimo 5 e no máximo 15 caracteres:</b></p>
<p align="center"><a href="javascript:self.history.go(-1)">Tente Novamente</a></p>

</font>
</body>
</html>
<%Response.end%>
<%elseif calltype = "badusername" then%>
<p align="center"><b>Desculpe, mas o ouvinte &quot;<%=username%>&quot; já existe.</b></p>
<p align="center"><a href="javascript:self.history.go(-1)">Tente Novamente</a></p>

</font>
</body>
</html>
<%
rsUser.close
set rsUser = nothing
conn.close
set conn = nothing
Response.end
%>
<%elseif calltype = "invalidchars" then%>
<p align="center"><b>Desculpe, mas este ouvinte não pode ser cadastrado.</b></p>
<p align="center"><a href="javascript:self.history.go(-1)">Tente Novamente</a></p>

</font>
</body>
</html>
<%Response.end%>
<%end if
End Function%>
