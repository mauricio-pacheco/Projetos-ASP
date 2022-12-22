<%
Option Explicit
Dim messageid,username,rsMessage

username = Request.Cookies("username")

if username = "" then
  Response.Redirect("nologin.asp?page=messagecompose.asp")
end if

messageid = Request.QueryString("messageid")
%>
<!--#include file="conn.asp"-->
<%
set rsMessage = conn.Execute("DELETE * FROM Messages WHERE id = " & messageid)

conn.close
set conn = nothing

Response.Redirect("inbox.asp")
%>