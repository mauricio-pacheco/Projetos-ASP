<!-- INÍCIO DO CABEÇALHO -->
<html>
	<head>
	<title>{_LAN_01}</title>
	<link rel="stylesheet" type="text/css" media="all" href="{TEMA_CSS}">
	<SCRIPT language=JavaScript>
<!--

function SymError()
{
  return true;
}

window.onerror = SymError;

//-->
</SCRIPT>
	<script language='javascript' type='text/javascript' >
          function formtooltip(el,flag){
    elem = document.getElementById(el);
    if (flag) { 
      elem.parentNode.parentNode.style.zIndex=1000;
      elem.parentNode.parentNode.style.borderRight='0px solid #000';
      // ugly , yes .. but neccesary to avoid a small but very annoying bug in IE6
      elem.style.visibility='visible';
    }
    else {
      elem.parentNode.parentNode.style.zIndex=1;
      elem.parentNode.parentNode.style.border='none';
      elem.style.visibility='hidden' };
  }
        </script>
		<script language="JavaScript">
			function pfybsthnzvhqatgsvgjt(){
				var currentState = 1;
				var newState = 2;
				if (newState != currentState){
					document.getElementById('pfybsthnzvhqatgsvgjt').enviar.disabled = newState;
					document.getElementById('pfybsthnzvhqatgsvgjt').submit();
				}
			}
		</SCRIPT>
</head>
<body>

<!-- LOGOTIPO -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#888888">
	<tr>
		<td colspan="3" rowspan="3"><img src="tema/images/logo.jpg" alt="Comunidade PHP Nuke Brasil - Kayapo" border="0"></td>
		<td style="background-image:url(tema/images/header_bg.gif)" rowspan="3" width="100%"></td>
		<td class="top" style="background-image:url(tema/images/header_bg.gif)" width="100%" colspan="5" align="right">
			<img class="header" src="tema/images/header_03.gif" width="290" height="27" alt="" border="0"><br/>
			<a href='http://kayapo.phpnuke.org.br' target='_blank'>
				<img src='http://kayapo.phpnuke.org.br/images/banners/banner01.gif' border='0' alt='CNB Kayapó - A Força do PHP-Nuke no Brasil!' title='CNB Kayapó - A Força do PHP-Nuke no Brasil!' height='60' width='468'>
			</a><br/><br/><big><big><big><big><big>v.{VERSAO}</big></big></big></big></big>
		</td>
	</tr>
</table>
<!-- LOGOTIPO -->

<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF" align="center">
	<tr valign="top">
		<td class="top" style="background-image:url(tema/images/block-bg.jpg)" width="200">

<table width="200" border="0" cellspacing="1" cellpadding="3">
	<tr>
		<td bgcolor="#ECECEC"><font color="#F54900"><big><b>{NAVEGADOR}</b></big></font></td>
	</tr>
<!-- BEGIN NAVEGACAO -->	
	<tr><td><font class="content">
        {NAVEGACAO.NAVEGADOR}
	</font></td></tr>
<!-- END NAVEGACAO -->	
</table>

		</td>
		<td width="100%">
{OpenTable2}
<big><big><b>{_LAN_01}</b></big></big>
{CloseTable2}
<!-- BEGIN CORPO -->	
	{OpenTable}
	<font class="title"><center>{CORPO.TITULO}<br /><br /></center></font><br /><center>
        {CORPO.CONTEUDO}
	</font>
	{CloseTable}
<!-- END CORPO -->		