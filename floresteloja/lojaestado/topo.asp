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
<!-- #include file="df.asp" -->
<%
'INICIO DO HTML
'-----------------------------------------------------------------------------------------------------%>


<html>
	 <head>
	  <title><%=tituloloja%></title>

	  <style type="text/css">
	  <!--
	  a:link       { color: <%=cor4%> }
	  a:visited    { color: <%=cor4%> }
	  a:hover      { color: <%=cor5%> }
      .menu:link { color:<%=fontebranca%>; text-decoration: none;}
      .menu:visited { color:<%=fontebranca%>; text-decoration: none;}
      .menu:hover { color:<%=fontebranca%>; text-decoration: underline;}
	  .baixo:link { color:<%=cor4%>; text-decoration: none;}
      .baixo:visited { color:<%=cor4%>; text-decoration: none;}
      .baixo:hover { color:<%=cor4%>; text-decoration: underline;}
	  -->
	  </style>

			 </head>  
<body background="fundo.jpg" topmargin=0 leftmargin=0 marginwidth=0 marginheight=0 text=<%=cor4%>>
<table width="778" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td><br><SCRIPT src="carrega.js"></SCRIPT><SCRIPT language=javascript>
     carregaFlash('cima.swf','778','200'); 
    </SCRIPT> </td>
  </tr>
</table>
<table width=778 cellpadding="0" cellspacing="0" align=center><tr><td>
<%
'Personaliza os links do  menu se o cliente estiver efetuando a compra
if session("usuario") = "" then
link = "fechapedido.asp?compra=login"
else
link = "fechapedido.asp?compra=ok"
end if
if session("ende1") = "" then
link = link
else
link = "formaspagamento.asp"
end if%>

	<basefont face="<%=fonte%>">
			  <table border="0" width="778" bgcolor=#ffffff cellpadding="1" cellspacing="1">
			  		 <tr><td width="486" nowrap>
			  		   <table width="100%" border="0">
			  		     <tr>
			  		       <td align="center"><a href="fechapedido.asp?compra=entrar"><img title="Efetuar Login na Loja" alt="Efetuar Login na Loja" src="botao4.jpg" width="100" height="76" border="0"></a></td>
			  		       <td align="center"><a href="registro.asp"><img title="Efetuar Registro na Loja" alt="Efetuar Registro na Loja"  src="botao2.jpg" width="100" height="76" border="0"></a></td>
			  		       <td align="center"><a href="carrinhodecompras.asp"><img title="Visualizar Produtos na Cesta de Compras" alt="Visualizar Produtos na Cesta de Compras" src="botao1.jpg" width="100" height="76" border="0"></a></td>
			  		       <td align="center"><a href="msnim:add?contact=alegazola@hotmail.com"><img title="Atendimento Via MSN" alt="Atendimento Via MSN" src="botao3.jpg" width="100" height="76" border="0"></a></td>
		  		         </tr>
           </table></td>
					 		 <td width="284" align="right" nowrap><table width="100%"><tr><td valign=center><img src=<%=dirlingua%>/imagens/carro.jpg border=0></td>
							 <td valign=top>

<%
'Cria o carrinho de compras no topo superior da loja
if cstr(Session("orderID")) = "" then
'Chama o nome do cliente da tabela clientes
Set dados = abredb.Execute("SELECT email,nome FROM clientes WHERE email='"&Cripto(session("usuario"),true)&"';")
'Faz aparecer somento o primeiro nome do cliente
if dados.eof then
nomez = ""
else
nomeq = Cripto(dados("nome"),false)
numeroz = Instr(1,nomeq," ")
var5000 = Left(nomeq,numeroz)
if var5000 = "" then
var5000 = nomeq
else
var5000 =  Left(nomeq,numeroz)
end if
nomez = "&nbsp;"&var5000
end if
'Fecha tabela clientes
dados.Close
set dados = Nothing
%>
	  <table width="100%" onMouseOver="window.status='<%=strLg1%>';return true;" onMouseOut="window.status='';return true;">
		  <tr><td bgcolor=<%=corborda%>>
		  		  <table>
		  		   <tr><td bgcolor=#ffffff>
				   		   <table cellspacing="1" cellpadding="1" width="100%">
						   		  <tr><td coldiv=2 align="right"><font face="<%=fonte%>" style=font-size:11px; color=#000000><a href="carrinhodecompras.asp"  style="color:#000000;text-decoration:none;" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg1%>';return true;">&nbsp;&nbsp;&nbsp;<b><%=strLg1%> </a><b></td></tr>
								  <tr><td bgcolor=<%=cor3%>><font face="<%=fonte%>" style=font-size:11px; color=#000000>&nbsp;<%=strLg2%>&nbsp;</td>
								  		  <td align="right" valign="center" bgcolor=<%=cor3%>><font face="<%=fonte%>" style=font-size:11px; color=000000>&nbsp;0&nbsp;</font></td></tr>
								   <tr><td bgcolor=<%=cor3%>><font face="<%=fonte%>" style=font-size:11px; color=#000000><b>&nbsp;<%=strLg3%>&nbsp;</b></font></td>
								   		   <td align="right" valign="center" bgcolor=<%=cor3%>><font face="<%=fonte%>" style=font-size:11px; color=000000><b>&nbsp;<%=strLgMoeda%>&nbsp;0.00&nbsp;</b></font></td></tr>
							</table></td></tr>
				   </table>
		  </td></tr></a></table>
