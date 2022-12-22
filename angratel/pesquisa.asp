<!-- #include file="topo.asp" -->
<%
'Requisita as variaveis
finalera = request.querystring("final")
pag = request.querystring("itens")
pesss = trim(request.querystring("pesq"))
palavra = Split(Trim(Request.QueryString("pesq")), " ")
tipo = request.querystring("cat")
xx = request.querystring("cat")
pagdxx = request.querystring("pagina")
If pesss = "" then%>
   		 <table><tr><td align="left" valign="top"><table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg42%> <b> - </b><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><%=strLg43%> <b>0</b> <%=strLg44%> :<table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><br><center><b>Nenhum produto foi encontrado em nossa base de dados. Refaça sua pesquisa !</b></center><br><br><br>
		 				<table width=100% cellspacing="0" cellpadding="0"><tr><td colspan=2><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000><%=strLg45%> <B>1</B> <%=strLg46%> <B>1</B></td><td align=right><a HREF="pesquisa.asp?itens=0&pagina=1&pesq=<%=pesss%>&cat=<%=tipo%>" style=text-decoration:none;color:000000 onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg45%> 1';return true;"><font face="<%=fonte%>" style=font-size:11px><b><u>1</u></b></a></td></tr>
						<tr><td colspan=2 align=center><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><a HREF="default.asp" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b><%=strLg41%></b> ::</a></font></td></tr>
						</table></td></tr>
		</table></td></tr>
	</table>
	<!--#include file="baixo.asp"-->
<%
response.end
end if

if VersaoDb = 1 then

'Chama os requisitos e monta a SQL para pesquisa
select case tipo
Case "todos"
tipos = " "
Case else
tipos = "AND idsessao='"&xx&"'"
end select
if pag = "" then
inicial = 0
final = 5
else
inicial = pag
final = 5
end if

'Pesquisa no banco de dados
set rs = abredb.Execute("SELECT * FROM produtos WHERE nome LIKE '%"&palavra(0)&"%' "&tipos&" ORDER by nome LIMIT " & inicial & "," & final & "")
if rs.eof or rs.bof then%>
   		  	 <table><tr><td align="left" valign="top">
			 				<table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg42%> <b> <%= pesss %> </b><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><%=strLg43%> <b>0</b> <%=strLg44%> :<table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><br><center><b><%=strLg228%></b></center><br><br><br>
								   <table width=100% cellspacing="0" cellpadding="0"><tr><td colspan=2><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000><%=strLg45%> <B>1</B> <%=strLg46%> <B>1</B></td><td align=right><a HREF="pesquisa.asp?itens=0&pagina=1&pesq=<%=pesss%>&cat=<%=tipo%>" style=text-decoration:none;color:000000 onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg45%> 1';return true;"><font face="<%=fonte%>" style=font-size:11px><b><u>1</u></b></a></td></tr>
								   		  <tr><td colspan=2 align=center><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><a HREF="default.asp" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b><%=strLg41%></b> ::</a></font></td></tr>
								   </table></td></tr>
							</table></td></tr>
	          </table>
			  <!--#include file="baixo.asp"-->
