﻿<%
Option Explicit
Dim sql,username,rsUser,rsMessages,newcount

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
<style type="text/css">
<!--
.style1 {font-size: 9px}
.style2 {font-size: 10px; }
-->
</style>
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
              <TD width="758" height=24 vAlign=top><!--#include file="menucima.asp"--></TD>
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
                              <TD class=nav><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><em><font face="Verdana, Arial, Helvetica, sans-serif"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"></font></em><font face="Verdana, Arial, Helvetica, sans-serif">FICHA 
                                CADASTRAL </font></TD>
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
          <TD width=9><IMG height=1 src="index_arquivos/_spacer.gif" 
          width=1></TD>
          
          
          
              <TD class=body vAlign=top width=741> 
                <table width="100%" border="0">
                  <tr> 
                    <td width="59%" height="241"><p align="center" class="style2">&nbsp;</p>
                      <p align="center" class="style2"><img src="cadas.jpg" width="400" height="43"></p>
                      <table width="100%" border="0" align="center">
                        <tr>
                          <td><font color="#FF0000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#0000FF">RAZÃO 
                            SOCIAL:</font></strong></font><font color="#0000FF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                            </font></strong></font><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                            </font></strong><font size="2"> 
                            <p><font size="1" face="Verdana, Arial, Helvetica, sans-serif">VISTA 
                              MÓVEIS LTDA<br>
                              CGC – 05.338.277/0001 – 42<br>
                              ICMS – 332/0002955<br>
                              Registro Junta Comercial: 2550507 de 11/02/2005.</font></p>
                            <p><font color="#FF0000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#0000FF">ENDEREÇO 
                              DE ENTREGA E COBRANÇA:</font></strong></font><font color="#0000FF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                              </font></p>
                            </font> 
                            <p><font size="1" face="Verdana, Arial, Helvetica, sans-serif">AV. 
                              9 DE MAIO, 01 – DISTR. INDUSTRIAL<br>
                              CEP – 98535 – 000 VISTA GAÚCHA – RS<br>
                              FONE/FAX – 55 3552 1036<br>
                              RESPONSÁVEL – CLEBER CARLOS BARRATTO</font></p></td>
                          <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#0000FF">REFERENCIAS 
                            COMERCIAIS: </font></strong> </font><font size="1"> 
                            <p><font face="Verdana, Arial, Helvetica, sans-serif">HERVAL 
                              QUÍMICA LTDA. 51 564 8352 <br>
                              FERRAMENTAS GERAIS S.A. 51 3358 1077 / 51 3358 1152<br>
                              BIGFER IND.E COM.DE FERRAGENS LTDA. 54 3261 2940 
                              / 51 268 2098<br>
                              COMPENSADOS PINHAL LTDA. 49 3366 1146<br>
                              RENER SAYERLACK S/A 49 3324 0304<br>
                              FARBEN S.A INDÚSTIRA QUÍMICA 48 3432 4300</font></p>
                            <p><font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#0000FF">REFERENCIAS 
                              BANCARIAS:</font></strong></font></p>
                            </font> 
                            <p><font size="1" face="Verdana, Arial, Helvetica, sans-serif">SICREDI 
                              VISTA GAÚCHA AG. 0313 </font><br>
                              <font size="1" face="Verdana, Arial, Helvetica, sans-serif">CONTA 
                              83100 – 0 / 55 3552 1100</font></p></td>
                        </tr>
                        <tr> 
                          <td><p>&nbsp;</p>
                            <p><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#0000FF"><em>CONTATOS:</em></font></strong><br>
                              <br>
                              CLEBER CARLOS BARRATTO<br>
                              SOCIO GERENTE<br>
                              <br>
                              </font><font size="1"> </font> </p></td>
                          <td><br><table width="10%" border="0" align="center">
                              <tr> 
                                <td><div align="center"><A 
            href="imprimir.asp" target=_blank><img src="printfile_on.gif"  border="0" width="22" height="22"></a></div></td>
                                <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><A 
            href="imprimir.asp" target=_blank>IMPRIMIR</a></font></div></td>
                              </tr>
                            </table>
                            <p><br>
                            </p></td>
                        </tr>
                      </table>
                      <p align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="http://www.vistamoveis.com.br" target=_blank>http://www.vistamoveis.com.br</a> 
                        - <a href="mailto:vistamoveis@vistamoveis.com.br">vistamoveis@vistamoveis.com.br</a><br>
                        Av. 9 De Maio, 01 Distrito Industrial – Vista Gaúcha – 
                        RS – Brasil – 98535 – 000<br>
                        FONE/FAX - ++55 (55) 3552 1036</font><br>
                        <br>
                      </p></td>
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
      <TD class=footer vAlign=top align=middle> Copyright © 2006 Vista Móveis 
        Ltda . Todos os direitos reservados.<BR>
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
