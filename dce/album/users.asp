<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/security-admin.inc"-->
<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_global.inc"-->
<!--#INCLUDE FILE="language/lang_users.inc"-->

<%
Set UserConn = Server.CreateObject ("ADODB.Connection")
UserConn.Open strConnect
%>

<% 
DataTable   = "Users"

Dim pagesize
Dim currentpage
Dim appRS
Dim appSQL
Dim pagecount
pagesize = 20

If Request("Page")="" Then
currentpage = 1
Else
currentpage = CInt(Request("Page"))
End If
%>

<% 
Function isEmail (cEmail)
Dim iAtCount, iPerCount, iLenCount, cTemp, i
iAtCount = 0
iPerCount = 0
isEmail = False
iLenCount = len(cEmail)
For i = 1 To iLenCount
cTemp = mid(cEmail, i, 1)
If cTemp = "@" Then
iAtCount = iAtCount + 1
elseif cTemp = "." Then
iPerCount = iPerCount + 1
End If
Next
If iAtCount = 1 And iPerCount > 0 Then
isEmail = True
End If
If isEmail = True then
isEmail = eAlphanum(cEmail)
end if
End Function

Function eAlphanum(cValue)
eAlphanum = True
Dim val
Dim index
Dim strLength
strLength = len(cValue)
For index = 1 to strLength
val = Asc(mid(cValue, index, 1))
If ( val > 47 AND val < 58 ) OR ( val > 64 AND val < 91 ) OR ( val > 96 AND val < 123 ) OR ( val = 45 ) OR ( val = 95 ) OR ( val = 64 ) OR ( val = 46 ) then
else
eAlphanum = False
end if
Next
End Function
%>

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<link rel="stylesheet" type="text/css" href="style/style.css">

<script language="JavaScript">
<!--
function VerifyDelete(URL) {
var verify = confirm("<%= IGusr_warn %>");
if (verify == true) {
window.open(URL,"_self");
}}
//-->
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

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

<table width="100%" cellspacing="0" cellpadding="0"><tr>
<td>

<% If Request.QueryString("mode") = "add" Then %>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGusr_add %></b></font>
<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<font class="text">

<%= IGusr_addmsg %>

<p>

</font>

<table class="shadow1" align="center" bgcolor="#CBCBCB" cellspacing="0" cellpadding="1" border="0"><tr>
<td>
<table width="100%" cellspacing="0" cellpadding="0" border="0"><tr>
<td bgcolor="#F7F7F7">
<table width="100%" cellspacing="0" cellpadding="5" border="0"><tr>
<td bgcolor="#F7F7F7">

<table cellspacing="2" cellpadding="2" border="0">
<form action="users.asp?mode=add1&mi=2" method="post">
<tr>
<td><font class="text"><%= IGusr_form1 %>:&nbsp;</td>
<td><input class="input" size="30" maxlength="25" name="firstname" value=""></td>
</tr>
<tr>
<td><font class="text"><%= IGusr_form2 %>:&nbsp;</td>
<td><input class="input" size="30" maxlength="25" name="lastname" value=""></td>
</tr>
<tr>
<td><font class="text"><%= IGusr_form3 %>:</td>
<td><input class="input" size="30" maxlength="250" name="emailaddress" value=""></td>
</tr>
<tr>
<td><font class="text"><%= IGusr_form4 %>:</td>
<td><input class="input" size="30" maxlength="25" name="username" value=""></td>
</tr>
<tr>
<td><font class="text"><%= IGusr_form5 %>:</td>
<td><input class="input" size="30" type="password" maxlength="25" name="password" value=""></td>
</tr>
<tr>
<td><font class="text"><%= IGusr_form6a %>:</td>
<td>
<select name="userlevel" class="selectbox">
<option value="None" selected><%= IGusr_form6b %></option>
<option value="98"><%= IGusr_form6c %></option>
<option value="99"><%= IGusr_form6d %></option>
</select>
</td>
</tr>

<tr>
<td colspan="2">
<hr size="1">
</td>
</tr>

<tr>
<td colspan="2" align="center"><input class="button" style="font-size: 8.5pt;" type="submit" value="<%= IGusr_but1 %>"></td>
</tr></form>
</table>

