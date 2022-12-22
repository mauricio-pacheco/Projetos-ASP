<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!-- #include file="topo.asp" -->
 <%
DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
          DSNtemp=dsntemp & "DBQ=" & server.mappath("santa900/santaluz.mdb")
          sqlstmt = "SELECT * FROM liberacao"
          Set rs = Server.CreateObject("ADODB.Recordset")
          rs.Open sqlstmt, DSNtemp, 3, 3
TotalRecs = rs.recordcount

		liberalo = rs("liberar")
		
   %>
<script>
  function camada( sId ) {
  var sDiv = document.getElementById( sId );
  if( sDiv.style.visibility == "hidden" ) {
  sDiv.style.visibility = "visible";
  } else {
  sDiv.style.visibility = "hidden";
  }
  }
</script>
	<div ID="menu" style="position:absolute; z-index:9; VISIBILITY: <% =liberalo %>; top: 1px;"><A HREF="#" ONCLICK="camada('menu');">
  <img src="fechar.gif" border="0">
</A><br>
<img src="abertura/frente.jpg"></div>
<script>
	function cadmail(){
		window.open('cadmail.asp?email='+document.emailx.email.value,'email','resizable=no,width=270,height=180,scrollbars=no');
		document.emailx.reset()
	}
	function limpa() {
	document.emailx.email.value=''
	}
	
</script>
<table width=596 cellspacing="3" cellpadding="1" align=right>
  <tr><td colspan=2><table align="center" width="100%" border="0">
  <tr>
    <td><%
strCaminho = Server.MapPath("/santa900/santaluz.mdb")
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strCaminho & ";"

Set rs = Server.CreateObject("ADODB.Recordset") 
SQL = "SELECT * FROM meio"
rs.Open SQL, objConn,3,3

RANDOMIZE
menor = 1
maior = 3
sorteado = Int((maior-menor+1)*Rnd+menor)

Do While NOT rs.EOF 
   
	%>
    <%
	SELECT Case sorteado
	Case "1"
	 %>
    <a class=home_titulo1000 href="<%=rs("link1")%>" target="_blank"><img src="<%=rs("foto1")%>" border="0" ></a>
	<%
	Case "2"
	%>
	<a class=home_titulo1000 href="<%=rs("link2")%>" target="_blank"><img src="<%=rs("foto2")%>" border="0" ></a>
	<%
	Case "3"
	%>
    <a class=home_titulo1000 href="<%=rs("link3")%>" target="_blank"><img src="<%=rs("foto3")%>" border="0" ></a>
	
	<% 
	end select
	  rs.MoveNext
      Loop
	  					 %>
	</td>
  </tr>
</table>
<img src=<%=dirlingua%>/imagens/ofertasdodia.gif border=0></td></tr>
				<!-- #include file="produto.asp" -->
<tr><td><table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
					   <table BORDER="0" CELLSPACING="1" CELLPADDING="4"><tr><td bgcolor=#ffffff>
					   		  <table border=0 align=center width=390  height=240 cellspacing="0" cellpadding="0">
                              <tr>
                                <td valign="top">
                                <table width="100%" border="0">
                                    <tr>
                                      <td width="51%" valign="top"><table width="100%" border="0">
                                        <tr>
                                          <td><font color=000000><font style=font-size:11px;font-family:<%=fonte%>><b>Entre em contato conosco por:</b><br>
                                          Telefone, E-mail ou pelo link Atendimento</font></font></td>
                                        </tr>
                                      </table>
                                        <table width="98%" border="0" align="center">
                                          <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td width="10%"><div align="center"><img src="telefone.gif">&nbsp;</div></td>
                                            <td width="90%"><font style=font-size:11px;font-family:<%=fonte%>>(0xx55) 3744 - 1652</font></td>
                                          </tr>
                                        </table>
                                        <table width="98%" border="0" align="center">
                                          <tr>
                                            <td width="10%"><div align="center"><img src="cart.gif">&nbsp;</div></td>
                                            <td width="90%"><font style=font-size:11px;font-family:<%=fonte%>><a href="mailto:sac@opticasantaluzia.com.br" class="menu">sac@opticasantaluzia.com.br</a></font></td>
                                          </tr>
                                        </table>
                                        <table width="98%" border="0" align="center">
                                          <tr>
                                            <td width="10%"><div align="center"><img src="carinha.gif">&nbsp;</div></td>
                                            <td width="90%"><font style=font-size:11px;font-family:<%=fonte%>><a href="ajuda_email.asp" class="menu">Fale Conosco</a></font></td>
                                          </tr>
                                      </table></td>
                                      <td width="49%" valign="top"><table width="100%" border="0">
                                        <tr>
                                          <td><font color=000000><font style=font-size:11px;font-family:<%=fonte%>><b>Enquete:</b></font></font></td>
                                        </tr>
                                      </table>
                                        <table width="100%" border="0">
                                          <tr>
                                            <td><iframe src="enquete/enquete.php" width="180" height="240" frameborder="0" marginheight="0" marginwidth="0" scrolling="No"></iframe></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                </table>
                                </center> </td></tr></table>
					   </table>
				</table>
			    </td><td valign="top">
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
		</td>
        </tr>
 </table>
 
    </form>
	<!-- #include file="baixo.asp" -->