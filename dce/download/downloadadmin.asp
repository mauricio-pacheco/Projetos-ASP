<%@ LANGUAGE="VBSCRIPT" %>
<%Response.Buffer=TRUE%>
<LINK href="css/styles.css" type=text/css rel=stylesheet>

<style type="text/css">
<!--
body {
	background-color: #ffffff;
}
.style5 {font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 9px;}
.style6 {
	font-size: 9px;
	font-family: Verdana;
}
-->
</style>
<!--#include file='header.inc'--> 
<!--#include file="md5.asp"-->
<!--#include file="upload.asp"-->
<script language="javascript">
function invalid() {
	if (document.User.txtPassword.value != document.User.txtPassword2.value) {
		alert("Passwords don't match.  Please re-enter.");
		return false;
	}
	if (document.User.txtPassword.value =="") {
		alert("Password is blank.  Please re-enter.");
		return false;
	}
return true;
}
function isANumber(number, message) {
answer = 1; 
if (!parseFloat(number)) {
//the first digit wasn't numeric
answer = 0;
alert("Please enter a numeric value for the " + message + " field.");
} 
else {
//the first digit was numeric, so check the rest
for (var i=0; i<number.length; i++) {
if ((number.charAt(i) != "0")
&& (!parseFloat(number.charAt(i)))) {
answer = 0;
alert("Please enter a numeric value for the " + message + " field.");
break;
}
}
}
return answer;
} 
</script>
<% Response.Write ("<span class=""style3""><font size=""1"" face=""verdana"">")
  %>
<table><tr><TD width="20%" valign=top><TABLE cellSpacing=3 cellPadding=3 border=0><TBODY><TR>
              <!-- Menu Starts Here -->
		<TD vAlign=top colSpan=2><BR>&nbsp;</TD></TR>
		<td>&nbsp;</td>
		<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
       	<TR vAlign=top>
        <TD><IMG height=9 src="images/bullet1.jpg" width=9></TD>
        <TD vAlign=center class=fonte><A href="downloadadmin.asp?mode=upload">Adicionar Download </A></TD></TR>
		<TR vAlign=top>
        <TD><IMG height=9 src="images/bullet1.jpg" width=9></TD>
        <TD vAlign=center class=fonte><A href="downloadadmin.asp?mode=listdownload">Deletar Downloads </A></TD></TR>
	    <TR vAlign=top>
        <TD><IMG height=9 src="images/bullet1.jpg" width=9></TD>
        <TD vAlign=center class=fonte><A href="default.asp?mode=logout">SAIR </A></TD></TR>
	       <!-- Menu Stops Here -->

</TR></TBODY></TABLE></TD><td width="80%" valign=top>

<!--#include file='dbconnection.inc'--> 
<%
If Session("userAdmin") = 0 or IsNull(Session("userAdmin")) = True then
Response.Redirect"default.asp"
End If

function fieldReplace(item)
 item = replace(item, "'", "''")
 item = replace(item, "%", "%")
 item = replace(item, vbcrlf, "<br>")
 fieldReplace = item
end function
        
If Request.querystring("mode") = "post" then 
%>

<form name='Download' method='post' action='downloadadmin.asp?mode=postdb'>
<table><tr><td class="style5">Título do Arquivo:</td>
</tr><tr><td><input type='text' name='txtTitle' class=busca></td></tr>
<tr><td class="style5">Tamanho(bytes):</td>
</tr><tr><td><input class=busca type='text' name='txtSize' onChange="if(this.value) {if (!(isANumber(this.value, 'DownloadSize'))) {this.focus();}}"></td></tr>
<tr><td class="style5">Autor:</td>
</tr><tr><td><input class=busca type='text' name='txtAuthor'></td></tr>
<tr>
  <td class="style5">Descrição:</td>
