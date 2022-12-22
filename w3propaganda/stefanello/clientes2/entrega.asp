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
<!--#include file="topo.asp"-->
<%
'Chama as variaveis
strUser = request.form("usuario")
strIdcompra = Request.Form("idcompra")
strPedido = Request.Form("pedido")
strNome = Request.Form("nome")
strCartao = Request.Form("cartao")
strPresente = Request.Form("presentesim")
msgpres = Request.Form("cartao")
strEndereco = request.form("endereco")
strBairro = request.form("bairro")
strCidade = request.form("cidade")
strEstado = request.form("estado")
strOutropais = request.form("outroz")
strCep = request.form("cepzz")
strPais = request.form("pais")
strFone = request.form("fone")	
intOrderID = Request.form("idcompra")
fretezz = request.form("frete")
totocompraz = request.form("totalcompra")

'Valida os dados
if strPais = "" then
strPais = "Brasil"
end if
If strEndereco = "" then
erro = "- " & strLg174 & "<br>" 
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=ok&erro2="&erro&"&endereco="&strEndereco&"&bairro="&strBairro&"&cidade="&strCidade&"&cep="&strCep&"&fone="&strFone&"&estado="&strEstado&"&pais="&strPais&"&outropais="&strOutropais&"&#pagamento"
end if
If strBairro = "" then
erro = "- " & strLg175 & "<br>" 
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=ok&erro2="&erro&"&endereco="&strEndereco&"&bairro="&strBairro&"&cidade="&strCidade&"&cep="&strCep&"&fone="&strFone&"&estado="&strEstado&"&pais="&strPais&"&outropais="&strOutropais&"&#pagamento"
end if
If strCidade = "" then
erro = "- " & strLg176 & "<br>" 
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=ok&erro2="&erro&"&endereco="&strEndereco&"&bairro="&strBairro&"&cidade="&strCidade&"&cep="&strCep&"&fone="&strFone&"&estado="&strEstado&"&pais="&strPais&"&outropais="&strOutropais&"&#pagamento"
end if
If strCep = "" then
erro = "- " & strLg177 & "<br>" 
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=ok&erro2="&erro&"&endereco="&strEndereco&"&bairro="&strBairro&"&cidade="&strCidade&"&cep="&strCep&"&fone="&strFone&"&estado="&strEstado&"&pais="&strPais&"&outropais="&strOutropais&"&#pagamento"
end if
If strFone = "" then
erro = "- " & strLg178 & "<br>" 
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=ok&erro2="&erro&"&endereco="&strEndereco&"&bairro="&strBairro&"&cidade="&strCidade&"&cep="&strCep&"&fone="&strFone&"&estado="&strEstado&"&pais="&strPais&"&outropais="&strOutropais&"&#pagamento"
end if

'Ve se foi escohida a opção presente
if strPresente = "on" then
strPresente = "Sim"
else
strPresente = "Não"
end if

'Formata a data
if CStr(len(Day(now))) = CStr("1") then
diazz =  "0"&Day(now)
else
diazz = Day(now)
end if
if CStr(len(Month(now))) = CStr("1") then
meszz =  "0"&Month(now)
else
meszz = Month(now)
end if
datazz = diazz&"/"&meszz&"/"&Year(now)

'SQL para gravar a compra
textosql = "UPDATE compras SET clienteid = '"&Cripto(request.form("usuario"),true)&"', presente = '"&strPresente&"', " _ 
& "msgpresente = '"&msgpres&"', status = 'Compra em Aberto', frete = '"&Cripto(request.form("frete"),true)&"', " _
& "totalcompra = '"&Cripto(request.form("totalcompra"),true)&"', endentrega = '"&Cripto(request.form("endereco"),true)&"', " _
& "bairroentrega = '"&Cripto(request.form("bairro"),true)&"', cidadeentrega = '"&Cripto(request.form("cidade"),true)&"', " _
& "estadoentrega = '"&request.form("estado")&"', " _
& "cepentrega = '"&Cripto(request.form("cepzz"),true)&"', paisentrega = 'Brasil', telentrega = '"&Cripto(request.form("fone"),true)&"', " _
& " datacompra = '"&datazz&"' WHERE idcompra = " & strIdcompra & ";"

'Grava a compra
set cadnovo = abredb.Execute(textosql)

'Cria as sessões para prosseguir a compra
session("frete1") = fretezz
session("pedido1") = strPedido
session("nome1") = strNome
session("ende1") = strEndereco
session("bairro1") = strBairro 
session("cidade1") = strCidade
session("est1") = strEstado
session("cep1") = strCep
session("pais1") = strPais
session("fone1") = strFone
session("compra1") = totocompraz

'Fecha o banco de dados
abredb.close
set abredb = nothing

response.redirect "formaspagamento.asp"
%>
