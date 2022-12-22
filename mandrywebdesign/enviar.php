<?
//pega as variaveis por POST
$nome      = $_POST["nome"];
$email     = $_POST["email"];
$assunto   = $_POST["assunto"];
$mensagem  = $_POST["mensagem"];

global $email; //função para validar a variável $email no script todo

$data      = date("d/m/y");                     //função para pegar a data de envio do e-mail
$ip        = $_SERVER['REMOTE_ADDR'];           //função para pegar o ip do usuário
$navegador = $_SERVER['HTTP_USER_AGENT'];       //função para pegar o navegador do visitante
$hora      = date("H:i");                       //para pegar a hora com a função date

//aqui envia o e-mail para você
mail ("mandry@brturbo.com",                       //email aonde o php vai enviar os dados do form
      "$assunto",
      "Nome: $nome\nMensagem: $mensagem\nData: $data\nIp: $ip\nNavegador: $navegador\nHora: $hora",
      "From: $email"
     );

//aqui são as configurações para enviar o e-mail para o visitante
$site   = "mandry@brturbo.com";                    //o e-mail que aparecerá na caixa postal do visitante
$titulo = "RE: E-mail Enviado";                  //titulo da mensagem enviada para o visitante
$msg    = "Sua mensagem foi enviada com sucesso...muito obrigado por visitar a Mandry Web Design!!!Logo iremos retornar a resposta...";

//aqui envia o e-mail de auto-resposta para o visitante
mail("$email",
     "$titulo",
     "$msg",
     "From: $site"
    );

?>
