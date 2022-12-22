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
.style3 {color: #000000}
.style13 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px; }
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
                              <TD class=nav><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><em><font face="Verdana, Arial, Helvetica, sans-serif"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"></font></em><font face="Verdana, Arial, Helvetica, sans-serif">RIO 
                                GRANDE DO SUL</font></TD>
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
                        <p align="left">&nbsp;</p>
                        <p align="center"><img src="repre.jpg" width="400" height="43"></p>
                        <p align="left"><font color="#0000FF" size="1"><strong>CADASTRO 
                          REPRESENTANTE: </strong></font><font size="1"><br>
                          <br>
                          <br>
                          <font color="#0000FF"><strong>EMPRESA / NOME:</strong></font> PABLO DANIEL GEMELLI<br>
                          <br>
                          <font color="#0000FF"><strong>ENDEREÇO:</strong></font> RUA MONSENHOR VITOR BATISTELA, 657<br>
                          <br>
                          <font color="#0000FF"><strong>BAIRRO:</strong></font> CENTRO<br>
                          <br>
                          <font color="#0000FF"><strong>CIDADE / UF:</strong></font> FREDERICO WESTPHALEN   -   RS<br>
                          <br>
                          <font color="#0000FF"><strong>CEP:</strong></font> 98.400-000<br>
                          <br>
                          <font color="#0000FF"><strong>CNPJ / CPF:</strong></font> 978.285.080-00<br>
                          <br>
                          <font color="#0000FF"><strong>INSC.EST./ RG:</strong></font> 17R2873545-SC<br>
                          <br>
                          <font color="#0000FF"><strong>CONTATO:</strong></font> PABLO DANIEL GEMELLI<br>
                          <br>
                          <font color="#0000FF"><strong>FONE / FAX:</strong></font> 55-3744-1783<br>
                          <br>
                          <font color="#0000FF"><strong>CELULAR:</strong></font> 55-9995-7370<br>
                          <br>
                          <font color="#0000FF"><strong>E-MAIL:</strong></font> <a href="mailto:pablo_gemelli@yahoo.com.br">pablo_gemelli@yahoo.com.br</a><br>
                          <br>
                          <font color="#0000FF"><strong>REGIÃO QUE ATUA:</strong></font> Região Noroeste e Missões do Rio Grande do Sul.<br>
