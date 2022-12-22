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


Private Function decodeString(strInputEntry)

	strInputEntry = Replace(strInputEntry, "&#097;", "a", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#098;", "b", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#099;", "c", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#100;", "d", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#101;", "e", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#102;", "f", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#103;", "g", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#104;", "h", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#105;", "i", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#106;", "j", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#107;", "k", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#108;", "l", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#109;", "m", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#110;", "n", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#111;", "o", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#112;", "p", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#113;", "q", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#114;", "r", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#115;", "s", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#116;", "t", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#117;", "u", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#118;", "v", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#119;", "w", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#120;", "x", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#121;", "y", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#122;", "z", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#048;", "0", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#049;", "1", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#050;", "2", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#051;", "3", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#052;", "4", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#053;", "5", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#054;", "6", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#055;", "7", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#056;", "8", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#057;", "9", 1, -1, 0)
	
	'Return
	decodeString = strInputEntry
End Function




'Dimension variables		
Dim rsRemoveLinks		'recordset holding the admin details		
Dim strMode			'holds the mode of the page, set to true if changes are to be made to the database
Dim blnLinksRemoved
Dim blnWrongCode
blnLinksRemoved = False
blnWrongCode = False
strCodeField = decodeString(strCodeField)
strCode = decodeString(strCode)
strMode = Request.Form("mode")
Set rsRemoveLinks = Server.CreateObject("ADODB.Recordset")	
strSQL = "SELECT tblConfiguration." & strCodeField & " From tblConfiguration;"
rsRemoveLinks.LockType = 3	
rsRemoveLinks.CursorType = 2
rsRemoveLinks.Open strSQL, strCon
If NOT rsRemoveLinks.EOF Then
If rsRemoveLinks.Fields(strCodeField) = False Then blnLinksRemoved = True
End If
If strMode = "change" Then	
If NOT rsRemoveLinks.EOF Then
If LCase(Request.Form("code")) = LCase(strCode) Then
rsRemoveLinks.Fields(strCodeField) = False			
rsRemoveLinks.Update			
blnLinksRemoved = True
Else		
blnWrongCode = True			
End If		
End If
End If
%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Remove Link Buttons</title>

<!-- The Web Wiz Guide - Web Wiz Mailing List is written and produced by Bruce Corkhill ©2001-2002
     	 If you want your own ASP Mailing List then goto http://www.webwizguide.info -->
		
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Check for a Username
	if (document.frmLinkCode.code.value==""){
		alert("Please enter your a Code");
		document.frmLinkCode.code.focus();
		return false;
	}
	
	return true
}
// -->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Remove Web Wiz Guide Links</font></h1>
<div align="center"> 
 <p><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration Menu</font></a><br>
  <br>
  <% If blnLinksRemoved = True Then %>
  <br>
  <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Thank-you for your donation to Web Wiz Guide, the links should now be removed from the Web Wiz Mailing List.<br>
  <br>
  If there are any problems please e-mail Web Wiz Guide at: -<br>
  <a href="mailto:donations@webwizguide.com">donations@webwizguide.com</a></font><br>
  <% Else %>
  <br>
  <font face="Verdana, Arial, Helvetica, sans-serif" size="2">As part of the license for the Web Wiz Mailing List you are required to leave Powered By<br>
  </font><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Web Wiz Guide links in place. I believe that this is a small price to pay for the many hours of <br>
  ongoing time that have gone into development and support.<br>
  <br>
  However, many people have asked if they can remove these links for various reasons so <br>
  I am asking for a small donation to help me cover some of the costs involved in the many 1,000's of <br>
  hours of </font><font face="Verdana, Arial, Helvetica, sans-serif" size="2">ongoing development, support, and distribution of this and other <br>
  free applications and services from Web Wiz Guide.<br>
  <br>
  For more information or to find out how you can make a donation to Web Wiz Guide click on the link below: -<br>
  <br>
  <a href="http://www.webwizguide.info/purchase/default.asp" target="_blank">Click here to make a donation to Web Wiz Guide and receive the link removal code</a></font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
  </font><br>
 </p>
 </div>
<%
If blnWrongCode = True Then
%>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center"><font size="5"><b><br>
   <font face="Arial, Helvetica, sans-serif">Sorry the code you have entered is incorrect!</font></b></font></td>
  </tr>
</table>
<%
End If
%>
<form method="post" name="frmLinkCode" action="remove_link_buttons.asp" onSubmit="return CheckForm();">
  
 <table width="315" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000" height="30">
  <tr> 
      <td height="2" width="483" align="center"> 
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr> 
            <td bgcolor="#FFFFFF"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  
         <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Enter the link removal code in the box below&nbsp;</font> </td>
                </tr>
                <tr> 
                  
         <td align="right" width="29%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Code:&nbsp;</font> </td>
                  <td width="71%"> 
                    <input type="text" name="code" size="15" maxlength="15" >
                  </td>
                </tr>
                <tr> 
                  <td align="right" width="29%"> 
                    <input type="hidden" name="mode" value="change">
                  </td>
                  <td width="71%"> 
                    <input type="submit" name="Submit" value="Remove Links">
                    <input type="reset" name="Reset" value="Clear">
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<% End If %>
<div align="center"><br>
 <font face="Verdana, Arial, Helvetica, sans-serif" size="2">For more info contact: -<br>
 <a href="mailto:donations@webwizguide.com">donations@webwizguide.com</a><br>
 Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom.</font></div>
</body>
</html>
<%
'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
Set rsRemoveLinks = Nothing
%>
