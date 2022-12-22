<%
Option Explicit
Dim sql, rsMessage, rsUser, username, sentfrom, sendto, subject, message, notfilled(2), badflag, count

username = Request.Cookies("username")

if username = "" then
  Response.Redirect("nologin.asp?page=messagecompose.asp")
end if
%>

<html>
<head>
<title>Message Send</title>
</head>
<body bgcolor="#FFFFFF" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size=2>

<%
'Assign form values to variables
sentfrom = Request.Cookies("username")
sendto = Request.Form("sendto")
subject = Request.Form("subject")
message = Request.Form("message")

'Check everything's been filled in, badflag determines whether error function is called
badflag = 0

if sendto = "" then
	notfilled(0) = "To"
	badflag = 1
end if
if subject = "" then
	notfilled(1) = "Subject"
	badflag = 1
end if
if message = "" then
	notfilled(2) = "Message"
	badflag = 1
end if

if badflag = 1 then
	senderror()
end if

'Open connection and insert user message into the database
%>
<!--#include file="conn.asp"-->
<%
'Check the user the message is being sent to exists
sql = "SELECT username FROM Users WHERE username = '" & sendto & "'"
Set rsUser = Server.CreateObject("ADODB.Recordset")
rsUser.Open sql, conn, 3, 3

if rsUser.EOF then
	nouser()
end if
rsUser.close
set rsUser = nothing

Set rsMessage = Server.CreateObject("ADODB.Recordset")
rsMessage.open "Messages", conn, 3, 3
rsMessage.AddNew
rsMessage("sentfrom") = sentfrom
rsMessage("sendto") = sendto
rsMessage("subject") = subject
rsMessage("message") = message
rsMessage.Update
rsMessage.close
set rsMessage = nothing
%>
		  
<p><b>Sua mensagem para<i><%=sendto%></i> foi enviada com sucesso.</b></p>

<p align="center"><a href="inbox.asp">voltar &agrave; caixa de mensagens</a> | 
  <a href="userview.asp">voltar &agrave; lista de membros</a> | <a href="index.asp">voltar 
  &agrave; p&aacute;gina inicial</a></p>

</font>
</body>
</html>

<%Function senderror()%>

<p><b>Voc&ecirc; n&atilde;o preencheu os seguintes dados corretamente:</b></p>

<%for count = 0 to 2%>
	<%if notfilled(count) <> "" then%>
	<b><%=notfilled(count)%></b><br>
	<%end if%>
<%next%>

<p><a href="javascript:self.history.go(-1)">Tente novamente</a></p>

</font>
</body>
</html>
<%Response.end
End Function%>

<%Function nouser()%>

<p><b>O membro&quot;<%=sendto%>&quot; n&atilde;o existe.</b></p>

<p><a href="javascript:self.history.go(-1)">Tente novamente</a></p>

</font>
</body>
</html>
<%Response.end
End Function%>

<%
conn.close
set conn = nothing
%>
