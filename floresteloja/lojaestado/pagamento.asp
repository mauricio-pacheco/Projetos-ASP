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
<!--#include file="checacartao.asp"-->
<%
'Chama as variaveis para finalizar compra
strPedido = Request.Form("pedido1")
strNome = Request.Form("nome1")
strEndereco = request.form("ende1")
strBairro = request.form("bairro1")
strCidade = request.form("cidade1")
strEstado = request.form("est1")
strCep = request.form("cep1")
strPais = request.form("pais1")
strFone = request.form("fone1")
strCompq = request.form("compra1")
freteqwy = request.form("frete1")
strCartao = Request.Form("cartao")
strTitular = Request.Form("titularcartao")
strExpmes = Request.Form("cartaomes")
strExpano = Request.Form("cartaoano")
strTotalCompra = Request.form("totalcompra")
numero = Request.Form("numerocartao")
vencimento = Request.form("cartaomes") & "/" & Request.form("cartaoano")

'Verifica o tipo de cartão de credito
if strCartao = "M" or strCartao = "V" or strCartao = "D" or strCartao = "A" then

'Tira letras do numero
s=""
for x=1 to len(numero)
ch=mid(numero,x,1)
if asc(ch)>=48 and asc(ch)<=57 then
s=s & ch
end if
next
numero = s

'Valida numeros genericos
If numero = "4111111111111111" OR numero = "5500000000000004" OR numero = "340000000000009" OR numero = "30000000000004" OR numero = "60110000000004" then
erro = strLg210
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro=" & erro & "&endereco="&strEndereco&"&bairro="&strBairro&"&cidade="&strCidade&"&cep="&strCep&"&fone="&strFone&"&estado="&strEstado&"&pais="&strPais&"&outropais="&strOutropais&"&#pagamento"
end if

if len(vencimento) > 7 or strTitular= "" then
erro = strLg251
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro=" & erro & "&endereco="&strEndereco&"&bairro="&strBairro&"&cidade="&strCidade&"&cep="&strCep&"&fone="&strFone&"&estado="&strEstado&"&pais="&strPais&"&outropais="&strOutropais&"&#pagamento"
end if

'Valida os numeros
If numero <> "" then
chk=checkcc(numero,strCartao)
If chk = 1 then
erro = strLg210
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 2 then
erro = strLg211
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 3 then
erro =  strLg212
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 4 then
erro =  strLg213
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 5 then
erro =  strLg214
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 6 then
erro =  strLg215
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 7 then
erro =  strLg216
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 8 then
erro = strLg210
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
end if
else
erro = strLg217
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
end if
If strExpmes = "" OR strExpano = "" then
erro = strLg218
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
end if
validadata = day(now) & "/" & strExpmes & "/" & strExpano
if cdate(validadata) < cdate(date) then
erro = strLg219
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
end  if
If strTitular = "" OR len(strTitular) <5 then
erro = strLg220
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
end if
end if

'Grava os dados da compra na matriz
intOrderID = Request.form("idcompra")
if strCartao = "M" then
txtpagamento = strLg221
strCartao = "1"
venccob = "-"
numerocob = "-"
end if
if strCartao = "V" then
txtpagamento = strLg222
strCartao = "0"
venccob = "-"
numerocob = "-"
end if
if strCartao = "A" then
txtpagamento = strLg223
strCartao = "3"
venccob = "-"
numerocob = "-"
end if
if strCartao = "D" then
txtpagamento = strLg224
strCartao = "2"
venccob = "-"
numerocob = "-"
end if
if strCartao = "sc" then
txtpagamento = strLg225
strCartao = "4"
venccob = cdate(date) + vencboleto
end if
if strCartao = "di" then
txtpagamento = strLg226
strCartao = "5"
venccob = cdate(date) + vencboleto
end if
if strCartao = "db" then
txtpagamento = strLg227
venccob = cdate(date) + vencboleto
'numerocob = "-"
strCartao = "6"
end if

if strCartao = "bl" then
txtpagamento = strLg266
venccob = cdate(date) + vencboleto
numerocob = "-"
strCartao = "7"
end if


