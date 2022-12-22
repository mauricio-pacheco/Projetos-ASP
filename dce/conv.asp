<!--#include file="cabecalho.asp"-->
<!--#include file="tabelacima.asp"-->
<TABLE cellSpacing=0 cellPadding=0 width=778 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=middle width=140 bgColor=#f2f2f2>
      <!--#include file="tesquerda.asp"--></TD>
    <TD vAlign=top align=middle width=498 
    background=home_arquivos/tc_layout_15.jpg height=25>
      <TABLE cellSpacing=0 cellPadding=0 width=498 border=0>
        <TBODY>
        <TR>
          <TD vAlign=center align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width=482 border=0>
              <TBODY>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD class=fonte>
                  <TABLE cellSpacing=0 cellPadding=0 width=482 border=0>
                    <TBODY>
                    <TR>
                      <TD width=62>
                        <DIV align=center><IMG height=50 
                        src="home_arquivos/default.jpg" width=50></DIV></TD>
                      <TD vAlign=center width=422>
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" 
border=0>
                          <TBODY>
                          <TR>
                            <TD class=fonte><span class="fontedestaque"><span style="color: #3A83A6"><strong>» DCE - Diret&oacute;rio Central dos Estudantes </strong></span></span></TD>
                          </TR>
                          <TR>
                            <TD class=fonte height=5></TD></TR>
                          <TR>
                            <TD class=fonte>
                              <DIV align=justify><STRONG>&raquo;</STRONG> CONV&Ecirc;NIOS</DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD align=middle height=1><IMG height=1 
                  src="home_arquivos/tc_layout_barra.gif" width=480></TD></TR>
          </TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle>
            <TABLE width=482 border=0 align="center" cellPadding=0 cellSpacing=0>
              <TBODY>
              <TR>
                <TD height=10></TD>
              </TR>
              <TR>
                <TD height=10><table width="98%" border="0" align="center">
                  <tr>
                    <td width="4%"><img src="conta.gif" width="14" height="12"></td>
                    <td width="96%"><a href="conv2.asp" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px">SEJA UM CONV&Ecirc;NIADO</a> </td>
                  </tr>
                </table></TD>
              </TR>
              <TR>
                <TD height=10></TD></TR>
              <TR>
                <TD class=fontedestaque><p class="fontedestaque"><span style="color: #434343">
                  <%
		'Efetuando a conexão com a base de dados criada -----------------------
Set Conn = Server.CreateObject("AdoDb.Connection") 
Conn.provider="Microsoft.Jet.OLEDB.4.0" 
Conn.connectionstring=Server.Mappath("dcebd/dcedata.mdb") 
Conn.open 
'--------------------------------------------------------------------------

'Vamos criar o objeto Record Set -> neste caso é necessário declará-lo,
'pois vamos utilizar algumas funções deste objeto 
Set RS = Server.CreateObject("adodb.recordset")

RS.PageSize = 4 'quantidade de registros por página. Você pode alterar sem conforme precise.

'Vamos fazer a busca na tabela contatos
SQL = "select * from convenios ORDER BY data DESC" 
RS.Open SQL,Conn,3,3

'Vamos agora verificar exceções do tipo “fim de arquivo” (EOF), se a página atual é menor 
'que zero, se é maior que o número total de páginas, etc.
IF RS.EOF then 
   Response.Write "nenhum registro encontrado"
   Response.End 'paramos o programa
ELSE
   'Definindo em qual pagina o visitante está
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
END IF
'Fim das verificações de exceções

'Usamos a propriedade AbsolutePage para dizer ao RS que página ele esta 
RS.AbsolutePage=intpagina

' Inicia o contador que vai controlar os registros mostrados
intrec=0

'Enquanto o contador for menor que a quantidade de registros mostrados ou
' não for o final do arquivo 
While intrec < RS.PageSize and not RS.EOF 
'------------------- AQUI VEM TUDO O QUE SEÁ PAGINADO -----------------------
   
   id = rs("ID")
		
   
   Response.Write ("<hr>")
   Response.Write ("<font size=""1"">")
   
   Response.Write ("<table width=""98%"" border=""0"" align=""center""><tr><td width=""29%""><img src=convenios/" & RS("foto") & "></td>")
   Response.Write ("<td width=""71%""><font size=""1"">" & RS("comentario") & "</font></td></tr></table>")                  
   Response.Write ("</font>")
   
   Response.Write ("<hr>")
                  
   
   
'---------------------------------------------------------------------------------------------
   RS.MoveNext

   ' Acrescenta +1 ao contador
   intrec=intrec+1 
   'Se for EOF (fim de arquivo), imprimir branco na tela
   IF RS.EOF then 
      response.write " " 
   END IF
Wend 'fim do loop

'Vamos verificar se não é a página 1, para podermos colocar o link “anterior”. 
IF intpagina > 1 then 
   %>
                  
                        </span></p>
                  <p class="fontedestaque"><span style="color: #434343">
                    <br>
                    </span> <span style="color: #434343">
                      <a href="conv.asp?pagina=<%=intpagina-1%>"><img border="0" src="seta1152.gif" width="7" height="7">&nbsp;Anterior</a> 
                      <% 
END IF

'Se não estivermos no último registro contado, então é mostrado o link p/ a próxima página 
IF strcomp(intpagina,RS.PageCount) <> 0 then 
%> 
                      <a href="conv.asp?pagina=<%=intpagina + 1%>">Próxima&nbsp;<img border="0" src="seta115.gif" width="7" height="7"></a> 
       <% 
END IF
%>
                      
                    </span></p></TD>
              </TR>
              <TR>
                <TD>                  </TD></TR>
              <TR>
              <TD height=10></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle height=1><IMG height=1 
            src="home_arquivos/tc_layout_barra.gif" width=480></TD></TR></TBODY></TABLE>
    </TD>
    <TD vAlign=top align=middle width=140 bgColor=#f2f2f2>
      <!--#include file="tdireita.asp"--><!--#include file="baixo.asp"--></BODY></HTML>
