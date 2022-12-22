<%

'por: Mauricio Pacheco
Dim iMail, Nome, Sobrenome, Assunto, Datanascimento, Estadocivil, Nacionalidade, Numero, Celular, Complemento, Cep, Estado, Cidade, Outropais, Pais, Telefone, Endereco, Natural, Email, Mensagem

Nome = Request.form("nome") 
Cidade = Request.form("cidade") 
Email = Request.form("email") 
Mensagem = Request.form("mensagem") 
Assunto = Request.form("assunto") 
meu_email = "mandry@casadaweb.net"
corpo = "TRIBUNA LIVRE RÁDIO FREQUÊNCIA AM<BR>"
corpo = corpo & "Nome:" & Nome & "<BR>"
corpo = corpo & "Cidade:" & Cidade & "<BR>"
corpo = corpo & "E-mail:" & Email & "<BR>"
corpo = corpo & "Assunto:" & Assunto & "<BR>"
corpo = corpo & "Mensagem:" & Mensagem & "<BR>"


Set iMail = CreateObject("CDONTS.NewMail")
iMail.From = email
iMail.To = meu_email
iMail.Subject = Assunto
iMail.MailFormat = 0
iMail.BodyFormat = 0
iMail.Body = corpo
iMail.Send


Set objMail = nothing
%> 
<LINK href="../default3.css" type=text/css rel=STYLESHEET>
<html>
<head>
<title>Sollu&ccedil;&atilde;o Brasil Inform&aacute;tica</title>
</head>
<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<p align="center">&nbsp;</p>
<p align="center"><img src="logo.jpg" width="99" height="120"> </p>
<p align="center"><font color="#FFFFFF"> </font></p>
<p align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>O 
  seu formul&aacute;rio foi enviado com sucesso!!!</strong></font></p>
<p align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Obrigado 
  por estar sintonizado conosco!</strong></font></p>
<p align="center">&nbsp;</p>
<p align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><a href="javascript:window.close()">FECHAR 
  ESTA JANELA</a></b> </font></p>
<p>&nbsp; 
</body>
</html>