'Formata  a data
datacob = venccob
if len(day(date)) = 1 then
diadata = "0"&day(date)
else
diadata = day(date)
end if
if len(month(date)) = 1 then
mesdata = "0"&month(date)
else
mesdata = month(date)
end if
entdiax = cdate(date) + diasentrega
if len(day(entdiax)) = 1 then
diadatax = "0"&day(entdiax)
else
diadatax = day(entdiax)
end if
if len(month(entdiax)) = 1 then
mesdatax = "0"&month(entdiax)
else
mesdatax = month(entdiax)
end if
entdiaxz = cdate(date) + vencboleto
if len(day(entdiaxz)) = 1 then
diadataxz = "0"&day(entdiaxz)
else
diadataxz = day(entdiaxz)
end if
if len(month(entdiaxz)) = 1 then
mesdataxz = "0"&month(entdiaxz)
else
mesdataxz = month(entdiaxz)
end if

'Valida a compra
set valida = abredb.Execute("SELECT status from compras WHERE idcompra = " & intOrderID & ";")
estatusdela = valida("status")
valida.close
set valida = nothing
if estatusdela = "Compra em Aberto" then

'Atualiza o pagamento e status da compra no banco de dados
set cadnovo = abredb.Execute("UPDATE compras SET pagamentovia = '"&strCartao&"', numero = '"&Cripto(numero,true)&"',vencimento = '"&Cripto(vencimento,true)&"', titular= '"&Cripto(strTitular,true)&"', status = '0' WHERE idcompra = " & intOrderID & ";")
set cadnovo = Nothing

