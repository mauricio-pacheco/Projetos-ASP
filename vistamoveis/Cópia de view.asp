﻿<%
Option Explicit
Dim sql,username,rsUser,rsMessages,newcount,DSNtemp,sqlstmt,rs,x,date1,id,name1,link,pdate,pname,TotalRecs,description,p1

username = Request.Cookies("username")

'If the username cookie is set, they must have logged in, so get their details from the database
if username <> "" then
%>
<!--#include file="conn.asp"-->
<%
  
  sql = "SELECT icon FROM Users WHERE username = '" & username & "'"
  Set rsUser = Server.CreateObject("ADODB.Recordset")
  rsUser.Open sql, conn, 3, 3
  
  sql = "SELECT messageread FROM messages WHERE sendto = '" & username & "'"
  Set rsMessages = Server.CreateObject("ADODB.Recordset")
  rsMessages.Open sql, conn, 3, 3
  
  newcount = 0
  if not rsMessages.EOF then
	rsMessages.Movefirst
	do until rsMessages.EOF
		if rsMessages("messageread") = False then
			newcount = newcount + 1
		end if
		rsMessages.Movenext
	loop
	rsMessages.Movefirst
  end if
end if
%>
<HTML><HEAD>
<TITLE>Vista Móveis - Vista Gaúcha/RS</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK 
href="index_arquivos/stylesheet_0.css" type=text/css rel=stylesheet>
<script>
function openwin()
{
	NewWindow =window.open("hebrew.htm","hebrew","width=500,height=200")
}
function submitit(){
var email=document.subform.email.value;
if (email==""){
alert("Digite seu E-mail")
document.subform.email.focus()
return false
	}
if (email.indexOf('@', 0) == -1 || email.indexOf('.', 0) == -1){ alert("E-mail inválido!");
		document.subform.email.focus()
		return false
		}
}

</script>
<script language=JavaScript type=text/JavaScript>
	hoje = new Date()
	dia = hoje.getDate()
	dias = hoje.getDay()
	mes = hoje.getMonth()
	ano = hoje.getYear()
//	if (dia <10)
//		dia = "0" + dia
	if (ano <2000)
                ano = "19" + ano
	function NArray (n) {
	    this.length = n
        }
	NomeDia = new NArray(7)
	NomeDia[0] = "Domingo"
	NomeDia[1] = "Segunda-feira"
	NomeDia[2] = "Ter&ccedil;a-feira"
	NomeDia[3] = "Quarta-feira"
	NomeDia[4] = "Quinta-feira"
	NomeDia[5] = "Sexta-feira"
	NomeDia[6] = "S&aacute;bado"
	NomeMes = new NArray(12)
	NomeMes[0] = "Janeiro"
	NomeMes[1] = "Fevereiro"
	NomeMes[2] = "Mar&ccedil;o"
	NomeMes[3] = "Abril"
	NomeMes[4] = "Maio"
	NomeMes[5] = "Junho"
	NomeMes[6] = "Julho"
	NomeMes[7] = "Agosto"
	NomeMes[8] = "Setembro"
	NomeMes[9] = "Outubro"
	NomeMes[10] = "Novembro"
	NomeMes[11] = "Dezembro"
function WriteDate() {
	document.write (NomeDia[dias] + ", " + dia + " de " + NomeMes[mes] + " de " + ano)
}
</script>
<SCRIPT language=JavaScript>
		section = "About";
		urlRoot = "";
		function setKbDimensions() {
			var oBody = document.body;
			var oFrame = document.all("kbframe");
			var navBarHeight = 108;
		}
	</SCRIPT>
<SCRIPT language=javascript src="index_arquivos/granite_script.js"></SCRIPT>
<SCRIPT language=javascript src="index_arquivos/granite_dropdownC.js"></SCRIPT>
<SCRIPT language=javascript 
src="index_arquivos/granite_dropdown_initialize.js"></SCRIPT>
<META content="MSHTML 6.00.2900.2722" name=GENERATOR>
<script language="JavaScript" type="text/JavaScript">
<!--

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
</HEAD>
<BODY bgcolor="#EFEFE7" leftMargin=0 
topMargin=0 
marginwidth="0" marginheight="0" onLoad="init(); setKbDimensions();" onresize=setKbDimensions();>
<span class=style1> 
</span>
<TABLE cellSpacing=0 cellPadding=0 width=780 align=center border=0>
  <TBODY>
  <TR>
    <TD colSpan=3><IMG height=15 src="index_arquivos/page_top.gif" 
    width=780></TD></TR>
  <TR>
      <TD vAlign=top width=7 background=index_arquivos/bg_left.gif>&nbsp;</TD>
    <TD vAlign=top width=758>
      <TABLE cellSpacing=0 cellPadding=0 width=758 border=0>
          <TBODY>
            <TR> 
              <TD width="758" 
          height=27 vAlign=top>
