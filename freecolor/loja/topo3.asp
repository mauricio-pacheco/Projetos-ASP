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

  
<body bgcolor="#ffffff" topmargin=0 leftmargin=0 marginwidth=0 marginheight=0 text=<%=cor4%>>

			 </head>
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
<%else%>

		
<%end if%>
		
		
		
		