</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>

<% ElseIf Request.QueryString("mode") = "add1" Then %>

<% 
required 		= "0"
strerrormessage = ""
stralert 		= "<img src=""images/sm-alert.gif"" width=14 height=14 border=0>"

If Request.Form("firstname") = "" Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err1&"</font></td></tr>"
required = required + 1
End If

If Request.Form("lastname") = "" Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err2&"</font></td></tr>"
required = required + 1
End If

If NOT isEmail(Request.Form("emailaddress")) Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err3&"</font></td></tr>"
required = required + 1
End If

If Request.Form("username") = "" Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err4&"</font></td></tr>"
required = required + 1
End If

If Request.Form("password") = "" Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err5&"</font></td></tr>"
required = required + 1
End If

If Request.Form("userlevel") = "None" Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err6&"</font></td></tr>"
required = required + 1
End If

If Required <> "0" then
%>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGusr_err %></b></font>
<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<font class="text">

<%= IGusr_errmsg %>

<p>

</font>

<table class="shadow1" align="center" width="344" bgcolor="#CBCBCB" cellspacing="0" cellpadding="1" border="0"><tr>
<td>
<table width="100%" cellspacing="0" cellpadding="0" border="0"><tr>
<td bgcolor="#F7F7F7">
<table width="100%" cellspacing="0" cellpadding="5" border="0"><tr>
<td bgcolor="#F7F7F7">
<font class="textmed">
<%= IGusr_folw %>
<br><img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="30"><img src="images/spacer.gif" width=30 height=5 border=0 alt=""></td>
<td>
<table cellspacing="1" cellpadding="2" border="0">
<font class="text">
<%= strerrormessage %>
</font>
</table>
</td>
</tr>
</table>
<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
<div align="center"><a class="link" href="javascript:history.go(-1)"><%= IGusr_click %></a></div>
<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
</font>
</td></tr>
</table>
</td></tr>
</table>
</td></tr>
</table>

<% Else %>

<% 
strdateadded 		= Date()
strusername 		= Encode(Replace(Request.Form("username"),"'","''"))
strpassword 		= Encode(Replace(Request.Form("password"),"'","''"))
struserlevel 		= Replace(Request.Form("userlevel"),"'","''")
strfirstname 		= Replace(Request.Form("firstname"),"'","''")
strlastname 		= Replace(Request.Form("lastname"),"'","''")
stremail		 	= Replace(Request.Form("emailaddress"),"'","''")

Sql = "INSERT INTO " & DataTable & " (dateadded,username,password,userlevel,firstname,lastname,email)" 
Sql = Sql & " VALUES ("
Sql = Sql & "'" & strdateadded & "',"
Sql = Sql & "'" & strusername & "',"
Sql = Sql & "'" & strpassword & "',"
Sql = Sql & "'" & struserlevel & "',"
Sql = Sql & "'" & strfirstname & "',"
Sql = Sql & "'" & strlastname & "',"
Sql = Sql & "'" & stremail
Sql = Sql & "');"

UserConn.Execute(Sql)

%>

<SCRIPT LANGUAGE="JavaScript">
<!--
function redirect() {
window.location.href="users.asp"
}
setTimeout('redirect()',5000)
// -->
</script>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGusr_addsuc %></b></font>
<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<font class="textmed">
<%= IGusr_addsucmsg %>
</font>

<% End If %>

<% ElseIf Request.Querystring("mode") = "edit" Then %>

<% 
strid = Request.QueryString("uid")
SQL = "SELECT *"
SQL = SQL & " FROM " & DataTable
SQL = SQL & " WHERE memberid=" & strid & ""
Set uRS = UserConn.Execute(SQL)
uusername 	= Decode(uRS("username"))
upassword 	= Decode(uRS("password"))
uuserlevel 	= uRS("userlevel")
ufirstname 	= uRS("firstname")
ulastname 	= uRS("lastname") 
uemail 		= uRS("email")
%>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGusr_upd %></b></font>
<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<font class="text">

<%= IGusr_updmsg %>

<p>

</font>

