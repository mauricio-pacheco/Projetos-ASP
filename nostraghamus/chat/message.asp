<%
Dim strColor
Dim strFormat
Dim blnCustomColor

strColor = Request.QueryString("Color")
strFormat = Request.QueryString("Format")

blnCustomColor = False

Select Case strColor

	Case "black"
	Case "FA8508"
	Case "red"
	Case "green"
	Case "blue"
	Case "brown"
	Case "FF00D8"
	Case Else : blnCustomColor = True
End Select

%>

<html>
<head>
<title>Meensagem</title>
<link rel="stylesheet" href="includes/style.css">
<LINK href="default.css" type=text/css rel=STYLESHEET>
<script  language="JavaScript">
<!-- Hide from older browsers...

function onLoad () {
	self.focus();

	document.frmMessage.message.focus()
	document.frmMessage.Submit.disabled=true;

	setTimeout("enableForm()", 600);
}

function enableForm() {
	document.frmMessage.Submit.disabled=false;
}

function onSubmit() {
	document.frmMessage.Submit.disabled=true;
	return true;
}

//Function to add the code to the message for the smileys
function AddSmileyIcon(iconCode) {
 	var txtarea = document.frmMessage.message;

	txtarea.value  += iconCode;
	txtarea.focus();

	parent.toggleEmo('emoticons');
}
// -->
</script>

</head>
<body onLoad="onLoad()" style="margin: 0px;">

<table width="100%" height="100%">
 <tr>
  <td align="left">

<table border="0" cellspacing="2" cellpadding="2">
<form action="postmessage.asp" method="post" name="frmMessage" target="postmessage" onsubmit="onSubmit()">
 <tr>
  <td><b>Mensagem:</b></td>
  <td><input type="text" name="message" size="50" value="" AUTOCOMPLETE="OFF"></td>
  <td><img src="images/icon-smilie.gif" align="absmiddle" onClick="parent.toggleEmo('emoticons')" style="cursor: hand;"></td>
  <td>
  <SELECT name="color">
  <option value="" <% If strColor = "" Then Response.Write("selected") %>>- Cor -</option>
  <option style="color: black;" value="">Preto</option>
  <option style="color: #FA8508;" value="#FA8508" <% If strColor = "#FA8508" Then Response.Write("selected") %>>Laranja</option>
  <option style="color: red;" value="red" <% If strColor = "red" Then Response.Write("selected") %>>Vermelho</option>
  <option style="color: green;" value="green" <% If strColor = "green" Then Response.Write("selected") %>>Verde</option>
  <option style="color: blue;" value="blue" <% If strColor = "blue" Then Response.Write("selected") %>>Azul</option>
  <option style="color: brown;" value="brown" <% If strColor = "brown" Then Response.Write("selected") %>>Marrom</option>
  <option style="color: FF00D8;" value="FF00D8" <% If strColor = "FF00D8" Then Response.Write("selected") %>>Rosa</option>
<% If blnCustomColor AND strColor <> "" Then Response.Write("  <option style=""color: " & strColor & ";"" value=""" & strColor & """ selected>Outra</option>") %>
  </select>
  </td>
  <td>
  <SELECT name="format">
  <option value="" <% If strFormat = "" Then Response.Write("selected") %>>- Formato -</option>
  <option value="">Regular</option>
  <option value="i" <% If strFormat = "i" Then Response.Write("selected") %>>Italico</option>
  <option value="b" <% If strFormat = "b" Then Response.Write("selected") %>>Negrito</option>
  <option value="u" <% If strFormat = "u" Then Response.Write("selected") %>>Sublinhado</option>
  </select>
  </td>
  <td><input type="Submit" name="Submit" value="Enviar"></td>
 </tr>
</form>
</table>

  </td>
 </tr>
</table>

</body>
</html>