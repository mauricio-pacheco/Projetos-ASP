<%
Function SendMail(comp, mailserv, fromname, fromemail, toname, toemail, subject, body)

Dim myMail
On Error Resume Next	

Select Case comp

Case 1 'ASPMail
Set myMail 			= Server.CreateObject("SMTPsvg.Mailer")

myMail.FromName   	= fromname
myMail.FromAddress	= fromemail
myMail.ContentType  = strcontent
myMail.Priority 	= strpriority
myMail.ReturnReceipt= strreceipt
myMail.RemoteHost 	= mailserv
myMail.AddRecipient toname, toemail
myMail.Subject    	= subject
myMail.BodyText   	= body
myMail.SendMail

Case 2  'ASPEmail
Set myMail 		= CreateObject("Persits.MailSender") 
myMail.From 	= fromemail
myMail.FromName = fromname
myMail.IsHTML 	= strcontent
myMail.Priority = strpriority
myMail.Host 	= mailserv
myMail.AddAddress toemail
myMail.Subject 	= subject
myMail.Body 	= body
myMail.Send 

Case 3  'CDONTS
Set myMail 			= server.CreateObject("CDONTS.NewMail")
myMail.To 			= toemail
myMail.Value("Reply-To") = fromemail
myMail.From 		= fromemail
myMail.Subject 		= subject
myMail.MailFormat 	= strcontent
myMail.BodyFormat 	= strcontent
myMail.Importance 	= strpriority
myMail.Body = body
myMail.Send

Case 10  'CDOSYS
Set myMail = Server.CreateObject("CDO.Message")
myMail.From = fromemail
myMail.To = toemail
myMail.Subject = subject 
myMail.HTMLBody = body
myMail.Send 

Case 4 ' Dynu Email
Set myMail 		= Server.CreateObject("Dynu.Email")
myMail.isHTML 	= True
myMail.Smtp 	= mailserv
result 			= myMail.Send(fromemail, toemail, subject, body)

Case 5 'W3 JMail 4.1
set myMail 		= Server.CreateOBject( "JMail.Message" )
myMail.Logging 	= true
myMail.silent 	= true
myMail.From 	= fromemail
myMail.FromName = fromname
myMail.AddRecipient toemail, toname
myMail.Subject 	= subject
myMail.Body 	= body
SendMail = myMail.Send(mailserv)

Case 6 'W3 JMail 4.1 HTML
Set myMail 		= Server.CreateObject("JMail.Message")
myMail.AddRecipient toemail, toname
myMail.From 	= fromemail
myMail.Body 	= "Sorry, you cannot read HTML."
myMail.Subject 	= subject
myMail.HTMLBody = body
SendMail = myMail.Send(mailserv)

Case 7 'Simple Mail
Set myMail 			= Server.CreateObject("ADISCON.SimpleMail.1")
myMail.MailServer 	= mailserv
myMail.Sender 		= fromemail
myMail.Recipient 	= toemail
myMail.Subject 		= subject
myMail.MessageText 	= body
call myMail.Send

Case 8 'OCXMail
set myMail 		= Server.CreateObject("ASPMail.ASPMailCtrl.1")
result 			=  myMail.SendMail(mailserv, toemail, fromemail, subject, body) 

Case 9  'VSMail 1.x
Set myMail 		= CreateObject("VSEmail.SMTPSendMail")
myMail.Host 	= mailserv
myMail.From 	=  fromname & " < " & fromemail & " >"
myMail.SendTo 	= toemail
myMail.Subject 	= subject
myMail.Body 	= body
myMail.Connect
myMail.Send

End Select

Set myMail = Nothing

If Err Then
SendMail = False
Else
SendMail = True
End If	

End Function
%>