'Corpo do e-mail de envio de compras
strMensagem = ""
strMensagem = strMensagem & " <!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>"
strMensagem = strMensagem & "  <HTML><HEAD>"
strMensagem = strMensagem & "  <META content='text/html; charset=iso-8859-1' http-equiv=Content-Type>"
strMensagem = strMensagem & "  <META content='Microsoft FrontPage 5.0' name=GENERATOR></HEAD>"
strMensagem = strMensagem & "  <BODY>"
strMensagem = strMensagem & "  <DIV align=justify>"
strMensagem = strMensagem & "  <TABLE border=0 cellSpacing=0 width=""98%"">"
strMensagem = strMensagem & "    <TBODY>"
strMensagem = strMensagem & "    <TR>"
strMensagem = strMensagem & "      <TD colSpan=4 height=42>"
strMensagem = strMensagem & "        <DIV align=center><font face="&fonte&"><B><FONT style=font-size:17px color=000000>"&tituloloja&"</FONT></B><BR><FONT style=font-size:11px>"&endereco11&" - "&bairro11&"<BR>"&cidade11&"/"&estado11&" - "&pais11&" - <a href='mailto:"&emailloja&"'>"&emailloja&"<BR></FONT></DIV></FONT></TD></TR>"
strMensagem = strMensagem & "    <TR>"
strMensagem = strMensagem & "      <TD colSpan=4><FONT face="&fonte&">"
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "       </FONT></TD></TR>"
strMensagem = strMensagem & "    <TR>"
strMensagem = strMensagem & "      <TD align=left colSpan=2><FONT face="&fonte&"><FONT color=#000000"
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'><B>Compra de "&strNome&"</B></FONT> "
strMensagem = strMensagem & "        </FONT>"
strMensagem = strMensagem & "      <TD align=right colSpan=2><B><FONT face="&fonte&"><FONT color=#000000"
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>Data: </B>"&diadata&"/"&mesdata&"/"&year(date)&" </FONT>"
strMensagem = strMensagem & "        <DIV></DIV></FONT></TD></TR>"
strMensagem = strMensagem & "    <TR>"
strMensagem = strMensagem & "      <TD colSpan=4>"
strMensagem = strMensagem & "        <DIV><FONT face="&fonte&">"
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "        </FONT></DIV>"
strMensagem = strMensagem & strPedidoz = replace(strPedido,",","")
strMensagem = strMensagem & "        <DIV><FONT face="&fonte&" style='FONT-SIZE: 11px'>Obrigado por comprar na"
strMensagem = strMensagem & "        "&nomeloja&"!<BR>Esta é a confirmação de que seu pedido de No. <STRONG>#"&strPedidoz&""
strMensagem = strMensagem & "        </STRONG>foi finalizado com sucesso.</FONT></DIV>"
strMensagem = strMensagem & "        <DIV><FONT face="&fonte&">"
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "        </FONT><FONT face="&fonte&"><FONT color=#000000"
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>  </DIV>"
strMensagem = strMensagem & "        <DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'><STRONG>Entrega</STRONG></FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify> </DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>Para que o pedido chegue o mais"
strMensagem = strMensagem & "        rápido possível, realizamos a entrega imediata do(s) item(ns) que já estão "
strMensagem = strMensagem & "        disponíveis no estoque. Os outros itens são enviados tão logo entregues "
strMensagem = strMensagem & "        pelos fornecedores, conforme o prazo informado no momento da "
strMensagem = strMensagem & "       compra.<BR>Para evitar extravios e garantir que a entrega seja feita corretamente, o"
strMensagem = strMensagem & "        pedido somente será deixado no endereço solicitado mediante a assinatura "
strMensagem = strMensagem & "        de quem for recebê-lo.</FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify> </DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&" style='FONT-SIZE: 11px'>"
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "        &nbsp;</DIV></FONT>"
strMensagem = strMensagem & "        <DIV align=left><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'><STRONG>Frete</STRONG></FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=left> </DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&"><FONT "
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>Todos os produtos comprados"
strMensagem = strMensagem & "        na&nbsp;"&nomeloja&" são acrescidos do valor de frete. O valor do frete é"
strMensagem = strMensagem & "        calculado somando-se uma taxa básica de envio com uma taxa de envio por "
strMensagem = strMensagem & "        produto. Ambas variam por região. O valor total do frete está associado ao"
strMensagem = strMensagem & "        pedido e sempre será cobrado integralmente no primeiro envio. Caso haja "
strMensagem = strMensagem & "        indisponibilidade de produtos para envios posteriores, a taxa cobrada por"
strMensagem = strMensagem & "        aquele item será restituída de acordo com a política de "
strMensagem = strMensagem & "        reembolso.<BR></FONT></FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>O&nbsp;envio parcial do pedido&quot; não implica no "
strMensagem = strMensagem & "          pagamento de vários fretes. A taxa de frete é sempre &quot; calculada em "
strMensagem = strMensagem & "          função da compra integral.</FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&" style='FONT-SIZE: 11px'><FONT "
strMensagem = strMensagem & "        face="&fonte&" style='FONT-SIZE: 11px'>  "
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "        </FONT></FONT></DIV>"
strMensagem = strMensagem & "        <DIV> </DIV>"
strMensagem = strMensagem & "       <DIV align=left><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'><STRONG>Pagamento</STRONG></FONT></DIV>"
strMensagem = strMensagem & "        <DIV> </DIV>"
strMensagem = strMensagem & "        <DIV align=left><FONT face="&fonte&" style='FONT-SIZE: 11px'>ATENÇÃO: como o"
strMensagem = strMensagem & "        pedido já foi concluído, não é possível alterar a forma de "
strMensagem = strMensagem & "        pagamento. Caso necessite mudar, entre em contato para que possamos esta "
strMensagem = strMensagem & "          cancelando a sua compra e realizando uma nova.</FONT></DIV>"
strMensagem = strMensagem & "        <DIV> </DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>Nos pedidos feitos com cartão"
strMensagem = strMensagem & "        de crédito, o débito é feito parcialmente à medida que os itens são "
strMensagem = strMensagem & "        disponibilizados para envio. Desta forma, pedidos com opção de "
strMensagem = strMensagem & "        parcelamento, podem sofrer alteração na quantidade de parcelas "
strMensagem = strMensagem & "        solicitadas.<BR>A confirmação de pagamento dos pedidos"
strMensagem = strMensagem & "        feitos com boleto bancário, depósito bancário simples ou identificado e "
strMensagem = strMensagem & "          transferencia "
strMensagem = strMensagem & "        deve ser feita em até 5 (cinco) úteis , é preciso entrar em contato via telefone ou e-mail nos enviando os dados para confirmação de pagamento.</FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify> </DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&" style='FONT-SIZE: 11px'>LEMBRE-SE de"
strMensagem = strMensagem & "        acrescentar este prazo (até 5 dias úteis) ao prazo de envio do(s) item(ns) "
strMensagem = strMensagem & "        do pedido citado(s) abaixo:</FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify><br>"
strMensagem = strMensagem & "          <font face= "&fonte&"><strong><font style=font-size: 11px>"
strMensagem = strMensagem & "          Dados dos Contas Bancárias:</font></strong></font><br>"
strMensagem = strMensagem & " &nbsp;<table border=0 cellSpacing=0 width=575>"
strMensagem = strMensagem & "    				 	 		<tr><font face= "&fonte&"  style=font-size:11px;color:000000> "
strMensagem = strMensagem & "                               <td>"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" ><b>Banco:</b> "
strMensagem = strMensagem & "                               Bradesco<br><b>Agência:</b> 1599"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber8 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=    width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td><td>"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" ><b>Conta "
strMensagem = strMensagem & "                               Poupança:</b> 1004603-3<br><b>Para: </b>Edilson "
strMensagem = strMensagem & "                               Lourenço N de Souza"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber9 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=    width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td>"
strMensagem = strMensagem & " 							           </font>"
strMensagem = strMensagem & " 							           </tr>"
strMensagem = strMensagem & "    				 	 		<tr><font face= "&fonte&"  style=font-size:11px;color:000000> "
strMensagem = strMensagem & "                               <td>"
strMensagem = strMensagem & "                               <font style= font-family:"&fonte&";font-size:11px;  face= "&fonte&"  color= #000080 ><b>Banco:</b> "
strMensagem = strMensagem & "                               Itaú<br><b>Agência:</b> 0874"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber7 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style= font-family:"&fonte&";font-size:11px;color:#000080;  face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=    width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td><td>"
strMensagem = strMensagem & "                               <font style= font-family:"&fonte&";font-size:11px;  face= "&fonte&"  color= #000080 ><b>Conta "
strMensagem = strMensagem & "                               Poupança:</b> 33818-9<br><b>Para: </b>Evandro "
strMensagem = strMensagem & "                               Lourenço N de Souza"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber10 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style= font-family:"&fonte&";font-size:11px;color:#000080;  face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=   width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td>"
strMensagem = strMensagem & " 							           </font>"
strMensagem = strMensagem & " 							           </tr>"
strMensagem = strMensagem & "    				 	 		<tr><font face= "&fonte&"  style=font-size:11px;color:000000> "
strMensagem = strMensagem & "                               <td><font style=font-family:"&fonte&";font-size:11px;color:#000000;><b>Banco:</b> "
strMensagem = strMensagem & "                               Caixa Econômica Federal<br><b>Agência:</b> 1584"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber6 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=    width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td><td><font style=font-family:"&fonte&";font-size:11px;color:#000000;><b>Conta Corrente:</b> "
strMensagem = strMensagem & "                               2993-6<br><b>Para: </b>Edilson Lourenço N de Souza"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber11 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=    width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td>"
strMensagem = strMensagem & " 							           </font>"
strMensagem = strMensagem & " 							           </tr>"
strMensagem = strMensagem & " 						</table>"
strMensagem = strMensagem & "          <p><br>"
strMensagem = strMensagem & " &nbsp;</DIV>"
strMensagem = strMensagem & "        <DIV><FONT face=Arial style='FONT-SIZE: 11px'><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>  "
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "        </FONT></FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=left><FONT face="&fonte&" style='FONT-SIZE: 11px'><FONT "
strMensagem = strMensagem & "        face="&fonte&" size=2> </FONT></FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=left><FONT face="&fonte&" style='FONT-SIZE: 11px'><STRONG>Seu"
strMensagem = strMensagem & "        Pedido</STRONG></FONT></FONT></FONT><FONT face="&fonte&" "
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'><BR><BR></DIV></DIV></FONT></TD></TR>"
strMensagem = strMensagem & "    <TR>"
strMensagem = strMensagem & "      <TD colSpan=2><FONT face="&fonte&"><FONT color=#000000 style='COLOR: #000000; FONT-SIZE: 11px'><B>Endereço:"
strMensagem = strMensagem & "        </B>"&strEndereco&"<BR><B>Bairro: </B>"&strBairro&" "
strMensagem = strMensagem & "        <BR><B>Local:</B> "&strCidade&"-"&strEstado&" </FONT></FONT></TD>"
strMensagem = strMensagem & "      <TD colSpan=2><FONT face="&fonte&"><FONT color=#000000 style='COLOR: #000000; FONT-SIZE: 11px'><B>CEP:</B> "
strMensagem = strMensagem & "        "&strCep&" <BR><B>País:</B> "&strPais&" <BR><B>Telefone:</B> "&strFone&" "
strMensagem = strMensagem & "        </FONT></FONT></TD></TR>"
strMensagem = strMensagem & "    <TR bgColor=#ffffff>"
strMensagem = strMensagem & "      <TD colSpan=4><b><FONT face="&fonte&"><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table><FONT color=#000000 style='COLOR: #000000; FONT-SIZE: 11px'>Forma de Pagamento:</b> "&txtpagamento&"</font></font><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table></TD></TR>"
strMensagem = strMensagem & "    <TR bgColor="&cor3&">"
strMensagem = strMensagem & "      <TD align=left noWrap vAlign=center width='15%'><FONT color=#000000"
strMensagem = strMensagem & "        face="&fonte&" style='COLOR: #000000; FONT-SIZE: 11px' "
strMensagem = strMensagem & "        style='BACKGROUND-COLOR: "&cor3&"'><STRONG>Quantidade<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "      <TD align=left noWrap vAlign=center width='44%'><FONT color=#000000 "
strMensagem = strMensagem & "        face="&fonte&" style='COLOR: #000000; FONT-SIZE: 11px' "
strMensagem = strMensagem & "        style='BACKGROUND-COLOR: "&cor3&"'><STRONG>Produto<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "      <TD align=left vAlign=center width='16%'><FONT color=#000000 face="&fonte&" "
strMensagem = strMensagem & "        style='COLOR: #000000; FONT-SIZE: 11px' style='BACKGROUND-COLOR: "&cor3&"'><STRONG>Preço "
strMensagem = strMensagem & "        Unitário<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "      <TD align=right noWrap vAlign=center width='25%'><FONT color=#000000"
strMensagem = strMensagem & "        face="&fonte&" style='COLOR: #000000; FONT-SIZE: 11px' style='BACKGROUND-COLOR: "&cor3&"'><STRONG>Preço"
strMensagem = strMensagem & "        Total<STRONG></FONT></STRONG></STRONG></TD></TR>"

