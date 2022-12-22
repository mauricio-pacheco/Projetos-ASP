<%
Dim nome, comentario, data, hora, g, h

g = date

h = time

nome = request.form("nome")

comentario = request.form("comentario")

data = request.form("data")

hora = request.form("hora")

'Conexão com o Banco de Dados
Set wm = Server.CreateObject("ADODB.Connection")

'abre o banco de dados 

wm.Open "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("journal.mdb")
Set rs = Server.CreateObject("ADODB.Recordset")

'Insere o novo usuário na tabela usuarios

Comando = "INSERT INTO journal (nome, comentario, data, hora)" & "VALUES('" & nome & "','" & comentario & "','" & g& "','" & h& "')"
wm.Execute(Comando)


%>
<div align="center">
  <p>&nbsp;</p>
  <p><img src="../menornn.gif" width="120" height="109"></p>
  <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Texto enviado 
    com sucesso!</font></p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
