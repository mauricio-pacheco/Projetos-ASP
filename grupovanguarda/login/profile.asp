<%
Option Explicit
Dim sql, rsProfile, username, malechecked, femalechecked, sendemailchecked, datanascimento, cidade, estado, pais, sugestao, vinculo, area, cargo, estadocivil, natural, nacional, cpf, endereco, numero, complemento, cep, telefone, celular, nivel, status_, inst, nivel2, status2, inst2, nivel3, status3, inst3, nomecurso, entidadecurso, datacurso, cargacurso, nomecurso2, entidadecurso2, datacurso2, cargacurso2, nomecurso3, entidadecurso3, datacurso3, cargacurso3, ingles, espanhol, italiano, alemao, inglesc, espanholc, italianoc, alemaoc, outroidioma, outroidiomac, editort, editortc, planilha, planilhac, programas, programasc, conhecimento, conhecimentoc, infoutros, nomeempresa, cargoempresa, estadoemp, cidadeemp, paisemp, nomeempresa2, cargoempresa2, estadoemp2, cidadeemp2, paisemp2, nomeempresa3, cargoempresa3, estadoemp3, cidadeemp3, paisemp3

username = Request.Cookies("username")
%>

<html>
<head>
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<title>Grupo Vanguarda</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>
<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<font color="#000000" size="1" face="arial,helvetica"> 
<%
if username = "" then
  nologin()
end if
%>
<!--#include file="conn.asp"-->
<%
sql = "SELECT * FROM Users WHERE username = '" & username & "'"
Set rsProfile = Server.CreateObject("ADODB.Recordset")
rsProfile.Open sql, conn, 3, 3
%>
</font><font color="#0000FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
<div align="center">
  <p>GRUPO<font color="#009900"> </font><strong><font color="#009900" size="2" face="Verdana, Arial, Helvetica, sans-serif">VANGUARDA</font></strong> 
  </p>
  <p>&nbsp; </p>
</div>
</strong></font>
<h3 align="center"><font size="1" face="arial,helvetica"><img src="../logo.JPG" width="102" height="114"></font></h3>
<p align="center"><font color="#0000FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"></font> 
  <strong><font color="#009900" size="2" face="Verdana, Arial, Helvetica, sans-serif">Atualiza&ccedil;&atilde;o 
  de Curriculum</font></strong></p>
<p align="center"><font size="1" face="arial,helvetica"><a href="index.asp">VOLTAR 
  AO PAINEL DE CONTROLE</a></font></p>
<h3>&nbsp;</h3>
<h3><font color="#000000" size="2" face="arial,helvetica"><strong><em>Perfil de 
  <font color="#009900"><%=username%></font></em></strong></font></h3>
<font color="#000000" size="1" face="arial,helvetica"> 
<%if Request.QueryString("updated") = "true" then%>
</font> 
<p><font color="#000000" size="1" face="arial,helvetica">Seu perfil foi alterado 
  com sucesso <%=Time()%></font></p>
<font color="#000000" size="1" face="arial,helvetica"> 
<%else%>
<br clear="all">
<%end if%>
</font><font color="#FFFFFF"></font> 
<form action="profile_update.asp" method="post" name="profileform">
  <p align="center">&nbsp;</p>
  <table width="60%" border="0" align="left">
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Tipo 
        de v&iacute;nculo</em></strong></font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="radio" name="vinculo" value="Estagiário">
        Estagi&aacute;rio 
        <input type="radio" name="vinculo" value="Funcionário">
        Funcion&aacute;rio </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Objetivo 
        </em></strong> </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">&Aacute;rea 
        de Trabalho</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <select name="area" value="<%=rsProfile("area")%>">
          <option value="Administrativa"> Administrativa</option>
          <option 
                          value="Financeira">Financeira</option>
          <option 
                          value="Comercial">Comercial</option>
          <option 
                          value="Produção">Produção</option>
          <option 
                          value="Manutenção">Manutenção</option>
          <option 
                          value="Engenheiro Agrônomo">Engenheiro Agrônomo</option>
          <option 
                          value="Técnico Agrícola">Técnico Agrícola</option>
          <option 
                          value="RH">RH</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cargo 
        Desejado</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="cargo" value="<%=rsProfile("cargo")%>" size=30>
        </font></td>
    </tr>
    <tr> 
      <td width="67%">&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Dados 
        Pessoais</em></strong></font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="firstname" value="<%=rsProfile("firstname")%>" size=30>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Sobrenome:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="surname" value="<%=rsProfile("surname")%>" size=30>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data 
        Nascimento:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="datanascimento" value="<%=rsProfile("datanascimento")%>" size="20" >
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Sexo:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b> 
        </b></font><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
  if rsProfile("sex") = "male" then
    malechecked = " checked"
  else
    femalechecked = " checked"
  end if
  %>
        </font><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b> 
        <input type="radio" name="sex" value="male"<%=malechecked%>>
        Masculino 
        <input type="radio" name="sex" value="male"<%=femalechecked%>>
        Feminino</b></font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Estado 
        Civil:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="estadocivil" value="<%=rsProfile("estadocivil")%>" size="20" >
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Natural:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="natural" value="<%=rsProfile("natural")%>" size="30" >
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nacionalidade:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="nacional" value="<%=rsProfile("nacional")%>" size="20" >
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">CPF:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="cpf" value="<%=rsProfile("cpf")%>" size="28" >
        </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Dados 
        para contato:</em></strong></font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Endere&ccedil;o:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="endereco" value="<%=rsProfile("endereco")%>" size="36" >
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">N&uacute;mero:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="numero" value="<%=rsProfile("numero")%>" size="12" >
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Complemento:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="complemento" value="<%=rsProfile("complemento")%>" size="26" >
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">CEP:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="cep" value="<%=rsProfile("cep")%>" size="20" >
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cidade:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="cidade" value="<%=rsProfile("cidade")%>" size=32>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Estado:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <select name="estado" value="<%=rsProfile("estado")%>">
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
        <input type="checkbox" name="outropais" value="<%=rsProfile("outropais")%>">
        Outro País</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Pa&iacute;s:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <select name="pais" value="<%=rsProfile("pais")%>">
          <option value="Brasil">Brasil</option>
          <option value="Afeganistão">Afeganistão</option>
          <option value="África do Sul">África do Sul</option>
          <option value="Aland - Finlândia">Aland - Finlândia</option>
          <option value="Albânia">Albânia</option>
          <option value="Alemanha">Alemanha</option>
          <option value="Andorra">Andorra</option>
          <option value="Angola">Angola</option>
          <option value="Anguilla - Reino Unido">Anguilla - Reino Unido</option>
          <option value="Antártida">Antártida</option>
          <option value="Antígua e Barbuda">Antígua e Barbuda</option>
          <option value="Antilhas Holandesa">Antilhas Holandesas</option>
          <option value="Arábia Saudita">Arábia Saudita</option>
          <option value="Argélia">Argélia</option>
          <option value="Argentina">Argentina</option>
          <option value="Armênia">Armênia</option>
          <option value="Aruba - Holanda">Aruba - Holanda</option>
          <option value="Ascensão - Reino Unido">Ascensão - Reino Unido</option>
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
          <option value="Bermudas - Reino Unido">Bermudas - Reino Unido</option>
          <option value="Bioko - Guiné Equatorial">Bioko - Guiné Equatorial</option>
          <option value="Bolívia">Bolívia</option>
          <option value="Bósnia-Herzegóvina">Bósnia-Herzegóvina</option>
          <option value="Botsuana">Botsuana</option>
          <option value="Brunei">Brunei</option>
          <option value="Bulgária">Bulgária</option>
          <option value="Burkina Fasso">Burkina Fasso</option>
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
          <option value="Cidade do Vaticano">Cidade do Vaticano</option>
          <option value="Cingapura">Cingapura</option>
          <option value="Colômbia">Colômbia</option>
          <option value="Congo">Congo</option>
          <option value="Coréia do Norte">Coréia do Norte</option>
          <option value="Coréia do Sul">Coréia do Sul</option>
          <option value="Córsega - França">Córsega - França</option>
          <option value="Costa do Marfim">Costa do Marfim</option>
          <option value="Costa Rica">Costa Rica</option>
          <option value="Creta - Grécia">Creta - Grécia</option>
          <option value="Croácia">Croácia</option>
          <option value="Cuba">Cuba</option>
          <option value="Curaçao - Holanda">Curaçao - Holanda</option>
          <option value="Dinamarca">Dinamarca</option>
          <option value="Djibuti">Djibuti</option>
          <option value="Dominica">Dominica</option>
          <option value="Egito">Egito</option>
          <option value="El Salvador">El Salvador</option>
          <option value="Emirado Árabes Unidos">Emirado Árabes Unidos</option>
          <option value="Equador">Equador</option>
          <option value="Eritréia">Eritréia</option>
          <option value="Eslováquia">Eslováquia</option>
          <option value="Eslovênia">Eslovênia</option>
          <option value="Espanha">Espanha</option>
          <option value="Estados Unidos">Estados Unidos</option>
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
          <option value="Gibraltar - Reino Unido">Gibraltar - Reino Unido</option>
          <option value="Granada">Granada</option>
          <option value="Grécia">Grécia</option>
          <option value="Groenlândia - Dinamarca">Groenlândia - Dinamarca</option>
          <option value="Guadalupe - França">Guadalupe - França</option>
          <option val ???
