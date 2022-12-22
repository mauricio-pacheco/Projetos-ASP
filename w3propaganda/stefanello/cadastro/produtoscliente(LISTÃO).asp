<!--#include file="verificacliente.asp"-->
<!--#include file="conexao.asp"-->
<!--#include file="meta.asp"-->
<% 

Dim rs
Dim rs2
Dim rs3
Dim SQL
Dim Conexao
Dim BancoDados
Dim aham
Dim record
Dim limpa
Dim limpa2
Dim limpado
Dim limpado2

aham = date

limpa = Cstr(Session("usuario"))

Set rs8 = Server.CreateObject("ADODB.Recordset") 
SQL8 = "SELECT usuario FROM representantes WHERE usuario =' " & limpa & " '"
rs8.Open SQL8, wm,3,3

if not rs8.EOF then
limpa2 = rs8("usuario")
else
limpa2 = Cstr(Session("usuario"))
end if 

Set rs = Server.CreateObject("ADODB.Recordset") 
SQL = "SELECT * FROM clientes WHERE representante ='" & limpa2 & "' "
rs.Open SQL, wm,3,3
      

%>
<div align="center"><img src="logore.jpg" width="550" height="150" /></div>
  <TABLE width="680" border=0 align="center" cellPadding=0 
cellSpacing=0 bgColor=#ffffff class=texto style="BORDER-RIGHT: gainsboro 1px solid" style="BORDER-LEFT: gainsboro 1px solid"></HTML>
  <TBODY>
  <TR>
    <TD bgColor=#006200 colSpan=3 height=25><TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=center>
          <TD width="98%" bgcolor="#006200"><FONT color=#ffffff><span class="style2">&nbsp;&nbsp;Cadastro de Representantes - <script language="JavaScript">

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
- 
Seja bem vindo <%=Session("usuario")%> - <a class=home_titulo7000 href="sair.asp">Sair do Sistema</a></span></FONT></TD>
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
                            <TD align=middle><div align="left"><span style="font-size: 12px">Lista de  Produtos e Clientes</span></div></TD>
                          </TR></TBODY></TABLE> <script language=javascript>
								   function validar(cadastro) { 
								   
								   if (document.cadastro.expedicao.value=="") {
alert("O Campo Data de Expedição não está preenchido!")
cadastro.expedicao.focus();
return false
}

if (document.cadastro.entrega.value=="") {
alert("O Campo Data de Entrega não está preenchido!")
cadastro.entrega.focus();
return false
}

}
								   
								   
								   function Mascara (formato, keypress, objeto){
campo = eval (objeto);

// data nascimento
if (formato=='expedicao'){
separador = '/'; 
conjunto1 = 2;
conjunto2 = 5;
if (campo.value.length == conjunto1)
  {
  campo.value = campo.value + separador;
  }
if (campo.value.length == conjunto2)
  {
  campo.value = campo.value + separador;
  }
}



// data cadastro
if (formato=='entrega'){
separador = '/'; 
conjunto1 = 2;
conjunto2 = 5;
if (campo.value.length == conjunto1)
  {
  campo.value = campo.value + separador;
  }
if (campo.value.length == conjunto2)
  {
  campo.value = campo.value + separador;
  }
}



// celular
if (formato=='celular32'){
separador1 = '(';
separador2 = ') ';
separador3 = '-';
conjunto1 = 0;
conjunto2 = 3;
conjunto3 = 9;
if (campo.value.length == conjunto1){
campo.value = campo.value + separador1;
}
if (campo.value.length == conjunto2){
campo.value = campo.value + separador2;
}
if (campo.value.length == conjunto3){
campo.value = campo.value + separador3;
}
}

}

</SCRIPT>
                        <form method="POST" name="cadastro" action="repedido.asp" onSubmit="return validar(this)"><TABLE class=texto cellSpacing=5 cellPadding=0 
                        width="100%" align=center border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top class="style2" style="font-size: 12px"><span class="style2" style="font-size: 12px">Representante Respons&aacute;vel:</span></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top class="style2" style="font-size: 12px"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                              <% 

limpado = Cstr(Session("usuario"))

Set rs2 = Server.CreateObject("ADODB.Recordset") 
SQL2 = "SELECT * FROM representantes"
rs2.Open SQL2, wm,3,3

if not rs2.EOF then
limpado2 = rs2("usuario")
else
limpado2 = Cstr(Session("usuario"))
end if 

Set rs10 = Server.CreateObject("ADODB.Recordset") 
SQL10 = "SELECT * FROM representantes WHERE usuario ='" & limpado2 & "' "
rs10.Open SQL10, wm,3,3


