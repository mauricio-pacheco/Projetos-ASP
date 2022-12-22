<%
'------------------------------------------------------------------------------------------
'Conecta ao BD
SET cg = CreateObject("ADODB.Connection")
g = "DRIVER={Microsoft Access Driver (*.mdb)};"
g = g &"DBQ="& Server.MapPath("c_guest2.mdb") &""
cg.open g

'------------------------------------------------------------------------------------------
'Variáveis
a = request.form("nome")
b = request.form("url")
c = request.form("email")
d = request.form("msg")
e = request.servervariables("REMOTE_ADDR")
g = date
h = time


'------------------------------------------------------------------------------------------
%><%if a="" then%>
<% a = "Anônimo"%><%end if%>
<%if d="" then%>
<% response.write ("É preciso escrever uma mensagem para postar!") %><%end if%>
<%if c = "" then%>
<% response.write "É necessário preencher o campo e-mail." %><%END IF%>

<%
SQL="INSERT INTO c_guest (nome, url, email, msg, ip, data, hora)"
SQL= SQL &"VALUES('"& a &"', '"& b &"', '"& c &"', '"& d &"', '"& e &"', '"& g &"', '"& h &"')" 
Set grava = cg.Execute(sql)
%>
<%
sqlcheca = "SELECT * FROM c_guest_cont"
set checa = cg.execute(sqlcheca)

if checa("email") = c then
f = checa("vezes")
f = f + 1

sconta = "UPDATE c_guest_cont SET vezes = '"& f &"'"
set conta = cg.execute(sconta)
else
conta = "INSERT INTO c_guest_cont (email, vezes) VALUES ('"& c &"', 1)"
set aff = cg.execute(conta)
end if%>
<%
cg.close
%>
<% response.redirect "contatos2.asp" %>
