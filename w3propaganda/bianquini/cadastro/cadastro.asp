<!--#include file="verifica.asp"-->
<!--#include file="meta.asp"-->
<div align="center"><img src="logore.jpg" width="550" height="150" /></div>
<TABLE width="680" border=0 align="center" cellPadding=0 
cellSpacing=0 bgColor=#ffffff class=texto style="BORDER-RIGHT: gainsboro 1px solid" style="BORDER-LEFT: gainsboro 1px solid"></HTML>
  <TBODY>
  <TR>
    <TD bgColor=#005DA2 colSpan=3 height=25><TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=center>
          <TD width="98%" bgcolor="#005DA2"><FONT color=#ffffff><span class="style2">&nbsp;&nbsp;Cadastro de Representantes - <script language="JavaScript">

<!--
day = new Date()
num_dia = day.getDate()
dia = day.getDay()+1
mes = day.getMonth()+1
ano = day.getYear()


if(dia ==1)
document.write("Domingo, ")
if(dia ==2)
document.write("Segunda feira, ")
if(dia ==3)
document.write("Terça feira, ")
if(dia ==4)
document.write("Quarta feira, ")
if(dia ==5)
document.write("Quinta feira, ")
if(dia ==6)
document.write("Sexta feira, ")
if(dia ==7)
document.write("Saturday , ")

document.write(num_dia," de ")

if(mes ==1)
document.write("Janeiro de")
if(mes ==2)
document.write("Fevereiro de")
if(mes ==3)
document.write("Março de")
if(mes ==4)
document.write("Abril de")
if(mes ==5)
document.write("Maio de")
if(mes ==6)
document.write("Junho de")
if(mes ==7)
document.write("Julho de")
if(mes ==8)
document.write("Agosto de")
if(mes ==9)
document.write("Setembro de")
if(mes ==10)
document.write("Outubro de")
if(mes ==11)
document.write("Novembro de")
if(mes ==12)
document.write("Dezembro de")

document.write(" ",ano)


//--->
</script>
  - Seja bem vindo <span style="color: #FFFFFF">Nelcir Bianquini</span> - <a class=home_titulo7000 href="fujir.asp">Sair do Sistema</a>&nbsp;&nbsp; * Campos Obrigat&oacute;rios</span></FONT></TD>
          </TR></TBODY></TABLE></TD>
  <TR>
  <TR>
    <TD vAlign=top>
      <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
         <!--#include file="menu.asp"--><TD vAlign=top>
            <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" 
