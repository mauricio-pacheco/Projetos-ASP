<!--#include file="conexao.asp"-->
<%
Dim usuario, senha
usuario = Request.Form("usuario")
senha = Request.Form("senha")

Dim sql

sql = "SELECT * FROM representantes WHERE usuario='" & usuario & "' AND senha='" & senha & "'"

Dim rs

Set rs = wm.Execute(sql)
If rs.EOF Then
login = false
Else
login = true
End If

If login = true Then
Session("clientelogado") = true
Session("usuario") = usuario
Session.TimeOut = 30
Response.redirect("produtoscliente.asp")
Else
Response.redirect("errosenhacliente.asp")
End If

%>