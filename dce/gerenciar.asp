<html> 
<head> 
    <title>senha acesso</title> 
	<LINK 
href="home_arquivos/estilos.css" type=text/css rel=stylesheet>
    <style type="text/css">
<!--
.style1 {
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
}
-->
    </style>
</head> 

<body> 
<SCRIPT> 
function acesso(){ 
    window.location = document.formsenha.senha.value + ".asp" 
} 
</SCRIPT> 

<div align="center">
    <p class="style1"><img src="dce.jpg" width="202" height="103"></p>
  <p class="style1">&Aacute;REA RESTRITA     </p>
</div>
<form action="gerenciar2.asp">
  <div align="center" class="style2">Login:
  <input class=busca type="text" name="login">
  <br>
</div>
<div align="center" class="style2">Senha:
  <input class=busca type="password" name="senha">
  <br>
    <input type="submit" class=botao value="Entrar">
</div>
</form>

</body> 
</html> 
