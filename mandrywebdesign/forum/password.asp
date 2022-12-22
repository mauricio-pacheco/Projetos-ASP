<%
If request.form("password")="mandry" Then
Session("admin")="Yes"
Response.redirect "index.asp"
Else
Response.redirect "login.asp"
End If
%>