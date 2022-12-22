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


'Set the response buffer to true as we maybe redirecting
Response.Buffer = True 

Dim rsCheckUser 	'Database Recordset Variable
Dim strUserName 	'Holds the user name
Dim strUserPassword 	'Holds the user password

'Initalise the strUserName variable
strUserName = Request.Form("txtUserName")

'Create recorset object
Set rsCheckUser = Server.CreateObject("ADODB.Recordset")

'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblConfiguration.Password, tblConfiguration.Username "
strSQL = strSQL & "FROM tblConfiguration "
strSQL = strSQL & "WHERE tblConfiguration.Username ='" & strUserName & "'"

'Query the database
rsCheckUser.Open strSQL, strCon

'If the recordset finds a record for the username entered then read in the password for the user
If NOT rsCheckUser.EOF Then
	'Read in the password for the user from the database
	If (Request.Form("txtUserPass")) = rsCheckUser("Password") Then
		
		'If the password is correct then set the session variable to True
		Session("blnIsUserGood") = True
		
		'Close Objects before redirecting
		Set rsCheckUser = Nothing
		Set strCon = Nothing
		Set adoCon = Nothing
		
		'Redirect to the admin menu page
		Response.Redirect"admin_menu.asp"
	End If
End If
		
'Reset server objects
rsCheckUser.Close
Set rsCheckUser = Nothing
Set strCon = Nothing
Set adoCon = Nothing
	
'If the script is still running then the user must not be authorised
Session("blnIsUserGood") = False

'Redirect to the unautorised user page
Response.Redirect"unauthorised_user_page.htm"
%>



