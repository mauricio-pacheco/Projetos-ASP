<%
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################
'#
'#  C�DIGO: VirtuaStore Vers�o 1.2 - Copyright 2001-2003 VirtuaWorks                                    
'#  URL: www.virtuastore.com.br / www.virtuaworks.com.br                                                           
'#  E-MAIL: webmaster@virtuaworks.com.br                                                                                          
'#  AUTORES: Ot�vio Dias(Desenvolvedor) / Jone Bandinelli(Desenvolvedor) / Daniel Kern(Revis�o)                
'# 
'#     Este programa � um software livre; voc� pode redistribu�-lo e/ou 
'#     modific�-lo sob os termos do GNU General Public License como 
'#     publicado pela Free Software Foundation.
'#     � importante lembrar que qualquer altera��o feita no programa 
'#     deve ser informada e enviada para os criadores, atrav�s de e-mail 
'#     ou da p�gina de onde foi baixado o c�digo.
'#
'#  //-------------------------------------------------------------------------------------
'#  // LEIA COM ATEN��O: O software VirtuaStore 1.2 deve conter as frases
'#  // "Powered by VirtuaStore 1.2" ou "Software derivado de VirtuaStore 1.2" e 
'#  // o link para o site http://www.virtuastore.com.br no cr�ditos da 
'#  // sua loja virtual para ser utilizado gratuitamente. Se o link e/ou uma das 
'#  // frases n�o estiver presentes ou visiveis este software deixar� de ser
'#  // considerado Open-source(gratuito) e o uso sem autoriza��o ter� 
'#  // penalidades judiciais de acordo com as leis de pirataria de software.
'#  //--------------------------------------------------------------------------------------
'#      
'#     Este programa � distribu�do com a esperan�a de que lhe seja �til,
'#     por�m SEM NENHUMA GARANTIA. Veja a GNU General Public License
'#     abaixo (GNU Licen�a P�blica Geral) para mais detalhes.
'# 
'#     Voc� deve receber a c�pia da Licen�a GNU com este programa, 
'#     caso contr�rio escreva para
'#     Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
'#     Boston, MA  02111-1307  USA
'# 
'#     Para enviar suas d�vidas, sugest�es e/ou contratar a VirtuaWorks 
'#     Internet Design entre em contato atrav�s do e-mail 
'#     contato@virtuaworks.com.br ou pelo endere�o abaixo: 
'#     Rua Ven�ncio Aires, 1001 - Niter�i - Canoas - RS - Brasil. Cep 92110-000.
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

'IN�CIO DO C�DIGO
'----------------------------------------------------------------------------------------------------------------
'Este c�digo est� otimizado e roda tanto em Windows 2000/NT/XP/ME/98 quanto em servidores UNIX-LINUX com chilli!ASP
%>
<!-- #include file="topo.asp" -->
<%
'Requisita os dados para gravar o produto comprado
intOrderID = cstr(Session("orderID"))
intProdID = request.querystring("prodid")
tipo = request.querystring("item")
if tipo = "existente" then
txtInfo = strLg156
else
txtInfo = strLg157
end if
Set rsProdInfo = abredb.Execute("SELECT * FROM produtos where idprod="&intProdID&"")
idsessao = rsProdInfo("idsessao")
nome = rsProdInfo("nome")
rsProdinfo.close
set rsProdinfo = nothing

'Chama o nome da sess�o
Set nomes = abredb.Execute("SELECT * FROM sessoes where id="&idsessao)
strNome = nomes("nome")
nomes.close
set nomes = nothing
%>
  		  <table><tr><td align="left" valign="top">
		  				 <table border="0" cellspacing="4" cellpadding="4" width=590>
						  <tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> � <a href=sessoes.asp?item=<%=idsessao%> style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%= trim(server.HtmlEncode(strNome)) %>';return true;"><b><%= strNome %></b></a> � <a href=produtos.asp?produto=<%=intProdID%> style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%= replace(trim(server.HtmlEncode(nome)), chr(10), "") %>';return true;"><b><%= nome %></b></a> � <%=strLg54%><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><p align=center><font style=font-size:17px; color=#000000><b><%= txtInfo %></b></font><p align=center><a href=produtos.asp?produto=<%=intProdID%> style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font  style=font-size:11px;><b>:: <%=strLg41%> ::</b></a>&nbsp;<br><a href=carrinhodecompras.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg51%>';return true;"><b>:: <%=strLg51%> ::</b></a></p><p align=center></b><a href=default.asp><img src="<%=dirlingua%>/imagens/continuar.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg68%>';return true;" border=0></a></p> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></font><b><%=strLg52%></b><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table>
						  				<table align=left><tr>








<%'Seleciona os dados para oferta
'=========================seleciona idprod e idcompra da tabela pedidos=========================
set ofertas = abredb.Execute("select idprod,idcompra from pedidos where idprod='"&intProdID&"';")
if ofertas.eof then
randomize
numx = right(rnd,1)

'=========================seleciona 3 produtos para randomizar caso n�o tenha compra ainda=========================
set fim= abredb.Execute("select idprod,nome,preco,estoque from produtos")
contador = 0
while not fim.eof and contador < 3
precito = formatNumber(fim("preco"),2)%>
  		  							  			<td>
													<table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
													 	   <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
														    	  <table align=center width=177 cellspacing="1" cellpadding="1">
																   <tr><td valign=center width=180 height=100><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=fim("nome")%></b><br><br><b><%=strLg29%></b>&nbsp;<%= strLgMoeda & " " & precito%><br><b><%=strLg28%></b> <%if fim("estoque") = "s" then response.write strLg26 else response.write strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><a href="produtos.asp?produto=<%=fim("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg30%>';return true;" style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0" align=absbottom></a></div></td></tr>
																   </table>
														  </table>
												    </table>
											   </td>
<%contador = contador + 1
fim.movenext
wend
fim.close
set fim = nothing

else
codigo = ofertas("idcompra")
ofertax = ofertas("idprod")

'=============seleciona pedidos para randomizar onde produto diferente do comprado=========================
'     set ofertas2 = abredb.Execute("select idprod from pedidos where idcompra = '"&compracv&"' and idprod<>'"&intProdID&"';")
'     if ofertas2.eof then
'     else
'     codigo = ofertas2("idprod")
'     ofertas2.close
'     set ofertas2 = nothing

			 set ofertas3 = abredb.Execute("select idprod,nome,preco,estoque from produtos where idprod<>"&codigo&";")
			 contador3 = 0
			 while not ofertas3.eof and contador3 < 3
			 precito2 = formatNumber(ofertas3("preco"),2)
%>
  		  							  			<td>
													<table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
													 	   <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
														    	  <table align=center width=177 height=100 cellspacing="1" cellpadding="1">
																   <tr><td valign=center width=180 height=100%><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=ofertas3("nome")%></b><br><br><b><%=strLg29%></b>&nbsp;<%=strLgMoeda & " " & precito2%><br><b><%=strLg28%></b> <%if ofertas3("estoque") = "s" then response.write strLg26 else response.write strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><a href="produtos.asp?produto=<%=ofertas3("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg30%>';return true;" style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0" align=absbottom></a></div></td></tr>
																   </table>
														  </table>
												    </table>
											   </td>
	
<%			  contador3 = contador3 + 1
			  ofertas3.movenext
			  wend
			  ofertas3.close
			  set ofertas3 = nothing


end if

ofertas.close
set ofertas = nothing

%>
  			  		  							</tr></table></td></tr>
									</table></td></tr>
					</table>
				<!-- #include file="baixo.asp" -->