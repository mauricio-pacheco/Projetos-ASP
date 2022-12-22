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
'Verifica se a compra está vazia
if request.querystring("compra") = ""  then
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=entrar"
end if
if request.querystring("compra") = "ok" and session("usuario") = "" then
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=login"
end if
if request.querystring("compra") = "entrar" then
intOrderID = cstr(Session("orderID"))
%>
  		   <table><tr><td align="left" valign="top">
		   				  <table border="0" cellspacing="4" cellpadding="4" width=590>
						    <tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg6%><br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table>  </div><font face="<%=fonte%>" style=font-size:13px><strong><br><%=strLg179%></strong></font></p><p align="left"><%=strLg181%></p><form method="post" action="comprareg.asp?login=sim">
<%
'Chama o cookie gravado no pc do usuario
if request.cookies(""&nomeloja&"")("usuario") = "" or request.querystring("user") <> "" or request.querystring("user") = "x" then
 user = request.querystring("user")
 if user = "x" then
 user = ""
end if
else
user = request.cookies(""&nomeloja&"")("usuario")
end if 
%>
  	   <table>
	   		  <tr><td><font face="<%=fonte%>"  style=font-size:11px color=000000><%=strLg108%></td><td><input name="email" size="35" value="<%= user %>" style=font-size:11px;font-family:<%=fonte%>> <font face=<%=fonte%> style=font-size:11px; color=red> <%=request("erro")%></td></tr>
	   		  <tr><td><font face="<%=fonte%>"  style=font-size:11px color=000000><%=strLg123%></td><td><input name="senha" type="password" size="25" value="" style=font-size:11px;font-family:<%=fonte%>> <font face=<%=fonte%> style=font-size:11px; color=red> <%=request("erro2")%></td></tr>
			  <tr><td></td><td><input type="image" src="<%=dirlingua%>/imagens/login.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg179%>';return true;"></td></tr>
	   </table></form><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
	</table></td></tr>
</table>
<!-- #include file="baixo.asp" -->
<%
response.end
end if
if request.querystring("compra") = "login" then

'Verifica se a compra está vazia
if cstr(Session("orderID")) = "" then%>
   <table><tr><td align="left" valign="top">
			   <table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg8%><br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div><br><br><div align='center'><p><font face=<%=fonte%> style='font-size:17px'><b><%=strLg49%><br><%=strLg50%><br><br></b><a href=default.asp><img src="<%=dirlingua%>/imagens/continuar.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg68%>';return true;" border=0></a><b></font></p></div><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
			   </table></td></tr>
	</table>
<!-- #include file="baixo.asp" -->
<%
response.end
else

'Login na loja      
intOrderID = cstr(Session("orderID"))%>
		   <table><tr><td align="left" valign="top">
		   				  <table border="0" cellspacing="4" cellpadding="4" width=590>
						   <tr><td><font face=<%=fonte%> style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg8%><br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table>  </div><font face="<%=fonte%>" style=font-size:13px><strong><br><%=strLg55%></strong></font></p><p align="left"><%=strLg181%></p><form method="post" action="comprareg.asp">
<%
'Chama os cookies gravados
if request.cookies(""&nomeloja&"")("usuario") = "" or request.querystring("user") <> "" then
user = request.querystring("user")
if user = "x" then
user = ""
end if
else
user = request.cookies(""&nomeloja&"")("usuario")
end if 
%>
  	   <table>
	   		  <tr><td><font face="<%=fonte%>"  style=font-size:11px color=000000><%=strLg108%></td><td><input name="email" size="35" value="<%= user %>" style=font-size:11px;font-family:<%=fonte%>> <font face=<%=fonte%> style=font-size:11px; color=red> <%=request("erro")%></td></tr>
	   		  <tr><td><font face="<%=fonte%>"  style=font-size:11px color=000000><%=strLg123%></td><td><input name="senha" type="password" size="25" value="" style=font-size:11px;font-family:<%=fonte%>> <font face=<%=fonte%> style=font-size:11px; color=red> <%=request("erro2")%></td></tr>
			  <tr><td></td><td><input type="image" src="<%=dirlingua%>/imagens/login.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg179%>';return true;"></td></tr>
	   </table></form><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
	</table></td></tr>
</table>
<!-- #include file="baixo.asp" -->
<%
end if

'Verifica a sessão do frete
else if request.querystring("compra") = "ok" then
if valorfrete = "0,00" OR session("frete") = "" or estatus = "" OR estaos = "" then
response.redirect "carrinhodecompras.asp?erro=- " & strLg69 
end if
intOrderID = cstr(Session("orderID"))%>
		   	 		<table><tr><td align="left" valign="top">
								   <table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><form action=entrega.asp method=post name="registro1" onMouseOver="javascript: presentez();"><input type="hidden" name="idcompra" value="<%=intOrderID%>"><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg8%><br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table>  </div>