<%response.end
else
    'Conta o numero de registros encontrados
    set rs2 = abredb.Execute("SELECT count(nome) AS total FROM produtos WHERE nome LIKE '%"&palavra(0)&"%' "&tipos&"")
    totalreg = rs2("total")
    rs2.close
    set rs2 = nothing
    %>
      		  		 <table><tr><td align="left" valign="top">
    				 				<table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg42%> <b><%= pesss %></b><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><%=strLg43%> <b><%=totalreg%></b> <%=strLg44%> :<table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><center>
    <%
    while not rs.EOF
    
    'Fomata o preço
    precito = formatNumber(rs("preco"),2)%>
    		  				     <table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
    							 		<table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
    										   <table align=center width=493 cellspacing="1" cellpadding="1">
                          <tr> 
                            <td valign=center width=80><a href="produtos.asp?produto=<%=rs("idprod")%>" onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img border="0" src="produtos/<%=rs("imgra")%>" width=75></a></td>
                            <td valign=center width=400><font style=font-size:11px;font-family:<%=fonte%>> 
                              <p>&nbsp;</p>
                              <p><b><%=rs("nome")%></b><br>
                                <br>
                                <b>Preço:</b>&nbsp;<%=strlgMoeda &" "& precito%><br>
                                <b>Estoque:</b> 
                                <%if rs("estoque") = "s" then response.write "Disponível" else response.write "Não disponível" end if%>
                                para entrega<br><br><a href="produtos.asp?produto=<%=rs("idprod")%>" onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></p></td>
                          </tr>
                        </table>
    								    </table>
    						     </table>
    <%
    rs.MoveNext
    
    'Monta o numero de paginas
    pagn = inicial + 5
    wend
    paga = pagn - 10
    
    'Calcula  o numero de paginas
    if totalreg Mod 5 <> 0 then
    valor = 1
    else
    valor = 0
    end if 
    pagina = fix(totalreg/5) + valor
    pagina = replace(pagina,".","")
    pagdxx = pagdxx + 1
    pagdxx = replace(pagdxx,".","")
    pagdxx2 = pagdxx - 2
    pagdxx2 = replace(pagdxx2,",","")
    paga = replace(paga,".","")
    pagn = replace(pagn,".","")
    if pagdxx = "" then pagdxx = 1 end if
    if pagina = "0" then pagina = "1" end if%>
       		  	<table width=570>
    				   <tr><td colspan=2><center><br>
  <%
    'Monta os links para navegação
    if paga < 0 then
    paga = 0
    else%>
    	   	  			 		  <a HREF="pesquisa.asp?itens=<%=paga%>&pagina=<%=pagdxx2%>&pesq=<%=pesss%>&cat=<%=tipo%>" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg209%>';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b><%=strLg209%></b> ::</a></font>&nbsp;&nbsp;
  <%
    end if
    if totalreg < final OR totalreg = 5 OR pagdxx = pagina then
    totalreg = ""
    npc = 1
    totalp = 1
    else
    variavel1 = CStr(pagdxx + 1)
    variavel2 = Cstr(pagina)
    variavel1 = replace(variavel1,".","")
    variavel2 = replace(variavel2,".","")%>
    		  					&nbsp;&nbsp;<a HREF="pesquisa.asp?itens=<%=pagn%>&pagina=<%=pagdxx%>&pesq=<%=pesss%>&cat=<%=tipo%><%if variavel1  = variavel2 then response.write "&final=sim" end if%>" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg47%>';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b><%=strLg47%></b> ::</a></font>
<%end if%>
    	  	  					<table width=100% cellspacing="0" cellpadding="0">
    								   <tr><td colspan=2><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
    								   <tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000><%=strLg45%> <B><%=pagdxx%></B> <%=strLg46%> <B><%=pagina%></B></td><td align=right><font face="<%=fonte%>" style=font-size:11px;color:000000>
    <%
    if pagina = 1 then 
    finalera = "sim"
    end if
    
    'Monta o menu de navegação interior
    if pagina <> 1 then
    For i=1 to pagina - 1
    i = replace(i,".","")
    i2 = i - 1
    i2 = replace(i2,".","")
    fator = 5
    totalfator = fator * i  - 5
    totalfator = replace(totalfator,".","")
    paginadem = pagdxx
    paginadem = replace(paginadem,".","")%>
    		  							   &nbsp;<a HREF="pesquisa.asp?itens=<%=totalfator%>&pagina=<%=i2%>&pesq=<%=pesss%>&cat=<%=tipo%>" style=text-decoration:none;color:000000 onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg45%> <%=replace(i,",","")%>';return true;"><font face="<%=fonte%>" style=font-size:11px><%if paginadem = i then response.write "<b><u>" end if%><%=replace(i,",","")%></u></b></a> &middot;</font>
    <%
    Next
    end if
    pagina2 = pagina * 5 - 5
    pagina2 = replace(pagina2,".","")
    pagina3 = pagina - 1
    pagina3 = replace(pagina3,".","")
    %>
    		  						      &nbsp;<a HREF="pesquisa.asp?itens=<%=pagina2%>&pagina=<%=pagina3%>&pesq=<%=pesss%>&cat=<%=tipo%>&final=sim" style=text-decoration:none;color:000000 onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg45%> <%=pagina%>';return true;"><font face="<%=fonte%>" style=font-size:11px><%if finalera = "sim"  then response.write "<b><u>" end if%><%=pagina%></u></b></a></td></tr>
    									  <tr><td colspan=2 align=center><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><a HREF="javascript: history.back()" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b><%=strLg41%></b> ::</a></font></td></tr>
    								  </table>
    <%
    'Fecha a tabela
    rs.close
    set rs = nothing
    %>
      	   	 					</td></tr>
    						</table></td></tr>
    				</table></td></tr>
    		</table>
  <%end if%>
  
