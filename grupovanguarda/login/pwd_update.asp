<%
Option Explicit
Dim sql, rsUser, username, oldpassword, newpassword, newpasswordconfirm, passwordlength, notfilled(4), calltype, icon

username = Request.Cookies("username")

'Assign form values to variables

oldpassword = Request.Form("oldpassword")
newpassword = Request.Form("newpassword")
newpasswordconfirm = Request.Form("newpasswordconfirm")
icon = Request.Form("icon")

'Ensure new password have been filled in
if newpassword = "" then
	errorfunction("nonew")
end if

'Check password length is between 5 and 15 characters long
passwordLength = Len(newpassword)
if passwordLength < 5 or passwordLength > 15 then
	errorfunction("length")
end if

'Check password and confirmed password are the same
if newpassword <> newpasswordconfirm then
	errorfunction("confirm")
end if

'Open connection and insert user details into the database
%>
<!--#include file="conn.asp"-->
<%
Set rsUser = Server.CreateObject("ADODB.Recordset")
rsUser.open "users WHERE username = '" & username & "'", conn, 3, 3

if rsUser("password") <> oldpassword then
	errorfunction("wrongpwd")
else
	rsUser("password") = newpassword
	rsUser.Update
	
	rsUser.close
	set rsUser = nothing
	conn.close
	set conn = nothing
	
	Response.Redirect("changepwd.asp?updated=true&icon=" & icon)
end if
%>

<%Function errorfunction(calltype)%>

<html>
<head>
<title>Grupo Vanguarda</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>


<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#FFFFFF" alink="#FFFFFF">
<div align="center"> 
  <p>&nbsp;</p>
  <p><font color="#0000FF"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">GRUPO</font></strong></font> 
    <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#009900">VANGUARDA</font></strong></font></p>
  <p>&nbsp;</p>
  <p><img src="../logo.JPG" width="102" height="114"></p>
  <p>&nbsp;</p>
  <p><font color="#000000" size=2 face="Verdana, Arial, Helvetica, sans-serif"> 
    <%
if calltype = "nonew" then
	Response.Write("<p>Você deverá entrar com outra senha.</p>")
elseif calltype = "length" then
	Response.Write("<p>Sua senha deverá ter no minimo 5 e no máximo 15 caracteres.</p>")
elseif calltype = "confirm" then
	Response.Write("<p>Sua nova senha não confere com a antiga.</p>")
elseif calltype = "wrongpwd" then
	Response.Write("<p>Você digitou errado sua senha antiga.</p>")
	rsUser.close
	set rsUser = nothing
	conn.close
	set conn = nothing
end if
%>
    </font></p>
</div>
<p align="center"><font color="#000000" size="2" face="arial,helvetica"><a href="javascript:self.history.go(-1)">Tente 
  novamente</a></font></p>
<p align="center">&nbsp;</p>
</body>
</html>
<%Response.end
End Function%>
