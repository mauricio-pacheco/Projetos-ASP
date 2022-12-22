<%
If NOT Session("logado") = true Then
Response.redirect("default.asp")
Response.End
End If
%>