</tr><tr><td><textarea class=form name='txtDescription' rows="5" cols="20" ></textarea></td></tr>
<tr><td><span class="style5">Link:</span></td>
</tr><tr><td><input class=busca type='text' name='txtURL'></td></tr>
<tr><td><input type=submit class=busca name='Submit' value='ENVIAR' alt='Enter'>
</td></tr></table></form>
<FORM><INPUT type=image src=images/back.gif value='Back' onClick='parent.history.back(); return false;'></FORM>
<%
End If
%>
<%
If Request.querystring("mode") = "postdb" then 
	strTitle = Request.Form("txtTitle")
	numSize = Request.Form("txtSize")
	strAuthor = Request.Form("txtAuthor")
	strDescription = Request.Form("txtDescription")
	strURL = Request.Form("txtURL")
	strTitle = fieldReplace(strTitle)
	strAuthor = fieldReplace(strAuthor)
	strDescription = fieldReplace(strDescription)
	strURL = fieldReplace(strURL)
	strSQL = "INSERT INTO tbldownload (downloadtitle, downloadsize, downloadauthor, downloaddescription, downloadurl)VALUES('" & strTitle & "','" & numSize & "','" & strAuthor & "','" & strDescription & "', '" & strURL & "')"
	adoCon.Execute(strSQL)
	Set adoCon = Nothing
	Response.Redirect"downloadadmin.asp?mode=listdownload"
End If
If Request.querystring("mode") = "delete" then 
	strID = Clng(request.querystring("ID"))
	strSQL = "DELETE FROM tbldownload WHERE DownloadID =" & strID
	adoCon.Execute(strSQL)
	Set adoCon = Nothing
	Response.Redirect"downloadadmin.asp?mode=listdownload"
End If 
%>
<%
If Request.querystring("mode") = "listdownload" then
	Set rsDownloadAdmin = Server.CreateObject("ADODB.Recordset")
	strSQL = "SELECT downloadid, downloadtitle, downloadcount FROM tbldownload ORDER BY DownloadID"
	rsDownloadAdmin.Open strSQL, adoCon

	Set rsSettings = Server.CreateObject("ADODB.Recordset")
	strSettingsSQL = "SELECT sitelink FROM tblsettings"
	rsSettings.Open strSettingsSQL, adoCon
%>
<%
	Response.Write ("<table><tr><td class=fonte><center>Arquivo</center></td><td class=fonte><center># Downloads</center></td><td class=fonte><center>Deletar </center></td><td class=fonte><center>Editar</center></td><td class=fonte><center>Download Link</center></td></tr>")
	Dim strBGColor
	strBGColor = "#ffffff"

Do While NOT rsDownloadAdmin.EOF
	if strBGColor = "#ffffff" Then strBGColor = "#ffffff" Else strBGColor = "#ffffff" %>
	<tr bgcolor="<%= Cstr(strBGColor) %>"><td><center>
	<%
	Response.Write (rsDownloadAdmin("DownloadTitle"))
	Response.Write ("</center></td><td><center>")
	Response.Write (rsDownloadAdmin("DownloadCount"))
	Response.Write ("</center></td><td><center><a href=downloadadmin.asp?mode=delete&ID=")
	Response.Write (rsDownloadAdmin("DownloadID"))
	Response.Write (">")
	Response.Write ("<img src='images/cancel.gif' border='0' Alt='Deletar'>")
	Response.Write ("</a></center></td><td><center><a href=downloadadmin.asp?mode=edit&ID=")
	Response.Write (rsDownloadAdmin("DownloadID"))
	Response.Write ("><img src='images/editdownload.jpg' border='0' Alt='Editar'></a></center></td>")
	Response.Write ("<td><center><a href='")
	Response.Write (rsSettings("sitelink"))
	Response.Write ("/download.asp?DownloadID=")
	Response.Write (rsDownloadAdmin("DownloadID"))
	Response.Write ("' target='_new'>Download Link</a></center></td></tr>")

	rsDownloadAdmin.MoveNext
Loop
Response.Write ("</table>")
Set rsDownloadAdmin = Nothing
Set adoCon = Nothing

End If

%>
<%
If Request.querystring("mode") = "edit" then 
	strID = Clng(request.querystring("ID"))
	Set rsEdit = Server.CreateObject("ADODB.Recordset")
    strEditSQL = "SELECT downloadtitle, downloadsize, downloadauthor, downloaddescription, downloadurl FROM tbldownload WHERE DownloadID= " & strID
	rsEdit.Open strEditSQL, adoCon
%>

