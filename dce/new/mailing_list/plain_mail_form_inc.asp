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
%>

<div align="center"> 
  <form method=post name="frmSendmail" action="send_mail.asp?Format=Plain" onSubmit="return CheckForm();" onReset="return confirm('Are you sure you want to clear the E-mail you have entered?');">
    <table width="660" border="0" cellspacing="0" cellpadding="1" height="230" align="center" bgcolor="#000000">
    <tr> 
        <td height="224" width="967"> 
          <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="201">
          <tr> 
              <td height="248"> 
                <table width="100%" border="0" align="center" height="233" cellpadding="2" cellspacing="0">
                  <tr align="left" bgcolor="#FFFFFF"> 
                    <td colspan="2" height="30">*Indicates required fields</td>
                  </tr>
                  <tr bgcolor="#FFFFFF" > 
                    <td align="right" width="16%" height="12">E-mail Subject*:</td>
                    <td height="12" width="84%"> 
                      <input type="text" name="subject" size="30" maxlength="40" value="<% = Request.Form("subject") %>">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF" > 
                    <td valign="top" align="right" height="61" width="16%" >E-mail Body*:</td>
                    <td height="61" width="84%" valign="top"> 
                      <textarea name="body" cols="57" rows="12"><% = Request.Form("body") %></textarea>
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td valign="top" align="right" height="2" width="16%" >
                      <input type="hidden" name="format" value="plain">
                    </td>
                    <td height="2" width="84%" align="left"> 
                      <input type="submit" name="Submit" value="Send Preview to Myself">
                      <input type="submit" name="Submit" value="Send to All Members">
                      <input type="reset" name="Reset" value="Reset Form">
                    </td>
                  </tr>
                </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form></div>