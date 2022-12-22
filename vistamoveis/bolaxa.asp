<%

'por: Mauricio Pacheco
Dim iMail, Nome, meu_email, endereco, bairro, cidade, estado, outropais, cep, pais, cppj, estadual, email, telefone, contato, sugestao, mensagem

Nome = Request.form("nome") 
Endereco = Request.form("endereco")
Bairro = Request.form("bairro")
Cidade = Request.form("cidade")
Estado = Request.form("estado")
Outropais = Request.form("outropais")
Cep = Request.form("cep")
Pais = Request.form("pais")
Cppj = Request.form("cppj")
Estadual = Request.form("estadual")
Email = Request.form("email")
Telefone = Request.form("telefone")
Contato = Request.form("contato")
Sugestao = Request.form("sugestao")
Mensagem = Request.form("mensagem")

meu_email = "vistamoveis@vistamoveis.com.br"

corpo = "<font size=""2"" face=""Verdana, Arial, Helvetica, sans-serif""><strong>MENSAGEM VINDA DO FORMULÁRIO DE CONTATO DIREÇÃO DO WEB SITE DA VISTA MÓVEIS</strong></font><BR><BR><font size=""2"" face=""Verdana, Arial, Helvetica, sans-serif""><strong>Nome:</strong>" & Nome & "<BR>"
corpo = corpo & "<strong>Endereço:</strong>" & Endereco & "<BR>"
corpo = corpo & "<strong>Bairro:</strong>" & Bairro & "<BR>"
corpo = corpo & "<strong>Cidade:</strong>" & Cidade & "<BR>"
corpo = corpo & "<strong>Estado:</strong>" & Estado & "<BR>"
corpo = corpo & "" & Outropais & "<BR>"
corpo = corpo & "<strong>CEP:</strong>" & Cep & "<BR>"
corpo = corpo & "<strong>País:</strong>" & Pais & "<BR>"
corpo = corpo & "<strong>CPPJ:</strong>" & Cppj & "<BR>"
corpo = corpo & "<strong>Inscrição Estadual:</strong>" & Estadual & "<BR>"
corpo = corpo & "<strong>E-mail:</strong>" & Email & "<BR>"
corpo = corpo & "<strong>Telefone:</strong>" & Telefone & "<BR>"
corpo = corpo & "<strong>Contato:</strong>" & Contato & "<BR>"
corpo = corpo & "<strong>MENSAGEM/SUGESTÕES:</strong>" & Mensagem & "<BR>"



Set iMail = CreateObject("CDONTS.NewMail")
iMail.From = email
iMail.To = meu_email
iMail.Subject = Nome
iMail.MailFormat = 0
iMail.BodyFormat = 0
iMail.Body = corpo
iMail.Send


Set objMail = nothing
%> 
<meta HTTP-EQUIV="refresh" CONTENT="1;URL=index.asp">
<LINK href="../default3.css" type=text/css rel=STYLESHEET>
<html>
<head>
<title>Vista M&oacute;veis - Vista Ga&uacute;cha/RS</title>
</head>
<body bgcolor="#EFEFE7" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<p align="center">&nbsp;</p>
<p align="center"><img src="menornn.gif" width="120" height="109"> <font color="#FFFFFF"> 
  </font></p>
<p align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Formul&aacute;rio 
  enviado com sucesso!!!</strong></font></p>
<p align="center">&nbsp;</p>
<p>&nbsp; 
</body>
</html>
