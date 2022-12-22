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
                              <TD class=nav><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><em><font face="Verdana, Arial, Helvetica, sans-serif"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"></font></em><font face="Verdana, Arial, Helvetica, sans-serif">ASSIS. 
                                TÉCNICA </font></TD>
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
                        <p align="center">&nbsp;</p>
                        <p align="center"><img src="assis.jpg" width="400" height="43"></p>
                        <p align="center"><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><font color="#000000" size="1"><strong>Preencha 
                          o formulário abaixo, será um prazer atendê-lo!</strong></font></font> 
                        </p>
                        <form action="bolaxa3.asp" method="POST">
                          <div align="left">
                            <table width="100%" border="0">
                              <tr> 
                                <td><table width="100%" border="0" align="left">
                                    <tr> 
                                      <td width="68%"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <input type="text" name="nome" size=30>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Endereço:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <input type="text" name="endereco" size=30>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Bairro:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <input type="text" name="bairro" size="20" >
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cidade:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <input type="text" name="cidade" size="36" >
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Estado:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><font color="#000000"> 
                                        <select name="estado">
                                          <option value="--">-- 
                                          <option value="AC">AC 
                                          <option value="AL">AL 
                                          <option value="AM">AM 
                                          <option value="AP">AP 
                                          <option value="BA">BA 
                                          <option value="CE">CE 
                                          <option value="DF">DF 
                                          <option value="ES">ES 
                                          <option value="GO">GO 
                                          <option value="MA">MA 
                                          <option value="MG">MG 
                                          <option value="MS">MS 
                                          <option value="MT">MT 
                                          <option value="PA">PA 
                                          <option value="PB">PB 
                                          <option value="PE">PE 
                                          <option value="PI">PI 
                                          <option value="PR">PR 
                                          <option value="RJ">RJ 
                                          <option value="RN">RN 
                                          <option value="RO">RO 
                                          <option value="RR">RR 
                                          <option value="RS">RS 
                                          <option value="SC">SC 
                                          <option value="SE">SE 
                                          <option value="SP">SP 
                                          <option value="TO">TO</option>
                                        </select>
                                        <input type="checkbox" name="outropais" value="Outro País">
                                        Outro País</font></font><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">CEP:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <input type="text" name="cep" size="12" >
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Pa&iacute;s:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <select name="pais">
                                          <option value="Brasil">Brasil</option>
                                          <option value="Afeganistão">Afeganistão</option>
                                          <option value="África do Sul">África 
                                          do Sul</option>
                                          <option value="Aland - Finlândia">Aland 
                                          - Finlândia</option>
                                          <option value="Albânia">Albânia</option>
                                          <option value="Alemanha">Alemanha</option>
                                          <option value="Andorra">Andorra</option>
                                          <option value="Angola">Angola</option>
                                          <option value="Anguilla - Reino Unido">Anguilla 
                                          - Reino Unido</option>
                                          <option value="Antártida">Antártida</option>
                                          <option value="Antígua e Barbuda">Antígua 
                                          e Barbuda</option>
                                          <option value="Antilhas Holandesa">Antilhas 
                                          Holandesas</option>
                                          <option value="Arábia Saudita">Arábia 
                                          Saudita</option>
                                          <option value="Argélia">Argélia</option>
                                          <option value="Argentina">Argentina</option>
                                          <option value="Armênia">Armênia</option>
                                          <option value="Aruba - Holanda">Aruba 
                                          - Holanda</option>
                                          <option value="Ascensão - Reino Unido">Ascensão 
                                          - Reino Unido</option>
                                          <option value="Austrália">Austrália</option>
                                          <option value="Áustria">Áustria</option>
                                          <option value="Azerbaijão">Azerbaijão</option>
                                          <option value="Bahamas">Bahamas</option>
                                          <option value="Bahrein">Bahrein</option>
                                          <option value="Bangladesh">Bangladesh</option>
                                          <option value="Barbados">Barbados</option>
                                          <option value="Belarus">Belarus</option>
                                          <option value="Bélgica">Bélgica</option>
                                          <option value="Belize">Belize</option>
                                          <option value="Benin">Benin</option>
                                          <option value="Bermudas - Reino Unido">Bermudas 
                                          - Reino Unido</option>
                                          <option value="Bioko - Guiné Equatorial">Bioko 
                                          - Guiné Equatorial</option>
                                          <option value="Bolívia">Bolívia</option>
                                          <option value="Bósnia-Herzegóvina">Bósnia-Herzegóvina</option>
                                          <option value="Botsuana">Botsuana</option>
                                          <option value="Brunei">Brunei</option>
                                          <option value="Bulgária">Bulgária</option>
                                          <option value="Burkina Fasso">Burkina 
                                          Fasso</option>
                                          <option value="Burundi">Burundi</option>
                                          <option value="Butão">Butão</option>
                                          <option value="Cabo Verde">Cabo Verde</option>
                                          <option value="Camarões">Camarões</option>
                                          <option value="Camboja">Camboja</option>
                                          <option value="Canadá">Canadá</option>
                                          <option value="Cazaquistão">Cazaquistão</option>
                                          <option value="Ceuta -  ???
