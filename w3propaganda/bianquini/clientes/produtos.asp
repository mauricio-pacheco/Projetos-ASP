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
'Chama o produto a partir da variavel
intProdID = Request.QueryString("produto")
if intProdID = "" then
intProdID = "0000000000"
end if
'Chama o produto
Set prodinfo = abredb.Execute("SELECT * FROM produtos where idprod="&intProdID)
if prodinfo.EOF then%>
   				  		<table><tr><td align="left" valign="top">
									   <table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> � <%=strLg229%> <br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><br><center><b><%=strLg230%> <%=nomeloja%>!</b></center><br><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><center><a HREF="default.asp" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="tahoma,arial,helvetica" style=font-size:11px>:: <b><%=strLg41%></b> ::</a></font></center></center></td></tr>
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
strIdProd = prodinfo("idprod")
strName = prodinfo("nome")
strDesc = prodinfo("detalhe")
strId = prodinfo("idprod")
intPrice = prodinfo("preco")
intPricev = prodinfo("precovelho")
strEstoq = prodinfo("estoque")
idsessao = prodinfo("idsessao")
economiza = intPricev - intPrice

'Chama o nome do departamento
Set nomes = abredb.Execute("SELECT * FROM sessoes where id="&idsessao)
strNome = nomes("nome")

'Fecha o departamento
nomes.Close
set nomes = Nothing
%>

<script LANGUAGE="JScript">
		function AbortEntry(sMsg, eSrc){window.alert(sMsg);eSrc.focus();}
		function HandleError(eSrc){var val = parseInt(eSrc.value);
		
		if (isNaN(val)){
		   document.registro1.intQuant.value = '1';
		   }
		
		if (val <= 0) {
		   document.registro1.intQuant.value = '1';
		   }
		  }
		
		function amigo(){
				 window.open('enviaamigo.asp?acao=abre&produto=<%=intProdID%>','email','resizable=no,width=270,height=225,scrollbars=no');
				}

        function apaga() {
	             document.form2.email.value='';
	    }
</script>

