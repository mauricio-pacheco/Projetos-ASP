<% @ Language=VBScript %>
<!--#include file="md5.asp"-->
<!--#include file="dbconnection.inc"-->
<%

Response.Buffer = False



Const strDbTable = "tbl"

%>
<html>
<head>
<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	var errorMsg = "";

	//Check for a Username
	if (document.frmLogin.adminuser.value==""){
		errorMsg += "\n\tUsername \t- Enter a Username";
	}


	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		msg = "The following field(s) need to be corrected: -\n";

		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}

	return true;
}
// -->
</script>

</head>
<body bgcolor="#FFFFFF" text="#000000">
<table width="584" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center">
      <h1>MS Access Database Setup</h1>
    </td>
  </tr>
</table>

<form name="frmLogin" method="post" action="setupdownload.asp" onSubmit="return CheckForm();">
  
 <table width="400" border="0" cellspacing="0" cellpadding="1" align="CENTER" bgcolor="#000000">
  <tr>
      <td>
        <table width="400" border="0" align="center" cellspacing="0" cellpadding="0" bgcolor="#CCCCCC">
      <tr>
            
      <td align="right"  width="190">Installation URL: </td>
            <td  width="208">
              <input type="text" name="installurl" value="http://www.yoursite.com/aspdownload">
            </td>
          </tr>
		   <tr>
            
      <td align="right"  width="190">SMTP Email Server: </td>
            <td  width="208">
              <input type="text" name="emailserver">
            </td>
          </tr>
		   <tr>
            
      <td align="right"  width="190">Administrator Username: </td>
            <td  width="208">
              <input type="text" name="adminuser">
            </td>
          </tr>
		   <tr>
            
      <td align="right"  width="190">Administrator Password: </td>
            <td  width="208">
              <input type="password" name="adminpass">
            </td>
          </tr>
		   <tr>
            
      <td align="right"  width="190">Administrator Email: </td>
            <td  width="208">
              <input type="text" name="adminemail">
            </td>
          </tr>
		  <tr>
            <td align="right" height="44" width="190">&nbsp;</td>
            <td height="44" width="208">
              <input type="submit" name="Submit" value="Enter">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="reset" name="Submit" value="Reset">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<table width="702" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;
      <%

Dim strSQL			'Holds the SQL query for the database
Dim blnErrorOccured		'Set to true if an error occurs
Dim strEPassword

'Resume on all errors
On Error Resume Next


'intialise variables
blnErrorOccured = False

'If a username and password is entred then start the ball rolling
If NOT Request.Form("adminuser") = "" Then

	'If an error has occured write an error to the page
	If Err.Number <> 0 Then
		Response.Write("<br /><b>Error Connecting to database </b><br /><br />Check the following is set up and correct:- <br /><br />Database Path<br />")
		
	Else

'******************************************
'***  	Insert default values	      *****
'******************************************
		

		'Enter the default values in the UserGroup Table
		'Admin Group
		strSQL = "INSERT INTO [" & strDbTable & "Users] ("
		strSQL = strSQL & "[username], "
		strSQL = strSQL & "[password], "
		strSQL = strSQL & "[Timestamp], "
		strSQL = strSQL & "[email] "
		strSQL = strSQL & ") "
		strSQL = strSQL & "VALUES "
		strSQL = strSQL & "('" & Request.form("adminuser") & "', "
		strSQL = strSQL & "'" & md5(Request.form("adminpass")) & "', "
		strSQL = strSQL & "'" & date() & "', "
		strSQL = strSQL & "'" & Request.form("adminemail") & "')"
		
		'Write to the database
		adoCon.Execute(strSQL)

		
				'If an error has occured write an error to the page
		If Err.Number <> 0 Then
			Response.Write("<br />Error entering default values in the Table " & strDbTable & "Users<br />")

			'Reset error object
			Err.Number = 0

			'Set the error boolean to True
			blnErrorOccured = True
		End If

		'Guest Group
		strSQL = "INSERT INTO [" & strDbTable & "Download] ("
		strSQL = strSQL & "[DownloadTitle], "
		strSQL = strSQL & "[DownloadSize], "
		strSQL = strSQL & "[DownloadAuthor], "
		strSQL = strSQL & "[DownloadDescription], "
		strSQL = strSQL & "[DownloadCount], "
		strSQL = strSQL & "[DownloadURL] "
		strSQL = strSQL & ") "
		strSQL = strSQL & "VALUES "
		strSQL = strSQL & "('ASP Download', "
		strSQL = strSQL & "'70', "
		strSQL = strSQL & "'Todd Woolums', "
		strSQL = strSQL & "'ASP Download Script', "
		strSQL = strSQL & "'1', "
		strSQL = strSQL & "'http://www.toddwoolums.com/aspdownload.asp')"
		

		'Write to the database
		adoCon.Execute(strSQL)

				'If an error has occured write an error to the page
		If Err.Number <> 0 Then
			Response.Write("<br />Error entering default values in the Table " & strDbTable & "News<br />")

			'Reset error object
			Err.Number = 0

			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		'Moderator Group
		strSQL = "INSERT INTO [" & strDbTable & "Settings] ("
		strSQL = strSQL & "[sitelink], "
		strSQL = strSQL & "[siteemail], "
		strSQL = strSQL & "[emailserver] "
		strSQL = strSQL & ") "
		strSQL = strSQL & "VALUES "
		strSQL = strSQL & "("
		strSQL = strSQL & "'" & Request.form("installurl") & "', "
		strSQL = strSQL & "'" & Request.form("adminemail") & "', "
		strSQL = strSQL & "'" & Request.form("emailserver") & "')"
		

		'Write to the database
		adoCon.Execute(strSQL)
		
		

			
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then
			Response.Write("<br />Error entering default values in the Table " & strDbTable & "Settings<br />")

			'Reset error object
			Err.Number = 0

			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
		
	'Display a message to say the database is created
		If blnErrorOccured = True Then
			Response.Write("<br /><b>Access database is set up, but with Error!</b>")
		Else
			Response.Write("<br /><center><font size=""4""><b>Congratulations, the Access database is set up and Ready to Go :)</b></font></center>")
		End If
	End If

	'Reset Server Variables
	Set adoCon = Nothing
	Set adoCon = Nothing
End If
%>
      </font></td>
  </tr>
</table>
<br />
</body>
</html>