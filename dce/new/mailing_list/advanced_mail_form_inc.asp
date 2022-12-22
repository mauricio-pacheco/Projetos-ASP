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

<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to format text in the text box
function FormatText(command, option){
	
  	frames.message.document.execCommand(command, true, option);
  	frames.message.focus();
}

//Function to add image
function AddImage(){	
	imagePath = prompt('Enter the web address of the image', 'http://');				
	
	if ((imagePath != null) && (imagePath != "")){					
		frames.message.document.execCommand('InsertImage', false, imagePath);
  		frames.message.focus();
	}
	frames.message.focus();			
}

//Function to add smiley
function AddSmileyIcon(imagePath){	
									
	frames.message.document.execCommand('InsertImage', false, imagePath);
  	frames.message.focus();			
}

//Function to clear form
function ResetForm(){

	if (window.confirm('Are you sure you want to clear the e-mail you have entered?')){
	 	frames.message.document.body.innerHTML = ''; 
	 	return true;
	 } 
	 return false;		
}

// -->
</script>
<div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
  <br>
</font><br>
</div>
<form method=post name="frmSendmail" action="send_mail.asp?Format=advHTML" onSubmit="return CheckForm();" onReset="return ResetForm();">
  <table width="660" border="0" cellspacing="0" cellpadding="1" bgcolor="#000000" height="230" align="center">
    <tr> 
      <td height="66" width="967"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF" height="201">
          <tr> 
            <td height="199"> 
              <table width="100%" border="0" align="center" height="233">
                <tr> 
                  <td colspan="2" height="30" class="text" align="left">*Campos Requeridos</td>
                </tr>
                <tr > 
                  <td align="right" width="15%" height="12"><span class="text">Assunto*:</span></td>
                  <td height="12" width="85%"> 
                    <input type="text" name="subject" size="30" maxlength="40" value="<% = Request.Form("subject") %>">
                  </td>
                </tr>
                <tr> 
                  <td valign="bottom" align="right" height="22" width="15%"><span class="text">Formato:</span></td>
                  <td height="22" width="85%" valign="bottom"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="1">
                      <tr> 
                        <td> 
                          <select name="selectText" onChange="FormatText('FontName', selectText.options[selectText.selectedIndex].value);document.frmSendmail.selectText.options[0].selected = true;" >
                            <option value="0" selected>-- Font Type --</option>
                            <option value="Arial, Helvetica, sans-serif">Arial</option>
                            <option value="Times New Roman, Times, serif">Times</option>
                            <option value="Courier New, Courier, mono">Courier New</option>
                            <option value="Verdana, Arial, Helvetica, sans-serif">Verdana</option>
                          </select>
                          <select name="selectFontSize" onChange="FormatText('FontSize', selectFontSize.options[selectFontSize.selectedIndex].value);document.frmSendmail.selectFontSize.options[0].selected = true;" >
                            <option value="0" selected>-- Font Size --</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                          </select>
                          <select name="selectFontColour" onChange="FormatText('ForeColor', selectFontColour.options[selectFontColour.selectedIndex].value);document.frmSendmail.selectFontColour.options[0].selected = true;" >
                            <option value="0" selected>-- Font Colour --</option>
                            <option value="black">Black</option>
                            <option value="white">White</option>
                            <option value="blue">Blue</option>
                            <option value="red">Red</option>
                            <option value="green">Green</option>
                            <option value="yellow">Yellow</option>
                            <option value="orange">Orange</option>
                            <option value="brown">Brown</option>
                            <option value="magenta">Magenta</option>
                            <option value="cyan">Cyan</option>
                            <option value="limegreen">Lime Green</option>
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <td><img src="images/post_button_cut.gif" width="25" height="24" align="absmiddle" onClick="FormatText('cut')" style="cursor: hand;" alt="Cut"> 
                          <img src="images/post_button_copy.gif" width="25" height="24" align="absmiddle" onClick="FormatText('copy')" style="cursor: hand;" alt="Copy"> 
                          <img src="images/post_button_paste.gif" width="25" height="24" align="absmiddle" onClick="FormatText('paste')" style="cursor: hand;" alt="Paste"> 
                          <img src="images/post_button_bold.gif" width="25" height="24" align="absmiddle" alt="Bold" onClick="FormatText('bold', '')" style="cursor: hand;"> 
                          <img src="images/post_button_italic.gif" width="25" height="24"  align="absmiddle" alt="Italic" onClick="FormatText('italic', '')" style="cursor: hand;"> 
                          <img src="images/post_button_underline.gif" width="25" height="24" align="absmiddle" alt="Underline" onClick="FormatText('underline', '')" style="cursor: hand;"> 
                          <img src="images/post_button_left_just.gif" width="25" height="24" align="absmiddle" onClick="FormatText('JustifyLeft', '')" style="cursor: hand;" alt="Left Justify"> 
                          <img src="images/post_button_centre.gif" width="25" height="24" align="absmiddle" border="0" alt="Centre Justify" onClick="FormatText('JustifyCenter', '')" style="cursor: hand;"> 
                          <img src="images/post_button_right_just.gif" width="25" height="24" align="absmiddle" onClick="FormatText('JustifyRight', '')" style="cursor: hand;" alt="Right Justify"> 
                          <img src="images/post_button_list.gif" width="25" height="24" align="absmiddle" border="0" alt="Unordered List" onClick="FormatText('InsertUnorderedList', '')" style="cursor: hand;"> 
                          <img src="images/post_button_outdent.gif" width="25" height="24" align="absmiddle" onClick="FormatText('Outdent', '')" style="cursor: hand;" alt="Outdent"> 
                          <img src="images/post_button_indent.gif" width="25" height="24" align="absmiddle" border="0" alt="Indent" onClick="FormatText('indent', '')" style="cursor: hand;"> 
                          <img src="images/post_button_hyperlink.gif" width="25" height="24" align="absmiddle" border="0" alt="Add Hyperlink" onClick="FormatText('createLink')" style="cursor: hand;"> 
                          <img src="images/post_button_image.gif" width="25" height="24" align="absmiddle" border="0" alt="Add Image" onClick="AddImage()" style="cursor: hand;"> 
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr > 
                  <td valign="top" align="right" height="61" width="15%" ><span class="text">Mensagem*:</span></td>
                  <td height="61" width="85%" valign="top"> 
                    <%
'This bit creates a random number to add to the end of the iframe link as IE will cashe the page
'Randomise the system timer
Randomize Timer
%>
                    <script language="javascript">
		    
		    	//Create an iframe and turn on the design mode for it
		    	document.write ('<iframe src="adv_mail_textbox.asp?ID=<% = CInt(RND * 2000) %>" id="message" width="510" height="200"></iframe>')
                    	frames.message.document.designMode = "On";
                  
                    </script>
                    <!-- Display a message for IE users with JavaScript turned off -->
                    <noscript><br><br>JavaScript must be enabled on your web browser for you to you the WYSIWYG e-mail editor!</noscript>
                  </td>
                </tr>
                  <td valign="top" align="right" height="2" width="15%" > 
                    <input type="hidden" name="format" value="advHTML">
		    <input type="hidden" name="body" value="">
                  </td>
                <td height="2" width="85%" align="left"> 
                  <input type="submit" name="Submit" value="Enviar" OnClick="document.frmSendmail.body.value = frames.message.document.body.innerHTML;">
                    <input type="submit" name="Submit" value="_" OnClick="document.frmSendmail.body.value = frames.message.document.body.innerHTML;">
                    <input type="reset" name="Reset" value="Limpar">
                  
                </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"></div>
</form>
