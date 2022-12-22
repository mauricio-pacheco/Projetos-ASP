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
'Remove os itens do carrinho do compras
if request.querystring("acao") = "remover" then
estadozx = mid(request("frete"),2,3)
produtoz = request.querystring("produto")
intOrderID = cstr(Session("orderID"))
set rsProdx3 = abredb.Execute("SELECT peso FROM produtos WHERE idprod="&produtoz&";")
set rsProdx4 = abredb.Execute("SELECT * FROM pedidos WHERE idcompra='"&intOrderID&"' AND idprod='"&produtoz&"';")
peso = rsProdx3("peso")
quantidade = rsProdx4("quantidade")
rsProdx3.close
set rsProdx3 = nothing
rsProdx4.close
set rsProdx4 = nothing

'Diminui o frete
valor = peso * quantidade
session("peso") = session("peso") - valor
pesoz = session("peso")
set rsProd = abredb.Execute("DELETE FROM pedidos WHERE idcompra='"&intOrderID&"' AND idprod='"&produtoz&"';")
intOrderIDx = cstr(Session("orderID"))
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

'Fecha o banco de dados
abredb.close
set abredb = nothing
response.redirect "carrinhodecompras.asp"
else

'Adiciona o valor do frete
estadozx = mid(request("frete"),2,3)
intOrderIDx = cstr(Session("orderID"))
set rsProdx = abredb.Execute("SELECT * FROM pedidos WHERE idcompra='"&intOrderIDx&"';")
while not rsProdx.EOF
elementz = "quant" & rsProdx("idprod")
intQuantz = Request.form(elementz)
elementx = "peso" & rsProdx("idprod")
intQuantx = intQuantx + (Request.form(elementx) * intQuantz) - intQuantx
intQuantx2 = intQuantx2 + intQuantx 
intQuantzx = right(elementx,1)
rsProdx.MoveNext
wend
pesoz = intQuantx2 + 0 
session("peso") = pesoz
rsProdx.close
set rsProdx = Nothing
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
end if
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

'cria o valor do frete
session("estado2") = request("frete")%>
<div id="layer1" style="position:absolute; left:-2px; top:5px; z-index:4"><div id="layer1" style="position:absolute; left:181px; top:126px; z-index:4"><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg1%><br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div>
<%
'Retorna se a compra estiver vazia
if cstr(Session("orderID")) = "" then%>
<br><br><div align=center><p><font face=<%=fonte%> style=font-size:17px><b><%=strLg49%><br> <%=strLg50%><br><br></b><a href=default.asp><img src="<%=dirlingua%>/imagens/continuar.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg68%>';return true;" border=0></a><b></font></p></div><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table>
<%
response.end
else

'Calcula os itens no carrinho de compra
intOrderID = cstr(Session("orderID"))
set rsProd = abredb.Execute("SELECT * FROM pedidos WHERE idcompra='"&intOrderID&"';")
if rsProd.EOF and rsProd.BOF then
rsProd.close
set rsProd = Nothing
abredb.Close
set abredb = Nothing
Session("orderID") = ""
Response.Redirect "carrinhodecompras.asp"
else
do while not rsProd.EOF
element = "quant" & rsProd("idprod")
intQuant = Request.form(element)
intQuantz = rsProd("idprod")
if intQuant <> "" and isNumeric(intQuant) then
if intQuant = 0 then 
abredb.close
set abredb = nothing
response.redirect "carrinhodecompras.asp?estado="&estadozx 
end if
set rsProd1 = abredb.Execute("update pedidos set quantidade='"&intQuant&"' WHERE idcompra='"&intOrderID&"' AND idprod='"&intQuantz&"';")
end if
rsProd.MoveNext
loop
rsprod.close
set rsProd = Nothing
abredb.Close  
set abredb = Nothing
Response.Redirect "carrinhodecompras.asp"
end if
end if
abredb.Close  
set abredb = Nothing%>