?a?º?ue="Guam - Estados Unidos">Guam - Estados Unidos</option>
          <option value="Guatemala">Guatemala</option>
          <option value="Guiana">Guiana</option>
          <option value="Guiana Francesa">Guiana Francesa</option>
          <option value="Guiné">Guiné</option>
          <option value="Guiné Equatorial">Guiné Equatorial</option>
          <option value="Guiné-Bissau">Guiné-Bissau</option>
          <option value="Haiti">Haiti</option>
          <option value="Holanda">Holanda</option>
          <option value="Honduras">Honduras</option>
          <option value="Hong Kong">Hong Kong</option>
          <option value="Hungria">Hungria</option>
          <option value="Iêmen">Iêmen</option>
          <option value="IIhas Virgens - Estados Unidos">IIhas Virgens - Estados 
          Unidos</option>
          <option value="Ilha de Man - Reino Unido">Ilha de Man - Reino Unido</option>
          <option value="Ilha Natal - Austrália">Ilha Natal - Austrália</option>
          <option value="Ilha Norfolk - Austrália">Ilha Norfolk - Austrália</option>
          <option value="Ilha Pitcairn - Reino Unido">Ilha Pitcairn - Reino Unido</option>
          <option value="Ilha Wrangel - Rússia">Ilha Wrangel - Rússia</option>
          <option value="Ilhas Aleutas - Estados Unidos">Ilhas Aleutas - Estados 
          Unidos</option>
          <option value="Ilhas Canárias - Espanha">Ilhas Canárias - Espanha</option>
          <option value="Ilhas Cayman - Reino Unido">Ilhas Cayman - Reino Unido</option>
          <option value="Ilhas Comores">Ilhas Comores</option>
          <option value="Ilhas Cook - Nova Zelândia">Ilhas Cook - Nova Zelândia</option>
          <option value="Ilhas do Canal - Reino Unido">Ilhas do Canal - Reino 
          Unido</option>
          <option value="Ilhas Salomão">Ilhas Salomão</option>
          <option value="Ilhas Seychelles">Ilhas Seychelles</option>
          <option value="Ilhas Tokelau - Nova Zelândia">Ilhas Tokelau - Nova Zelândia</option>
          <option value="Ilhas Turks e Caicos - Reino Unido">Ilhas Turks e Caicos 
          - Reino Unido</option>
          <option value="Ilhas Virgens - Reino Unido">Ilhas Virgens - Reino Unido</option>
          <option value="Ilhas Wallis e Futuna - França">Ilhas Wallis e Futuna 
          - França</option>
          <option value="Ilhsa Cocos - Austrália">Ilhsa Cocos - Austrália</option>
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
          <option value="Jan Mayen - Noruega">Jan Mayen - Noruega</option>
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
          <option value="Macau - Portugal">Macau - Portugal</option>
          <option value="Macedônia">Macedônia</option>
          <option value="Madagascar">Madagascar</option>
          <option value="Madeira - Portugal">Madeira - Portugal</option>
          <option value="Malásia">Malásia</option>
          <option value="Malaui">Malaui</option>
          <option value="Maldivas">Maldivas</option>
          <option value="Mali">Mali</option>
          <option value="Malta">Malta</option>
          <option value="Marrocos">Marrocos</option>
          <option value="Martinica - França">Martinica - França</option>
          <option value="Maurício - Reino Unido">Maurício - Reino Unido</option>
          <option value="Mauritânia">Mauritânia</option>
          <option value="México">México</option>
          <option value="Micronésia">Micronésia</option>
          <option value="Moçambique">Moçambique</option>
          <option value="Moldova">Moldova</option>
          <option value="Mônaco">Mônaco</option>
          <option value="Mongólia">Mongólia</option>
          <option value="MontSerrat - Reino Unido">MontSerrat - Reino Unido</option>
          <option value="Myanma">Myanma</option>
          <option value="Namíbia">Namíbia</option>
          <option value="Nauru">Nauru</option>
          <option value="Nepal">Nepal</option>
          <option v ???