<%if cstr(Session("orderID")) = "" then%>
	 						  	   <br><br><div align='center'><p><font face='<%=fonte%>' style='font-size:17px'><b><%=strLg49%><br><%=strLg50%><br><br></b><a href=default.asp><img src="<%=dirlingua%>/imagens/continuar.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg68%>';return true;" border=0></a><b></font></p></div><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
								   </table></td></tr>
				   </table>
				  <!-- #include file="baixo.asp" -->
<%
response.end
else

'Chama os dados do cliente
Set dados = abredb.Execute("SELECT nome,email,senha,nascimento,cpf,rg,endereco,bairro,cidade,estado,cep,pais,tel FROM clientes WHERE email='"&Cripto(session("usuario"),true)&"';")
if dados.EOF then
ende = ""	 
bairro = ""
cidade = ""
estado = ""
cep = ""
fone = ""
pais = ""
else
ende = Cripto(dados("endereco"),false)	 
bairro = Cripto(dados("bairro"),false)
cidade = Cripto(dados("cidade"),false)
estado = Cripto(dados("estado"),false)
cep = Cripto(dados("cep"),false)
fone = Cripto(dados("tel"),false)
pais = Cripto(dados("pais"),false)
end if
dados.Close
set dados = Nothing
%>
  		  <script language="javascript">
		  		  function limpar () {
 				  	 document.registro1.endereco.value = '';
  					 document.registro1.bairro.value = '';
  					 document.registro1.cidade.value = '';
 					 document.registro1.cepzz.value = '';
  					 document.registro1.fone.value = '';
  					 document.registro1.cartao.value = '';
  					 document.registro1.mesmo.checked = false;
					 document.registro1.presentenao.checked = true;
  					 document.registro1.presentesim.checked = false;
  				 }   
				 function presente() {
  				  var currentState = document.registro1.presentesim.unchecked;
  				  var newState = document.registro1.presentesim.checked;
  				  if (newState != currentState){
  				  	 document.registro1.cartao.disabled =! newState;
 					 document.registro1.presentenao.checked =! newState;
 				  }
				}
				function presentez() {
 				 var currentState = document.registro1.presentenao.unchecked;
  				 var newState = document.registro1.presentenao.checked;
  				 if (newState != currentState){
  				 	document.registro1.cartao.disabled = newState;
  					document.registro1.presentesim.checked =! newState;
 			      }
                }
				function mesmos() {
  				  var currentState = document.registro1;
  				  var currentState = document.registro1.mesmo.unchecked;
  				  var newState = document.registro1.mesmo.checked;
  				  if (newState != currentState){
   				     newState = document.registro1.endereco.value = '<%=ende%>';
  					 newState = document.registro1.bairro.value = '<%=bairro%>';
  					 newState = document.registro1.cidade.value = '<%=cidade%>';
  					 newState = document.registro1.cepzz.value = '<%=cep%>';
  					 newState = document.registro1.fone.value = '<%=fone%>';
  				 }
 				 if (newState =! document.registro1.mesmo.checked){
  				 	newState = document.registro1.endereco.value = '';
  					newState = document.registro1.bairro.value = '';
  					newState = document.registro1.cidade.value = '';
  					newState = document.registro1.cepzz.value = '';
  					newState = document.registro1.fone.value = '';
 			    }
			}
        </script>

<%
'Chama os dados dos produtos comprados

set pedidos = abredb.Execute("SELECT idprod, quantidade FROM pedidos WHERE idcompra='"&intOrderID&"';")
do while not pedidos.EOF
idprod = pedidos("idprod")
quantidade = pedidos("quantidade")
set produtos = abredb.Execute("SELECT preco, nome, peso FROM produtos WHERE idprod="&idprod&";")
preco = produtos("preco")
peso = produtos("peso")
nome = produtos("nome")

	 if pedidos.BOF OR pedidos.EOF then
Session("orderID") = ""
pedidos.close
set pedidos = nothing
'Fecha o banco de dados
abredb.close
set abredb = nothing
response.redirect "carrinhodecompras.asp"
	 else

intProdID = idprod
strProdName = nome
pesoz = peso
intProdPrice = preco
intQuant = quantidade
		   if session("estado") = "" then
		   intFrete = 0
		   else
		   intFrete = valorfrete
		   end if

'Chama o valor total do frete
intTotalFrete = intTotalFrete + (intQuant * intProdPrice)	
intTotal = intTotalFrete + intFrete
'Chama as informações da compra	

set comprax = abredb.Execute("SELECT * FROM compras WHERE idcompra="& intOrderID &";")
			if comprax.eof then
			strPedido = ""
			else
			strPedido = comprax("pedido")
			end if
			end if
