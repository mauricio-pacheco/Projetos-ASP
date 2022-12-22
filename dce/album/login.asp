<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_global.inc"-->
<!--#INCLUDE FILE="language/lang_login.inc"-->

<%
Dim redirecturl
redirecturl = Request.Querystring("redirecturl")

strtestun 	 = "<img src=images/spacer.gif width=21 height=15 border=0>"
strtestpw 	 = "<img src=images/spacer.gif width=21 height=15 border=0>"

If     Request("field") = "both" Then
strerrortext = IGlog_both
strtestun 	 = "<img src=images/redcheck.gif width=21 height=15 border=0>"
strtestpw 	 = "<img src=images/redcheck.gif width=21 height=15 border=0>"
ElseIf Request("field") = "name" Then
strerrortext = IGlog_name
strtestun 	 = "<img src=images/redcheck.gif width=21 height=15 border=0>"
strtestpw 	 = "<img src=images/spacer.gif width=21 height=15 border=0>"
ElseIf Request("field") = "password" Then
strerrortext = IGlog_pass
strtestun 	 = "<img src=images/spacer.gif width=21 height=15 border=0>"
strtestpw 	 = "<img src=images/redcheck.gif width=21 height=15 border=0>"
ElseIf Request("field") = "nof" Then
strerrortext = IGlog_nof
strtestun 	 = "<img src=images/redcheck.gif width=21 height=15 border=0>"
strtestpw 	 = "<img src=images/redcheck.gif width=21 height=15 border=0>"
ElseIf Request("field") = "na" Then
strerrortext = IGlog_na
strtestun 	 = "<img src=images/spacer.gif width=21 height=15 border=0>"
strtestpw 	 = "<img src=images/spacer.gif width=21 height=15 border=0>"
End If

un = Request.Cookies("rememberuser")("username")
pw = Request.Cookies("rememberuser")("password")
rm = Request.Cookies("rememberuser")("yesno")
%>

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<link rel="stylesheet" type="text/css" href="style/style.css">

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10" marginwidth="10" marginheight="10">

<table width="760" cellspacing="0" cellpadding="0" border="0">

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/header.asp"--></td>
</tr>

<tr>
<td style="padding-top:7px;" width="200" valign="top">

<!--#INCLUDE FILE="include/menu.asp"-->
<img src="images/spacer.gif" width=200 height=5 border=0 alt=""><br>

</td>

<td width="20" valign="top"><img src="images/spacer-bevel.gif" width=20 height=235 border=0 alt=""></td>
<td style="padding-left:10px;padding-top:15px;" width="530" valign="top">

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGlog_auth %></b><br></font>

<table cellspacing="0" cellpadding="0" border="0">
<form name="login" action="authorize.asp?w=X" method="post">
<input type="hidden" name="redirecturl" value="<%= Request("n") %>">
<% If Request("d") <> "" Then %>
<input type="hidden" name="d" value="<%= rURLSpace(Request("d")) %>">
<% ElseIf Request("folder") <> "" Then %>
<input type="hidden" name="folder" value="<%= Request("folder") %>">
<% End if %>
<input type="hidden" name="image" value="<%= Request("image") %>">
<input type="hidden" name="page" value="<%= Request("page") %>">
<tr>
<td height="14"><font class="textsm" style="color: #C60000;"><b>&nbsp;<%= strerrortext %></b></font></td>
</tr>

<tr>
<td>

<table width="225" cellspacing="0" cellpadding="2" border="0">
<tr>
<td nowrap><font class="text"><%= IGlog_usern %>:&nbsp;</font><br></td>
<td><input type="text" size=25 class="input" name="txtName" value="<%= un %>"></td>
<td><%= strtestun %></td>
</tr>
<tr>
<td nowrap><font class="text"><%= IGlog_passw %>:&nbsp;</font><br></td>
<td><input type=password size=25 class="input" name="txtPassword" value="<%= pw %>"></td>
<td><%= strtestpw %></td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGlog_rem %>:&nbsp;</font><br></td>
<td>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="checkbox" name="rememberme" value="1" <% If rm = "1" Then response.write("checked") %>></td>
<td align="right"><input class="button" style="font-size: 8.5pt;" type="submit" value="<%= IGlog_but1 %>"></td>
</tr>
</table>
</td>
<td><img src="images/spacer.gif" width=21 height=15 border=0></td>
</tr>

</form>
</table>

</td>
</tr>
</table>

</td>
</tr>

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/footer.asp"--></td>
</tr>

</table>

<p>

</body>
</html>
