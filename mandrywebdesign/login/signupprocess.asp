<%
Option Explicit
Dim sql, rsUser, username, password, passwordconfirm, firstname, surname, email, dob, sex, notfilled(7), badflag, count, passwordLength, calltype, icon, starsign, dobmonth, dobday, sendemail

'Assign form values to variables
username = Request.Form("username")

'Make sure they've not put any quotation marks in their username
If InStr(username,chr(34)) <> 0 or InStr(username,chr(39)) <> 0 then
	errorfunction("invalidchars")
end if

firstname = Request.Form("firstname")
surname = Request.Form("surname")
email = Request.Form("email")
sex = Request.Form("sex")
password = Request.Form("password")
passwordconfirm = Request.Form("passwordconfirm")
dob = Request.Form("birth_day") & "/" & Request.Form("birth_month") & "/" & Request.Form("birth_year")

'Only way to set a variable from a checkbox:
if Request.Form("sendemail") = "on" then sendemail = True else sendemail = False end if

'Check everything's been filled in, badflag determines whether error function is called
badflag = 0

'nofilled() is an array that will store the fields which are not filled in

if firstname = "" then
	notfilled(0) = "First Name"
	badflag = 1
end if
if surname = "" then
	notfilled(1) = "Surname"
	badflag = 1
end if
if email = "" then
	notfilled(2) = "Email"
	badflag = 1
end if
if username = "" then
	notfilled(3) = "Username"
	badflag = 1
end if
if password = "" then
	notfilled(4) = "Password"
	badflag = 1
end if
if sex = "" then
	notfilled(5) = "Sex"
	badflag = 1
end if
if IsDate(dob) = "False" then
	notfilled(6) = "Date of Birth"
	badflag = 1
end if

if badflag = 1 then
	signuperror()
end if

'Check password length is between 5 and 15 characters long
passwordLength = Len(password)
if passwordLength < 5 or passwordLength > 15 then
	errorfunction("length")
end if

'Check password and confirmed password are the same
if password <> passwordconfirm then
	errorfunction("confirm")
end if

'Open connection and insert user details into the database
%>
<!--#include file="conn.asp"-->
<%

'For a bit of profiling fun, get their star sign
getstarsign()

'Then add it to the database. It's in a seperate function because we need to error trap to see if there's been a duplicate entry. It's not good form to have On Error Resume Next throughout your whole page

UserUpdate()

Function UserUpdate()
On Error Resume Next

Set rsUser = Server.CreateObject("ADODB.Recordset")
rsUser.open "users", conn, 3, 3
rsUser.AddNew
rsUser("username") = username
rsUser("password") = password
rsUser("firstname") = firstname
rsUser("surname") = surname
rsUser("email") = email
rsUser("dob") = dob
rsUser("starsign") = starsign
rsUser("sex") = sex
rsUser("sendemail") = sendemail
rsUser.Update

if Err.Number = -2147217887 then
	Err.clear
	errorfunction("badusername")
else
	'Set username cookie to sign them in now
	Response.Cookies("username") = username
%>
<LINK href="default.css" type=text/css rel=STYLESHEET>
<STYLE type="text/css">
<!--
BODY {
scrollbar-face-color:#000000;
scrollbar-highlight-color:#000000;
scrollbar-3dlight-color:#000000;
scrollbar-darkshadow-color:#000000;
scrollbar-shadow-color:#000000;
scrollbar-arrow-color:#000000;
scrollbar-track-color:#000000;
}
-->
</STYLE>

<html>
<head>
<title>Confirma&ccedil;&atilde;o do cadastro!</title>
</head>
<body bgcolor="#292929" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size=2> </font> 
<p align="center">&nbsp;</p>
<p align="center">
  <embed src="../rodo.swf" width="90" height="90"></embed></p>
