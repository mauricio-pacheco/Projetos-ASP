<style type="text/css">
<!--
.style1 {
	font-size: 9px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-style: italic;
}
.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
}
.style4 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 14px;
}
-->
</style>
<TABLE cellSpacing=0 cellPadding=15 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD background="fundo.jpg" class=PresentacionHomeBC>
                       <TABLE id=table__15956 cellSpacing=0 cellPadding=0 
                        width="100%" border=0>
                          <TBODY>
                          <TR>
                            <TD width="2%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><img src="seta.gif" width="12" height="12"></TD>
                            <TD width="43%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><span class="PresentacionHomeBD" style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif">&nbsp;Home</span></TD>
                            <TD width="55%" align="left" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><script language="JavaScript" type="text/JavaScript">
var datahora,xhora,xdia,dia,mes,ano,txtsaudacao;
datahora = new Date();
xhora = datahora.getHours();
if (xhora >= 0 && xhora < 12) {txtsaudacao = "Bom Dia!"}
if (xhora >= 12 && xhora < 18) {txtsaudacao = "Boa Tarde!"}
if (xhora >= 18 && xhora <= 23) {txtsaudacao = "Boa Noite!"}
xdia = datahora.getDay();
diasemana = new Array(7);
diasemana[0] = "Domingo";
diasemana[1] = "Segunda-feira";
diasemana[2] = "Terça-feira";
diasemana[3] = "Quarta-feira";
diasemana[4] = "Quinta-feira";
diasemana[5] = "Sexta-feira";
diasemana[6] = "Sábado";
dia = datahora.getDate();
mes = datahora.getMonth();
mesdoano = new Array(12);
mesdoano[0] = "janeiro";
mesdoano[1] = "fevereiro";
mesdoano[2] = "março";
mesdoano[3] = "abril";
mesdoano[4] = "maio";
mesdoano[5] = "junho";
mesdoano[6] = "julho";
mesdoano[7] = "agosto";
mesdoano[8] = "setembro";
mesdoano[9] = "outubro";
mesdoano[10] = "novembro";
mesdoano[11] = "dezembro";
ano = datahora.getFullYear();
document.write(txtsaudacao + " Hoje, " + diasemana[xdia] + ", " + dia + " de " + mesdoano[mes] + " de " + ano);
</script></TD>
                          </TR>
						  <TR height="1">
                            <TD width="2%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif">&nbsp;</TD>
                            <TD width="43%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif">&nbsp;</TD>
                            <TD width="55%" align="left" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"></TD>
                          </TR>
                          </TBODY></TABLE>
                        <table width="100%" height="350" border="0">
                          <tr>
                            <td><table width="524" border="0" align="center">
                              <tr>
                                <td><div align="justify">
                                  <table width="100%" border="0">
                                    <tr>
                                      <td><div align="center"><span class="style4">Eventos e Viagens em Destaque </span></div></td>
                                    </tr>
                                    <tr>
                                      <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td width="70%"><div align="justify">
                                        <p class="fontedestaque style2"><span style="color: #434343">
                                          <%
		'Efetuando a conex&atilde;o com a base de dados criada -----------------------
Set Conn = Server.CreateObject("AdoDb.Connection") 
Conn.provider="Microsoft.Jet.OLEDB.4.0" 
Conn.connectionstring=Server.Mappath("home/mateus.mdb") 
Conn.open 
'--------------------------------------------------------------------------

'Vamos criar o objeto Record Set -> neste caso &eacute; necess&aacute;rio declar&aacute;-lo,
'pois vamos utilizar algumas fun&ccedil;&otilde;es deste objeto 
Set RS = Server.CreateObject("adodb.recordset")

RS.PageSize = 4 'quantidade de registros por p&aacute;gina. Voc&ecirc; pode alterar sem conforme precise.

'Vamos fazer a busca na tabela contatos
SQL = "select * from convenios ORDER BY data DESC" 
RS.Open SQL,Conn,3,3

'Vamos agora verificar exce&ccedil;&otilde;es do tipo &ldquo;fim de arquivo&rdquo; (EOF), se a p&aacute;gina atual &eacute; menor 
'que zero, se &eacute; maior que o n&uacute;mero total de p&aacute;ginas, etc.
   'Definindo em qual pagina o visitante est&aacute;
   IF Request.QueryString("pagina")="" then 
      intpagina=1 
   ELSE
      IF cint(Request.QueryString("pagina"))<1 then
         intpagina=1 
      ELSE
         IF cint(Request.QueryString("pagina"))> RS.PageCount then 
            intpagina=RS.PageCount 
         ELSE
            intpagina=Request.QueryString("pagina")
         END IF
      END IF
   END IF