<table class="shadow1" align="center" bgcolor="#CBCBCB" cellspacing="0" cellpadding="1" border="0"><tr>
<td>
<table width="100%" cellspacing="0" cellpadding="0" border="0"><tr>
<td bgcolor="#F7F7F7">
<table width="100%" cellspacing="0" cellpadding="5" border="0"><tr>
<td bgcolor="#F7F7F7">

<table cellspacing="2" cellpadding="2" border="0">
<form action="users.asp?mode=edit1&mi=2" method="post">
<input type="hidden" name="ID" value="<%= uRS("memberid") %>">
<tr>
<td><font class="text"><%= IGusr_form1 %>:&nbsp;</td>
<td><input class="input" size="30" maxlength="25" name="firstname" value="<%= ufirstname %>"></td>
</tr>
<tr>
<td><font class="text"><%= IGusr_form2 %>:&nbsp;</td>
<td><input class="input" size="30" maxlength="25" name="lastname" value="<%= ulastname %>"></td>
</tr>
<tr>
<td><font class="text"><%= IGusr_form3 %>:</td>
<td><input class="input" size="30" maxlength="250" name="emailaddress" value="<%= uemail %>"></td>
</tr>
<tr>
<td><font class="text"><%= IGusr_form4 %>:</td>
<td><input class="input" size="30" maxlength="25" name="username" value="<%= uusername %>"></td>
</tr>
<tr>
<td><font class="text"><%= IGusr_form5 %>:</td>
<td><input class="input" size="30" type="password" maxlength="25" name="password" value="<%= upassword %>"></td>
</tr>
<tr>
<td><font class="text"><%= IGusr_form6a %>:</td>
<td>
<%
If uuserlevel = "98" Then userleveltext  = IGusr_form6c
If uuserlevel = "99" Then userleveltext  = IGusr_form6d
%>
<select name="userlevel" class="selectbox">
<option value="<%= uuserlevel %>" selected><%= userleveltext %></option>
<option value="None">- - - - - - - - - - - - - - - - - -</option>
<option value="98"><%= IGusr_form6c %></option>
<option value="99"><%= IGusr_form6d %></option>
</select>
</td>
</tr>

<tr>
<td colspan="2">
<hr size="1">
</td>
</tr>

<tr>
<td colspan="2" align="center"><input class="button" style="font-size: 8.5pt;" type="submit" value="<%= IGusr_but2 %>"></td>
</tr></form>
</table>

</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>

<% ElseIf Request.QueryString("mode") = "edit1" Then %>

<% 
required 		= "0"
strerrormessage = ""
stralert 		= "<img src=""images/sm-alert.gif"" width=14 height=14 border=0>"

If Request.Form("firstname") = "" Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err1&"</font></td></tr>"
required = required + 1
End If

If Request.Form("lastname") = "" Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err2&"</font></td></tr>"
required = required + 1
End If

If NOT isEmail(Request.Form("emailaddress")) Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err3&"</font></td></tr>"
required = required + 1
End If

If Request.Form("username") = "" Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err4&"</font></td></tr>"
required = required + 1
End If

If Request.Form("password") = "" Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err5&"</font></td></tr>"
required = required + 1
End If

If Request.Form("userlevel") = "None" Then
strerrormessage = strerrormessage & "<tr><td valign=""top"">"&stralert&"</td><td><font class=""textsm"">"&IGusr_err6&"</font></td></tr>"
required = required + 1
End If

If Required <> "0" then
%>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGusr_err %></b></font>
<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<font class="text">

<%= IGusr_errmsg %>

<p>

</font>

<table class="shadow1" align="center" width="344" bgcolor="#CBCBCB" cellspacing="0" cellpadding="1" border="0"><tr>
<td>
<table width="100%" cellspacing="0" cellpadding="0" border="0"><tr>
<td bgcolor="#F7F7F7">
<table width="100%" cellspacing="0" cellpadding="5" border="0"><tr>
<td bgcolor="#F7F7F7">
<font class="textmed">
<%= IGusr_folw %>
<br><img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="30"><img src="images/spacer.gif" width=30 height=5 border=0 alt=""></td>
<td>
<table cellspacing="1" cellpadding="2" border="0">
<font class="text">
<%= strerrormessage %>
</font>
</table>
</td>
</tr>
</table>
<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
<div align="center"><a class="link" href="javascript:history.go(-1)"><%= IGusr_click %></a></div>
<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
</font>
</td></tr>
</table>
</td></tr>
</table>
</td></tr>
</table>

