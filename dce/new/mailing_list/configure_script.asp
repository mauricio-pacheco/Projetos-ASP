<% Option Explicit %>
<!--#include file="common.asp" -->
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


'Set the response buffer to true
Response.Buffer = True 


'Dimension variables
Dim rsMailingListSetup 		'Recorset holding all the username in the database				
Dim strMode			'holds the mode of the page, set to true if changes are to be made to the database
Dim strUsername			'Holds the admin username
Dim strPassword			'Holds the admin password


'If the session variable is False or does not exsist then redirect the user to the unauthorised user page
If Session("blnIsUserGood") = False or IsNull(Session("blnIsUserGood")) = True then
	'Redirect to unathorised user page
	Response.Redirect"unauthorised_user_page.htm"
End If
      
'Read in the details from the form
strUsername = Request.Form("username")			
strPassword = Request.Form("password")		
strMailComponent = Request.Form("component")
strMailServer = Request.Form("mailServer")
strWebSiteName = Request.Form("siteName")
strWebsiteAddress = Request.Form("URL")
strWebsiteEmailAddress = Request.Form("email")
strTestEmailAddress = Request.Form("testEmail")
strWelcomeMessage = Request.Form("welcome")
strWelcomeFormat = Request.Form("format")
strMode = Request.Form("mode")


'Intialise the ADO recordset object
Set rsMailingListSetup  = Server.CreateObject("ADODB.Recordset")
	

'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblConfiguration.* From tblConfiguration;"

'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
rsMailingListSetup.CursorType = 2

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsMailingListSetup.LockType = 3
	
'Query the database
rsMailingListSetup.Open strSQL, strCon

'If the user is changing the email setup then update the database
If strMode = "change" Then
	
	'If there is a welcome message then covert the line breaks to <br> if required
	If strWelcomeMessage <> "" AND strWelcomeFormat = "htmlBR" Then
		strWelcomeMessage = Replace(strWelcomeMessage, vbCrLf, "<br>", 1, -1, 1)
		strWelcomeFormat = "HTML"
	End If

	
	'Update the recordset
	rsMailingListSetup.Fields("Username") = strUsername
	rsMailingListSetup.Fields("Password") = strPassword
	rsMailingListSetup.Fields("mail_component") = strMailComponent
	rsMailingListSetup.Fields("mail_server") = strMailServer
	rsMailingListSetup.Fields("website_name") = strWebSiteName
	rsMailingListSetup.Fields("website_address") = strWebsiteAddress
	rsMailingListSetup.Fields("website_email_address") = strWebsiteEmailAddress
	rsMailingListSetup.Fields("test_email_address") = strTestEmailAddress
	rsMailingListSetup.Fields("welcome_message") = strWelcomeMessage
	rsMailingListSetup.Fields("welcome_format") = strWelcomeFormat	
				
	'Update the database with the new user's details
	rsMailingListSetup.Update
		
	'Re-run the query to read in the updated recordset from the database
	rsMailingListSetup.Requery	
End If

'Read in the deatils from the database
If NOT rsMailingListSetup.EOF Then
	
	'Read in the e-mail setup from the database
	strUsername = rsMailingListSetup("Username")
	strPassword = rsMailingListSetup("Password")
	strMailComponent = rsMailingListSetup("mail_component")
	strMailServer = rsMailingListSetup("mail_server")
	strWebSiteName = rsMailingListSetup("website_name")
	strWebsiteAddress = rsMailingListSetup("website_address")
	strWebsiteEmailAddress = rsMailingListSetup("website_email_address")
	strTestEmailAddress = rsMailingListSetup("test_email_address")
	strWelcomeMessage = rsMailingListSetup("welcome_message")
	strWelcomeFormat = rsMailingListSetup("welcome_format")
End If	


'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
Set rsMailingListSetup = Nothing


%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>ASP Mailing List Setup</title>

