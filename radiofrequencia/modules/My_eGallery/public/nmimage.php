<html>
<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<div align="center">

<?php
if ($z != "" && $width != "" && $height != "") {
	print "<img src=\"$z\" width=\"$width\" height=\"$height\">";
} elseif ($z != "") {
	print "<img src=\"$z\">";
} else {
	print "";
}
?>
<SCRIPT Language="Javascript">
function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
</script>

<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Netscape");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input type=button value="Print this Page" name="Print" onClick="printit()"></form>');        
}
</script>

</div>
</body>
</html>