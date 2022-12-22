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
	  <tr><td valign=top>
<%

'Função para chamar os produtos aleatoreamente na vitime inicial
set rs = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok';")
if rs.eof or rs.bof then
rs.close
set rs = nothing
set atualizar = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok';")
if rs.eof or rs.bof then
rs.close
set rs = nothing
set atualizar = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok';")
end if
else
set atualizar = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs("idprod")&";")
end if
set rs2 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&";")
if rs2.eof or rs2.bof then
rs2.close
set rs2 = nothing
set atualizar2 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs2 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&";")
if rs2.eof or rs2.bof then
rs2.close
set rs2 = nothing
set atualizar2 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs2 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&";")
end if
else
set atualizar2 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs2("idprod")&";")
end if
set rs3 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&";")
if rs3.eof or rs3.bof then
rs3.close
set rs3 = nothing
set atualizar3 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs3 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&";")
if rs3.eof or rs3.bof then
rs3.close
set rs3 = nothing
set atualizar3 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs3 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&";")
end if
else
set atualizar3 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs3("idprod")&";")
end if
set rs4 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&";")
if rs4.eof or rs4.bof then
rs4.close
set rs4 = nothing
set atualizar4 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs4 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&";")
if rs4.eof or rs4.bof then
rs4.close
set rs4 = nothing
set atualizar4 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs4 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> '"&rs("idprod")&"' and idprod <> '"&rs2("idprod")&"' and idprod <> '"&rs3("idprod")&"';")
end if
else
set atualizar4 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs4("idprod")&";")
end if
set rs5 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&";")
if rs5.eof or rs5.bof then
rs5.close
set rs5 = nothing
set atualizar5 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs5 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&";")
if rs5.eof or rs5.bof then
rs5.close
set rs5 = nothing
set atualizar5 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs5 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&";")
end if
else
set atualizar5 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs5("idprod")&";")
end if
set rs6 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&";")
if rs6.eof or rs6.bof then
rs6.close
set rs6 = nothing
set atualizar6 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs6 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&";")
if rs6.eof or rs6.bof then
rs6.close
set rs6 = nothing
set atualizar6 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs6 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&";")
end if
else
set atualizar6 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs6("idprod")&";")
end if

intProdID1 = rs("idprod")
intProdID2 = rs2("idprod")
intProdID3 = rs3("idprod")
intProdID4 = rs4("idprod")
intProdID5 = rs5("idprod")
intProdID6 = rs6("idprod")

'Formatação dos preços dos produtos
precito1 = formatNumber(rs("precovelho"), 2)
precito2 = formatNumber(rs2("precovelho"), 2)
precito3 = formatNumber(rs3("precovelho"), 2)
precito4 = formatNumber(rs4("precovelho"), 2)
precito5 = formatNumber(rs5("precovelho"), 2)
precito6 = formatNumber(rs6("precovelho"), 2)