<!-- The Web Wiz Guide - Web Wiz Mailing List is written and produced by Bruce Corkhill ©2001-2002
     	 If you want your own ASP Mailing List then goto http://www.webwizguide.info -->
		
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	var errorMsg = "";

	//Check for a username
	if (document.frmEmailsetup.username.value==""){
		errorMsg += "\n\tUsername \t- Enter a Username to use the Admin pages with";	
	}
	
	//Check for a password
	if (document.frmEmailsetup.password.value==""){
		errorMsg += "\n\tPassword \t- Enter a Password to use the Admin pages with";
	}

	//Check for a mail server
	if (((document.frmEmailsetup.component.value=="AspEmail") || (document.frmEmailsetup.component.value=="Jmail")) && (document.frmEmailsetup.mailServer.value=="")){
		errorMsg += "\n\tMail Server \t- Enter an working SMTP mail server \nWithout one the component will fail";
	}
	
	//Check for a website name
	if (document.frmEmailsetup.siteName.value==""){
		errorMsg += "\n\tWebsite Name \t- Enter your Website or Company Name";
	}
	
	//Check for a path to the Mailing List
	if (document.frmEmailsetup.URL.value==""){
		errorMsg += "\n\tWeb Address \t- Enter the Web Address path to the Mailing List Script";
	}
	
	//Check for an e-mail address
	if ((document.frmEmailsetup.email.value=="")||(document.frmEmailsetup.email.value.length>0&&(document.frmEmailsetup.email.value.indexOf("@",0)==-1||document.frmEmailsetup.email.value.indexOf(".",0)==-1))){
		errorMsg += "\n\tWeb Site Email Address \t- Enter your web sites valid E-mail Address";
	}
	
	//Check for an test e-mail address
	if ((document.frmEmailsetup.testEmail.value=="")||(document.frmEmailsetup.testEmail.value.length>0&&(document.frmEmailsetup.testEmail.value.indexOf("@",0)==-1||document.frmEmailsetup.testEmail.value.indexOf(".",0)==-1))){
		errorMsg += "\n\tPreview Email Address \t- Enter a valid E-mail Address that you would like a preview e-mail sent to";
	}
	
	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		msg = "________________________________________________________________\n\n";
		msg += "The form has not been submitted because there are problem(s) with the form.\n";
		msg += "Please correct the problem(s) and re-submit the form.\n";
		msg += "________________________________________________________________\n\n";
		msg += "The following field(s) need to be corrected: -\n";
		
		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}
	
	return true;
}
// -->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center">ASP Mailing List Setup</h1><div align="center"><a href="admin_menu.asp" target="_self">Return 
to the Mailing List menu Menu</a><br> <br>
 <table width="97%" border="1" cellspacing="0" cellpadding="4" bordercolor="#000000">
  <tr> 
   <td align="center" bgcolor="#CCCCCC"> <b><font size="5">Important - Please Read</font></b></td>
  </tr>
  <tr> 
   <td bgcolor="#EFEFEF"> <p>To be able to use the e-mail notification you need to have CDOSYS, the CDONTS e-mail component, the W3 JMail component, or Persists AspEmail component installed on the web server.</p>
    <p><b>Windows Win2k and XP Pro users</b> - CDOSYS comes installed on Win2k and XP Pro.<br>
     <br>
     <b>Windows NT4 and Win2k users</b> - IIS 4 and 5 on NT4 and Win2k instals the CDONTS e-mail component by default, but you need the SMTP server that comes with IIS installed on the web server as well (This is the 
     e-mail component that most web hosts will use).<br>
     <br>
     <b>Windows 9x users</b> - I'm afraid Windows 98 does not support the CDOSYS or CDONTS e-mail components so if you enable this feature and try to test it on a Windows 9x system the News will crash!!<br>
     <br>
     The personal version of the JMail e-mail component is free and can run under Win98, NT4, and Win2k, Win XP, but you must install the component on the web server and requires that you enter the address of a working 
     SMTP server.<br>
     <br>
     If you are not sure what mail component, if any, your web host uses then contact them to find out. <br>
     <br>
     If Web Wiz Site News crashes or you receive no e-mail's, you are either using the wrong component or your web host may not support sending mail from your web site.</p></td>
  </tr>
 </table>