?a?º?alue="Nicarágua">Nicarágua</option>
          <option value="Níger">Níger</option>
          <option value="Nigéria">Nigéria</option>
          <option value="Niue">Niue</option>
          <option value="Noruega">Noruega</option>
          <option value="Nova Bretanha - Papua-Nova Guiné">Nova Bretanha - Papua-Nova 
          Guiné</option>
          <option value="Nova Caledônia - França">Nova Caledônia - França</option>
          <option value="Nova Zelândia">Nova Zelândia</option>
          <option value="Omã">Omã</option>
          <option value="Palau - Estados Unidos">Palau - Estados Unidos</option>
          <option value="Palestina">Palestina</option>
          <option value="Panamá">Panamá</option>
          <option value="Papua-Nova Guiné">Papua-Nova Guiné</option>
          <option value="Paquistão">Paquistão</option>
          <option value="Paraguai">Paraguai</option>
          <option value="Peru">Peru</option>
          <option value="Polinésia Francesa">Polinésia Francesa</option>
          <option value="Polônia">Polônia</option>
          <option value="Porto Rico">Porto Rico</option>
          <option value="Portugal">Portugal</option>
          <option value="Qatar">Qatar</option>
          <option value="Quênia">Quênia</option>
          <option value="Quirguistão">Quirguistão</option>
          <option value="Reino Unido">Reino Unido</option>
          <option value="República Centro-Africana">República Centro-Africana</option>
          <option value="República Dominicana">República Dominicana</option>
          <option value="República Tcheca">República Tcheca</option>
          <option value="Romênia">Romênia</option>
          <option value="Ruanda">Ruanda</option>
          <option value="Rússia">Rússia</option>
          <option value="Samoa Ocidental">Samoa Ocidental</option>
          <option value="San Marino">San Marino</option>
          <option value="Santa Helena - Reino Unido">Santa Helena - Reino Unido</option>
          <option value="Santa Lúcia">Santa Lúcia</option>
          <option value="São Cristovão e Névis">São Cristovão e Névis</option>
          <option value="São Tomé e Príncipe">São Tomé e Príncipe</option>
          <option value="São Vicente e Granadinas">São Vicente e Granadinas</option>
          <option value="Sardenha - Itália">Sardenha - Itália</option>
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
          <option value="Terra de Francisco José - Rússia">Terra de Francisco 
          José - Rússia</option>
          <option value="Togo">Togo</option>
          <option value="Tonga">Tonga</option>
          <option value="Trinidad e Tobago">Trinidad e Tobago</option>
          <option value="Tristão da Cunha - Reino Unido">Tristão da Cunha - Reino 
          Unido</option>
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
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">E-mail:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="email" value="<%=rsProfile("email")%>" size=32>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Telefone:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="telefone" value="<%=rsProfile("telefone")%>" size=24>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Celular:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input type="text" name="celular" value="<%=rsProfile("celular")%>" size=24>
        </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Forma&ccedil;&atilde;o 
        Acad&ecirc;mica</em></strong></font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">N&iacute;vel: 
        <select name="nivel" value="<%=rsProfile("nivel")%>">
          <option value="Ensino Médio" 
                                selected>Ensino médio</option>
          <option 
                                value="Superior">Superior</option>
          <option value="Pós Graduação">Pós Graduação</option>
          <option 
                                value="Mestrado">Mestrado</option>
          <option 
                                value="Doutorado">Doutorado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Status: 
        <select name="status_" value="<%=rsProfile("status_")%>">
          <option 
                                value="Concluído" selected>Concluido</option>
          <option 
                                value="Trancado">Trancado</option>
          <option 
                                value="Suspenso">Suspenso</option>
          <option value="Em andamento">Em andamento</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Institui&ccedil;&atilde;o: 
        <input type="text" name="inst" value="<%=rsProfile("inst")%>" size=34>
        </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">N&iacute;vel: 
        <select name="nivel2" value="<%=rsProfile("nivel2")%>">
          <option value="Ensino Médio" 
                                selected>Ensino médio</option>
          <option 
                                value="Superior">Superior</option>
          <option value="Pós Graduação">Pós Graduação</option>
          <option 
                                value="Mestrado">Mestrado</option>
          <option 
                                value="Doutorado">Doutorado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Status: 
        <select name="status2" value="<%=rsProfile("status2")%>">
          <option 
                                value="Concluído" selected>Concluido</option>
          <option 
                                value="Trancado">Trancado</option>
          <option 
                                value="Suspenso">Suspenso</option>
          <option value="Em andamento">Em andamento</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Institui&ccedil;&atilde;o: 
        <input type="text" name="inst2" value="<%=rsProfile("inst2")%>" size=34>
        </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">N&iacute;vel: 
        <select name="nivel3" value="<%=rsProfile("nivel3")%>">
          <option value="Ensino Médio" 
                                selected>Ensino médio</option>
          <option 
                                value="Superior">Superior</option>
          <option value="Pós Graduação">Pós Graduação</option>
          <option 
                                value="Mestrado">Mestrado</option>
          <option 
                                value="Doutorado">Doutorado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Status: 
        <select name="status3" value="<%=rsProfile("status3")%>">
          <option 
                                value="Concluído" selected>Concluido</option>
          <option 
                                value="Trancado">Trancado</option>
          <option 
                                value="Suspenso">Suspenso</option>
          <option value="Em andamento">Em andamento</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Institui&ccedil;&atilde;o: 
        <input type="text" name="inst3" value="<%=rsProfile("inst3")%>" size=34>
        </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Cursos 
        Realizados</em></strong></font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        do curso: 
        <input type="text" name="nomecurso" value="<%=rsProfile("nomecurso")%>" size=30>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Entidade: 
        <input type="text" name="entidadecurso" value="<%=rsProfile("entidadecurso")%>" size=34>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data 
        do Curso: 
        <input type="text" name="datacurso" value="<%=rsProfile("datacurso")%>" size=16>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Carga 
        Hor&aacute;ria: 
        <input type="text" name="cargacurso" value="<%=rsProfile("cargacurso")%>" size=16>
        </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        do curso: 
        <input type="text" name="nomecurso2" value="<%=rsProfile("nomecurso2")%>" size=30>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Entidade: 
        <input type="text" name="entidadecurso2" value="<%=rsProfile("entidadecurso2")%>" size=34>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data 
        do Curso: 
        <input type="text" name="datacurso2" value="<%=rsProfile("datacurso2")%>" size=16>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Carga 
        Hor&aacute;ria: 
        <input type="text" name="cargacurso2" value="<%=rsProfile("cargacurso2")%>" size=16>
        </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        do curso: 
        <input type="text" name="nomecurso3" value="<%=rsProfile("nomecurso3")%>" size=30>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Entidade: 
        <input type="text" name="entidadecurso3" value="<%=rsProfile("entidadecurso3")%>" size=34>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data 
        do Curso: 
        <input type="text" name="datacurso3" value="<%=rsProfile("datacurso3")%>" size=16>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Carga 
        Hor&aacute;ria: 
        <input type="text" name="cargacurso3" value="<%=rsProfile("cargacurso3")%>" size=16>
        </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>&Iacute;diomas</em></strong></font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif"><b> 
        <input type="radio" name="ingles" value="Inglês">
        </b>Ingl&ecirc;s - 
        <select name="inglesc" value="<%=rsProfile("inglesc")%>">
          <option value="Básico" 
                                selected>básico</option>
          <option 
                                value="Intermediário">intermediário</option>
          <option 
                                value="Avançado">avançado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif"><b> 
        <input type="radio" name="espanhol" value="Espanhol">
        </b>Espanhol - 
        <select name="espanholc" value="<%=rsProfile("espanholc")%>">
          <option value="Básico" 
                                selected>básico</option>
          <option 
                                value="Intermediário">intermediário</option>
          <option 
                                value="Avançado">avançado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif"><b> 
        <input type="radio" name="italiano" value="Italiano">
        </b>Italiano - 
        <select name="italianoc" value="<%=rsProfile("italianoc")%>">
          <option value="Básico" 
                                selected>básico</option>
          <option 
                                value="Intermediário">intermediário</option>
          <option 
                                value="Avançado">avançado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif"><b> 
        <input type="radio" name="alemao" value="Alemão">
        </b>Alem&atilde;o - 
        <select name="alemaoc" value="<%=rsProfile("alemaoc")%>">
          <option value="Básico" 
                                selected>básico</option>
          <option 
                                value="Intermediário">intermediário</option>
          <option 
                                value="Avançado">avançado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Outro 
        &Iacute;dioma: 
        <input type="text" name="outroidioma" value="<%=rsProfile("outroidioma")%>" size=16>
        - 
        <select name="outroidiomac" value="<%=rsProfile("outroidiomac")%>">
          <option value="Básico" 
                                selected>básico</option>
          <option 
                                value="Intermediário">intermediário</option>
          <option 
                                value="Avançado">avançado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Conhecimentos 
        em Inform&aacute;tica</em></strong></font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif"><b> 
        <input type="radio" name="editort" value="Editor de Texto">
        </b>Editor de Texto - 
        <select name="editortc" value="<%=rsProfile("editortc")%>">
          <option value="Básico" 
                                selected>básico</option>
          <option 
                                value="Intermediário">intermediário</option>
          <option 
                                value="Avançado">avançado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif"><b> 
        <input type="radio" name="planilha" value="Planilha">
        </b> Planilhas Eletr&ocirc;nicas - 
        <select name="planilhac" value="<%=rsProfile("planilhac")%>">
          <option value="Básico" 
                                selected>básico</option>
          <option 
                                value="Intermediário">intermediário</option>
          <option 
                                value="Avançado">avançado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif"><b> 
        <input type="radio" name="programas" value="Programas">
        </b>Programas de Apresenta&ccedil;&atilde;o - 
        <select name="programasc" value="<%=rsProfile("programasc")%>">
          <option value="Básico" 
                                selected>básico</option>
          <option 
                                value="Intermediário">intermediário</option>
          <option 
                                value="Avançado">avançado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif"><b> 
        <input type="radio" name="conhecimento" value="Conhecimento">
        </b>Conhecimento em Internet - 
        <select name="conhecimentoc" value="<%=rsProfile("conhecimentoc")%>">
          <option value="Básico" 
                                selected>básico</option>
          <option 
                                value="Intermediário">intermediário</option>
          <option 
                                value="Avançado">avançado</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Outros 
          conhecimerntos na &aacute;rea:</font></p>
        <p><font color="#000000"><b><font color="#000000"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
          <textarea name="infoutros" value="<%=rsProfile("infoutros")%>" cols="50" rows="10"></textarea>
          </font></b></font></b></font></p>
        <p><font color="#000000"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
          </font></b></font></p></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Experi&ecirc;ncia 
        Profissional</em></strong></font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        da Empresa: 
        <input type="text" name="nomeempresa" value="<%=rsProfile("nomeempresa")%>" size=34>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cargo: 
        <input type="text" name="cargoempresa" value="<%=rsProfile("cargoempresa")%>" size=20>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cidade: 
        <input type="text" name="cidadeemp" value="<%=rsProfile("cidadeemp")%>" size=30>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Estado: 
        <select name="estadoemp" value="<%=rsProfile("estadoemp")%>">
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
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Pa&iacute;s: 
        <select name="paisemp" value="<%=rsProfile("paisemp")%>">
          <option value="Brasil">Brasil</option>
          <option value="Afeganistão">Afeganistão</option>
          <option value="África do Sul">África do Sul</option>
          <option value="Aland - Finlândia">Aland - Finlândia</option>
          <option value="Albânia">Albânia</option>
          <option value="Alemanha">Alemanha</option>
          <option value="Andorra">Andorra</option>
          <option value="Angola">Angola</option>
          <option value="Anguilla - Reino Unido">Anguilla - Reino Unido</option>
          <option value="Antártida">Antártida</option>
          <option value="Antígua e Barbuda">Antígua e Barbuda</option>
          <option value="Antilhas Holandesa">Antilhas Holandesas</option>
          <option value="Arábia Saudita">Arábia Saudita</option>
          <option value="Argélia">Argélia</option>
          <option value="Argentina">Argentina</option>
          <option value="Armênia">Armênia</option>
          <option value="Aruba - Holanda">Aruba - Holanda</option>
          <option value="Ascensão - Reino Unido">Ascensão - Reino Unido</option>
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
          <option value="Bermudas - Reino Unido">Bermudas - Reino Unido</option>
          <option value="Bioko - Guiné Equatorial">Bioko - Guiné Equatorial</option>
          <option value="Bolívia">Bolívia</option>
          <option value="Bósnia-Herzegóvina">Bósnia-Herzegóvina</option>
          <option value="Botsuana">Botsuana</option>
          <option value="Brunei">Brunei</option>
          <option value="Bulgária">Bulgária</option>
          <option value="Burkina Fasso">Burkina Fasso</option>
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
          <option value="Cidade do Vaticano">Cidade do Vaticano</option>
          <option value="Cingapura">Cingapura</option>
          <option value="Colômbia">Colômbia</option>
          <option value="Congo">Congo</option>
          <option value="Coréia do Norte">Coréia do Norte</option>
          <option value="Coréia do Sul">Coréia do Sul</option>
          <option value="Córsega - França">Córsega - França</option>
          <option value="Costa do Marfim">Costa do Marfim</option>
          <option value="Costa Rica">Costa Rica</option>
          <option value="Creta - Grécia">Creta - Grécia</option>
          <option value="Croácia">Croácia</option>
          <option value="Cuba">Cuba</option>
          <option value="Curaçao - Holanda">Curaçao - Holanda</option>
          <option value="Dinamarca">Dinamarca</option>
          <option value="Djibuti">Djibuti</option>
          <option value="Dominica">Dominica</option>
          <option value="Egito">Egito</option>
          <option value="El Salvador">El Salvador</option>
          <option value="Emirado Árabes Unidos">Emirado Árabes Unidos</option>
          <option value="Equador">Equador</option>
          <option value="Eritréia">Eritréia</option>
          <option value="Eslováquia">Eslováquia</option>
          <option value="Eslovênia">Eslovênia</option>
          <option value="Espanha">Espanha</option>
          <option value="Estados Unidos">Estados Unidos</option>
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
          <option value="Gibraltar - Reino Unido">Gibraltar - Reino Unido</option>
          <option value="Granada">Granada</option>
          <option value="Grécia">Grécia</option>
          <option value="Groenlândia - Dinamarca">Groenlândia - Dinamarca</option>
          <option value="Guadalupe - França">Guadalupe - França</option>
          <option val ???