<%else
intOrderID = cstr(Session("orderID"))
'Chama o nome do cliente da tabela clientes
Set dados = abredb.Execute("SELECT email, nome FROM clientes WHERE email='"&Cripto(session("usuario"),true)&"';")
'Faz aparecer somento o primeiro nome do cliente
if dados.EOF then
nomez = ""
else
nomeq = Cripto(dados("nome"),true)
numeroz = Instr(1,nomeq," ")
var5000 = Left(nomeq,numeroz)
if var5000 = "" then
var5000 = nomeq
else
var5000 =  Left(nomeq,numeroz)
end if
nomez = "&nbsp;"&var5000
end if
'Fecha tabela clientes
dados.Close
set dados = Nothing
'Chama os dados dos produtos comprados e monta o carrinho
set pedidos = abredb.Execute("SELECT idprod, quantidade FROM pedidos WHERE idcompra='"&intOrderID&"';")
while not pedidos.EOF
idprod = pedidos("idprod")
quantidade = pedidos("quantidade")
set produtos = abredb.Execute("SELECT preco, nome FROM produtos WHERE idprod="&idprod&";")
preco = produtos("preco")
nome = produtos("nome")

'Calcula os dados
intProdID = idprod
strProdName = nome
intProdPrice = preco
intQuant = cint(quantidade)
intQuantx = cint(intQuantx) + cint(intQuant)	
intTotal = intTotal + (intQuant * intProdPrice)
inTotal = cint(inTotal)
pedidos.MoveNext
wend
'Fecha os dados dos produtos comprados
pedidos.Close
set pedidos = Nothing
'Valor do preço total
precito1 = formatNumber(intTotal,2)%>     
		 <table onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg1%>';return true;"><tr><td bgcolor=<%=corborda%>>
		   		<table width="100%">
					   <tr><td bgcolor=#ffffff><table cellspacing="1" cellpadding="1">
					   <tr><td coldiv=2 align="right"><font face="<%=fonte%>" style=font-size:11px; color=#000000><a href="carrinhodecompras.asp"  style="color:#000000;text-decoration:none;" onMouseOver="window.status='<%=strLg1%>';return true;"><b>&nbsp;&nbsp;&nbsp;<b><%=strLg1%><b></a></td></tr>
					   <tr><td bgcolor=<%=cor3%>><font face="<%=fonte%>" style=font-size:11px;  color=#000000>&nbsp;<%=strLg2%>&nbsp;</td>
					    	   <td align="right" valign="center" bgcolor=<%=cor3%>><font face="<%=fonte%>" style=font-size:11px;  color=#000000>&nbsp;<%=intQuantx%>&nbsp;</font></td></tr><tr><td bgcolor=<%=cor3%>> <font face="<%=fonte%>" style=font-size:11px; color=#000000><b>&nbsp;<%=strLg3%>&nbsp;</b></font></td>
							   <td align="right" valign="center" bgcolor=<%=cor3%>><font face="<%=fonte%>" style=font-size:11px;  color=#000000><b>&nbsp;<%=strLgMoeda%>&nbsp;<%= precito1 %>&nbsp;</b></font></td></tr>
	             </table></td></tr>
	    </table></td></tr></table></a>
<%end if%>
	  	  </td></tr></table>
	  </td></tr></table>

