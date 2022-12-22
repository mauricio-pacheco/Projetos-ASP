<%
Option Explicit
Dim sql, username, rsMessages, rsMessageRead, newcount

username = Request.Cookies("username")

if username = "" then
  Response.Redirect("nologin.asp?page=inbox.asp")
end if

%>
<!--#include file="conn.asp"-->
<%
sql = "SELECT Messages.*, icon FROM Users INNER JOIN Messages ON Users.username = Messages.sentfrom WHERE sendto = '" & username & "' ORDER BY datesent DESC"
Set rsMessages = Server.CreateObject("ADODB.Recordset")
rsMessages.Open sql, conn, 3, 3

'Count the amount of new messages
newcount = 0
if not rsMessages.EOF then
	rsMessages.Movefirst
	do until rsMessages.EOF
		if rsMessages("messageread") = False then
			newcount = newcount + 1
		end if
		rsMessages.Movenext
	loop
	rsMessages.Movefirst
end if
%>

<html>
<head>
<title>Inbox</title>
</head>
<body bgcolor="#FFFFFF" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size=2>

<table width="600" cellspacing=0 cellpadding=3 border=1 bordercolor="#000000">
<tr bgcolor="#000000">
    <th align="left"><font face="arial,helvetica" size=2 color="#FFFFFF"> <%=username%>'s 
      inbox - novas mensagens: <%=newcount%> </font></th>
    <th align="right"><font face="arial,helvetica" size=2 color="#FFFFFF"> <a href="messagecompose.asp" style="color: #FFFFFF;">compor 
      uma mensagem</a> </font></th>
</tr>
<tr>
    <td align="center" colspan=2> 
      <%if rsMessages.EOF then%>
      <font face="arial,helvetica" size=2><b>Desculpe, voc&ecirc; n&atilde;o tem 
      mensagens </b></font> 
      <%else
'Display messages
do until rsMessages.EOF%>
      <table width="90%" cellspacing=0 cellpadding=2 align="center" border=0 bordercolor="#000000">
  <tr>
	      <td><font face="arial,helvetica" size=2><b>De :</b> <%=rsMessages("sentfrom")%> 
            </font></td>
  </tr>
  <tr>
	      <td><font face="arial,helvetica" size=2><b>Enviar para: <%=rsMessages("datesent")%></b></font></td>
	<td align="right" valign="top" width=125 rowspan=3>
	<img src="icons/<%=rsMessages("icon")%>.gif"><br>
	</td>
  </tr>
  <tr>
	      <td><font face="arial,helvetica" size=2><b>Assunto :</b> <%=rsMessages("subject")%></font></td>
  </tr>
  <tr>
	      <td><font face="arial,helvetica" size=2><b>Mensagem:</b> <%=rsMessages("message")%></font></td>
  </tr>
  </table>
      <font face="arial,helvetica" size=1><b><a href="messagecompose.asp?senduser=<%=rsMessages("sentfrom")%>&subject=<%=Server.URLEncode(rsMessages("subject"))%>">responder 
      esta mensagem</a> | <a href="messagedelete.asp?messageid=<%=rsMessages("id")%>">apagar 
      esta mensagem</a></b></font> 
      <hr color="#000000">
<%rsMessages.Movenext
loop

end if%>
  </td>
</tr>
</table>

  
<p align="center"><b><a href="inbox.asp">checar novamente as mensagens</a> | <a href="messagecompose.asp">compor 
  uma mensagem</a></b></p>

<br>
<p><a href="index.asp">Voltar &agrave; p&aacute;gina inicial</a></p>

</font>
</body>
</html>

<%
set rsMessageRead = conn.Execute("UPDATE Messages SET messageread = True WHERE sendto = '" & username & "'")

rsMessages.close
set rsMessages = nothing
conn.close
set conn = nothing
%>