<%
'Formata os valores do produto
precitonx = formatnumber(intPrice,2)
precitoex = formatnumber(economiza,2)
precitovx = formatnumber(intPricev,2)
if prodinfo("parcela")="v" then
intparc = 1
else
intparc = prodinfo("parcela")
end if
cparcela = precitonx / intparc
cparcela = formatnumber(cparcela,2)%>

  		   			<font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> � <a href=sessoes.asp?item=<%=idsessao%> style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%= strNome %>';return true;"><b><%= strNome %></b></a> � <%= strName %><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br>
					 <table BORDER="0" CELLSPACING="1" CELLPADDING="0" width=565 align=center><tr><td bgcolor=#bfbfbf>
					 		<table BORDER="0" CELLSPACING="1" CELLPADDING="3" width=565><tr><td bgcolor=#ffffff>
								   <table align=center width=565 cellspacing="1" cellpadding="1"><tr><form action="comprar.asp" method="post" name="registro1"><td><p><font face="<%=fonte%>" style=font-size:17px;color:000000;font-weight:bold><%= strName %></font></b><br><font face="<%=fonte%>" style=font-size:11px;color:000000><%=strLg31%> <b><%=prodinfo("fabricante")%></b></p>
								   		  <table border="0" cellspacing="2" cellpadding="4"><tr align=center><td width=150 valign=top align=center><center><img src="produtos/<%=prodinfo("imgra")%>" width=185><br><br><font face="<%=fonte%>" style=font-size:11px;color:000000><div align="left"><b><%=strLg37%></b></div>
										  		 <table border=0 width=150 align=center><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000><%=strLg39%></td><td><font face="<%=fonte%>" style=font-size:11px;color:000000><b><%= strlgmoeda & " " & precitovx%></b></td></tr><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000><%=strLg38%></td><td><font face="<%=fonte%>" style=font-size:17px;color:b33030><b><%=strlgmoeda & " " & precitonx%></b></font></td></tr></td></tr>
												 </table>
												         <% if prodinfo("parcela") <> "v" then%>
												 		 <div align="left"><b>ou ainda:</b></div>
														 <table border=0 width=150 align=center><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000><b><%=prodinfo("parcela")%>x</b> <%=strLg46%> <font face="<%=fonte%>" style=font-size:17px;color:b33030><b><%=strlgmoeda & " " & cparcela%></b></font></td></tr></table>
														 <%end if%>
															 		<br>&nbsp;<a href="javascript: amigo()" onMouseOut="window.status='';return true;" onMouseOver="window.status='Enviar essa oferta a um amigo!';return true;"><img src=<%=dirlingua%>/imagens/amigo.gif border=0></a></center></font>
																<td><font face="<%=fonte%>" style=font-size:11px;color:000000><div align=justify><%= strDesc %><br><br><br><font face="<%=fonte%>" style=font-size:11px;color:000000><b><%=strLg28%></b> <%if strEstoq = "s" then response.write strLg26 else response.write strLg229 end if%>&nbsp;<%=strLg25%><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br>
																<% if strEstoq = "s" then%>
																		  <table border="0" cellspacing="0" cellpadding="0" width=350 align=center><tr><td align=center><input type=hidden name=frete value="<%=estado2%>"><font face="<%=fonte%>" size="2"><input type="hidden" name="intProdID" value="<%= intProdID %>"><font style=font-size:11px;font-family:<%=fonte%>;color:000000> <%=strLg32%> <input type="text" size="2" name="intQuant" value="1" maxlength=2 onChange="HandleError(this)" style=font-size:11px;font-family:<%=fonte%>> <%=strLg33%></b>&nbsp;<br><br><input type="image" src=<%=dirlingua%>/imagens/comprar.gif onMouseOver="window.status='Comprar Produto';return true;" onMouseOut="window.status='';return true;" id="submit1" name="submit1"></font></td></tr></table></td>
																		  <tr></table><br>
																		  <table border="0" width="100%" cellspacing="2" cellpadding="2" bgcolor=#eeeeee><tr><td valign=center align=center><font face="<%=fonte%>" style=font-size:11px;color:000000><b><%=strLg34%>&nbsp;<%=strName%>&nbsp;<%=strLg35%>&nbsp;<%=nomeloja%>&nbsp;<%=strLg36%>&nbsp;<b><%=precitoex%></b> <%= strLgMoedax%>!</td></tr></table>
																		  </td></tr></form>
																		  </table>
																		  </table>
															   <%else%>
															              </form>
																		  <form action="email_prod.asp" method="post" name="form2">
																		  <table border="0" cellspacing="0" cellpadding="0" width=350 align=center>												
																		  <tr><td align=center><font face=<%=fonte%> style=font-size:11px;color:ff0000><%= request.querystring("erro")%></td></tr>
																		  <tr><td align=left><br>
																		  <font face=<%=fonte%> style=font-size:11px;color:000000><strong>Solicite por e-mail:</strong><br>
																		  <input type="text" name="email" size=25 value="Digite seu e-mail" onClick="apaga();" style=font-size:11px;font-family:<%=fonte%>>&nbsp;
																		  <input type=image src=<%=dirlingua%>/imagens/envi.gif align=top>
																		  <input type="hidden" name="idProd" value=<%=strIDprod%>>
																		  <input type="hidden" name="nome" value=<%=strName%>>
																		  <input type="hidden" name="fabricante" value=<%=strFabricante%>>     																	  																
																		  </td></tr></table></td></form>
																		  <tr></table><br>
																		  <table border="0" width="100%" cellspacing="2" cellpadding="2" bgcolor=#eeeeee><tr><td valign=center align=center><font face="<%=fonte%>" style=font-size:11px;color:000000><b><%=strLg34%>&nbsp;<%=strName%>&nbsp;<%=strLg35%>&nbsp;<%=nomeloja%>&nbsp;<%=strLg36%>&nbsp;<b><%=precitoex%></b>&nbsp;<%=strLgMoedax%>!</td></tr></table>
																		  </td></tr>
																		  </table>
																		  </table>
																<%end if%>
															</table><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><center><a HREF="javascript:history.back()" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b><%=strLg41%></b> ::</a></font></center>
<%end if%>
	  	  									</td></tr></table>
									</td></tr></table>
									<!-- #include file="baixo.asp" -->
