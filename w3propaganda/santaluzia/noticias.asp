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
'Chama o produto a partir da variavel
intProdID = Request.QueryString("noticia")
if intProdID = "" then
intProdID = "0000000000"
end if
'Chama o produto
Set prodinfo = abredb.Execute("SELECT * FROM novidades where id="&intProdID)
if prodinfo.EOF then%>
   				  		<table><tr><td align="left" valign="top">
									   <table border="0" cellspacing="4" cellpadding="4" width=784><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg229%> <br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><br><center><b><%=strLg230%> <%=nomeloja%>!</b></center><br><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><center><a HREF="default.asp" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="tahoma,arial,helvetica" style=font-size:11px><img src="voltando.gif" border="0"></a></font></center></center></td></tr>
									   </table></td></tr>
						</table>
						<!-- #include file="baixo.asp" -->
<%
response.end
else
%>
  						<table><tr><td align="left" valign="top">
									   <table border="0" cellspacing="4" cellpadding="4"><tr><td> 
<%
'Variaveis do cadastro do produto
strIdProd = prodinfo("id")
strName = prodinfo("titulo")
strDesc = prodinfo("descricao")

%>



  		   			<font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » Novidades » <%= strName %><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br>
					 <table BORDER="0" CELLSPACING="1" CELLPADDING="0" width=784 align=center><tr><td bgcolor=#bfbfbf>
					 		<table BORDER="0" CELLSPACING="1" CELLPADDING="3" width=784><tr><td bgcolor=#ffffff>
								   <table align=center width=784 cellspacing="1" cellpadding="1"><tr><form action="comprar.asp" method="post" name="registro1"><td><table><tr><td><img src="luna1.gif"></td><td><font face="<%=fonte%>" style=font-size:17px;color:000000;font-weight:bold><%= strName %></font></b></td></tr></table>
								   		  <table border="0" cellspacing="2" cellpadding="4"><tr align=center><td valign=top align=center><center><br><img src="novidades/<%=prodinfo("imgra")%>"><br><br><br><font face="<%=fonte%>" style=font-size:11px;color:000000> <%end if%>
															 		<font face="<%=fonte%>" style=font-size:11px;color:000000><div align=justify><%= strDesc %><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr></table></table>
														    </form>
																		  </td></tr>
																		  </table>
																		  </table>
														</table><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><center><a HREF="javascript:history.back()" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="<%=fonte%>" style=font-size:11px><img src="voltando.gif" border="0"></a></font></center>

	  	  									</td></tr></table>
									</td></tr></table>
									<!-- #include file="baixo.asp" -->
