<tr bordercolor="#790C12">
          <td height="2" align="center"><img src="baxo.gif" width="730" height="10" /></td>
        </tr>
        <tr bordercolor="#790C12">
          <td height="2"><p class="fontedestaque"><span style="color: #434343">
            <%
		'Efetuando a conex&atilde;o com a base de dados criada -----------------------
Set Conn = Server.CreateObject("AdoDb.Connection") 
Conn.provider="Microsoft.Jet.OLEDB.4.0" 
Conn.connectionstring=Server.Mappath("free.mdb") 
Conn.open 
'--------------------------------------------------------------------------

'Vamos criar o objeto Record Set -> neste caso &eacute; necess&aacute;rio declar&aacute;-lo,
'pois vamos utilizar algumas fun&ccedil;&otilde;es deste objeto 
Set RS = Server.CreateObject("adodb.recordset")

RS.PageSize = 4 'quantidade de registros por p&aacute;gina. Voc&ecirc; pode alterar sem conforme precise.

'Vamos fazer a busca na tabela contatos
SQL = "select * from convenios ORDER BY data DESC" 
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
		
   
   Response.Write ("<hr>")
   Response.Write ("<font size=""1"" face=""Verdana"">")
   Response.Write ("<table width=""98%"" border=""0"" align=""center""><tr><b><font size=""2"">" & RS("titulo") & "</font></b>")
   Response.Write ("</tr></table>") 
   Response.Write ("<table width=""98%"" border=""0"" align=""center""><tr><td width=""29%""><img src=formaturas/" & RS("foto") & "></td>")
   Response.Write ("<td width=""71%""><div align=""justify""><font size=""1"">" & RS("comentario") & "</font></div></td></tr></table>")                  
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

'Vamos verificar se n&atilde;o &eacute; a p&aacute;gina 1, para podermos colocar o link &ldquo;anterior&rdquo;. 
IF intpagina > 1 then 
   %>
          </span></p>
            <span style="color: #434343"> <a href="formaturas.asp?pagina=<%=intpagina-1%>"><img border="0" src="seta1152.gif" width="7" height="7" />&nbsp;Anterior</a>
              <% 
END IF

'Se n&atilde;o estivermos no &uacute;ltimo registro contado, ent&atilde;o &eacute; mostrado o link p/ a pr&oacute;xima p&aacute;gina 
IF strcomp(intpagina,RS.PageCount) <> 0 then 
%>
              <a href="formaturas.asp?pagina=<%=intpagina + 1%>">Pr&oacute;xima&nbsp;<img border="0" src="seta115.gif" width="7" height="7" /></a>
              <% 
END IF
%>
            </span></td>
        </tr>
        <tr bordercolor="#790C12">
          <td height="2"><img src="baxo2.gif" width="730" height="10" /></td>
        </tr>