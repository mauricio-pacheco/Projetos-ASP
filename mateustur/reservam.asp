
<style type="text/css">
<!--
.style1 {
	font-size: 9px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style4 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 14px;
}
-->
</style>
<script language=javascript>
<!--
function validar(form) {
nome = document.form.nome.value;
if (nome == "") {
alert("O campo NOME é obrigatório!");
form.nome.focus();
return false;
}
cidade = document.form.cidade.value;
if (cidade == "") {
alert("O campo CIDADE é obrigatório!");
form.cidade.focus();
return false;
}
ddd = document.form.ddd.value;
if (ddd == "") {
alert("O campo DDD do TELEFONE é obrigatório!");
form.ddd.focus();
return false;
}
telefone = document.form.telefone.value;
if (telefone == "") {
alert("O campo TELEFONE é obrigatório!");
form.telefone.focus();
return false;
}
email = document.form.email.value;
if (email == "") {
alert("O campo E-MAIL é obrigatório!");
form.email.focus();
return false;
}
destino = document.form.destino.value;
if (destino == "") {
alert("O campo DESTINO é obrigatório!");
form.destino.focus();
return false;
}
origem = document.form.origem.value;
if (origem == "") {
alert("O campo ORIGEM é obrigatório!");
form.origem.focus();
return false;
}
saida = document.form.saida.value;
if (saida == "") {
alert("O campo SAÍDA é obrigatório!");
form.saida.focus();
return false;
}
retorno = document.form.retorno.value;
if (retorno == "") {
alert("O campo RETORNO é obrigatório!");
form.retorno.focus();
return false;
}
}
-->
</script>
<FORM name="form" onsubmit="return validar(this)" action=reservasform.asp 
method=post><TABLE cellSpacing=0 cellPadding=15 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD background="fundo1.jpg" class=PresentacionHomeBC>
                       <TABLE id=table__15956 cellSpacing=0 cellPadding=0 
                        width="100%" border=0>
                          <TBODY>
                          <TR>
                            <TD width="2%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><img src="seta.gif" width="12" height="12"></TD>
                            <TD width="43%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><span class="PresentacionHomeBD" style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif">&nbsp;Reservas</span></TD>
                            <TD width="55%" align="left" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><script language="JavaScript" type="text/JavaScript">
var datahora,xhora,xdia,dia,mes,ano,txtsaudacao;
datahora = new Date();
xhora = datahora.getHours();
if (xhora >= 0 && xhora < 12) {txtsaudacao = "Bom Dia!"}
if (xhora >= 12 && xhora < 18) {txtsaudacao = "Boa Tarde!"}
if (xhora >= 18 && xhora <= 23) {txtsaudacao = "Boa Noite!"}
xdia = datahora.getDay();
diasemana = new Array(7);
diasemana[0] = "Domingo";
diasemana[1] = "Segunda-feira";
diasemana[2] = "Terça-feira";
diasemana[3] = "Quarta-feira";
diasemana[4] = "Quinta-feira";
diasemana[5] = "Sexta-feira";
diasemana[6] = "Sábado";
dia = datahora.getDate();
mes = datahora.getMonth();
mesdoano = new Array(12);
mesdoano[0] = "janeiro";
mesdoano[1] = "fevereiro";
mesdoano[2] = "março";
mesdoano[3] = "abril";
mesdoano[4] = "maio";
mesdoano[5] = "junho";
mesdoano[6] = "julho";
mesdoano[7] = "agosto";
mesdoano[8] = "setembro";
mesdoano[9] = "outubro";
mesdoano[10] = "novembro";
mesdoano[11] = "dezembro";
ano = datahora.getFullYear();
document.write(txtsaudacao + " Hoje, " + diasemana[xdia] + ", " + dia + " de " + mesdoano[mes] + " de " + ano);
</script></TD>
                          </TR>
                           <TR>
                            <TD width="2%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><img src="espaco.gif" width="12" height="12"></TD>
                            <TD width="43%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"></TD>
                            <TD width="55%" align="left" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"></TD>
                          </TR>
                         </TBODY></TABLE><table width="100%" border="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center"><span class="style4">Monte sua viagem </span></div></td>
  </tr>
  <tr>
    <td width="23%">&nbsp;</td>
  </tr>
