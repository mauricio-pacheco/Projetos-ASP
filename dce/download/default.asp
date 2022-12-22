<%@ LANGUAGE="VBSCRIPT" %>
<%Response.Buffer=TRUE%>
<!--#include file='dbconnection.inc'--> 
<!--#include file='header.inc'--> 
<!--#include file="md5.asp"-->
<LINK href="css/styles.css" type=text/css rel=stylesheet>

<% 
If Request.querystring("mode") = "login" then 
Dim rsCheckUser   
Dim strSQL          
Dim strUserName 	
strUserName = Replace(Request.Form("txtUserName"), "'", "''")
Set rsCheckUser = Server.CreateObject("ADODB.Recordset")
strSQL = "SELECT password, username FROM tblusers WHERE username ='" & strUserName & "'"
rsCheckUser.Open strSQL, adoCon
If NOT rsCheckUser.EOF Then
	If md5(Request.Form("txtUserPass")) = rsCheckUser("password") Then
     	Session("userName") = rsCheckUser("username")
		Session("userAdmin") = 1
	End If
	rsCheckUser.Close
	Set rsCheckUser = Nothing
	Set adoCon = Nothing
	Response.Redirect"downloadadmin.asp?mode=listdownload"
End If
rsCheckUser.Close
Set rsCheckUser = Nothing
Set adoCon = Nothing
Session("userAdmin") = 0
Response.Redirect"default.asp"
Else If Request.querystring("mode") = "logout" then
Session("userAdmin") = False
%>

<br>
<br>
<center>
  <span style="font-size: 12px; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif">Você acabou de sair.</span>
</center><br><br>
<form name="Login" method="post" action="default.asp?mode=login">
  <table width="320" border="0" align="center" cellspacing="0" cellpadding="0" bgcolor="#CCCCCC">
    <tr> 
      <td width="94" height="47" align="right" valign="bottom" bgcolor="#FFFFFF"><span style="font-size: 9px; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif">Usuário:</span> </td>
      <td width="172" height="47" valign="bottom" bgcolor="#FFFFFF"> 
        <input type="text" class=busca name="txtUserName"></td>
    </tr>
    <tr>
      <td width="94" align="right" bgcolor="#FFFFFF"><span style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 9px">Senha:</span> </td>
      <td width="172" bgcolor="#FFFFFF"> 
        <input type="password" class=busca name="txtUserPass"></td>
    </tr>
    <tr> 
      <td width="94" height="44" align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td width="172" height="44" bgcolor="#FFFFFF"> 
        <input type='submit' class=botao name='Submit' value='ENTRAR' alt='ENTRAR'>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type='submit' class=botao name='Reset' value='LIMPAR' alt='LIMPAR'>      </td>
    </tr>
</table>
</form>
<%
Else
%>
<form name="Login" method="post" action="default.asp?mode=login">
  <table width="320" border="0" align="center" cellspacing="0" cellpadding="0" bgcolor="#CCCCCC">
    <tr> 
      <td width="94" height="47" align="right" valign="bottom" bgcolor="#FFFFFF"><span style="font-size: 9px; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif">Usu&aacute;rio: </span></td>
      <td width="172" height="47" valign="bottom" bgcolor="#FFFFFF"> 
        <input type="text" class=busca name="txtUserName"></td>
    </tr>
    <tr>
      <td width="94" align="right" bgcolor="#FFFFFF"><span style="font-size: 9px; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif">Senha: </span></td>
      <td width="172" bgcolor="#FFFFFF"> 
        <input type="password" class=busca name="txtUserPass"></td>
    </tr>
    <tr> 
      <td width="94" height="44" align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td width="172" height="44" bgcolor="#FFFFFF"> 
        <input type='submit' name='Submit' class=busca value='ENTRAR' alt='ENTRAR'>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type='Reset' name='Reset' class=busca value='LIMPAR' alt='LIMPAR'></td>
    </tr>
    </table>
</form>
<%
End If
End If
%>
<!--#include file='footer.inc'--> 



                    