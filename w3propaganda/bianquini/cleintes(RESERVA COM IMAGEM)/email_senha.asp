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
'Inicia a atualização
if request.querystring("acao") = "atualiza" then
strEmail=request.form("novoemail")
strEmaila=request.form("email")
strSenhaa=request.form("senhaatual")
strSenha=request.form("senhanova")

'Chama o e-mail e a senha
Set dados = abredb.Execute("SELECT * FROM clientes WHERE email='"&Cripto(strEmail,true)&"';")
if dados.EOF then
strEmail = strEmail
else 
strEmail = "sim@."
end if
dados.close
set dados = nothing 
if strEmail = "" then
strEmail = strEmaila
else

'Valida o e-mail
if instr(strEmail, "@") = 0 Or instr(strEmail, ".") = 0 then
abredb.close
set abredb = nothing
response.redirect "email_senha.asp?erro2=- " & strLg152
end if
if strEmail = "sim@." then
abredb.close
set abredb = nothing
response.redirect "email_senha.asp?erro2=- " & strLg162
end if
end if

'Chama a senha
set rsAsk = abredb.Execute("select senha FROM clientes WHERE email='"&Cripto(strEmaila,true)&"';")
if strSenhaa = "" OR strSenha = "" then
strSenha = Cripto(rsAsk("senha"),false)
strSenhaa = Cripto(rsAsk("senha"),false)
end if
if Cripto(rsAsk("senha"),false) <> strSenhaa then
rsAsk.close
set rsAsk = nothing
Conn.close
set Conn = nothing
response.redirect "email_senha.asp?erro=- " & strLg163
else
set rsQuery = abredb.Execute("update clientes set email='"&Cripto(strEmail,true)&"', senha='"&Cripto(strSenha,true)&"' WHERE email='"&Cripto(strEmaila,true)&"';")
abredb.execute("update compras set clienteid='"& Cripto(strEmail,true) &"' where clienteid='"&Cripto(strEmaila,true)&"'")
end if
rsAsk.close
set rsAsk = nothing

'Loga novamente se o usuario tiver mudado o email
checkPass = "select email,senha from clientes where email='"&Cripto(strEmail,true)&"';"
set passSet = abredb.Execute(checkPass)
real_password = Cripto(trim(passSet("senha")),false)
Application.lock
session("usuario") = strEmail
Application.unlock
session.timeout = 999
response.cookies(""&nomeloja&"")("usuario")= strEmail
response.cookies(""&nomeloja&"").expires = "01/01/"&year(now) + 1
passSet.close
set passSet = nothing
%>
  			<table><tr><td align="left" valign="top">
						   <table border="0" cellspacing="4" cellpadding="4" width=590>
						   <tr><td> <font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <a href=dados.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg9%>';return true;"><b><%=strLg9%></b></a> » <%=strLg146%><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table> <br><br><p align=center><font style=font-size:17px; color=#000000><b><%=strLg150%></b></font></p><p align=center><%=strLg151%><br></p><p align=center></p><p align=center></b><a href=default.asp><img src="linguagens/portuguesbr/imagens/continuar.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg68%>';return true;" border=0></a></p> <br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div></td></tr>
						   </table></td></tr>
			</table>
		<!-- #include file="baixo.asp" -->
<%
response.end
else

'Chama os dados do usuario
Set dados = abredb.Execute("SELECT email,senha FROM clientes WHERE email='"&Cripto(session("usuario"),true)&"';")
if dados.EOF OR dados.EOF then
dados.close
set dados = nothing
abredb.close
set abredb = nothing
response.redirect "default.asp"
else
strEmail = Cripto(dados("email"),false)
strSenha = Cripto(dados("senha"),false)
end if
%>
  	  	 <SCRIPT>
		 		 <!--
				 function mesmos() {
				 		  var currentState = document.registro1.mesmo.unchecked;
						  var newState = document.registro1.mesmo.checked;
				if (newState != currentState){
				   document.registro1.novoemail.disabled =! newState;
				   document.registro1.mesmoz.checked =! newState;
				   document.registro1.senhaatual.disabled = newState;
				   document.registro1.senhanova.disabled = newState;
			   if (document.registro1.senhanova.disabled = newState){
			   	  document.registro1.senhanova.value = '';
				  document.registro1.senhaatual.value = '';  
			   }
			   }
		      }
			  function mesmosz() {
			  		   var currentState = document.registro1.mesmoz.unchecked;
					   var newState = document.registro1.mesmoz.checked;
				if (newState != currentState){
				   document.registro1.senhaatual.disabled =! newState;
				   document.registro1.senhanova.disabled =! newState;
				   document.registro1.mesmo.checked =! newState;
				   document.registro1.novoemail.disabled = newState;
			   if (document.registro1.novoemail.disabled = newState){
			   	  document.registro1.novoemail.value = '';
				 }
			  }
			 }
			 -->
		</SCRIPT>
		<table><tr><td align="left" valign="top">
					   <table border="0" cellspacing="4" cellpadding="4" width=590>
					   		  <tr><td> <font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <a href=dados.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg9%>';return true;"><b><%=strLg9%></b></a> » <%=strLg146%><br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div><font face="<%=fonte%>" style=font-size:10px;color:000000><%=strLg164%><br><%=strLg165%></font>
							  		   <table cellspacing="1" cellpadding="1" align="center" width=98%><form action=email_senha.asp?acao=atualiza method=post name="registro1" onMouseOver="javascript: mesmosz();"><input type=hidden name=email value=<%=strEmail%>><tr><td colspan=3><br><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b><%=strLg166%>  - </b><font face="<%=fonte%>" style=font-size:10px;color:000000><%=strLg70%><input type=checkbox name=mesmo onclick="javascript: mesmos()"> <%=strLg167%><br> <font size=1 color=red></b><%=request.querystring("erro2")%></font><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
									   <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg168%></td><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b><%=strEmail%></b></td></tr>
									   <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg169%></td><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><input type=text size=30 name=novoemail style=font-family:<%=fonte%>;font-size:11px;color:#000000;></td></tr>
									   <tr><td colspan=3><br><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b><%=strLg170%> - </b><font face="<%=fonte%>" style=font-size:10px;color:000000><%=strLg70%> <input type=checkbox name=mesmoz value=sim onclick="javascript: mesmosz()"> <%=strLg171%><br><font size=1 color=red></b><%=request.querystring("erro")%></font><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
									   <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg172%></td><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><input type=password size=23 name=senhaatual style=font-family:<%=fonte%>;font-size:11px;color:#000000; value=""></b></td></tr>
									   <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg173%></td><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><input type=password size=23 name=senhanova style=font-family:<%=fonte%>;font-size:11px;color:#000000; value=""></td></tr>
									   <tr><td colspan=3><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
									   <tr><td colspan=3 align=right></td></tr><tr align=center><td valign=top><div id="layer1" style="position:absolute; left:320px"><input type=image src=linguagens/portuguesbr/imagens/atualiza.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg66%>';return true;"></div></td><td valign=top></form><div id="layer1" style="position:absolute; left:485px"><a href=dados.asp><img src="linguagens/portuguesbr/imagens/cancelar.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg100%>';return true;" border=0></a></div></td></tr>
									   </table></form></td></tr>
					</table></td></tr>
		</table>
		<!-- #include file="baixo.asp" -->
		<%end if%>