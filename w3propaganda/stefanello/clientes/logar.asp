<!--#include file="conexao.asp"-->
<%

Dim usuario, senha

usuario = Request.Form("usuario")
senha = Request.Form("senha")

Dim sql
sql = "SELECT * FROM login WHERE usuario='" & usuario & "' AND senha='" & senha & "'"

Dim rs
Set rs = wm.Execute(sql)
If rs.EOF Then
loginre = false
Else
loginre = true
End If

If loginre = true Then
Session("logado") = true
Session.TimeOut = 30
Response.redirect("cadastro.asp")
Else
Response.redirect("errosenha.asp")
End If

%>