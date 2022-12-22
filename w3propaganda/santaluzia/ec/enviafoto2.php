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
.style15 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
}
body {
	background-color: #FFFFFF;
}
.style23 {color: #000000}
</STYLE>
<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
<SCRIPT src="home_arquivos/AC_RunActiveContent.js" 
type=text/javascript></SCRIPT>
</HEAD>
<BODY>
<form name="form1" action="enviafoto2.php" method="post" enctype="multipart/form-data" onSubmit="return validar(this)">
                                    <table width="80%" border="0" align="left">
                                      <tr>
                                        <td width="500"><span class="style23">
                                       <?
include "conexao.php";


$arquivo = isset($_FILES["foto"]) ? $_FILES["foto"] : FALSE;
$max_image_x = 640;
$max_image_y = 480;
$diretorio = 'abertura/';
if($arquivo)
{
    $tamanho = getimagesize($arquivo["tmp_name"]);
    ini_set ("max_execution_time", 3600); // uma hora
    require_once "funcoes.php";
    $err = FALSE;
    if(is_uploaded_file($arquivo['tmp_name']))
    {
        if(verifica_image($arquivo))
        {
            $tamanho = getimagesize($arquivo["tmp_name"]);
            $dimensiona = verifica_dimensao_image($arquivo, $max_image_x, $max_image_y);
            if($dimensiona != '')
            {
                if($dimensiona == 'altura')
                {
                        $auxImage = $max_image_x;
                        $max_image_x = $max_image_y;
                        $max_image_y = $auxImage;
                }
            }
            else
            {
                $max_image_x = $tamanho[0];
                $max_image_y = $tamanho[1];
            }
            
            $nome_foto  = ('frente.jpg');// nome único para foto
            $endFoto = $diretorio . $nome_foto;
            if(reduz_imagem($arquivo['tmp_name'], $max_image_x, $max_image_y, $endFoto))
            {
                $err = TRUE;
            }  
        }
    }
}
 
?>
                                        <span class="style15">FOTO ENVIADA  SUCESSO! ---------- <a href="enviafoto.php">ENVIAR OUTRA FOTO ?</a></span></span></td>
                                      </tr>
  </table>
                                    
</form>
</BODY>
</HTML>
