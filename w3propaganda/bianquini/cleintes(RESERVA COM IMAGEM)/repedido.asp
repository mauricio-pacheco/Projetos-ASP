<!--#include file="verificacliente.asp"-->
<!--#include file="conexao.asp"-->
<%

Dim data, hora, comando, rresp, clientetotal, pedidos, expedicao, entrega, quantidade

data = date

hora = time

rresp = Request.Form("rresp")
clientetotal = Request.Form("clientetotal")
pedidos = Request.Form("pedidos")
expedicao = Request.Form("expedicao")
entrega = Request.Form("entrega")
quantidade = Request.Form("quantidade")


comando = "INSERT INTO pedidos (rresp, clientetotal, pedidos, expedicao, entrega, quantidade, data, hora)" & "VALUES('" & rresp & "','" & clientetotal & "','" & pedidos & "','" & expedicao & "','" & entrega & "','" & quantidade & "','" & data & "','" & hora & "')"

wm.Execute(comando)

%>
<!--#include file="meta.asp"-->
<div align="center"><img src="logorepreto.jpg" width="550" height="150" /></div>
  <TABLE width="680" border=0 align="center" cellPadding=0 
cellSpacing=0 bgColor=#ffffff class=texto style="BORDER-RIGHT: gainsboro 1px solid" style="BORDER-LEFT: gainsboro 1px solid"></HTML>
  <TBODY>
  <TR>
    <TD bgColor=#005DA2 colSpan=3 height="1"><TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=center>
          <TD width="98%" bgcolor="#000000">&nbsp;</TD>
         </TR></TBODY></TABLE></TD>
  <TR>
  <TR>
    <TD vAlign=top>
      <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
         <TD vAlign=top>
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
                            <TD align=middle><div align="center"><span style="font-size: 12px">Ficha de Pedido Online</span> - <a class="home_titulo1000" href="produtoscliente.asp"><span style="font-size: 12px">Realizar mais um pedido.</span></a></div></TD>
                          </TR></TBODY></TABLE>
                       <TABLE class=texto cellSpacing=5 cellPadding=0 
                        width="100%" align=center border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top><table width="100%" border="0">
                              <tr>
                                <td><span style="font-weight: bold; font-size: 12">M&oacute;veis Bianquini Ltda</span></td>
                              </tr>
                              <tr>
                                <td style="font-size: 12px"><span style="font-size: 12px">Rua Humberto Possamai - N&uacute;mero: 35 - Bairro: Distrito Industrial - Cidade: Rodeio Bonito/RS - CEP: 98360-000</span></td>
                              </tr>
                              <tr>
                                <td class="style2" style="font-size: 12px">Fone: (55) 3798 - 1136 - CNPJ: 91.038.612/0001-29 - Insc. Est.: 217/0004-070</td>
                              </tr>
                            </table></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top>&nbsp;</TD>
                          </TR>
                          <TR>
                            <TD vAlign=top><span style="font-weight: bold; font-size: 12px">Cliente:</span></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top style="font-size: 12px"><span style="font-size: 12px">
                              <%
							  
Set rs5 = Server.CreateObject("ADODB.Recordset") 

SQL5 = "SELECT *  FROM pedidos ORDER BY id DESC"

rs5.Open SQL5, wm,3,3


%>
                              <%=rs5("clientetotal")%></span></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top>&nbsp;</TD>
                          </TR>
                          <TR>
                            <TD vAlign=top><span style="font-weight: bold; font-size: 12px">Pedido Realizado em <%=rs5("data")%>&nbsp;-&nbsp;<%=rs5("hora")%></span></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top><span style="font-weight: bold; font-size: 12px">Representante Respons&aacute;vel:</span><span style="font-size: 12px">&nbsp;<%=rs5("rresp")%></span></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top>&nbsp;</TD>
                          </TR>
                          <TR>
                            <TD vAlign=top><table width="100%" border="0" style="font-size: 12px">
                              <tr style="font-size: 12px">
                                <td style="font-size: 12px"><span style="font-size: 10px"><% = rs5("quantidade") %></span></td>
                                </tr>
                            </table></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top>&nbsp;</TD>
                          </TR>
                          <TR>
                            <TD vAlign=top width="60%"><p>
                              <span style="font-weight: bold; font-size: 12px">Data de Expedi&ccedil;&atilde;o:</span>&nbsp;<%=rs5("expedicao")%> &nbsp;&nbsp;&nbsp;<span class="style2" style="font-weight: bold; font-size: 12px">Data para a entrega:</span>&nbsp;<%=rs5("entrega")%>                            
                            </p>                              </TD>
                          </TR></TBODY></TABLE></TD>
                    </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
   </TBODY></TABLE><table width="680" border="0" align="center"><TR>
    <TD style="BORDER-TOP: #000000 10px solid" bgColor=#FFFFFF colSpan=3 
    height="1%"><style type="text/css">
<!--
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style2 {font-size: 10px}
.style3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
.style4 {color: #000000}
-->
</style><table width="678" border="0" align="center">
  <tr>
    <td><form id="form1" name="form1" method="post" action="javaScript:window.print()">
      <label>
      <div align="center">
        <input class="texto" type="submit" name="Submit" value="IMPRIMIR" />
      </div>
      </form>  </td>
  </tr>
</table>
</TD>
  </TR>
  </TBODY></TABLE>
</BODY></HTML>
