<%@ LANGUAGE="VBSCRIPT" %>
<%Response.Buffer=TRUE%>
<!--#include file='dbconnection.inc'--> 
<!--#include file="md5.asp"-->
<!--#include file='header.inc'--> 
<script language="javascript">

function TheFormCheck() {
if (document.Login.txtUserName.value=="") {
alert("UserName is blank.  Please re-enter.");
document.Login.txtUserName.focus();
return false;
}
}
</script>
<%
Function RandomPW(myLength)
	Const minLength = 6
	Const maxLength = 20
	
	Dim X, Y, strPW
	
	If myLength = 0 Then
		Randomize
		myLength = Int((maxLength * Rnd) + minLength)
	End If
	For X = 1 To myLength
		Y = Int((3 * Rnd) + 1) '(1) Numeric, (2) Uppercase, (3) Lowercase
		Select Case Y
			Case 1
				Randomize
				strPW = strPW & CHR(Int((9 * Rnd) + 48))
			Case 2
				Randomize
				strPW = strPW & CHR(Int((25 * Rnd) + 65))
			Case 3
				Randomize
				strPW = strPW & CHR(Int((25 * Rnd) + 97))
		End Select
	Next
	RandomPW = strPW
End Function
%>
<%
If Request.querystring("mode") = "enter" then
%>
	<b><center>Get Lost Password</center></b>
	<form name='Login' method='post' action='password.asp?mode=get' onSubmit='return TheFormCheck()'>
	<table width='273' border='0' align='center' cellspacing='0' cellpadding='0' bgcolor='#CCCCCC' style="BORDER-BOTTOM: #000000 1px solid; border-top:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000">
	<tr><td align='right' height='47' valign='bottom' width='94'>User name: </td>
	<td height='47' valign='bottom' width='172'><input type='text' name='txtUserName'>
	</td></tr><tr><td align='right' height='44' width='94'>&nbsp;</td>
	<td height='44 width='172'><input type='image' src='images/forward.gif' name='Submit' value='Enter' alt='Enter'>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	<input type='image' src='images/cancel.gif' name='Reset' value='Reset' alt='Reset'>
	</td></tr>
	</table></form>
<%
End If

If Request.querystring("mode") = "get" then
	Dim strUserName, rsGetPassword, strSQL, strSQLAdminEmail, rsGetEmail, strEmail, strPassword
	strUserName = REplace(Request.Form("txtUserName"), "'", "''")
	Set rsGetPassword = Server.CreateObject("ADODB.Recordset")
	strSQL = "SELECT [username], [password], [email] from tblUsers where username = '" & strUserName & "'"
	Set rsGetEmail = Server.CreateObject("ADODB.Recordset")
	strSQLAdminEmail = "SELECT [siteemail], [emailserver] from tblSettings"
	rsGetPassword.Open strSQL, adoCon
	rsGetEmail.Open strSQLAdminEmail, adoCon

	If rsGetPassword.EOF then
		Response.Redirect"password.asp?mode=nouser"
	End If

	strEmail = rsGetPassword("email")
	strPassword = RandomPW(0)
	htmlBody = "You are receiving this email because you have (or someone pretending to be you has) requested a new password be sent for your account. If you did not request this email then please ignore it, if you keep receiving it please contact the administrator.<br><br>"
	htmlBody = htmlBody & "Your Password is: " & strPassword
	htmlBody = htmlBody & "<br><br>You can of course change this password yourself via the profile page. If you have any difficulties please contact the administrator.<br><br>Thanks"
	Dim objCDOSYSCon
	Set objCDOSYSMail = Server.CreateObject("CDO.Message")
	Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration")
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = rsGetEmail("emailserver") 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport")  = 25 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
	objCDOSYSCon.Fields.Update 
	Set objCDOSYSMail.Configuration = objCDOSYSCon
	objCDOSYSMail.From = rsGetEmail("siteemail")
	objCDOSYSMail.To = rsGetPassword("email")
	objCDOSYSMail.Subject = "Lost Password" 
	objCDOSYSMail.HTMLBody = htmlBody
	objCDOSYSMail.Send 
	Set objCDOSYSMail = Nothing
	Set objCDOSYSCon = Nothing

	strEPassword = md5(strPassword)
	strUpdateSQL = "UPDATE tblUsers SET tblUsers.password='" & strEPassword & "' WHERE username ='" & strUserName & "'"
	adoCon.execute (strUpdateSQL)

	Set rsGetPassword = Nothing
	Set rsGetEmail = Nothing
	Set adoCon = Nothing
	Response.Redirect"password.asp?mode=email"
End If


If Request.querystring("mode") = "nouser" then
%>
	<b><center><font color=red>User doesn't exist</font></center></b>
	<form name='Login' method='post' action='password.asp?mode=get'>
	<table width='273' border='0' align='center' cellspacing='0' cellpadding='0' bgcolor='#CCCCCC' style="BORDER-BOTTOM: #000000 1px solid; border-top:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000">
	<tr><td align='right' height='47' valign='bottom' width='94'>User name: </td>
	<td height='47' valign='bottom' width='172'><input type='text' name='txtUserName'>
	</td></tr><tr>
	<td align='right' height='44' width='94'>&nbsp;</td>
	<td height='44 width='172'>
	<input type='image' src='images/forward.gif' name='Submit' value='Enter' alt='Enter'>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	<input type='image' src='images/cancel.gif' name='Reset' value='Reset' alt='Reset'>
	</td></tr>
	</table></form>
<%
End If

If Request.querystring("mode") = "email" then
%>
	<center>Your password was sent to the email in your profile.</center>
	<form name='Login' method='post' action='default.asp?mode=login'>
	<table width='273' border='0' align='center' cellspacing='0' cellpadding='0' bgcolor='#CCCCCC' style="BORDER-BOTTOM: #000000 1px solid; border-top:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000">
	<tr><td align='right' height='47' valign='bottom' width='94'>User name: </td>
	<td height='47' valign='bottom' width='172'><input type='text' name='txtUserName'>
	</td></tr><tr><td align='right' width='94'>Password: </td><td width='172'>
	<input type='password' name='txtUserPass'></td></tr><tr>
	<td align='right' height='44' width='94'>&nbsp;</td>
	<td height='44 width='172'>
	<input type='image' src='images/forward.gif' name='Submit' value='Enter' alt='Enter'>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	<input type='image' src='images/cancel.gif' name='Reset' value='Reset' alt='Reset'>
	</td></tr>
	</table></form>
<%
End If
Response.Write ("<center><table><tr><td><a href=http://www.toddwoolums.com/aspdownload.asp target=_new><img src=images/poweredby.gif alt='Powered By ASP Download' border=0></a></td></tr></table></center>")
%>
<!--#include file='footer.inc'-->