<form name='Download' method='post' action='downloadadmin.asp?mode=updatedb'>
<table><tr><td class="style5">Título do Arquivo:</td>
</tr><tr><td><input class=busca type='text' name='txtTitle' value='<%=rsEdit("DownloadTitle")%>'></td></tr>
<tr><td class="style5">Tamanho(bytes):</td>
</tr><tr><td><input class=busca type='text' name='txtSize' value='<%=rsEdit("DownloadSize")%>'></td></tr>
<tr><td><span class="style6">Autor:</span></td>
</tr><tr><td><input class=busca type='text' name='txtAuthor' value='<%=rsEdit("DownloadAuthor")%>'></td></tr>
<tr><td class="style5">Descrição:</td>
</tr><tr><td><textarea class=form name='txtDescription' rows="5" cols="20"><%=rsEdit("DownloadDescription")%>
</textarea></td></tr>
<tr><td class="style5">URL:</td>
</tr><tr><td><input class=busca type='text' name='txtURL' value='<%=rsEdit("DownloadURL")%>'></td></tr>
<input type='hidden' name='txtID' value='<%=strID%>'><tr><td><input type=submit class=botao name='Submit' value='ENVIAR' alt='Enter'>
</td></tr></table></form>
<FORM><INPUT type=image src=images/back.gif value='Back' onClick='parent.history.back(); return false;'></FORM>
<%
Set adoCon = Nothing
Set rsEdit = Nothing
End If
%>

<%
If Request.querystring("mode") = "updatedb" then 
	strID = Request.Form("txtID")
	strTitle = Request.Form("txtTitle")
	numSize = Request.Form("txtSize")
	strAuthor = Request.Form("txtAuthor")
	strDescription = Request.Form("txtDescription")
	strURL = Request.Form("txtURL")
	strTitle = fieldReplace(strTitle)
	strAuthor = fieldReplace(strAuthor)
	strDescription = fieldReplace(strDescription)
	strURL = fieldReplace(strURL)
	strSQL = "UPDATE tbldownload SET tbldownload.downloadtitle='" & strTitle & "',tbldownload.downloadauthor='" & strAuthor & "',tbldownload.downloadsize='" & numSize & "', tbldownload.downloaddescription='" & strDescription & "',tbldownload.downloadurl='" & strURL & "' WHERE DownloadID =" & strID
	adoCon.Execute(strSQL)
	Set adoCon = Nothing
	Response.Redirect"downloadadmin.asp?mode=listdownload"
End If
%>

<%
If Request.querystring("mode") = "add" then
	strUserName = Replace(Request.Form("txtUserName"), "'", "''")
	strPassword = Replace(Request.Form("txtPassword"), "'", "''")
	strEmail = Request.Form("txtEmail")
	strEPassword = md5(strPassword)
	strUserName = fieldReplace(strUserName)
	strSQL = "INSERT INTO tblusers ([username],[password],[Timestamp],email) VALUES('" & strUserName & "', '" & strEPassword & "', '" & date() & "', '" & strEmail & "')"
	strSQLCheck = "SELECT username from tblusers where username = '" & strUserName & "'"
	Set rsAdminCheck = adoCon.Execute(strSQLCheck)
	If Not rsAdminCheck.EOF then
			Response.Redirect"downloadadmin.asp?mode=addusertaken"
		Set rsAdminCheck = Nothing
		Set adoCon = Nothing
	End If
	Response.Write strSQL
	adoCon.execute (strSQL)
	Set adoCon = Nothing
	Response.Redirect"downloadadmin.asp?mode=listusers"
End If
%>
<%
If Request.querystring("mode") = "adduser" then
%>
<%
	 Response.Write ("<form name='User' method='post' action='downloadadmin.asp?mode=add' onSubmit='return invalid();'>")
	 Response.Write ("<br>")
	 Response.Write ("<table><tr><td><b>UserName:</b>&nbsp;&nbsp;</td><td><input type='text' name='txtUserName' value='UserName'></td></tr>")
	 Response.Write ("<tr><td><b>Password:</b>&nbsp;&nbsp;</td><td><input type='password' name='txtPassword'</td></tr>")
 	 Response.Write ("<tr><td><b>Confirm Password:</b>&nbsp;&nbsp;</td><td><input type='password' name='txtPassword2'</td></tr>")
	 Response.Write ("<tr><td><b>Email Address:</b>&nbsp;&nbsp;</td><td><input type='text' name='txtEmail'</td></tr>")
	 Response.Write ("<tr><td><input type='image' src='images/submit.jpg' name='Submit' value='Enter' alt='Enter'>")
	 Response.Write ("</td></tr></table></form>")
	 Response.Write ("<FORM><INPUT type=image src=images/back.gif value='Back' onClick='parent.history.back(); return false;'></FORM>")
