<!--#include file="verifica.asp"-->
<!--#include file="meta.asp"-->
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
  - Seja bem vindo <span style="color: #FFFFFF">Administrador</span> - <a class=home_titulo7000 href="fujir.asp">Sair do Sistema</a></span></FONT></TD>
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
                            <TD align=middle><div align="left"><span style="font-size: 12px">Resultados da Busca</span></div></TD>
                          </TR></TBODY></TABLE>
                       <TABLE class=texto cellSpacing=5 cellPadding=0 
                        width="100%" align=center border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top width="60%"><FORM name=login action=logar.asp method=post><table width="100%" align="left" border="0">
                              <tbody>
                                <tr>
                                  <td width="68%" class="style2"><%
Busca = Trim(Request.form("buscando"))
%>


<!--#include file="conexao.asp"-->
<%
Set objRS = Server.CreateObject("ADODB.Recordset")
%>


<%
function TiraAspas(str)
str = replace(str,"'","""")
TiraAspas = str
End function
%>



<% 
Busca=TiraAspas(Busca)

strSql = "SELECT * FROM clientes WHERE nome LIKE '%"&Busca&"%'" 
objRS.Open strSQL,wm,1,1
%>

<%
if (len(busca)<=2) then
Response.write("Digite uma palavra com o mínimo de 3 letras para fazer a busca.")

ElseIf (Busca = "") then
Response.write("Você precisa escrever uma palavra para fazer uma busca.")

ElseIf (objRS.EOF = true) then
response.write "Sua busca por <font color=""#ff0000""><b>"&Busca&"</b></font> não retornou nenhum resultado, por favor tente ser menos específico."
Else
do While not objRS.EOF
%>
&nbsp;<a class=home_titulo1000 href="deletar.asp?clienteid=<%=objRS("clienteid")%>"><img alt="Apagar Representante" border="0" src="deletar.gif"></a>&nbsp;<img src="carinha2.gif">&nbsp;<a class=home_titulo1000 href="cliperfil.asp?clienteid=<%=objRS("clienteid")%>"><%=objRS(TiraAspas("nome"))%></a><br>
<%
objRS.MoveNext
Loop
End IF
%></td>
                                </tr>
                              </tbody>
                            </table>
                            </form></TD>
                          </TR></TBODY></TABLE></TD>
                    </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
   </TBODY></TABLE><table width="680" border="0" align="center"><TR>
    <TD style="BORDER-TOP: #006200 10px solid" bgColor=#FFFFFF colSpan=3 
    height="1%"><!--#include file="baixo.asp"--></TD>
  </TR>
  </TBODY></TABLE>
</BODY></HTML>
