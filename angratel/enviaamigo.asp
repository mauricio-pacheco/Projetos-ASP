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
<!--#include file="df.asp"-->
<style type="text/css">
<!--
a:link       { color: <%=cor4%> }
a:visited    { color: <%=cor4%> }
a:hover      { color: <%=cor5%> }
-->
</style>
<%
'Chama  id do produto
produto = request.querystring("produto")
Set dados = abredb.Execute("SELECT email,nome FROM clientes WHERE email='"&Cripto(session("usuario"),true)&"';")
if dados.EOF then
nomez = ""
else
nomez = Cripto(dados("nome"),false)
end if
dados.Close
set dados = Nothing
%>
<html>
   <head>
    <title><%=nomeloja%> - <%=slogan%></title>
   </head>
   <body>
<%
if request.querystring("acao") = "abre" then%>
   					<table><form action="enviaamigo.asp?acao=cadastra" method="post"><input type=hidden name=produto value="<%=produto%>"><tr><td width=130><font style=font-size:11px;font-family:tahoma,arial,helvetica;color:000000>Seu nome completo:</td><td><input name="nomeamigo" type="text"  style=font-size:11px;font-family:tahoma,arial,helvetica;color:000000></td></tr>
					  <tr><td width=130><font style=font-size:11px;font-family:tahoma,arial,helvetica;color:000000>Seu E-mail:</td><td><input name="emailamigo" type="text" style=font-size:11px;font-family:tahoma,arial,helvetica;color:000000></td></tr>
					  <tr><td width=130><font style=font-size:11px;font-family:tahoma,arial,helvetica;color:000000>Opção de Compra:</td><td><input name="nome" type="text" style=font-size:11px;font-family:tahoma,arial,helvetica;color:000000 value="<%=nomez%>"></td></tr>
					  <tr><td colspan=2><font style=font-size:11px;font-family:tahoma,arial,helvetica;color:000000>Sua mensagem (opcional):</td></tr>
					  <tr><td colspan=2><textarea name="msgnome" rows=4 cols=45 style=font-size:11px;font-family:tahoma,arial,helvetica;color:000000></textarea></td></tr>
					  <tr><td colspan="2"><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr><tr><td colspan="2"align=center><a href="javascript:window.close();"><img src="<%=dirlingua%>/imagens/env_oferta2.gif" border="0"></a><input type="image" src="<%=dirlingua%>/imagens/env_oferta.gif" border="0">
					    </td></tr></form>
					</table>
<%
end if
if request.querystring("acao") = "cadastra" then

'Chama o id do produto
produto = request.form("produto")   
Set rsProdInfo = abredb.Execute("SELECT * FROM produtos where idprod="&produto&";")
prodnome = rsProdInfo("nome")
amigo = request.form("nomeamigo")
emaila = request.form("emailamigo")
nome = request.form("nome")
msgn = request.form("msgnome")
rsProdInfo.close
set rsProdInfo = nothing
if amigo = "" then
%>
<html>
   <head>
    <title><%=nomeloja%> - <%=slogan%></title>
   </head>
   <body>
   <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><br><center><b><font style=font-size:13px;font-family:tahoma,arial,helvetica>Digite corretamente o nome do amigo que esta oferta será enviada!<br><br><br><font style=font-size:11px><a href="javascript: history.back()" style="text-decoration:none;">:: Voltar ::</a><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><font style=font-size:11px><a href="javascript: window.close()" style="text-decoration:none;">:: Fechar esta Janela ::</a>
<%
response.end
end if

'Valida o e-mail
if emaila = "" OR  instr(emaila, "@") = 0 Or instr(emaila, ".") = 0 then%>
<html>
   <head>
    <title><%=nomeloja%> - <%=slogan%></title>
   </head>
   <body>
   <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><br><center><b><font style=font-size:13px;font-family:tahoma,arial,helvetica>Digite corretamente o email do amigo que esta oferta será enviada!<br><br><br><font style=font-size:11px><a href="javascript: history.back()" style="text-decoration:none;">:: Voltar ::</a><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><font style=font-size:11px><a href="javascript: window.close()" style="text-decoration:none;">:: Fechar esta Janela ::</a>
<%
response.end
end if
if nome = "" then%>
<html>
   <head>
    <title><%=nomeloja%> - <%=slogan%></title>
   </head>
   <body><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><br><center><b><font style=font-size:13px;font-family:tahoma,arial,helvetica>Digite corretamente o seu nome para que esta oferta seja enviada!<br><br><br><font style=font-size:11px><a href="javascript: history.back()" style="text-decoration:none;">:: Voltar ::</a><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><font style=font-size:11px><a href="javascript: window.close()" style="text-decoration:none;">:: Fechar esta Janela ::</a>
<%
response.end
end if

'Corpo do e-mail
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
strMensagem = strMensagem & "      <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=" & cor3 & "></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "      </FONT></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4><BR><FONT face="&fonte&" style=font-size:13px>Olá <b>"&amigo&"</b>,"
strMensagem = strMensagem & "      <br><BR>Seu amigo <b>"&nome&"</b> visitou a loja <b>"&nomeloja&"</b> e lhe recomendou a seguinte oferta:</b> <BR><BR>"
strMensagem = strMensagem & "      <b>» "&prodnome&"</b>"
if msgn <> "" then
strMensagem = strMensagem & " <br><br>Mensagem que o seu amigo escreveu para você:<br>"
strMensagem = strMensagem & " <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"&msgn&"</b>."
end if
strMensagem = strMensagem & "      <br><br>Para visualizar a oferta visite o link abaixo:"
strMensagem = strMensagem & "      <br><b><a href='http://"&urlloja&"'/produtos.asp?produto="&produto&"' target=_new><font style=font-size:11px>Visualizar sua oferta!</a></b></font>"
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
<%EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), emailloja, amigo, emaila, "Veja essa oferta!", strMensagem%>
  			   <table>
			     <tr><td><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
				 <tr><td><font style=font-size:11px;font-family:tahoma,arial,helvetica;color:000000><BR>A oferta foi enviada com sucesso...<BR><BR>de: <b><%=nome%></b><br> para: <b><%=amigo%></b> <BR>no e-mail: <b><%=emaila%></b><BR><BR><CENTER> Agradecemos por indicar os produtos da <%=nomeloja%>!</CENTER><BR></td></tr>
				 <tr><td><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
				 <tr><td align=center><font style=font-size:11px;font-family:tahoma,arial,helvetica;color:000000><a href="javascript: window.close()" style="text-decoration:none;"><b>:: Fechar esta Janela ::</b></a></td></tr></table>
<%
else
end if

'Fecha o banco de dados
abredb.close
set abredb = nothing%>