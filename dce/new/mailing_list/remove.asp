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


'Declare variables
Dim rsRemoveListMember	'Database recordset variable
Dim strUserID		'Holds the users e-mail address
Dim strErrorMessage	'Holds the error message if the user is not entered into the database


'Read in the persons e-mail address
strUserID = Request.QueryString("ID")

'Clean up the input code address address getting rid of unwated characters
strUserID = characterStrip(strUserID)


'Create recorset object
Set rsRemoveListMember = Server.CreateObject("ADODB.Recordset")
	
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblMailingList.* FROM tblMailingList WHERE tblMailingList.ID_code = '" & strUserID & "';"

'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
rsRemoveListMember.CursorType = 2
	
'Set the Lock Type for the records so that the record set is only locked when it is deleteed
rsRemoveListMember.LockType = 3
	
'Query the database
rsRemoveListMember.Open strSQL, adoCon


'If there is no error message then add the new user to the database
If NOT rsRemoveListMember.EOF Then
	
	'Delete the record
	rsRemoveListMember.Delete
Else
	'As there is no record returned we need an error message
	strErrorMessage = "<br>Sorry, an error has occured and you can not be removed from the list."	
	strErrorMessage = strErrorMessage & "<br>Please contact " & strWebsiteName & "'s webmaster to be removed from the mailing list."
	strErrorMessage = strErrorMessage & "<br><br><a href=""mailto: " & strWebsiteEmailAddress & """>" & strWebsiteEmailAddress & "</a>"

End If

'If this is the webmasters email ID then just display a test message
If strUserID = "webmaster0001" Then strErrorMessage = "<b>Preview email.</b><br>You can not remove preview email address from the database."

'Reset server objects
rsRemoveListMember.Close
Set rsRemoveListMember = Nothing
Set strCon = Nothing
Set adoCon = Nothing
%>
<html>
<head>
<title>Mailing List Removal</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">

<!-- The Web Wiz Guide - Web Wiz Mailing List is written and produced by Bruce Corkhill ©2001-2002
     	 If you want your own ASP Mailing List then goto http://www.webwizguide.info -->

<!-- #include file="header.inc" -->
<div align="center">
  <span class="heading">Mailing List</span>
  <br>
  <br>
  <span class="text"><%
'If there is an error message then display it
If IsEmpty(strErrorMessage) = False Then
	
	'Write the error message
	Response.Write(strErrorMessage)
Else
  %>
  <br>
  You have been removed from <% = strWebsiteName %>'s mailing list.<br>
  Sorry for any inconvenience. 
  <%
End If
%>
  </span> <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <%
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnLCode = True Then
	Response.Write("<span class=""text"" style=""font-size:11px"">Powered by <a href=""http://www.webwizguide.info"" target=""_blank"" style=""font-size:11px"">Web Wiz Mailing List</a> version 3.02</span>")
	Response.Write("<br><span class=""text"" style=""font-size:11px"">Copyright &copy;2001-2002 Web Wiz Guide</span>")
End If 
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
 %>
</div>
<!--#include file="footer.inc" -->