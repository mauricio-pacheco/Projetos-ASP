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
<style>
.texto {
	FONT-SIZE: 10px; 
}
.style1 {color: #000000}
</style>
<!-- #include file="topo.asp" -->
<%
'Requisita os dados para o e-mail
if request.querystring("acao") = "ajuda" then
strNome = request.form("nome")
strEmail = request.form("email")
strDuv = request.form("duvida")
strAssunto = request.form("assunto")
strMsg = request.form("msg")
strCCEmail = ""
If strNome = "" then

response.redirect "ajuda_email.asp?erro=- Por favor preencha o seu nome corretamente!&nome="&strNome&"&email="&strEmail&"&assunto="&strAssunto&"&msg="&strMsg
end if

'Verifica se o e-mail é exixtente
If strEmail = "" Or instr(strEmail, "@") = 0 Or instr(strEmail, ".") = 0 then
response.redirect "ajuda_email.asp?erro=- Por favor preencha o seu e-mail corretamente!&nome="&strNome&"&email="&strEmail&"&assunto="&strAssunto&"&msg="&strMsg
end if

'Valida a mensagem
If strMsg = "" then
response.redirect "ajuda_email.asp?erro=- Por favor escreva sua mensagem!&nome="&strNome&"&email="&strEmail&"&assunto="&strAssunto&"&msg="&strMsg
end if
If strAssunto = "" then
strAssunto = "Esclarecimento de dúvida do Cliente"
end if

'Corpo do e-mail
strMensagem = "Nome: " & strNome & vbCrLf & vbCrLf
strMensagem = strBody & vbCrLf & "Email: " & strEmail & vbCrLf & vbCrLf
strMensagem = strMensagem & "Mensagem: " & strMsg & vbCrLf & vbCrLf

'Envia o e-mail
%><!--#include file="email.asp"-->
<%EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), strEmail, "", emailloja, strAssunto, strMensagem%>

   			   	 <table><tr><td align="left" valign="top">
				 				<table border="0" cellspacing="4" cellpadding="4" width=810><tr><td><font face="tahoma,arial,helvetica" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg14%><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><p align=center><font style=font-size:17px; color=#000000><b><%=strLg124%></b></font></p><p align=center><%=strLg125%> <b><%=strNome%></b>, <%=strLg126%><br><br><%=strLg127%><br></p><p align=center></b></p> <br><hr size=1 color=<%=cor3%> width=100%></td></tr>
								</table></td></tr>
				</table>
				<!-- #include file="baixo.asp" -->
<%
response.end
else%>
	  	<script language="javascript">
			function limpa () {
			 document.registro1.nome.value = ''
			 document.registro1.email.value = ''
			 document.registro1.assunto.value = ''
			 document.registro1.msg.value = ''
			 document.registro1.duvida.value = '<%=strLg128%> <%=nomeloja%>?'
		   }
		</script>
				 <table><tr><td align="left" valign="top">
				 			<table border="0" cellspacing="4" cellpadding="4" width=810><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » Fale Conosco<br><br><div align=left> <hr size=1 color=<%=cor3%> width=100%>  </div>
				 			     <br> <font face="<%=fonte%>" style=font-size:13px><strong>Atendimento</strong></font> <font color=red size=1><font color="#4074A6"><%=request.querystring("erro")%></font>
				 			      </p>
				 			      <div align=center>
				 			      <table width="98%" border="0" align="center">
                                    <tr>
                                      <td><img src="telefone.gif"></td>
                                      <td><font style=font-size:11px;font-family:<%=fonte%>>(0xx55) 3744 - 1652</font></td>
                                    </tr>
                                    <tr>
                                      <td><img src="cart.gif"></td>
                                      <td><font style=font-size:11px;font-family:<%=fonte%>><a href="mailto:sac@opticasantaluzia.com.br" class="menu">sac@opticasantaluzia.com.br</a></font></td>
                                    </tr>
                                    <tr>
                                      <td width="3%"></td>
                                      <td width="97%"></td>
                                    </tr>
                        </table>			 			      
				 			      <div align="left"><font face="<%=fonte%>" style=font-size:13px><strong><br>
		 			              <span class="style1"><%=strLg17%></span></strong></font> <span class="style1"><font color=red size=1><%=request.querystring("erro")%>
				 			        </p>
				 			        </span>
		 			              <div align=center class="style1">		 			          </div>
		 			      <table border="0" cellspacing="3" cellpadding="3" width=784 align=center><td width="21"><form action="ajuda_email.asp?acao=ajuda" name=registro1 method=post><tr><td><font style=font-family:<%=fonte%>;font-size=11px; color=#000000> <%=strLg129%> </FONT></TD><td width="742"><input type="text" name="nome" size="50" maxlength="60" class="texto" value="<%=request.querystring("nome")%>"></TD></tr>
								    <tr><td><font style="font-family: <%=fonte%>; font-size:11px;" color=#000000> <%=strLg108%></FONT></TD><td><INPUT TYPE="TEXT" NAME="email"  size="30" MAXLENGTH=60 class=""texto value="<%=request.querystring("email")%>"></TD></TR>
									<tr><td><font style="font-family: <%=fonte%>; font-size:11px;" color=#000000><%=strLg132%> </FONT></TD><TD><INPUT TYPE="Text" NAME="assunto" SIZE="60" MAXLENGTH="60" class="texto" value="<%=request.querystring("assunto")%>"></TD></TR>
									<tr><td><font style="font-family: <%=fonte%>; font-size:11px;" color=#000000><%=strLg133%><BR></TD><TD>&nbsp;</TD></TR>
									<tr><td COLSPAN=2><textarea class="texto" cols="80" rows="12" name="msg" wrap="hard" ><%=request.querystring("msg")%></textarea></TD></TR>
									</table>
											<table align=center><tr><td><input type=image src=<%=dirlingua%>/imagens/envi.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg140%>';return true;"></td></form><form action="javascript: limpa()"><td><input type=image src=<%=dirlingua%>/imagens/limpar.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg89%>';return true;"></td></tr></form></table>
										</CENTER><br><div align=left> <hr size=1 color=<%=cor3%> width=100%></div></FORM></td>
				 			</tr>
							</table></td></tr>
				</table>
			<!-- #include file="baixo.asp" -->
<%end if%>
