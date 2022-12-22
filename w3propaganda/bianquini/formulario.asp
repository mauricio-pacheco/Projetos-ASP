<%
Dim strTo, strSubject, strBody, nome, mensagem, email
Dim objCDOMail 

'Digite seu e-mail abaixo
strTo = "bianquini@brturbo.com.br"
strSubject = Request.Form("assunto") 

nome = Request.Form("nome")
email = Request.Form("email")
assunto = Request.Form("assunto")
mensagem = Request.Form("mensagem")


corpo = "FORMULÁRIO DE CONTATO DO SITE MÓVEIS BIANQUINI<br><br>"
corpo = corpo & "----------------------------------------------<br>"
corpo = corpo & "Nome:" & Nome & "<br>"
corpo = corpo & "E-mail:" & Email & "<br>"
corpo = corpo & "Assunto:" & Assunto & "<br>"
corpo = corpo & "Mensagem:" & Mensagem & "<br>"
corpo = corpo & "----------------------------------------------<br>"


Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

'Coloque o titulo do e-mail que você vai receber no lugar de Email Emerson
objCDOMail.From = "Moveis-Bianquini"
objCDOMail.To = strTo
objCDOMail.Subject = strSubject
objCDOMail.MailFormat = 0
objCDOMail.BodyFormat = 0
objCDOMail.Body = corpo
objCDOMail.Send
Set objCDOMail = Nothing
%>

