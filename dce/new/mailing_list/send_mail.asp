<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="send_mail_functions_inc.asp" -->
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


'Set the response buffer to false as we may need to puase while the e-mails are being sent
Response.Buffer = False

'Set the script timeout to 6 hours incase there are lots of e-mails to send
Server.ScriptTimeout = 21600


'Dimension variables
Dim rsMailList			'Database recordset variable
Dim strEmailBody		'Holds the body of the e-mail
Dim strAppendToEmail		'Holds the link to get removed from the mailing list
Dim strSubject			'Holds the subject of the e-mail
Dim blnEmailSent		'Set to true if the e-mail has been sent
Dim blnPreviewEmailSent		'Set to true if a preview e-mail has been sent
Dim lngNumberOfMembers		'Holds the number of mailing list members
Dim intEmailSentLoopCounter	'Lopp counter to count the number of e-mails sent


'Initialise variables
blnEmailSent = False
blnPreviewEmailSent = False
lngNumberOfMembers = 0
intEmailSentLoopCounter = 0

'If the session variable is False or does not exsist then redirect the user to the unauthorised user page
If Session("blnIsUserGood") = False or IsNull(Session("blnIsUserGood")) = True then
	'Redirect to unathorised user page
	Response.Redirect"unauthorised_user_page.htm"
End If


%>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Enviar E-mail para os Usu&aacute;rios Cadastrados</title>

<!-- The Web Wiz Guide - Web Wiz Mailing List is written and produced by Bruce Corkhill ©2001-2002
     	 If you want your own ASP Mailing List then goto http://www.webwizguide.info -->
    	 
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm() {

	var errorMsg = "";

	//Check for a Subject
	if (document.frmSendmail.subject.value == ""){
		errorMsg += "\n\tE-mail Subject \t- Enter a Subject for the e-mail";	
	}
			
	//Check for the e-mail body
	if (document.frmSendmail.body.value==""){
		errorMsg += "\n\tE-mail Body \t- Enter a Message for the e-mail";		
	}	
		
	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		msg = "_____________________________________________________________\n\n";
		msg += "Your e-mail has not been sent because there are problem(s) with the form.\n";
		msg += "Please correct the problem(s) and re-submit the form.\n";
		msg += "_____________________________________________________________\n\n";
		msg += "The following field(s) need to be corrected: -\n";
		
		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}
	
	return true;
}
// -->
</script>
<LINK href="style.css" type=text/css rel=STYLESHEET>

</head>
<body bgcolor="#FFFFFF" text="#000000">
<div align="center"><b><font size="5" face="Arial, Helvetica, sans-serif">ENVIAR E-MAIL PARA OS USUÁRIOS CADASTRADOS</font></b> <a href="admin_menu.asp" target="_self"> 
  <br><br>
  <font size="2" face="Verdana, Arial, Helvetica, sans-serif">Voltar ao menu principal</font></a>
<br>
  <br>
