<%
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
                              <TD class=nav><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><em><font face="Verdana, Arial, Helvetica, sans-serif"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"></font></em><font face="Verdana, Arial, Helvetica, sans-serif">MINAS 
                                GERAIS </font></TD>
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
                    <td width="32%" height="241"><div align="center">
                        <p>&nbsp;</p>
                        <p><img src="repre.jpg" width="400" height="43"></p>
                        <p align="left"><font color="#0000FF" size="1"><strong>CADASTRO 
                          REPRESENTANTE: </strong></font><font size="1"><br>
                          <br>
                          <br>
                          <font color="#0000FF"><strong>EMPRESA / NOME: </strong></font>CEPLA 
                          REPRESENTAÇÕES<br>
                          <br>
                          <font color="#0000FF"><strong>ENDEREÇO:</strong></font> 
                          RUA PRESIDENTE SARMIENTO Nº 111 - APTO 83<br>
                          <br>
                          <font color="#0000FF"><strong>BAIRRO:</strong></font> 
                          VILA TUPI<br>
                          <br>
                          <font color="#0000FF"><strong>CIDADE / UF:</strong></font> 
                          PRAIA GRANDE - SP<br>
                          <br>
                          <font color="#0000FF"><strong>CEP:</strong></font> 11.703-630<br>
                          <br>
                          <font color="#0000FF"><strong>CNPJ / CPF:</strong></font> 
                          06.968.767/0001-95<br>
                          <br>
                          <font color="#0000FF"><strong>INSC.EST./ RG:</strong></font> 
                          ISENTO<br>
                          <br>
                          <font color="#0000FF"><strong>CONTATO:</strong></font> 
                          CÉLIO JOSÉ PLANTERO JUNIOR<br>
                          <br>
                          <font color="#0000FF"><strong>FONE / FAX:</strong></font> 
                          13-3494-4567<br>
                          <br>
                          <font color="#0000FF"><strong>CELULAR:</strong></font> 
                          19-9137-0710<br>
                          <br>
                          <font color="#0000FF"><strong>E-MAIL:</strong></font> 
                          <a href="mailto:celioplatero@ig.com.br">celioplatero@ig.com.br</a><br>
                          <br>
                          <font color="#0000FF"><strong>REGIÃO QUE ATUA: </strong></font>Região 
                          Sul de Minas Gerais e Vale do Paraíba.<br>
                          <br>
                          <br>
                          <br>
                          <font color="#0000FF"><strong>OUTROS DADOS: </strong></font></font></p>
                        <hr>
                        <p align="left"><font color="#0000FF" size="1"><strong>CADASTRO 
                          REPRESENTANTE: </strong></font><font size="1"><br>
                          <br>
                          <font color="#0000FF"><strong><br>
