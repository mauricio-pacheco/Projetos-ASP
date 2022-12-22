<title>&Aacute;rea Restrita - B&aacute;sico Brasil</title>
<body bgcolor="#f5f5f5">
<?
//conecta com o db
include ("conectar.php");
$login = $_POST['login'];
$senha = $_POST['senha'];

//faz a confirmação de nome e senha no db
$logar = mysql_query("SELECT * FROM cadastro WHERE login='$login' AND senha='$senha'") or die("erro ao selecionar");

/*aqui depois de verificado redirecionamos a pagina secreta(caso nome e senha estarem corretos) ou senha
e apelido não conferem caso tais estiverem errados. Repare que há uma rotina para o valor inserido em senha não seja nulo. 
obs: Aonde esta escrito paginasecreta.php é aonde vc deve colocar a página para onde o script ira redirecionar*/
if (strlen($senha)< 1)
echo '<p align="center"><img src="area.jpg" width="264" height="86"><br><br><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Senha ou apelido não conferem</font><BR><br><a href="javascript:history.back(1);"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">TENTE NOVAMENTE</a></font></p>';
elseif (mysql_num_rows($logar)>0 ){
header("location:paginasecreta.php");
} else {
echo '<p align="center"><img src="area.jpg" width="264" height="86"><br><br><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Senha ou apelido não conferem</font><BR><br><a href="javascript:history.back(1);"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">TENTE NOVAMENTE</a></font></p>';
}
?>

