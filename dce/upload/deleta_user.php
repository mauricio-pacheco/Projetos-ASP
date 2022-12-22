<body text="#000000" link="#000000" vlink="#000000" alink="#000000">
<div align="center">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><a href="adm.php"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">VOLTAR 
    PARA A ADMINISTRA&Ccedil;&Atilde;O</font></a></p>
</div>
<?php
//Dud's Cadastro 1.0
//Criado por _Dudu_1533
//ecosta19@yahoo.com.br
//não tire os créditos, pois eles nem irão aparecer em sua página.
//Obrigado.
?>
<?
include "conecta.php";

$id = $_GET['codigo'];
$nome = $_GET['razao'];


$query = mysql_query("DELETE FROM cadastro WHERE codigo='$id'");
if ($query)  
{
echo "<div align=center><font size=\"2\" face=\"Verdana, Arial, Helvetica, sans-serif\">Download <strong>$razao</strong> deletado com sucesso!</font></div>";
}else{
echo "<div align=center><font size=\"2\" face=\"Verdana, Arial, Helvetica, sans-serif\">Não foi possível deletar o download.</font></div>";
}
?>