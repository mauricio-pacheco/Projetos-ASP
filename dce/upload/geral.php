<LINK 
href="style.css" type=text/css rel=stylesheet>
<MARQUEE behavior= "scroll" align= "center" direction= "up" height="208" scrollamount= "1" scrolldelay= "80" onmouseover='this.stop()' onmouseout='this.start()'><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
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
<body bgcolor="#F4F4F4">
  <font size="1"><font color="#0000FF"><img src="anexo.gif" border="0">&nbsp;&nbsp;<a href="arquivos/<?php echo $n["arquivo_nome"]; ?>" target=_blank><?php echo $n["gerente2"]; ?></a><br></font></font></font><br><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
  <?
  }
  }
 ?>
  </font></p>
<p> <font size="1" face="Verdana, Arial, Helvetica, sans-serif">
  
 </font></marquee><? $sql = mysql_query("Select * from cadastro");
$sql = mysql_num_rows($sql); ?>
  <? if ($sql > 0) {?><? if ($sql < 2) echo ""; else echo ""; ?>
  <? if ($sql < 2) echo ""; else echo ""; ?>
  <? } ?>
