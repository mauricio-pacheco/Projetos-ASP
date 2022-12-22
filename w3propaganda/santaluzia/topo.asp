<%
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################
'#
'#  CÓDIGO: VirtuaStore Versão 1.2 - Copyright 2001-2003 VirtuaWorks                                    
'#  URL: www.virtuastore.com.br / www.virtuaworks.com.br                                                           
'#  E-MAIL: webmaster@virtuaworks.com.br                                                                                          
'#  AUTORES: Otávio Dias(Desenvolvedor) / Jone Bandinelli(Desenvolvedor) / Daniel Kern(Revisão)                
'# 
'#     Este programa é um software livre; você pode redistribuí-lo e/ou 
'#     modificá-lo sob os termos do GNU General Public License como 
'#     publicado pela Free Software Foundation.
'#     É importante lembrar que qualquer alteração feita no programa 
'#     deve ser informada e enviada para os criadores, através de e-mail 
'#     ou da página de onde foi baixado o código.
'#
'#  //-------------------------------------------------------------------------------------
'#  // LEIA COM ATENÇÃO: O software VirtuaStore 1.2 deve conter as frases
'#  // "Powered by VirtuaStore 1.2" ou "Software derivado de VirtuaStore 1.2" e 
'#  // o link para o site http://www.virtuastore.com.br no créditos da 
'#  // sua loja virtual para ser utilizado gratuitamente. Se o link e/ou uma das 
'#  // frases não estiver presentes ou visiveis este software deixará de ser
'#  // considerado Open-source(gratuito) e o uso sem autorização terá 
'#  // penalidades judiciais de acordo com as leis de pirataria de software.
'#  //--------------------------------------------------------------------------------------
'#      
'#     Este programa é distribuído com a esperança de que lhe seja útil,
'#     porém SEM NENHUMA GARANTIA. Veja a GNU General Public License
'#     abaixo (GNU Licença Pública Geral) para mais detalhes.
'# 
'#     Você deve receber a cópia da Licença GNU com este programa, 
'#     caso contrário escreva para
'#     Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
'#     Boston, MA  02111-1307  USA
'# 
'#     Para enviar suas dúvidas, sugestões e/ou contratar a VirtuaWorks 
'#     Internet Design entre em contato através do e-mail 
'#     contato@virtuaworks.com.br ou pelo endereço abaixo: 
'#     Rua Venâncio Aires, 1001 - Niterói - Canoas - RS - Brasil. Cep 92110-000.
'#
'#     Para ajuda e suporte acesse: http://www.virtuastore.com.br
'#
'#     BOM PROVEITO!          
'#     Equipe VirtuaStore
'#     []'s
'#
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################

'INÍCIO DO CÓDIGO
'----------------------------------------------------------------------------------------------------------------
'Este código está otimizado e roda tanto em Windows 2000/NT/XP/ME/98 quanto em servidores UNIX-LINUX com chilli!ASP
%>
<!-- #include file="df.asp" -->
<%
'INICIO DO HTML
'-----------------------------------------------------------------------------------------------------%>