<br>
<font color="#0000FF"><strong>OUTROS DADOS: </strong></font><font size="1"><font color="#FF0000">(Dados 
                        não disponível)</font></font></font></p>
                        <hr>
                        <p align="left"><font color="#0000FF" size="1"><strong>CADASTRO 
                          REPRESENTANTE: </strong></font><font size="1"><br>
                          <br>
                          <br>
                          <font color="#0000FF"><strong>EMPRESA / NOME:</strong></font> 
                          MATER - COMÉRCIO E REPRESENTAÇÕES LTDA.<br>
                          <br>
                          <font color="#0000FF"><strong>ENDEREÇO:</strong></font> 
                          RUA MAJOR OURIQUES, 2271 APT. 301<br>
                          <br>
                          <font color="#0000FF"><strong>BAIRRO:</strong></font> 
                          CENTRO<br>
                          <br>
                          <font color="#0000FF"><strong>CIDADE / UF:</strong></font> 
                          CACHOEIRA DO SUL - RS<br>
                          <br>
                          <font color="#0000FF"><strong>CEP:</strong></font> 96.506-562<br>
                          <br>
                          <font color="#0000FF"><strong>CNPJ / CPF:</strong></font> 
                          94.073.830/0001-92<br>
                          <br>
                          <font color="#0000FF"><strong>INSC.EST./ RG:</strong></font> 
                          15.021-5<br>
                          <br>
                          <font color="#0000FF"><strong>CONTATO:</strong></font> 
                          VALTER DE SOUZA CUNHA.<br>
                          <br>
                          <font color="#0000FF"><strong>FONE / FAX:</strong></font> 
                          51-3723-4051<br>
                          <br>
                          <font color="#0000FF"><strong>CELULAR:</strong></font> 
                          51-3382-7245<br>
                          <br>
                          <font color="#0000FF"><strong>E-MAIL:</strong></font> 
                          NÃO TEM<br>
                          <br>
                          <font color="#0000FF"><strong>REGIÃO QUE ATUA:</strong></font> 
                          Planalto, Planalto Médio, Região Nordeste, Vale do Taquari 
                          e<br>
                          Litoral. Cidades Polo: Passo Fundo, Erechim, Caxias 
                          do Sul, <br>
                          Bento Gonçalves, Novo Hamburgo e Lajeado.<br>
                          <br>
                          <font color="#0000FF"><strong>OUTROS DADOS: </strong></font><font size="1"><font color="#FF0000">(Dados 
                              não disponível)</font></font></font></p>
                        <hr>
                        <p align="left"><font size="1"><strong><font color="#0000FF">CADASTRO 
                          REPRESENTANTE: </font></strong><br>
                          <br>
                          <br>
                          <font color="#0000FF"><strong>EMPRESA / NOME:</strong></font> 
                          REPRESENTAÇÕES COMERCIAIS TALEMO LTDA.<br>
                          <br>
                          <font color="#0000FF"><strong>ENDEREÇO:</strong></font> 
                          RUA 1º DE MARÇO, 398<br>
                          <br>
                          <font color="#0000FF"><strong>BAIRRO:</strong></font> 
                          CENTRO<br>
                          <br>
                          <font color="#0000FF"><strong>CIDADE / UF:</strong></font> 
                          SÃO LEOPOLDO - RS<br>
                          <br>
                          <font color="#0000FF"><strong>CEP:</strong></font> 93.010-210<br>
                          <br>
                          <font color="#0000FF"><strong>CNPJ / CPF:</strong></font> 
                          03.072.516/0001-30<br>
                          <br>
                          <font color="#0000FF"><strong>INSC.EST./ RG:</strong></font> 
                          ISENTO<br>
                          <br>
                          <font color="#0000FF"><strong>CONTATO: </strong></font>MOISES 
                          BIANCHI<br>
                          <font color="#FF0000"><br>
                          <strong><font color="#0000FF">FONE / FAX:</font></strong></font> 
                          51-3037-7777 / 51-3037-7778<br>
                          <br>
                          <font color="#0000FF"><strong>CELULAR: </strong></font>51-9982-3063<br>
                          <br>
                          <font color="#0000FF"><strong>CONTATO:</strong></font> 
                          ALESSANDRO BIANCHI<br>
                          <br>
                          <font color="#0000FF"><strong>CELULAR:</strong></font> 
                          51--9903-1968<br>
                          <br>
                          <font color="#0000FF"><strong>E-MAIL:</strong></font> 
                          <a href="mailto:moisesbianchi@brturbo.com.br">moisesbianchi@brturbo.com.br</a><br>
                          <br>
                          <font color="#0000FF"><strong>REGIÃO QUE ATUA:</strong></font> 
                          Porto Alegre e Grande Porto Alegre.</font></p>
                        <hr>
                        <p align="left"><font color="#0000FF" size="1"><strong>CADASTRO 
                          REPRESENTANTE: </strong></font><font size="1"><br>
                          <br>
                          <br>
                          <font color="#0000FF"><strong>EMPRESA / NOME: </strong></font>COMÉRCIO E REPRESENTAÇÕES CLEINOR LTDA.<br>
                          <font color="#0000FF"><strong><br>
                          ENDEREÇO:</strong></font> RUA GENERAL GÓES MONTEIRO - 55 SALA 3 - EDIF.DONA STELLA<br>
                          <font color="#0000FF"><strong><br>
                          BAIRRO:</strong></font> SÃO FRANCISCO<br>
                          <br>
                          <font color="#0000FF"><strong>CIDADE / UF:</strong></font> 
                          BENTO GONÇALVES  - R<br>
                          <br>
                          <font color="#0000FF"><strong>CEP:</strong></font> 95.700-00<br>
                          <br>
                          <font color="#0000FF"><strong>CNPJ / CPF: </strong></font>89.317.788/0001-78<br>
                          <br>
                          <font color="#0000FF"><strong>INSC.EST./ RG:</strong></font> 
                          CORE:    48.177<br>
                          <br>
                          <font color="#0000FF"><strong>CONTATO:</strong></font> 
                          CLEINOR JOSÉ LORENZINI<br>
                          <br>
                          <font color="#0000FF"><strong>FONE / FAX:</strong></font> 
                          54-3452-1064<br>
                          <br>
                          <font color="#0000FF"><strong>CELULAR: </strong></font>54 - 8124 - 6949<br>
                          <br>
                          <font color="#0000FF"><strong>E-MAIL:</strong></font> 
                          <a href="mailto:cleinor@italnet.com.br">cleinor@italnet.com.br</a><br>
                          <br>
                        <font color="#0000FF"><strong>REGIÃO QUE ATUA:</strong></font><span class="style3"> Relação de cidades que representamos:</span></font></p>
                        <table cellspacing="0" cellpadding="0">
                          <col width="522" />
                          <tr height="21">
                            <td height="21" width="522"><span class="style13"><strong>Regi&atilde;o    Sul&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Centro do    Estado</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Fronteira&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21">&nbsp;</td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Barra    do Ribeiro&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cachoeira    do Sul&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S&atilde;o    Gabriel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Mariana    Pimentel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Candel&aacute;ria&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ros&aacute;rio do    Sul&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Sert&atilde;o    Santana&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Sobradinho&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Alegrete&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Sentinela    do Sul&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Agudo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Uruguaiana&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Cerro    Grande do Sul&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Faxinal do    Soturno&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Barra do    Quara&iacute;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Tapes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dona    Francisca&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Quarai&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Camaqu&atilde;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Restinga    Seca&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Satana    do Livramento&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Cristal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Santa    Maria&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Dom Pedrito&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">S&atilde;o    Louren&ccedil;o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S&atilde;o    Pedro&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Bag&eacute;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Pelotas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mata&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Manoel Viana&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Rio    Grande&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S&atilde;o    Vicente&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Cacequi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">S&atilde;o    Jos&eacute; do Norte&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Jaguari&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S&atilde;o    Borja&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Sta    Vit&oacute;ria do Palmar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Santiago&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Acegu&aacute;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Chu&iacute;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nova    Espan&ccedil;a&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Itaqui</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Pedro    Os&oacute;rio&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Santa    Cruz&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Arroio Grande&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rio Pardo</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Jaguar&atilde;o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Morro    Redondo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Cangu&ccedil;u&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Piratini&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Pinheiro    Machado&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                          <tr height="21">
                            <td height="21"><span class="style13">Hulha    Negra&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                          </tr>
                        </table>
                        <p align="left"><font size="1"><font color="#0000FF"><strong>OUTROS DADOS: </strong></font></font><font size="1"><font color="#FF0000">(Dados 
                              não disponível)</font></font><br>
                        </p>
                        <hr>
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