'Chama os produtos comprados

set pedidos = abredb.Execute("SELECT idprod, quantidade FROM pedidos WHERE idcompra='"&intOrderID&"';")
while not pedidos.EOF
idprod = pedidos("idprod")
quantidade = pedidos("quantidade")
set produtos = abredb.Execute("SELECT preco, nome, peso FROM produtos WHERE idprod="&idprod&";")
preco = produtos("preco")
peso = produtos("peso")
nome = produtos("nome")

intProdID = idprod
strProdNome = nome
pesoz = peso
intProdPric = preco
intQuant = quantidade
prodvalor = formatNumber(intProdPric,2)
prodvalort = formatNumber((intQuant * intProdPric),2)

strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD align=left vAlign=center width='15%'><FONT face="&fonte&" size=2><FONT"
strMensagem = strMensagem & "      face="&fonte&" style='COLOR: #000000; FONT-SIZE: 11px'>"&intQuant&" </FONT></FONT></TD>"
strMensagem = strMensagem & "   <TD align=left width='44%'><FONT face="&fonte&" "
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'> "&strProdNome&" </FONT></TD>"
strMensagem = strMensagem & "    <TD align=right width='16%'><FONT face="&fonte&" "
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'>" & strLgMoeda & " " & prodvalor&" </FONT></TD>"
strMensagem = strMensagem & "    <TD align=right width='25%'><FONT face="&fonte&" "
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'>" & strLgMoeda & " " &prodvalort&" </FONT></TD></TR>"

