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
        <TR>          </TR>
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
                              <DIV align=justify><STRONG>&raquo;</STRONG> HOME</DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD height=8></TD>
              </TR>
              <TR>
                <TD height=8><div align="center"><a href="edital.pdf" target=_blank><img src="eleicoes.jpg" width="451" height="270" border="1"></a></div></TD>
              </TR>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD align=middle height=1><IMG height=1 
                  src="home_arquivos/tc_layout_barra.gif" width=480></TD></TR>
          </TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width=482 border=0>
              <TBODY>
              <TR>
                <TD height=10></TD></TR>
              <TR>
                <TD class=fontedestaque>&nbsp;</TD>
              </TR>
              <TR>
                <TD class=fontedestaque><span style="color: #3A83A4"><STRONG>» Not&iacute;cias </STRONG></span></TD>
              </TR>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD class=fonte vAlign=center bgColor=#FFFFFF 
                        height=18><span class="fontedestaque"><span style="color: #434343">
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

RS.PageSize = 7 'quantidade de registros por página. Você pode alterar sem conforme precise.

'Vamos fazer a busca na tabela contatos
SQL = "select * from journal ORDER BY data DESC" 
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
		
   Response.Write ("<strong>&raquo;</strong>&nbsp;<a href='notihome.asp?id=" & id & "' target=_top>")
   Response.write RS("nome") & " - " & RS("data") & " - " & RS("hora") & "<BR><br>"
   Response.Write ("</a>")
   
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
                        
<br>
<br>
                      </span> <span style="color: #434343">
<a href="default.asp?pagina=<%=intpagina-1%>"><img border="0" src="seta1152.gif" width="7" height="7">&nbsp;Anterior</a> 
<% 
END IF

'Se não estivermos no último registro contado, então é mostrado o link p/ a próxima página 
IF strcomp(intpagina,RS.PageCount) <> 0 then 
%> 
   <a href="default.asp?pagina=<%=intpagina + 1%>">Próxima&nbsp;<img border="0" src="seta115.gif" width="7" height="7"></a> 
<% 
END IF
%>

                      </span></span></TD>
                    </TR>
                    </TBODY>
                  </TABLE></TD></TR>
              </TBODY></TABLE></TD></TR>
       <TR>
          <TD align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width=482 border=0>
              <TBODY>
              <TR>
                <TD height=10></TD>
              </TR>
              <TR>
          <TD align=middle height=1><IMG height=1 
            src="home_arquivos/tc_layout_barra.gif" width=480></TD></TR>
        <TR>
			  <TR>
                <TD height=10></TD>
              </TR>
              <TR>
                <TD height=10 class=fontedestaque><table width="100%" border="0">
                  <tr>
                    <td width="69%" class=fonte><span class="fontedestaque"><span style="color: #3A83A6"><STRONG>&raquo; Artigos </STRONG></span></span></td>
                    <td width="6%"><STRONG><a href="artigos.asp"><img src="carta.gif" border="0" width="24" height="19"></a></STRONG></td>
                    <td width="25%"><span class="fonte"><a href="artigos.asp">ENVIE SEU ARTIGO</a></span></td>
                  </tr>
                </table></TD>
              </TR>
              <TR>
                <TD height=10></TD>
              </TR>
              <TR>
                <TD height=10><span class="fontedestaque"><span style="color: #434343">
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

RS.PageSize = 7 'quantidade de registros por página. Você pode alterar sem conforme precise.

'Vamos fazer a busca na tabela contatos
SQL = "select * from artigos ORDER BY data DESC" 
RS.Open SQL,Conn,3,3

'Vamos agora verificar exceções do tipo “fim de arquivo” (EOF), se a página atual é menor 
'que zero, se é maior que o número total de páginas, etc.
IF RS.EOF then 
   Response.Write "nenhum registro encontrado"
   Response.End 'paramos o programa
ELSE
   'Definindo em qual pagina o visitante está
   IF Request.QueryString("paginacao")="" then 
      intpaginacao=1 
   ELSE
      IF cint(Request.QueryString("paginacao"))<1 then
         intpaginacao=1 
      ELSE
         IF cint(Request.QueryString("paginacao"))> RS.PageCount then 
            intpaginacao=RS.PageCount 
         ELSE
            intpaginacao=Request.QueryString("paginacao")
         END IF
      END IF
   END IF
END IF
'Fim das verificações de exceções

'Usamos a propriedade AbsolutePage para dizer ao RS que página ele esta 
RS.AbsolutePage=intpaginacao

' Inicia o contador que vai controlar os registros mostrados
intrecao=0

'Enquanto o contador for menor que a quantidade de registros mostrados ou
' não for o final do arquivo 
While intrecao < RS.PageSize and not RS.EOF 
'------------------- AQUI VEM TUDO O QUE SEÁ PAGINADO -----------------------
   
If RS("autoriza") = "s" then
  
   id = rs("ID")

   Response.Write ("<strong>&raquo;</strong>&nbsp;<a href='notart2.asp?id=" & id & "' target=_top>")
   Response.Write ("<font color=""#008040"">")
   Response.write RS("autor") & "</font> - " & RS("assunto") & " - " & RS("data") & "  - " & RS("hora") & "<BR><br>"
   Response.Write ("</a>")
   
