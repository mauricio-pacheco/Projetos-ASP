<LINK href="crm.css" type=text/css rel=StyleSheet>
<html>
<style type="text/css">
<!--
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="expires" content="-1">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<title><%=config_titulo%></title>
<Style>
	a:link   {color="#000080";text-decoration:underline}
	a:visited{color:"#008080";text-decoration:underline}
	a:hover  {color:"red";text-decoration:underline}
.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.style3 {color: #434343}
</style>
<script language="JavaScript">
function valida() 
{
	erro = "";
	//Campos vazios
	if (document.form.loginu.value == "")
		erro = "* Login \n";
	if (document.form.senhau.value == "")
		erro = erro +"* Senha \n";
	if (document.form.senhau2.value == "")
		erro = erro +"* Repita sua senha \n";
	if (document.form.emailu.value == "")
		erro = erro +"* E-mail";
	if (erro != "") 
	{
		alert("Preencha os campos: \n" + erro);
		return false;
	}
	
	//Campos com valor errado
	if (((document.form.loginu.value.length <= 3) || (document.form.loginu.value.length > 20)))
		erro = "O login deve ter no mínimo 4 caracteres e no máximo 20. \n";
	if (((document.form.senhau.value.length <= 4) || (document.form.senhau.value.length > 20)))
		erro = erro + "A senha deve ter no mínimo 5 caracteres e no máximo 20.";
	if (erro != "") 
	{
		alert("Atenção: \n" + erro);
		return false;
	}
	
	//Senha
	if (document.form.senhau.value != document.form.senhau2.value)
	{
		alert("Senha inválida! \n As senhas informadas não são iguais.");
		return false;
	}
	
	//E-mail
	if (document.form.emailu.value.indexOf("@") == -1)
	{
		alert("E-mail inválido!");
		return false;
	}
return true;
}
</script>
<%
On error resume Next
Dim objConn, stringSQL, strConnection, id
id = Request.QueryString("id")
' Conectando com o banco de dados contato.mdb
Set objConn =  Server.CreateObject("ADODB.Connection")
Set objRS =  Server.CreateObject("ADODB.Connection")
objConn.Open "DBQ=" & Server.MapPath("dcebd/dcedata.mdb") & ";Driver={Microsoft Access Driver (*.mdb)}"
stringSQL = "SELECT * FROM artigos WHERE id = "&id
Set objRS = objConn.Execute(stringSQL)
'Deletando registro da tabela contato onde esta a id
if err <> 0 Then%>

</head>

<body bgColor="<%=config_corfundo%>" text="#000080" link="#000080"	aLink=red vLink="red">
<!-- #include file=cabecalho.asp -->
<font size="4">
<%else%>
</font><br>
<p align="center"><img src="dce.jpg" width="202" height="103"></p>
<p align="center" class="style1">LIBERAR ARTIGOS DO SISTEMA </p>
<p align="center" class="style1">VOC&Ecirc; TEM CERTEZA QUE DESEJA LIBERAR O SEGUINTE ARTIGO: </p>
<p align="center" class="style1"> <%=objRS("autor")%> - <%=objRS("assunto")%></p>
<p align="center" class="style1"><span class="style1"><%=objRS("mensagem")%></span></p>
<div align="center">
    <center>
    <table width="613" height="47" border="0" cellpadding="0" cellspacing="1" bordercolorlight="#888860" bordercolordark="#888860" bgcolor="#FFFFFF">
      <tr bgcolor="#FFFFFF"> 
        <td width="1088" height="45"> 
          <form method="post" action="altera_dados.asp" name="form" onSubmit="return valida()">
            <label>
              <label>
              <p>
                <label>
                <div align="center" class="style2">
                <div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">
                <select name="autoriza">
                  <option value="s" 
                                selected>Sim</option>
                  <option 
                                value="n">Não</option>
                </select>
                </font><span class="style3">SELECIONE PARA LIBERAR ARTIGO </span>
                  </div>
                </div>
                </label>
                <div align="center" class="style2"></div>
              </p>
              <div align="center">
                <p>
                  <input type="submit" name="Submit" value="LIBERAR ARTIGO">
                </p>
              </div>
            </label>
            <div align="center"></div>
        </form>          <p align="center">&nbsp;</p></td>
      </tr>
    </table>
    <p>&nbsp;</p></center>
</div>
  
<%end if%>
<br>
</body></html>


