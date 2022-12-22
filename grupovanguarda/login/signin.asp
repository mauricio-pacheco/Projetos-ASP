<%
Option Explicit
Dim sql,rsUser,username,password,page,stayloggedin,LConnectString,lconn,sqlflag,sql2,rsUser2

'Grab the submitted variables (page is the page they've come from, set by the hidden variable at the login box)
username = Request.Form("username")
password = Request.Form("password")
page = Request.Form("page")
stayloggedin = Request.Form("stayloggedin")

if page = "" then
	page = "index.asp"
end if

'Check no s**t is trying to hack in using SQL commands
if InStr(username, "'") or InStr(username, """") or InStr(username, "=") or InStr(password, "'") or InStr(password, """") or InStr(password, "=") then
	sqlflag = True
end if

'Open connection
%>
<!--#include file="conn.asp"-->
<%

'Get a recordset corresponding to the submitted username and password
sql = "SELECT username FROM users WHERE username = '" & username & "' AND password = '" & password & "'"
Set rsUser = Server.CreateObject("ADODB.Recordset")
rsUser.Open sql, conn, 3, 3

'If there was a valid recordset there, then send them back to the page they came from, with the username cookie set
If (not rsUser.BOF) and (not rsUser.EOF) and sqlflag <> True then

'update no campo stats
sql2 = "update users set stats = 1 where username = '"& username &"'"
Set rsUser2 = Server.CreateObject("ADODB.Recordset")
rsUser2.Open sql2, conn, 3, 3
'fim update

  Response.Cookies("username") = rsUser("username")
  'If the user wants to stay logged in all the time, then we'll set the cookie with a far-away expiry date
  if stayloggedin = "yes" then
	Response.Cookies("username").expires = #1/1/2010#
  end if
  rsUser.close
  set rsUser = nothing
  conn.close
  set conn = nothing
  Response.Redirect(page)
end if

'Otherwise, display an invalid entry screen
rsUser.close
set rsUser = nothing
conn.close
set conn = nothing%>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>
<html>
<head>
<title>Grupo Vanguarda</title>
</head>
<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<h3 align="center">&nbsp;</h3>
<h3 align="center"><font color="#0000FF"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">GRUPO</font></strong></font> 
  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#009900">VANGUARDA</font></strong></font></h3>
<p align="center">&nbsp;</p>
<h3 align="center"><img src="../logo.JPG" width="102" height="114"></h3>
<p align="center">&nbsp;</p>
<h3 align="center"><font color="#000000" size="2" face="arial,helvetica">Usu&aacute;rio/Senha 
  inv&aacute;lidos</font></h3>
<p align="center"><font color="#000000" size="2" face="arial,helvetica"><a href="javascript:self.history.go(-1)"><b>Tente 
  novamente</b></a></font></p>
<p align="center">&nbsp;</p>
</body>
</html>