pedidos.MoveNext
wend
pedidos.Close
set pedidos = Nothing
produtos.Close
set produtos = Nothing

strMensagem = strMensagem & "  <TR bgColor="&cor3&">"
strMensagem = strMensagem & "    <TD colSpan=4 heigth='5'></TD>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD align=left colSpan=2 vAlign=center><FONT face="&fonte&""
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG>Total da"
strMensagem = strMensagem & "      compra<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "    <TD align=right colSpan=2 vAlign=center><FONT face="&fonte&""
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG><B>" & strLgMoeda & " "&formatnumber(strCompq,2)&"</B>"
strMensagem = strMensagem & "      <STRONG></FONT></STRONG></STRONG></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "   <TD align=left colSpan=2 vAlign=center><FONT face="&fonte&""
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG>Valor da Entrega<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "    <TD align=right colSpan=2 vAlign=center><FONT face="&fonte&" "
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG><B>" & strLgMoeda & " " &formatnumber(request.form("frete1"),2)&"</B>"
strMensagem = strMensagem & "      <STRONG></FONT></STRONG></STRONG></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD align=left colSpan=2 vAlign=center><FONT face="&fonte&""
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG>Sua "
strMensagem = strMensagem & "      compra<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "    <TD align=right colSpan=2 vAlign=center><FONT face="&fonte&""
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG><B>" & strLgMoeda & " " &formatnumber(Request.form("totalae"),2)&"</B>"
strMensagem = strMensagem & "      <STRONG></FONT></STRONG></STRONG></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4></TD></TR>"
strMensagem = strMensagem & "  <TR bgColor=#ffffff>"
strMensagem = strMensagem & "    <TD colSpan=4><FONT color=#000000 style='FONT-SIZE: 11px'>"
strMensagem = strMensagem & "      <DIV align=left> </DIV>"
strMensagem = strMensagem & "      <DIV align=left><FONT face=Arial size=2>"
strMensagem = strMensagem & "      <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "      &nbsp;</FONT></DIV>"
strMensagem = strMensagem & "      <DIV align=left><FONT face="&fonte&"><FONT style='FONT-SIZE: 11px'>LEMBRE-SE"
strMensagem = strMensagem & "      de que os dados acima devem estar corretos e completos para não haver "
strMensagem = strMensagem & "      demora e dificuldade na entrega do pedido.<BR></DIV>"
strMensagem = strMensagem & "      <DIV> </DIV>"
strMensagem = strMensagem & "      <DIV align=left><FONT face="&fonte&"><FONT"
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'>Atenciosamente,<BR>Atendimento ao"
strMensagem = strMensagem & "      Cliente</FONT><BR></FONT></DIV></FONT></TD>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4 vAlign=top>"
strMensagem = strMensagem & "      <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "    </TD></TD>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4><FONT face="&fonte&"><B><FONT style=font-size:13px>Equipe"
strMensagem = strMensagem & "      "&nomeloja&"</FONT></B><BR><FONT face="&fonte&" "
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><A "
strMensagem = strMensagem & "      href='http://"&urlloja&"'>"&urlloja&"</A><BR><FONT"
strMensagem = strMensagem & "      face="&fonte&" style='COLOR: #000000; FONT-SIZE: 11px'><A "
strMensagem = strMensagem & "      href='mailto:"&emailloja&"'>"&emailloja&"</A><BR></FONT></FONT></FONT></TD></TR></TBODY></TABLE></DIV></BODY></HTML>"