End If
%>
<%
If Request.querystring("mode") = "addusertaken" then
%>
<%
	 Response.Write ("<font color='red'>Username is already in use.</font><br><br>")
	 Response.Write ("<form name='User' method='post' action='downloadadmin.asp?mode=add' onSubmit='return invalid();'>")
	 Response.Write ("<br>")
	 Response.Write ("<table><tr><td><b>UserName:</b>&nbsp;&nbsp;</td><td><input type='text' name='txtUserName' value='UserName'></td></tr>")
	 Response.Write ("<tr><td><b>Password:</b>&nbsp;&nbsp;</td><td><input type='password' name='txtPassword'</td></tr>")
 	 Response.Write ("<tr><td><b>Confirm Password:</b>&nbsp;&nbsp;</td><td><input type='password' name='txtPassword2'</td></tr>")	 
	 Response.Write ("<tr><td><input type='image' src='images/submit.jpg' name='Submit' value='Enter' alt='Enter'>")
	 Response.Write ("</td></tr></table></form>")
	 Response.Write ("<FORM><INPUT type=image src=images/back.gif value='Back' onClick='parent.history.back(); return false;'></FORM>")
End If
%>
<%
If Request.querystring("mode") = "listusers" then
	Set rsUserAdmin = Server.CreateObject("ADODB.Recordset")
	strSQL = "SELECT username, ID FROM tblusers ORDER BY username"
	rsUserAdmin.Open strSQL, adoCon
%>
<%
	Response.Write ("<table><tr><td><b><center>UserName</center></b></td><td><b><center>Delete User</center></b></td><td><b><center>Change Password</center></b></td></tr>")
	strBGColor = "#EEEEEE"

	Do While NOT rsUserAdmin.EOF
	if strBGColor = "#EEEEEE" Then strBGColor = "#D7D7D7" Else strBGColor = "#EEEEEE" %>
	<tr bgcolor="<%= Cstr(strBGColor) %>"><td><center>
<%
	Response.Write (rsUserAdmin("username"))
	Response.Write ("</center></td><td><center><a href=downloadadmin.asp?mode=deleteuser&ID=")
	Response.Write (rsUserAdmin("ID"))
	Response.Write ("><img src='images/cancel.gif' border='0' Alt='Delete User'></a></center></td>")
	Response.Write ("<td><center><a href=downloadadmin.asp?mode=change&ID=")
	Response.Write (rsUserAdmin("ID"))
	Response.Write ("><img src='images/security.gif' border='0' Alt='Change Password'></a></center></td></tr>")
	rsUserAdmin.MoveNext
Loop
Response.Write ("</table>")
Set rsUSerAdmin = Nothing
Set adoCon = Nothing

End If
%>
<%
If Request.querystring("mode") = "deleteuser" then
	userID = Clng(Request.querystring("ID"))
	strSQL = "DELETE FROM tblusers WHERE ID =" & userID
	adoCon.execute (strSQL)
	Set adoCon = Nothing
	Response.Redirect"downloadadmin.asp?mode=listusers"
End If
%>
<%
If Request.querystring("mode") = "change" then
%>
<%
	userID = Clng(Request.querystring("ID"))
	 Response.Write ("<form name='User' method='post' action='downloadadmin.asp?mode=changepassword' onSubmit='return invalid();'>")
	 Response.Write ("<br><b>Change Password</b><br><br>")
	 Response.Write ("<input type='Password' name='txtPassword'><br>")
	 Response.Write ("<input type='Password' name='txtPassword2'><br>")
	 Response.Write ("<input type=hidden value='" & userID & "' name='txtID'><br><br><br>")
	 Response.Write ("<input type='image' src='images/submit.jpg' name='Submit' value='Enter' alt='Enter'>")
	 Response.Write ("</form>")
	 Response.Write ("<FORM><INPUT type=image src=images/back.gif value='Back' onClick='parent.history.back(); return false;'></FORM>")
End If
%>
<%
If Request.querystring("mode") = "changepassword" then
	strUserID = Clng(Request.Form("txtID"))
	strPassword = Replace(Request.Form("txtPassword"), "'", "''")
	strEPassword = md5(strPassword)
	strSQL = "UPDATE tblusers SET tblusers.password='" & strEPassword & "' WHERE ID =" & strUserID
	adoCon.execute (strSQL)
	Set adoCon = Nothing
	Response.Redirect"downloadadmin.asp?mode=listusers"
End If
%>
<%
If Request.querystring("mode") = "settings" then
%>