<% Else %>

<% 
strid				= Request.Form("ID")
strdateadded 		= Date()
strusername 		= Encode(Replace(Request.Form("username"),"'","''"))
strpassword 		= Encode(Replace(Request.Form("password"),"'","''"))
struserlevel 		= Replace(Request.Form("userlevel"),"'","''")
stremail		 	= Replace(Request.Form("emailaddress"),"'","''")
strfirstname 		= Replace(Request.Form("firstname"),"'","''")
strlastname 		= Replace(Request.Form("lastname"),"'","''")

SQL = "UPDATE " & DataTable & " SET "
SQL = SQL & "dateadded		 ='" & strdateadded & "',"
SQL = SQL & "username		 ='" & strusername & "',"
SQL = SQL & "password	 	 ='" & strpassword & "',"
SQL = SQL & "userlevel		 ='" & struserlevel & "',"
SQL = SQL & "firstname		 ='" & strfirstname & "',"
SQL = SQL & "lastname		 ='" & strlastname & "',"
SQL = SQL & "email			 ='" & stremail & "'"
SQL = SQL & " WHERE memberid ="  & strid & ";"
UserConn.Execute(SQL)
%>

<SCRIPT LANGUAGE="JavaScript">
<!--
function redirect() {
window.location.href="users.asp"
}
setTimeout('redirect()',5000)
// -->
</script>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGusr_updsuc %></b></font>
<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<font class="text">
<%= IGusr_updsucmsg %><br>
</font>

<% End If %>

<% ElseIf Request.Querystring("mode") = "delete" Then %>

<% 
strid = Request.QueryString("uid")
Sql = "DELETE * FROM " & DataTable
Sql = Sql & " WHERE memberid=" & strid & ";"
UserConn.Execute(SQL)
%>

<SCRIPT LANGUAGE="JavaScript">
<!--
function redirect() {
window.location.href="users.asp"
}
setTimeout('redirect()',5000)
// -->
</script>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGusr_del %></b></font>
<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<font class="text">
<%= IGusr_delmsg %><br>
</font>

<% Else %>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGusr_mng %></b></font>
<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<font class="text">

<%= IGusr_mngmsg %>

<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

</font>

<table width="510" bgcolor="gray" cellpadding=0 cellspacing=0 border=0><tr>
<td>
<table width="100%" cellpadding=1 cellspacing=1 border=0>


<tr bgcolor="#C4CFDE">
<td width="16" height="20" nowrap><font class="textsm">&nbsp;</td>
<td width="19" nowrap><font class="textsm">&nbsp;</td>
<td width="195" style="padding-left: 5px;" nowrap><font class="textsm"><%= IGusr_mngg1 %>:</td>
<td width="195" style="padding-left: 5px;" nowrap><font class="textsm"><%= IGusr_mngg2 %>:</td>
<td width="75" style="padding-left: 5px;" nowrap><font class="textsm"><%= IGusr_mngg3 %>:</td>
</tr>

<% 
Set uRS = Server.CreateObject("ADODB.RecordSet")

SQL = "SELECT * "
SQL = SQL & " FROM " & DataTable
SQL = SQL & " ORDER BY lastname ASC;"

uRS.CursorLocation = adUseClient
uRS.PageSize = pagesize
uRS.Open SQL, UserConn, adOpenStatic, adLockReadOnly, adCmdText

If uRS.EOF And uRS.BOF Then
%>

<% Else  %>

<%
pagecount = uRS.PageCount
If 1 > currentpage Then currentpage = 1
If currentpage > pagecount Then currentpage = pagecount
uRS.AbsolutePage = currentpage

iCount = 0

Do While uRS.AbsolutePage = currentpage AND Not uRS.EOF

ufirstname 	= uRS("firstname")
ulastname 	= uRS("lastname") 
uemail 		= uRS("email")
udateadded 	= uRS("dateadded")
%>

<% If Eval(iCount\2 = iCount/2) Then %>

