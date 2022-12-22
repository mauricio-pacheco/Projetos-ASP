<%
If NOT Session("logado") = true Then
Response.redirect("logarse.asp")
Response.End
End If
%>
