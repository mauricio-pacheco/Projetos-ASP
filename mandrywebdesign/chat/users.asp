<% Option Explicit %>
<% Response.Buffer = True %>
<% Response.Expires = -1 %>
<% Response.CacheControl = "Public" %>
<html>
<head>

<script>

function insertText(strText) {
 	var txtarea = parent.frames["postmessage"].document.frmMessage.message;

	txtarea.value = strText;
	txtarea.focus();
}

function callServer() {

	// use the dom2 to find 'loadScript' in the head tag
	var head = document.getElementsByTagName('head').item(0);
	var scriptTag = document.getElementById('loadScript');

	// if 'loadScript' already exists - remove it
	if (scriptTag) head.removeChild(scriptTag);

	// create a new element by the name of script
	script = document.createElement('script');

	//alert(CTime);

	// set the new scripts properties
	script.src = 'getusers.asp';
	script.type = 'text/javascript';
	script.id = 'loadScript';

	// move the element script into the head
	head.appendChild(script);
}

setInterval(callServer, 5000);

function toBottom(scrollValue)
{
	document.getElementById("usersBox").scrollTop=document.getElementById("usersBox").scrollHeight;
}

</script>

<title>Chat</title>
<link rel="stylesheet" href="includes/style.css">
</head>

<body bgcolor="#FFFFFF" leftmargin=5 topmargin=5 onLoad="callServer()">

<p id="usersBox" style="height: 295px;"></p>
<center>
<span class="smtext"><b>Negrito</b> = Administrador</span><br>
<span class="smtext"><i>Italico</i> = Usuário inativo</span>
</center>

</body>
</html>