?a?º?ue="Guam - Estados Unidos">Guam - Estados Unidos</option>
          <option value="Guatemala">Guatemala</option>
          <option value="Guiana">Guiana</option>
          <option value="Guiana Francesa">Guiana Francesa</option>
          <option value="Guiné">Guiné</option>
          <option value="Guiné Equatorial">Guiné Equatorial</option>
          <option value="Guiné-Bissau">Guiné-Bissau</option>
          <option value="Haiti">Haiti</option>
          <option value="Holanda">Holanda</option>
          <option value="Honduras">Honduras</option>
          <option value="Hong Kong">Hong Kong</option>
          <option value="Hungria">Hungria</option>
          <option value="Iêmen">Iêmen</option>
          <option value="IIhas Virgens - Estados Unidos">IIhas Virgens - Estados 
          Unidos</option>
          <option value="Ilha de Man - Reino Unido">Ilha de Man - Reino Unido</option>
          <option value="Ilha Natal - Austrália">Ilha Natal - Austrália</option>
          <option value="Ilha Norfolk - Austrália">Ilha Norfolk - Austrália</option>
          <option value="Ilha Pitcairn - Reino Unido">Ilha Pitcairn - Reino Unido</option>
          <option value="Ilha Wrangel - Rússia">Ilha Wrangel - Rússia</option>
          <option value="Ilhas Aleutas - Estados Unidos">Ilhas Aleutas - Estados 
          Unidos</option>
          <option value="Ilhas Canárias - Espanha">Ilhas Canárias - Espanha</option>
          <option value="Ilhas Cayman - Reino Unido">Ilhas Cayman - Reino Unido</option>
          <option value="Ilhas Comores">Ilhas Comores</option>
          <option value="Ilhas Cook - Nova Zelândia">Ilhas Cook - Nova Zelândia</option>
          <option value="Ilhas do Canal - Reino Unido">Ilhas do Canal - Reino 
          Unido</option>
          <option value="Ilhas Salomão">Ilhas Salomão</option>
          <option value="Ilhas Seychelles">Ilhas Seychelles</option>
          <option value="Ilhas Tokelau - Nova Zelândia">Ilhas Tokelau - Nova Zelândia</option>
          <option value="Ilhas Turks e Caicos - Reino Unido">Ilhas Turks e Caicos 
          - Reino Unido</option>
          <option value="Ilhas Virgens - Reino Unido">Ilhas Virgens - Reino Unido</option>
          <option value="Ilhas Wallis e Futuna - França">Ilhas Wallis e Futuna 
          - França</option>
          <option value="Ilhsa Cocos - Austrália">Ilhsa Cocos - Austrália</option>
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
          <option value="Jan Mayen - Noruega">Jan Mayen - Noruega</option>
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
          <option value="Macau - Portugal">Macau - Portugal</option>
          <option value="Macedônia">Macedônia</option>
          <option value="Madagascar">Madagascar</option>
          <option value="Madeira - Portugal">Madeira - Portugal</option>
          <option value="Malásia">Malásia</option>
          <option value="Malaui">Malaui</option>
          <option value="Maldivas">Maldivas</option>
          <option value="Mali">Mali</option>
          <option value="Malta">Malta</option>
          <option value="Marrocos">Marrocos</option>
          <option value="Martinica - França">Martinica - França</option>
          <option value="Maurício - Reino Unido">Maurício - Reino Unido</option>
          <option value="Mauritânia">Mauritânia</option>
          <option value="México">México</option>
          <option value="Micronésia">Micronésia</option>
          <option value="Moçambique">Moçambique</option>
          <option value="Moldova">Moldova</option>
          <option value="Mônaco">Mônaco</option>
          <option value="Mongólia">Mongólia</option>
          <option value="MontSerrat - Reino Unido">MontSerrat - Reino Unido</option>
          <option value="Myanma">Myanma</option>
          <option value="Namíbia">Namíbia</option>
          <option value="Nauru">Nauru</option>
          <option value="Nepal">Nepal</option>
          <option v ???