<%
set rs = abredb.execute("SELECT nome FROM clientes where email='" & Cripto(Session("usuario"),true) & "'")
if rs.eof then
strNome = "Visitante"
else
nomeq = Cripto(rs("nome"),false)
numeroz = Instr(1,nomeq," ")
var5000 = Left(nomeq,numeroz)
if var5000 = "" then
var5000 = nomeq
else
var5000 =  Left(nomeq,numeroz)
end if
strNome = Trim(var5000)
strNome2 = Trim(Cripto(rs("nome"),false))
end if
rs.close
set rs = nothing
%>	  
	  
<%
'Personaliza o menu se o cliente estiver logado
 if session("usuario") = "" then %>

 		<table width="778" height="10" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF" valign="center">
			 <tr valign="center">
			   <td bgcolor="<%=cor2%>" height="23" align="left" valign=bottom><table cellpadding="0" cellspacing="0"><tr><td height=5></td></tr></table><font color="<%=fontebranca%>" face="<%=fonte%>" style=font-size:11px;><b>&nbsp;<img src="espaco.gif" border="0" align="middle" WIDTH="0" HEIGHT="16"><a class=menu  href="default.asp" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;" ><%=strLg4%></a>&nbsp;</b>|<b>&nbsp;<a class=menu href="carrinhodecompras.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg1%>';return true;" ><%=strLg1%></a> </b>|<b>&nbsp;<a class=menu href="registro.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg5%>';return true;" ><%=strLg5%></a> </b>|<b>&nbsp;<a class=menu href="fechapedido.asp?compra=entrar"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg6%>';return true;" ><%=strLg6%></a></b></font><table cellpadding="0" cellspacing="0"><tr><td height=2></td></tr></table></td>
			   <td bgcolor="<%=cor2%>" height="23" align="right" valign=top><font color="<%=fontebranca%>" face="<%=fonte%>" style=font-size:11px;>(Seja Bem Vindo&nbsp;<b><%=strNome%></b>!)</font>&nbsp;</td></tr>			   
	    </table>

<%else%>

		<table width="778" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF" valign=center>
			 <tr valign=center>
			   <td bgcolor="<%=cor2%>" height="23" align="left" valign=bottom><table cellpadding="0" cellspacing="0"><tr><td height=5></td></tr></table><font color="<%=fontebranca%>" face="<%=fonte%>" style=font-size:11px;><b>&nbsp;<img src="espaco.gif" border="0" align="middle" WIDTH="0" HEIGHT="16"><a class=menu href="default.asp" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;" ><%=strLg4%></a>&nbsp;</b>|<b>&nbsp;<a class=menu href="carrinhodecompras.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg1%>';return true;" ><%=strLg1%></a> </b>|<b>&nbsp;<a class=menu href="<%=link%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg8%>';return true;" ><%=strLg8%></a> </b>|<b>&nbsp;<a class=menu href="dados.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg9%>';return true;" ><%=strLg9%></a> </b>|<b>&nbsp;<a class=menu href="minhascompras.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg10%>';return true;" ><%=strLg10%></a> </b></b>|<b>&nbsp;<a class=menu href="logout.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg11%>';return true;" ><%=strLg11%></a></b></font><table cellpadding="0" cellspacing="0"><tr><td height=2></td></tr></table></td>
			   <td bgcolor="<%=cor2%>" height="23" align="right" valign=top><font color="<%=fontebranca%>" face="<%=fonte%>" style=font-size:11px;>(Seja Bem Vindo&nbsp;<b><%=strNome%></b>!)</font>&nbsp;</td></tr>
	    </table>
<%end if%>
		
				<div id="layer1" style="position:absolute; z-index:5"><table border=0 cellspacing=0 width=778 bgcolor=#ffffff cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="bcbcbc" align=left></td></tr><tr><td height=5></td></tr></table></div>
		<div id="layer1" style="position:absolute; z-index:7"><table border=0 cellspacing=0 width=775 cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="bcbcbc" align=left></td></tr><tr><td height=5></td></tr></table></div>
		<div id="layer1" style="position:absolute; width:100px; height:15px; z-index:8"><table border="0" cellspacing="0" cellpadding="0" width="166"><tr bgcolor="<%=cor3%>"><td bgcolor="<%=cor3%>" width=25><img src="arvore.png" border="0"></td><td bgcolor="<%=cor3%>"><font style=font-size:11px;font-family:<%=fonte%>; color=000000><b><%=UCASE(strLg12)%></b></td></tr></table></div>
		<div id="layer1" style="position:absolute; z-index:1">
			 <table border="0" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" width="775"><tr><td width="128" valign="top" align="center">
			 		<table border="0" cellspacing="4" cellpadding="4" width="125">
						   <tr><td width="128" bgcolor="#ffffff"></td></tr>
						   <tr><td width="128" bgcolor="#ffffff" height=17></td></tr>