?A?º?Espanha">Ceuta - Espanha</option>
                                          <option value="Chade">Chade</option>
                                          <option value="Chile">Chile</option>
                                          <option value="China">China</option>
                                          <option value="Chipre">Chipre</option>
                                          <option value="Cidade do Vaticano">Cidade 
                                          do Vaticano</option>
                                          <option value="Cingapura">Cingapura</option>
                                          <option value="Colômbia">Colômbia</option>
                                          <option value="Congo">Congo</option>
                                          <option value="Coréia do Norte">Coréia 
                                          do Norte</option>
                                          <option value="Coréia do Sul">Coréia 
                                          do Sul</option>
                                          <option value="Córsega - França">Córsega 
                                          - França</option>
                                          <option value="Costa do Marfim">Costa 
                                          do Marfim</option>
                                          <option value="Costa Rica">Costa Rica</option>
                                          <option value="Creta - Grécia">Creta 
                                          - Grécia</option>
                                          <option value="Croácia">Croácia</option>
                                          <option value="Cuba">Cuba</option>
                                          <option value="Curaçao - Holanda">Curaçao 
                                          - Holanda</option>
                                          <option value="Dinamarca">Dinamarca</option>
                                          <option value="Djibuti">Djibuti</option>
                                          <option value="Dominica">Dominica</option>
                                          <option value="Egito">Egito</option>
                                          <option value="El Salvador">El Salvador</option>
                                          <option value="Emirado Árabes Unidos">Emirado 
                                          Árabes Unidos</option>
                                          <option value="Equador">Equador</option>
                                          <option value="Eritréia">Eritréia</option>
                                          <option value="Eslováquia">Eslováquia</option>
                                          <option value="Eslovênia">Eslovênia</option>
                                          <option value="Espanha">Espanha</option>
                                          <option value="Estados Unidos">Estados 
                                          Unidos</option>
                                          <option value="Estônia">Estônia</option>
                                          <option value="Etiópia">Etiópia</option>
                                          <option value="Fiji">Fiji</option>
                                          <option value="Filipinas">Filipinas</option>
                                          <option value="Finlândia">Finlândia</option>
                                          <option value="França">França</option>
                                          <option value="Gabão">Gabão</option>
                                          <option value="Gâmbia">Gâmbia</option>
                                          <option value="Gana">Gana</option>
                                          <option value="Geórgia">Geórgia</option>
                                          <option value="Gibraltar - Reino Unido">Gibraltar 
                                          - Reino Unido</option>
                                          <option value="Granada">Granada</option>
                                          <option value="Grécia">Grécia</option>
                                          <option value="Groenlândia - Dinamarca">Groenlândia 
                                          - Dinamarca</option>
                                          <option value="Guadalupe - França">Guadalupe 
                                          - França</option>
                                          <option val ???