?a?º?alue="Nicarágua">Nicarágua</option>
          <option value="Níger">Níger</option>
          <option value="Nigéria">Nigéria</option>
          <option value="Niue">Niue</option>
          <option value="Noruega">Noruega</option>
          <option value="Nova Bretanha - Papua-Nova Guiné">Nova Bretanha - Papua-Nova 
          Guiné</option>
          <option value="Nova Caledônia - França">Nova Caledônia - França</option>
          <option value="Nova Zelândia">Nova Zelândia</option>
          <option value="Omã">Omã</option>
          <option value="Palau - Estados Unidos">Palau - Estados Unidos</option>
          <option value="Palestina">Palestina</option>
          <option value="Panamá">Panamá</option>
          <option value="Papua-Nova Guiné">Papua-Nova Guiné</option>
          <option value="Paquistão">Paquistão</option>
          <option value="Paraguai">Paraguai</option>
          <option value="Peru">Peru</option>
          <option value="Polinésia Francesa">Polinésia Francesa</option>
          <option value="Polônia">Polônia</option>
          <option value="Porto Rico">Porto Rico</option>
          <option value="Portugal">Portugal</option>
          <option value="Qatar">Qatar</option>
          <option value="Quênia">Quênia</option>
          <option value="Quirguistão">Quirguistão</option>
          <option value="Reino Unido">Reino Unido</option>
          <option value="República Centro-Africana">República Centro-Africana</option>
          <option value="República Dominicana">República Dominicana</option>
          <option value="República Tcheca">República Tcheca</option>
          <option value="Romênia">Romênia</option>
          <option value="Ruanda">Ruanda</option>
          <option value="Rússia">Rússia</option>
          <option value="Samoa Ocidental">Samoa Ocidental</option>
          <option value="San Marino">San Marino</option>
          <option value="Santa Helena - Reino Unido">Santa Helena - Reino Unido</option>
          <option value="Santa Lúcia">Santa Lúcia</option>
          <option value="São Cristovão e Névis">São Cristovão e Névis</option>
          <option value="São Tomé e Príncipe">São Tomé e Príncipe</option>
          <option value="São Vicente e Granadinas">São Vicente e Granadinas</option>
          <option value="Sardenha - Itália">Sardenha - Itália</option>
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
          <option value="Terra de Francisco José - Rússia">Terra de Francisco 
          José - Rússia</option>
          <option value="Togo">Togo</option>
          <option value="Tonga">Tonga</option>
          <option value="Trinidad e Tobago">Trinidad e Tobago</option>
          <option value="Tristão da Cunha - Reino Unido">Tristão da Cunha - Reino 
          Unido</option>
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
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        da Empresa: 
        <input type="text" name="nomeempresa2" value="<%=rsProfile("nomeempresa2")%>" size=34>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cargo: 
        <input type="text" name="cargoempresa2" value="<%=rsProfile("cargoempresa2")%>" size=20>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cidade: 
        <input type="text" name="cidadeemp2" value="<%=rsProfile("cidadeemp2")%>" size=30>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Estado: 
        <select name="estadoemp2" value="<%=rsProfile("estadoemp2")%>">
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
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Pa&iacute;s: 
        <select name="paisemp2" value="<%=rsProfile("paisemp2")%>">
          <option value="Brasil">Brasil</option>
          <option value="Afeganistão">Afeganistão</option>
          <option value="África do Sul">África do Sul</option>
          <option value="Aland - Finlândia">Aland - Finlândia</option>
          <option value="Albânia">Albânia</option>
          <option value="Alemanha">Alemanha</option>
          <option value="Andorra">Andorra</option>
          <option value="Angola">Angola</option>
          <option value="Anguilla - Reino Unido">Anguilla - Reino Unido</option>
          <option value="Antártida">Antártida</option>
          <option value="Antígua e Barbuda">Antígua e Barbuda</option>
          <option value="Antilhas Holandesa">Antilhas Holandesas</option>
          <option value="Arábia Saudita">Arábia Saudita</option>
          <option value="Argélia">Argélia</option>
          <option value="Argentina">Argentina</option>
          <option value="Armênia">Armênia</option>
          <option value="Aruba - Holanda">Aruba - Holanda</option>
          <option value="Ascensão - Reino Unido">Ascensão - Reino Unido</option>
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
          <option value="Bermudas - Reino Unido">Bermudas - Reino Unido</option>
          <option value="Bioko - Guiné Equatorial">Bioko - Guiné Equatorial</option>
          <option value="Bolívia">Bolívia</option>
          <option value="Bósnia-Herzegóvina">Bósnia-Herzegóvina</option>
          <option value="Botsuana">Botsuana</option>
          <option value="Brunei">Brunei</option>
          <option value="Bulgária">Bulgária</option>
          <option value="Burkina Fasso">Burkina Fasso</option>
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
          <option value="Cidade do Vaticano">Cidade do Vaticano</option>
          <option value="Cingapura">Cingapura</option>
          <option value="Colômbia">Colômbia</option>
          <option value="Congo">Congo</option>
          <option value="Coréia do Norte">Coréia do Norte</option>
          <option value="Coréia do Sul">Coréia do Sul</option>
          <option value="Córsega - França">Córsega - França</option>
          <option value="Costa do Marfim">Costa do Marfim</option>
          <option value="Costa Rica">Costa Rica</option>
          <option value="Creta - Grécia">Creta - Grécia</option>
          <option value="Croácia">Croácia</option>
          <option value="Cuba">Cuba</option>
          <option value="Curaçao - Holanda">Curaçao - Holanda</option>
          <option value="Dinamarca">Dinamarca</option>
          <option value="Djibuti">Djibuti</option>
          <option value="Dominica">Dominica</option>
          <option value="Egito">Egito</option>
          <option value="El Salvador">El Salvador</option>
          <option value="Emirado Árabes Unidos">Emirado Árabes Unidos</option>
          <option value="Equador">Equador</option>
          <option value="Eritréia">Eritréia</option>
          <option value="Eslováquia">Eslováquia</option>
          <option value="Eslovênia">Eslovênia</option>
          <option value="Espanha">Espanha</option>
          <option value="Estados Unidos">Estados Unidos</option>
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
          <option value="Gibraltar - Reino Unido">Gibraltar - Reino Unido</option>
          <option value="Granada">Granada</option>
          <option value="Grécia">Grécia</option>
          <option value="Groenlândia - Dinamarca">Groenlândia - Dinamarca</option>
          <option value="Guadalupe - França">Guadalupe - França</option>
          <option val ???
