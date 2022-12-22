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


//Have the propmt box turned on by default
var promptOn = true;


//Function to turn on or off the prompt box
function PromptMode(selectMode){
	
	if (selectMode.options[selectMode.selectedIndex].value == 0){
		promptOn = false;
	}
	else{
		promptOn = true;
	}
}


// Function to add the code for bold italic centre and underline, to the body
function AddMessageCode(code, promptText, InsertText) {

	if (code != "") {
		if (promptOn == true){
			insertCode = prompt(promptText + "\n<" + code + ">xxx</" + code + ">", InsertText);
				if ((insertCode != null) && (insertCode != "")){
					document.frmSendmail.body.value += "<" + code + ">" + insertCode + "</" + code + ">";
				}
		}
		else{
			document.frmSendmail.body.value += "<" + code + "></" + code + ">";
		}
	}
				
	document.frmSendmail.body.focus();
}

// Function to add the font colours to the body, to the body
function AddColourCode(code) {

	if (code != "") {
		if (promptOn == true){
			insertCode = prompt("Enter the text that you would like in " + code + "\n<font color='" + code + "'>xxx</font>", '');
				if ((insertCode != null) && (insertCode != "")){
					document.frmSendmail.body.value += "<font color='" + code + "'>" + insertCode + "</font>";
				}
		}
		else{
			document.frmSendmail.body.value += "<font color='" + code + "'></font>";
		}
	}
	document.frmSendmail.selectColour.options[0].selected = true;		
	document.frmSendmail.body.focus();
}


//Function to add the URL, indent, list, and Email code to the body
function AddCode(code) {

	//For the URL code
	if ((code != "") && (code == "URL")) {
		insertText = prompt("Enter the on screen display text for the Hyperlink", "");
			
			if ((insertText != null) && (insertText != "") && (code == "URL")){
				insertCode = prompt("Enter the URL address to create Hyperlink to", "http://");
					
					if ((insertCode != null) && (insertCode != "") && (insertCode != "http://")){					
						document.frmSendmail.body.value += "<a href='" + insertCode + "'>" + insertText + "</a>";
					}
			}
	}
	
	
	//For the email code
	if ((code != "") && (code == "EMAIL")) {
		insertText = prompt("Enter the on screen display text for the E-mail address", "");
			
			if ((insertText != null) && (insertText != "")){
				insertCode = prompt("Enter the E-mail address to link to", "");
					
					if ((insertCode != null) && (insertCode != "")){					
					document.frmSendmail.body.value += "<a href='mailto:" + insertCode + "'>" + insertText + "</a>";
				}
			}
	}
	
	//For the image code
	if ((code != "") && (code == "IMAGE")) {	
		insertCode = prompt("Enter the web address of the image", "http://");
					
			if ((insertCode != null) && (insertCode != "")){					
			document.frmSendmail.body.value += "<img src='" + insertCode + "'>";
		}			
	}
	
	//For the list code
	if ((code != "") && (code == "LIST")) {
		if (promptOn == true){
			listType = prompt("Type of list \nEnter \'1\' for numbered or leave blank for bulleted", "");
			
			while ((listType != null) && (listType != "") && (listType != "1")) {
				listType = prompt("ERROR! Please enter \'1\' for numbered or leave blank for bulleted","");               
			}
			
			if (listType != null) {			
				var listItem = "1";
				var insertCode = "";
				
				while ((listItem != "") && (listItem != null)) {
					listItem = prompt("List item Leave blank to end list",""); 
					if (listItem != "") {             
						insertCode += "<li>" + listItem + "</li>"; 
					}                   
				} 
				
				if (listType == "") {
					document.frmSendmail.body.value += "<ul>" + insertCode + "</ul>";
				} else {
					document.frmSendmail.body.value += "<ol>" + insertCode + "</ol>";
				} 
				
			}
		}
		else{
			document.frmSendmail.body.value += "<ul><li> </li><li> </li><li> </li></ul>";
		}			
	}
				
	document.frmSendmail.body.focus();
}

	
// -->
</script>
<div align="center"><a href="send_mail.asp?Format=advHTML"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Click here if you are a Windows IE5+ 
  user for the WYSIWYG E-mail Editor</font></a><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
  <br>
  For this HTML editor you must type the HTML source code into the text box, if you are not very <br>
  good with HTML then use the formatting buttons to help you write some of the HTML</font></div>