<html>
	 <head>
	  <title><%=tituloloja%></title>

	  <style type="text/css">
	  <!--
	  a:link       { color: <%=cor4%> }
	  a:visited    { color: <%=cor4%> }
	  a:hover      { color: <%=cor5%> }
      .menu:link { color:000000; text-decoration: none;}
      .menu:visited { color:000000; text-decoration: none;}
      .menu:hover { color:#6F90A4; text-decoration: none;}
	  .baixo:link { color:<%=cor4%>; text-decoration: none;}
      .baixo:visited { color:<%=cor4%>; text-decoration: none;}
      .baixo:hover { color:<%=cor4%>; text-decoration: none;}
	  -->
	  </style>
 
      <script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<body onclick=checkExpand() background="fundo.jpg" topmargin=0 leftmargin=0 marginwidth=0 marginheight=0 text=<%=cor4%>>
<SCRIPT language=JavaScript>
var MS=navigator.appVersion.indexOf("MSIE")
window.isIE4 =(MS>0) && ((parseInt(navigator.appVersion.substring(MS+5,MS+6)) >= 4) && (navigator.appVersion.indexOf("MSIE"))>0)
function checkExpand() {
    if (""!=event.srcElement.id) {
      var ch = event.srcElement.id + "Child"
      var el = document.all[ch] 
      if (null!=el) el.style.display = "none" == el.style.display ? "" : "none"
      event.returnValue=false
    }
  }
</SCRIPT>
<table width=996 cellpadding="0" cellspacing="0" align=center><tr><td>
	
			 </head>
<%
'Personaliza os links do  menu se o cliente estiver efetuando a compra
if session("usuario") = "" then
link = "fechapedido.asp?compra=login"
else
link = "fechapedido.asp?compra=ok"
end if
if session("ende1") = "" then
link = link
else
link = "formaspagamento.asp"
end if%>

	<basefont face="<%=fonte%>">
    <table width="1016" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="2%" align="left"><SCRIPT src="carrega.js"></SCRIPT><SCRIPT language=javascript>
     carregaFlash('acima.swf','282','120'); // Depois só descrever o caminho, largura, altura do SWF.
    </SCRIPT></td>
    <td width="98%"><table align="center" width="100%" border="0">
  <tr>
    <td><%
strCaminho = Server.MapPath("/santa900/santaluz.mdb")
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strCaminho & ";"

Set rs = Server.CreateObject("ADODB.Recordset") 
SQL = "SELECT * FROM cima"
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
</table></td>
  </tr>
</table>


<%
set rs = abredb.execute("SELECT nome FROM clientes where email='" & Cripto(Session("usuario"),true) & "'")
if rs.eof then
strNome = "Visitante"
else
nomeq = Cripto(rs("nome"),false)
numeroz = Instr(1,nomeq," ")
var5000 = Left(nomeq,numeroz)
if var5000 = "" then
var5000 = nomeq
else
var5000 =  Left(nomeq,numeroz)
end if
strNome = Trim(var5000)
strNome2 = Trim(Cripto(rs("nome"),false))
end if
rs.close
set rs = nothing
%>	  
	  
<%
'Personaliza o menu se o cliente estiver logado
 if session("usuario") = "" then %>
<%else%>
<%end if%>
	<style type="text/css">
* html img/**/ {
filter:expression(
  this.alphaxLoaded ? "" :
  (
    this.src.substr(this.src.length-4)==".png"
    ?
    (
    (!this.complete)
    ? "" :
      this.runtimeStyle.filter=
      ("progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+this.src+"')")+
      (this.onbeforeprint="this.runtimeStyle.filter='';this.src='"+this.src+"'").substr(0,0)+
      String(this.alphaxLoaded=true).substr(0,0)+
      (this.src="blank.gif").substr(0,0)
    )
    :
    this.runtimeStyle.filter=""
  )
  );
}
</style>	
<style type="text/css">
<!--
.judaico {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #000000;
}
-->
</style>
	
    
    
    <div id="layer1" style="position:absolute; top:120px; width:100px; height:15px; z-index:8"><table border="0" cellspacing="0" cellpadding="0" width="185"><tr bgcolor="<%=cor3%>"><td bgcolor="<%=cor3%>" width=25 height="21"><img src="luna.png" border="0"></td><td bgcolor="<%=cor3%>"><font style=font-size:11px;font-family:<%=fonte%>; color=000000>&nbsp;<b>Busca</b></td></tr></table></div>
		<div id="layer1" style="position:absolute; z-index:1">
			 <table border="0" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" width="996"><tr><td width="128" valign="top" align="center">
			 		<table border="0" cellspacing="4" cellpadding="4" width="125">
						   <tr><td width="128" bgcolor="#ffffff"></td></tr>
						   <tr><td width="128" bgcolor="#ffffff" height=8></td></tr>

<tr><td><font style=font-style:11px><form action=pesquisa.asp method=get>
							 		 <input type=text name=pesq  size=25 style=font-size:11px;font-family:<%=fonte%>;><br>
									 <select name=cat style=font-size:11px;font-family:<%=fonte%>>
									 <option value=todos><%=strLg15%> </option>
									 <option value=xxx>------------------------------</option>
<%
'Monta a select de pesquisa
Set cat = abredb.Execute("SELECT * FROM sessoes WHERE ver = 's' ORDER by nome;")
While Not cat.EOF%><option value=<%= cat("id") %>><%= cat("nome") %></option>
<%
cat.MoveNext
Wend%>
	  			    		  			</select></font>
<%
'Fecha a select de pesquisa
cat.Close
Set cat = Nothing%> 

<SCRIPT language=JavaScript>
var MS=navigator.appVersion.indexOf("MSIE")
window.isIE4 =(MS>0) && ((parseInt(navigator.appVersion.substring(MS+5,MS+6)) >= 4) && (navigator.appVersion.indexOf("MSIE"))>0)
function checkExpand() {
    if (""!=event.srcElement.id) {
      var ch = event.srcElement.id + "Child"
      var el = document.all[ch] 
      if (null!=el) el.style.display = "none" == el.style.display ? "" : "none"
      event.returnValue=false
    }
  }
</SCRIPT>

	<div align=center>
		 <input alt="Busca Avançada" type=image src=<%=dirlingua%>/imagens/pesquisar.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg21%>';return true;"></div></td></tr></form>

 <tr><td>

<div id="layer12" style="position:absolute; top:96px; left:0px; width: 185px;"> 
 <table border="0" cellspacing="0" cellpadding="0" width="185"><tr><td bgcolor="<%=cor3%>" width=20><img src="luna.png" border="0"></td><td bgcolor="<%=cor3%>"><font style=font-size:11px;font-family:<%=fonte%> color=000000><b>&nbsp;Quem somos</b></font></td></tr></table></div> 

<table border="0" cellspacing="0" cellpadding="0" width="170"> <tr><td height=16></td></tr><tr>
        <td height="24" bordercolor="#A7D2EF" bgcolor="#F8F8F8" onClick="window.location='default.asp';" onMouseOver="this.style.backgroundColor='#DBEEF2'; this.style.color='#252525'; this.style.cursor='pointer'" onMouseOut="this.style.backgroundColor='#F8F8F8'; this.style.color='#252525';"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><img src="bolinha.gif"> Página Principal</font></td>
      </tr> <tr><td height=4></td></tr><tr>
        <td height="24" bordercolor="#A7D2EF" bgcolor="#F8F8F8" onClick="window.location='historico.asp';" onMouseOver="this.style.backgroundColor='#DBEEF2'; this.style.color='#252525'; this.style.cursor='pointer'" onMouseOut="this.style.backgroundColor='#F8F8F8'; this.style.color='#252525';"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><img src="bolinha.gif"> Histórico</font></td>
      </tr> <tr><td height=4></td></tr>
      	<tr>
        <td height="24" bordercolor="#A7D2EF" bgcolor="#F8F8F8" onClick="window.location='localizacao.asp';" onMouseOver="this.style.backgroundColor='#DBEEF2'; this.style.color='#252525'; this.style.cursor='pointer'" onMouseOut="this.style.backgroundColor='#F8F8F8'; this.style.color='#252525';"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><img src="bolinha.gif"> Localização</font></td>
      </tr> <tr><td height=4></td></tr>
      	<tr>
        <td height="24" bordercolor="#A7D2EF" bgcolor="#F8F8F8" onClick="window.location='quemsomos.asp';" onMouseOver="this.style.backgroundColor='#DBEEF2'; this.style.color='#252525'; this.style.cursor='pointer'" onMouseOut="this.style.backgroundColor='#F8F8F8'; this.style.color='#252525';"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><img src="bolinha.gif"> Nossa Loja</font></td>
      </tr> <tr><td height=4></td></tr>
      </table>

 
 <div id="layer1" style="position:absolute; top:234px; left:0px; width: 300px;">
 
 
		 			                
                    
                    
                      <table border="0" cellspacing="0" cellpadding="0" width="185"><tr><td bgcolor="<%=cor3%>" width=20><img src="luna.png" border="0"></td><td bgcolor="<%=cor3%>"><font style=font-size:11px;font-family:<%=fonte%> color=000000><b>&nbsp;Menu</b></font></td></tr></table>
                      </td></tr></div>
					  		 <tr><td height=14></td></tr>
							     	<tr>
        <td height="24" bordercolor="#A7D2EF" bgcolor="#F8F8F8" onClick="window.location='promocoes.asp';" onMouseOver="this.style.backgroundColor='#DBEEF2'; this.style.color='#252525'; this.style.cursor='pointer'" onMouseOut="this.style.backgroundColor='#F8F8F8'; this.style.color='#252525';"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><img src="bolinha.gif"> Promoções</font></td>
      </tr>	<tr>
        <td height="24" bordercolor="#A7D2EF" bgcolor="#F8F8F8" onClick="window.location='lancamentos.asp';" onMouseOver="this.style.backgroundColor='#DBEEF2'; this.style.color='#252525'; this.style.cursor='pointer'" onMouseOut="this.style.backgroundColor='#F8F8F8'; this.style.color='#252525';"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><img src="bolinha.gif"> Lançamentos</font></td>
      </tr>	<tr>
        <td height="24" bordercolor="#A7D2EF" bgcolor="#F8F8F8" onClick="window.location='dicas.asp';" onMouseOver="this.style.backgroundColor='#DBEEF2'; this.style.color='#252525'; this.style.cursor='pointer'" onMouseOut="this.style.backgroundColor='#F8F8F8'; this.style.color='#252525';"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><img src="bolinha.gif"> Dicas e Curiosidades</font></td>
      </tr>	
      <tr>
        <td height="24" bordercolor="#A7D2EF" bgcolor="#F8F8F8" onClick="window.location='ajuda_email.asp';" onMouseOver="this.style.backgroundColor='#DBEEF2'; this.style.color='#252525'; this.style.cursor='pointer'" onMouseOut="this.style.backgroundColor='#F8F8F8'; this.style.color='#252525';"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px><img src="bolinha.gif"> Fale Conosco</font></td>
      </tr>	
<tr><td><div id="layer1" style="position:absolute; top:372px; left:0px;width:300px;">
		 		<table border="0" cellspacing="0" cellpadding="0" width=185>
					   <tr><td bgcolor="<%=cor3%>" width=20><img src="luna.png" border="0"></td><td bgcolor="<%=cor3%>"><font style=font-size:11px;font-family:<%=fonte%>; color=000000><b>&nbsp;Produtos</b></font></td></tr></table></div></td></tr>
					   <tr><td></td></tr>
					   <tr><td height="12" width="128" bgcolor="#ffffff"><font style=font-size:2px;>&nbsp;</font></td></tr></table>















                       
      <%
set cn = Server.CreateObject("ADODB.Connection")
cn.provider= "Microsoft.Jet.OLEDB.4.0"
cn.connectionstring=Server.MapPath("santa900/santaluz.mdb")
cn.open

pagina = "teste.asp"


SQL = "SELECT * FROM subdep"
Set rs = cn.execute(sql)

   do while not rs.eof %>
   
        
<table border="0" cellspacing="0" cellpadding="0" width="185">	
	 <tr>
        <td height="24" class="judaico" id="HG<%= rs("id") %>" bordercolor="#A7D2EF" bgcolor="#DBEEF2" onMouseOver="this.style.backgroundColor=''; this.style.color=''; this.style.cursor='pointer'";">&nbsp;&nbsp;<img src="bolinha.gif"> <%= rs("nome") %></td>
      </tr><tr><td height="4" width="128" bgcolor="#ffffff"><font style=font-size:2px;>&nbsp;</font></td></tr>	</table>	
		
<DIV id="HG<%= rs("id") %>Child" style="DISPLAY: none">		
<table border="0" cellspacing="0" cellpadding="0" width="185">
<%		
		SQL2 = "SELECT * FROM sessoes WHERE subdep='"&rs("nome")&"'"
        set rs2 = cn.execute(sql2)

        If Rs2.eof Then
        Else
            do while not rs2.eof
			%>
     

	<tr>
        <td height="24" bordercolor="#A7D2EF" bgcolor="#F8F8F8" onClick="window.location='sessoes.asp?item=<%= rs2("id") %>';" onMouseOver="this.style.backgroundColor='#DBEEF2'; this.style.color='#252525'; this.style.cursor='pointer'" onMouseOut="this.style.backgroundColor='#F8F8F8'; this.style.color='#252525';"><font face="<%=fonte%>" color="<%=cor4%>" style=font-size:11px>&nbsp;<img src="bolinha.gif"><%= rs2("nome") %></font></td>
      </tr>	<tr><td height="3" width="128" bgcolor="#ffffff"><font style=font-size:2px;>&nbsp;</font></td></tr>

	        <%
         rs2.movenext
            loop
        end if
		
		%></table></div>
		<%
        rs.movenext
    loop
%>
<table border="0" cellspacing="0" cellpadding="0">

	  	  
          
             	

						
						
						
						
						
      




  <tr><td width="128" bgcolor="#ffffff"></td></tr><tr><td width="128" bgcolor="#ffffff"><table align="center" width="98%" border="0">
  <tr>
    <td><%
strCaminho = Server.MapPath("/santa900/santaluz.mdb")
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strCaminho & ";"

Set rs = Server.CreateObject("ADODB.Recordset") 
SQL = "SELECT * FROM logos"
rs.Open SQL, objConn,3,3

Do While NOT rs.EOF 
   
	%>
    <a class=home_titulo1000 href="<%=rs("link1")%>" target=_blank><img src="<%=rs("foto1")%>" border="0" ></a><br><br>
	<% 
	  rs.MoveNext
      Loop
	  					 %>
	</td>
  </tr>
</table></td></tr></table></td><td width="1" bgcolor="<%=cor1%>" height=550><img src="espaco" width="1" height="1" alt border="0"></td><td align="left" valign="top"><table border="0" cellspacing="4" cellpadding="4"><tr><td>

	