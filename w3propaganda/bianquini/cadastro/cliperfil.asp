<!--#include file="verifica.asp"-->
<!--#include file="conexao.asp"-->
<%
clienteid = request.querystring("clienteid")
SQL = "SELECT * FROM clientes WHERE clienteid = '"&clienteid&"'"
Set rs = wm.execute(SQL)
%>

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
document.write("Ter�a feira, ")
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
document.write("Mar�o de")
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
  - Seja bem vindo <span style="color: #FFFFFF">Nelcir Bianquini</span> - <a class=home_titulo7000 href="fujir.asp">Sair do Sistema</a></span></FONT></TD>
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
                            <TD align=middle><table width="100%" border="0">

                              <tr>
                                <td width="83%" class="style2" style="font-size: 12px">Perfil de: <span style="color: #FF0000"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("nome")%></font></span></td>
                                <td width="17%">&nbsp;<a class=home_titulo1000 href="clientes.asp"><img src="voltar.gif" width="14" height="14" border="0"></a> <a class=home_titulo1000 href="clientes.asp">VOLTAR</a></td>
                              </tr>
                            </table></TD>
                          </TR></TBODY></TABLE>
                       <TABLE class=texto cellSpacing=5 cellPadding=0 
                        width="100%" align=center border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top width="60%"><FORM name=cadastro action=cadastrar.asp method=post onSubmit="return validar(this)"><table width="100%" align="left" border="0">
                              <tbody>
                                <tr>
                                  <td class="style2"><div align="center"><span class="style2" style="font-size: 12px"><img border="1" src="<%=rs("foto")%>"></span></div></td>
                                </tr>
                                <tr>
                                  <td class="style2"><span style="color: #0066CC"><span class="style2">Usu&aacute;rio: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("email")%></font></span></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span style="color: #FF0000"><span class="style2">Senha: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("senha")%></font></span></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="68%" class="style2"><span class="style2">C&oacute;digo: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("codigo")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Nome do Representante: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("nocliente")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Nome Fantasia ou Nome Auxiliar:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("nofantasia")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Endere&ccedil;o:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("endereco")%> </font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><span class="style2" style="color: #000000">N&uacute;mero:</span></font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("numero")%></font></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Complemento de Endere&ccedil;o: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("complemento")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Bairro: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("bairro")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Cidade: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("cidade")%></font> - Estado: <font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("estado")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">CEP</span><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">: </font></font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("cep")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">CNPJ / CPF:
                                      <font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("cnpj")%></font> Cadastro de Pessoa: <font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("pessoa")%></font></span></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Inscri&ccedil;&atilde;o Estadual:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("inestadual")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Identidade:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("identidade")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Nome do Pai:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("nomepai")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Nome da M&atilde;e:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("nomemae")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Telefone:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("telefone")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">FAX:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("fax")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Celular:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("celular")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Pessoa de Contato:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("pessoa")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">E-mail:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <a class=home_titulo1000 href="mailto:<%=rs("email2")%>"><%=rs("email2")%></a></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Home Page: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a class=home_titulo1000 href="http://<%=rs("homepage")%>" target=_blank><%=rs("homepage")%></a></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Produtor Rural:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("produtor")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2"> Data de Nascimento: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("nascimento")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Data do Cadastro: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("datacadastro")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Limite de Cr&eacute;dito:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("limite")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Nome do Vendedor: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("vendedor")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Nome do Banco:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"> <%=rs("banco")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">N&uacute;mero da Ag&ecirc;ncia:</font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("agencia")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">N&uacute;mero da Conta: </font><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("conta")%></font></td>
                                </tr>
                                <tr>
                                  <td class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="style2"><span class="style2">Observa&ccedil;&otilde;es:</font></td>
                                </tr>
                                <tr>
                                  <td class="style2"><table width="400" border="0">
                                    <tr>
                                      <td><font color="#005DA2" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rs("msg")%></font></td>
                                    </tr>
                                  </table></td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td><table width="32%" border="0" align="center">
                                    <tr>
                                      <td class="style2"><a class=home_titulo1000 href="deletar.asp?codigo=<%=rs("Codigo")%>"><img src="icon_delete.gif" border="0" width="24" height="24"></a></td>
                                      <td class="style2"><div align="center"><a class=home_titulo1000 href="deletar.asp?clienteid=<%=rs("clienteid")%>">DELETAR REPRESENTANTE</a></div></td>
                                      </tr>
                                  </table></td>
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