<tr bgcolor="#ffffff" style="cursor:default;" onMouseOver="this.bgColor='#DDE3EB'" onMouseOut="this.bgColor='#FFFFFF'">
<td width="16"><a href="users.asp?mode=edit&uid=<%= uRS("memberid") %>"><img src="images/sm-pencil.gif" width=16 height=20 border=0 alt="<%= IGusr_mngg4 %>"></a></td>
<td width="19"><a href="javascript: VerifyDelete('users.asp?mode=delete&uid=<%= uRS("memberid") %>');"><img src="images/sm-delete.gif" width=20 height=20 border=0 alt="<%= IGusr_mngg5 %>"></a></td>
<td width="195" style="padding-left: 3px;" nowrap><font class="textsm"><%= uRS("lastname") %>,&nbsp;<%= uRS("firstname") %></td>
<td width="195" style="padding-left: 3px;" nowrap><font class="textsm"><%= uRS("email") %></td>
<td width="75" style="padding-left: 3px;" nowrap><font class="textsm"><%= uRS("dateadded") %></td>
</tr>

<% Else %>

<tr bgcolor="#F9F9F9" style="cursor:default;" onMouseOver="this.bgColor='#DDE3EB'" onMouseOut="this.bgColor='#F9F9F9'">
<td width="16"><a href="users.asp?mode=edit&uid=<%= uRS("memberid") %>"><img src="images/sm-pencil.gif" width=16 height=20 border=0 alt="<%= IGusr_mngg4 %>"></a></td>
<td width="19"><a href="javascript: VerifyDelete('users.asp?mode=delete&uid=<%= uRS("memberid") %>');"><img src="images/sm-delete.gif" width=20 height=20 border=0 alt="<%= IGusr_mngg5 %>"></a></td>
<td width="195" style="padding-left: 3px;" nowrap><font class="textsm"><%= uRS("lastname") %>,&nbsp;<%= uRS("firstname") %></td>
<td width="195" style="padding-left: 3px;" nowrap><font class="textsm"><%= uRS("email") %></td>
<td width="75" style="padding-left: 3px;" nowrap><font class="textsm"><%= uRS("dateadded") %></td>
</tr>

<%
iCount = iCount +1 
End If
%>

<%
uRS.MoveNext
Loop
End If
%>
</table>

</td></tr>
</table>

<img src="images/spacer.gif" width=5 height=8 border=0 alt=""><br>

<!--#INCLUDE FILE="include/paging-gen.asp"-->

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>
<% If PageCount > 1 Then %>
<font class="paging">[<%= PageSize %>]&nbsp;<%= IGusr_page %>&nbsp;[<%= CurrentPage %> of <%= PageCount %>]</font><br>
<% End If %>
</td>
<td align="right">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<%= pgHTML %>
</tr>
</table>
</td>
</tr>
</table>

<% End If %>

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

<script language="JavaScript" type="text/javascript">
<!-- 
var Today = new Date;
var mm1 = Today.getMonth() + 1;
if (mm1<10){mm1="0"+ mm1;}
var dd1 = Today.getDate();
if (dd1<10){dd1="0"+dd1;}
var yy1= Today.getFullYear();
if((yy1 >= 0) &&  (yy1 < 50)) {yy1=yy1+2000;}
if ((yy1 >= 50) && (yy1<100)){yy1=yy1+1900;}
var hh1= Today.getHours()	
var min1= Today.getMinutes()
var min2 = min1 + 10;
if (min1<10){min1="0"+ min1;}	
var chkDATE1=mm1+ "/" + dd1+ "/" + yy1 + " " + hh1 + ":" + min1;	
if(min2 >= 60) {
hh1=hh1+1;
min2=min2-60;}
if (min2<10){min2="0"+ min2;}		
var chkDATE2=mm1+ "/" + dd1+ "/" + yy1 + " " + hh1 + ":" + min2;			
var AlertMessage = "<%= IG_timeout %>";
var TimeOutMinutes = 1;	
function AlertUser()
{
switch(TimeOutMinutes)
{
case 1:
break;
case 2:
alert(AlertMessage);
break;
default:
break;								
}
TimeOutMinutes++;
setTimeout('AlertUser()', <%= OutMinusTwo %>);
}
AlertUser();
// -->
</script>

</body>
</html>