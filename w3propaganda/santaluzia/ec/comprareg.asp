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
'Loga o usuario
if request.querystring ("login") = "sim" then
username = request("email")
password = request("senha") 
set passSet = abredb.Execute("select email,senha from clientes where email='"&Cripto(username,true)&"';")
if passSet.EOF then 

'Fecha o banco de dados
abredb.close
set abredb = nothing
response.redirect"fechapedido.asp?compra=entrar&erro=- " & strLg183 & "&user=x"
else

'Valida a senha
real_password = cripto(trim(passSet("senha")),false)
if password = real_password then
Application.lock
session("usuario") = username
Application.unlock
session.timeout = 999
response.cookies(""&nomeloja&"")("usuario")= username
response.cookies(""&nomeloja&"").expires = "01/01/"&year(now) + 1
else 
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=entrar&erro2=- " & strLg184 & "&user="&username
end if
end if 
abredb.close
set abredb = nothing
response.redirect "default.asp"
passSet.close
set passSet = nothing

'Fecha o banco de dados
abredb.close
set abredb = nothing
else
username = request("email")
password = request("senha") 
checkPass = "select email,senha from clientes where email='"&Cripto(username,true)&"';"
set passSet = abredb.Execute(checkPass)
if passSet.EOF then 
abredb.close
set abredb = nothing
response.redirect"fechapedido.asp?compra=login&erro=- " & strLg183 & "&user=x"
else
real_password = Cripto(trim(passSet("senha")),false)
if password = real_password then
Application.lock
session("usuario") = username
Application.unlock
session.timeout = 999
response.cookies(""&nomeloja&"")("usuario")= username
response.cookies(""&nomeloja&"").expires = "01/01/"&year(now) + 1
else
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=login&erro2=- " & strLg184 & "&user="&username
end if
end if 
passSet.close
set passSet = nothing
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=ok"
end if
%>