?a?º?ue="Guam - Estados Unidos">Guam - Estados Unidos</option>
          <option value="Guatemala">Guatemala</option>
          <option value="Guiana">Guiana</option>
          <option value="Guiana Francesa">Guiana Francesa</option>
          <option value="Guiné">Guiné</option>
          <option value="Guiné Equatorial">Guiné Equatorial</option>
          <option value="Guiné-Bissau">Guiné-Bissau</option>
          <option value="Haiti">Haiti</option>
          <option value="Holanda">Holanda</option>
          <option value="Honduras">Honduras</option>
          <option value="Hong Kong">Hong Kong</option>
          <option value="Hungria">Hungria</option>
          <option value="Iêmen">Iêmen</option>
          <option value="IIhas Virgens - Estados Unidos">IIhas Virgens - Estados 
          Unidos</option>
          <option value="Ilha de Man - Reino Unido">Ilha de Man - Reino Unido</option>
          <option value="Ilha Natal - Austrália">Ilha Natal - Austrália</option>
          <option value="Ilha Norfolk - Austrália">Ilha Norfolk - Austrália</option>
          <option value="Ilha Pitcairn - Reino Unido">Ilha Pitcairn - Reino Unido</option>
          <option value="Ilha Wrangel - Rússia">Ilha Wrangel - Rússia</option>
          <option value="Ilhas Aleutas - Estados Unidos">Ilhas Aleutas - Estados 
          Unidos</option>
          <option value="Ilhas Canárias - Espanha">Ilhas Canárias - Espanha</option>
          <option value="Ilhas Cayman - Reino Unido">Ilhas Cayman - Reino Unido</option>
          <option value="Ilhas Comores">Ilhas Comores</option>
          <option value="Ilhas Cook - Nova Zelândia">Ilhas Cook - Nova Zelândia</option>
          <option value="Ilhas do Canal - Reino Unido">Ilhas do Canal - Reino 
          Unido</option>
          <option value="Ilhas Salomão">Ilhas Salomão</option>
          <option value="Ilhas Seychelles">Ilhas Seychelles</option>
          <option value="Ilhas Tokelau - Nova Zelândia">Ilhas Tokelau - Nova Zelândia</option>
          <option value="Ilhas Turks e Caicos - Reino Unido">Ilhas Turks e Caicos 
          - Reino Unido</option>
          <option value="Ilhas Virgens - Reino Unido">Ilhas Virgens - Reino Unido</option>
          <option value="Ilhas Wallis e Futuna - França">Ilhas Wallis e Futuna 
          - França</option>
          <option value="Ilhsa Cocos - Austrália">Ilhsa Cocos - Austrália</option>
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
          <option value="Jan Mayen - Noruega">Jan Mayen - Noruega</option>
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
          <option value="Macau - Portugal">Macau - Portugal</option>
          <option value="Macedônia">Macedônia</option>
          <option value="Madagascar">Madagascar</option>
          <option value="Madeira - Portugal">Madeira - Portugal</option>
          <option value="Malásia">Malásia</option>
          <option value="Malaui">Malaui</option>
          <option value="Maldivas">Maldivas</option>
          <option value="Mali">Mali</option>
          <option value="Malta">Malta</option>
          <option value="Marrocos">Marrocos</option>
          <option value="Martinica - França">Martinica - França</option>
          <option value="Maurício - Reino Unido">Maurício - Reino Unido</option>
          <option value="Mauritânia">Mauritânia</option>
          <option value="México">México</option>
          <option value="Micronésia">Micronésia</option>
          <option value="Moçambique">Moçambique</option>
          <option value="Moldova">Moldova</option>
          <option value="Mônaco">Mônaco</option>
          <option value="Mongólia">Mongólia</option>
          <option value="MontSerrat - Reino Unido">MontSerrat - Reino Unido</option>
          <option value="Myanma">Myanma</option>
          <option value="Namíbia">Namíbia</option>
          <option value="Nauru">Nauru</option>
          <option value="Nepal">Nepal</option>
          <option v ???
