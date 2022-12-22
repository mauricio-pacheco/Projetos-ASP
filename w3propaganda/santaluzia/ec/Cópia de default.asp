<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!-- #include file="topo.asp" -->
<script>
function camada( sId ) {
var sDiv = document.getElementById( sId );
if( sDiv.style.visibility == "hidden" ) {
sDiv.style.visibility = "visible";
} else {
sDiv.style.visibility = "hidden";
}
}
</SCRIPT>
<script>
	function cadmail(){
		window.open('cadmail.asp?email='+document.emailx.email.value,'email','resizable=no,width=270,height=180,scrollbars=no');
		document.emailx.reset()
	}
	function limpa() {
	document.emailx.email.value=''
	}
	
</script><A HREF="#" ONCLICK="camada('menu');">Novidades</A><DIV ID="menu" STYLE="POSITION: absolute; TOP: 35px; LEFT: 188px; WIDTH: 400px; HEIGHT: 300px; ZINDEX: 2; BACKGROUND: #FFFFFF; BORDER: 3px dotted #000000; VISIBILITY: hidden;">Testando a visibilidade da camada</DIV>
		 	<table BORDER="0" CELLSPACING="1" CELLPADDING="0" align="center">
			   	<tr><td colspan=2 align="left"><img src=<%=dirlingua%>/imagens/notbaixo3.gif border=0></td></tr><tr><td>
               <tr><td bgcolor=#bfbfbf>
			   <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			   		  <table align=center width="806" cellspacing="1" cellpadding="1"><tr><td>
        <font style=font-size:11px;font-family:<%=fonte%>><% 
		
registros = 5
pagina = Request.QueryString("pagina")
If pagina = "" Then
pagina = 1
End If

'Efetuando a conexão com a base de dados criada -----------------------
  Set Conexao = CreateObject("ADODB.Connection")



PagAtual = Request.QueryString("PagAtual") 'página atual

Set Conn = Server.CreateObject("ADODB.Connection") 
Conn.provider ="Microsoft.Jet.OLEDB.4.0" 
Conn.connectionstring=Server.Mappath("santa900/santaluz.mdb")
Conn.open


Set objRS = Server.CreateObject("ADODB.Recordset") 'acrescentei por causa da paginação
SQL = "SELECT * FROM novidades ORDER BY id DESC"

objRS.Open SQL, conn, 3


'############## paginacao Introdução #################

'------- Coloque aqui a quantidade de registros que você deseja por página --------

Const NumPorPage = 3

'Verifica qual a página solicitada
Dim PagAtual

IF Request.QueryString("PagAtual") = "" Then
PagAtual = 1 'Primeira página
Else
PagAtual = Request.QueryString("PagAtual")
End If

objRS.CacheSize = NumPorPage 'Define o tamanho do Cache = para o número de registros

objRS.MoveFirst 'Move o RecorSet para o início 
objRS.PageSize = NumPorPage 'Coloca a quantidade de páginas

Dim TotalPages 'Pega o número total de páginas
TotalPages = objRS.PageCount

objRS.AbsolutePage = PagAtual 'Configura a página atual

'############## paginacao Introdução - FIM #################

Count = 0 'Zera o contador
i = 0 

DO WHILE NOT objRS.EOF And Count < objRS.PageSize
%> 
<table><tr><td><img src="estrela.gif"></td><td><font style=font-size:11px;font-family:<%=fonte%>><a class="menu" href="noticias.asp?noticia=<%= objRS.Fields("id") %>"><%= objRS.Fields("titulo") %> - <%= objRS.Fields("data") %> - <%= objRS.Fields("hora") %></a></font></td></tr></table>
<%
i = i+1
Count = Count + 1 
objRS.MoveNext
LOOP 


'################## paginacao 01 #####################

'Coloca o Nº página atual / Nº Total de páginas

Response.Write("<br><B><font color=""#006600"" size=""1"" face=""Arial""><strong> Página " & PagAtual & " de " & TotalPages & " </strong></font></B> - ") 

'Mostra os botões: Anterior e Próxima, utilizando da opção de IF 

IF PagAtual > 1 THEN 

'Se for a primeira página, Mostra apenas o botão Próximo e Ultima
Response.Write("<B><font color=""#0B4B85"" size=""1"" face=""Arial"">") 
Response.Write("<a class=menu href='default.asp?PagAtual=" & PagAtual - 1 & "'>")
Response.Write("Anterior") 
Response.Write("</a></font></B> ")

Else

Response.Write("<B><font color=""#CCCCCC"" size=""1"" face=""Arial"">") 
Response.Write("Anterior") 
Response.Write("</font></B> ")


End If

'------------------- numero -------------------------
'---------- Numero de numeros para ser mostrados ----
max_n_mostrados = 3

intervalo = Int(max_n_mostrados /2)
inicio = PagAtual - intervalo
final = PagAtual + intervalo

If CInt(inicio) <1 Then 
inicio = 1
final = 10
END IF
If CInt(final) > CInt(TotalPages) Then final = TotalPages

For i = inicio To final
If CInt(i)=CInt(PagAtual) Then
Response.Write "<font color=""#0B4B85"" size=""1"" face=""Arial"">[ <B>" & i & "</B> <font color=""#0B4B85"">]</font> "
END IF
If CInt(i) < CInt(PagAtual) Then
Response.Write "<a class=menu href='default.asp?PagAtual=" & i & "'>" & i & "</a> "
END IF
If CInt(i) > CInt(PagAtual) Then
Response.Write "<a class=menu href='default.asp?PagAtual=" & i & "'>" & i & "</a> "
END IF
Next

'------------------------------------------------------

IF CInt(PagAtual) <> CInt(TotalPages) THEN 