precitoparcelado1 = formatNumber(rs("preco"), 2)
precitoparcelado2 = formatNumber(rs2("preco"), 2)
precitoparcelado3 = formatNumber(rs3("preco"), 2)
precitoparcelado4 = formatNumber(rs4("preco"), 2)
precitoparcelado5 = formatNumber(rs5("preco"), 2)
precitoparcelado6 = formatNumber(rs6("preco"), 2)%>




	 <table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
             <form action="comprar.asp" method="post" name="comprar1">
		 	  <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>		 
				  <table align=center width=390 cellspacing="1" cellpadding="1"><tr>
				  <td width=80 height=100><img src="produtos/<%=rs.fields("impeq")%>" width="75" border="0"></td>
				  <td valign=center width=300><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs.fields("nome")%></b><br><br><%if rs("consulta") = "s" then %><br><b>Preço:</b><font color="#808080"> Sob Consulta</font><br><% end if %><% if rs("consulta") = "b" then %><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito1%> ou <font color=#4074A6 size=2><b><%=rs("peso")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000><%=strLgMoeda & " " & precitoparcelado1%></font><br><font color=#005500><b>Preço Parcelado:</b></font>&nbsp;<font color=#4074A6 size=2><b><%=rs("vezes")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000>R$ <%=rs("vezado")%></font><br><% end if %><b><%=strLg28%></b><%if rs.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID1 %>"><input type="hidden" name="intQuant" value=1><%if rs.fields("estoque") = "s" then response.write "&nbsp;&nbsp;" end if%>&nbsp;<%if rs.fields("promocao") = "b" then response.write " " & "" else if rs.fields("promocao") = "s" then response.write " " & "<img src='promo.gif'>" else if rs.fields("promocao") = "n" then response.write " " & "<img src='lancamento.gif'>" end if%>&nbsp;<a href="produtos.asp?produto=<%=rs.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>
		        </table>
		  </table>
	  </table>
	   
	  <table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
	         <form action="comprar.asp" method="post" name="comprar2">
	   		 <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			  		<table align=center width=390 cellspacing="1" cellpadding="1"><tr>
					<td width=80 height=100><img src="produtos/<%=rs2.fields("impeq")%>" width="75" border="0"></td>
				  <td valign=center width=300><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs2.fields("nome")%></b><br><br><%if rs2("consulta") = "s" then %><br><b>Preço:</b><font color="#808080"> Sob Consulta</font><br><% end if %><% if rs2("consulta") = "b" then %><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito2%> ou <font color=#4074A6 size=2><b><%=rs2("peso")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000><%=strLgMoeda & " " & precitoparcelado2%></font><br><font color=#005500><b>Preço Parcelado:</b></font>&nbsp;<font color=#4074A6 size=2><b><%=rs2("vezes")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000>R$ <%=rs2("vezado")%></font><br><% end if %><b><%=strLg28%></b><%if rs2.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID2 %>"><input type="hidden" name="intQuant" value=1><%if rs2.fields("estoque") = "s" then response.write "&nbsp;&nbsp;" end if%>&nbsp;<%if rs2.fields("promocao") = "b" then response.write " " & "" else if rs2.fields("promocao") = "s" then response.write " " & "<img src='promo.gif'>" else if rs2.fields("promocao") = "n" then response.write " " & "<img src='lancamento.gif'>" end if%>&nbsp;<a href="produtos.asp?produto=<%=rs2.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>					
				    </table>
		     </table>
	  </table>
	   
	  <table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
	         <form action="comprar.asp" method="post" name="comprar3">
	   		 <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			  		<table align=center width=390 cellspacing="1" cellpadding="1"><tr>
					<td width=80 height=100><img src="produtos/<%=rs3.fields("impeq")%>" width="75" border="0"></td>
				  <td valign=center width=300><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs3.fields("nome")%></b><br><br><%if rs3("consulta") = "s" then %><br><b>Preço:</b><font color="#808080"> Sob Consulta</font><br><% end if %><% if rs3("consulta") = "b" then %><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito3%> ou <font color=#4074A6 size=2><b><%=rs3("peso")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000><%=strLgMoeda & " " & precitoparcelado3%></font><br><font color=#005500><b>Preço Parcelado:</b></font>&nbsp;<font color=#4074A6 size=2><b><%=rs3("vezes")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000>R$ <%=rs3("vezado")%></font><br><% end if %><b><%=strLg28%></b><%if rs3.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID3 %>"><input type="hidden" name="intQuant" value=1><%if rs3.fields("estoque") = "s" then response.write "&nbsp;&nbsp;" end if%>&nbsp;<%if rs3.fields("promocao") = "b" then response.write " " & "" else if rs3.fields("promocao") = "s" then response.write " " & "<img src='promo.gif'>" else if rs3.fields("promocao") = "n" then response.write " " & "<img src='lancamento.gif'>" end if%>&nbsp;<a href="produtos.asp?produto=<%=rs3.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>
					</table>
			 </table>
	 </table>
	  
