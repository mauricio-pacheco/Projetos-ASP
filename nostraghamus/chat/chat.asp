<html>
<head>

<script language="JavaScript" src="includes/control.js"></script>

<script>
<!-- Hide from older browsers...

function callServer() {
	// use the dom2 to find 'loadScript' in the head tag
	var head = document.getElementsByTagName('head').item(0);
	var scriptTag = document.getElementById('loadScript');

	// if 'loadScript' already exists - remove it
	if (scriptTag) head.removeChild(scriptTag);

	// create a new element by the name of script
	script = document.createElement('script');

	// set the new scripts properties
	script.src = 'getmessages.asp';
	script.type = 'text/javascript';
	script.id = 'loadScript';

	// move the element script into the head
	head.appendChild(script);
}

setInterval(callServer, 1200);

var blnSoundOff = false;

function SoundOption() {
	if (blnSoundOff == false)
		blnSoundOff = true;
	else
		blnSoundOff = false;
}

function NewMSGSound() {
	if (blnSoundOff == false)
		snd.play();
}

function toBottom(scrollValue) {
	document.getElementById("chatBox").scrollTop=document.getElementById("chatBox").scrollHeight;
}

function insertText(strText) {
 	var txtarea = parent.frames["postmessage"].document.frmMessage.message;

	txtarea.value = strText;
	txtarea.focus();
}
// -->
</script>

<title>Chat</title>
<link rel="stylesheet" href="includes/style.css">
</head>

<body bgcolor="#FFFFFF" leftmargin=5 topmargin=5>

<NOSCRIPT>
<H3>Este Chat Usa Java Script</H3>
Você precisa habilitar JavaScript no seu Browser!<br> Este chatroom não trabalhará sem Javascript!
<ul>
<li>Use por favor o Netscape Navigator 3+ ou o Internet Explorer 3+
<li>Certifique-se de que o Javascript está permitido em seu browser.
</ul>
</NOSCRIPT>

<script language="JavaScript">
// Create preloaded sound
snd = new QSound(null, "snd", "sounds/chat-inbound.wav");
</script>

<p id="chatBox"></p>

</body>
</html>