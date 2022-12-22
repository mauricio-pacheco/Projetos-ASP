<%
'Set the cookie to nothing
Response.Cookies("username") = ""

'Then send them back to the home page
Response.Redirect("index.asp")
%>
