<%
Option Explicit
Dim username, password

username = Request.Form("username")
password = Request.Form("password")

'Change the username and password values below change the login
if (username = "vistamoveis") and (password = "123456") then
  Response.Cookies("philoginadmin") = "True"
end if

Response.Redirect("philogin_admin.asp")
%>