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
                              <tr><td align=right valign=bottom height=21 colspan=2><img src=<%=dirlingua%>/imagens/trofeu.gif width=15 height=21 border=0>&nbsp;&nbsp;<font face=<%=fonte%> style=font-size:11px;color:000000;><b>CAMPE�ES DE VENDA</b></td></tr>
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