?a??ue="Guam - Estados Unidos">Guam - Estados Unidos</option>
                                          <option value="Guatemala">Guatemala</option>
                                          <option value="Guiana">Guiana</option>
                                          <option value="Guiana Francesa">Guiana 
                                          Francesa</option>
                                          <option value="Guiné">Guiné</option>
                                          <option value="Guiné Equatorial">Guiné 
                                          Equatorial</option>
                                          <option value="Guiné-Bissau">Guiné-Bissau</option>
                                          <option value="Haiti">Haiti</option>
                                          <option value="Holanda">Holanda</option>
                                          <option value="Honduras">Honduras</option>
                                          <option value="Hong Kong">Hong Kong</option>
                                          <option value="Hungria">Hungria</option>
                                          <option value="Iêmen">Iêmen</option>
                                          <option value="IIhas Virgens - Estados Unidos">IIhas 
                                          Virgens - Estados Unidos</option>
                                          <option value="Ilha de Man - Reino Unido">Ilha 
                                          de Man - Reino Unido</option>
                                          <option value="Ilha Natal - Austrália">Ilha 
                                          Natal - Austrália</option>
                                          <option value="Ilha Norfolk - Austrália">Ilha 
                                          Norfolk - Austrália</option>
                                          <option value="Ilha Pitcairn - Reino Unido">Ilha 
                                          Pitcairn - Reino Unido</option>
                                          <option value="Ilha Wrangel - Rússia">Ilha 
                                          Wrangel - Rússia</option>
                                          <option value="Ilhas Aleutas - Estados Unidos">Ilhas 
                                          Aleutas - Estados Unidos</option>
                                          <option value="Ilhas Canárias - Espanha">Ilhas 
                                          Canárias - Espanha</option>
                                          <option value="Ilhas Cayman - Reino Unido">Ilhas 
                                          Cayman - Reino Unido</option>
                                          <option value="Ilhas Comores">Ilhas 
                                          Comores</option>
                                          <option value="Ilhas Cook - Nova Zelândia">Ilhas 
                                          Cook - Nova Zelândia</option>
                                          <option value="Ilhas do Canal - Reino Unido">Ilhas 
                                          do Canal - Reino Unido</option>
                                          <option value="Ilhas Salomão">Ilhas 
                                          Salomão</option>
                                          <option value="Ilhas Seychelles">Ilhas 
                                          Seychelles</option>
                                          <option value="Ilhas Tokelau - Nova Zelândia">Ilhas 
                                          Tokelau - Nova Zelândia</option>
                                          <option value="Ilhas Turks e Caicos - Reino Unido">Ilhas 
                                          Turks e Caicos - Reino Unido</option>
                                          <option value="Ilhas Virgens - Reino Unido">Ilhas 
                                          Virgens - Reino Unido</option>
                                          <option value="Ilhas Wallis e Futuna - França">Ilhas 
                                          Wallis e Futuna - França</option>
                                          <option value="Ilhsa Cocos - Austrália">Ilhsa 
                                          Cocos - Austrália</option>
                                          <option value="Índia">Índia</option>< ???
?A?º?option value="Indonésia">Indonésia
             
                                          <option value="Irã">Irã</option>
                                          <option value="Iraque">Iraque</option>
                                          <option value="Irlanda">Irlanda</option>
                                          <option value="Islândia">Islândia</option>
                                          <option value="Israel">Israel</option>
                                          <option value="Itália">Itália</option>
                                          <option value="Iugoslávia">Iugoslávia</option>
                                          <option value="Jamaica">Jamaica</option>
                                          <option value="Jan Mayen - Noruega">Jan 
                                          Mayen - Noruega</option>
                                          <option value="Japão">Japão</option>
                                          <option value="Jordânia">Jordânia</option>
                                          <option value="Kiribati">Kiribati</option>
                                          <option value="Kuait">Kuait</option>
                                          <option value="Laos">Laos</option>
                                          <option value="Lesoto">Lesoto</option>
                                          <option value="Letônia">Letônia</option>
                                          <option value="Líbano">Líbano</option>
                                          <option value="Libéria">Libéria</option>
                                          <option value="Líbia">Líbia</option>
                                          <option value="Liechtenstein">Liechtenstein</option>
                                          <option value="Lituânia">Lituânia</option>
                                          <option value="Luxemburgo">Luxemburgo</option>
                                          <option value="Macau - Portugal">Macau 
                                          - Portugal</option>
                                          <option value="Macedônia">Macedônia</option>
                                          <option value="Madagascar">Madagascar</option>
                                          <option value="Madeira - Portugal">Madeira 
                                          - Portugal</option>
                                          <option value="Malásia">Malásia</option>
                                          <option value="Malaui">Malaui</option>
                                          <option value="Maldivas">Maldivas</option>
                                          <option value="Mali">Mali</option>
                                          <option value="Malta">Malta</option>
                                          <option value="Marrocos">Marrocos</option>
                                          <option value="Martinica - França">Martinica 
                                          - França</option>
                                          <option value="Maurício - Reino Unido">Maurício 
                                          - Reino Unido</option>
                                          <option value="Mauritânia">Mauritânia</option>
                                          <option value="México">México</option>
                                          <option value="Micronésia">Micronésia</option>
                                          <option value="Moçambique">Moçambique</option>
                                          <option value="Moldova">Moldova</option>
                                          <option value="Mônaco">Mônaco</option>
                                          <option value="Mongólia">Mongólia</option>
                                          <option value="MontSerrat - Reino Unido">MontSerrat 
                                          - Reino Unido</option>
                                          <option value="Myanma">Myanma</option>
                                          <option value="Namíbia">Namíbia</option>
                                          <option value="Nauru">Nauru</option>
                                          <option value="Nepal">Nepal</option>
                                          <option v ???
