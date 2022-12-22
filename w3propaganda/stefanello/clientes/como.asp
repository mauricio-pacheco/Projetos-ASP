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
<% if request.querystring("pagina") = "2" then %>
   	  <table><tr><td align="left" valign="top">
	  				 <table border="0" cellspacing="4" cellpadding="4" width=590><tr><td> <font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='Home';return true;"><b>Home</b></a> » Como Comprar?<br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div><font face="<%=fonte%>" style=font-size:13px><strong><br>Como comprar na <%=nomeloja%></strong></font> - <font face="<%=fonte%>" style=font-size:10px>Página <B>2</B> de <B>3</B> </p><div align=center>
					 		<table align=center width=550 border=0><tr><td valign=center><font face="<%=fonte%>"  style=font-size:11px color=000000><b>Carrinho de Compras (Cont.)</b><br><div align=justify>Além disso, seu carrinho de compras controla todo o seu pedido, clicando sobre os botões: <br><br>&nbsp;&nbsp;&nbsp;&nbsp;<b>»</b> O botão <img src="<%=dirlingua%>/imagens/continuar.gif"> permite acessar a home principal, voltar a navegar pela loja e escolher outros produtos.<br>&nbsp;&nbsp;&nbsp;&nbsp;<b>»</b> O botão <img src="<%=dirlingua%>/imagens/atualiza.gif"> permite visualizar a quantidade correta dos produtos e o real valor a ser pago por cada um caso você tenha alterado a quantidade do produto desejado. <br>&nbsp;&nbsp;&nbsp;&nbsp;<b>»</b> Para remover algum item clique na <img src="<%=dirlingua%>/imagens/del.gif" border="0"> (lixeira) no lado do produto a ser excluido.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;<b>»</b> Selecionando o cliente você estará indicando qual dos seus clientes efetuará o pagamento. <br>Após terminar este procedimento, clique sobre o botão <img src="<%=dirlingua%>/imagens/prosseguir.gif" border="0">.<br></td></tr>
							</table><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><A HREF=como.asp?pagina=1 style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='Página Anterior';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b>Página Anterior</b> ::</font></A> <font color=bcbcbc>|</font> <A HREF=como.asp?pagina=3 style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='Próxima Página';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b>Próxima Página</b> ::</font></A></td></tr>
					</table></td></tr>
	  </table>
	 <!-- #include file="baixo.asp" -->
<%else if request.querystring("pagina") = "3" then %>
	   <table><tr><td align="left" valign="top">
	   				  <table border="0" cellspacing="4" cellpadding="4" width=590><tr><td> <font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='Home';return true;"><b>Home</b></a> » Como Comprar?<br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table>  </div><font face="<%=fonte%>" style=font-size:13px><strong><br>Como comprar na <%=nomeloja%></strong></font> - <font face="<%=fonte%>" style=font-size:10px>Página <B>3</B> de <B>3</B> </p><div align=center>
					  		 <table align=center width=550 border=0>
							 		<tr><td><br><font face="<%=fonte%>"  style=font-size:11px color=000000><b>Entrega e Pagamento</b><br><div align=justify>&nbsp;&nbsp;&nbsp;Aqui você volta a confirmar se todas as informações do seu pedido estão corretas e define qual o endereço de entrega e como deseja pagar seu pedido. Esta página é dividida em 2 partes distintas:<br><br>&nbsp;&nbsp;&nbsp;&nbsp;<b>»</b> Digite o endereço para entrega do seu pedido.<br>&nbsp;&nbsp;&nbsp;&nbsp;<b>»</b> Você poderá escolher como pagar seu pedido. Lembre-se que após fechar seu pedido, não será possível qualquer alteração.<br><br>Após concluir todos os passos, clique sobre o botão <img src="<%=dirlingua%>/imagens/prosseguir.gif" border="0">. Na página final você verá os dados do seu pedido.<br><br>Clique em <img src="<%=dirlingua%>/imagens/finaliza.gif" border="0"> para concluir seu pedido!</td></tr>
							 </table><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><A HREF=como.asp?pagina=2 style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='Página Anterior';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b>Página Anterior</b> ::</font></A> <font color=bcbcbc>| <A HREF=default.asp style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='Página Principal';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b>Página Principal</b> ::</font></A></td></tr>
					 </table></td></tr>
	  </table>
	  <!-- #include file="baixo.asp" -->
<%else%>
		<table><tr><td align="left" valign="top">
					   <table border="0" cellspacing="4" cellpadding="4" width=590>
					    <tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='Home';return true;"><b>Home</b></a> » Como Comprar?<br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div><font face="<%=fonte%>" style=font-size:13px><strong><br>Como comprar na <%=nomeloja%></strong></font> - <font face="<%=fonte%>" style=font-size:10px>Página <B>1</B> de <B>3</B> </p><div align=center><table align=center width=550 border=0>
						<tr><td><font face="<%=fonte%>"  style=font-size:11px color=000000><b>Escolha do produto</b><br><div align=justify>&nbsp;&nbsp;&nbsp;Ao encontrar o produto desejado, clique sobre &nbsp;<img src="<%=dirlingua%>/imagens/comprar_2.gif" border="0">&nbsp;&nbsp; para comprar o produto e adicionar ele no seu carrinho de compras.</td>
					<tr><td><font face="<%=fonte%>"  style=font-size:11px color=000000><b>Carrinho de Compras</b><br><div align=justify>&nbsp;&nbsp;&nbsp;Ao clicar sobre o botão &nbsp;<img src="<%=dirlingua%>/imagens/comprar_2.gif"  border="0">&nbsp;, você coloca o produto escolhido em seu <i>"Carrinho de Compras"</i>, que mostra todas as informações sobre sua compra. Nele você obtém todas as informações sobre o(s) produto(s) adquiridos.</td></tr>
					  </table><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><A HREF=como.asp?pagina=2 style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='Próxima Página';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b>Próxima Página</b> ::</font></A></div></ul></td></tr>
		</table></td></tr>
	</table>
	<!-- #include file="baixo.asp" -->
<%
end if
end if%>