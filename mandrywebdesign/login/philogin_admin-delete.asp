<%
Option Explicit
Dim username,rsDelete,startletter

startletter = Request.QueryString("startletter")

if Request.Cookies("philoginadmin") = "True" then
  
  username = Request.QueryString("username")
%>
<!--#include file="conn.asp"-->
<%
  set rsDelete = conn.Execute("DELETE * FROM messages WHERE sendto = '" & username & "'")
  set rsDelete = conn.Execute("DELETE * FROM users WHERE username = '" & username & "'")
  
  conn.close
  set conn = nothing
end if

Response.Redirect("philogin_admin.asp?startletter=" & startletter)
%>