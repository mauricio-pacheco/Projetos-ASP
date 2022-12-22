<% 

' CONEXÃO ACCESS 

Set conn=Server.CreateObject("ADODB.Connection") 
drv= "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ="& Server.MapPath("dcebd/dcedata.mdb") & ";" 
conn.Open drv 

login=Request.QueryString("login") 'aqui recuperamos o login digitado, através da QueryString 
senha=Request.QueryString("senha") 'aqui recuperamos a senha digitado, através da QueryString 

'SQL QUE SELECIONA OS DADOS DO USUARIO CASO O LIGN E A SENHA ETEJAM CORRETOS 
sql = "SELECT * FROM logado WHERE login = '" & login &"' AND senha = '" & senha & "' " 

'SETAMOS A VARIAVEL rsLogar e ABRIMOS O COMANDO SQL 
Set rsLogar = Server.CreateObject("ADODB.Recordset") 
rsLogar.Open sql, conn 

'A CONDIÇÃOˆ - SE CHEGOU AO FIM "eof" DO BANCO DE DADOS, SIGNIFICA QUE 
'NAO EXISTE NADA COM ESSE LOGIN E COM ESSA SENHA 
'SENAO "Else" ELE ABRE A SESSAO 'Entrada' que é igual a "sim" E JUNTAMENTE PEGA OS DADOS DO USUARIO PARA USAR NAS PAGINAS SEGUINTES... 

'Segue abaixo 

if (rsLogar.eof) Then 

Response.Write "<p align=""center""><img src=""dce.jpg""><br><br><font face=""verdana"" size=""1""><br>ERRO - Login ou Senha incorretos<br><br><a href=""gerenciar.asp"">VOLTAR</a></font></p>" 

Else 

Session("entrada") = "sim" 
Session("nome") = rsLogar("nome") 

Response.redirect("dceuri123.asp") 


End If 

%> 