?a?º?alue="Nicarágua">Nicarágua</option>
          <option value="Níger">Níger</option>
          <option value="Nigéria">Nigéria</option>
          <option value="Niue">Niue</option>
          <option value="Noruega">Noruega</option>
          <option value="Nova Bretanha - Papua-Nova Guiné">Nova Bretanha - Papua-Nova 
          Guiné</option>
          <option value="Nova Caledônia - França">Nova Caledônia - França</option>
          <option value="Nova Zelândia">Nova Zelândia</option>
          <option value="Omã">Omã</option>
          <option value="Palau - Estados Unidos">Palau - Estados Unidos</option>
          <option value="Palestina">Palestina</option>
          <option value="Panamá">Panamá</option>
          <option value="Papua-Nova Guiné">Papua-Nova Guiné</option>
          <option value="Paquistão">Paquistão</option>
          <option value="Paraguai">Paraguai</option>
          <option value="Peru">Peru</option>
          <option value="Polinésia Francesa">Polinésia Francesa</option>
          <option value="Polônia">Polônia</option>
          <option value="Porto Rico">Porto Rico</option>
          <option value="Portugal">Portugal</option>
          <option value="Qatar">Qatar</option>
          <option value="Quênia">Quênia</option>
          <option value="Quirguistão">Quirguistão</option>
          <option value="Reino Unido">Reino Unido</option>
          <option value="República Centro-Africana">República Centro-Africana</option>
          <option value="República Dominicana">República Dominicana</option>
          <option value="República Tcheca">República Tcheca</option>
          <option value="Romênia">Romênia</option>
          <option value="Ruanda">Ruanda</option>
          <option value="Rússia">Rússia</option>
          <option value="Samoa Ocidental">Samoa Ocidental</option>
          <option value="San Marino">San Marino</option>
          <option value="Santa Helena - Reino Unido">Santa Helena - Reino Unido</option>
          <option value="Santa Lúcia">Santa Lúcia</option>
          <option value="São Cristovão e Névis">São Cristovão e Névis</option>
          <option value="São Tomé e Príncipe">São Tomé e Príncipe</option>
          <option value="São Vicente e Granadinas">São Vicente e Granadinas</option>
          <option value="Sardenha - Itália">Sardenha - Itália</option>
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
          <option value="Terra de Francisco José - Rússia">Terra de Francisco 
          José - Rússia</option>
          <option value="Togo">Togo</option>
          <option value="Tonga">Tonga</option>
          <option value="Trinidad e Tobago">Trinidad e Tobago</option>
          <option value="Tristão da Cunha - Reino Unido">Tristão da Cunha - Reino 
          Unido</option>
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
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        da Empresa: 
        <input type="text" name="nomeempresa3" value="<%=rsProfile("nomeempresa3")%>" size=34>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cargo: 
        <input type="text" name="cargoempresa3" value="<%=rsProfile("cargoempresa3")%>" size=20>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cidade: 
        <input type="text" name="cidadeemp3" value="<%=rsProfile("cidadeemp3")%>" size=30>
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Estado: 
        <select name="estadoemp3" value="<%=rsProfile("estadoemp3")%>">
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
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Pa&iacute;s: 
        <select name="paisemp3" value="<%=rsProfile("paisemp3")%>">
          <option value="Brasil">Brasil</option>
          <option value="Afeganistão">Afeganistão</option>
          <option value="África do Sul">África do Sul</option>
          <option value="Aland - Finlândia">Aland - Finlândia</option>
          <option value="Albânia">Albânia</option>
          <option value="Alemanha">Alemanha</option>
          <option value="Andorra">Andorra</option>
          <option value="Angola">Angola</option>
          <option value="Anguilla - Reino Unido">Anguilla - Reino Unido</option>
          <option value="Antártida">Antártida</option>
          <option value="Antígua e Barbuda">Antígua e Barbuda</option>
          <option value="Antilhas Holandesa">Antilhas Holandesas</option>
          <option value="Arábia Saudita">Arábia Saudita</option>
          <option value="Argélia">Argélia</option>
          <option value="Argentina">Argentina</option>
          <option value="Armênia">Armênia</option>
          <option value="Aruba - Holanda">Aruba - Holanda</option>
          <option value="Ascensão - Reino Unido">Ascensão - Reino Unido</option>
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
          <option value="Bermudas - Reino Unido">Bermudas - Reino Unido</option>
          <option value="Bioko - Guiné Equatorial">Bioko - Guiné Equatorial</option>
          <option value="Bolívia">Bolívia</option>
          <option value="Bósnia-Herzegóvina">Bósnia-Herzegóvina</option>
          <option value="Botsuana">Botsuana</option>
          <option value="Brunei">Brunei</option>
          <option value="Bulgária">Bulgária</option>
          <option value="Burkina Fasso">Burkina Fasso</option>
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
          <option value="Cidade do Vaticano">Cidade do Vaticano</option>
          <option value="Cingapura">Cingapura</option>
          <option value="Colômbia">Colômbia</option>
          <option value="Congo">Congo</option>
          <option value="Coréia do Norte">Coréia do Norte</option>
          <option value="Coréia do Sul">Coréia do Sul</option>
          <option value="Córsega - França">Córsega - França</option>
          <option value="Costa do Marfim">Costa do Marfim</option>
          <option value="Costa Rica">Costa Rica</option>
          <option value="Creta - Grécia">Creta - Grécia</option>
          <option value="Croácia">Croácia</option>
          <option value="Cuba">Cuba</option>
          <option value="Curaçao - Holanda">Curaçao - Holanda</option>
          <option value="Dinamarca">Dinamarca</option>
          <option value="Djibuti">Djibuti</option>
          <option value="Dominica">Dominica</option>
          <option value="Egito">Egito</option>
          <option value="El Salvador">El Salvador</option>
          <option value="Emirado Árabes Unidos">Emirado Árabes Unidos</option>
          <option value="Equador">Equador</option>
          <option value="Eritréia">Eritréia</option>
          <option value="Eslováquia">Eslováquia</option>
          <option value="Eslovênia">Eslovênia</option>
          <option value="Espanha">Espanha</option>
          <option value="Estados Unidos">Estados Unidos</option>
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
          <option value="Gibraltar - Reino Unido">Gibraltar - Reino Unido</option>
          <option value="Granada">Granada</option>
          <option value="Grécia">Grécia</option>
          <option value="Groenlândia - Dinamarca">Groenlândia - Dinamarca</option>
          <option value="Guadalupe - França">Guadalupe - França</option>
          <option val ???