<script language=JavaScript src="colorpicker/picker.js" ></script>
<%
	Set rsSettings = Server.CreateObject("ADODB.Recordset")
	strSettingsSQL = "SELECT sitelink,siteemail,emailserver FROM tblsettings"

	rsSettings.Open strSettingsSQL, adoCon

	 Response.Write ("<form name='Settings' method='post' action='downloadadmin.asp?mode=settingsdb'>")
	 Response.Write ("<table><tr><td>Site Install Link</td><td><input type='text' name='txtLink' value=")
	 Response.Write (rsSettings("sitelink"))
	 Response.Write ("></td></tr>")
	 Response.Write ("<tr><td>Site Email Address</td><td><input type='text' name='txtEmailAdd' value=")
	 Response.Write (rsSettings("siteemail"))
	 Response.Write ("></td></tr>")
	 Response.Write ("<tr><td>Email Server</td><td><input type='text' name='txtEmailServer' value=")
	 Response.Write (rsSettings("emailserver"))
	 Response.Write ("></td></tr>")
	 Response.Write ("</table>")
	 Response.Write ("<input type='image' src='images/submit.jpg' name='Submit' value='Enter' alt='Enter'>")
	 Response.Write ("</form>")
	 Response.Write ("<FORM><INPUT type=image src=images/back.gif value='Back' onClick='parent.history.back(); return false;'></FORM>")

	Set rsSettings = Nothing
	Set adoCon = Nothing
End If
%>
<%
If Request.querystring("mode") = "settingsdb" then
	Set rsSettings = Server.CreateObject("ADODB.Recordset")

	strLink = Request.Form("txtLink")
	strEmailAdd = Request.Form("txtEmailAdd")
	strEmailServer = Request.Form("txtEmailServer")

	strSQL = "UPDATE tblsettings SET tblsettings.sitelink='" & strLink & "', tblsettings.siteemail='" & strEmailAdd & "', tblsettings.emailserver='" & strEmailServer & "'"
	rsSettings.Open strSQL, adoCon

	Set rsSettings = Nothing
	Set adoCon = Nothing
	Response.Redirect"downloadadmin.asp?mode=settings"

End If
If Request.querystring("mode") = "upload" then
%>
	<form name='Upload' method='post' ENCTYPE='multipart/form-data' action='downloadadmin.asp?mode=uploadprocess'>
	<table><tr><td class="style5">Título do Arquivo:</td>
	</tr><tr><td><input class=busca type='text' name='txtTitle'></td></tr>
	<tr><td class="style5">Autor:</td>
	</tr><tr><td><input class=busca type='text' name='txtAuthor'></td></tr>
	<tr><td class="style5">Descrição:</td>
	</tr><tr><td><textarea class=form name='txtDescription' rows="5" cols="20"></textarea></td></tr>
	<tr><td class="style5">PROCURAR ARQUIVO:</td>
	</tr><tr><td><INPUT TYPE='FILE' NAME='txtFile'></td></tr>
	<tr><td><input class=botao type='submit' name='Submit' value='ENVIAR' alt='Enter'>
	  <input name="submit" type=submit class=botao onClick='parent.history.back(); return false;' value='VOLTAR'>
	</td>
	</tr></table>
	</form>
	<%
End If

If Request.querystring("mode") = "uploadprocess" then

	Set rsSettings = Server.CreateObject("ADODB.Recordset")
	strSettingsSQL = "SELECT sitelink FROM tblsettings"
	rsSettings.Open strSettingsSQL, adoCon

	Set Uploader = New FileUploader
	Uploader.Upload()

	strTitle = Uploader.Form("txtTitle")
	strAuthor = Uploader.Form("txtAuthor")
	strDescription = Uploader.Form("txtDescription")
	strTitle = fieldReplace(strTitle)
	strAuthor = fieldReplace(strAuthor)
	strDescription = fieldReplace(strDescription)

	If Uploader.Files.Count = 0 Then
		Response.Write "File(s) not uploaded."
	Else
		For Each File In Uploader.Files.Items
			File.SaveToDisk Server.MapPath("files")
			numSize = File.FileSize
			strURL =  rsSettings("sitelink") & "/files/" & File.FileName
			strSQL = "INSERT INTO tbldownload (downloadtitle, downloadsize, downloadauthor, downloaddescription, downloadurl)VALUES('" & strTitle & "','" & numSize & "','" & strAuthor & "','" & strDescription & "', '" & strURL & "')"
			adoCon.Execute(strSQL)
		Next
	End If
	
	Set adoCon = Nothing
	Response.Redirect"downloadadmin.asp?mode=listdownload"
	
End If

  Response.Write ("</font></span>")
 %>

</td></tr></table>
<center>
</center>
<!--#include file='footer.inc'-->
       