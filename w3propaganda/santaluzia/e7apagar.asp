<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="br">
<head>
<title>Associa&ccedil;&atilde;o Moto Clube Trilheiros do Barril</title>
<meta name="description" content="Descrição">
<meta name="keywords" content="palavras chave">
<meta name="classification" content="Internet" />
<meta name="language" content="br" />
<meta name="rating" content="general" />
<meta name="distribution" content="global" />
<meta name="revisit-after" content="7 Dias" />
<META HTTP-EQUIV="Refresh" CONTENT="1;URL=e7.asp">
<meta name="robots" content="index, follow" />
<meta name="author" content="dnimports.com.br">
<meta name="robots" content="index, follow, all" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="e.ico" type="image/x-icon" />
<link rel="shortcut icon" href="e.ico" type="image/x-icon" />
<style type="text/css">
@import url("home_arquivos/barroide2.css");
</style>
<STYLE type=text/css>
.texto {
	FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Tahoma, Arial
}
.style5 {
	font-size: 9px
}
.style7 {
	font-size: 14px;
	font-family: Verdana;
	color: #ffffff;
}
.style8 {font-size: 14}
.style9 {color: #FFFFFF}
.style15 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
}
.style17 {color: #FFFFFF; font-size: 10px; }
.style19 {color: #FFFFFF; font-size: 14px; }
.style21 {color: #FFFFFF; font-size: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; }
body {
	background-color: #FFFFFF;
}
.style15 {
	font-size: 11px; font-family: Tahoma, Geneva, sans-serif;
}
.style2 {font-size: 10px}
</STYLE>
</HEAD>
<BODY>
                                  <table width="80%" border="0" align="left">
                                      <tr>
                                        <td width="685" class="style15"><% 
Dim objConn, strCaminho, rs, id, comando


id = request.querystring("id")
strCaminho = Server.MapPath("/santa900/santaluz.mdb")
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strCaminho & ";"


comando = "DELETE FROM logos WHERE id = "&id&"" 
objConn.execute(comando)

objConn.Close
Set objConn = Nothing

%>Logotipo apagado com sucesso!</td>
                                      </tr>
  </table>

</BODY>
</HTML>
