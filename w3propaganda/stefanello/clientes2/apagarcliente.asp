<!--#include file="verificacliente.asp"-->
<!--#include file="conexao.asp"-->
<%
cod = request.querystring("cod")
SQL = "DELETE FROM clientes WHERE cod = '"&cod&"'"
Set rs = wm.execute(SQL)
%>

<!--#include file="meta.asp"-->
<META HTTP-EQUIV="Refresh" CONTENT="2;URL=deletarcliente.asp">  
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
  - Seja bem vindo <span style="color: #FFFFFF">Nelcir Bianquini</span> - <a class=home_titulo7000 href="fujir.asp">Sair do Sistema</a></span></FONT></TD>
          </TR></TBODY></TABLE></TD>
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
                            <TD align=middle><table width="100%" border="0">

                              <tr>
                                <td width="83%" class="style2" style="font-size: 12px">Cadastro de Clientes<span style="color: #FF0000"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"></font></span></td>
                                <td width="17%">&nbsp;<a class=home_titulo1000 href="deletarcliente.asp"><img src="voltar.gif" width="14" height="14" border="0"></a> <a class=home_titulo1000 href="deletarcliente.asp">VOLTAR</a></td>
                              </tr>
                            </table></TD>
                          </TR></TBODY></TABLE>
                       <TABLE class=texto cellSpacing=5 cellPadding=0 
                        width="100%" align=center border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top width="60%"><table width="100%" align="left" border="0">
                              <tbody>
                                <tr>
                                  <td width="68%" class="style2">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td><div align="center">
                                    <p class="style2"><img src="icon_delete.gif" width="24" height="24"></p>
                                    <p class="style2"><span style="font-size: 12px"><img src="bot_ok.gif" width="50" height="41"></span></p>
                                    <p style="font-size: 12px">O Cliente foi exclu&iacute;do com sucesso!</p>
                                    <p style="font-size: 12px">&nbsp;</p>
                                    </div></td>
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
