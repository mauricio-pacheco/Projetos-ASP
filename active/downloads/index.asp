<%
option explicit'must be declared

'setting buffering to true
response.buffer=true
'decleration
dim useraction
dim conn
dim rs
dim sql
dim dsn
dim DownNumber
dim sql3
dim sql2
dim uemail
dim subs
'----------------------

'get action from user
useraction=request("action")
select case useraction
case "save"
	Uemail=lcase(request.form("email"))
	subs=request.form("subs")
	dsn="DBQ=" & Server.Mappath("db/subs.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
	set conn=server.createobject("adodb.connection")
	set rs=server.createobject("adodb.recordset")
	sql = "select * from emails where emails='"&Uemail&"'"
	conn.open dsn
	rs.open sql,conn
	select case subs
	'in case someOne wants to join the list
	case "1"
		if rs.bof and rs.eof then
			sql2="insert into emails(emails) values('"&Uemail&"')"
			conn.execute(sql2)
			response.write "<script>alert('Você foi cadastrado com sucesso! Muito Obrigado pela visita!')</script>"
		else
			response.write "<script>alert('Você foi cadastrado')</script>"
		end if

	
	'in case someOne wants to unsubscribe
		case "0"
	if rs.bof and rs.eof then
			response.write "<script>alert('Você está registrado')</script>"
	else
			sql2="delete from emails where emails='"&Uemail&"'"
			conn.execute(sql2)
			response.write "<script>alert('Seu E-mail foi excluído')</script>"
	end if

		
		
	end select
rs.close
set rs=nothing

end select
%>
<HTML>
<HEAD>
<script>
function openwin()
{
	NewWindow =window.open("hebrew.htm","hebrew","width=500,height=200")
}
function submitit(){
var email=document.subform.email.value;
if (email==""){
alert("Digite seu E-mail")
document.subform.email.focus()
return false
	}
if (email.indexOf('@', 0) == -1 || email.indexOf('.', 0) == -1){ alert("E-mail inválido!");
		document.subform.email.focus()
		return false
		}
}

</script>
<style>
BODY
{
    BACKGROUND-COLOR: black;font-size:14px;font-family:Arial,Verdana;
}
a
{
color:blue;text-decoration:none;
}

a:hover
{
color:red;text-decoration:underline;
}

td
{
font-size:12px;font-family:Arial,Verdana;
}


.inputSubmit
{
font-size:7pt;
color:white;
background-color: black;
BORDER-BOTTOM: 1px solid;
BORDER-LEFT: 1px solid;
BORDER-RIGHT: 1px solid;
BORDER-TOP: 1px solid;
z-index:10;
}



</style>
<TITLE>Downloads Casa da Web</TITLE>
<LINK href="default.css" type=text/css rel=STYLESHEET>
</HEAD>
<BODY BGCOLOR=#FFFFFF>
<p align="center"> 
  <embed src="down.swf" width="350" height="40"></embed> </p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Aproveite 
  os downloads de utilit&aacute;rios para o seu PC na</font><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
  <font color="#FF9900">Casa da Web<font color="#FFFFFF">!</font></font></font></p>
<hr>
<p align="center"><img src="bitorrent.gif" width="130" height="60" border="1"></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="http://optusnet.dl.sourceforge.net/sourceforge/pingpong-abc/ABC-win32-v3.0.1b.exe" target=_blank>Cliente 
  Bitorrent ABC</a></font></p>
<p align="center"><font color="#00FF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Descri&ccedil;&atilde;o:</font></p>
<p align="center"><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Fa&ccedil;a 
  downloads de arquivos torrent com facilidade. Este cliente para torrent possui 
  uma interface bem amig&aacute;vel e com boas fun&ccedil;&otilde;es para facilitar 
  a vida de usu&aacute;rios menos experientes com os torrents. Possui pause, resume, 
  queue e stop. Como &eacute; baseado no Shadows Client, possui todas as melhorias 
  relativas e este &uacute;ltimo.</font></p>
<hr>
<p align="center"><img src="kazaa.jpg" width="120" height="62" border="1"></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="http://filesharingdownloads.com/p2pclients/kazaa_lite/klitekpp243b.exe" target=_blank>Kazaa 
  Lite</a></font></p>
<p align="center"><font color="#00FF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Descri&ccedil;&atilde;o:</font></p>
<p align="center"><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Kazaa 
  totalmente em portugu&ecirc;s. &Eacute; mais leve e conecta mais r&aacute;pido 
  que o Kazaa normal. Se voc&ecirc; usa muito o Kazaa, essa &eacute; uma excelente 
  alternativa.</font></p>
<hr>
<p align="center"><img src="codec.jpg" width="200" height="157" border="1"></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="http://download.betanews.com/download/1080441198/klmcodec134.exe" target=_blank>K-Lite 
  Mega Codec Pack 1.34</a></font></p>
<p align="center"><font color="#00FF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Descri&ccedil;&atilde;o:</font></p>
<p align="center"><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Mega 
  cole&ccedil;&atilde;o de codecs e ferramentas para visualiza&ccedil;&atilde;o 
  de v&iacute;deo. Inclui K-Lite Codec Pack 2.47 Full, QuickTime Alternative 1.45, 
  Real Alternative 1.38 e BSplayer 1.22.817.</font></p>
<hr>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><img src="scoop.JPG" width="144" height="108" border="1"></font></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="http://www.scoop.uaivip.com.br/scoop2004.exe" target=_blank>Scoop 
  Script</a></font></p>
<p align="center"><font color="#00FF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Descri&ccedil;&atilde;o:</font></p>
<p align="center"><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">O 
  mais completo e utilizado script de IRC, com v&aacute;rias fun&ccedil;&otilde;es 
  tanto para usu&aacute;rios avan&ccedil;ados como para iniciantes. Possui uma 
  interface de f&aacute;cil configura&ccedil;&atilde;o e mIRC em portugu&ecirc;s. 
  Suporte a themes, MP3 player com suporte a play lists, envio de torpedos para 
  celulares, muitos utilit&aacute;rios, anti-v&iacute;rus, centenas de frases, 
  pensamentos, piadas etc</font><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">.</font></p>
<hr>
<p align="center"><font color="#00FF00" size="1" face="Verdana, Arial, Helvetica, sans-serif"><img src="real.jpg" width="200" height="150" border="1"></font></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="http://download.real.com/product_download/BB28407292005/RealPlayer10GOLD.exe" target=_blank>RealPlayer 
  10.5 build 6.0.12.1235</a></font></p>
<p align="center"><font color="#00FF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Descri&ccedil;&atilde;o:</font></p>
<p align="center"><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Toque 
  e veja arquivos RealAudio e RealVideo com qualidade e sem demora. O RealPlayer 
  oferece a mais ampla variedade de conte&uacute;do de &aacute;udio e v&iacute;deo 
  na Web com o simples clique de um bot&atilde;o. Os novos recursos o tornam ainda 
  mais f&aacute;cil localizar rapidamente a programa&ccedil;&atilde;o que voc&ecirc; 
  desejar e obter a melhor experi&ecirc;ncia de &aacute;udio e v&iacute;deo na 
  Internet. As principais novidades desta nova vers&atilde;o s&atilde;o: possui 
  uma loja de m&uacute;sica online, al&eacute;m de possivelmente estar abandonando 
  o nome RealOne, utilizado em vers&otilde;es anteriores. Deve ser uma volta &agrave;s 
  origens, j&aacute; que originalmente este player chamava-se RealPlayer, sendo 
  substitu&iacute;do pelo RealOne h&aacute; poucos anos.</font></p>
<hr>
<p align="center"><img src="win.jpg" width="153" height="136" border="1"></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="http://download.microsoft.com/download/B/1/B/B1BA26A2-1660-44A5-86FD-431DE315A70F/MP10Setup.exe" target=_blank>Windows 
  Media Player 10 Portugu&ecirc;s</a></font></p>
<p align="center"><font color="#00FF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Descri&ccedil;&atilde;o:</font></p>
<p align="center"><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Aplicativo 
  da Microsoft para a execu&ccedil;&atilde;o de anima&ccedil;&otilde;es em formato 
  ASF, Real Audio, Real Video, QuickTime, AVI, WAV, MP3, Netshow e muito mais. 
  Al&eacute;m de uma interface mais bonita, v&aacute;rias novas op&ccedil;&otilde;es 
  s&atilde;o muito bem-vindas. Esta vers&atilde;o vem otimizada para trabalhar 
  com o Windows XP.</font></p>
<hr>
<p align="center"><img src="avg.jpg" width="200" height="150" border="1"></p>
<p align="center"><font color="#FFFFFF"><a href="http://free.grisoft.com/softw/70free/setup/avg70free_300a456.exe" target=_blank>AVG 
  Antiv&iacute;rus FreeEdition 0.323 </a> </font></p>
<p align="center"><font color="#00FF00">Descri&ccedil;&atilde;o:</font></p>
<p align="center"><font color="#FFFF00">Excelente antiv&iacute;rus, leve e ainda 
  por cima &eacute; gratuito apenas para o uso dom&eacute;stico. Esta vers&atilde;o 
  n&atilde;o pode ter uso comercial nem ser utilizado por empresas. Conhecido 
  pela capacidade de detec&ccedil;&atilde;o e elimina&ccedil;&atilde;o de v&iacute;rus, 
  este potente anti-virus vai ajudar os usu&aacute;rios dom&eacute;sticos a protegerem-se 
  das pragas virtuais que propagam pela internet. Possui atualiza&ccedil;&otilde;es 
  constantes que podem ser feitas pelo pr&oacute;prio programa e tamb&eacute;m 
  voc&ecirc; pode agendar o scan do seu sistema. Possui prote&ccedil;&atilde;o 
  nos emails, desinfec&ccedil;&atilde;o autom&aacute;tica e muito mais.</font></p>
<hr>
<p align="center"><font color="#FFFFFF">Copyright Casa da Web</font></p>
<p align="center"></p>
</BODY>
</HTML>