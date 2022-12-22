<% Option Explicit %>
<% Response.Buffer = True %>
<% Response.Expires = -1 %>
<% Response.CacheControl = "Public" %>
<!--#include file="functions/functions_chat.asp"-->
<!--#include file="functions/functions_users.asp"-->
<%
If Request.Querystring("Reset") = "True" Then

	Call Reset()

End If
%>
<html>
<head>
<title>NOSTRAGHAMUS CHAT</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><noscript><meta HTTP-EQUIV="refresh" CONTENT="0; url=noenter.htm"></noscript>
<LINK href="default.css" type=text/css rel=STYLESHEET>
<link rel="stylesheet" href="includes/style.css">

<script>
<!-- Hide from older browsers...

function PopUpWindow(w,h) {
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;

	window.open('', 'ChatWindow2', 'toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=700,height=460,top='+wint+',left='+winl)
}
// -->
</script>

</head>

<body bgcolor="#000000" text="#FFFFFF">
<table height="100%" width="100%">
 <tr>
  <td height="100%" align="center">

<table width="400" cellpadding="6" cellspacing="0" align="center" style="border: 2px solid #FFFFFF;">
 <tr>
          <td bgcolor="#FFFFFF" rowspan="3">&nbsp;</td>
          <td bgcolor="#000000" width="100%" class="chatBorderText">
<p align="center"><font color="#FFFFFF">Sejam bem vindos ao chat exclusivo do 
              bloco de carnaval...</font></p>
            <p align="center"><img src="cirrosechat.jpg" width="72" height="89"></p>
            <p align="center"><font color="#FFFFFF">NOSTRAGHAMUS</font></p>
            <table width="100%">
              <tr> 
                <td><div align="center"><b>Usu&aacute;rios Online:</b> </div>
                  <hr size=1></td>
              </tr>
              <tr> 
                <td> 
                  <%
'Get the array
If IsArray(Application(ApplicationUsers)) Then
	saryActiveUsers = Application(ApplicationUsers)
Else
	ReDim saryActiveUsers(6, 0)
End If

Call RemoveUnActive()

If UBound(saryActiveUsers, 2) = 0 Then
	Call Reset()

	Response.Write(vbCrLf & "Não há nenhum usuário online")
Else
	Dim intArrayPass

	For intArrayPass = 1 To UBound(saryActiveUsers, 2)
		Response.Write(vbCrLf & saryActiveUsers(1, intArrayPass) & "<br>")
	Next
End If
%>
                </td>
              </tr>
            </table>
            
          </td>
          <td bgcolor="#FFFFFF" rowspan="3">&nbsp;</td>
 </tr>
<form action="chatroom.asp" method="GET">
 <tr>
            <td bgcolor="#000000" style="padding: 10px; border: 1px solid #FFFFFF" align="center"> 
              <center>
                <b>Digite seu nick e clique em entrar:</b> 
              </center>
  <br><br>
  <table cellspacing="10" style="border: 1px solid #FFFFFF">
   <tr>
                  <td>Nick:</td>
    <td><input type="text" size="20" name="txtUsername"></td>
   </tr>
   <tr>
    <td align="center" colspan="2"><input type="submit" value="Entrar"></td>
   </tr>
  </table>
              
            </td>
 </tr>
</form>
 
</Table>
    </td>
 </tr>
</table>

<p>&nbsp;</p>
</body>
</html>