<p align="center"><font size="2" face="arial,helvetica"><b><font color="#FFFFFF">Obrigado 
  por se cadastrar <%=firstname%>&nbsp;<%=surname%> seu usu&aacute;rio &eacute; 
  </font><font color="#FFFFFF" size="2" face="arial,helvetica"><b><font color="#0099cc"><%=username%></font><b> 
  !</b></b></font></b></font></p>
<font face="arial,helvetica" size=2></font> 
<p>&nbsp; 
</body>
</html>

<%
rsUser.close
set rsUser = nothing
conn.close
set conn = nothing
%>
<%
end if
End Function%>


<%
Function getstarsign()
dobmonth = Request.Form("birth_month")
dobday = Request.Form("birth_day")
Select Case dobmonth
	Case 1
		if dobday < 21 then
			starsign = "Capricorn"
		else
			starsign = "Aquarius"
		end if
	Case 2
		if dobday < 20 then
			starsign = "Aquarius"
		else
			starsign = "Pisces"
		end if
	Case 3
		if dobday < 21 then
			starsign = "Pisces"
		else
			starsign = "Aries"
		end if
	Case 4
		if dobday < 21 then
			starsign = "Aries"
		else
			starsign = "Taurus"
		end if
	Case 5
		if dobday < 22 then
			starsign = "Taurus"
		else
			starsign = "Gemini"
		end if
	Case 6
		if dobday < 22 then
			starsign = "Gemini"
		else
			starsign = "Cancer"
		end if
	Case 7
		if dobday < 24 then
			starsign = "Cancer"
		else
			starsign = "Leo"
		end if
	Case 8
		if dobday < 24 then
			starsign = "Leo"
		else
			starsign = "Virgo"
		end if
	Case 9
		if dobday < 24 then
			starsign = "Virgo"
		else
			starsign = "Libra"
		end if
	Case 10
		if dobday < 24 then
			starsign = "Libra"
		else
			starsign = "Scorpio"
		end if
	Case 11
		if dobday < 23 then
			starsign = "Scorpio"
		else
			starsign = "Sagittarius"
		end if
	Case 12
		if dobday < 22 then
			starsign = "Sagittarius"
		else
			starsign = "Capricorn"
		end if
End Select
End Function
%>

<%Function signuperror()%>
<html>
<head>
<title>Philweb - Free ASP Applications</title>
</head>
<body bgcolor="#FFFFFF" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size=2>

<p><b>You have not filled in the following fields correctly:</b></p>

<%for count = 0 to 7%>
	<%if notfilled(count) <> "" then%>
	<b><%=notfilled(count)%></b><br>
	<%end if%>
<%next%>

<p><a href="javascript:self.history.go(-1)">Please try again</a></p>

</font>
</table>

</body>
</html>
<%Response.end
End Function%>


<%Function errorfunction(calltype)%>
<html>
<head>
<title>Philweb - Free ASP Applications</title>
</head>
<body bgcolor="#FFFFFF" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size=2>

<%if calltype = "confirm" then%>
<p><b>Your password and confirmed password were not the same</b></p>
<p><a href="javascript:self.history.go(-1)">Please try again</a></p>

</font>
</body>
</html>
<%Response.end%>
<%elseif calltype = "length" then%>
<p><b>Your password is not between 5 and 15 characters long</b></p>
<p><a href="javascript:self.history.go(-1)">Please try again</a></p>

</font>
</body>
</html>
<%Response.end%>
<%elseif calltype = "badusername" then%>
<p><b>Sorry, the username &quot;<%=username%>&quot; already exists.</b></p>
<p><a href="javascript:self.history.go(-1)">Please try again</a></p>

</font>
</body>
</html>
<%
rsUser.close
set rsUser = nothing
conn.close
set conn = nothing
Response.end
%>
<%elseif calltype = "invalidchars" then%>
<p><b>Sorry, your username cannot contain any quotation marks.</b></p>
<p><a href="javascript:self.history.go(-1)">Please try again</a></p>

</font>
</body>
</html>
<%Response.end%>
<%end if
End Function%>
