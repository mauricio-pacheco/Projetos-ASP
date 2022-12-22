<?

$host = 'localhost';
$banco = 'upload';
$usuario1 = 'dceurifw';
$senha = '123456';

$conexao = mysql_connect($host,$usuario1,$senha)or die('Não foi possivel efetuar a conexão');
mysql_select_db($banco);

?>
