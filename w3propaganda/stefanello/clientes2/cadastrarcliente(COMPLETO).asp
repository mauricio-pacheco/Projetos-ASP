<!--#include file="verificacliente.asp"-->
<!--#include file="conexao.asp"-->
<!--#include file="meta2.asp"-->
<% 

Dim rs
Dim SQL
Dim Conexao
Dim BancoDados
Dim aham
Dim record

aham = date

Set rs = Server.CreateObject("ADODB.Recordset") 

SQL = "SELECT * FROM representantes"

rs.Open SQL, wm,3,3
      

%>
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
- Seja bem vindo <span style="color: #FFFFFF"><%=Session("usuario")%> </span> - <a class=home_titulo7000 href="sair.asp">Sair do Sistema</a></span></FONT></TD>
        </TD></TR></TBODY></TABLE></TD>
  <TR>
  <TR>
    <TD vAlign=top>
      <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
         <!--#include file="menucliente.asp"--><TD vAlign=top>
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
                            <TD align=middle><div align="left"><span style="font-size: 12px">Cadastrar Cliente</span></div></TD>
                          </TR></TBODY></TABLE>
                        <FORM name=cadastro action=cadcliente.asp enctype="multipart/form-data" method=post onSubmit="return validar(this)"><TABLE class=texto cellSpacing=5 cellPadding=0 
                        width="100%" align=center border=0>
                          <TBODY>
                          <TR>
                            <TD width="60%" vAlign=top class="style2" style="font-size: 12px"><table width="100%" align="left" border="0">
                              <tbody>

                                <tr>
                                  <td class="style2" style="color: #0033FF"><span class="style2">Representante Respons&aacute;vel: </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="representante" value="<%=Session("usuario")%>" readonly="true" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="68%" class="style2"><span class="style2">C&oacute;digo do Cliente: </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="10" name="cod" />
                                    *</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Nome do Cliente: </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="56" name="cliente" />
                                  *</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Raz&atilde;o Social:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="80" name="razaosocial" />
                                    *</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Foto do Cliente:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><input class=texto type="file" name="foto"></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Nome Fantasia ou Nome Auxiliar:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="80" name="nomefantasia" />
                                    *</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Endere&ccedil;o:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="56" name="endereco" />
                                    * N&uacute;mero:
                                    <input class="texto" size="8" name="numero" />
                                    *</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Complemento de Endere&ccedil;o:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="complend" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Bairro:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="26" name="bairro" />
                                    *</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Cidade:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="26" name="cod_cf" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Estado:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font color="#000000">
                                    <select class="texto" 
                              name="naturezapessoa">
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
                                  </font></font></font></font></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">CNPJ / CPF:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><input class="texto" size="32" name="cnpjcpf" />
                                  *</td>
                                </tr>
                                <tr>
                                  <td class="style2">IE:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><input class="texto" size="32" name="ie" />
                                  *</td>
                                </tr>
                                <tr>
                                  <td class="style2">CI:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><input class="texto" size="32" name="ci" />
                                  *</td>
                                </tr>
                                <tr>
                                  <td class="style2"> Data de Nascimento:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input name="datanasc" class="texto" onKeyPress="Mascara('datanasc', window.event.keyCode, 'document.cadastro.datanasc');" size="10" maxlength="10" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Telefone:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="telefone" onKeyPress="Mascara('telefone', window.event.keyCode, 'document.cadastro.telefone');" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Pessoa de Contato:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="pessoacontato" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">FAX:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="fax" onKeyPress="Mascara('fax', window.event.keyCode, 'document.cadastro.fax');" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Celular:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="celular" onKeyPress="Mascara('celular', window.event.keyCode, 'document.cadastro.celular');" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">E-mail:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="email" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Home Page:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="homepage" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Data do Cadastro:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="10" name="datacadastro" onKeyPress="Mascara('datacadastro', window.event.keyCode, 'document.cadastro.datacadastro');"  maxlength="10"/>
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Endere&ccedil;o de Cobran&ccedil;a:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="enderecocobranca" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Bairro de Cobran&ccedil;a:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="26" name="bairrocobranca" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Cidade de Cobran&ccedil;a:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="cidcobranca" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Fornecedor:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="56" name="fornecedor" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Cliente Preferencial:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="56" name="clientepreferencial" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Limite de Cr&eacute;dito:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="limitecredito" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Cod Venda:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="10" name="cod_vend" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">CEP Cobran&ccedil;a<font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">: </font></font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input onKeyPress="Mascara('cepcobranca', window.event.keyCode, 'document.cadastro.cepcobranca');" class="texto" size="14" name="cepcobranca"/>
                                  </font></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Produtor Rural:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="50" name="produtorrural" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Cod Rota:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="10" name="cod_rota" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2">Seq Rota:</td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="10" name="seqrota" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Pecresfriador:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="40" name="percresfriador" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Cod do Banco:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="12" name="cod_bco" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Cod da Agência:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="12" name="cod_ag" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Conta Bancária:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="12" name="contabancaria" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Cliente &Aacute;gua:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="56" name="clienteagua" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Cliente Licenciamento:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="56" name="clientelicenciamento" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Nome do Pai:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="80" name="nomepai" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Nome da M&atilde;e:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" size="80" name="nomemae" />
                                  </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Observa&ccedil;&otilde;es:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font color="#000000"><b><b><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              size="1">
                                    <textarea class="texto" name="observacao" rows="12" cols="94"></textarea>
                                  </font></b></b></font><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">&nbsp; </font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                                    <input class="texto" type="reset" value="Limpar Formul&aacute;rio" name="limpar" />
                                    <input class="texto" type="submit" value="Cadastrar Cliente" name="submit2"/>
                                  </font></td>
                                </tr>
                              </tbody>
                            </table></TD>
                          </TR>
                          </TBODY></TABLE></form></TD>
                    </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
   </TBODY></TABLE><table width="680" border="0" align="center"><TR>
    <TD style="BORDER-TOP: #005DA2 10px solid" bgColor=#FFFFFF colSpan=3 
    height="1%"><!--#include file="baixo.asp"--></TD>
  </TR>
  </TBODY></TABLE>
</BODY></HTML>
