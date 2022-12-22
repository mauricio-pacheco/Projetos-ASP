<%
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################
'#
'#  CÓDIGO: VirtuaStore Versão 1.2 - Copyright 2001-2003 VirtuaWorks                                    
'#  URL: www.virtuastore.com.br / www.virtuaworks.com.br                                                           
'#  E-MAIL: webmaster@virtuaworks.com.br                                                                                          
'#  AUTORES: Otávio Dias(Desenvolvedor) / Jone Bandinelli(Desenvolvedor) / Daniel Kern(Revisão)                
'# 
'#     Este programa é um software livre; você pode redistribuí-lo e/ou 
'#     modificá-lo sob os termos do GNU General Public License como 
'#     publicado pela Free Software Foundation.
'#     É importante lembrar que qualquer alteração feita no programa 
'#     deve ser informada e enviada para os criadores, através de e-mail 
'#     ou da página de onde foi baixado o código.
'#
'#  //-------------------------------------------------------------------------------------
'#  // LEIA COM ATENÇÃO: O software VirtuaStore 1.2 deve conter as frases
'#  // "Powered by VirtuaStore 1.2" ou "Software derivado de VirtuaStore 1.2" e 
'#  // o link para o site http://www.virtuastore.com.br no créditos da 
'#  // sua loja virtual para ser utilizado gratuitamente. Se o link e/ou uma das 
'#  // frases não estiver presentes ou visiveis este software deixará de ser
'#  // considerado Open-source(gratuito) e o uso sem autorização terá 
'#  // penalidades judiciais de acordo com as leis de pirataria de software.
'#  //--------------------------------------------------------------------------------------
'#      
'#     Este programa é distribuído com a esperança de que lhe seja útil,
'#     porém SEM NENHUMA GARANTIA. Veja a GNU General Public License
'#     abaixo (GNU Licença Pública Geral) para mais detalhes.
'# 
'#     Você deve receber a cópia da Licença GNU com este programa, 
'#     caso contrário escreva para
'#     Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
'#     Boston, MA  02111-1307  USA
'# 
'#     Para enviar suas dúvidas, sugestões e/ou contratar a VirtuaWorks 
'#     Internet Design entre em contato através do e-mail 
'#     contato@virtuaworks.com.br ou pelo endereço abaixo: 
'#     Rua Venâncio Aires, 1001 - Niterói - Canoas - RS - Brasil. Cep 92110-000.
'#
'#     Para ajuda e suporte acesse: http://www.virtuastore.com.br
'#
'#     BOM PROVEITO!          
'#     Equipe VirtuaStore
'#     []'s
'#
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################

'INÍCIO DO CÓDIGO
'----------------------------------------------------------------------------------------------------------------
'Este código está otimizado e roda tanto em Windows 2000/NT/XP/ME/98 quanto em servidores UNIX-LINUX com chilli!ASP
%>
<!-- #include file="topo.asp" -->
<%
'Inserir a compra no banco de dados

Sub adicionac(nOrderID, nProductID, nQuant)
textosql = "INSERT INTO pedidos (idcompra, idprod, quantidade) values ("&nOrderID&", "&nProductID&", "&nQuant&")"
abredb.Execute(textosql)
End Sub

intProdID = Request.form("intProdID")
intQuant = Request.form("intQuant")
intOrderID = cstr(Session("orderID"))

'Incrementa o Contador do Produto. Este é usado para fazer os campeões de venda.
Set rs = abredb.execute("SELECT contador FROM produtos WHERE idprod=" & intProdID)
if VersaoDb = 1 Then
abredb.execute("UPDATE produtos SET contador='" & rs("contador") + 1 & "' WHERE idprod='" & intProdID & "'")
else
abredb.execute("UPDATE produtos SET contador=" & rs("contador") + 1 & " WHERE idprod=" & intProdID)
end if
textosql = "SELECT * FROM pedidos WHERE idcompra ='" & intOrderID & "' AND idprod ='" & intProdID & "';"
set adiciona = abredb.Execute(textosql)
if adiciona.EOF then
txtInfo = "adicionado"  