'Envia o e-mail


%>
<!--#include file="email.asp"-->
<%
EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), emailloja, "", session("usuario"), "Confirmação de compra na "&nomeloja&"!", strMensagem
EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), emailloja, "", emailloja, "Compraram na "&nomeloja&"!", "strMensagem"

else
end if%>
  	  		   <table><tr><td align="left" valign="top">
			   				  <table border="0" cellspacing="4" cellpadding="4" width=580><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='Home';return true;"><b>Home</b></a> » Compra concluída!<br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div>
							  		 <table border=0 cellSpacing=0 width=575><TR><TD colSpan=4 height=42><DIV align=center><B><FONT style=font-size:17px color=000000><%=tituloloja%></FONT></B><BR><FONT style=font-size:11px><%=endereco11%> - <%=bairro11%><BR><%=cidade11%>/<%=estado11%> - <%=pais11%> - <a href="mailto:<%=emailloja%>" style=text-decoration:none;><%=emailloja%><BR></DIV></TD></TR>
									 <tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
									 <tr><td colSpan=2 align=left><FONT style=font-size:11px color=000000><B>Compra de <%=Request.Form("nome1")%></B><TD colSpan=2 align=right><B><FONT style=font-size:11px color=000000>Data: </B> <%=diadata&"/"&mesdata&"/"&year(date)%></div></TD></TR>
									 <tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
									 <tr><td colspan=4><font style=font-size:11px;color:000000><b>Dados da entrega e do pedido </b></td></tr>
									 <tr><td colSpan=2><font style=font-size:11px color=000000><b>Endereço: </b><%=strEndereco%><br><b>Bairro: </b> <%=strBairro%><br><b> Local:</b> <%=strCidade%>-<%=strEstado%></td><td colSpan=2><font style=font-size:11px color=000000><b> CEP:</b> <%=strCep%><br><b> País:</b> <%=strPais%><br><b> Telefone:</b> <%=strFone%></td></TR>
<%
valortotalx = request.form("totalae")

'Chama o nome da forma de pagament escolhida
if strCartao="0" then
forma = strLg222
end if
if strCartao="1" then
forma = strLg221
end if
if strCartao="2" then
forma = strLg224
end if
if strCartao="3" then
forma = strLg223
end if
if strCartao="4" then
forma = strLg225
end if
if strCartao="6" then
forma = "Transferência Eletrônica"
end if
if strCartao="5" then
forma = "Depósito Bancário"
end if
if strCartao="7" then
forma = "Boleto Bancário"
end if
%>
	  			  		   		<tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Informações sobre sua compra</b></td></tr>
								<tr><td width=30%><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Sub-total:</b>&nbsp;<%= strLgMoeda & " " & formatnumber(strCompq,2)%></td><td width=20%><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Frete:&nbsp;</b><%= strLgMoeda & " " & formatnumber(request.form("frete1"),2)%></td><td width=25%><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Valor Total:&nbsp;</b><%=strLgMoeda & " " & formatnumber(valortotalx,2)%></td><td width=40%></td></tr>
								<tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Informações de pagamento (<%=forma%>)</b></td></tr>
