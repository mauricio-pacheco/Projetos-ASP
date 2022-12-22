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
'Verifica a senha do usuario
if request.querystring("senha") = "enviar" then
strEmail = request.form("email")

'Chama a senha do usuario
Set dados = abredb.Execute("SELECT senha, email FROM clientes WHERE email='"&Cripto(strEmail,true)&"'")
if dados.EOF then
strEmail = "sim@."
else 
strEmail = strEmail
end if
if strEmail = "" OR instr(strEmail, "@") = 0 Or instr(strEmail, ".") = 0 then
dados.close
set dados = nothing

'Fecha o banco de dados
abredb.close
set abredb = nothing
response.redirect "senha.asp?erro="&strLg245
end if

if strEmail = "sim@." then
dados.close
set dados = nothing
response.redirect "senha.asp?erro="&strLg244
end if
strSenha = Cripto(dados("senha"),false)

'Corpo do e-mail com a senha do cliente
strMensagem = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>"
strMensagem = strMensagem & "<HTML><HEAD>"
strMensagem = strMensagem & "<META content='text/html; charset=iso-8859-1' http-equiv=Content-Type>"
strMensagem = strMensagem & "<META content='MSHTML 5.00.2614.3500' name=GENERATOR></HEAD>"
strMensagem = strMensagem & "<BODY>"
strMensagem = strMensagem & "<TABLE border=0 cellSpacing=0 width='98%'>"
strMensagem = strMensagem & "  <TBODY>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4 height=42>"
strMensagem = strMensagem & "      <DIV align=center><font face="&fonte&"><B><FONT style=font-size:17px color=000000>"&tituloloja&"</FONT></B><BR><FONT style=font-size:11px>"&endereco11&" - "&bairro11&"<BR>"&cidade11&"/"&estado11&" - "&pais11&" - <a href='mailto:"&emailloja&"'>"&emailloja&"<BR></FONT></DIV></FONT></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4><FONT face="&fonte&">"
strMensagem = strMensagem & "      <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "      </FONT></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4><BR><FONT face="&fonte&" style=font-size:13px>Esta é o e-mail resposta com "
strMensagem = strMensagem & "      os dados requisitados: <BR>Sua senha é: <STRONG><FONT style=font-size:17px>"& strSenha &"<BR><BR>"
strMensagem = strMensagem & "      <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "      </FONT></STRONG></FONT></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4><FONT face="&fonte&"><B><FONT style=font-size:13px>Equipe "
strMensagem = strMensagem & "      "&nomeloja&"</FONT></B><BR></FONT><FONT face="&fonte&"><A "
strMensagem = strMensagem & "      href='http://"&urlloja&"'><FONT style=font-size:11px>"&urlloja&"</A><BR><FONT "
strMensagem = strMensagem & "      style=font-size:10px></FONT><FONT face="&fonte&"><A "
strMensagem = strMensagem & "      href='mailto:"&emailloja&"'><FONT style=font-size:11px>"&emailloja&"</A><BR></FONT></FONT></FONT></TD></TR></TBODY></TABLE></BODY></HTML>"

'Envia o e-mail
%><!--#include file="email.asp"-->
<%EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), emailloja, "", strEmail, "Sua senha da loja "&nomeloja&"!", strMensagem%>

  			   <table><tr><td align="left" valign="top">
			   				  <table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='Home';return true;"><b>Home</b></a> » <%=strLg182%><br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div><font face="<%=fonte%>" style=font-size:13px><strong><br><%=strLg246%></strong></font></p><BR><p align="center"><font face="<%=fonte%>"  style=font-size:11px color=000000><%=strLg247%> <B><%=strEmail%></B>!<br><br><br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div><br><center><a HREF="default.asp" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b><%=strLg41%></b> ::</a></font></center>
							  
<%
dados.close
set dados = nothing
else
%>
  		  <table><tr><td align="left" valign="top">
		  				 <table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='Home';return true;"><b>Home</b></a> » <%=strLg182%><br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div><font face="<%=fonte%>" style=font-size:13px><strong><br><%=strLg246%></strong></font></p><p align="center"><font face="<%=fonte%>"  style=font-size:11px color=000000><%=strLg248%><br><form action=senha.asp?senha=enviar method=post><table><tr><td><font color=red size=1><center><%=request.querystring("erro")%></center></font><br><font face="<%=fonte%>"  style=font-size:11px color=000000><%=strLg249%> <input name="email" size="35" value="" style=font-size:11px;font-family:<%=fonte%>> <font face=<%=fonte%> style=font-size:10px; color=red>  </td></tr><tr><td align=center><input type="image" src="<%=dirlingua%>/imagens/env_senha.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg250%>';return true;"></td></tr>
						 </table></form><br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table>  </div><%end if%>
		</td></tr></table>
</td></tr></table>
<!-- #include file="baixo.asp" -->