%>
  	  	  		 <input type="hidden" name="itemcomprado" value="<%= intProdID %>,<%= intQuant %>">
<%
comprax.Close
set comprax = Nothing

pedidos.MoveNext
loop
pedidos.close
set pedidos = nothing

'Formata os valores
totalcompra = formatNumber(intTotalFrete,2)
totalae = formatNumber(intTotal,2)
freteopi = formatNumber(intFrete,2)
%>
  		   	   <input type="hidden" name="deposito" value="<%=replace(ndeposito,",","")%>"><input type="hidden" name="boleto" value="<%=nboleto%>"><input type="hidden" name="totalcompra" value="<%= totalcompra %>"><input type="hidden" name="totalae" value="<%= totalae %>"><input type="hidden" name="estadoz" value="<%=left(ucase(session("estado")),2)%>"><input type="hidden" name="frete" value="<%= freteopi %>"><input type="hidden" name="nome" value="<%= strNome2 %>"><input type="hidden" name="pedido" value="<%= strPedido %>"><input type="hidden" name="compra" value="<%= intOrderID %>"><input type="hidden" name="usuario" value="<%= session("usuario") %>"><font face="<%=fonte%>" style=font-size:13px><strong><%=strLg72%></strong></font></p><font face="<%=fonte%>" style=font-size:10px;color:000000><a name=pagamento><%=strLg73%> <a href=carrinhodecompras.asp onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg71%>';return true;"><b><%=strLg71%></b></a><br><%=strLg74%><div align=left><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div><font face="<%=fonte%>" style=font-size:11px><strong><%=strLg77%></strong></font> - <font face="<%=fonte%>" style=font-size:10px;color:000000><%=strLg70%> <input type=checkbox name=mesmo value=sim onClick="javascript: mesmos()"> <%=strLg75%><br><font style=font-size:10px color=red>&nbsp;<%= request.querystring("erro2") %></font><br>
					<table border="0" cellpadding="1" cellspacing="1" width="96%" align=center>
						   <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#808080;><%=strLg78%></td><td><input type=text size=37 name=endereco style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%= request.querystring("endereco") %>"></td></tr>
						   <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#808080;><%=strLg79%></td><td><input type=text size=15 name=bairro style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%= request.querystring("bairro") %>"></td></tr>
						   <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#808080;><%=strLg80%></td><td><input type=text size=34 name=cidade style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%= request.querystring("cidade") %>"></td></tr>
						   <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#808080;><%=strLg81%></td><td><select style=font-family:<%=fonte%>;font-size:11px;color:#000000; name="estado" disabled><option value="<%=left(ucase(session("estado")),2)%>"><%=left(ucase(session("estado")),2)%></select><font face="<%=fonte%>" style=font-family:<%=fonte%>;font-size:11px;color:#000000;></td></tr>
						   <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#808080;><%=strLg82%></td><td><input type=text size=13 name=cepzz style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%= request.querystring("cep") %>"></td></tr><tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#808080;>País:</td><td><select style=font-family:<%=fonte%>;font-size:11px;color:#000000; name="pais" disabled><option value="Brasil">Brasil</option><option>-----------------------------------</option></select></td></tr>
						   <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#808080;><%=strLg84%></td><td><input type=text size=15 name=fone style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%= request.querystring("fone") %>"><font style=font-family:<%=fonte%>;font-size:9px;color:#808080;></td></tr><tr><td colspan=2><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
						   <tr><td colspan=2><font face="<%=fonte%>" style=font-size:11px;color:000000><strong><%=strLg76%></strong></font><font style=font-size:10px color=red>&nbsp;<%= request.querystring("erro") %></font><br></td></tr>
						   <tr><td valign=botton rowsspan=3 width=210 align=center><br><font style=font-size:11px><font color="#000000"><%=strLg85%><br><INPUT TYPE=checkbox name=presentesim valor=sim onClick="javascript: presente();"><b><%=strLg86%></b>&nbsp; | <INPUT TYPE=checkbox name=presentenao valor=nao checked onClick="javascript: presentez();"><b><%=strLg87%></b></td><td valign=botton rowsspan=3><font style=font-size:11px;color:000000>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=strLg88%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="cartao" cols="50" rows="4" style=font-family:<%=fonte%>;font-size:11px;color:#000000;></textarea></td></tr>
						   <tr><td><br></td></tr><tr><td colspan=2><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
						   <tr align=center><td valign=top><div id="layer1" style="position:absolute; left:370px"><input type=image src=<%=dirlingua%>/imagens/prosseguir.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg67%>';return true;"></div></td><td valign=top></form></td></tr>
					</table></form></a></td></tr>
		</table></td></tr>
</table>
<!-- #include file="baixo.asp" -->
<%
end if
end if
end if
%>