<%
'Chama pela forma de pagamento a tela final
if strCartao="0" OR strCartao="1" OR strCartao="2" OR strCartao="3" then%>
   				 				  <tr><td colspan=2><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>Últimos Dígitos:</b> <%=left(numero,2) & "/" & right(numero,5)%><br><b>Titular:</b> <%=strTitular%> <br></td><td colspan=2 valign=top><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>Expiração do Cartão:</b> <%=strExpmes & "/" & strExpano%><br></td></tr> <tr><td colspan=4><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><br><center><b>Status da transação:</b><font color=#a51905> <b>Compra confirmada com a operadora do <%=forma%>!</font></b></center></td></tr>
<%end if
if strCartao="4" then%>
   				 	   			  <tr><td colspan=4><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><center><font color=#a51905> <br><b>Seu pedido deverá ser retirado na agência dos CORREIOS mais próxima do endereço informado para entrega e o pagamento será feito no ato, agradeçemos a preferência! </b></font></center></td></tr>
<%
end if
if strCartao="5" then
%>
   				 	 		<tr><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	 		<tr><td colspan=2 bgcolor="#F0F0F0">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><b>Banco:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg267%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><br><b>Agência:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg268%></td><td colspan=2 bgcolor="#F0F0F0">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000000; font-weight:700" face="<%=fonte%>">
                              <%=strLg276%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><b>:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg269%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><br><b>Para: </b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg270%></td></tr>
   				 	 		<tr><td colspan=2>
                              <font style="font-family:<%=fonte%>;font-size:11px; color:000000" face="<%=fonte%>" color="#000080">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;" face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style="font-family:<%=fonte%>;font-size:11px; color:000000" face="<%=fonte%>" color="#000080">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;" face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	 		<tr><td colspan=2 bgcolor="#F0F0F0">
                              <font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><b>Banco:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg271%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><br><b>Agência:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg272%></td><td colspan=2 bgcolor="#F0F0F0">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;font-weight:700" face="<%=fonte%>">
                              <%=strLg276%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><b>:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg273%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><br><b>Para: </b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg274%></td></tr>
   				 	 		<tr><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	 		<tr><td colspan=2 bgcolor="#F0F0F0"><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>Banco:</b> <%=bancopag%><br><b>Agência:</b> <%=agpag%>
                              </td><td colspan=2 bgcolor="#F0F0F0">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000000; font-weight:700" face="<%=fonte%>">
                              <%=strLg275%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>:</b> <%=contapag%><br><b>Para: </b><%=pagpara%>
                              </td></tr>
							<tr><td colspan=4><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><center>
                              <p align="left">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:000000;" face="<%=fonte%>" color="#a51905">
                              <b><br>
                              Código para o Depósito: #</b></font><font style="font-size:11px; color:000000" color=000000 face="<%=fonte%>"><b><%=replace(strPedido,",","")%></b></font></p>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><center>
                              <p><font color=#a51905> <b>Envie-nos um e-mail com o código de depósito para confirmação do pagamento. Após a verificação, seu pedido será liberado imediatamente para entrega!</b></font></p>
                              </center></center></td></tr>
<%
'Atualiza o numero do deposito identificdo
end if
if strCartao="6" then%>
   				 	   		<tr><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	   		<tr><td colspan=2 bgcolor="#F0F0F0">
                              <font face="<%=fonte%>" style=font-size:11px;color:000000>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><b>Banco:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg267%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><br><b>Agência:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg268%></font></td>
                              <td colspan=2 bgcolor="#F0F0F0">
                              <font face="<%=fonte%>" style=font-size:11px;color:000000>
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000000; font-weight:700" face="<%=fonte%>">
                              <%=strLg276%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><b>:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg269%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><br><b>Para: </b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg270%></font></td></tr>
   				 	   		<tr><td colspan=2>
                              <font style="font-family:<%=fonte%>;font-size:11px; color:000000" face="<%=fonte%>" color="#000080">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;" face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style="font-family:<%=fonte%>;font-size:11px; color:000000" face="<%=fonte%>" color="#000080">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;" face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	   		<tr><td colspan=2 bgcolor="#F0F0F0">
                              <font face="<%=fonte%>" style=font-size:11px;color:000000>
                              <font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><b>Banco:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg271%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><br><b>Agência:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg272%></font></td>
                              <td colspan=2 bgcolor="#F0F0F0">
                              <font face="<%=fonte%>" style=font-size:11px;color:000000>
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;font-weight:700" face="<%=fonte%>">
                              <%=strLg276%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><b>: </b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg273%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><br><b>Para: </b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg274%></font></td></tr>
   				 	   		<tr><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	   		<tr><td colspan=2 bgcolor="#F0F0F0"><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>Banco:</b> <%=bancopag%><br><b>Agência:</b> <%=agpag%>
                              </td><td colspan=2 bgcolor="#F0F0F0">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000000; font-weight:700" face="<%=fonte%>">
                              <%=strLg275%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>:</b> <%=contapag%><br><b>Para: </b><%=pagpara%>
                              </td></tr>
							           </font>
							<tr><td colspan=4>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><center>
                              <p><font color=#a51905> <b><br>
                              <br>
                              Após a confirmação do pagamento seu pedido será imediatamente liberado para entrega!</b></font></p>
                              </center></td></tr>
