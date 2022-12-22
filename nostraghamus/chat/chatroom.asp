<% Option Explicit %>
<% Response.Buffer = True %>
<% Response.Expires = -1 %>
<!--#include file="functions/functions_users.asp"-->
<!--#include file="functions/functions_chat.asp"-->
<%
strUsername = Request.QueryString("txtUsername")

Session("Username") = strUsername
Session("lastMessage") = lastMessageID()
Session("Admin") = False
Session("FormatText") = True

If CheckUsername(strUsername) Then Response.Redirect("default.asp?Username=Taken")
%>
<html>
<head>
<title>NOSTRAGHAMUS CHAT - Você está logado Como <% = strUsername %></title>

<link rel="stylesheet" href="includes/style.css">

<script>
<!-- Hide from older browsers...

var blnSoundOff = false;

//toggle the smilies box
function toggleEmo(objDiv)
{
	var objBox = document.getElementById(objDiv);

	if (objBox.style.display == "none")
		objBox.style.display = "";
	else
		objBox.style.display = "none";

}

function logOut() {
	window.location="default.asp";
}
// -->
</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="default.css" type=text/css rel=STYLESHEET>
<body bgcolor="#000000" text="#FFFFFF" style="margin: 0px;">
<br>
<div  id="emoticons"  style="display:none">
 <div>
 <table cellpadding="0" cellspacing="1" border="0" width="235">
  <tr>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon(':huh?');"><img border="0" hspace="10" src="smilies/on_1.gif"></a></td>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon(':s');"><img border="0" hspace="10" src="smilies/on_2.gif"></a></td>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon(':P');"><img border="0" hspace="10" src="smilies/on_3.gif"></a></td>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon('}:)');"><img border="0" hspace="10" src="smilies/on_4.gif"></a></td>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon(':D');"><img border="0" hspace="10" src="smilies/on_5.gif"></a></td>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon('}:|');"><img border="0" hspace="10" src="smilies/on_6.gif"></a></td>
  </tr>
  <tr>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon(':)');"><img border="0" hspace="10" src="smilies/on_7.gif"></a></td>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon(':oops');"><img border="0" hspace="10" src="smilies/on_8.gif"></a></td>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon(';)');"><img border="0" hspace="10" src="smilies/on_9.gif"></a></td>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon(':pff');"><img border="0" hspace="10" src="smilies/on_10.gif"></a></td>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon(':/');"><img border="0" hspace="10" src="smilies/on_11.gif"></a></td>
   <td align="center" height="20" width="20"><a href="Javascript:postmessage.AddSmileyIcon(':0');"><img border="0" hspace="10" src="smilies/on_12.gif"></a></td>
  </tr>
 </table>
 </div>
</div>



<table width="700" height="460" cellpadding="5" cellspacing="0" align="center" style="border: 0px solid #393939;">
 <tr>
    <td bgcolor="#000000" rowspan="4">&nbsp;</td>
    <td bgcolor="#000000" width="70%" class="chatBorderText"><font color="#FFFFFF">NOSTRAGHAMUS 
      CHAT (Digite <i>/comandos</i > na caixa de mensagem para comandos)</font></td>
    <td bgcolor="#000000" rowspan="3" width="1"></td>
    <td bgcolor="#000000" width="150" class="chatBorderText"><font color="#FFFFFF">Usuários 
      Online</font></td>
    <td bgcolor="#000000" rowspan="4">&nbsp;</td>
 </tr>
 <tr>
  <td bgcolor="#FFFFFF" height="350" style="padding: 0px; border: 1px solid #1B467D"><iframe src="chat.asp" width="100%" height="100%" id="chatframe" frameborder="0" SCROLLING="no" border="0" class="iframe"></iframe></td>
  <td bgcolor="#FFFFFF" height="350" style="padding: 0px; border: 1px solid #1B467D"><iframe src="users.asp" width="100%" height="350" id="users" frameborder="0" SCROLLING="no" border="0" class="iframe"></iframe></td>
 </tr>
 <tr>
    <td bgcolor="#000000" height="9"></td>
    <td bgcolor="#000000" height="9"></td>
 </tr>
 <tr>
  <td bgcolor="#FFFFFF" colspan="3" height="45" style="padding: 0px; border: 1px solid #1B467D"><iframe src="message.asp"name="postmessage" id="postmessage" width="100%" height="100%" frameborder="0" SCROLLING="no" border="0" class="iframe"></iframe></td>
 </tr>
  <tr bgcolor="#000000"> 
    <td colspan="5" align="right"> 
      <table cellpadding="0" cellspacing="0" width="100%">
   <tr>
          <td align="left" class="copyright"><font color="#FFFFFF">Beberight © 
            1990-2005 NOSTRAGHAMUS Cerveja &amp; Mulher. Todos os Direitos reservados.</font></td>
    <td><input type='checkbox' name='turnoffsound' value='True' checked onClick='chatframe.SoundOption()'>
            <font color="#FFFFFF"> Som Ativo</font></td>
          <td align="right" class="LogOut"><a href="javascript:logOut()" title="Logout"><font color="#00FF00">SAIR</font></a></td>
   </tr>
  </table>
  </td>
 </tr>
</Table>

</body>
</html>