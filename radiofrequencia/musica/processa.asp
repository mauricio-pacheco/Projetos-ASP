<%
Dim nome, cidade, estado, musica, comentario, data, hora, g, h

g = date

h = time

nome = request.form("nome")

cidade = request.form("cidade")

estado = request.form("estado")

musica = request.form("musica")

comentario = request.form("comentario")

data = request.form("data")

hora = request.form("hora")

'Conexão com o Banco de Dados
Set wm = Server.CreateObject("ADODB.Connection")

'abre o banco de dados 

wm.Open "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("journal.mdb")
Set rs = Server.CreateObject("ADODB.Recordset")

'Insere o novo usuário na tabela usuarios

Comando = "INSERT INTO journal (nome, cidade, estado, musica, comentario, data, hora)" & "VALUES('" & nome & "','" & cidade & "','" & estado & "','" & musica & "','" & comentario & "','" & g& "','" & h& "')"
wm.Execute(Comando)


%>
<div align="center">
  <p>&nbsp;</p>
  <p><img src="logo.jpg" width="99" height="120"></p>
  <p>&nbsp;</p>
  <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif">M&uacute;sica enviada com sucesso!</font></p>
  <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Obrigado por 
    estar sintonizado conosco!</font></p>
  <p><a
href="javascript:window.close()"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">FECHAR ESTA JANELA</font></a></p>
  <p>&nbsp;</p>
</div>
