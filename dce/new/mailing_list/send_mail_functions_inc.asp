<%
'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Guide - Web Wiz Mailing List
'**                                                              
'**  Copyright 2001-2002 Bruce Corkhill All Rights Reserved.                                
'**
'**  This program is free software; you can modify (at your own risk) any part of it 
'**  under the terms of the License that accompanies this software and use it both 
'**  privately and commercially.
'**
'**  All copyright notices must remain in tacked in the scripts and the 
'**  outputted HTML.
'**
'**  You may use parts of this program in your own private work, but you may NOT
'**  redistribute, repackage, or sell the whole or any part of this program even 
'**  if it is modified or reverse engineered in whole or in part without express 
'**  permission from the author.
'**
'**  You may not pass the whole or any part of this application off as your own work.
'**   
'**  All links to Web Wiz Guide and powered by logo's must remain unchanged and in place
'**  and must remain visible when the pages are viewed unless permission is first granted
'**  by the copyright holder.
'**
'**  This program is distributed in the hope that it will be useful,
'**  but WITHOUT ANY WARRANTY; without even the implied warranty of
'**  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR ANY OTHER 
'**  WARRANTIES WHETHER EXPRESSED OR IMPLIED.
'**
'**  You should have received a copy of the License along with this program; 
'**  if not, write to:- Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom.
'**    
'**
'**  No official support is available for this program but you may post support questions at: -
'**  http://www.webwizguide.info/forum
'**
'**  Support questions are NOT answered by e-mail ever!
'**
'**  For correspondence or non support questions contact: -
'**  info@webwizguide.com
'**
'**  or at: -
'**
'**  Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom
'**
'****************************************************************************************



'Declare global variables
Dim objCDOSYSMail	'Holds the CDOSYS mail object
Dim objCDOMail		'Holds the CDONTS mail object
Dim objJMail		'Holds the Jmail object
Dim objAspEmail		'Holds the Persits AspEmail email object
Dim objAspMail		'Holds the Server Objects AspMail email object


'****************************************
'**         Create mail function       **
'****************************************

'Function to create mail object
Public Function createMailObject(strMailComponent)

	

	'Select which email component to use
	Select Case strMailComponent
	
		'CDOSYS mail component
		Case "CDOSYS"
		
			'Dimension variables
			Dim objCDOSYSCon
			
			'Create the e-mail server object
			Set objCDOSYSMail = Server.CreateObject("CDO.Message")
		    	Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration")
		    	
		    	'Set and update fields properties
		    	With objCDOSYSCon
		        	'Out going SMTP server
		        	.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = strMailServer
		        	'SMTP port
		        	.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport")  = 25
		        	'CDO Port
		        	.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
		        	'Timeout
		        	.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
	        		.Fields.Update 
	        	End With
			
			'Update the CDOSYS Configuration
			Set objCDOSYSMail.Configuration = objCDOSYSCon

		'CDONTS mail component
		Case "CDONTS"
		
			'With CDONTS the object has to be created for each email 
		
		'JMail component
		Case "Jmail"
		
			'Create the e-mail server object
			Set objJMail = Server.CreateObject("JMail.SMTPMail")
		
		'AspEmail component
		Case "AspEmail"
		
			'Create the e-mail server object
			Set objAspEmail = Server.CreateObject("Persits.MailSender")
		
		'AspMail component
		Case "AspMail"
		
			'Create the e-mail server object
		   	Set objAspMail = Server.CreateObject("SMTPsvg.Mailer")

	End Select
End Function



'****************************************
'**         Drop mail function         **
'****************************************

'Function to drop mail object
Public Function dropMailObject(strMailComponent)

	'Select which email component to use
	Select Case strMailComponent
	
		'CDOSYS mail component
		Case "CDOSYS"
		  	Set objCDOSYSMail = Nothing
		
		'CDONTS mail component
		Case "CDONTS"
			'With CDONTS the object has to be created and dropped for each email 
			
		'JMail component
		Case "Jmail"
			Set objJMail = Nothing
		
		'AspEmail component
		Case "AspEmail"
			Set objAspEmail = Nothing
		
		'AspMail component
		Case "AspMail"
			Set objAspMail = Nothing
	End Select
End Function



'****************************************
'**         Send mail function         **
'****************************************

