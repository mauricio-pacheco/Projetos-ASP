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
                              <TD class=nav><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><em><font face="Verdana, Arial, Helvetica, sans-serif"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"></font></em><font face="Verdana, Arial, Helvetica, sans-serif">HISTÓRICO</font></TD>
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
          <TD width=3><IMG height=1 src="index_arquivos/_spacer.gif" 
          width=1></TD>
          
          
          
              <TD class=body vAlign=top width=756> 
                <table width="99%" border="0">
                  <tr> 
                    <td width="50%" height="241"><p align="center" class="style2">&nbsp;</p>
                      <p align="center" class="style2"><img src="hist.jpg" width="400" height="44"></p>
                      <p align="center" class="style2"><img src="menornn.gif" width="120" height="109"></p>
                      <table width="88%" border="0" align="center">
                        <tr>
                          <td><p align="justify" class="style2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                              &nbsp;Léo Baratto idealizador de um grande sonho 
                              que começou a se tornar realidade com a fundação 
                              da Vista Móveis aos 12 dias do mês de Setembro de 
                              2002, com a assinatura do contrato social pelos 
                              Sócios: Leo Baratto, Varlei Baratto, Wellinton Fulber 
                              e Cleber Carlos Barratto, contendo cada um 25% das 
                              cotas da empresa. Atualmente Situada na Av. 9 de 
                              Maio, 01 – Distrito Industrial – Município de Vista 
                              Gaúcha – RS. Inscrita no CNPJ: 05.338.277/0001-2 
                              e Inscrição Estadual Nº 332/0002955. Sendo que hoje, 
                              os atuais sócios são: Leonice Lara Barato, Francieli 
                              Baratto, Cleber Carlos Barratto e Ari Sganderla. 
                              A Vista Móveis Ltda, iniciou sua construção em meados 
                              de junho 2003 e concluída no mês de maio de 2004, 
                              possui uma área total de 10.000 m², deste total, 
                              1.800 m² são de área construída. Sua construção 
                              teve o apoio da Adminstração Municipal com subsídios 
                              na parte elétrica e no piso da empresa, o restante 
                              foi construído com recursos próprios. O processo 
                              Produtivo é dividido em vários setores, sendo eles: 
                              Usinagem, Lixação, Montagem, Pré-acabamento, Pintura, 
                              Embalagem, Expedição, Almoxarifado e compondo ainda 
                              a estrutura o Setor Administrativo. A Indústria 
                              iniciou suas atividades no mês de julho de 2004, 
                              produzindo Cadeiras, Mesas, Balcões e com visão 
                              no futuro, está permanentemente na busca das tendências 
                              do mercado, para lançar novos produtos. Atualmente 
                              conta com 30 funcionários diretos e mais 20 indiretos. 
                              Com a sua estrutura atual, dependendo do comportamento 
                              do mercado e da Economia do País, a empresa poderá 
                              passar dos 100 funcionários no geral. Atua no mercado 
                              nacional e pretende expandir para o mercado Externo, 
                              o que se tornou realidade na feira Movel Sul de 
                              Bento Gonçalves/RS, com a venda de mercadorias para 
                              a Venezuela e tratativas com o Uruguai. Hoje a Vista 
                              Móveis está Representada em mais de dez Estados, 
                              sendo eles: Rio Grande do Sul, Santa Catarina, Paraná, 
                              São Paulo, Rio de Janeiro, Distrito Federal, Minas 
                              Gerais, Bahia, Pernambuco, Ceará, Piauí, Pará e 
                              Paraíba. Possui uma logística de entrega terceirizada, 
                              agilizando assim entrega de suas mercadorias e satisfazendo 
                              seus clientes.<br>
                              <br>
                              &nbsp;A vista móveis agradece em primeiro lugar os seus 
                              funcionários, e representantes pelo esforço e dedicação 
                              já mostrados pela empresa, e também a todos aqueles 
                              que de uma forma ou de outra colaboraram para implantação 
                              e seu desenvolvimento.</font></p>
                            <p align="center">&nbsp;</p>
                            <p align="right"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Vista 
                              Gaúcha, 20 de Março de 2006</font></p>
                      </td>
                        </tr>
                      </table>
                      <p align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="http://www.vistamoveis.com.br" target=_blank>http://www.vistamoveis.com.br</a> 
                        - <a href="mailto:vistamoveis@vistamoveis.com.br">vistamoveis@vistamoveis.com.br</a><br>
                        Av. 9 De Maio, 01 Distrito Industrial – Vista Gaúcha – 
                        RS – Brasil – 98535 – 000<br>
                        FONE/FAX - ++55 (55) 3552 1036</font><br><br>
                      </p></td>
                  </tr>
                </table> </TD>
          </TR>
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