%> <%
							Do While NOT rs10.EOF %><input class="texto" size="40" name="rresp" value="<%=rs10("nocliente")%>" readonly="true" /><% 
	  rs10.MoveNext
      Loop
	  					 %>
                            </font></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top class="style2" style="font-size: 12px">&nbsp;</TD>
                          </TR>
                          <TR>
                            <TD vAlign=top class="style2" style="font-size: 12px">Selecione o Cliente:</TD>
                          </TR>
                          <TR>
                            <TD vAlign=top class="style2" style="font-size: 12px"><span class="style2" style="font-size: 12px"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#ffffff" size="1"><font color="#000000">
                              <select class="texto" 
                              name="clientetotal">
                                <%
							Do While NOT rs.EOF %><option value="<%=rs("cod")%> - <%=rs("cliente")%> - <%=rs("razaosocial")%> - <%=rs("nomefantasia")%><br><br>Endereço: <%=rs("endereco")%> - Bairro: <%=rs("bairro")%> - Complemento: <%=rs("complend")%><br><br>Cidade: <%=rs("cidade")%> - Estado: <%=rs("estado")%> - CEP: <%=rs("cep")%><br><br>Telefone: <%=rs("telefone")%> - FAX: <%=rs("fax")%> - Insc. Est.: <%=rs("ie")%> - CNPJ/CPF: <%=rs("cnpjcpf")%>"><%=rs("cod")%> - <%=rs("cliente")%> - <%=rs("razaosocial")%> - <%=rs("nomefantasia")%></option><% 
	  rs.MoveNext
      Loop
	  					 %>
                              </select>
                            </font></font></font></span></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top class="style2" style="font-size: 12px">&nbsp;</TD>
                          </TR>
                          <TR>
                            <TD vAlign=top class="style2" style="font-size: 12px"><span class="style2" style="font-size: 12px">Selecione os Produtos:</span></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top class="style2" style="font-size: 10px"><table width="100%" border="0">
                              <tr>
                                <td></td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td width="3%"></td>
                                <td width="14%"><span class="style2" style="font-size: 10px; color: #FF0000">&nbsp;&nbsp;Código</span></td>
                                <td width="49%"><span class="style2" style="font-size: 10px; color: #FF0000">Nome do Produto</span></td>
                                <td width="3%"></td>
                                <td width="15%"></td>
                                <td width="10%"></td>
                                <td width="3%"></td>
                                <td width="3%"></td>
                              </tr>
                            </table>
                                 <% 

Set rs3 = Server.CreateObject("ADODB.Recordset") 

SQL = "SELECT * FROM produtos"

rs3.Open SQL, wm,3,3


%>
                                  <% Do While NOT rs3.EOF %><table width="100%" border="0">
                              <tr>
                                <td width="3%"><span class="style2" style="font-size: 10px">
                            <script>

function checkText(e, text){
    try{var element = e.target          }catch(er){};
    try{var element = event.srcElement  }catch(er){};
    
    document.getElementById(text).disabled = !element.checked;
}