</div><form method="post" name="frmEmailsetup" action="configure_script.asp" onSubmit="return CheckForm();"> 
<table width="680" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000" height="277"> 
<tr> <td height="234" width="680"> 
        <table width="100%" border="0" align="center" class="normal" height="233" cellpadding="4" cellspacing="1">
          <tr align="left" bgcolor="#FFFFFF"> 
            <td colspan="2" class="arial_sm2" height="30"><font size="2">*Indicates required fields</font></td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="59%" class="arial" height="12">Username:<br>
              <font size="2">You must remember this otherwise you can't use the script</font> </td>
            <td height="12" width="41%" valign="top"> 
              <input type="text" name="username" maxlength="20" value="<% = strUsername %>">
            </td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="59%" class="arial" height="12">Password:<br>
              <font size="2">You must remember this otherwise you can't use the script</font></td>
            <td height="12" width="41%" valign="top"> 
              <input type="text" name="password" maxlength="20" value="<% = strPassword %>">
            </td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="59%" class="arial" height="12">E-mail Component to use:<br>
              <font size="2">Check with your web host if you are unsure</font></td>
            <td height="12" width="41%" valign="top"> 
              <select name="component">
        <option value="CDOSYS"<% If strMailComponent = "CDOSYS" Then Response.Write(" selected") %>>CDOSYS (Win2k/XP Pro)</option>
        <option value="CDONTS"<% If strMailComponent = "CDONTS" Then Response.Write(" selected") %>>CDONTS (NT4/Win2k)</option>
        <option value="Jmail"<% If strMailComponent = "Jmail" Then Response.Write(" selected") %>>JMail</option>
        <option value="AspEmail"<% If strMailComponent = "AspEmail" Then Response.Write(" selected") %>>AspEmail</option>
        <option value="AspMail"<% If strMailComponent = "AspMail" Then Response.Write(" selected") %>>AspMail</option>
       </select>
            </td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="59%" class="arial" height="12">Outgoing SMTP Mail Server (<b>NOT needed for CDONTS</b>):<br>
              <font size="2">You only need this if you are using an e-mail component other than CDONTS. It must be a working mail server or the script will crash.</font></td>
            <td height="12" width="41%" valign="top"> 
              <input type="text" name="mailServer" maxlength="50" value="<% = strMailServer %>" size="30" >
              <br>
              (eg. mail.myweb.com)</td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="59%" class="arial" height="12">Website name*<br>
              <font size="2">The name of your website or Company Name eg. My Website</font></td>
            <td height="12" width="41%" valign="top"> 
              <input type="text" name="siteName" maxlength="50" value="<% = strWebsiteName %>" size="30" >
            </td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="59%" class="arial" height="2">Web address path to mailing list script*<br>
              <font size="2">The web address to this mail list script including web site URL. eg. http://www.mywebsite.com/mailing_list</font> </td>
            <td width="41%" valign="top" height="2"> 
              <input type="text" name="URL" maxlength="60" value="<% = strWebsiteAddress %>" size="30" >
            </td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="59%" class="arial" height="23">Your Web Sites E-mail Address* <br>
              <font size="2">Without a valid e-mail address you wont be able to send e-mails from this script.</font><br>
            </td>
            <td height="23" width="41%" valign="top"> 
              <input type="text" name="email" maxlength="50" value="<% = strWebsiteEmailAddress %>" size="30">
              &nbsp;</td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="59%" class="arial" height="23">Preview E-mail Address*<br>
              <font size="2">This is the e-mail address you want to send a test e-mail to so you can view what the e-mail will look like before you send 
              it to all your members.</font></td>
            <td height="23" width="41%" valign="top"> 
              <input type="text" name="testEmail" maxlength="50" value="<% = strTestEmailAddress %>" size="30">
            </td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" colspan="2" class="arial" height="23">Conformation/Welcome E-mail<br>
       <font size="2">If you would like a welcome message sent to new members then type your message that will be e-mailed to them in the box below.</font> <br>
              <textarea name="welcome" cols="70" rows="10"><% = strWelcomeMessage %></textarea>
              <br>
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
         <td width="4%" align="center"><input name="format" type="radio" value="text" id="text"<% If strWelcomeFormat = "text" Then Response.Write(" checked") %>></td>
         <td width="96%"><label for ="text">Plain text format</label></td>
        </tr>
        <tr>
         <td align="center"><input type="radio" name="format" value="HTML" id="HTML"<% If strWelcomeFormat = "HTML" Then Response.Write(" checked") %>></td>
         <td><label for ="HTML">HTML format</label></td>
        </tr>
        <tr>
         <td align="center"><input type="radio" name="format" value="htmlBR" id="htmlBR"></td>
         <td><label for ="htmlBR">HTML format, convert line breaks to HTML &lt;br&gt; tags</label></td>
        </tr>
       </table> </td>
          </tr>
          <tr bgcolor="#FFFFFF" align="center"> 
            <td valign="top" height="2" colspan="2" class="arial"> 
              <p> 
                <input type="hidden" name="mode" value="change">
                <input type="submit" name="Submit" value="Update Mailing List Configuration">
                <input type="reset" name="Reset" value="Clear Form">
              </p>
            </td>
          </tr>
        </table>
      </td></tr> 
</table></form><br> 
</body>
</html>
