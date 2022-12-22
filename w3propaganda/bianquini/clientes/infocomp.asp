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
'Requisita o id da compra
variavel = request.querystring("pedido")
if variavel = "" then response.redirect "minhascompras.asp" %>

		   <table><tr><td align="left" valign="top">
		   				  <table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <a href=minhascompras.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg10%>';return true;"><b><%=strLg10%> </b></a> » <%=strLg186%> # <%=variavel%><br><br><div align=left><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div>
<%
on error resume next

Set dados = abredb.Execute("SELECT email,nome FROM clientes WHERE email='"&Cripto(session("usuario"),true)&"';")
if dados.EOF then
nomez = ""
else
nomez = Cripto(dados("nome"),false)
end if
dados.Close
set dados = Nothing

'Chama os dados da compra
set valor = abredb.Execute("SELECT clienteid, idcompra, pedido FROM compras WHERE pedido="& variavel & " AND status <> 'Compra em Aberto'")

if valor.EOF then
user = "xxxxxxxxxxxxxxxxxxxxxx"
else
user = Cripto(valor("clienteid"),false)
compra = valor("idcompra")
end if
valor.close
set valor = nothing
usua =  session("usuario")

'Verifica se o usuario logado é o autor da compra
if user<>usua then%>
   			               <br><br><br><center><b><%=strLg187%>, <br><%=strLg188%>!</b></center><br><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><center><a HREF="javascript: history.back()" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="tahoma,arial,helvetica" style=font-size:11px>:: <b><%=strLg41%></b> ::</a></font></center></center></td></tr>
			            </table></td></tr>
		  </table>
		 <!-- #include file="baixo.asp" -->
<%
response.end
else%>
	  <br><b><%=strLg189%>&nbsp;<%=nomez%></b><br><br><div align=center>
	  				<table width=95%>
						   <tr><td bgcolor=<%=cor3%>><font face=<%=fonte%> style=font-size:11px;color:000000><b>&nbsp;<%=strLg%></b></td><td bgcolor=<%=cor3%>><font face=<%=fonte%> style=font-size:11px;color:000000><b>&nbsp;<%=strLg59%></b></td><td bgcolor=<%=cor3%>><font face=<%=fonte%> style=font-size:11px;color:000000><b>&nbsp;<%=mid(strLg58,1,5)%>.</b></td><td bgcolor=<%=cor3%>><font face=<%=fonte%> style=font-size:11px;color:000000><b>&nbsp;<%=strLg61%></b></td></tr>
<%
'Chama as quantidades compradas

set rs2 = abredb.Execute("SELECT idprod,quantidade FROM pedidos where idcompra='"&compra&"';")
while not rs2.eof
quantidade = rs2("quantidade")
codigo=rs2("idprod")
set rs = abredb.Execute("SELECT nome,preco,precovelho FROM produtos where idprod="&codigo&";")

'Calcula os valores do produto
valor = rs("preco") * quantidade
preconormal = formatnumber(rs("preco"),2)
precototal = formatnumber(valor,2)%>
		   	 			<tr><td><font face=<%=fonte%> style=font-size:11px;color:000000>#<%=codigo%></td><td><font face=<%=fonte%> style=font-size:11px;color:000000><%=rs("nome")%></td><td align=center><font face=<%=fonte%> style=font-size:11px;color:000000><%=quantidade%></td><td align=right><font face=<%=fonte%> style=font-size:11px;color:000000><%= strLgMoeda & " " & precototal%></td></tr>
<%
rs2.movenext
wend
rs.close
set rs = nothing
rs2.close
set rs2 = nothing
'Chama os dados do produto
set valor = abredb.Execute("SELECT status,datacompra,frete,totalcompra,pagamentovia FROM compras where pedido="&variavel&";")

'Formata o valor da compra
totalcompra = Cripto(valor("totalcompra"),false)
totalfrete = Cripto(valor("frete"),false)
status = valor("status")
pagamento = valor("pagamentovia")
intcomprasz =  totalcompra + 1 + totalfrete - 1
comprasz = intcomprasz
comprasz = replace(comprasz,"-","")
data = valor("datacompra")
valor.close
set valor = nothing

'Mostra o tipo de pagamento
Select Case pagamento
Case 0
ver = strLg96&": Visa"
Case 1
ver = strLg96&": Mastercard"
Case 2
ver= strLg96&": Dinners"
Case 3
ver = strLg96&": American Express"
Case 4
ver = strLg190
Case 5
ver = strLg191
Case 6
ver = strLg192
End Select

'Mostra o status da compra
if status = "0"  then
estatus = strLg193
end if
if status = "1" then
estatus = strLg194
end if
if status = "2"  then
estatus = strLg195
end if
if status = "3" then
estatus = strLg196
end if
if status = "4" then
estatus = strLg197
end if
if status = "5" then
estatus = strLg198
end if
if status = "6" then
estatus = strLg199
end if
if status="Completada" then
estatus = strLg193
end if

'Formata os valores da compra
comprazw = formatnumber(comprasz,2) 
totalfretezw = formatnumber(totalfrete,2)
totalcomprazw = formatnumber(totalcompra,2)

'Formata a data
if len(day(data)) = 1 then
diadata = "0"&day(data)
else
diadata = day(data)
end if
if len(month(data)) = 1 then
mesdata = "0"&month(data)
else
mesdata = month(data)
end if
entdiax = cdate(data) + diasentrega
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
%>
  	  	 </table>
		<table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table>
			<table width=95%>
				   <tr><td><font face=<%=fonte%> style=font-size:11px;color:000000><%=strLg63%></td><td align=right><font face=<%=fonte%> style=font-size:11px;color:000000><b><%= strLgMoeda & " " & comprazw%></b></td></tr>
			</table><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table>
			<table width=95%>
				   <tr><td><font face=<%=fonte%> style=font-size:11px;color:000000><%=strLg201%></td><td align=right><font face=<%=fonte%> style=font-size:11px;color:#a51905><b><%=estatus%></b></td></tr>
				   <tr><td><font face=<%=fonte%> style=font-size:11px;color:000000><%=strLg91%></td><td align=right><font face=<%=fonte%> style=font-size:11px;color:000000><b><%=ver%></b></td></tr>
			</table><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table>
			<table width=95%>
				   <tr><td><font face=<%=fonte%> style=font-size:11px;color:000000><%=strLg202%></td><td align=right><font face=<%=fonte%> style=font-size:11px;color:000000><b><%=diadata&"/"&mesdata&"/"&year(data)%></b></td></tr>
			</table><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><a HREF="minhascompras.asp" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="tahoma,arial,helvetica" style=font-size:11px>:: <b><%=strLg41%></b> ::</a></font></center></td></tr>
		</table></td></tr>
</table>
<!-- #include file="baixo.asp" -->
<%end if%>