'Fim das verifica&ccedil;&otilde;es de exce&ccedil;&otilde;es

'Usamos a propriedade AbsolutePage para dizer ao RS que p&aacute;gina ele esta 
RS.AbsolutePage=intpagina

' Inicia o contador que vai controlar os registros mostrados
intrec=0

'Enquanto o contador for menor que a quantidade de registros mostrados ou
' n&atilde;o for o final do arquivo 
While intrec < RS.PageSize and not RS.EOF 
'------------------- AQUI VEM TUDO O QUE SE&Aacute; PAGINADO -----------------------
   
   id = rs("ID")
		
   
   Response.Write ("<font size=""1"">")
   
   Response.Write ("<table width=""100%"" border=""0"" align=""center""><tr><td width=""29%""><img src=home/" & RS("foto") & " border=""1""></td>")
   Response.Write ("<td width=""90%""><img src=""caixa.gif"" border=""0"">&nbsp;<font size=""1"" face=""Verdana""><b>" & RS("nome") & "</b></font><br><font size=""1"" face=""Verdana"">" & RS("comentario") & "</font></td></tr></table>")                  
   Response.Write ("</font>")
                  
   
   
'---------------------------------------------------------------------------------------------
   RS.MoveNext

   ' Acrescenta +1 ao contador
   intrec=intrec+1 
   'Se for EOF (fim de arquivo), imprimir branco na tela
   IF RS.EOF then 
      response.write " " 
   END IF
Wend 'fim do loop

'Vamos verificar se n&atilde;o &eacute; a p&aacute;gina 1, para podermos colocar o link &ldquo;anterior&rdquo;. 
IF intpagina > 1 then 
   %>
                                        </span></p>
                                        <p class="fontedestaque style2"><span style="color: #434343"> <br />
                                          </span> <span style="color: #434343"> <a class="menulinkpreto" href="home.asp?pagina=<%=intpagina-1%>"><img border="0" src="seta1152.gif" width="7" height="7" />&nbsp;Anterior</a>
                                          <% 
END IF

'Se n&atilde;o estivermos no &uacute;ltimo registro contado, ent&atilde;o &eacute; mostrado o link p/ a pr&oacute;xima p&aacute;gina 
IF strcomp(intpagina,RS.PageCount) <> 0 then 
%>
                                          <a class="menulinkpreto" href="home.asp?pagina=<%=intpagina + 1%>">Pr&oacute;xima&nbsp;<img border="0" src="seta115.gif" width="7" height="7" /></a>
                                          <% 
END IF
%>
                                        </span></p>
                                      </div></td>
                                    </tr>
                                  </table>
                                </div></td>
                              </tr>
                              <tr>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td><table width="100%" border="0">
                                  <tr>
                                    <td><div align="center"><a href="passaporte.asp"><img src="pass2.gif" width="80" height="60" border="0" alt="FAÇA O SEU PASSAPORTE" /></a></div></td>
                                    <td><div align="center"><a href="dicas.asp"><img src="luz.jpg" width="47" height="60" border="0" alt="DICAS DE VIAGEM" /></a></div></td>
                                    <td><div align="center"><a href="seguro.asp"><img src="imgmalas.jpg" width="80" height="64" border="0" alt="SEGUROS PARA VIAGENS" /></a></div></td>
                                    <td><div align="center"><a href="passagens.asp"><img src="aviao.jpg" width="74" height="60" border="0" alt="PASSAGENS AÉREAS" /></a></div></td>
                                  </tr>
                                  <tr>
                                    <td width="24%"><div align="center"><span class="style1">FA&Ccedil;A O SEU PASSAPORTE</span></div></td>
                                    <td width="26%"><div align="center"><span class="style1">DICAS DE VIAGEM</span></div></td>
                                    <td width="26%"><div align="center"><span class="style1">SEGUROS PARA VIAGENS</span></div></td>
                                    <td width="24%"><div align="center"><span class="style1">PASSAGENS A&Eacute;REAS </span></div></td>
                                  </tr>
                                </table></td>
                              </tr>
                            </table></td>
                          </tr>
                        </table>
                      </TD></TR></TBODY></TABLE>