'Function to send an e-mail
Public Function SendMail(strEmailAddress, strMailComponent, strMailFormat)

	'Select which email component to use
	Select Case strMailComponent
	
		'CDOSYS mail component
		Case "CDOSYS"	
		
			With objCDOSYSMail	
				'Who the e-mail is from
				.From = strWebsiteName & " <" & strWebsiteEmailAddress & ">"
							
				'Who the e-mail is sent to
				.To = strEmailAddress
									
				'The subject of the e-mail
				.Subject = strSubject
							
				'Set the e-mail body format (HTMLBody=HTML TextBody=Plain)
				If strMailFormat = "HTML" OR strMailFormat = "advHTML" Then
				 	.HTMLBody = strEmailBody & strAppendToEmail
				Else
					.TextBody = strEmailBody & strAppendToEmail
				End If
							
				'Send the e-mail
				If NOT strMailServer = "" Then .Send
			End with				
		
		'CDONTS mail component
		Case "CDONTS"
		
			'Create the e-mail server object (this has to be set with each email for CDONTS)
			Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
		
			With objCDOMail
				'Who the e-mail is from
				.From = strWebsiteName & " <" & strWebsiteEmailAddress & ">"
							
				'Who the e-mail is sent to
				.To = strEmailAddress
									
				'The subject of the e-mail
				.Subject = strSubject
							
				'The main body of the e-amil
				.Body = strEmailBody & strAppendToEmail
							
				'Set the e-mail body format (0=HTML 1=Text)
				If strMailFormat = "HTML" OR strMailFormat = "advHTML" Then
					.BodyFormat = 0
				Else
					.BodyFormat = 1
				End If
				
				'Set the mail format (0=MIME 1=Text)
				.MailFormat = 0
							
				'Importance of the e-mail (0=Low, 1=Normal, 2=High)
				.Importance = 1 
							
				'Send the e-mail
				.Send	
			End With
			
			'Release the object (this has to be done with each email for CDONTS)
			Set objCDOMail = Nothing
					
		
		'JMail component
		Case "Jmail"
	
			With objJMail
				'Out going SMTP mail server address
				.ServerAddress = strMailServer
			
				'Who the e-mail is from
				.Sender = strWebsiteEmailAddress
				.SenderName = strWebsiteName
							
				'Who the e-mail is sent to
				.AddRecipient strEmailAddress
										
				'The subject of the e-mail
				.Subject = strSubject
				
				'Set the e-mail body format (BodyHTML=HTML Body=Text)
				If strMailFormat = "HTML" OR strMailFormat = "advHTML" Then
					.HTMLBody = strEmailBody & strAppendToEmail
				Else
					.Body = strEmailBody & strAppendToEmail
				End If
							
				'Importance of the e-mail
				.Priority = 3 
							
				'Send the e-mail
				If NOT strMailServer = "" Then .Execute	
				
				'Clear the Recipient List
				.ClearRecipients()
			End With
	
	
		'AspEmail component
		Case "AspEmail"
	
			With objAspEmail
				'Out going SMTP mail server address
				.Host = strMailServer
					
				'Who the e-mail is from
				.From = strWebsiteEmailAddress
				.FromName = strWebsiteName
					
				'Who the e-mail is sent to
				.AddAddress strEmailAddress
													
				'The subject of the e-mail
				.Subject = strSubject
				
				'Set the e-mail body format (BodyHTML=HTML Body=Text)
				If strMailFormat = "HTML" OR strMailFormat = "advHTML" Then
					.IsHTML = True
				End If
				
				'The main body of the e-mail
				.Body = strEmailBody & strAppendToEmail
										
				'Send the e-mail
				If NOT strMailServer = "" Then .Send
				
				'Reset the object
				.ResetAll	
			End With		
						

		'AspMail component
		Case "AspMail"

		   	With objAspMail
			   	'Out going SMTP mail server address
			   	.RemoteHost = strMailServer
			    
			   	'Who the e-mail is from
			   	.FromAddress = strWebsiteEmailAddress
			   	.FromName = strWebsiteName
			    
			   	'Who the e-mail is sent to
			   	.AddRecipient " ", strEmailAddress
			            
			   	'The subject of the e-mail
			   	.Subject = strSubject
			   
			   	'Set the e-mail body format (BodyHTML=HTML Body=Text)
			   	If strMailFormat = "HTML" OR strMailFormat = "advHTML" Then
			    		.ContentType = "text/HTML"
			   	End If
			   
			   	'The main body of the e-mail
			   	.BodyText = strEmailBody & strAppendToEmail
			         
			   	'Send the e-mail
			   	If NOT strMailServer = "" Then .SendMail 
			   	
			   	'Clear the Recipient List
			   	.ClearRecipients
			   	
			   	'Clear the email body text
			   	.ClearBodyText
			End With
	End Select	
End Function




'****************************************
'**      Create mail body function     **
'****************************************

'Function create the remove appended part of the email
Private Function mailBody(strMailFormat, strUserCode, blnLCode)

	'If the e-mail is in HTML format then change the format of the e-mail
	If strMailFormat = "HTML" OR strMailFormat = "advHTML" Then

		'Write a remove from mailing list message to add to the end of the e-mail in HTML Format
		strAppendToEmail = "<br><br><hr>"
		strAppendToEmail = strAppendToEmail & "<a href=""http://www.casadaweb.net/duda/index.php"" target=_blank>Clique aqui para acessar meu Web Site</a>"
		'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
		If blnLCode = True Then
			strAppendToEmail = strAppendToEmail & "<br><br>"
		End If 
		'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
		strAppendToEmail = strAppendToEmail & "</body></html>"
			
  	Else	
		'Write a remove from mailing list message to add to the end of the e-mail in Plain Text Format
		strAppendToEmail = vbCrLf & vbCrLf & "__________________________________________________________"
		strAppendToEmail = strAppendToEmail & vbCrLf & vbCrLf & "Click on the link below to be removed from the mailing list"
		strAppendToEmail = strAppendToEmail & vbCrLf & strWebsiteAddress & "/remove.asp?ID=" & strUserCode
		'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
		If blnLCode = True Then
			strAppendToEmail = strAppendToEmail & vbCrLf & vbCrLf & "Powered by Web Wiz Mailing List version 3.02 - http://www.webwizguide.info"
		End If 
		'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
	End If
	
	mailBody = strAppendToEmail
End Function
%>