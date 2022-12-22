<style type="text/css">
<!--
.style1 {
	font-size: 9px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style3 {font-size: 9}
.style4 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style5 {font-size: 9; font-family: Verdana, Arial, Helvetica, sans-serif; }
.style6 {
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style8 {font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000; }
.style10 {font-size: 9; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000; }
.style11 {
	font-size: 14px;
	font-weight: bold;
}
-->
</style>
<FORM name="formulario" onsubmit="return validar(this)" action=passagensform.asp 
method=post><TABLE cellSpacing=0 cellPadding=15 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD background="fundob.gif" class=PresentacionHomeBC>
                       <TABLE id=table__15956 cellSpacing=0 cellPadding=0 
                        width="100%" border=0>
                          <TBODY>
                          <TR>
                            <TD width="2%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><img src="seta.gif" width="12" height="12"></TD>
                            <TD width="43%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><span class="PresentacionHomeBD" style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif">&nbsp;Passagens A&eacute;reas </span></TD>
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
                                  <table class="texto" cellspacing="1" cellpadding="0" width="500" border="0">
                                    <tbody>
                                      <tr>
                                        <td background="Nascimento Turismo_arquivos/bg_chamada.gif" 
                colspan="2"><table cellspacing="7" cellpadding="0" width="500" border="0">
                                            <tbody>
                                              <tr>
                                                <td class="subtitulo style4 style11"><div align="center">Para receber&nbsp; infroma&ccedil;&otilde;es&nbsp; e or&ccedil;amento&nbsp;sobre&nbsp;Passagens A&eacute;reas &nbsp;preencha o   formul&aacute;rio abaixo:</div></td>
                                              </tr>
                                              <tr>
                                                <td class="subtitulo style3 style4"><span class="style1"><img src="setinha.gif" width="16" height="16" />Dados Iniciais:</span></td>
                                              </tr>
                                            </tbody>
                                        </table></td>
                                      </tr>
                                      <tr>
                                        <td><span class="style5">* Nome:</span></td>
                                        <td><input name="nome" class="formulario"tabindex="1" size="41" />                                        </td>
                                      </tr>
                                      <tr>
                                        <td><span class="style5">* E-mail:</span></td>
                                        <td><input name="email" class="formulario"tabindex="2" size="41" />                                        </td>
                                      </tr>
                                      <tr>
                                        <td><span class="style5">* Telefone:</span></td>
                                        <td><input name="telefone" class="formulario"tabindex="3" size="25" />                                        </td>
                                      </tr>
                                      <tr>
                                        <td><span class="style5">1.a op&ccedil;&atilde;o</span></td>
                                        <td><select name="tarifa" size="1" class="formulario" tabindex="4">
                                            <option selected="selected">Melhor Tarifa</option>
                                          <option>Melhor Op&ccedil;&atilde;o 
                                            (trajeto)</option>
                                        </select>                                        </td>
                                      </tr>
                                      <tr>
                                        <td><span class="style10">Classe de servi&ccedil;o: </span></td>
                                        <td><span class="style5"><font color="#000066">
                                          <select class="formulario" tabindex="5" 
                  size="1" name="classe">
                                            <option selected="selected">Econ&ocirc;mica promocional 
                                              (com restri&ccedil;&otilde;es)</option>
                                            <option>Econ&ocirc;mica normal (sem 
                                              restri&ccedil;&otilde;es)</option>
                                            <option>Executiva</option>
                                            <option>1&ordf; 
                                              classe</option>
                                          </select>
                                        </font></span></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2">&nbsp;</td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  <table class="texto" cellspacing="1" cellpadding="0" width="500" border="0">
                                    <tbody>
                                      <tr>
                                        <td valign="center" 
                background="Nascimento Turismo_arquivos/bg_chamada.gif" 
                colspan="5"><table cellspacing="7" cellpadding="0" width="500" border="0">
                                            <tbody>
                                              <tr>
                                                <td class="subtitulo"><span class="style1"><img src="setinha.gif" width="16" height="16" />Trechos:</span></td>
                                              </tr>
                                            </tbody>
                                        </table></td>
                                      </tr>
                                      <tr>
                                        <td valign="center"></td>
                                        <td valign="center" align="left"><span class="style1">* De:</span></td>
                                        <td valign="center" align="left"><span class="style1">* Para:</span></td>
                                        <td valign="center" nowrap="nowrap" align="left"><span class="style1">* Data de Sa&iacute;da</span></td>
                                        <td valign="center" align="left"><span class="style1">* Per&iacute;odo:</span></td>
                                      </tr>
                                      <tr>
                                        <td><span class="style1"><font color="#000066">1&ordm;</font></span></td>
                                        <td align="left"><font color="#000066">
                                          <input class="formulario"tabindex="6" 
                  maxlength="30" size="10" name="de1" />
                                        </font></td>
                                        <td align="left"><font color="#000066">
                                          <input class="formulario"tabindex="7" 
                  maxlength="30" size="10" name="para1" />
                                        </font></td>
                                        <td nowrap="nowrap" align="left"><font face="Verdana" size="2">
                                          <select 
                  class="formulario" size="1" name="mes1">
                                            <option value="MO" 
                    selected="selected">M&ecirc;s</option>
                                            <option value="01">JAN</option>
                                            <option 
                    value="02">FEV</option>
                                            <option value="03">MAR</option>
                                            <option 
                    value="04">ABR</option>
                                            <option value="05">MAI</option>
                                            <option 
                    value="06">JUN</option>
                                            <option value="07">JUL</option>
                                            <option 
                    value="08">AGO</option>
                                            <option value="09">SET</option>
                                            <option 
                    value="10">OUT</option>
                                            <option value="11">NOV</option>
                                            <option 
                    value="12">DEZ</option>
                                          </select>
                                          <select class="formulario" size="1" 
                  name="dia1">
                                            <option value="DA" selected="selected">Dia</option>
                                            <option 
                    value="01">01</option>
                                            <option value="02">02</option>
                                            <option 
                    value="03">03</option>
                                            <option value="04">04</option>
                                            <option 
                    value="05">05</option>
                                            <option value="06">06</option>
                                            <option 
                    value="07">07</option>
                                            <option value="08">08</option>
                                            <option 
                    value="09">09</option>
                                            <option value="10">10</option>
                                            <option 
                    value="11">11</option>
                                            <option value="12">12</option>
                                            <option 
                    value="13">13</option>
                                            <option value="14">14</option>
                                            <option 
                    value="15">15</option>
                                            <option value="16">16</option>
                                            <option 
                    value="17">17</option>
                                            <option value="18">18</option>
                                            <option 
                    value="19">19</option>
                                            <option value="20">20</option>
                                            <option 
                    value="21">21</option>
                                            <option value="22">22</option>
                                            <option 
                    value="23">23</option>
                                            <option value="24">24</option>
                                            <option 
                    value="25">25</option>
                                            <option value="26">26</option>
                                            <option 
                    value="27">27</option>
                                            <option value="28">28</option>
                                            <option 
                    value="29">29</option>
                                            <option value="30">30</option>
                                            <option 
                    value="31">31</option>
                                          </select>
                                          <select class="formulario" size="1" 
                  name="ano1">
                                            <option value="YEAR" selected="selected">Ano</option>
                                            <option 
                    value="2004">2004</option>
                                            <option 
                  value="2005">2005</option>
                                          </select>
                                        </font></td>
                                        <td><font color="#000066">
                                          <select class="formulario" tabindex="9" 
                  size="1" name="periodo1">
                                            <option value="M" selected="selected">Manh&atilde;</option>
                                            <option 
                    value="T">Tarde</option>
                                            <option value="N">Noite</option>
                                          </select>
                                        </font></td>
                                      </tr>
                                      <tr>
                                        <td><span class="style1"><font color="#000066">2&ordm;</font></span></td>
                                        <td align="left"><font color="#000066">
                                          <input class="formulario"tabindex="10" maxlength="30" size="10" name="de2" />
                                        </font></td>
                                        <td align="left"><font color="#000066">
                                          <input class="formulario"tabindex="11" maxlength="30" size="10" name="para2" />
                                        </font></td>
                                        <td nowrap="nowrap" align="left"><font face="Verdana" size="2">
                                          <select 
                  class="formulario" size="1" name="mes2">
                                            <option value="MO" 
                    selected="selected">M&ecirc;s</option>
                                            <option value="01">JAN</option>
                                            <option 
                    value="02">FEV</option>
                                            <option value="03">MAR</option>
                                            <option 
                    value="04">ABR</option>
                                            <option value="05">MAI</option>
                                            <option 
                    value="06">JUN</option>
                                            <option value="07">JUL</option>
                                            <option 
                    value="08">AGO</option>
                                            <option value="09">SET</option>
                                            <option 
                    value="10">OUT</option>
                                            <option value="11">NOV</option>
                                            <option 
                    value="12">DEZ</option>
                                          </select>
                                          <select class="formulario" size="1" 
                  name="dia2">
                                            <option value="DA" selected="selected">Dia</option>
                                            <option 
                    value="01">01</option>
                                            <option value="02">02</option>
                                            <option 
                    value="03">03</option>
                                            <option value="04">04</option>
                                            <option 
                    value="05">05</option>
                                            <option value="06">06</option>
                                            <option 
                    value="07">07</option>
                                            <option value="08">08</option>
                                            <option 
                    value="09">09</option>
                                            <option value="10">10</option>
                                            <option 
                    value="11">11</option>
                                            <option value="12">12</option>
                                            <option 
                    value="13">13</option>
                                            <option value="14">14</option>
                                            <option 
                    value="15">15</option>
                                            <option value="16">16</option>
                                            <option 
                    value="17">17</option>
                                            <option value="18">18</option>
                                            <option 
                    value="19">19</option>
                                            <option value="20">20</option>
                                            <option 
                    value="21">21</option>
                                            <option value="22">22</option>
                                            <option 
                    value="23">23</option>
                                            <option value="24">24</option>
                                            <option 
                    value="25">25</option>
                                            <option value="26">26</option>
                                            <option 
                    value="27">27</option>
                                            <option value="28">28</option>
                                            <option 
                    value="29">29</option>
                                            <option value="30">30</option>
                                            <option 
                    value="31">31</option>
                                          </select>
                                          <select class="formulario" size="1" 
                  name="ano2">
                                            <option value="YEAR" selected="selected">Ano</option>
                                            <option 
                    value="2004">2004</option>
                                            <option 
                  value="2005">2005</option>
                                          </select>
                                        </font></td>
                                        <td><font color="#000066">
                                          <select class="formulario" tabindex="13" 
                  size="1" name="periodo2">
                                            <option value="M" selected="selected">Manh&atilde;</option>
                                            <option 
                    value="T">Tarde</option>
                                            <option value="N">Noite</option>
                                          </select>
                                        </font></td>
                                      </tr>
                                      <tr>
                                        <td><span class="style1"><font color="#000066">3&ordm;</font></span></td>
                                        <td align="left"><font color="#000066">
                                          <input class="formulario"tabindex="14" maxlength="30" size="10" name="de3" />
                                        </font></td>
                                        <td align="left"><font color="#000066">
                                          <input class="formulario"tabindex="15" maxlength="30" size="10" name="para3" />
                                        </font></td>
                                        <td nowrap="nowrap" align="left"><font face="Verdana" size="2">
                                          <select 
                  class="formulario" size="1" name="mes3">
                                            <option value="MO" 
                    selected="selected">M&ecirc;s</option>
                                            <option value="01">JAN</option>
                                            <option 
                    value="02">FEV</option>
                                            <option value="03">MAR</option>
                                            <option 
                    value="04">ABR</option>
                                            <option value="05">MAI</option>
                                            <option 
                    value="06">JUN</option>
                                            <option value="07">JUL</option>
                                            <option 
                    value="08">AGO</option>
                                            <option value="09">SET</option>
                                            <option 
                    value="10">OUT</option>
                                            <option value="11">NOV</option>
                                            <option 
                    value="12">DEZ</option>
                                          </select>
                                          <select class="formulario" size="1" 
                  name="dia3">
                                            <option value="DA" selected="selected">Dia</option>
                                            <option 
                    value="01">01</option>
                                            <option value="02">02</option>
                                            <option 
                    value="03">03</option>
                                            <option value="04">04</option>
                                            <option 
                    value="05">05</option>
                                            <option value="06">06</option>
                                            <option 
                    value="07">07</option>
                                            <option value="08">08</option>
                                            <option 
                    value="09">09</option>
                                            <option value="10">10</option>
                                            <option 
                    value="11">11</option>
                                            <option value="12">12</option>
                                            <option 
                    value="13">13</option>
                                            <option value="14">14</option>
                                            <option 
                    value="15">15</option>
                                            <option value="16">16</option>
                                            <option 
                    value="17">17</option>
                                            <option value="18">18</option>
                                            <option 
                    value="19">19</option>
                                            <option value="20">20</option>
                                            <option 
                    value="21">21</option>
                                            <option value="22">22</option>
                                            <option 
                    value="23">23</option>
                                            <option value="24">24</option>
                                            <option 
                    value="25">25</option>
                                            <option value="26">26</option>
                                            <option 
                    value="27">27</option>
                                            <option value="28">28</option>
                                            <option 
                    value="29">29</option>
                                            <option value="30">30</option>
                                            <option 
                    value="31">31</option>
                                          </select>
                                          <select class="formulario" size="1" 
                  name="ano3">
                                            <option value="YEAR" selected="selected">Ano</option>
                                            <option 
                    value="2004">2004</option>
                                            <option 
                  value="2005">2005</option>
                                          </select>
                                        </font></td>
                                        <td><font color="#000066">
                                          <select class="formulario" tabindex="17" 
                  size="1" name="periodo3">
                                            <option value="M" selected="selected">Manh&atilde;</option>
                                            <option 
                    value="T">Tarde</option>
                                            <option value="N">Noite</option>
                                          </select>
                                        </font></td>
                                      </tr>
                                      <tr>
                                        <td><span class="style1"><font color="#000066">4&ordm;</font></span></td>
                                        <td align="left"><font color="#000066">
                                          <input class="formulario"tabindex="18" maxlength="30" size="10" name="de4" />
                                        </font></td>
                                        <td align="left"><font color="#000066">
                                          <input class="formulario"tabindex="19" maxlength="30" size="10" name="para4" />
                                        </font></td>
                                        <td nowrap="nowrap" align="left"><font face="Verdana" size="2">
                                          <select 
                  class="formulario" size="1" name="mes4">
                                            <option value="MO" 
                    selected="selected">M&ecirc;s</option>
                                            <option value="01">JAN</option>
                                            <option 
                    value="02">FEV</option>
                                            <option value="03">MAR</option>
                                            <option 
                    value="04">ABR</option>
                                            <option value="05">MAI</option>
                                            <option 
                    value="06">JUN</option>
                                            <option value="07">JUL</option>
                                            <option 
                    value="08">AGO</option>
                                            <option value="09">SET</option>
                                            <option 
                    value="10">OUT</option>
                                            <option value="11">NOV</option>
                                            <option 
                    value="12">DEZ</option>
                                          </select>
                                          <select class="formulario" size="1" 
                  name="dia4">
                                            <option value="DA" selected="selected">Dia</option>
                                            <option 
                    value="01">01</option>
                                            <option value="02">02</option>
                                            <option 
                    value="03">03</option>
                                            <option value="04">04</option>
                                            <option 
                    value="05">05</option>
                                            <option value="06">06</option>
                                            <option 
                    value="07">07</option>
                                            <option value="08">08</option>
                                            <option 
                    value="09">09</option>
                                            <option value="10">10</option>
                                            <option 
                    value="11">11</option>
                                            <option value="12">12</option>
                                            <option 
                    value="13">13</option>
                                            <option value="14">14</option>
                                            <option 
                    value="15">15</option>
                                            <option value="16">16</option>
                                            <option 
                    value="17">17</option>
                                            <option value="18">18</option>
                                            <option 
                    value="19">19</option>
                                            <option value="20">20</option>
                                            <option 
                    value="21">21</option>
                                            <option value="22">22</option>
                                            <option 
                    value="23">23</option>
                                            <option value="24">24</option>
                                            <option 
                    value="25">25</option>
                                            <option value="26">26</option>
                                            <option 
                    value="27">27</option>
                                            <option value="28">28</option>
                                            <option 
                    value="29">29</option>
                                            <option value="30">30</option>
                                            <option 
                    value="31">31</option>
                                          </select>
                                          <select class="formulario" size="1" 
                  name="ano4">
                                            <option value="YEAR" selected="selected">Ano</option>
                                            <option 
                    value="2004">2004</option>
                                            <option 
                  value="2005">2005</option>
                                          </select>
                                        </font></td>
                                        <td><font color="#000066">
                                          <select class="formulario" tabindex="21" 
                  size="1" name="periodo4">
                                            <option value="M" selected="selected">Manh&atilde;</option>
                                            <option 
                    value="T">Tarde</option>
                                            <option value="N">Noite</option>
                                          </select>
                                        </font></td>
                                      </tr>
                                      <tr>
                                        <td colspan="5">&nbsp;</td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  <table class="texto" cellspacing="1" cellpadding="0" width="500" border="0">
                                    <tbody>
                                      <tr align="left">
                                        <td background="Nascimento Turismo_arquivos/bg_chamada.gif" 
                colspan="3"><table cellspacing="7" cellpadding="0" width="100%" border="0">
                                            <tbody>
                                              <tr>
                                                <td class="subtitulo"><span class="style1"><img src="setinha.gif" width="16" height="16" />Nome dos Passageiros:</span></td>
                                              </tr>
                                            </tbody>
                                        </table></td>
                                      </tr>
                                      
                                      <tr align="left">
                                        <td bgcolor="#ffffff"><span class="style1">* Nome:</span></td>
                                        <td bgcolor="#ffffff"><span class="style1">* Sobrenome:</span></td>
                                        <td bgcolor="#ffffff"><span class="style1">* Idade:</span></td>
                                      </tr>
                                      <tr>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="22" size="22" name="nome1" />
                                        </font></td>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="23" size="15" name="sobrenome1" />
                                        </font></td>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="24" size="15" name="idade1" />
                                        </font></td>
                                      </tr>
                                      <tr>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="25" size="22" name="nome2" />
                                        </font></td>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="26" size="15" name="sobrenome2" />
                                        </font></td>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="27" size="15" name="idade2" />
                                        </font></td>
                                      </tr>
                                      <tr>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="28" size="22" name="nome3" />
                                        </font></td>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="29" size="15" name="sobrenome3" />
                                        </font></td>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="30" size="15" name="idade3" />
                                        </font></td>
                                      </tr>
                                      <tr>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="31" size="22" name="nome4" />
                                        </font></td>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="32" size="15" name="sobrenome4" />
                                        </font></td>
                                        <td align="left" bgcolor="#ffffff"><font color="#000080">
                                          <input 
                  class="formulario"tabindex="33" size="15" name="idade4" />
                                        </font></td>
                                      </tr>
                                      <tr>
                                        <td align="left" bgcolor="#ffffff" colspan="3">&nbsp;</td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  <table class="texto" cellspacing="1" cellpadding="0" width="500" border="0">
                                    <tbody>
                                      <tr align="left">
                                        <td ><table cellspacing="7" cellpadding="0" width="500" border="0">
                                            <tbody>
                                              <tr>
                                                <td 
class="subtitulo style6"><span class="style1"><img src="setinha.gif" width="16" height="16" />Observa&ccedil;&otilde;es:</span></td>
                                              </tr>
                                            </tbody>
                                        </table></td>
                                      </tr>
                                      <tr align="left">
                                        <td></td>
                                      </tr>
                                      <tr align="left">
                                        <td><span class="style8">Use o campo abaixo para observa&ccedil;&otilde;es 
                                          sobre sua reserva:</span></td>
                                      </tr>
                                      <tr align="left">
                                        <td><p>
                                          <textarea style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; FONT-FAMILY: Arial" tabindex="34" name="observacoes" rows="10" wrap="on" cols="100"></textarea>
                                        </p></td>
                                      </tr>
                                      <tr>
                                        <td>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td width="100%">&nbsp;
                                            <table width="100%" border="0">
                                              <tr>
                                                <td><div align="center">
                                                  <input class="formulario" type="submit" value="ENVIAR DADOS" name="Submit" />
                                                </div></td>
                                                <td><div align="center">
                                                  <input class="formulario" type="reset" value="LIMPAR FORMUL&Aacute;RIO" name="Reset" />
                                                </div></td>
                                              </tr>
                                            </table>
                                            <input type="hidden" value="vendas@nascimento.com.br" 
                  name="emailto" />
                                            <input type="hidden" 
                  value="Formul&aacute;rio Cotiza&ccedil;&atilde;o de Passagens A&eacute;reas:Nascimento" 
                  name="subject" />
<table width="100%" border="0">
                                              <tr>
                                                <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                <td class="subtitulo style3 style4"><div align="center"><img src="passagens1.gif" width="431" height="90" /></div></td>
                                              </tr>
                                              <tr>
                                                <td class="subtitulo style3 style4"><div align="center"><img src="passagens2.gif" width="489" height="90" /></div></td>
                                              </tr>
                                             </table>
                                         </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  </div></td>
                              </tr>
                            </table>
                          </td>
                            </tr>
                        </table>
                        </TD></TR></TBODY></TABLE>