</td><td valign=top>

	 <table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
           <form action="comprar.asp" method="post" name="comprar4">
		 	<table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
					  <table align=center width=390 cellspacing="1" cellpadding="1">
					  <tr><td width=80 height=100><img src="produtos/<%=rs4.fields("impeq")%>" width="75" border="0"></td>
				      <td valign=center width=300><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs4.fields("nome")%></b><br><br><%if rs4("consulta") = "s" then %><br><b>Preço:</b><font color="#808080"> Sob Consulta</font><br><% end if %><% if rs4("consulta") = "b" then %><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito4%> ou <font color=#4074A6 size=2><b><%=rs4("peso")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000><%=strLgMoeda & " " & precitoparcelado4%></font><br><font color=#005500><b>Preço Parcelado:</b></font>&nbsp;<font color=#4074A6 size=2><b><%=rs4("vezes")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000>R$ <%=rs4("vezado")%></font><br><% end if %><b><%=strLg28%></b><%if rs4.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID4 %>"><input type="hidden" name="intQuant" value=1><%if rs4.fields("estoque") = "s" then response.write "&nbsp;&nbsp;" end if%>&nbsp;<%if rs4.fields("promocao") = "b" then response.write " " & "" else if rs4.fields("promocao") = "s" then response.write " " & "<img src='promo.gif'>" else if rs4.fields("promocao") = "n" then response.write " " & "<img src='lancamento.gif'>" end if%>&nbsp;<a href="produtos.asp?produto=<%=rs4.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>					  
					  </table>
			</table>
	</table>
		
	<table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
	<form action="comprar.asp" method="post" name="comprar5">
			  <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			   		 <table align=center width=390 cellspacing="1" cellpadding="1">
					 <tr><td width=80 height=100><img src="produtos/<%=rs5.fields("impeq")%>" width="75" border="0"></td>
				     <td valign=center width=300><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs5.fields("nome")%></b><br><br><%if rs5("consulta") = "s" then %><br><b>Preço:</b><font color="#808080"> Sob Consulta</font><br><% end if %><% if rs5("consulta") = "b" then %><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito5%> ou <font color=#4074A6 size=2><b><%=rs5("peso")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000><%=strLgMoeda & " " & precitoparcelado5%></font><br><font color=#005500><b>Preço Parcelado:</b></font>&nbsp;<font color=#4074A6 size=2><b><%=rs5("vezes")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000>R$ <%=rs5("vezado")%></font><br><% end if %><b><%=strLg28%></b><%if rs5.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID5 %>"><input type="hidden" name="intQuant" value=1><%if rs5.fields("estoque") = "s" then response.write "&nbsp;&nbsp;" end if%>&nbsp;<%if rs5.fields("promocao") = "b" then response.write " " & "" else if rs5.fields("promocao") = "s" then response.write " " & "<img src='promo.gif'>" else if rs5.fields("promocao") = "n" then response.write " " & "<img src='lancamento.gif'>" end if%>&nbsp;<a href="produtos.asp?produto=<%=rs5.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>					 
					 </table>
			  </table>
	</table>
		
	<table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
	<form action="comprar.asp" method="post" name="comprar6">
			  <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			   		 <table align=center width=390 cellspacing="1" cellpadding="1">
					 <tr><td width=80 height=100><img src="produtos/<%=rs6.fields("impeq")%>" width="75" border="0"></td>
				     <td valign=center width=300><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs6.fields("nome")%></b><br><br><%if rs6("consulta") = "s" then %><br><b>Preço:</b><font color="#808080"> Sob Consulta</font><br><% end if %><% if rs6("consulta") = "b" then %><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito6%> ou <font color=#4074A6 size=2><b><%=rs6("peso")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000><%=strLgMoeda & " " & precitoparcelado6%></font><br><font color=#005500><b>Preço Parcelado:</b></font>&nbsp;<font color=#4074A6 size=2><b><%=rs6("vezes")%></b>&nbsp;<b>X</b></font>&nbsp;<font color=#E60000>R$ <%=rs6("vezado")%></font><br><% end if %><b><%=strLg28%></b><%if rs6.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID6 %>"><input type="hidden" name="intQuant" value=1><%if rs6.fields("estoque") = "s" then response.write "&nbsp;&nbsp;" end if%>&nbsp;<%if rs6.fields("promocao") = "b" then response.write " " & "" else if rs6.fields("promocao") = "s" then response.write " " & "<img src='promo.gif'>" else if rs6.fields("promocao") = "n" then response.write " " & "<img src='lancamento.gif'>" end if%>&nbsp;<a href="produtos.asp?produto=<%=rs6.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>
				     </table>
			  </table>
	 </table> 
</td></tr><tr><td colspan=2><img src=<%=dirlingua%>/imagens/ofertasbaixo.gif border=0><br /><br><div align="center"><font size="1">* Os preços e a disponibilidade para a entrega podem sofrer alterações sem aviso.</font></div><br /></td></tr>

<%
'Fecha as tabelas
rs.close
set rs=nothing
rs2.close
set rs2=nothing
rs3.close
set rs3=nothing
rs4.close
set rs4=nothing
rs5.close
set rs5=nothing
rs6.close
set rs6=nothing
%>