'Se estiver na última página, mostra apenas o botão Anterior e Primeira

Response.Write("<B><font color=""#0B4B85"" size=""1"" face=""Arial"">")
Response.Write("<a class=menu href='default.asp?PagAtual=" & PagAtual + 1 & "'>")
Response.Write("Próxima")
Response.Write("</a></font></B> ") 

Else
Response.Write("<B>")
Response.Write("Próxima") 
Response.Write("</B> ")

End If 
'################## fim paginacao 01 ########################
%>
<%  Conexao.Open "Driver={Microsoft Access Driver (*.mdb)};DBQ=data\santaluzia.mdb;"
  Set rsconexao = Conexao.Execute("select * from novidades ORDER BY id")
  rsconexao.PageSize = registros

If rsconexao.EOF Then
Else
While Not rsconexao.EOF AND x < rsconexao.PageSize
x = x + 1 %>
<b><%=rsconexao("titulo")%></b><%=rsconexao("data")%> - <%=rsconexao("hora")%><br><br>
<% rsconexao.MoveNext
Wend

anterior = pagina - 1
proxima = pagina + 1
ultima = rsconexao.PageCount
primeira = 1
ultm2 = FormatNumber(rsconexao.PageCount - 1,0)
If pagina <> 1 Then
Response.Write "<b>&laquo; <a class=menu href=default.asp?pagina="&primeira&">Primeira Página</a></b> "
End If
If pagina > 1 AND pagina <> 2 Then
Response.Write "<b>[ <a class=menu href=default.asp?pagina="&anterior - 1&">"&anterior - 1&"</a> ]</b> "
End If
If pagina > 1 Then
Response.Write "<b>[ <a class=menu href=default.asp?pagina="&anterior&">"&anterior&"</a> ]</b> "
End If
Response.Write "<b>[ "&pagina&" ]</b> "
If Not rsconexao.EOF Then
Response.Write "<b>[ <a class=menu href=default.asp?pagina="&proxima&">"&proxima&"</a> ]</b> "
End If
If Not rsconexao.EOF AND pagina <> ultima AND pagina <> ultm2 Then
Response.Write "<b>[ <a class=menu href=default.asp?pagina="&proxima + 1&">"&proxima + 1&"</a> ]</b> "
End If
If Not rsconexao.EOF Then
Response.Write "<b><a class=menu href=default.asp?pagina="&ultima&">Última Página</a> &raquo;</b> "
End If
End If
Set rsconexao = Nothing
%></font>
        

                      </td></tr>
                      </table>
		       </table>   	
	   <tr><td colspan=2 align="center"><img src=<%=dirlingua%>/imagens/notbaixo.gif border=0></td></tr><tr><td> </table>
   	 <table width=596 cellspacing="3" cellpadding="1" align=right>
		 		<tr><td colspan=2><img src=<%=dirlingua%>/imagens/ofertasdodia.gif border=0></td></tr>
				<!-- #include file="produto.asp" -->
				<tr><td>
				<table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
					   <table BORDER="0" CELLSPACING="1" CELLPADDING="4"><tr><td bgcolor=#ffffff>
					   		  <table border=0 align=center width=390  height=125 cellspacing="0" cellpadding="0">
                              <tr><td><font color=000000><font style=font-size:11px;font-family:<%=fonte%>><b>Entre em contato conosco por:</b><br>Telefone, E-mail ou pelo link Atendimento<br><br>
                                  <table width="98%" border="0" align="center">
                                    <tr>
                                      <td width="10%"><div align="center"><img src="telefone.gif">&nbsp;</div></td>
                                      <td width="90%"><font style=font-size:11px;font-family:<%=fonte%>>(0xx55) 3744 - 1652</font></td>
                                    </tr>
                                  </table>
                                  <table width="98%" border="0" align="center">
                                    <tr>
                                      <td width="10%"><div align="center"><img src="cart.gif">&nbsp;</div></td>
                                      <td width="90%"><font style=font-size:11px;font-family:<%=fonte%>><a href="mailto:opticasantaluzia@gmail.com" class="menu">opticasantaluzia@gmail.com</a></font></td>
                                    </tr>
                                  </table>
                                  <table width="98%" border="0" align="center">
                                    <tr>
                                      <td width="10%"><div align="center"><img src="carinha.gif">&nbsp;</div></td>
                                      <td width="90%"><font style=font-size:11px;font-family:<%=fonte%>><a href="ajuda_email.asp" class="menu">Fale Conosco</a></font></td>
                                    </tr>
                                  </table>
                                </center> </td></tr></table>
					   </table>
				</table>
			    </td><td>
				<%rs.close%>
				<%set rs = nothing%>
				
		<form method=post action="javascript: cadmail()" name=emailx>

		<table BORDER="0" CELLSPACING="1" CELLPADDING="0">
			   <tr><td bgcolor=#bfbfbf>
			   <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			   		  <table align=center width=390 height=125 cellspacing="1" cellpadding="1"><tr><td><font color=000000><font style=font-size:11px;font-family:<%=fonte%>><b><%=strLg158%></b><br><%=strLg159%><br><br><center><font color=red size=1><%=erro%></font><Br><center><input type=text size=30 value="<%=strLg160%>" style=font-size:11px;font-family:<%=fonte%>;font-weight:bold name=email onFocus="limpa();"><br><input type=image src=<%=dirlingua%>/imagens/cadastro.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=srtLg161%>';return true;"><br><br></center> </td></tr>
					  </table>
		       </table>
	    </table>
		</td></tr>

		<tr><td colspan=2></td></tr>
		<tr><td colspan=2></td></tr>
 </table>
    </form>
	<!-- #include file="baixo.asp" -->