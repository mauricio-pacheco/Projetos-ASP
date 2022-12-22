<%
'Força o programador a declarar todas as variáveis, evitando erro de digitação no uso das variéveis
Option Explicit

'Não deixa informações no Cache
Response.Expires = 0

'Declaração das variáveis
Dim objConn, autoriza, id, strQuery, sql_query, RsQuery, campo, sql, autonum
Dim loginu, senhau, cidadeu, autor, assunto, estadou, emailu, assinaturau, codu, ObjRs

'Atrubuição dos valores as respectivas variáveis
id = Request.Form("id")
autoriza = Request.Form("autoriza")

'Cria o objeto RecordSet e atribui a variável 
Set objConn =  Server.CreateObject("ADODB.Connection")
'Abre a conexão com o banco de dados utilizando o Drive {Microsoft Access...
'(para utilizar outro, ex: Paradox é só substituir o Drive pelo do Paradox)
'(*.mdb) indica que o arquivo utiliza extensão mdb
objConn.Open "DBQ=" & Server.MapPath("dcebd/dcedata.mdb") & ";Driver={Microsoft Access Driver (*.mdb)}"

strQuery = "UPDATE artigos SET autoriza = '"&autoriza&"'"

Set ObjRs = objConn.Execute(strQuery)
'Fecha o Objeto de Conexão
objConn.close
'"APAGA" qualquer instancia que possa ter no objeto objRs e objConn
Set objRs = Nothing
Set objConn = Nothing 
%>
<LINK href="crm.css" type=text/css rel=StyleSheet>
<html>
<style type="text/css">
<!--
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
	color: #434343;
}
.style2 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #434343; }
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="expires" content="-1">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<title></title>
</head>

<body bgColor="#ffffff" text="#000080" link="#000080"	aLink=red vLink="red">
<br>
<p align="center"><img src="dce.jpg" width="202" height="103"></p>
<p align="center" class="style1">LIBERAR ARTIGOS DO SISTEMA </p>
<p align="center" class="style2">ARTIGO LIBERADO COM SUCESSO!</p>
<div align="center"> 
  <center>
  </center>
</div>
 <p align="center">&nbsp;</p>
<p><br>
</p>
</body>
</html>


