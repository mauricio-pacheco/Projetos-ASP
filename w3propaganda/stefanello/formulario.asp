<%
'Emerson Rocha Programador Web com a tecnologia ASP, ASP.NET, Java, SQL, ACCES, ActionScript
%>
<%
Dim strTo, strSubject, strBody, strBody1, strBody2 
Dim objCDOMail 

'Digite seu e-mail abaixo
strTo = "mandrymaster@bol.com.br"
strSubject = Request.Form("assunto") 
strBody1 = Request.Form("nome")
strBody2 = Request.Form("email")
strBody = Request.Form("mensagem")



Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

'Coloque o titulo do e-mail que você vai receber no lugar de Email Emerson
objCDOMail.From = "Formulario de Contatos do Site Móveis Bianquini"
objCDOMail.To = strTo
objCDOMail.Subject = strSubject
objCDOMail.Body = strBody1
objCDOMail.Body = strBody2
objCDOMail.Body = strBody
objCDOMail.Send
Set objCDOMail = Nothing
%>