<%
'If the e-mail is to be sent to all members then send it to all the mailing list members
If Request.Form("Submit") = "_" Then
	
	'Create the email body
	'Read in the body of the e-mail
	strEmailBody = Request.Form("body")
	strSubject = Request.Form("subject")
	
	'If the e-mail is in HTML format then change the format of the e-mail
	If Request.Form("format") = "HTML" OR Request.Form("format") = "advHTML" Then
			
		'Replace new lines with HTML new lines if requested
		If Request.Form("format") = "HTML" AND Request.Form("lineBreak") = "true" Then strEmailBody = Replace(strEmailBody, vbCrLf, "<br>", 1, -1, 1)
				
		'Let the e-mail client know were using HTML
		strEmailBody = "<html><body>" & strEmailBody
	End If
	
	'Strip out Norton Internet Security add blocking code that messes up emails
	strEmailBody = Replace(strEmailBody, "<SCRIPT> window.open=NS_ActualOpen; </SCRIPT>", "", 1, -1, 1) 
	

	'Create recordset object
	Set rsMailList = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblMailingList.* FROM tblMailingList;"
	
	'Set the cursor type so we can do a record count
	rsMailList.CursorType = 3
	
	'Query the database
	rsMailList.Open strSQL, adoCon
	
	'Get the number of mailing list members
	lngNumberOfMembers = rsMailList.RecordCount
	
	
	'Create email object
	Call createMailObject(strMailComponent)
	
	
	'Display the HTML for sending the mail
	'Display a message on the screen incase the user thinks nothing is happening and hits refresh sending the e-mail's twice
	Response.Write("<b><font size=""4"">The e-mail's are being sent</b><br>Do not Hit Refresh or some members will receive the e-mail twice!</font><br><br>This may take some time depending on the speed of the mail server and how many e-mail's there are to send.<br>")
	
	'Display the number of e-mails sent and how many left to send
	Response.Write("<form name=""frmSent"">There are <input type=""text"" size=""4"" name=""sent"" value=""0""> e-mail's sent out of a total of " & lngNumberOfMembers & "</form>")


	'Loop through the recordset and send the e-mail to everyone in the mailing list
	Do While NOT rsMailList.EOF
	
		'loop counter to count how many e-mails have been sent
		intEmailSentLoopCounter = intEmailSentLoopCounter + 1
	
	
		'Update the text box displaying the number of e-mails sent
		Response.Write(vbCrLf & "<script langauge=""JavaScript"">document.frmSent.sent.value = " & intEmailSentLoopCounter & ";</script>")
		
		'Write a remove from mailing list message to add to the end of the e-mail in HTML Format
		strAppendToEmail = mailBody(Request.Form("format"), rsmailList("ID_Code"), blnLCode)
		
		'Send the email
		Call SendMail(rsmailList("Email"), strMailComponent, Request.Form("format"))
	
		'Move to the next record in the recordset
		rsMailList.MoveNext
	Loop
	
	'Write a message saying that all the e-mails have been sent
	Response.Write(vbCrLf & "<br><font size=""5""><b>Your email has now been sent to all the members of your mailing list.</b></font></div>")

	'Drop email component
	Call dropMailObject(strMailComponent)
	
	'Set up the page response
	blnEmailSent = True

	'Reset server objects
	rsMailList.Close
	Set rsMailList = Nothing
	
	

'Else if this is a preview e-mail then send the preview to the web master
ElseIf Request.Form("Submit") = "Enviar" Then
	
	'Save the e-mail to a session variable so we can read it back
	If Request.Form("format") = "advHTML" Then Session("strMailBody") = Request.Form("body")
	
	'Read in the body of the e-mail
	strEmailBody = Request.Form("body")
	strSubject = Request.Form("subject")
		
	'If the e-mail is in HTML format then change the format of the e-mail
	If Request.Form("format") = "HTML" OR Request.Form("format") = "advHTML" Then
			
		'Replace new lines with HTML new lines if requested
		If Request.Form("format") = "HTML" AND Request.Form("lineBreak") = "true" Then strEmailBody = Replace(strEmailBody, vbCrLf, "<br>", 1, -1, 1)
				
		'Let the e-mail client know were using HTML
		strEmailBody = "<html><body>" & strEmailBody
	End If
	
	'Strip out Norton Internet Security add blocking code that messes up emails
	strEmailBody = Replace(strEmailBody, "<SCRIPT> window.open=NS_ActualOpen; </SCRIPT>", "", 1, -1, 1)
	
	'Create email object
	Call createMailObject(strMailComponent)
	
	'Write a remove from mailing list message to add to the end of the e-mail in HTML Format
	strAppendToEmail = mailBody(Request.Form("format"), "webmaster0001", blnLCode)
	
	'Send the email
	Call SendMail(strTestEmailAddress, strMailComponent, Request.Form("format"))

	'Drop email component
	Call dropMailObject(strMailComponent)
	
	'Set up the page response
	blnPreviewEmailSent = True
End If


'Clean up
Set strCon = Nothing
Set adoCon = Nothing


'If the e-mail's have not been sent then show the form for the user to fill in
If NOT blnEmailSent = True Then
		
	'If a preview of the e-mail has ben sent then tell the user
	If blnPreviewEmailSent = True Then
		Response.Write "<br><font size=""5""><b></b></font><br><br>"
	End If
    
        'Select which type of form e-mail format to use
        Select Case Request.QueryString("Format")
        	Case "advHTML"
    %>
       <!-- #include file="advanced_mail_form_inc.asp" -->
       	<%
       	End Select
End If 
%>
<br>
<div align="center"> </div>
</body>
</html>