</table>
                         <table width="100%" border="0">
  <tr>
    <td width="23%"><span class="style1"><img src="setinha.gif" width="16" height="16" />Dados Passageiro:</span></td>
    <td width="77%"><div align="right"><span class="style1">* Campos Obrigat&oacute;rios </span></div></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="100%"><span class="style1">----------------------------------------------------------------------------------------------------------</span></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td><span class="style1">Nome Completo:</span>
      <input class="formulario" size="60" name="nome" />
      <span class="style1">*</span></td>
    </tr>
  <tr>
    <td width="88%"><span class="style1">Endere&ccedil;o:</span>
      <input class="formulario" 
                                size="70" name="endereco" /></td>
    </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="5%"><span class="style1">Cidade:</span></td>
    <td width="74%"><input class="formulario" 
                                size="40" name="cidade" />
      <span class="style1">*</span>
        <select class="formulario" 
                               size="1" name="estado" value="">
          <option 
                                selected="selected">ESTADO</option>
          <option 
                                value="AC - Acre">AC - Acre</option>
          <option value="AL 
            - Alagoas">AL 
            - Alagoas</option>
          <option value="AM - 
            Amazonas">AM - 
            Amazonas</option>
          <option value="AP - Amapá">AP - 
            Amap&aacute;</option>
          <option value="BA - 
            Bahia">BA - 
            Bahia</option>
          <option value="CE - Ceará">CE - 
            Cear&aacute;</option>
          <option value="DF - Distrito 
            Federal">DF - Distrito 
            Federal</option>
          <option value="ES - Espiríto Santo">ES - Esp&iacute;rito 
            Santo</option>
          <option value="GO - 
            Goias">GO - 
            Goias</option>
          <option value="MA - Maranhão">MA - 
            Maranh&atilde;o</option>
          <option value="MG - Minas 
            Gerais">MG - Minas 
            Gerais</option>
          <option value="MS - Mato 
            Grosso do Sul">MS - Mato 
            Grosso do Sul</option>
          <option value="T - 
            Mato Grosso">MT - 
            Mato Grosso</option>
          <option value="PA - Pará">PA - 
            Par&aacute;</option>
          <option value="PB - 
            Paraiba">PB - 
            Paraiba</option>
          <option value="PE - 
            Pernambuco">PE - 
            Pernambuco</option>
          <option value="PI - 
            Piaui">PI - 
            Piaui</option>
          <option value="PR - Paraná">PR - 
            Paran&aacute;</option>
          <option value="RJ - Rio de 
            Janeiro">RJ - Rio de 
            Janeiro</option>
          <option value="RN - Rio 
            Grande do Norte">RN - Rio 
            Grande do Norte</option>
          <option value="RO - Rondônia">RO - 
            Rond&ocirc;nia</option>
          <option value="RR - 
            Roraima">RR - 
            Roraima</option>
          <option value="RS - Rio 
            Grande do Sul">RS - Rio 
            Grande do Sul</option>
          <option value="SC - 
            Santa Catarina">SC - 
            Santa Catarina</option>
          <option value="SE - 
            Sergipe">SE - 
            Sergipe</option>
          <option value="SP - São Paulo">SP - S&atilde;o 
            Paulo</option>
          <option value="TO - 
            Tocantins">TO - 
            Tocantins</option>
      </select></td>
    </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="6%"><span class="style1">CEP:</span></td>
    <td width="18%"><input class="formulario"  
                                size="17" name="cep" /></td>
    <td width="10%"><span class="style1">Telefone:</span></td>
    <td width="48%"><input class="formulario" 
                                maxlength="2" size="1" name="ddd" />
