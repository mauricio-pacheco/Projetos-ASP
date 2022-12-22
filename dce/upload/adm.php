<?php

include "conecta.php";

$sql = mysql_query("SELECT * FROM cadastro ORDER BY codigo");
$contar = mysql_num_rows($sql); 
if ($contar < 1)  //Mostra se há algum registro na tabela, caso não houver, ele mostrará a mensagem abaixo
   {echo "<div align=center><br><font size=\"2\" face=\"Verdana, Arial, Helvetica, sans-serif\"><b>Não existe downloads cadastrados!</b></font></div>"; 
   }
else //Caso tiver resgistro na tabela, ele mostrará os registros. OBS: Você pode mudar o modo de exibir os registros
     //mais não mude nenhuma variável, a não ser que mude o script todo.
   {
while($n = mysql_fetch_array($sql))
   {
   ?>
   <title></title>
<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<p align="left"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
    <font size="1">T&iacute;tulo: <font color="#0000FF"><?php echo $n["gerente2"]; ?></font></font></font></p>
<p align="left"><font size="1"><a href="arquivos/<?php echo $n["arquivo_nome"]; ?>" target=_blank>DOWNLOAD DO ARQUIVO</a></font></p>
<p align="left"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Descri&ccedil;&atilde;o: <font color="#666666"><?php echo $n["dados"]; ?></font></font></p>
<p><font size="1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
    <a href="deleta_user.php?codigo=<?php echo $n["codigo"];?>&nome=<?php echo $n["razao"]; ?>" onClick="return confirm('Deseja deletar mesmo o download <?php echo $n["razao"]; ?>?');"><font face="Verdana, Arial, Helvetica, sans-serif">Deletar 
Arquivo</font></a></font></p>
<hr>
<font size="2" face="Verdana, Arial, Helvetica, sans-serif">
<?
  }
  }
 ?>
</font>
<p> <font size="2" face="Verdana, Arial, Helvetica, sans-serif">
  <? $sql = mysql_query("Select * from cadastro");
$sql = mysql_num_rows($sql); ?>
  <? if ($sql > 0) {?>
  Total de 
  <? if ($sql < 2) echo "download"; else echo "downloads"; ?>
  <? if ($sql < 2) echo "cadastrado"; else echo "cadastrados"; ?>
  : <strong><? echo $sql ?></strong> 
  <? } ?>
  </font></p>
