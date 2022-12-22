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
Dim rsNewsConfig 		'Recorset holding all the username in the database				
Dim strMode			'holds the mode of the page, set to true if changes are to be made to the database

   
'If the session variable is False or does not exsist then redirect the user to the unauthorised user page
If Session("blnIsUserGood") = False or IsNull(Session("blnIsUserGood")) = True then
	'Redirect to unathorised user page
	Response.Redirect"unauthorised_user_page.htm"
End If 

'Read in the users colours for the mailing list
strBgColour = Request.Form("bg")
strTextColour = Request.Form("text")
strTextType = Request.Form("FontType")
intTextSize = CInt(Request.Form("FontSize"))
strLinkColour = Request.Form("links")
strVisitedLinkColour = Request.Form("vLinks")
strHoverLinkColour = Request.Form("aLinks")
strMode = Request.Form("mode")


'Intialise the ADO recordset object
Set rsNewsConfig  = Server.CreateObject("ADODB.Recordset")
	

'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblConfiguration.* From tblConfiguration;"

'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
rsNewsConfig.CursorType = 2

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsNewsConfig.LockType = 3
	
'Query the database
rsNewsConfig.Open strSQL, strCon

'If the user is changing the colours then update the database
If strMode = "change" Then

	
	'Update the recordset	
	rsNewsConfig.Fields("bg_colour") = strBgColour
	rsNewsConfig.Fields("text_colour") = strTextColour
	rsNewsConfig.Fields("text_type") = strTextType
	rsNewsConfig.Fields("text_size") = intTextSize
	rsNewsConfig.Fields("links_colour") = strLinkColour
	rsNewsConfig.Fields("visited_links_colour") = strVisitedLinkColour
	rsNewsConfig.Fields("active_links_colour") = strHoverLinkColour		
				
	'Update the database with the new user's colours
	rsNewsConfig.Update
		
	'Re-run the query to read in the updated recordset from the database
	rsNewsConfig.Requery	
End If

'Read in the mailing list colours from the database
If NOT rsNewsConfig.EOF Then
	
	'Read in the colour info from the database
	strBgColour = rsNewsConfig.Fields("bg_colour")
	strTextColour = rsNewsConfig.Fields("text_colour")
	strTextType = rsNewsConfig.Fields("text_type")
	intTextSize = CInt(rsNewsConfig.Fields("text_size"))
	strLinkColour = rsNewsConfig.Fields("links_colour")
	strVisitedLinkColour = rsNewsConfig.Fields("visited_links_colour")
	strHoverLinkColour = rsNewsConfig.Fields("active_links_colour")
End If


'Reset Server Objects
rsNewsConfig.Close
Set rsNewsConfig = Nothing
Set adoCon = Nothing
Set strCon = Nothing
%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Change Mailing List Colours</title>

