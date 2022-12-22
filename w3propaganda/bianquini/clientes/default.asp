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

<script>
	function cadmail(){
		window.open('cadmail.asp?email='+document.emailx.email.value,'email','resizable=no,width=270,height=180,scrollbars=no');
		document.emailx.reset()
	}
	function limpa() {
	document.emailx.email.value=''
	}
	
</script>
<%
response.redirect ("sessoes.asp?item=1")
 %>
		 <table width=100% cellspacing="3" cellpadding="1" align=right>
		 		<tr><td colspan=2><img src=<%=dirlingua%>/imagens/ofertasdodia.gif border=0></td></tr>
				<!-- #include file="produto.asp" -->
				<tr><td>
				<table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
					   <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
					   		  <table border=0 align=center width=280  height=125 cellspacing="0" cellpadding="0">
                              <tr><td align=right valign=bottom height=21 colspan=2><img src=<%=dirlingua%>/imagens/trofeu.gif width=15 height=21 border=0>&nbsp;&nbsp;<font face=<%=fonte%> style=font-size:11px;color:000000;><b>CAMPEÕES DE VENDA</b></td></tr>
							  <tr><td height=1 colspan=2><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
				<%
				if VersaoDb = 1 then
				set rs = abredb.execute("SELECT idprod, nome, preco FROM produtos ORDER BY contador DESC LIMIT 0,3")
				else
				set rs = abredb.execute("SELECT TOP 3 idprod, nome, preco FROM produtos ORDER BY contador DESC")
				end if
				cont = 1
				if not rs.eof then
				  for x = 1 to 3%>
							  <tr><td valign=top width=15><font face=<%=fonte%> style=font-size:11px;color:000000;><%=cont & ") "%></font></td><td valign=top width=260><font face=<%=fonte%> style=font-size:11px;color:000000;><a href="produtos.asp?produto=<%=rs("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="text-decoration: none;"><%=rs("nome")%><br><b><%= strlgMoeda & " " & formatnumber(rs("preco"),2)%></b></font></A></td></tr>
							  <%cont = cont + 1%>
				              <%rs.movenext%>
				  <%next%>
				<%end if%>
					          </table>
					   </table>
				</table>
			    </td><td>
				<%rs.close%>
				<%set rs = nothing%>
				
		<form method=post action="javascript: cadmail()" name=emailx>

		<table BORDER="0" CELLSPACING="1" CELLPADDING="0">
			   <tr><td bgcolor=#bfbfbf>
			   <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			   		  <table align=center width=280 height=125 cellspacing="1" cellpadding="1"><tr><td><font color=000000><font style=font-size:11px;font-family:<%=fonte%>><b><%=strLg158%></b><br><%=strLg159%><br><br><center><font color=red size=1><%=erro%></font><Br><center><input type=text size=30 value="<%=strLg160%>" style=font-size:11px;font-family:<%=fonte%>;font-weight:bold name=email onFocus="limpa();"><br><input type=image src=<%=dirlingua%>/imagens/cadastro.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=srtLg161%>';return true;"><br><br></center> </td></tr>
					  </table>
		       </table>
	    </table>
		</td></tr>

		<tr><td colspan=2></td></tr>
		<tr><td colspan=2></td></tr>
 </table>
    </form>
	<!-- #include file="baixo.asp" -->