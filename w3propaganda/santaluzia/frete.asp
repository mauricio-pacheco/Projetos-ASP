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
   				<tr><td valign="center" align="left" colspan=3><font face="<%=fonte%>" style=font-size:11px;color:000000><strong><%=strLg64%>&nbsp;<strong><select name="frete" style=font-size:10px;font-family:<%=fonte%>; onchange="javascript: document.registro1.submit();"><option value=""><%=strLg185%></option> <option value="">--------------------------------------</option>
				<option value="<%=estado_ac%>acc" <%=e1%>>Acre - Capital</option><option value="<%=estado_ac%>acx" <%=e2%>>Acre - Interior</option><option value="<%=estado_al%>alc" <%=e3%>>Alagoas - Capital</option><option value="<%=estado_al%>alx" <%=e4%>>Alagoas - Interior</option><option value="<%=estado_ap%>apc" <%=e5%>>Amapá - Capital</option>	<option value="<%=estado_ap%>apx" <%=e6%>>Amapá - Interior</option><option value="<%=estado_am%>amc" <%=e7%>>Amazonas - Capital</option><option value="<%=estado_am%>amx" <%=e8%>>Amazonas - Interior</option><option value="<%=estado_ba%>bac" <%=e9%>>Bahia - Capital</option><option value="<%=estado_ba%>bax" <%=e10%>>Bahia - Interior</option><option value="<%=estado_ce%>cec" <%=e11%>>Ceará - Capital</option><option value="<%=estado_ce%>cex" <%=e12%>>Ceará - Interior</option><option value="<%=estado_df%>dfc" <%=e13%>>Distrito Federal - Capital</option><option value="<%=estado_df%>dfx" <%=e14%>>Distrito Federal - Interior</option><option value="<%=estado_es%>esc" <%=e15%>>Espirito Santo - Capital</option><option value="<%=estado_es%>esx" <%=e16%>>Espirito Santo - Interior</option><option value="<%=estado_go%>goc" <%=e17%>>Goiás - Capital</option><option value="<%=estado_go%>gox" <%=e18%>>Góiás - Interior</option><option value="<%=estado_ma%>mac" <%=e19%>>Maranhão - Capital</option>
				<option value="<%=estado_ma%>max" <%=e20%>>Maranhão - Interior</option><option value="<%=estado_mt%>mtc" <%=e21%>>Mato Grosso - Capital</option><option value="<%=estado_mt%>mtx" <%=e22%>>Mato Grosso - Interior</option><option value="<%=estado_ms%>msc" <%=e23%>>Mato Grosso do Sul - Capital</option><option value="<%=estado_ms%>msx" <%=e24%>>Mato Grosso do Sul - Interior</option><option value="<%=estado_mg%>mgc" <%=e25%>>Minas Gerais - Capital</option><option value="<%=estado_mg%>mgx" <%=e26%>>Minas Gerais - Interior</option>	<option value="<%=estado_pa%>pac" <%=e27%>>Pará - Capital</option><option value="<%=estado_pa%>pax" <%=e28%>>Pará - Interior</option>	<option value="<%=estado_pb%>pbc" <%=e29%>>Paraiba - Capital</option><option value="<%=estado_pb%>pbx" <%=e30%>>Paraiba - Interior</option><option value="<%=estado_pr%>prc" <%=e31%>>Parana - Capital</option><option value="<%=estado_pr%>prx" <%=e32%>>Parana - Interior</option><option value="<%=estado_pe%>pec" <%=e33%>>Pernambuco - Capital</option><option value="<%=estado_pe%>pex" <%=e34%>>Pernambuco - Interior</option><option value="<%=estado_pi%>pic" <%=e35%>>Piauí - Capital</option><option value="<%=estado_pi%>pix" <%=e36%>>Piauí - Interior</option><option value="<%=estado_rj%>rjc" <%=e37%>>Rio de Janeiro - Capital</option><option value="<%=estado_rj%>rjx" <%=e38%>>Rio de Janeiro - Interior</option><option value="<%=estado_rn%>rnc" <%=e39%>>Rio Grande do Norte - Capital</option>
				<option value="<%=estado_rn%>rnx" <%=e40%>>Rio Grande do Norte - Interior</option>	<option value="<%=estado_rs%>rsc" <%=e41%>>Rio Grande do Sul - Capital</option><option value="<%=estado_rs%>rsx" <%=e42%>>Rio Grande do Sul - Interior</option><option value="<%=estado_ro%>roc" <%=e43%>>Rondônia - Capital</option><option value="<%=estado_ro%>rox" <%=e44%>>Rondônia - Interior</option><option value="<%=estado_rr%>rrc" <%=e45%>>Roraima - Capital</option><option value="<%=estado_rr%>rrx" <%=e46%>>Roraima - Interior</option><option value="<%=estado_sc%>scc" <%=e47%>>Santa Catarina - Capital</option><option value="<%=estado_sc%>scx" <%=e48%>>Santa Catarina - Interior</option><option value="<%=estado_sp%>spc" <%=e49%>>São Paulo - Capital</option><option value="<%=estado_sp%>spx" <%=e50%>>São Paulo - Interior</option><option value="<%=estado_se%>sec" <%=e51%>>Sergipe - Capital</option>	<option value="<%=estado_se%>sex" <%=e52%>>Sergipe - Interior</option>	<option value="<%=estado_to%>toc" <%=e53%>>Tocantins - Capital</option><option value="<%=estado_to%>tox" <%=e54%>>Tocantins - Interior</option></select></font></strong></strong></td>
<%
'Joga na tela o valor 0.00 se o frete for vazio
if intFrete = "0" then
valorfretefim = "0.00"
else
valorfretefim = formatNumber(intFrete,2)
end if
%>
  	  <td colspan="2" align="right" valign="center"><font face="<%=fonte%>" style=font-size:11px;color:000000><strong><b><%= strLgMoeda & " " & valorfretefim %></b><strong></font></strong></strong></td></tr>