<%else

    regs = 5 'Aqui setamos quantos registros serão listados por página
    pag = request.querystring("pagina")
    
    if pag = "" Then
       pag = 1
    end if
    
    set rs = createobject("adodb.recordset")
    set rs.activeconnection = abredb
    
    rs.cursortype = 3
    rs.pagesize = regs
    
    'Pesquisa no banco de dados
    sql = "SELECT * FROM produtos WHERE nome LIKE '%"&palavra(0)&"%' "&tipos&" ORDER by nome"
    rs.open sql
    if rs.eof or rs.bof then%>
       		  	 <table><tr><td align="left" valign="top">
    			 				<table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg42%> <b> <%= pesss %> </b><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><%=strLg43%> <b>0</b> <%=strLg44%> :<table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><br><center><b><%=strLg228%></b></center><br><br><br>
    								   <table width=100% cellspacing="0" cellpadding="0"><tr><td colspan=2><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000><%=strLg45%> <B>1</B> <%=strLg46%> <B>1</B></td><td align=right><a HREF="pesquisa.asp?itens=0&pagina=1&pesq=<%=pesss%>&cat=<%=tipo%>" style=text-decoration:none;color:000000 onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg45%> 1';return true;"><font face="<%=fonte%>" style=font-size:11px><b><u>1</u></b></a></td></tr>
    								   		  <tr><td colspan=2 align=center><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><a HREF="default.asp" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b><%=strLg41%></b> ::</a></font></td></tr>
    								   </table></td></tr>
    							</table></td></tr>
    	          </table>
    <%response.end
    else
    
    'Conta o numero de registros encontrados
    set rs2 = abredb.Execute("SELECT count(nome) AS total FROM produtos WHERE nome LIKE '%"&palavra(0)&"%' "&tipos&"")
    totalreg = rs2("total")
    rs2.close
    set rs2 = nothing%>
      		  		 <table><tr><td align="left" valign="top">
    				 				<table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> » <%=strLg42%> <b><%= pesss %></b><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><%=strLg43%> <b><%=totalreg%></b> <%=strLg44%> :<table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><center>
    <% rs.absolutepage = pag
       contador = 0
       do while not rs.eof and contador < rs.pagesize
    
    'Fomata o preço
    precito = formatNumber(rs("preco"),2)%>
    		  				     <table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
    							 		<table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
    										   <table align=center width=500 cellspacing="1" cellpadding="1">
    										   		  <tr><td valign=center width=80><a href="produtos.asp?produto=<%=rs("idprod")%>" onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img border="0" src="produtos/<%=rs("imgra")%>" width=75></a></td><td valign=center width=400><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs("nome")%></b><br><b>Preço:</b>&nbsp;<%=strLgMoeda & " " & precito%><br><b>Estoque:</b> <%if rs("estoque") = "s" then response.write "Disponível" else response.write "Não disponível" end if%> para entrega<br><br><a href="produtos.asp?produto=<%=rs("idprod")%>" onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></td></tr>
    										   </table>
    								    </table>
    						     </table>
    <%
    contador = contador + 1
    rs.MoveNext
    loop%>
    <table width=570><tr><td colspan=2><center><br>
    
    <table width=100% cellspacing="0" cellpadding="0"><tr><td colspan=2>
    
    <%'Criando links para a navegação%>
    
    <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
    <tr><td></td><td align=right><font face="<%=fonte%>" style=font-size:11px;color:000000><%=strLg45%>: 
    
    
    <%for i = 1 to rs.pagecount
    
    if i = cint(pag) then
       response.write " <b>" & i & "</b> "
    else
       response.write "<a href='" & request.servervariables("script_name") & "?pesq="&palavra(0)&"&cat="&idsessao&"&pagina=" & i & "'><font face="&fonte&" style=font-size:11px;color:000000><b>" & i & "</a> "
    end if
    
    next
    
    rs.close
    set rs = nothing
    end if%>
    
    </b></font></td></tr>
    <tr><td colspan=2 align=center><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><a HREF="javascript: history.back()" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b><%=strLg41%></b> ::</a></font></td></tr>
    
    </td></tr></table>
    </td></tr></table>
    </td></tr></table>
    </td></tr></table>
<%end if%>

		<!-- #include file="baixo.asp" -->