<form method=post name="frmSendmail" action="send_mail.asp?Format=HTML" onSubmit="return CheckForm();" onReset="return confirm('Are you sure you want to clear the e-mail have entered?');">
  <table width="660" border="0" cellspacing="0" cellpadding="1" height="230" align="center">
    <tr> 
      <td height="66" width="967"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#000000" height="201">
          <tr> 
            <td height="199"> 
              <table width="100%" border="0" align="center" height="233" bgcolor="#FFFFFF">
        <tr align="left"> 
         <td colspan="2" height="30" class="text">*Indicates required fields</td>
        </tr>
        <tr > 
         <td align="right" width="15%" height="12"><span class="text">Subject*:</span></td>
         <td height="12" width="85%"> <input type="text" name="subject" size="30" maxlength="40" value="<% = Request.Form("subject") %>"> </td>
        </tr>
        <tr > 
         <td valign="bottom" align="right" height="2" width="15%"><span class="text">Text Format:</span></td>
         <td height="2" width="85%" valign="bottom"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr> 
            <td> <a href="JavaScript:AddMessageCode('b','Enter text you want formatted in Bold', '')"><img src="images/post_button_bold.gif" width="25" height="24" align="absmiddle" border="0" alt="Bold"></a> <a href="JavaScript:AddMessageCode('i','Enter text you want formatted in Italic', '')"><img src="images/post_button_italic.gif" width="25" height="24" align="absmiddle" border="0" alt="Italic"></a> 
             <a href="JavaScript:AddMessageCode('u','Enter text you want Underlined', '')"><img src="images/post_button_underline.gif" width="25" height="24" align="absmiddle" border="0" alt="Underline"></a> <a href="JavaScript:AddCode('URL')"><img src="images/post_button_hyperlink.gif" width="25" height="24" align="absmiddle" border="0" alt="Add Hyperlink"></a> 
             <a href="JavaScript:AddCode('EMAIL')"><img src="images/post_button_email.gif" width="25" height="24" align="absmiddle" border="0" alt="Add E-mail Link"></a> <a href="JavaScript:AddMessageCode('center','Enter text you want Centred', '')"><img src="images/post_button_centre.gif" width="25" height="24" align="absmiddle" border="0" alt="Centre"></a> 
             <a href="JavaScript:AddCode('LIST', '')"><img src="images/post_button_list.gif" width="25" height="24" align="absmiddle" border="0" alt="List"></a> <a href="JavaScript:AddCode('IMAGE')"><img src="images/post_button_image.gif" width="25" height="24" align="absmiddle" border="0" alt="Add Image"></a> 
             <select name="selectColour" onChange=AddColourCode(selectColour.options[selectColour.selectedIndex].value) >
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
              <option value="lime green">Lime Green</option>
             </select> <span class="text">Mode:</span> <select name="selectMode" OnChange=PromptMode(this)>
              <option value="1" selected>Prompt</option>
              <option value="0">Basic</option>
             </select> </td>
           </tr>
          </table></td>
        </tr>
        <tr > 
         <td valign="top" align="right" height="61" width="15%" ><span class="text">Message*:</span></td>
         <td height="61" width="85%" valign="top"> <textarea name="body" cols="57" rows="12"><% = Request.Form("body") %></textarea> </td>
        </tr>
        <tr>
         <td valign="top" align="right" height="2" >&nbsp;</td>
         <td height="2" align="left"><input name="lineBreak" type="checkbox" id="lineBreak" value="true"<% If Request.Form("lineBreak") = "true" OR blnPreviewEmailSent = False Then Response.Write(" checked") %>>
          Replace line breaks with the HTML &lt;br&gt; tag?</td>
        </tr>
        <td valign="top" align="right" height="2" width="15%" > <input type="hidden" name="format" value="HTML"> &nbsp; </td>
        <td height="2" width="85%" align="left"> <p> 
          <input type="submit" name="Submit" value="Send Preview to Myself">
          <input type="submit" name="Submit" value="Send to All Members">
          <input type="reset" name="Reset" value="Reset Form">
         </p></td>
        </tr>
       </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center"><br>
    <div align="center">
      <div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Please Note</font></b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">, 
        that if you use any images in your e-mail the image must be on the Internet and have the full <br>
        URL path to the image including domain name as images are only shown in the e-mail, as long as the full URL <br>
        to the image is correct.</font></div>
</div>
  </div>
</form>
