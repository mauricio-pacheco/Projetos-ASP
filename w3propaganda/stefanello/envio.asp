<%

'por: Mauricio Pacheco
Dim iMail, Nome, Cidade, Estado, Telefone, Email, Assunto, Mensagem

Nome = Request.form("nome") 
Cidade = Request.form("cidade") 
Estado = Request.form("estado") 
Telefone = Request.form("telefone") 
Email = Request.form("email") 
Mensagem = Request.form("mensagem") 

meu_email = "mandry@casadaweb.net"

corpo = "Nome:" & Nome & "<BR>"
corpo = corpo & "Cidade:" & Cidade & "<BR>"
corpo = corpo & "Estado:" & Estado & "<BR>"
corpo = corpo & "Telefone:" & Telefone & "<BR>"
corpo = corpo & "E-mail:" & Email & "<BR>"
corpo = corpo & "Mensagem:" & Mensagem & "<BR>"


Set iMail = CreateObject("CDONTS.NewMail")
iMail.From = email
iMail.To = meu_email
iMail.Subject = Nome
iMail.MailFormat = 0
iMail.BodyFormat = 0
iMail.Body = corpo
iMail.Send

Response.write("Alerta="+Server.URLEncode("Enviado com sucesso!"))

Set objMail = nothing
%> 