'---------------------------------------------------------------------------------------------
   RS.MoveNext

  Else
   
   END IF
   ' Acrescenta +1 ao contador
   intrecao=intrecao+1 
   'Se for EOF (fim de arquivo), imprimir branco na tela
   IF RS.EOF then 
      response.write " " 
   END IF
Wend 'fim do loop

'Vamos verificar se não é a página 1, para podermos colocar o link “anterior”. 
IF intpaginacao > 1 then 
   %>
                  <br>
                  <br>
                </span> <span style="color: #434343"> <a href="default.asp?paginacao=<%=intpaginacao-1%>"><img border="0" src="seta1152.gif" width="7" height="7">&nbsp;Anterior</a>
                <% 
END IF

'Se não estivermos no último registro contado, então é mostrado o link p/ a próxima página 
IF strcomp(intpaginacao,RS.PageCount) <> 0 then 
%>
                <a href="default.asp?paginacao=<%=intpaginacao + 1%>">Próxima&nbsp;<img border="0" src="seta115.gif" width="7" height="7"></a>
                <% 
END IF
%>
                </span></span></TD>
              </TR>
              <TR>
                <TD height=10> <p class="fontedestaque">&nbsp;</p></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle height=1><IMG height=1 
            src="home_arquivos/tc_layout_barra.gif" width=480></TD></TR>
        <TR>
          <TD height=10>&nbsp;</TD>
        </TR>
        <TR>
          <TD height=10><div align="center"><!--#include file="new/mailing_list_inc.asp" -->
          </div></TD>
        </TR>
        <TR>
          <TD height=10>&nbsp;</TD>
        </TR>
        <TR>
          <TD height=10><div align="center">
            <p class="fontedestaque"><span style="color: #434343">
              <%
			 Response.Write ("<MARQUEE behavior= ""scroll"" align= ""center"" direction= ""left"" height=""30"" width=""478"" scrollamount= ""4"" scrolldelay= ""10"" onmouseover='this.stop()' onmouseout='this.start()'>")
		'Efetuando a conex&atilde;o com a base de dados criada -----------------------
Set Conn = Server.CreateObject("AdoDb.Connection") 
Conn.provider="Microsoft.Jet.OLEDB.4.0" 
Conn.connectionstring=Server.Mappath("dcebd/dcedata.mdb") 
Conn.open 
'--------------------------------------------------------------------------

'Vamos criar o objeto Record Set -> neste caso &eacute; necess&aacute;rio declar&aacute;-lo,
'pois vamos utilizar algumas fun&ccedil;&otilde;es deste objeto 
Set RS = Server.CreateObject("adodb.recordset")

RS.PageSize = 999 'quantidade de registros por p&aacute;gina. Voc&ecirc; pode alterar sem conforme precise.

'Vamos fazer a busca na tabela contatos
SQL = "select * from patrocinio ORDER BY data DESC" 
RS.Open SQL,Conn,3,3

'Vamos agora verificar exce&ccedil;&otilde;es do tipo &ldquo;fim de arquivo&rdquo; (EOF), se a p&aacute;gina atual &eacute; menor 
'que zero, se &eacute; maior que o n&uacute;mero total de p&aacute;ginas, etc.
IF RS.EOF then 
   Response.Write "nenhum registro encontrado"
   Response.End 'paramos o programa
ELSE
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
		
   
   
   Response.Write ("<img src=patrocinio/" & RS("foto") & ">&nbsp;&nbsp;")
   
                  
   
   
'---------------------------------------------------------------------------------------------
   RS.MoveNext

   ' Acrescenta +1 ao contador
   intrec=intrec+1 
   'Se for EOF (fim de arquivo), imprimir branco na tela
   IF RS.EOF then 
      response.write " " 
   END IF
Wend 'fim do loop
Response.Write ("</marquee>")
'Vamos verificar se n&atilde;o &eacute; a p&aacute;gina 1, para podermos colocar o link &ldquo;anterior&rdquo;. 
IF intpagina > 1 then 
   %>
            </span></p>
            <p class="fontedestaque"><span style="color: #434343"> <br>
              </span> <span style="color: #434343"> <a href="conv.asp?pagina=<%=intpagina-1%>"><img border="0" src="seta1152.gif" width="7" height="7">&nbsp;Anterior</a>
              <% 
END IF

'Se n&atilde;o estivermos no &uacute;ltimo registro contado, ent&atilde;o &eacute; mostrado o link p/ a pr&oacute;xima p&aacute;gina 
IF strcomp(intpagina,RS.PageCount) <> 0 then 
%>
              <a href="conv.asp?pagina=<%=intpagina + 1%>">Pr&oacute;xima&nbsp;<img border="0" src="seta115.gif" width="7" height="7"></a>
              <% 
END IF
%>
            </span></p>
          </div></TD>
        </TR></TBODY></TABLE>
    </TD>
    <TD vAlign=top align=middle width=140 bgColor=#f2f2f2>
      <!--#include file="tdireita.asp"--><!--#include file="baixo.asp"--></BODY></HTML>
