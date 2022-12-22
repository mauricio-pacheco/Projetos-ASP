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
                              <TD class=nav><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><em><font face="Verdana, Arial, Helvetica, sans-serif"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"></font></em><font face="Verdana, Arial, Helvetica, sans-serif">SÃO 
                                PAULO </font></TD>
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
                          <font color="#0000FF"><strong><br>
EMPRESA / NOME:</strong></font> CEPLA REPRESENTAÇÕES<br>
                          <br>
                          <font color="#0000FF"><strong>ENDEREÇO:</strong></font> RUA JOSÉ DOS SANTOS 325 - A<br>
                          <br>
                          <font color="#0000FF"><strong>BAIRRO:</strong></font> JD AURÉLIA<br>
                          <br>
                          <font color="#0000FF"><strong>CIDADE / UF:</strong></font> CAMPINAS - SP<br>
                          <br>
                          <font color="#0000FF"><strong>CEP:</strong></font> 13.033 - 090<br>
                          <br>
                          <font color="#0000FF"><strong>CNPJ / CPF:</strong></font> 06.968.767/0001-95<br>
                          <br>
                          <font color="#0000FF"><strong>INSC.EST./ RG: </strong></font>ISENTO<br>
                          <br>
                          <font color="#0000FF"><strong>CONTATO:</strong></font> CELIO JOSÉ PLATERO JUNIOR<br>
                          <font color="#FF0000"><br>
                          <strong><font color="#0000FF">FONE / FAX:</font></strong></font> 19 3243 - 2759<br>
                          <br>
                          <font color="#0000FF"><strong>CELULAR:</strong></font> 19 9764 - 1568<br>
                          <br>
                          <font color="#0000FF"><strong>E-MAIL:</strong></font> <a href="mailto:celioplatero@ig.com.br">celioplatero@ig.com.br</a><br>
                          <br>
                          <font color="#0000FF"><strong>REGIÃO QUE ATUA:</strong></font> SUL DE MINAS - ESTADO MINAS GERAIS E VALE DO PARAIBA - ESTADO DE SÃO PAULO<br>
                          <br>
                          <br>
                          <font color="#0000FF"><strong>OUTROS DADOS: </strong></font><font size="1"><font color="#FF0000">(Dados 
                        não disponível</font></font></font></p>
                        <hr>
                        <p align="left">&nbsp;</p>
                        <p align="left"><font color="#0000FF" size="1"><strong>CADASTRO 
                          REPRESENTANTE: </strong></font><font size="1"><br>
                          <br>
                          <font color="#0000FF"><strong><br>
                          EMPRESA / NOME:</strong></font> KAAL REPRESENTAÇÕES 
                            LTDA.<br>
                          <br>
                          <font color="#0000FF"><strong>ENDEREÇO:</strong></font> 
                          RUA PARINTINS, 585 SALA 45<br>
                          <br>
                          <font color="#0000FF"><strong>BAIRRO:</strong></font> 
                          VILA IZABEL<br>
                          <br>
                          <font color="#0000FF"><strong>CIDADE / UF:</strong></font> 
                          CURITIBA - PR.<br>
                          <br>
                          <font color="#0000FF"><strong>CEP:</strong></font> 80.320-270<br>
                          <br>
                          <font color="#0000FF"><strong>CNPJ / CPF:</strong></font> 
                          678.861.240-49<br>
                          <br>
                          <font color="#0000FF"><strong>INSC.EST./ RG: </strong></font>1036490215<br>
                          <br>
                          <font color="#0000FF"><strong>CONTATO:</strong></font> 
                          ALESSANDRO GUTERRES BECKER ( SANDRO )<br>
                          <font color="#FF0000"><br>
                          <strong><font color="#0000FF">FONE / FAX:</font></strong></font> 
                          41-3242-7002<br>
                          <br>
                          <font color="#0000FF"><strong>CELULAR:</strong></font> 
                          41-9949-7002<br>
                          <br>
                          <font color="#0000FF"><strong>E-MAIL:</strong></font> 
                          <a href="mailto:kaalrepresentacoes@yahoo.com.br">kaalrepresentacoes@yahoo.com.br</a><br>
                          <br>
                          <font color="#0000FF"><strong>REGIÃO QUE ATUA:</strong></font> 
                          Vale do Ribeira e Baixada Santista. ( São Paulo )<br>
                          <br>
                          <br>
                          <br>
                          <font color="#0000FF"><strong>OUTROS DADOS: </strong></font><font size="1"><font color="#FF0000">(Dados 
                              não disponível</font></font></font></p>
                        <hr>
                        <p align="left"><font color="#0000FF" size="1"><strong>CADASTRO 
                          REPRESENTANTE: <br>
                          </strong></font><font size="1"><br>
                          <br>
                          <font color="#0000FF"><strong>EMPRESA / NOME:</strong></font> 
                          MARKHA REPRESENTAÇÕES<br>
                          <br>
                          <font color="#0000FF"><strong>ENDEREÇO:</strong></font> 
                          ROD. SP 360 KM 128 - Cxp.Nº 312<br>
                          <br>
                          <font color="#0000FF"><strong>BAIRRO:</strong></font> 
                          RODOVIA SP 360<br>
                          <br>
                          <font color="#0000FF"><strong>CIDADE / UF:</strong></font> 
                          AMPARO - SP<br>
                          <br>
                          <font color="#0000FF"><strong>CEP:</strong></font> 13.900-000<br>
                          <br>
                          <font color="#0000FF"><strong>CNPJ / CPF:</strong></font> 
                          00.845.499/0001-38<br>
                          <br>
                          <font color="#0000FF"><strong>INSC.EST./ RG:</strong></font> 
                          936.743.928-87<br>
                          <br>
                          <font color="#0000FF"><strong>CONTATO:</strong></font> 
                          OMAR KHALED<br>
                          <br>
                          <font color="#0000FF"><strong>FONE / FAX:</strong></font> 
                          19-3817-4292<br>
                          <br>
                          <font color="#0000FF"><strong>CELULAR:</strong></font> 
                          19-9603-6044<br>
                          <br>
                          <font color="#0000FF"><strong>E-MAIL:</strong></font> 
                          <a href="mailto:markharepres@uol.com.br">markharepres@uol.com.br</a><br>
                          <br>
                          <font color="#0000FF"><strong>REGIÃO QUE ATUA: </strong></font><font size="1"><font color="#FF0000">(Dados 
                          não disponível)</font></font><font color="#0000FF"><strong><br>
                          </strong></font><br>
                          <br>
                          <br>
                          <font color="#0000FF"><strong>OUTROS DADOS: </strong></font><font size="1"><font color="#FF0000">(Dados 
                          não disponível)</font></font></font> </p>
                        <hr>
                        <p align="left"><font color="#0000FF" size="1"><strong>CADASTRO 
                          REPRESENTANTE: <br>
                          </strong></font><font size="1"><br>
                          <br>
                          <font color="#0000FF"><strong>EMPRESA / NOME:</strong></font> 
                          FCA COMERCIO E REPRESENTAÇÕES LTDA - ME<br>
                          <br>
                          <font color="#0000FF"><strong>ENDEREÇO:</strong></font> 
                          RUA 22, Nº 183<br>
                          <br>
                          <font color="#0000FF"><strong>BAIRRO:</strong></font> 
                          CENTRO<br>
                          <br>
                          <font color="#0000FF"><strong>CIDADE / UF:</strong></font> 
                          BARRETOS - SP.<br>
                          <br>
                          <font color="#0000FF"><strong>CEP:</strong></font> 14.780-080<br>
                          <br>
                          <font color="#0000FF"><strong>CNPJ / CPF:</strong></font> 
                          59.821.223/0001-62<br>
                          <br>
                          <font color="#0000FF"><strong>INSC.EST./ RG: </strong></font>204.046.406.118<br>
                          <br>
                          <font color="#0000FF"><strong>CONTATO:</strong></font> 
                          FRANCISCO CRISPIM<br>
                          <br>
                          <font color="#0000FF"><strong>FONE / FAX:</strong></font> 
                          17-3322-6423<br>
                          <br>
                          <font color="#0000FF"><strong>CELULAR:</strong></font> 
                          17-8114-6060<br>
                          <br>
                          <font color="#0000FF"><strong>CONTATO:</strong></font> 
                          LUIS ANTONIO<br>
                          <br>
                          <font color="#0000FF"><strong>FONE / FAX:</strong></font> 
                          17-3323-1121<br>
                          <br>
                          <font color="#0000FF"><strong>CELULAR:</strong></font> 
                          14-8116-1070<br>
                          <br>
                          <font color="#00FF00"><strong><font color="#0000FF">E-MAIL:</font></strong></font> 
                          <a href="mailto:fca@investnet.com.br">fca@investnet.com.br</a><br>
                          <br>
                          <font color="#0000FF"><strong>REGIÃO QUE ATUA: </strong></font></font></p>
                        <p align="left"><font size="1">- Altinópolis<br>
                          - Américo Brasiliense<br>
                          - Araraquara<br>
                          - Auriflama<br>
                          - Bady Bassit<br>
                          - Barretos<br>
                          - Barrinha<br>
                          - Batatais<br>
                          - Bebedouro<br>
                          - Buritama<br>
                          - Cajobi<br>
                          - Cajuru<br>
                          - Catanduva<br>
                          - Catingua<br>
                          - Fernandópolis<br>
                          - Franca<br>
                          - General Salgado<br>
                          - Guaíra<br>
                          - Guará<br>
                          - Guariba<br>
                          - Ibaté<br>
                          - Ibirá<br>
                          - Ibitinga<br>
                          - Igarapava<br>
                          - Ilha Solteira<br>
                          - Ipuã<br>
                          - Irapuã<br>
                          - Itápolis<br>
                          - Jaboticabal<br>
                          - Jales<br>
                          - Jardinópolis<br>
                          - José Bonifácio<br>
                          - Matão<br>
                          - Miguelópolis<br>
                          - Mirassol<br>
                          - Monte Alto<br>
                          - Monte Aprazível<br>
                          - Morro Agudo<br>
                          - Neves Paulista<br>
                          - Nhandeara<br>
                          - Nova Europa<br>
                          - Nova Granada.<br>
                          - Novo Horizonte<br>
                          - Nuporanga<br>
                          - Olímpia<br>
                          - Orlândia<br>
                          - Palmares<br>
                          - Patrocínio<br>
                          - Paulo de Faria<br>
                          - Pedregulho<br>
                          - Pereira Barreto<br>
                          - Pirangi<br>
                          - Pitangueiras<br>
                          - Poloni<br>
                          - Pontal<br>
                          - Potirendaba<br>
                          - Pradópolis<br>
                          - Ribeirão Preto<br>
                          - Rincão<br>
                          - Sales Oliveira<br>
                          - Santa Fé do Sul<br>
                          - Santa Rita do Passa Quatro<br>
                          - Santa Rosa do Viterbo<br>
                          - São Joaquim da Barra<br>
                          - São José do Rio Preto<br>
                          - São Simão<br>
                          - Serrana<br>
                          - Sertãozinho<br>
                          - Severinia<br>
                          - Tabapuã<br>
                          - Tabatinga<br>
                          - Tambaú<br>
                          - Tanabi<br>
                          - Taquaritinga<br>
                          - Uchoa<br>
                          - Urupês<br>
                          - Viradouro<br>
                          - Votuporang</font></p>
                      </div>
                      <p>&nbsp;</p>
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
