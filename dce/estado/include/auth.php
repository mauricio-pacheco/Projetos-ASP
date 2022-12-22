<?php
if(isset($_POST["username"]))   echo "Wrong password<br><br>";
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>PHP i-Stats Login</TITLE>

<link rel="stylesheet" type="text/css" title="Style" href="css/style.css">
</HEAD>

<BODY onLoad="document.loginbox.username.focus();">
<p>&nbsp;</p>
<p>&nbsp;</p>

<form name="loginbox" method="POST" action="<?=$_SERVER["PHP_SELF"]?>">
<table border=0 cellspacing=0 cellpadding=1 bgcolor="#101888" align="center" width="45%">
<tr>
<td align="right" height="25">
   <b><font size="2" color="#FFFFFF">PHP i-Stats Login Box&nbsp;&nbsp;</font></b>
</td></tr>
<tr><td>
   <table cellpadding=3 cellspacing=0 bgcolor="#CECED7" width="100%" style="border-collapse: collapse" bordercolor="#111111">
      <tr>
        <td rowspan="3"><img border="0" src="dott.gif" width="25" height="1"></td>
        <td>
<font face="Arial, Helvetica" size="2" color="#000000" style="font-family: Arial; font-size: 9pt"><b>Username:</b></font>
<br>
        <input type="text" size=40 name="username"><P></td>
      </tr>
      <tr>
        <td><B><font face="Arial, Helvetica" size="2" color="#000000" style="font-family: Arial; font-size: 9pt">Password:</font><font face="Arial, Helvetica" size="2" color="#FFFFFF" style="font-family: Arial;font-size:9pt;color:black;"><br><input type="password" size=40 name="password"></font><br><br>
		<INPUT TYPE="submit" VALUE="Logon">
		<br>&nbsp;
	   </td>
      </tr>
   </table></td></tr></table>
   </form>
</BODY>
</HTML>