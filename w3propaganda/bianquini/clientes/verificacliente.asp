<%
If NOT Session("clientelogado") = true Then
Response.redirect("cliente.asp")
Response.End
End If
%>