<%
'Monta o menu de departamentos
Set menu = abredb.Execute("SELECT * FROM sessoes WHERE ver = 's' ORDER by nome;")
While Not menu.EOF%>
	  	  <tr><td width="128" bgcolor="#ffffff"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><a href="sessoes.asp?item=<%= menu("id") %>" style="text-decoration:none;" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%= menu("nome") %>';return true;"><B><img src=<%=dirlingua%>/imagens/greendot.png border=0>&nbsp;&nbsp;<%=menu("nome")%></B></a></td></tr>
<%
menu.MoveNext
Wend
'Fecha o menu
menu.Close
Set menu = Nothing%> 

		 <tr><td></td></tr>
		 <tr><td><div id="layer1" style="position:absolute; left:0px; width: 300px;">
		 			  <table border="0" cellspacing="0" cellpadding="0" width="166"><tr><td bgcolor="<%=cor3%>" width=20><img src="arvore.png" border="0"></td><td bgcolor="<%=cor3%>"><font style=font-size:11px;font-family:<%=fonte%> color=000000><b>&nbsp;<%=UCASE(strLg13)%></b></font></td></tr></table></td></tr></div>
					  		 <tr><td height=27></td></tr><tr><td><font style=font-style:11px><form action=pesquisa.asp method=get>
							 		 <input type=text name=pesq  size=25 style=font-size:11px;font-family:<%=fonte%>;><br>
									 <select name=cat style=font-size:11px;font-family:<%=fonte%>>
									 <option value=todos><%=strLg15%> </option>
									 <option value=xxx>------------------------------</option>
<%
'Monta a select de pesquisa
Set cat = abredb.Execute("SELECT * FROM sessoes WHERE ver = 's' ORDER by nome;")
While Not cat.EOF%><option value=<%= cat("id") %>><%= cat("nome") %></option>
<%
cat.MoveNext
Wend%>
	  			    		  			</select></font>
<%
'Fecha a select de pesquisa
cat.Close
Set cat = Nothing%> 

	<div align=center>
		 <input type=image src=<%=dirlingua%>/imagens/pesquisar.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg21%>';return true;"></div></td></tr></form><tr><td><div id="layer1" style="position:absolute; left:0px;width:300px;">
		 		<table border="0" cellspacing="0" cellpadding="0" width=166>
					   <tr><td bgcolor="<%=cor3%>" width=20><img src="arvore.png" border="0"></td><td bgcolor="<%=cor3%>"><font style=font-size:11px;font-family:<%=fonte%>; color=000000><b>&nbsp;<%=UCASE(strLg14)%></b></font></td></tr></table></div></td></tr>
					   <tr><td></td></tr>
					   <tr><td height="20" width="128" bgcolor="#ffffff"><font style=font-size:2px;>&nbsp;</font></td></tr>
					   <tr><td width="128" bgcolor="#ffffff"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><a href="como.asp" style="text-decoration:none;" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg16%>';return true;"><B><img src=<%=dirlingua%>/imagens/greendot.png  border=0>&nbsp;&nbsp;<%=strLg16%></B></a></td></tr>
					   <tr><td width="128" bgcolor="#ffffff"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><a href="ajuda_email.asp" style="text-decoration:none;" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg24%>';return true;"><B><img src=<%=dirlingua%>/imagens/greendot.png  border=0>&nbsp;&nbsp;<%=strLg23%></B></a></td></tr>					   <tr><td width="128" bgcolor="#ffffff"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><a href="seguranca.asp" style="text-decoration:none;" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg22%>';return true;"><B><img src=<%=dirlingua%>/imagens/greendot.png  border=0>&nbsp;&nbsp;<%=strLg22%></B></a></td></tr>
					   <tr><td width="128" bgcolor="#ffffff"></td></tr><tr><td width="128" bgcolor="#ffffff"></td></tr></table></td><td width="1" bgcolor="<%=cor1%>" height=550><img src="espaco" width="1" height="1" alt border="0"></td><td align="left" valign="top"><table border="0" cellspacing="4" cellpadding="4"><tr><td>

	