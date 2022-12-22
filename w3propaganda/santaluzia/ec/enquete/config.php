<?php

# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
// altere aqui as configurações para o seu DB
$hostname_conexao = "localhost"; // host do seu db
$database_conexao = "santaluzia"; // nome do seu banco de dados
$username_conexao = "julio"; // usuários mysql
$password_conexao = "santa900"; // senha do seu usuário do mysqlse não tiver senha é só descomentar a linha
$conexao = mysql_pconnect($hostname_conexao, $username_conexao, $password_conexao) or trigger_error(mysql_error(),E_USER_ERROR); 

// não mexa aqui! só c vc saber o q vc está fazendo OK!
$host = $hostname_conexao;
$user = $username_conexao;
$pass = $password_conexao;
$db = $database_conexao;
?>