?a?º?ue="Guam - Estados Unidos">Guam - Estados Unidos</option>
          <option value="Guatemala">Guatemala</option>
          <option value="Guiana">Guiana</option>
          <option value="Guiana Francesa">Guiana Francesa</option>
          <option value="Guiné">Guiné</option>
          <option value="Guiné Equatorial">Guiné Equatorial</option>
          <option value="Guiné-Bissau">Guiné-Bissau</option>
          <option value="Haiti">Haiti</option>
          <option value="Holanda">Holanda</option>
          <option value="Honduras">Honduras</option>
          <option value="Hong Kong">Hong Kong</option>
          <option value="Hungria">Hungria</option>
          <option value="Iêmen">Iêmen</option>
          <option value="IIhas Virgens - Estados Unidos">IIhas Virgens - Estados 
          Unidos</option>
          <option value="Ilha de Man - Reino Unido">Ilha de Man - Reino Unido</option>
          <option value="Ilha Natal - Austrália">Ilha Natal - Austrália</option>
          <option value="Ilha Norfolk - Austrália">Ilha Norfolk - Austrália</option>
          <option value="Ilha Pitcairn - Reino Unido">Ilha Pitcairn - Reino Unido</option>
          <option value="Ilha Wrangel - Rússia">Ilha Wrangel - Rússia</option>
          <option value="Ilhas Aleutas - Estados Unidos">Ilhas Aleutas - Estados 
          Unidos</option>
          <option value="Ilhas Canárias - Espanha">Ilhas Canárias - Espanha</option>
          <option value="Ilhas Cayman - Reino Unido">Ilhas Cayman - Reino Unido</option>
          <option value="Ilhas Comores">Ilhas Comores</option>
          <option value="Ilhas Cook - Nova Zelândia">Ilhas Cook - Nova Zelândia</option>
          <option value="Ilhas do Canal - Reino Unido">Ilhas do Canal - Reino 
          Unido</option>
          <option value="Ilhas Salomão">Ilhas Salomão</option>
          <option value="Ilhas Seychelles">Ilhas Seychelles</option>
          <option value="Ilhas Tokelau - Nova Zelândia">Ilhas Tokelau - Nova Zelândia</option>
          <option value="Ilhas Turks e Caicos - Reino Unido">Ilhas Turks e Caicos 
          - Reino Unido</option>
          <option value="Ilhas Virgens - Reino Unido">Ilhas Virgens - Reino Unido</option>
          <option value="Ilhas Wallis e Futuna - França">Ilhas Wallis e Futuna 
          - França</option>
          <option value="Ilhsa Cocos - Austrália">Ilhsa Cocos - Austrália</option>
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
          <option value="Jan Mayen - Noruega">Jan Mayen - Noruega</option>
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
          <option value="Macau - Portugal">Macau - Portugal</option>
          <option value="Macedônia">Macedônia</option>
          <option value="Madagascar">Madagascar</option>
          <option value="Madeira - Portugal">Madeira - Portugal</option>
          <option value="Malásia">Malásia</option>
          <option value="Malaui">Malaui</option>
          <option value="Maldivas">Maldivas</option>
          <option value="Mali">Mali</option>
          <option value="Malta">Malta</option>
          <option value="Marrocos">Marrocos</option>
          <option value="Martinica - França">Martinica - França</option>
          <option value="Maurício - Reino Unido">Maurício - Reino Unido</option>
          <option value="Mauritânia">Mauritânia</option>
          <option value="México">México</option>
          <option value="Micronésia">Micronésia</option>
          <option value="Moçambique">Moçambique</option>
          <option value="Moldova">Moldova</option>
          <option value="Mônaco">Mônaco</option>
          <option value="Mongólia">Mongólia</option>
          <option value="MontSerrat - Reino Unido">MontSerrat - Reino Unido</option>
          <option value="Myanma">Myanma</option>
          <option value="Namíbia">Namíbia</option>
          <option value="Nauru">Nauru</option>
          <option value="Nepal">Nepal</option>
          <option v ???
?a?º?alue="Nicarágua">Nicarágua</option>
          <option value="Níger">Níger</option>
          <option value="Nigéria">Nigéria</option>
          <option value="Niue">Niue</option>
          <option value="Noruega">Noruega</option>
          <option value="Nova Bretanha - Papua-Nova Guiné">Nova Bretanha - Papua-Nova 
          Guiné</option>
          <option value="Nova Caledônia - França">Nova Caledônia - França</option>
          <option value="Nova Zelândia">Nova Zelândia</option>
          <option value="Omã">Omã</option>
          <option value="Palau - Estados Unidos">Palau - Estados Unidos</option>
          <option value="Palestina">Palestina</option>
          <option value="Panamá">Panamá</option>
          <option value="Papua-Nova Guiné">Papua-Nova Guiné</option>
          <option value="Paquistão">Paquistão</option>
          <option value="Paraguai">Paraguai</option>
          <option value="Peru">Peru</option>
          <option value="Polinésia Francesa">Polinésia Francesa</option>
          <option value="Polônia">Polônia</option>
          <option value="Porto Rico">Porto Rico</option>
          <option value="Portugal">Portugal</option>
          <option value="Qatar">Qatar</option>
          <option value="Quênia">Quênia</option>
          <option value="Quirguistão">Quirguistão</option>
          <option value="Reino Unido">Reino Unido</option>
          <option value="República Centro-Africana">República Centro-Africana</option>
          <option value="República Dominicana">República Dominicana</option>
          <option value="República Tcheca">República Tcheca</option>
          <option value="Romênia">Romênia</option>
          <option value="Ruanda">Ruanda</option>
          <option value="Rússia">Rússia</option>
          <option value="Samoa Ocidental">Samoa Ocidental</option>
          <option value="San Marino">San Marino</option>
          <option value="Santa Helena - Reino Unido">Santa Helena - Reino Unido</option>
          <option value="Santa Lúcia">Santa Lúcia</option>
          <option value="São Cristovão e Névis">São Cristovão e Névis</option>
          <option value="São Tomé e Príncipe">São Tomé e Príncipe</option>
          <option value="São Vicente e Granadinas">São Vicente e Granadinas</option>
          <option value="Sardenha - Itália">Sardenha - Itália</option>
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
          <option value="Terra de Francisco José - Rússia">Terra de Francisco 
          José - Rússia</option>
          <option value="Togo">Togo</option>
          <option value="Tonga">Tonga</option>
          <option value="Trinidad e Tobago">Trinidad e Tobago</option>
          <option value="Tristão da Cunha - Reino Unido">Tristão da Cunha - Reino 
          Unido</option>
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
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Resumo 
        das Qualifica&ccedil;&otilde;es</em></strong></font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Fa&ccedil;a 
        aqui o seu resumo:</font></td>
    </tr>
    <tr> 
      <td><font color="#000000"><b><font color="#000000"><b><font color="#000000"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <textarea name="sugestao" value="<%=rsProfile("sugestao")%>" cols="50" rows="10"></textarea>
        </font></b></font></b></font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        </font></b></font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Usu&aacute;rio*: 
        <input type="text" name="username" value="<%=rsProfile("username")%>" size=20 maxlenght="12">
        *<b>entre 1 e 12 caracteres</b> </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size=1 face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <a href="changepwd.asp">MUDAR A SENHA</a> </font></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
        </font></td>
    </tr>
    <tr> 
      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <input name="submit" type="submit" value="ATUALIZAR">
        </font></td>
    </tr>
  </table>
  <p align="center">&nbsp;</p>
  <p>&nbsp;</p>
</form>
</body>
</html>

<%
rsProfile.close
set rsProfile = nothing
conn.close
set conn = nothing
%>

<%Function nologin()%>

<p align="center"><b>Voc&ecirc; precisa estar logado para mudar seu perfil.</b></p>

<p align="center"><b><a href="javascript:window.close()">Fechar esta janela</a></b></p>

</font>
</body>
</html>
<%Response.end
End Function%>