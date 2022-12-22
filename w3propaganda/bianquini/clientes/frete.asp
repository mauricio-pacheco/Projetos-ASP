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

if estaos="acc" then e1 = "selected" end if
if estaos="acx" then e2 = "selected" end if
if estaos="alc" then e3 = "selected" end if
if estaos="alx" then e4 = "selected" end if
if estaos="apc" then e5 = "selected" end if
if estaos="apx" then e6 = "selected" end if
if estaos="amc" then e7 = "selected" end if
if estaos="amx" then e8 = "selected" end if
if estaos="bac" then e9 = "selected" end if
if estaos="bax" then e10 = "selected" end if
if estaos="cec" then e11 = "selected" end if
if estaos="cex" then e12 = "selected" end if
if estaos="dfc" then e13 = "selected" end if
if estaos="dfx" then e14 = "selected" end if
if estaos="esc" then e15 = "selected" end if
if estaos="esx" then e16 = "selected" end if
if estaos="goc" then e17 = "selected" end if
if estaos="gox" then e18 = "selected" end if
if estaos="mac" then e19 = "selected" end if
if estaos="max" then e20 = "selected" end if
if estaos="mtc" then e21 = "selected" end if
if estaos="mtx" then e22 = "selected" end if
if estaos="msc" then e23 = "selected" end if
if estaos="msx" then e24 = "selected" end if
if estaos="mgc" then e25 = "selected" end if
if estaos="mgx" then e26 = "selected" end if
if estaos="pac" then e27 = "selected" end if
if estaos="pax" then e28 = "selected" end if
if estaos="pbc" then e29 = "selected" end if
if estaos="pbx" then e30 = "selected" end if
if estaos="prc" then e31 = "selected" end if
if estaos="prx" then e32 = "selected" end if
if estaos="pec" then e33 = "selected" end if
if estaos="pex" then e34 = "selected" end if
if estaos="pic" then e35 = "selected" end if
if estaos="pix" then e36 = "selected" end if
if estaos="rjc" then e37 = "selected" end if
if estaos="rjx" then e38 = "selected" end if
if estaos="rnc" then e39 = "selected" end if
if estaos="rnx" then e40 = "selected" end if
if estaos="rsc" then e41 = "selected" end if
if estaos="rsx" then e42 = "selected" end if
if estaos="roc" then e43 = "selected" end if
if estaos="rox" then e44 = "selected" end if
if estaos="rrc" then e45 = "selected" end if
if estaos="rrx" then e46 = "selected" end if
if estaos="scc" then e47 = "selected" end if
if estaos="scx" then e48 = "selected" end if
if estaos="spc" then e49 = "selected" end if
if estaos="spx" then e50 = "selected" end if
if estaos="sec" then e51 = "selected" end if
if estaos="sex" then e52 = "selected" end if
if estaos="toc" then e53 = "selected" end if
if estaos="tox" then e54 = "selected" end if 
%> 
   				<tr><td valign="center" align="left" colspan=3><font face="<%=fonte%>" style=font-size:11px;color:000000><strong>Selecione o cliente para a venda:&nbsp;<strong><select name="frete" style=font-size:10px;font-family:<%=fonte%>; onchange="javascript: document.registro1.submit();"><option value="">--------------------------------------</option>
				<option value="<%=estado_ac%>acc" <%=e1%>>Marcelo dos Santos</option></select></font></strong></strong></td>
<%
'Joga na tela o valor 0.00 se o frete for vazio
if intFrete = "0" then
valorfretefim = "0.00"
else
valorfretefim = formatNumber(intFrete,2)
end if
%>
  	  <td colspan="2" align="right" valign="center"></td></tr>