?a??alue="Nicarágua">Nicarágua</option>
                                          <option value="Níger">Níger</option>
                                          <option value="Nigéria">Nigéria</option>
                                          <option value="Niue">Niue</option>
                                          <option value="Noruega">Noruega</option>
                                          <option value="Nova Bretanha - Papua-Nova Guiné">Nova 
                                          Bretanha - Papua-Nova Guiné</option>
                                          <option value="Nova Caledônia - França">Nova 
                                          Caledônia - França</option>
                                          <option value="Nova Zelândia">Nova 
                                          Zelândia</option>
                                          <option value="Omã">Omã</option>
                                          <option value="Palau - Estados Unidos">Palau 
                                          - Estados Unidos</option>
                                          <option value="Palestina">Palestina</option>
                                          <option value="Panamá">Panamá</option>
                                          <option value="Papua-Nova Guiné">Papua-Nova 
                                          Guiné</option>
                                          <option value="Paquistão">Paquistão</option>
                                          <option value="Paraguai">Paraguai</option>
                                          <option value="Peru">Peru</option>
                                          <option value="Polinésia Francesa">Polinésia 
                                          Francesa</option>
                                          <option value="Polônia">Polônia</option>
                                          <option value="Porto Rico">Porto Rico</option>
                                          <option value="Portugal">Portugal</option>
                                          <option value="Qatar">Qatar</option>
                                          <option value="Quênia">Quênia</option>
                                          <option value="Quirguistão">Quirguistão</option>
                                          <option value="Reino Unido">Reino Unido</option>
                                          <option value="República Centro-Africana">República 
                                          Centro-Africana</option>
                                          <option value="República Dominicana">República 
                                          Dominicana</option>
                                          <option value="República Tcheca">República 
                                          Tcheca</option>
                                          <option value="Romênia">Romênia</option>
                                          <option value="Ruanda">Ruanda</option>
                                          <option value="Rússia">Rússia</option>
                                          <option value="Samoa Ocidental">Samoa 
                                          Ocidental</option>
                                          <option value="San Marino">San Marino</option>
                                          <option value="Santa Helena - Reino Unido">Santa 
                                          Helena - Reino Unido</option>
                                          <option value="Santa Lúcia">Santa Lúcia</option>
                                          <option value="São Cristovão e Névis">São 
                                          Cristovão e Névis</option>
                                          <option value="São Tomé e Príncipe">São 
                                          Tomé e Príncipe</option>
                                          <option value="São Vicente e Granadinas">São 
                                          Vicente e Granadinas</option>
                                          <option value="Sardenha - Itália">Sardenha 
                                          - Itália</option>
                                          <option value="Senegal">Senegal</option>
                                          <option value="Serra Leoa">Serra Leoa</option>
                                          <option value="Síria">Síria</ ??? ?A?º?option> 
                                          <option value="Somália">Somália</option>
                                          <option value="Sri Lanka">Sri Lanka</option>
                                          <option value="Suazilândia">Suazilândia</option>
                                          <option value="Sudão">Sudão</option>
                                          <option value="Suécia">Suécia</option>
                                          <option value="Suíça">Suíça</option>
                                          <option value="Suriname">Suriname</option>
                                          <option value="Tadjiquistão">Tadjiquistão</option>
                                          <option value="Tailândia">Tailândia</option>
                                          <option value="Taiti">Taiti</option>
                                          <option value="Taiwan">Taiwan</option>
                                          <option value="Tanzânia">Tanzânia</option>
                                          <option value="Terra de Francisco José - Rússia">Terra 
                                          de Francisco José - Rússia</option>
                                          <option value="Togo">Togo</option>
                                          <option value="Tonga">Tonga</option>
                                          <option value="Trinidad e Tobago">Trinidad 
                                          e Tobago</option>
                                          <option value="Tristão da Cunha - Reino Unido">Tristão 
                                          da Cunha - Reino Unido</option>
                                          <option value="Tunísia">Tunísia</option>
                                          <option value="Turcomenistão">Turcomenistão</option>
                                          <option value="Turquia">Turquia</option>
                                          <option value="Tuvalu">Tuvalu</option>
                                          <option value="Ucrânia">Ucrânia</option>
                                          <option value="Uganda">Uganda</option>
                                          <option value="Uruguai">Uruguai</option>
                                          <option value="Uzbequistão">Uzbequistão</option>
                                          <option value="Vanuatu">Vanuatu</option>
                                          <option value="Venezuela">Venezuela</option>
                                          <option value="Vietnã">Vietnã</option>
                                          <option value="Zaire">Zaire</option>
                                          <option value="Zâmbia">Zâmbia</option>
                                          <option value="Zimbábue">Zimbábue</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">CPPJ:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <input type="text" name="cppj" size="20" >
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Inscrição 
                                        Estadual:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <input type="text" name="estadual" size="20" >
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">E-mail:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <input type="text" name="email" size=32>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Telefone:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <input type="text" name="telefone" size="30" >
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Contato:</font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <input type="text" name="contato" size=24>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td>&nbsp;</td>
                                    </tr>
                                    <tr> 
                                      <td><div align="center"><font size="1">Nº 
                                          da Nota Fiscal:</font><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                          <input type="text" name="notafiscal" size=22>
                                          </font><font size="1">Data de Emissão:</font><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                          <input type="text" name="emissao" size=20>
                                          Ex: dd/mm/aaaa</font></div></td>
                                    </tr>
                                    <tr> 
                                      <td>&nbsp;</td>
                                    </tr>
                                    <tr> 
                                      <td><div align="center"><strong><font size="2">PRODUTOS 
                                          AVARIADOS</font></strong></div></td>
                                    </tr>
                                    <tr> 
                                      <td>&nbsp;</td>
                                    </tr>
                                    <tr> 
                                      <td><table width="80%" border="0" align="center">
                                          <tr> 
                                            <td><div align="center"><font color="#FF0000" size="2"><strong>Código:</strong></font></div></td>
                                            <td><div align="center"><font color="#FF0000" size="2"><strong>Descrição 
                                                do Produto:</strong></font></div></td>
                                            <td><div align="center"><font color="#FF0000" size="2"><strong>Descrição 
                                                da Avaria:</strong></font></div></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="codigo1" size="12" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="produto1" size="30" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="avaria1" size="30" >
                                                </font></div></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="codigo2" size="12" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="produto2" size="30" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="avaria2" size="30" >
                                                </font></div></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="codigo3" size="12" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="produto3" size="30" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="avaria3" size="30" >
                                                </font></div></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="codigo4" size="12" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="produto4" size="30" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="avaria4" size="30" >
                                                </font></div></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="codigo5" size="12" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="produto5" size="30" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="avaria5" size="30" >
                                                </font></div></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="codigo6" size="12" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="produto6" size="30" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="avaria6" size="30" >
                                                </font></div></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="codigo7" size="12" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="produto7" size="30" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="avaria7" size="30" >
                                                </font></div></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="codigo8" size="12" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="produto8" size="30" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="avaria8" size="30" >
                                                </font></div></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="codigo9" size="12" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="produto9" size="30" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="avaria9" size="30" >
                                                </font></div></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="codigo10" size="12" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="produto10" size="30" >
                                                </font></div></td>
                                            <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <input type="text" name="avaria10" size="30" >
                                                </font></div></td>
                                          </tr>
                                        </table></td>
                                    </tr>
                                    <tr> 
                                      <td><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                          </font></div></td>
                                    </tr>
                                    <tr> 
                                      <td><div align="center"><font size="1">MENSAGEM 
                                          / SUGESTÕES<font color="#000000" face="Verdana, Arial, Helvetica, sans-serif">:</font></font></div></td>
                                    </tr>
                                    <tr> 
                                      <td><div align="center"><font color="#000000"><b><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                          <textarea name="mensagem" cols="80" rows="10"></textarea>
                                          </font></b></b></font><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
                                          </font></div></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <input name="submit3" type="submit" value="ENVIAR">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><font color="#000000"> 
                                        </font></font><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
                                        </font></td>
                                    </tr>
                                  </table></td>
                               
                              </tr>
                            </table>
                          </div>
                        </form>
                        
                      </div>
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