adicionac intOrderID, intProdID, intQuant
estadozx = mid(request("frete"),2,3)
intOrderIDx = cstr(Session("orderID"))
set rsProdx = abredb.Execute("SELECT peso FROM produtos WHERE idprod="&intProdID&";")
peso = rsProdx("peso")
rsProdx.close

'Calcula o frete
set rsprodx = nothing
quantidade = intQuant
valor = peso * quantidade
pesoz = pesoz + valor
if session("estado") = "" then
session("peso") = 0
else
session("peso") = pesoz
end if
fretexz = right(request("frete"),1)
numerox = left(request("frete"),1)
if numerox = "" then
on error resume next
end if
if fretexz = "c" then
sqlq = "SELECT * FROM fretes WHERE localidade='pesocapital';"
else
sqlq = "SELECT * FROM fretes WHERE localidade='pesointerior';"
end if
Set dadosz = abredb.Execute(sqlq)
if dadosz.EOF or dadosz.BOF then
regi = "0,00"
else
regi = dadosz("re"&numerox&"")
end if
dadosz.close
Set dadosz = nothing
fretez = right(request("frete"),1)
numero = left(request("frete"),1)
if fretez = "c" then
sql = "SELECT * FROM fretes WHERE localidade='capital';"
else
sql = "SELECT * FROM fretes WHERE localidade='interior';"
end if
Set dados = abredb.Execute(sql)
if dados.EOF or dados.BOF then
regiao = "0,00"
else
regiao = dados("re"&numero&"")
end if
if pesoz <= 1 then
session("frete") = regiao
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 1 AND pesoz <= 2 then
session("frete") = regiao + (regi * 1)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 2 AND pesoz <= 3 then
session("frete") = regiao + (regi * 2)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 3 AND pesoz <= 4 then
session("frete") = regiao + (regi * 3)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 4 AND pesoz <= 5 then
session("frete") = regiao + (regi * 4)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 5 AND pesoz <= 6 then
session("frete") = regiao + (regi * 5)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 6 AND pesoz <= 7 then
session("frete") = regiao + (regi * 6)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 7 AND pesoz <= 8 then
session("frete") = regiao + (regi * 7)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 8 AND pesoz <= 9 then
session("frete") = regiao + (regi * 8)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 9 AND pesoz <= 10 then
session("frete") = regiao + (regi * 9)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 10 AND pesoz <= 11 then
session("frete") = regiao + (regi * 10)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 11 AND pesoz <= 12 then
session("frete") = regiao + (regi * 11)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 12 AND pesoz <= 13 then
session("frete") = regiao + (regi * 12)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 13 AND pesoz <= 14 then
session("frete") = regiao + (regi * 13)
session("estado") = estadozx
session("peso") = pesoz
end if
if pesoz > 14 AND pesoz => 15 then
session("frete") = regiao + (regi * int(pesoz))
session("estado") = estadozx
session("peso") = pesoz
end if
dados.close
Set dados = nothing
session("estado2") = request("frete")
else
session("frete") = session("frete")
session("estado") = session("estado")
session("peso") = session("peso")
session("estado2") = session("estado2")
txtInfo = "existente"
end if

'Chama dados do produto
Set rsProdInfo = abredb.Execute("SELECT * FROM produtos where idprod="&intProdID)
idsessao = rsProdInfo("idsessao")
nome = rsProdInfo("nome")
Set nomes = abredb.Execute("SELECT * FROM sessoes where id="&idsessao)
strNome = nomes("nome")
nomes.Close
set nomes = Nothing
rsProdInfo.Close
set rsProdInfo = Nothing

'Fecha banco de dados
abredb.Close
set abredb = Nothing
response.redirect "compra.asp?prodid="&intProdID&"&item="&txtInfo
%>
