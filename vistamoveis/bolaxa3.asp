<%

'por: Mauricio Pacheco
Dim iMail, Nome, meu_email, endereco, avaria1, codigo8, codigo9, codigo10, produto8, produto9, produto10, avaria8, avaria9, avaria10, avaria2, avaria3, avaria4,  avaria5,  avaria6,  avaria7, produto1, produto2, produto3, produto4, produto5, produto6, produto7, codigo1, codigo2, codigo3, codigo4, codigo5, codigo6, codigo7, notafiscal, emissao, bairro, cidade, estado, outropais, cep, pais, cppj, estadual, email, telefone, contato, sugestao, mensagem

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
Notafiscal = Request.form("notafiscal")
Emissao = Request.form("emissao")
Codigo1 = Request.form("codigo1")
Codigo2 = Request.form("codigo2")
Codigo3 = Request.form("codigo3")
Codigo4 = Request.form("codigo4")
Codigo5 = Request.form("codigo5")
Codigo6 = Request.form("codigo6")
Codigo7 = Request.form("codigo7")
Codigo8 = Request.form("codigo8")
Codigo10 = Request.form("codigo10")
Codigo9 = Request.form("codigo9")
Produto1 = Request.form("produto1")
Produto2 = Request.form("produto2")
Produto3 = Request.form("produto3")
Produto4 = Request.form("produto4")
Produto5 = Request.form("produto5")
Produto6 = Request.form("produto6")
Produto7 = Request.form("produto7")
Produto8 = Request.form("produto8")
Produto9 = Request.form("produto9")
Produto10 = Request.form("produto10")
Avaria1 = Request.form("avaria1")
Avaria2 = Request.form("avaria2")
Avaria3 = Request.form("avaria3")
Avaria4 = Request.form("avaria4")
Avaria5 = Request.form("avaria5")
Avaria6 = Request.form("avaria6")
Avaria7 = Request.form("avaria7")
Avaria8 = Request.form("avaria8")
Avaria9 = Request.form("avaria9")
Avaria10 = Request.form("avaria10")
Sugestao = Request.form("sugestao")
Mensagem = Request.form("mensagem")

meu_email = "vistamoveis@vistamoveis.com.br"

corpo = "<font size=""2"" face=""Verdana, Arial, Helvetica, sans-serif""><strong>MENSAGEM VINDA DO FORMULÁRIO DE CONTATO ASSITÊNCIA TÉCNICA DO WEB SITE DA VISTA MÓVEIS</strong></font><BR><BR><font size=""2"" face=""Verdana, Arial, Helvetica, sans-serif""><strong>Nome:</strong>" & Nome & "<BR>"
corpo = corpo & "<strong>Endereço</strong>:" & Endereco & "<BR>"
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
corpo = corpo & "<strong>Número da Nota Fiscal:</strong>" & Notafiscal & "<BR>"
corpo = corpo & "<strong>Emissão:</strong>" & Emissao & "<BR>"
corpo = corpo & "<strong>Código:</strong>" & Codigo1 &  " , "
corpo = corpo & "<strong>Desc. Produto:</strong>" & Produto1 &  " , "
corpo = corpo & "<strong>Avaria:</strong>" & Avaria1 &  "<BR>"
corpo = corpo & "<strong>Código:</strong>" & Codigo2 &  " , "
corpo = corpo & "<strong>Desc. Produto:</strong>" & Produto2 &  " , "
corpo = corpo & "<strong>Avaria:</strong>" & Avaria2 &  "<BR>"
corpo = corpo & "<strong>Código:</strong>" & Codigo3 &  " , "
corpo = corpo & "<strong>Desc. Produto:</strong>" & Produto3 &  " , "
corpo = corpo & "<strong>Avaria:</strong>" & Avaria3 &  "<BR>"
corpo = corpo & "<strong>Código:</strong>" & Codigo4 &  " , "
corpo = corpo & "<strong>Desc. Produto:</strong>" & Produto4 &  " , "
corpo = corpo & "<strong>Avaria:</strong>" & Avaria4 &  "<BR>"
corpo = corpo & "<strong>Código:</strong>" & Codigo5 &  " , "
corpo = corpo & "<strong>Desc. Produto:</strong>" & Produto5 &  " , "
corpo = corpo & "<strong>Avaria:</strong>" & Avaria5 &  "<BR>"
corpo = corpo & "<strong>Código:</strong>" & Codigo6 &  " , "
corpo = corpo & "<strong>Desc. Produto:</strong>" & Produto6 &  " , "
corpo = corpo & "<strong>Avaria:</strong>" & Avaria6 &  "<BR>"
corpo = corpo & "<strong>Código:</strong>" & Codigo7 &  " , "
corpo = corpo & "<strong>Desc. Produto:</strong>" & Produto7 &  " , "
corpo = corpo & "<strong>Avaria:</strong>" & Avaria7 &  "<BR>"
corpo = corpo & "<strong>Código:</strong>" & Codigo8 &  " , "
corpo = corpo & "<strong>Desc. Produto:</strong>" & Produto8 &  " , "
corpo = corpo & "<strong>Avaria:</strong>" & Avaria8 &  "<BR>"
corpo = corpo & "<strong>Código:</strong>" & Codigo9 &  " , "
corpo = corpo & "<strong>Desc. Produto:</strong>" & Produto9 &  " , "
corpo = corpo & "<strong>Avaria:</strong>" & Avaria9 &  "<BR>"
corpo = corpo & "<strong>Código:</strong>" & Codigo10 &  " , "
corpo = corpo & "<strong>Desc. Produto:</strong>" & Produto10 &  " , "
corpo = corpo & "<strong>Avaria:</strong>" & Avaria10 &  "<BR>"
corpo = corpo & "<strong>MENSAGEM/SUGESTÕES:</strong>" & Mensagem & "<BR></font>"



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
