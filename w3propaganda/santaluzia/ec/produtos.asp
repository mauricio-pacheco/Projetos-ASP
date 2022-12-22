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
intProdID = Request.QueryString("produto")
if intProdID = "" then
intProdID = "0000000000"
end if
'Chama o produto
Set prodinfo = abredb.Execute("SELECT * FROM produtos where idprod="&intProdID)
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
strIdProd = prodinfo("idprod")
strName = prodinfo("nome")
strPeso = prodinfo("peso")
strVezes = prodinfo("vezes")

strDesc = prodinfo("detalhe")
strId = prodinfo("idprod")
intPrice = prodinfo("preco")
intVezado = prodinfo("vezado")
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

  		   			<font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <a href=sessoes.asp?item=<%=idsessao%> style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%= strNome %>';return true;"><b><%= strNome %></b></a> » <%= strName %><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br>
					 <table BORDER="0" CELLSPACING="1" CELLPADDING="0" width=784 align=left><tr><td bgcolor=#bfbfbf>
					 		<table BORDER="0" CELLSPACING="1" CELLPADDING="3" width=784><tr><td bgcolor=#ffffff>
								   <table align=left width=784 cellspacing="1" cellpadding="1"><tr><form action="comprar.asp" method="post" name="registro1"><td><table><tr><td><img src="olhos.gif"></td><td><font face="<%=fonte%>" style=font-size:17px;color:000000;font-weight:bold><%= strName %></font></b></td></tr></table><div align="center"><img src="produtos/<%=prodinfo("imgra")%>"></div><br><font face="<%=fonte%>" style=font-size:11px;color:000000>
								   		  <table border="0" cellspacing="2" cellpadding="4"><tr align=center><td width=150 valign=top align=center><center><br><br><font face="<%=fonte%>" style=font-size:11px;color:000000><div align="left"><img src="grana.gif">&nbsp;&nbsp;<b><%=strLg37%></b></div>
										  		 <table border=0 width=150 align=center><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000><%if prodinfo("consulta") = "s" then %><br><b>Preço:</b><font color="#808080"> Sob Consulta</font><br><% end if %><% if prodinfo("consulta") = "b" then %><font face="<%=fonte%>" style=font-size:11px;color:000000><%=strLg39%></td><td><font face="<%=fonte%>" style=font-size:16px;color:004F00><b><%= strlgmoeda & " " & precitovx%></b><br><b><font color="#333333">ou</font></b> <font face="<%=fonte%>" style=font-size:12px;color:333333><b><font face="<%=fonte%>" style=font-size:16px;color:4074A6><%= strPeso %></font> <font face="<%=fonte%>" style=font-size:12px;color:4074A6>X</font> <%=strlgmoeda & " " & precitonx%></b></font><% end if %></td></tr></table><br><div align="left"><img src="grana.gif">&nbsp;&nbsp;<b><%=strLg370%></b></div><table border=0 width=150 align=center><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000><%if prodinfo("consulta") = "s" then %><br><b>Preço:</b><font color="#808080"> Sob Consulta</font><br><% end if %><% if prodinfo("consulta") = "b" then %><font face="<%=fonte%>" style=font-size:11px;color:000000><%=strLg38%></td><td><font face="<%=fonte%>" style=font-size:12px;color:333333><b><font face="<%=fonte%>" style=font-size:16px;color:4074A6><%= strVezes %></font> <font face="<%=fonte%>" style=font-size:12px;color:4074A6>X</font> R$ <%= prodinfo("vezado")%></b></font><% end if %></td></tr></td></tr>
												 </table>
												         <% if prodinfo("parcela") <> "v" then%>
												 		 <div align="left"><b>ou ainda:</b></div>
														 <table border=0 width=150 align=center><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000><b><%=prodinfo("parcela")%>x</b> <%=strLg46%> <font face="<%=fonte%>" style=font-size:17px;color:b33030><b><%=strlgmoeda & " " & cparcela%></b></font></td></tr></table>
														 <%end if%><br><br><img src="cartao1.gif"><br><br><img src="cartao2.gif"><br><br><img src="cartao3.gif"><br><br><img src="cartao4.gif"><br><br><img src="cartao5.gif"><br><br><img src="cartao6.gif"><br><br>
															 		 
																<td><font face="<%=fonte%>" style=font-size:11px;color:000000><div align=justify><%= strDesc %><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=5></td></tr></table>	<% if strEstoq = "s" then%>
																		  <table border="0" cellspacing="0" cellpadding="0" width=350 align=center><tr><td align=center><input type=hidden name=frete value="<%=estado2%>"><font face="<%=fonte%>" size="2"><input type="hidden" name="intProdID" value="<%= intProdID %>"></td></tr></table></td>
																		  <tr></table><table width="98%" border="0">
  <tr>
    <td width="20%"><div align="center"><font face="<%=fonte%>" style="font-size:11px;color:333333"><img src="exclama.gif" /><br /><%=strLg31%> <b><%=prodinfo("fabricante")%></font></font></div></td>
    <td width="54%"><div align="center"><a href="javascript: amigo()" onMouseOut="window.status='';return true;" onMouseOver="window.status='Enviar essa oferta a um amigo!';return true;"><img src="<%=dirlingua%>/imagens/amigo.gif" border="0" /></a></div></td>
    <td width="40%"><font face="<%=fonte%>" style=font-size:11px;color:333333>
      <div align="center"><b><img src="caxinha.jpg" /><br /><%=strLg28%></b> <font color="#333333">
        <%if strEstoq = "s" then %>
          <font color="#006600">
          <% response.write strLg26 %>
            </font> <font color="#ff0000">
            <%  else response.write strLg229 end if%>
        </font><%=strLg25%></div></td>
  </tr>
</table><br>
																		  </td></tr></form>
																		  </table>
																		  </table>
															   <%else%>
															              </form>
																		  
																		  <tr></table><br>
																		  <table border="0" width="100%" cellspacing="2" cellpadding="2" ><tr><td valign=center align=center><table width="98%" border="0">
  <tr>
    <td width="20%"><div align="center"><font face="<%=fonte%>" style="font-size:11px;color:333333"><img src="exclama.gif" /><br /><%=strLg31%> <b><%=prodinfo("fabricante")%></font></font></div></td>
    <td width="54%"><div align="center"><a href="javascript: amigo()" onMouseOut="window.status='';return true;" onMouseOver="window.status='Enviar essa oferta a um amigo!';return true;"><img src="<%=dirlingua%>/imagens/amigo.gif" border="0" /></a></div></td>
    <td width="40%"><font face="<%=fonte%>" style=font-size:11px;color:333333>
      <div align="center"><b><img src="caxinha.jpg" /><br /><%=strLg28%></b> <font color="#333333">
        <%if strEstoq = "s" then %>
          <font color="#006600">
          <% response.write strLg26 %>
            </font> <font color="#ff0000">
            <%  else response.write strLg229 end if%>
        </font><%=strLg25%></div></td>
  </tr>
</table></td></tr></table>
																		  </td></tr>
																		  </table>
																		  </table>
																<%end if%>
															</table><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><center></font></center>
<%end if%>
	  	  									</td></tr></table>
									</td></tr></table><br><div align="center"><font size="1">* Os preços e a disponibilidade para a entrega podem sofrer alterações sem aviso.</font></div><br><div align="center"><a HREF="javascript:history.back()" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="<%=fonte%>" style=font-size:11px><img src="voltando.gif" border="0"></a></div>
									<!-- #include file="baixo.asp" -->
