<% 
'AQUI CASO NAO ESTEJA LOGADO VAI PARA A PAGINA DE LOGIN 
if Session("entrada") <> "sim" then 
response.Redirect("gerenciar.asp") 
end if 
%> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<LINK 
href="home_arquivos/estilos.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Administra&ccedil;&atilde;o DCE URI FW</title>
<style type="text/css">
<!--
.style1 {
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
-->
</style>
</head>

<body>
<table width="100%" border="0">
  <tr>
    <td><div align="center" class="style1">
      <p><img src="dce.jpg" width="202" height="103"></p>
      <p>ADMINISTRA&Ccedil;&Atilde;O DCE URI FW </p>
    </div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center">
      <p class="style1"><a href="upload/index.php" target=centro>ADMINISTRAR DOWNLOADS</a> - <a href="noticias/texto.asp" target=centro>POSTAR NOT&Iacute;CIAS</a> - <a href="noticias/admin2.asp" target=centro>APAGAR NOT&Iacute;CIAS</a></p>
      <p class="style1"><a href="upload/adm.php" target=centro>APAGAR DOWNLOADS</a> - <a href="adminartigos.asp" target=centro>APAGAR ARTIGOS</a> - <a href="liberarartigos.asp" target=centro>LIBERAR ARTIGOS</a> - <a href="new/mailing_list/admin.htm" target=centro>ADMINISTRAR E-MAILS </a></p>
      <p class="style1"><a href="convenios/admin2.asp" target=centro>ADMINISTRAR CONV&Ecirc;NIOS </a>- <a href="patrocinio/admin2.asp" target=centro>ADMINISTRAR PATROCINADORES </a></p>
    </div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><iframe src="download/downloadadmin.asp" width="100%" height="800" name="centro" frameborder="0" marginheight="0" marginwidth="0" scrolling="yes"></iframe></td>
  </tr>
</table>
</body>
</html>