<!-- The Web Wiz Guide - Web Wiz Mailing List is written and produced by Bruce Corkhill ©2001-2002
     	 If you want your own ASP Mailing List then goto http://www.webwizguide.info -->
		
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm() {

	var errorMsg = "";
	
	//Check for a background colour
	if (document.frmColours.bg.value==""){
		errorMsg += "\n\tBackground \t- Enter a Background Colour";
	}
	
	//Check for a text colour
	if (document.frmColours.text.value==""){
		errorMsg += "\n\tText \t\t- Enter a Text Colour";
	}
	
	//Check for a Links
	if (document.frmColours.links.value==""){
		errorMsg += "\n\tLink Colour \t- Enter a Link Colour";
	}
	
	//Check for a Visited Links Colour
	if (document.frmColours.vLinks.value==""){
		errorMsg += "\n\tVisited Link \t- Enter a Visited Links Colour";
	}
	
	//Check for a Active Links Colour
	if (document.frmColours.aLinks.value==""){
		errorMsg += "\n\tMouse Over Link \t- Enter a Mouse Over Link Colour";
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
<body bgcolor="#FFFFFF" text="#000000" link="<% = strLinkColour %>" vlink="<% = strVisitedLinkColour %>" alink="<% = strHoverLinkColour %>">
<div align="center" class="heading">Configure Mailing List Colours </div>
<div align="center"><a href="admin_menu.asp" target="_self">Return to the Mailing 
  List menu Menu</a><br>
  <br>
  <table width="97%" border="0" cellspacing="1" cellpadding="1" align="center" height="86">
    <tr>
      <td height="69" align="center" bgcolor="<% = strBgColour %>"> <font color="<% = strTextColour %>"><span class="text">Text</span></font><span class="text"> 
        Type and Colour<br>
        <a href="configure_mailing_list_colours.asp" target="_self">Link Colour</a> <br>
        <br>
        </span> 
        <table width="100%" border="0" cellspacing="1" cellpadding="1">
          <tr> 
            <td align="center" height="28" class="text"><font color="<% = strTextColour %>">Background</font></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
<form method="post" name="frmColours" action="configure_mailing_list_colours.asp" onSubmit="return CheckForm();">
  <table width="470" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000" height="277">
    <tr> 
      <td height="234" width="439"> 
        <table width="470" border="0" align="center" height="233" cellpadding="4" cellspacing="1">
          <tr align="left" bgcolor="#FFFFFF"> 
            <td colspan="2" class="arial_sm2" height="30"><font size="2">*Indicates 
              required fields</font></td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="236" class="arial" height="12">Background 
              Colour *</td>
            <td height="12" width="233" valign="top"> 
              <input type="text" name="bg" maxlength="10" value="<% = strBgColour %>" size="10" >
            </td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="236" class="arial" height="2">Text Colour*</td>
            <td width="233" valign="top" height="2"> 
              <input type="text" name="text" maxlength="10" value="<% = strTextColour %>" size="10" >
            </td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="236" class="arial" height="23">Font Style</td>
            <td height="23" width="233" valign="top"> 
              <select name="FontType">
                <option value="Arial, Helvetica, sans-serif" <% If strTextType = "Arial, Helvetica, sans-serif" Then Response.Write("selected") %>>Arial, 
                Helvetica, sans-serif</option>
                <option value="Times New Roman, Times, serif" <% If strTextType = "Times New Roman, Times, serif" Then Response.Write("selected") %>>Times 
                New Roman, Times, serif</option>
                <option value="Courier New, Courier, mono" <% If strTextType = "Courier New, Courier, mono" Then Response.Write("selected") %>>Courier 
                New, Courier, mono</option>
                <option value="Georgia, Times New Roman, Times, serif" <% If strTextType = "Georgia, Times New Roman, Times, serif" Then Response.Write("selected") %>>Georgia, 
                Times New Roman, Times, serif</option>
                <option value="Verdana, Arial, Helvetica, sans-serif" <% If strTextType = "Verdana, Arial, Helvetica, sans-serif" Then Response.Write("selected") %>>Verdana, 
                Arial, Helvetica, sans-serif</option>
                <option value="Geneva, Arial, Helvetica, san-serif" <% If strTextType = "Geneva, Arial, Helvetica, san-serif" Then Response.Write("selected") %>>Geneva, 
                Arial, Helvetica, san-serif</option>
              </select>
            </td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="236" class="arial" height="23">Font Size</td>
            <td height="23" width="233" valign="top"> 
              <select name="FontSize">
                <option value="10" <% If intTextSize = 10 Then Response.Write("selected") %>>10</option>
                <option value="11" <% If intTextSize = 11 Then Response.Write("selected") %>>11</option>
                <option value="12" <% If intTextSize = 12 Then Response.Write("selected") %>>12</option>
                <option value="13" <% If intTextSize = 13 Then Response.Write("selected") %>>13</option>
                <option value="14" <% If intTextSize = 14 Then Response.Write("selected") %>>14</option>
              </select>
              pixels</td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="236" class="arial" height="23">Links*</td>
            <td height="23" width="233" valign="top"> 
              <input type="text" name="links" maxlength="10" value="<% = strLinkColour %>" size="10" >
            </td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="236" class="arial" height="23">Visited Links*</td>
            <td height="23" width="233" valign="top"> 
              <input type="text" name="vLinks" maxlength="10" value="<% = strVisitedLinkColour %>" size="10" >
            </td>
          </tr>
          <tr class="arial" bgcolor="#FFFFFF"> 
            <td align="left" width="236" class="arial" height="23">Mouse Over 
              Link Colour*<br>
            </td>
            <td height="23" width="233" valign="top"> 
              <input type="text" name="aLinks" maxlength="10" value="<% = strHoverLinkColour %>" size="10" >
              &nbsp;</td>
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
      </td>
    </tr>
  </table>
</form>
<br>
</body>
</html>