border=0>
              <TBODY>
              <TR>
                <TD vAlign=top>
                  <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD vAlign=top width="1%"><TABLE class=texto cellSpacing=0 cellPadding=4 
                        width="100%" border=0>
                          <TBODY>
                          <TR>
                            <TD align=middle><div align="left"><span style="font-size: 12px">Cadastro de Representantes</span></div></TD>
                          </TR></TBODY></TABLE>
                       <TABLE class=texto cellSpacing=5 cellPadding=0 
                        width="100%" align=center border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top width="60%"><FORM name=cadastro action=cadastrar.asp enctype="multipart/form-data" method=post onSubmit="return validar(this)"><table width="100%" align="left" border="0">
                              <tbody>
                                <tr>
                                  <td><span style="color: #0066CC"><span class="style2">Usu&aacute;rio: </font></span></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="20" name="email" id="email" />
                                    *                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span style="color: #FF0000"><span class="style2">Senha: </font></span></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input type="password" class="texto" size="20" name="senha" />
                                  *</font></td>
                                </tr>
                                <tr>
                                  <td width="68%"><span class="style2">C&oacute;digo: </font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="10" name="codigo" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Nome do Representante:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="80" name="nome" />
                                    *                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Foto do Representante:</font></td>
                                </tr>
                                <tr>
                                  <td><input class=texto type="file" name="foto"></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Nome Fantasia ou Nome Auxiliar:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="80" name="nofantasia" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Endere&ccedil;o:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="56" name="endereco" />
                                    <span class="style2">  N&uacute;mero: </span>
                                    <input class="texto" size="8" name="numero" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Complemento de Endere&ccedil;o:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="complemento" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Bairro:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="26" name="bairro" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Cidade:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="36" name="cidade" />
                                    </font><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font color="#000000">
                                    * 
                                    <select class="texto" 
                              name="estado">
                                      <option value="estado" selected="selected">Estado</option>
                                      <option 
                                value="AC - Acre">AC - Acre</option>
                                      <option value="AL - Alagoas">AL - Alagoas</option>
                                      <option 
                                value="AM - Amazonas">AM - Amazonas</option>
                                      <option value="AP - Amap&aacute;">AP - Amap&aacute;</option>
                                      <option 
                                value="BA - Bahia">BA - Bahia</option>
                                      <option value="CE - Cear&aacute;">CE - Cear&aacute;</option>
                                      <option 
                                value="DF - Distrito Federal">DF - Distrito Federal</option>
                                      <option value="ES - Esp&iacute;rito Santo">ES - Esp&iacute;rito Santo</option>
                                      <option 
                                value="GO - Goi&aacute;s">GO - Goi&aacute;s</option>
                                      <option value="MA - Maranh&atilde;o">MA - Maranh&atilde;o</option>
                                      <option 
                                value="MG - Minas Gerais">MG - Minas Gerais</option>
                                      <option value="MS - Mato Grosso do Sul">MS - Mato Grosso do Sul</option>
                                      <option 
                                value="MT - Mato Grosso">MT - Mato Grosso</option>
                                      <option value="PA - Par&aacute;">PA - Par&aacute;</option>
                                      <option 
                                value="PB - Para&iacute;ba">PB - Para&iacute;ba</option>
                                      <option value="PE - Pernambuco">PE - Pernambuco</option>
                                      <option 
                                value="PI - Piau&iacute;">PI - Piau&iacute;</option>
                                      <option value="PR - Paran&aacute;">PR - Paran&aacute;</option>
                                      <option 
                                value="RJ - Rio de Janeiro">RJ - Rio de Janeiro</option>
                                      <option value="RN - Rio Grande do Norte">RN - Rio Grande do Norte</option>
                                      <option 
                                value="RO - Roraima">RO - Roraima</option>
                                      <option value="RR - Roraima">RR - Roraima</option>
                                      <option 
                                value="RS - Rio Grande do Sul">RS - Rio Grande do Sul</option>
                                      <option value="SC - Santa Catarina">SC - Santa Catarina</option>
                                      <option 
                                value="SE - Sergipe">SE - Sergipe</option>
                                      <option value="SP - S&atilde;o Paulo">SP - S&atilde;o Paulo</option>
                                      <option 
                                value="TO - Tocantins">TO - Tocantins</option>
                                    </select>
                                  </font></font></font><font color="#000000"></font></font></font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">CEP</span><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">: </font></font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input name="cep" class="texto" onKeyPress="Mascara('cep', window.event.keyCode, 'document.cadastro.cep');" size="14" maxlength="9"/>
                                  </font></font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">CNPJ / CPF:</span></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">
                                      <input class="texto" size="32" name="cnpj" />
                                      <font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1"> * </font>                                    Cadastro de Pessoa:</font><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font color="#000000">
                                      <select class="texto" 
                              name="pessoa">
                                        <option value="Fisica">F&iacute;sica</option>
                                        <option value="Jurídica">Jur&iacute;dica</option>
                                      </select>
                                    </font></font></font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Inscri&ccedil;&atilde;o Estadual:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="inestadual" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Identidade:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="identidade" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Nome do Pai:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="80" name="nomepai" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Nome da M&atilde;e:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="80" name="nomemae" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Telefone:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input name="telefone" class="texto" onKeyPress="Mascara('telefone', window.event.keyCode, 'document.cadastro.telefone');" size="40" maxlength="14" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">FAX:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input name="fax" class="texto" onKeyPress="Mascara('fax', window.event.keyCode, 'document.cadastro.fax');" size="40" maxlength="14" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Celular:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input name="celular" class="texto" onKeyPress="Mascara('celular', window.event.keyCode, 'document.cadastro.celular');" size="40" maxlength="14" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Pessoa de Contato:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="pecontato" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">E-mail:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="email2" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Home Page:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="homepage" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Produtor Rural:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="50" name="produtor" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2"> Data de Nascimento:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input name="nascimento" class="texto" onKeyPress="Mascara('nascimento', window.event.keyCode, 'document.cadastro.nascimento');" size="10" maxlength="10" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Data do Cadastro:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="10" name="datacadastro" onKeyPress="Mascara('datacadastro', window.event.keyCode, 'document.cadastro.datacadastro');"  maxlength="10"/>
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Limite de Cr&eacute;dito:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="limite" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Nome do Vendedor:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="80" name="vendedor" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Nome do Banco:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="banco" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">N&uacute;mero da Ag&ecirc;ncia:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="12" name="agencia" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">N&uacute;mero da Conta:</font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="12" name="conta" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td><span class="style2">Observa&ccedil;&otilde;es:</font></td>
                                </tr>
                                <tr>
                                  <td><font color="#000000"><b><b><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              size="1">
                                    <textarea class="texto" name="msg" rows="12" cols="94"></textarea>
                                  </font></b></b></font><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">&nbsp; </font></td>
                                </tr>
                                <tr>
                                  <td><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" type="reset" value="Limpar Formul&aacute;rio" name="limpar" />
                                    <input class="texto" type="submit" value="Cadastrar Representante" name="submit"/>
                                  </font></td>
                                </tr>
                              </tbody>
                            </table>
                            </form></TD>
                          </TR></TBODY></TABLE></TD>
                    </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
   </TBODY></TABLE><table width="680" border="0" align="center"><TR>
    <TD style="BORDER-TOP: #005DA2 10px solid" bgColor=#FFFFFF colSpan=3 
    height="1%"><!--#include file="baixo.asp"--></TD>
  </TR>
  </TBODY></TABLE>
</BODY></HTML>