<%
end if

'* ANTENÇÃO: precisa ter no banco a tabela BOLETO com o campo NOSSO. *
'Pagamento por Boleto

if strCartao="7" then

'Pega o último nosso número
Set rsNosso = abredb.Execute("SELECT nosso from boleto;")
strNosso = rsNosso("nosso")

strNosso = strNosso + 1

'Atualiza o nosso número
set rsNosso = abredb.Execute("UPDATE boleto SET nosso = '"&strNosso&"';")

%>

							  <tr><td colspan=4>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><center>
                              <p>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10">
<script LANGUAGE="JavaScript">
       function Boleto() {
                remote = window.open("","remotewin","'toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=no,copyhistory=no,width=720,height=500'");
                remote.location.href = "<%=caminho_boleto%>?sacador=<%=Request.Form("nome1")%>&endereco=<%=strEndereco%>&bairro=<%=strBairro%>&cidade=<%=strCidade%>&estado=<%=strEstado%>&cep=<%=strCep%>&nossonumero=<%=strNosso%>&datadocumento=<%=diadata&"/"&mesdata&"/"&year(date)%>&datavencimento=<%=diadatax&"/"&mesdatax&"/"&year(entdiax)%>&valordocumento=<%=formatnumber(valortotalx,2)%>&numerodoc=<%=replace(strPedido,",","")%>";
                remote.opener = window;
                remote.opener.name = "imagem1";
                }

                              </script>
                                  </font></font><font color=#a51905><b><br>
                              <img border="0" src="<%=dirlingua%>/imagens/boleto_news_2.gif"><br>
                              </b></font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></font></font><font color=#a51905><b><br>
                              <a href="javascript:Boleto()">
                              <img border="0" src="<%=dirlingua%>/imagens/ver_boleto.gif"></a><br>
                              <br>
                              Após a confirmação do pagamento do BOLETO seu pedido será imediatamente liberado para entrega!</b></font></p>
                              </center></td></tr>

<%
'rsNosso.close
'Set rsNosso = Nothing
end if
%>
	  	  					<tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Entrega da compra
                              após a confirmação do pagamento</b></td></tr>
							<tr><td colspan=2><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Compra efetuada em:</b> <%=diadata&"/"&mesdata&"/"&year(date)%></td></tr>
							<tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
							<tr bgcolor=#ffffff><td colspan=4><font style=font-size:11px color=000000><center>Detalhes e informações sobre a sua compra já foram enviadas para o e-mail <b><%=request.form("email1")%></b>.<br>O número do seu pedido é <b>#<%=replace(strPedido,",","")%></b>, anote-o em um local seguro.<br>Sua sessão foi finalizada e todos os produtos do seu Carrinho de Compras foram removidos.</tr>
<%
'Abandona a sessão de compras do cliente
session.abandon %>
				   	  		  <tr><td colspan=4 valign=top><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></tr></td><form action=fim.asp><input type=hidden name=usuario value="<%= strUser %>">
							  <tr align=center><td colspan=2 valign=top><div id="layer1"><input type="image" name="fecha" src=<%=dirlingua%>/imagens/finaliza.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='Finalizar Compras';return true;"></div></td><td colspan=2 valign=top>
                                </form><div id="layer1"><input type="image" name="fecha" src=<%=dirlingua%>/imagens/printrecibo.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='Imprimir Recibo';return true;" OnClick="javascript: print()"></div></td></tr>
						</table></form></td></tr>
				</table></td></tr>
		</table>
		</font></font></font></b>
		<!-- #include file="baixo.asp" -->