EMPRESA / NOME:</strong></font> VPO REPRESENTAÇÕES.<br>
                            <br>
                            <font color="#0000FF"><strong>ENDEREÇO:</strong></font> RUA VILA VELHA, 295<br>
                            <br>
                            <font color="#0000FF"><strong>BAIRRO:</strong></font> SÃO SALVADOR<br>
                            <br>
                            <font color="#0000FF"><strong>CIDADE / UF:</strong></font> BELO HORIZONTE   MG.<br>
                            <br>
                            <font color="#0000FF"><strong>CEP:</strong></font> 30.881-190<br>
                            <br>
                            <font color="#0000FF"><strong>CNPJ / CPF:</strong></font> Não Disponível<br>
                            <br>
                            <font color="#0000FF"><strong>INSC.EST./ RG: </strong></font>ISENTO<br>
                            <br>
                            <font color="#0000FF"><strong>CONTATO:</strong></font> VANESSA PEREIRA OSÓRIO<br>
                            <font color="#FF0000"><br>
                            <strong><font color="#0000FF">FONE / FAX:</font></strong></font> 31-3473-0580<br>
                            <br>
                            <font color="#0000FF"><strong>CELULAR:</strong></font> 31-9774-2777<br>
                            <br>
                            <font color="#0000FF"><strong>E-MAIL:</strong></font> <a href="mailto:vporepresentacoes@gmail.com">vporepresentacoes@gmail.com</a><br>
                            <br>
                            <font color="#0000FF"><strong>REGIÃO QUE ATUA:</strong></font> ZONA DA MATA    E   GRANDE BELO HORIZONTE.<br>
                            <br>
                            <br>
                            <br>
                            <font color="#0000FF"><strong>OUTROS DADOS: </strong></font><font size="1"><font color="#FF0000">(Dados 
                        não disponível)</font></font></font></p>
                        <hr>
                        <p align="left"><font color="#0000FF" size="1"><strong>CADASTRO 
                          REPRESENTANTE: </strong></font><font size="1"><br>
                            <br>
                            <br>
                            <font color="#0000FF"><strong>EMPRESA / NOME: </strong></font>BARÇANTE REPRESENTAÇÕES LTDA.<br>
                            <br>
                            <font color="#0000FF"><strong>ENDEREÇO:</strong></font> AV. PADRE VIEIRA, 71  APT. 301<br>
                            <br>
                            <font color="#0000FF"><strong>BAIRRO:</strong></font> MINAS BRASIL<br>
                            <br>
                            <font color="#0000FF"><strong>CIDADE / UF:</strong></font> BELO HORIZONTE  -  MG<br>
                            <br>
                            <font color="#0000FF"><strong>CEP:</strong></font> 30.730-240<br>
                            <br>
                            <font color="#0000FF"><strong>CNPJ / CPF:</strong></font> 06.337.650/0001-03<br>
                            <br>
                            <font color="#0000FF"><strong>INSC.EST./ RG:</strong></font> ISENTO<br>
                            <br>
                            <font color="#0000FF"><strong>CONTATO:</strong></font> MÁRCIA BARÇANTE<br>
                            <br>
                            <font color="#0000FF"><strong>FONE / FAX:</strong></font> 31-3413-2203<br>
                            <br>
                            <font color="#0000FF"><strong>CELULAR:</strong></font> 31-9618-0105<br>
                            <br>
                            <font color="#0000FF"><strong>E-MAIL:</strong></font> <a href="mailto:marcia.barcante@yahoo.com.br">marcia.barcante@yahoo.com.br</a><br>
                            <br>
                            <font color="#0000FF"><strong>REGIÃO QUE ATUA: </strong></font>BELO HORIZONTE   E   GRANDE BELO HORIZONTE.<br>
                            <br>
                            <br>
                            <br>
                            <font color="#0000FF"><strong>OUTROS DADOS: </strong></font></font><font size="1"><font color="#0000FF"><strong> </strong></font><font size="1"><font color="#FF0000">(Dados 
                        não disponível)</font></font></font></p>
                        <hr>
                        <p align="left"><font color="#0000FF" size="1"><strong>CADASTRO 
                          REPRESENTANTE: </strong></font><font size="1"><br>
                            <br>
                            <br>
                            <font color="#0000FF"><strong>EMPRESA / NOME: </strong></font> A BENI VENDAS LTDA.<br>
                            <br>
                            <font color="#0000FF"><strong>ENDEREÇO:</strong></font> AV. CARLOS CHAGAS,958  APT.301<br>
                            <br>
                            <font color="#0000FF"><strong>BAIRRO:</strong></font> CIDADE NOBRE<br>
                            <br>
                            <font color="#0000FF"><strong>CIDADE / UF:</strong></font> IPATINGA  -  MG<br>
                            <br>
                            <font color="#0000FF"><strong>CEP:</strong></font> 35.162-359<br>
                            <br>
                            <font color="#0000FF"><strong>CNPJ / CPF:</strong></font> 05.645.751/0001-89<br>
                            <br>
                            <font color="#0000FF"><strong>INSC.EST./ RG:</strong></font> ISENTO<br>
                            <br>
                            <font color="#0000FF"><strong>CONTATO:</strong></font> BENI<br>
                            <br>
                            <font color="#0000FF"><strong>FONE / FAX:</strong></font> 31-3821-0114 <br>
                            <br>
                            <font color="#0000FF"><strong>CELULAR:</strong></font> 31-9728-4029<br>
                            <br>
                            <font color="#0000FF"><strong>E-MAIL:</strong></font> <a href="mailto:a.benivendas@terra.com.br">a.benivendas@terra.com.br</a><br>
                            <br>
                            <font color="#0000FF"><strong>REGIÃO QUE ATUA: </strong></font>VALE DO AÇO:  ( IPATINGA, GOVERNADOR VALADARES,TEOFILO OTONI, ETC ).<br>
                            <br>
                            <br>
                            <br>
                            <font color="#0000FF"><strong>OUTROS DADOS: </strong></font></font><font size="1"><font color="#0000FF"><strong> </strong></font><font size="1"><font color="#FF0000">(Dados 
                        não disponível)</font></font></font></p>
                        <hr>
                        <p align="left"><font size="1"><br>
                        </font> </p>
                    </div>
                      <p align="center" class="style2">&nbsp;</p></td>
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
