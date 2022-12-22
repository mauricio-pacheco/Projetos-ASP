<%
Response.Buffer = True

strFromName = Request.Form("fromname")
strToName = Request.Form("toname")
strToMail = Request.Form("tomail")
strBody = Request.Form("body")

If strFromName = "" Then
	Response.Redirect "email.asp?msg=erro"
end if

If strToName = "" Then
	Response.Redirect "email.asp?msg=erro"
end if

If strToMail = "" Then
	Response.Redirect "email.asp?msg=erro"
end if

If strBody = "" Then
	Response.Redirect "email.asp?msg=erro"
end if

Set Mail = Server.CreateObject("Persits.MailSender") 
Mail.Host = "pop.webestudos.com.br" 
Mail.From = "webestudos@webestudos.com.br"
Mail.FromName = strFromName
Mail.AddAddress strToMail , strToName
Mail.Subject = "SuperChat - Email"
Mail.Body = strBody
Mail.IsHtml = false
On Error Resume Next 
Mail.Send 

%>