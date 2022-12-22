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

'Dimension variables
Dim rsListMembers 		'Database Recordset Variable
Dim intRecordPositionPageNum 	'Holds the record position
Dim intRecordLoopCounter 	'Loop counter for displaying the  records
Dim intTotalNumEntries 		'Holds the total number of records in the database
Dim intTotalNumPages 		'Holds the total number of pages in the database
Dim intLinkPageNum 		'Holds the page number to be linked to


'If the session variable is False or does not exsist then redirect the user to the unauthorised user page
If Session("blnIsUserGood") = False or IsNull(Session("blnIsUserGood")) = True then
	'Redirect to unathorised user page
	Response.Redirect"unauthorised_user_page.htm"
End If


'If this is the first time the page is displayed then the  record position is set to page 1
If Request.QueryString("PagePosition") = "" Then
	intRecordPositionPageNum = 1

'Else the page has been displayed before so the  record postion is set to the Record Position number
Else
	intRecordPositionPageNum = CLng(Request.QueryString("PagePosition"))
End If	

'Create recorset object
Set rsListMembers = Server.CreateObject("ADODB.Recordset")
	
'Initalise the strSQL variable with an SQL statement to query the database by selecting all tables ordered by the decending date
strSQL = "SELECT tblMailingList.* FROM tblMailingList ORDER BY tblMailingList.Email ASC;"

'Set the cursor type property of the record set to dynamic so we can naviagate through the record set
rsListMembers.CursorType = 3
	
'Query the database
rsListMembers.Open strSQL, adoCon

'Set the number of records to display on each page by the constant set at the top of the script
rsListMembers.PageSize = 40
	
'Get the  record poistion to display from
If NOT rsListMembers.EOF Then rsListMembers.AbsolutePage = intRecordPositionPageNum

%>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Remover E-mails Cadastrados</title>

<!-- The Web Wiz Guide - Web Wiz Mailing List is written and produced by Bruce Corkhill ©2001-2002
     	 If you want your own ASP Mailing List then goto http://www.webwizguide.info -->
<LINK href="style.css" type=text/css rel=STYLESHEET>
</head>
<body bgcolor="#FFFFFF">
<div align="center"> 
  <p><font size="4" face="Verdana, Arial, Helvetica, sans-serif"><b>REMOVER E-MAILS CADASTRADOS </b></font></p>
  <p><font size="2"><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif">Voltar para o menu principal</font></a></font></p>
  <form name="DeleteForm" method="post" action="delete_list_members.asp?PagePosition=<% = intRecordPositionPageNum %>">
    <font size="1" face="Verdana, Arial, Helvetica, sans-serif">
    <%

'If there are no records in the database display an error message
If rsListMembers.EOF Then

	'If the page position is not 1 and were at the end of the recordset then redirect to the first page
	If intRecordPositionPageNum > 1 Then Response.Redirect "delete_list_members_form.asp?PagePosition=1"
	
	'Tell the user there are no records to show
	Response.Write "Não há e-mails cadastrados"
	Response.Write "<br>"
	Response.End
	
'Display the 
Else
	
	'Count the number of enties in the database
	intTotalNumEntries = rsListMembers.RecordCount	
	
	'Count the number of pages there are in the database calculated by the PageSize attribute set above
	intTotalNumPages = rsListMembers.PageCount


	'Display the HTML number number the total number of pages and total number of records in the  database
	Response.Write vbCrLf & "	<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" align=""center"">"
	Response.Write vbCrLf & " 	  <tr>"
	Response.Write vbCrLf & " 	    <td align=""center"">"
	Response.Write vbCrLf & "	      <br><br>"
	Response.Write vbCrLf & "	      Existem " & intTotalNumEntries & " e-mails cadastrados em " & intTotalNumPages & " páginas"
	Response.Write vbCrLf & "	    </td>"
	Response.Write vbCrLf & "	  </tr>"
	Response.Write vbCrLf & "	</table>"
	Response.Write vbCrLf & "	<br>"

	
	' loop through the records in the database and show the infomation
  	' using a Do While...Loop statement
      	For intRecordLoopCounter = 1 to 40
      	
      		'If there are no  records left to display then exit loop
		If rsListMembers.EOF Then Exit For
	      	

		'Display the e-mail's in HTML
		Response.Write vbCrLf & "    <table width=""400"" border=""0"" align=""center"">"
		Response.Write vbCrLf & "      <tr>"
		Response.Write vbCrLf & "        <td width=""2%""><input type=""checkbox"" name=""chkID"" value="" " & CLng(rsListMembers("Mail_ID")) & " ""></td>"
		Response.Write vbCrLf & "        <td width=""98%"">" & rsListMembers("Email") & "</td>"
		Response.Write vbCrLf & "      </tr>"
		Response.Write vbCrLf & "    </table>"
    
      		' Move to the next record
	   	rsListMembers.MoveNext
   	
	Next
	
	
End If
%>
    </font><br>
    <table width="90%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><br>
          <input type="submit" name="cmdDelete" value="Apagar E-mails Selecionados">
        </td>
      </tr>
    </table>
    <br>
  </form>
</div>
<%
'Display an HTML table with links to the other entries in the 
Response.Write vbCrLf & "	<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" align=""center"">"
Response.Write vbCrLf & " 	  <tr>"
Response.Write vbCrLf & " 	    <td>"
Response.Write vbCrLf & "		<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"">"
Response.Write vbCrLf & "		  <tr>"
Response.Write vbCrLf & "		    <td width=""50%"" align=""center"">"

'If there are more pages to display then add a title to the other pages
If intRecordPositionPageNum > 1 or NOT rsListMembers.EOF Then
	Response.Write vbCrLf & "		Page:&nbsp;&nbsp;"
End If

'If the  page number is higher than page 1 then display a back link    	
If intRecordPositionPageNum > 1 Then 
	Response.Write vbCrLf & "		 <a href=""delete_list_members_form.asp?PagePosition=" &  intRecordPositionPageNum - 1  & """ target=""_self"">&lt;&lt;&nbsp;Prev&nbsp;&nbsp;</a> "   	     	
End If     	


'If there are more pages to display then display links to all the pages
If intRecordPositionPageNum > 1 or NOT rsListMembers.EOF Then 
	
	'Display a link for each page in the      	
	For intLinkPageNum = 1 to intTotalNumPages		
		
		'If the page to be linked to is the page displayed then don't make it a hyper-link
		If intLinkPageNum = intRecordPositionPageNum Then
			Response.Write vbCrLf & "		     " & intLinkPageNum
		Else
		
			Response.Write vbCrLf & "		     <a href=""delete_list_members_form.asp?PagePosition=" &  intLinkPageNum  & """ target=""_self"">&nbsp;" & intLinkPageNum & "&nbsp;</a> "			
		End If
	Next
End If


'If it is Not the End of the  entries then display a next link for the next  page      	
If NOT rsListMembers.EOF then   	
	Response.Write vbCrLf & "		<a href=""delete_list_members_form.asp?PagePosition=" &  intRecordPositionPageNum + 1  & """ target=""_self"">&nbsp;Next&nbsp;&gt;&gt;</a>"	   	
End If      	


'Finsh HTML the table      	
Response.Write vbCrLf & "		    </td>"      	
Response.Write vbCrLf & "		  </tr>"
Response.Write vbCrLf & "		</table>"		
Response.Write vbCrLf & "	    </td>"
Response.Write vbCrLf & "	  </tr>"
Response.Write vbCrLf & "	</table>"

 

'Reset Sever Objects
Set adoCon = Nothing
Set strCon = Nothing
Set rsListMembers = Nothing


%>
</body>
</html>