<table width="100%" height="20" border="0" align="center">
                  <tr> 
                    <td width="35%" height="0"> 
                      <form name="login" action="signin.asp" method="post">
                        <div align="center"> 
                          <table width="100%" border="0">
                            <tr>
                              <td width="49%"><font face="arial,helvetica" size=2>
                                <table width="100%" cellpadding=3 cellspacing=0 border=0 bordercolor="#000000" align="center">
                                  <%'If they're not logged in, then display a login box
if username = "" then%>
                                  <tr> 
                                    
                                    
                                    <td width="349" align="center"> <font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif"> 
                                      Usu&aacute;rio:<b> 
                                      <input type="text" name="username" size="9">
                                      </b>Senha:<b> 
                                      <input type="password" name="password" size="9">
                                      <input name="submit2" type="submit" size="7" value="OK">
                                      </b>(<a href="signupform.asp">Cadastre-se!</a>)</font> 
                                    </td>
                                  </tr>
                                  <%'If they are, show a mini profile box plus a sign out link
else%>
                                  <tr> 
                                    <td> <div align="center"> 
                                        <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">&gt; 
                                          Seja bem vindo<b><b> </b> <font color="#FF0000"> 
                                          <font color="#0000FF"> 
                                          <%=username%>
                                          </font> </font></b><font color="#FF0000"> 
                                          <font color="#000000">&gt;&gt;&gt;</font><b> 
                                          <a href="ofertas.asp">!ÁREA EXCLUSIVA!</a> 
                                          </b></font>&lt;&lt;&lt; <a href="sair.asp">SAIR 
                                          </a>&lt;</font> </p>
                                      </div></td>
                                  </tr>
                                  <%
rsUser.close
set rsUser = nothing
rsMessages.close
set rsMessages = nothing
conn.close
set conn = nothing
end if
%>
                                </table>
                                </font></td>
                              <td width="51%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                Busca:</font> 
                                <input name="textfield32" type="text" size="26"> 
                                <input type="checkbox" name="checkbox2" value="checkbox"> 
                                <font size="1" face="Verdana, Arial, Helvetica, sans-serif">somente 
                                produtos</font> <input type="submit" name="Submit222" value="OK"> 
                              </td>
                            </tr>
                          </table>
                          
                        </div>
                      </form></td>
                  </tr>
                </table></TD>
            </TR>
            <TR> 
              <TD vAlign=top height=24><!--#include file="menucima.asp"--></TD>
            </TR>
            <TR> 
              <TD vAlign=top bgColor=#ffffff height=1><IMG height=1 
            src="index_arquivos/_spacer.gif" width=1></TD>
            </TR>
            <TR> 
              <TD vAlign=top height=103><!--#include file="acima.asp"--></TD>
            </TR>
            <TR> 
              <TD vAlign=top background=index_arquivos/bg_banner_divider.gif height=11><IMG height=1 src="index_arquivos/_spacer.gif" 
            width=1></TD>
            </TR>
          </TBODY>
        </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" 
      background=index_arquivos/bg_body.gif border=0>
        <TBODY>
        <TR>
          <TD background=index_arquivos/bg_pagetools.gif colSpan=6 height=30>
            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" 
              border=0><TBODY>
              <TR>
                      <TD width=200 background=index_arquivos/bg_sectionname.gif> 
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD width=20>&nbsp;</TD>
                              <TD class=nav><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><em><font face="Verdana, Arial, Helvetica, sans-serif"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"></font></em><font face="Verdana, Arial, Helvetica, sans-serif">NOTÍCIAS</font></TD>
                            </TR></TBODY></TABLE></TD>
                      <TD align=right><div align="left"><FONT size="1" face="Verdana, Arial, Helvetica, sans-serif" class=content></FONT><FONT size=1><FONT 
            size=1><FONT face="Arial, Helvetica, sans-serif" color=#ff3300> </FONT></FONT></FONT> 
                          <FONT size="1" face="Verdana, Arial, Helvetica, sans-serif" class=content><span class=style1> 
                          Hoje: 
                          <script language="">
 WriteDate();
