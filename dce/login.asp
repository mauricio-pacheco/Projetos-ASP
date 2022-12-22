<%
Dim user, pass
user = Request.Form("user")
pass = Request.Form("pass")

Dim conObj
Set conObj = Server.CreateObject("ADODB.Connection")
conObj.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("dcebd/dcedata.mdb") & ";"

Dim sql
sql = "SELECT * FROM logado WHERE login='" & user & "' AND senha='" & pass & "'"

Dim rs
Set rs = conObj.Execute(sql)
If rs.EOF Then
login = false
Else
login = true
End If

If login = true Then
Session("logado") = true
Response.redirect("gerenciar.asp")
Else
Response.redirect("erro.asp")
End If
%>