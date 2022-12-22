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


Dim adoCon 			'Database Connection Variable
Dim strAccessDB 		'Holds the Access Database Name
Dim rsConfiguration		'Holds the configuartion recordset
Dim strCon			'Holds the Database driver and the path and name of the database
Dim strSQL			'Holds the SQL query for the database
Dim strWebsiteName		'Holds the website name
Dim strWebsiteAddress		'Holds the website URL and path to the script
Dim strWebsiteEmailAddress	'Holds the forum e-mail address
Dim strTestEmailAddress		'holds the e-mail address the preview e-mail is sent to
Dim strMailComponent		'Email coponent the mailing list useses
Dim strMailServer		'Websites incomming mail server (for JMail)
Dim strBgColour			'Holds the background colour of the Mailing List
Dim blnLCode			'set to true
Dim strCode			'Holds the page code
Dim strCodeField		'Holds the code type
Dim strTextColour		'Holds the text colour of the Mailing List
Dim strTextType			'Holds the font type of the Mailing List
Dim intTextSize			'Holds the font size of the Mailing List
Dim strLinkColour		'Holds the link colour of the Mailing List
Dim strVisitedLinkColour	'Holds the visited link colour of the Mailing List
Dim strHoverLinkColour		'Holds the mouse over link colour of the Mailing List
Dim strWelcomeMessage		'Holds the welcome message that is sent to users
Dim strWelcomeFormat		'Holds the welcome message format



'Create database connection

'Initialise the strAccessDB variable with the name and the path to the Access Database
strAccessDB = "../../dcebd/dcedata.mdb"

'Create a connection odject
Set adoCon = Server.CreateObject("ADODB.Connection")
			 
'------------- If you are having problems with the script then try using a diffrent driver or DSN by editing the lines below --------------
			 
'Database connection info and driver (if this driver does not work then comment it out and use one of the alternative drivers)
strCon = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath(strAccessDB)
'Alternative drivers
'strCon = "Provider=Microsoft.Jet.OLEDB.3.51; Data Source=" & Server.MapPath(strAccessDB) 'This one is for Access 97
'strCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath(strAccessDB)  'This one is for Access 2000

'If you wish to use DSN then comment out the driver above and uncomment the line below (DSN is slower than the above drivers)
'strCon = "DSN=guestbook" 'Place the DSN name after the DSN=

'---------------------------------------------------------------------------------------------------------------------------------------------

'Set an active connection to the Connection object
adoCon.Open strCon

'Set up the page encoding
strCodeField = "C&#111;&#100;&#101;"
strCode = "&#110;&#111;&#108;&#105;&#110;&#107;&#115;&#050;&#048;&#048;&#050;"


'Read in the mailing list configuration
'Intialise the ADO recordset object
Set rsConfiguration = Server.CreateObject("ADODB.Recordset")

'Initialise the SQL variable with an SQL statement to get the configuration details from the database
strSQL = "SELECT tblConfiguration.* From tblConfiguration;"

'Query the database
rsConfiguration.Open strSQL, strCon

'If there is config deatils in the recordset then read them in
If NOT rsConfiguration.EOF Then

	'Read in the configuration details from the recordset
	strWebsiteName = rsConfiguration("website_name")
	strWebsiteAddress = rsConfiguration("website_address")
	strWebsiteEmailAddress = rsConfiguration("website_email_address")
	strTestEmailAddress = rsConfiguration("test_email_address")
	strMailComponent = rsConfiguration("mail_component")
	strMailServer = rsConfiguration("mail_server")
	strBgColour = rsConfiguration("bg_colour")
	strTextColour = rsConfiguration("text_colour")
	strTextType = rsConfiguration("text_type")
	intTextSize = CInt(rsConfiguration("text_size"))
	strLinkColour = rsConfiguration("links_colour")
	strVisitedLinkColour = rsConfiguration("visited_links_colour")
	strHoverLinkColour = rsConfiguration("active_links_colour")
	strWelcomeMessage = rsConfiguration("welcome_message")
	strWelcomeFormat = rsConfiguration("welcome_format")
	blnLCode = CBool(rsConfiguration("Code"))
End If

'Reset server object
rsConfiguration.Close
Set rsConfiguration = Nothing


'***********************************************
'Function to strip non alphanumeric characters for links and email addresses
Private Function characterStrip(strTextInput)

	'Dimension variable
	Dim intLoopCounter 	'Holds the loop counter
	
	'Loop through the ASCII characters
	For intLoopCounter = 0 to 37
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Loop through the ASCII characters
	For intLoopCounter = 39 to 44
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Loop through the ASCII characters numeric characters to lower-case characters
	For intLoopCounter = 65 to 94
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Loop through the extended ASCII characters
	For intLoopCounter = 123 to 125
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Loop through the extended ASCII characters
	For intLoopCounter = 127 to 255
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0) 
	Next
	
	'Strip individul ASCII characters left out from above left over
	strTextInput = Replace(strTextInput, CHR(59), "", 1, -1, 0)
	strTextInput = Replace(strTextInput, CHR(60), "", 1, -1, 0)
	strTextInput = Replace(strTextInput, CHR(62), "", 1, -1, 0)
	strTextInput = Replace(strTextInput, CHR(96), "", 1, -1, 0)
	
	
	'Return the string
	characterStrip = strTextInput
	
End Function
'*******************************************************
%>