</script><input type="checkbox" name="pedidos" id="check<%=rs3("codigo")%>" onClick="checkText(event, 'campo<%=rs3("codigo")%>')"/>
                                </span></td>
                                <td width="15%"><span class="style2" style="font-size: 10px"><%=rs3("codigo")%></span></td>
                                <td width="45%"><span class="style2" style="font-size: 10px"><%=rs3("nome")%></span></td>
                                <td width="4%"><span class="style2" style="font-size: 10px"><%=rs3("un")%></span></td>
                                <td width="17%"><span class="style2" style="font-size: 10px">R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td>
                                <td width="11%"><div align="right"><span class="style2" style="font-size: 10px">&nbsp;<span class="style2" style="font-size: 10px"><span class="style2" style="font-size: 10px"><span style="color: #0033CC">Quantidade:</span></span></span></span></div></td>
                                <td width="2%"><select class="texto" name="quantidade" id="campo<%=rs3("codigo")%>" disabled>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 1 </span></td></tr></table>">1</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 2 </span></td></tr></table>">2</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 3 </span></td></tr></table>">3</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 4 </span></td></tr></table>">4</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 5 </span></td></tr></table>">5</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 6 </span></td></tr></table>">6</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 7 </span></td></tr></table>">7</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 8 </span></td></tr></table>">8</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 9 </span></td></tr></table>">9</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 10 </span></td></tr></table>">10</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 11 </span></td></tr></table>">11</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 12 </span></td></tr></table>">12</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 13 </span></td></tr></table>">13</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 14 </span></td></tr></table>">14</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 15 </span></td></tr></table>">15</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 16 </span></td></tr></table>">16</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 17 </span></td></tr></table>">17</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 18 </span></td></tr></table>">18</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 19 </span></td></tr></table>">19</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 20 </span></td></tr></table>">20</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 21 </span></td></tr></table>">21</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 22 </span></td></tr></table>">22</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 23 </span></td></tr></table>">23</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 24 </span></td></tr></table>">24</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 25 </span></td></tr></table>">25</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 26 </span></td></tr></table>">26</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 27 </span></td></tr></table>">27</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 28 </span></td></tr></table>">28</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 29 </span></td></tr></table>">29</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 30 </span></td></tr></table>">30</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 31 </span></td></tr></table>">31</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 32 </span></td></tr></table>">32</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 33 </span></td></tr></table>">33</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 34 </span></td></tr></table>">34</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 35 </span></td></tr></table>">35</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 36 </span></td></tr></table>">36</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 37 </span></td></tr></table>">37</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 38 </span></td></tr></table>">38</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 39 </span></td></tr></table>">39</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 40 </span></td></tr></table>">40</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 41 </span></td></tr></table>">41</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 42 </span></td></tr></table>">42</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 43 </span></td></tr></table>">43</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 44 </span></td></tr></table>">44</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 5 </span></td></tr></table>">5</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 45 </span></td></tr></table>">45</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 46 </span></td></tr></table>">46</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 47 </span></td></tr></table>">47</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 48 </span></td></tr></table>">48</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 49 </span></td></tr></table>">49</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 50 </span></td></tr></table>">50</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 51 </span></td></tr></table>">51</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 52 </span></td></tr></table>">52</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 53 </span></td></tr></table>">53</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 54 </span></td></tr></table>">54</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 55 </span></td></tr></table>">55</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 56 </span></td></tr></table>">56</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 57 </span></td></tr></table>">57</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 58 </span></td></tr></table>">58</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 59 </span></td></tr></table>">59</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 60 </span></td></tr></table>">60</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 61 </span></td></tr></table>">61</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 62 </span></td></tr></table>">62</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 63 </span></td></tr></table>">63</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 64 </span></td></tr></table>">64</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 65 </span></td></tr></table>">65</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 66 </span></td></tr></table>">66</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 67 </span></td></tr></table>">67</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 68 </span></td></tr></table>">68</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 69 </span></td></tr></table>">69</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 70 </span></td></tr></table>">70</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 71 </span></td></tr></table>">71</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 72 </span></td></tr></table>">72</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 73 </span></td></tr></table>">73</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 74 </span></td></tr></table>">74</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 75 </span></td></tr></table>">75</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 76 </span></td></tr></table>">76</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 77 </span></td></tr></table>">77</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 78 </span></td></tr></table>">78</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 79 </span></td></tr></table>">79</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 80 </span></td></tr></table>">80</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 81 </span></td></tr></table>">81</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 82 </span></td></tr></table>">82</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 83 </span></td></tr></table>">83</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 84 </span></td></tr></table>">84</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 85 </span></td></tr></table>">85</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 86 </span></td></tr></table>">86</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 87 </span></td></tr></table>">87</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 88 </span></td></tr></table>">88</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 89 </span></td></tr></table>">89</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 90 </span></td></tr></table>">90</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 91 </span></td></tr></table>">91</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 92 </span></td></tr></table>">92</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 93 </span></td></tr></table>">93</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 94 </span></td></tr></table>">94</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 95 </span></td></tr></table>">95</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 96 </span></td></tr></table>">96</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 97 </span></td></tr></table>">97</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 98 </span></td></tr></table>">98</option>
                                   <option value="<table><tr><td><span class=style2 style=font-size: 10px><%=rs3("codigo")%></span>&nbsp;&nbsp; </td><td><span class=style2 style=font-size: 10px><%=rs3("nome")%></span>&nbsp;&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px><%=rs3("un")%></span>&nbsp;&nbsp;</td><td><span class=style2 style=font-size: 10px>R$ <%=FormatNumber(cint(rs3("preco"))/ 100, 2)%></span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<span class=style2 style=font-size: 10px>Quantidade: 99 </span></td></tr></table>">99</option>
                                  
                                   </select></td>
                                <td width="3%"><span class="style2" style="font-size: 10px">&nbsp;<img src="quant.gif" width="16" height="16"></span></td>
                              </tr>
                            </table>
                                  <% 
	  rs3.MoveNext
      Loop
	  					 %>
                             </TD>
                          </TR>
                          <TR>
                            <TD vAlign=top class="style2" style="font-size: 12px"><span class="style2" style="font-size: 10px; color: #000000">Data de Expedi&ccedil;&atilde;o:</span></font>
                                  
								   <input class="texto" size="18" name="expedicao" id="expedicao" value="" onKeyPress="Mascara('expedicao', window.event.keyCode, 'document.cadastro.expedicao');"  maxlength="10" />
                                  <span class="style2" style="font-size: 10px; color: #000000">Data de Entrega</span></font><font 
                              face="Verdana, Arial, Helvetica, sans-serif" size="1"><span style="font-size: 10px">:</span>
                                  <input class="texto" size="18" name="entrega" value="" id="entrega" onKeyPress="Mascara('entrega', window.event.keyCode, 'document.cadastro.entrega');"  maxlength="10" />
                                  </font></span></font>                                  </span></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top class="style2" style="font-size: 12px">&nbsp;</TD>
                          </TR>
                          <TR>
                            <TD width="60%" vAlign=top class="style2" style="font-size: 12px"><font 
                              face="Verdana, Arial, Helvetica, sans-serif" 
                              color="#000000" size="1">
                              <input class="texto" type="submit" value="Realizar Pedido" name="submit2"/>
                            </font></TD>
                          </TR>
                          </TBODY></TABLE>
                        </form></TD>
                    </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
   </TBODY></TABLE><table width="680" border="0" align="center"><TR>
    <TD style="BORDER-TOP: #006200 10px solid" bgColor=#FFFFFF colSpan=3 
    height="1%"><!--#include file="baixo.asp"--></TD>
  </TR>
  </TBODY></TABLE>
</BODY></HTML>