</script>
                          </span></FONT> <br>
                        </div></TD>
                <TD width=20><IMG height=30 
                  src="index_arquivos/pagetools_corner_right.gif" 
              width=20></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD width=16><IMG height=1 src="index_arquivos/_spacer.gif" 
          width=1></TD>
          
          
          
              <TD class=body vAlign=top width=734> 
                <table width="100%" border="0">
                  <tr> 
                    <td width="32%" height="241"><p align="center"><font face="Verdana" size="2"><b> 
                        </b></font></p>
                      <p align="center"> 
                        <%
id = request.querystring("id")
DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
          DSNtemp=dsntemp & "DBQ=" & server.mappath("news/journal.mdb")
          sqlstmt = "SELECT * FROM journal where id =" & id & " ORDER BY id DESC"
          Set rs = Server.CreateObject("ADODB.Recordset")
          rs.Open sqlstmt, DSNtemp, 3, 3
TotalRecs = rs.recordcount

		date1 = rs("pdate")
		id = rs("ID")
		name1 = rs("pname")
		p1= rs("pentry")
		
	  	description = p1
   %>
                      </p>
                      <p align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Notícia 
                        postada em <b> </b></font><font color="#000000" size="1" face="Arial, Helvetica, sans-serif"> 
                        <% =date1 %>
                        </font></p>
                      <p align="center"><font face="Verdana" size="2"><b>Assunto: 
                        <% =name1 %>
                        </b></font></p>
                      <p align="center"><font face="Verdana" size="2"> 
                        <% =description%>
                        </font></p>
                      <p align="center"><font face="Verdana" size="2"><a href="ofertas.asp">Voltar</a></font> 
                      </p>
                      </td>
                  </tr>
                </table> </TD>
          <TD width=9><IMG height=1 src="index_arquivos/_spacer.gif" 
          width=1></TD></TR>
       </TBODY></TABLE></TD>
      <TD vAlign=top width=15 background=index_arquivos/bg_right.gif>&nbsp;</TD>
    </TR>
  <TR vAlign=top>
    <TD colSpan=3><IMG height=26 src="index_arquivos/page_bottom.gif" 
      width=780></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=780 align=center border=0>
  <TBODY>
  <TR class=footer>
      <TD class=footer vAlign=top align=middle> Copyright © 2005 Vista Móveis 
        Ltda. Todos os direitos reservados.<BR>
        Desenvolvimento - <a href="http://www.casadaweb.net" target=_blank>Casa 
        da Web</a>.<BR> 
        <DIV id=HideThisOne style="VISIBILITY: visible"></DIV>
      <P></P></TD></TR>
  <TR class=footer>
    <TD height=10><IMG src="index_arquivos/_spacer.gif"></TD></TR></TBODY></TABLE>
<SCRIPT language=javascript 
src="index_arquivos/granite_dropdown_content.js"></SCRIPT>

<DIV id=font 
style="Z-INDEX: 1; LEFT: 1px; VISIBILITY: hidden; WIDTH: 80px; POSITION: absolute; TOP: 1px; HEIGHT: 20px"><IMG 
height=20 src="index_arquivos/font.gif" width=80></DIV>
<DIV id=print 
style="Z-INDEX: 1; LEFT: 1px; VISIBILITY: hidden; WIDTH: 80px; POSITION: absolute; TOP: 1px; HEIGHT: 20px"><IMG 
height=20 src="index_arquivos/print.gif" width=80></DIV>
<DIV id=email 
style="Z-INDEX: 1; LEFT: 1px; VISIBILITY: hidden; WIDTH: 80px; POSITION: absolute; TOP: 1px; HEIGHT: 20px"><IMG 
height=20 src="index_arquivos/email.gif" width=80></DIV></BODY></HTML>