-
  <input 
                                class="formulario" maxlength="9" 
                                size="18" name="telefone" />
  <span class="style1">*</span></td>
    <td width="5%"><span class="style1">FAX:</span></td>
    <td width="13%"><input class="formulario" 
                                size="14" name="fax" /></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="8%"><span class="style1">E-mail</span>:      </td>
    <td width="92%">
      <input class="formulario" 
                                size="60" name="email" />
      <span class="style1">*</span></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="100%"><span class="style1">----------------------------------------------------------------------------------------------------------</span></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="21%"><span class="style1"><img src="setinha.gif" width="16" height="16" />Dados Reserva:</span></td>
    <td width="79%"><div align="right"></div></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="100%"><span class="style1">----------------------------------------------------------------------------------------------------------</span></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td><span class="style1">Destino:</span></td>
    <td><input class="formulario" 
                                size="60" name="destino" />
      <span class="style1">*</span></td>
    </tr>
  <tr>
    <td width="6%"><span class="style1">Origem:</span></td>
    <td width="94%"><input class="formulario" 
                               size="70" name="origem" />
      <span class="style1">*</span></td>
    </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td><span class="style1">Sa&iacute;da:</span></td>
    <td><input class="formulario" 
                                size="12" name="saida" />
      <span class="style1">*</span> <span class="style1">(dd/mm/aa)</span></td>
    <td><span class="style1">Retorno:</span></td>
    <td><input class="formulario" 
                                size="12" name="retorno" />
      <span class="style1">*</span> <span class="style1">(dd/mm/aa)</span></td>
    </tr>
  <tr>
    <td width="4%"><span class="style1"><span class="tx">Adultos:</span></span></td>
    <td width="31%"><select class="formulario" 
                                name="adultos">
      <option value="No" 
                                selected="selected">Número</option>
      <option 
                                value="01">01</option>
      <option 
                                value="02">02</option>
      <option 
                                value="03">03</option>
      <option 
                                value="04">04</option>
      <option 
                                value="05">05</option>
      <option 
                                value="06">06</option>
      <option 
                                value="07">07</option>
      <option 
                                value="08">08</option>
      <option 
                                value="09">09</option>
      <option 
                                value="10">10</option>
      <option 
                                value="11">11</option>
      <option 
                                value="12">12</option>
      <option 
                                value="13">13</option>
      <option 
                                value="14">14</option>
      <option 
                                value="15">15</option>
      <option 
                                value="16">16</option>
      <option 
                                value="17">17</option>
      <option 
                                value="18">18</option>
      <option 
                                value="19">19</option>
      <option 
                                value="20">20</option>
    </select></td>
    <td width="6%"><span class="style1"><span class="tx">Crian&ccedil;as:</span></span></td>
    <td width="32%"><select class="formulario" 
                               name="criancas">
      <option value="No" 
                                selected="selected">Número</option>
      <option 
                                value="01">01</option>
      <option 
                                value="02">02</option>
      <option 
                                value="03">03</option>
      <option 
                                value="04">04</option>
      <option 
                                value="05">05</option>
      <option 
                                value="06">06</option>
      <option 
                                value="07">07</option>
      <option 
                                value="08">08</option>
      <option 
                                value="09">09</option>
      <option 
                                value="10">10</option>
      <option 
                                value="11">11</option>
      <option 
                                value="12">12</option>
      <option 
                                value="13">13</option>
      <option 
                                value="14">14</option>
      <option 
                                value="15">15</option>
      <option 
                                value="16">16</option>
      <option 
                                value="17">17</option>
      <option 
                                value="18">18</option>
      <option 
                                value="19">19</option>
      <option 
                                value="20">20</option>
    </select></td>
    </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="100%"><span class="style1">----------------------------------------------------------------------------------------------------------</span></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="26%" align="center"><textarea class="formulario" onclick="this.value=''" name="mensagem" rows="10" cols="100">Observa&ccedil;&otilde;es</textarea></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="100%"><span class="style1">----------------------------------------------------------------------------------------------------------</span></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="26%"><span class="tx style1">Quero receber 
      resposta: </span>
        <select 
                                class="formulario" size="1" 
                                name="resposta">
          <option 
                                value="Via E-mail">Via E-mail</option>
          <option 
                                value="Via Telefone">Via Telefone</option>
          
      </select></td>
    <td width="6%"><input class="formulario" type="submit" value="FAZER RESERVA" name="Submit" /></td>
    <td width="6%"><input class="formulario" type="reset" value="LIMPAR FORMUL&Aacute;RIO" name="Reset" /></td>
  </tr>
</table></form>
                      </table>
                        </TD></TR></TBODY></TABLE>