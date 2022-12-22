<?php
/************************************************************************/
/* PHP-NUKE: Advanced Content Management System                         */
/* ============================================                         */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/*                                                                      */
/************************************************************************/

###################################################################################
# Instalador PHP-Nuke v1.4                                                        #
# =============================================================================== #
# Copyright (c) 2004  Aparecido Gomes Lagoeiro ( XNUKE )                          #
# E-Mail: fenix@xnuke.com.br                                                      #
# URL: http://www.xnuke.net                                                       #
#                                                                                 #																														#
# Este	programa é freeware. Você pode redistribuí-lo e/ou modificá-lo            #
# sob os termos da licença GNU General Public License, editados na                #
# versão 2 ou posterior pela Free Software Foundation.                            #
###################################################################################
ob_start();
if (!isset($old_error_reporting)) {
	error_reporting(E_ALL);
  	@ini_set('display_errors', '0');
}

define('INSTALL', true);

include("funcoes.php");
$start_time=get_time();
include("_temas.php");

$prefix = "kayapo";
$user_prefix = "kayapo";
	
$op = $_POST['op']; global $op,$linguagem; $linguagem = $_POST['linguagem'];
if ( $linguagem == "" ) $linguagem = 'lang-english.php'; include("language/" . $linguagem);
	
$template->assign_vars(array(
	'VERSAO'=>'2.0',
	'NAVEGADOR'=>_LAN_80,
	'ONLINE'=>_LAN_81,
	'_LAN_01'=>_LAN_01
));
$NAVEGACAO = "<ol>";
if (( $op == "" ) or ( $op == "index" )) { $NAVEGACAO .= "<li><font color=\"blue\"><big>" . _LAN_72 . "</big></font></li><br /><br />"; } else { $NAVEGACAO .= "<li>" . _LAN_72 . "</li><br /><br />"; }
if ( $op == "intro" ) { $NAVEGACAO .= "<li><font color=\"blue\"><big>" . _LAN_03 . "</big></font></li><br /><br />"; } else { $NAVEGACAO .= "<li>" . _LAN_03 . "</li><br /><br />"; }
if ( $op == "conexao" ) { $NAVEGACAO .= "<li><font color=\"blue\"><big>" . _LAN_04 . "</big></font></li><br /><br />"; } else { $NAVEGACAO .= "<li>" . _LAN_04 . "</li><br /><br />"; }
if ( $op == "tabelas" ) { $NAVEGACAO .= "<li><font color=\"blue\"><big>" . _LAN_05 . "</big></font></li><br /><br />"; } else { $NAVEGACAO .= "<li>" . _LAN_05 . "</li><br /><br />"; }
if ( $op == "config" ) { $NAVEGACAO .= "<li><font color=\"blue\"><big>Config.php</big></font></li><br /><br />"; } else { $NAVEGACAO .= "<li>Config.php</li><br /><br />"; }
if ( $op == "terminar" ) { $NAVEGACAO .= "<li><font color=\"blue\"><big>" . _LAN_06 . "</big></font></li><br /><br />"; } else { $NAVEGACAO .= "<li>" . _LAN_06 . "</li><br /><br />"; }
if ( $op == "reprefix" ) { $NAVEGACAO .= "<li><font color=\"blue\"><big>" . _LAN_07 . "</big></font></li><br /><br />"; } else { $NAVEGACAO .= "<li>" . _LAN_07 . "</li><br /><br />"; }
if ( $op == "pronto" ) { $NAVEGACAO .= "<li><font color=\"blue\"><big>" . _LAN_08 . "</big></font></li><br /><br />"; } else { $NAVEGACAO .= "<li>" . _LAN_08 . "</li>"; }
$NAVEGACAO .= "</ol>";

			$ajuda = "<div class=\"row\"> 
                <div class=\"label\"> 
                  	<div id=\"chave_help\" class=\"help2\" style=\"visibility:hidden\">". _LAN_09 ."</div>
                  	<div id=\"seguranca_help\" class=\"help2\" style=\"visibility:hidden\">". _LAN_10 ."</div>
                  	<div id=\"subscription_url_help\" class=\"help2\" style=\"visibility:hidden\">". _LAN_11 ."</div>
                  	<div id=\"palavroes_help\" class=\"help2\" style=\"visibility:hidden\">". _LAN_12 ."</div>
                  	<div id=\"html_help\" class=\"help2\" style=\"visibility:hidden\">". _LAN_13 ."</div>
				  
				  	<div id=\"servidor_help\" class=\"help2\" style=\"visibility:hidden\">". _LAN_14 ."</div>
                	<div id=\"usuario_help\" class=\"help2\" style=\"visibility:hidden\">". _LAN_15 ."</div>
                	<div id=\"senha_help\" class=\"help2\" style=\"visibility:hidden\">". _LAN_16 ."</div>
                	<div id=\"bd_help\" class=\"help2\" style=\"visibility:hidden\">". _LAN_17 ."</div>
                	<div id=\"arquivo_help\" class=\"help2\" style=\"visibility:hidden\">". _LAN_18 ."</div>
                	<div id=\"prefixo_help\" class=\"help2\" style=\"visibility:hidden\">". _LAN_73 ."</div>
                </div>
              </div>";
			  
$template->assign_block_vars('NAVEGACAO', array(
	'NAVEGADOR' => $NAVEGACAO,
	'AJUDA'=> $ajuda
));
//======================================================================================================
switch($op) {
	
	case "index":
	index();
	break;
	
	case "intro":
	intro();
	break;
	
	case "conexao":
	conexao();
	break;
	
	case "tabelas":
	tabelas();
	break;
	
	case "config":
	config();
	break;
	
	case "terminar":
	terminar();
	break;
	
	case "reprefix":
    reprefix();
    break;
	
	case "pronto":
    pronto();
    break;
	
	default:
	index();
	break;
}
//======================================================================================================
function index() {
	global $template;
	$arquivo = "<form action=\"index.php\" method=\"post\" id=\"pfybsthnzvhqatgsvgjt\" style=\"display:inline\"><select name=\"linguagem\" >";
	$blocksdir = dir("language");
	$blockslist = "";
	while($func=$blocksdir->read()) {
		if(substr($func, 0, 5) == "lang-") {
    		$blockslist .= "$func ";
	    }
	}
	closedir($blocksdir->handle);
	$blockslist = explode(" ", $blockslist);
	sort($blockslist);
	for ($i=0; $i < sizeof($blockslist); $i++) {
	    if($blockslist[$i]!="") {
			$bl = ereg_replace("lang-","",$blockslist[$i]);
			$bl = ereg_replace(".php","",$bl);
			$bl = ereg_replace("_"," ",$bl);
		   	$arquivo .=  "<option value=\"$blockslist[$i]\">$bl</option>\n";
	    }
	}
	$arquivo .= "</select><input type=\"hidden\" name=\"op\" value=\"intro\"><br/><br/>
		<input id=\"enviar\" onclick=\"pfybsthnzvhqatgsvgjt();\" name=\"enviar\" type=\"submit\" value=\" ". _LAN_77 ." >> \" />
	</form>";
	$template->assign_block_vars('CORPO', array(
		'TITULO' 	=> '1 . ' . _LAN_71,
		'CONTEUDO'	=> $arquivo
	));
}

function intro() {
	global $linguagem, $template;
	$arquivo = "<span class=\"content\"><div align=\"justify\">". _LAN_28 ."</div></span>
		<form action=\"index.php\" method=\"post\" id=\"pfybsthnzvhqatgsvgjt\" style=\"display:inline\">
		<input type=\"hidden\" name=\"op\" value=\"conexao\"><br /><br />
		<input type=\"hidden\" name=\"linguagem\" value=\"". $linguagem ."\">
		<center><input id=\"enviar\" onclick=\"pfybsthnzvhqatgsvgjt();\" name=\"enviar\" type=\"submit\" value=\" ". _LAN_77 ." >> \" /></center>
	</form>";
	$template->assign_block_vars('CORPO', array(
		'TITULO' 	=> '2 . ' . _LAN_27,
		'CONTEUDO'	=> $arquivo
	));
}

function conexao() {
	global $linguagem, $template;
	$arquivo = "<span class=\"content\"><div align=\"justify\">
		". _LAN_30 ."<br /><br />
		<form action=\"index.php\" method=\"post\" id=\"pfybsthnzvhqatgsvgjt\" style=\"display:inline\">
		<table width=\"100%\" cellpadding=0 cellspacing=0 border=0>
		<tr><td width=\"38%\"><span class=\"content\">". _LAN_31 ."</span> </td>
		<td><input tabindex=0 type=\"text\" name=\"servidor\" size=50 maxlength=45 value=\"localhost\" onfocus=\"formtooltip('servidor_help',1)\" onblur=\"formtooltip('servidor_help',0)\"></td></tr>
		<tr><td><span class=\"content\">". _LAN_32 ."</span> </td>
		<td><input type=\"text\" name=\"usuario\" size=50 maxlength=45 value=\"root\" onfocus=\"formtooltip('usuario_help',1)\" onblur=\"formtooltip('usuario_help',0)\"></td></tr>
		<tr><td><span class=\"content\">". _LAN_33 ."</span> </td>
		<td><input type=\"text\" name=\"senha\" size=50 maxlength=45 value=\"\" onfocus=\"formtooltip('senha_help',1)\" onblur=\"formtooltip('senha_help',0)\"></td></tr>
		<tr><td><span class=\"content\">". _LAN_34 ."</span> </td>
		<td><input type=\"text\" name=\"bd\" size=50 maxlength=45 value=\"\" onfocus=\"formtooltip('bd_help',1)\" onblur=\"formtooltip('bd_help',0)\"></td></tr>
		<tr><td><span class=\"content\">". _LAN_35 ."</span> </td>
		<td><input type=\"text\" name=\"arquivo\" size=50 maxlength=45 value=\"kayapo.sql\" onfocus=\"formtooltip('arquivo_help',1)\" onblur=\"formtooltip('arquivo_help',0)\"></td></tr>
		<tr><td><span class=\"content\">". _LAN_36 ." (\$prefix):</span> </td>
		<td><input type=\"text\" name=\"newprefix\" size=30 value=\"". _LAN_79 ."\" onfocus=\"formtooltip('prefixo_help',1)\" onblur=\"formtooltip('prefixo_help',0)\" /></td></tr>
		<tr><td><span class=\"content\">". _LAN_37 ." (\$user_prefix):</span> </td>
		<td><input type=\"text\" name=\"newuserprefix\" size=30 value=\"". _LAN_79 ."\" onfocus=\"formtooltip('prefixo_help',1)\" onblur=\"formtooltip('prefixo_help',0)\" /></td></tr>
		<tr><td colspan=2><div align=\"justify\"><b><br /></b><b><font color=\"#FF0000\">". _LAN_38 .":</font> </b>
		". _LAN_39 ."<br /></div></td></tr>
		<tr><td  colspan=2><center><br /><input id=\"enviar\" onclick=\"pfybsthnzvhqatgsvgjt();\" name=\"enviar\" type=\"submit\" value=\" ". _LAN_77 ." >> \" /></center></td></tr>
		</table>
		<input type=\"hidden\" name=\"linguagem\" value=\"". $linguagem ."\">
		<input type=\"hidden\" name=\"op\" value=\"tabelas\">
		</form>
	</div></span>";
	$template->assign_block_vars('CORPO', array(
		'TITULO' 	=> '3 . ' . _LAN_29,
		'CONTEUDO'	=> $arquivo
	));
}

function tabelas() {
	global $db_error,$linguagem, $template;
	$servidor = $_POST['servidor'];
	$usuario = $_POST['usuario'];
	$senha = $_POST['senha'];
	$bd = $_POST['bd'];
	$arquivo = $_POST['arquivo'];
	$newprefix = $_POST['newprefix'];
	$newuserprefix = $_POST['newuserprefix'];
	$arquivo2 = "<span class=\"content\"><div align=\"justify\">";

	$script_filename = getenv('PATH_TRANSLATED');
	if (empty($script_filename)) {
		$script_filename = getenv('SCRIPT_FILENAME');
	}

	$script_filename = str_replace('\\', '/', $script_filename);
	$script_filename = str_replace('//', '/', $script_filename);

	$dir_fs_www_root_array = explode('/', dirname($script_filename));
	$dir_fs_www_root = array();
	for ($i=0, $n=sizeof($dir_fs_www_root_array)-1; $i<$n; $i++) {
		$dir_fs_www_root[] = $dir_fs_www_root_array[$i];
	}
	$dir_fs_www_root = implode('/', $dir_fs_www_root) . '/';

	$bd = str_replace (" ", "_", $bd);
	$usuario = str_replace (" ", "_", $usuario);
	$arquivo = str_replace (" ", "_", $arquivo);

	$db = array();
	$db['DB_SERVER'] = $servidor;
	$db['DB_SERVER_USERNAME'] = $usuario;
	$db['DB_SERVER_PASSWORD'] = $senha;
	$db['DB_DATABASE'] = $bd;

	nuke_db_connect($db['DB_SERVER'], $db['DB_SERVER_USERNAME'], $db['DB_SERVER_PASSWORD']);

	$db_error = false;
	$sql_file = $dir_fs_www_root . 'install/'.$arquivo.'';

	nuke_set_time_limit(0);
	nuke_db_install($db['DB_DATABASE'], $sql_file);
	if ($db_error != false) {
		$arquivo2 .= "<center><font color=\"red\"><big><big><big><big><big><big>". _LAN_75. "</big></big></big></big></big></big></font></center><br /><br />". _LAN_41. "<br /><b><big>$db_error</big></b><br /><br /><b>". _LAN_76. "</b><br /><br />";
		$arquivo2 .= "<center><input type=\"submit\" value=\" << ". _LAN_78 ." \" onClick=\"history.go(-1)\" /></center></div></span>";
	} else {
		$arquivo2 .= "<br /><br />". _LAN_42. "<br /><br />";
		$arquivo2 .= "<form action=\"index.php\" method=\"post\" id=\"pfybsthnzvhqatgsvgjt\" style=\"display:inline\">
		<center><br /><input id=\"enviar\" onclick=\"pfybsthnzvhqatgsvgjt();\" name=\"enviar\" type=\"submit\" value=\" ". _LAN_77 ." >> \" /></center>
		<input type=\"hidden\" name=\"op\" value=\"config\">
		<input type=\"hidden\" name=\"servidor\" value=\"". $servidor ."\">
		<input type=\"hidden\" name=\"usuario\" value=\"". $usuario ."\">
		<input type=\"hidden\" name=\"senha\" value=\"". $senha ."\">
		<input type=\"hidden\" name=\"bd\" value=\"". $bd ."\">
		<input type=\"hidden\" name=\"newprefix\" value=\"". $newprefix ."\">
		<input type=\"hidden\" name=\"newuserprefix\" value=\"". $newuserprefix ."\">
		<input type=\"hidden\" name=\"linguagem\" value=\"". $linguagem ."\">
		</form>
		</div></span>";
	}
	$template->assign_block_vars('CORPO', array(
		'TITULO' 	=> '4 . ' . _LAN_40,
		'CONTEUDO'	=> $arquivo2
	));
}

function config() {
	global $linguagem, $template;
	$servidor = $_POST['servidor'];
	$usuario = $_POST['usuario'];
	$senha = $_POST['senha'];
	$bd = $_POST['bd'];
	$newprefix = $_POST['newprefix'];
	$newuserprefix = $_POST['newuserprefix'];
	$texto = "<span class=\"content\"><div align=\"justify\">". _LAN_44 ."<br /><br />
		<form action=\"index.php\" method=\"post\" id=\"pfybsthnzvhqatgsvgjt\" style=\"display:inline\">
		<table width=\"100%\" cellpadding=0 cellspacing=0>
		<input type=\"hidden\" name=\"servidor\" value=\"". $servidor ."\">
		<input type=\"hidden\" name=\"usuario\" value=\"". $usuario ."\">
		<input type=\"hidden\" name=\"senha\" value=\"". $senha ."\">
		<input type=\"hidden\" name=\"bd\" value=\"". $bd ."\">
		<input type=\"hidden\" name=\"newprefix\" value=\"". $newprefix ."\">
		<input type=\"hidden\" name=\"newuserprefix\" value=\"". $newuserprefix ."\">
		<tr><td><span class=\"content\">". _LAN_45 ."</span> </td>
		<td><input type=\"text\" name=\"chave\" size=45 maxlength=42 value=\"". _LAN_46 ."\" onfocus=\"formtooltip('chave_help',1)\" onblur=\"formtooltip('chave_help',0)\"></td></tr>
		<tr><td><br /><span class=\"content\">". _LAN_47 ."</span> </td>
		<td><br /><select size=1 name=\"seguranca\" onfocus=\"formtooltip('seguranca_help',1)\" onblur=\"formtooltip('seguranca_help',0)\">
    		<option value=\"O\">". _LAN_49 ." 0</option>
    		<option value=\"1\">". _LAN_49 ." 1</option>
    		<option value=\"2\">". _LAN_49 ." 2</option>
    		<option value=\"3\">". _LAN_49 ." 3</option>
    		<option value=\"4\">". _LAN_49 ." 4</option>
    		<option value=\"5\">". _LAN_49 ." 5</option>
    		<option value=\"6\">". _LAN_49 ." 6</option>
    		<option selected value=\"7\">". _LAN_49 ." 7</option>
    	</select></td></tr>
		<tr><td><br /><span class=\"content\">". _LAN_48 ."</span> </td>
		<td><br /><select name=\"servidor_db\">
    		<option selected value=\"MySQL\">MySQL</option>
    	</select></td></tr>		
		<tr><td><br /><span class=\"content\">". _LAN_50 ."</span> </td>
		<td><br /><input type=\"text\" name=\"subscription_url\" size=35 maxlength=45 onfocus=\"formtooltip('subscription_url_help',1)\" onblur=\"formtooltip('subscription_url_help',0)\"></td></tr>
		<tr><td valign=\"top\"><br /><span class=\"content\">". _LAN_51 ."</span> </td>
		<td><br /><textarea name=\"palavroes\" cols=34 rows=4 onfocus=\"formtooltip('palavroes_help',1)\" onblur=\"formtooltip('palavroes_help',0)\">". _LAN_54 ."</textarea></td></tr>
		<tr><td valign=\"top\"><br /><span class=\"content\">". _LAN_52 ."</span> </td>
		<td><br /><textarea name=\"html\" cols=34 rows=4 onfocus=\"formtooltip('html_help',1)\" onblur=\"formtooltip('html_help',0)\">'b'=>1, 'i'=>1, 'a'=>2, 'em'=>1, 'br'=>1, 'strong'=>1, 'blockquote'=>1, 'tt'=>1, 'li'=>1, 'ol'=>1, 'ul'=>1</textarea></td></tr>
		<tr><td colspan=2><div align=\"justify\"><b><br /></b><b><font color=\"#FF0000\">". _LAN_38 .":</font> </b>
		". _LAN_53 ."<br /></div></td></tr>
		<tr><td  colspan=2><center><br /><input id=\"enviar\" onclick=\"pfybsthnzvhqatgsvgjt();\" name=\"enviar\" type=\"submit\" value=\" ". _LAN_77 ." >> \" /></center></td></tr>
		</table>
		<input type=\"hidden\" name=\"linguagem\" value=\"". $linguagem ."\">
		<input type=\"hidden\" name=\"op\" value=\"terminar\">
		</form>
		</div></span>
	";
	$template->assign_block_vars('CORPO', array(
		'TITULO' 	=> '5 . ' . _LAN_43,
		'CONTEUDO'	=> $texto
	));
}

function terminar() {
	global $linguagem, $template;
	$servidor = $_POST['servidor'];
	$usuario = $_POST['usuario'];
	$senha = $_POST['senha'];
	$bd = $_POST['bd'];
	$newprefix = $_POST['newprefix'];
	$newuserprefix = $_POST['newuserprefix'];
	$chave = $_POST['chave'];
	$seguranca = $_POST['seguranca'];
	$servidor_db = $_POST['servidor_db'];
	$subscription_url = $_POST['subscription_url'];
	$palavroes = $_POST['palavroes'];
	$html = $_POST['html'];
	$palavroes = ereg_replace("\"", "'", $palavroes);
	$palavroes = FixQuotes($palavroes);
	$html = ereg_replace("\"", "'", $html);
	$html = FixQuotes($html);
	$servidor_db = trim($servidor_db);
$file_contents = '<?php' . "\n" .
'######################################################################' . "\n" .
'# PHP-NUKE: Advanced Content Management System' . "\n" .
'# ============================================' . "\n" .
'#' . "\n" .
'# Copyright (c) 2002 by Francisco Burzi (fbc@mandrakesoft.com)' . "\n" .
'# http://phpnuke.org' . "\n" .
'#' . "\n" .
'# This module is to configure the main options for your site' . "\n" .
'#' . "\n" .
'# This program is free software. You can redistribute it and/or modify' . "\n" .
'# it under the terms of the GNU General Public License as published by' . "\n" .
'# the Free Software Foundation; either version 2 of the License.' . "\n" .
'######################################################################' . "\n" .
''. "\n\n\n" .
'######################################################################' . "\n" .
'# Esse arquivo foi gerado utilizando-se o PHP-Nuke Install v1.3' . "\n" .
'# Por XPK_FENIX ( http://www.xnuke.net )' . "\n" .
'######################################################################' . "\n" .
''. "\n\n\n" .
'######################################################################' . "\n" .
'# Database & System Config' . "\n" .
'#' . "\n" .
'# dbhost:       SQL Database Hostname' . "\n" .
'# dbuname:      SQL Username' . "\n" .
'# dbpass:       SQL Password' . "\n" .
'# dbname:       SQL Database Name' . "\n" .
'# $prefix:      Your Database tables prefix' . "\n" .
'# $user_prefix: Your Users Database tables prefix (To share it)' . "\n" .
'# $dbtype:      Your Database Server type. Supported servers are:' . "\n" .
'#               MySQL, mysql4, postgres, mssql, oracle, msaccess,' . "\n" .
'#               db2 and mssql-odbc' . "\n" .
'#               Be sure to write it exactly as above, case SeNsItIvE!' . "\n" .
'# $sitekey:	Security Key. CHANGE it to whatever you want, as long' . "\n" .
'#               as you want. Just dont use quotes.' . "\n" .
'# $gfx_chk:	Set the graphic security code on every login screen,' . "\n" .
'#		You need to have GD extension installed:' . "\n" .
'#		0: No check' . "\n" .
'#		1: Administrators login only' . "\n" .
'#		2: Users login only' . "\n" .
'#		3: New users registration only' . "\n" .
'#		4: Both, users login and new users registration only' . "\n" .
'#		5: Administrators and users login only' . "\n" .
'#		6: Administrators and new users registration only' . "\n" .
'#		7: Everywhere on all login options (Admins and Users)' . "\n" .
'#		NOTE: If you arent sure set this value to 0' . "\n" .
'# $subscription_url : If you manage subscriptions on your site, you' . "\n" .
'#                     must write here the url of the subscription' . "\n" .
'#                     information/renewal page. This will send by' . "\n" .
'#                     email if set.' . "\n" .
'######################################################################' . "\n" .
'$dbhost = "'.$servidor.'";' . "\n" .
'$dbuname = "'.$usuario.'";' . "\n" .
'$dbpass = "'.$senha.'";' . "\n" .
'$dbname = "'.$bd.'";' . "\n" .
'$prefix = "'.strtolower($newprefix).'";' . "\n" .
'$user_prefix = "'.strtolower($newuserprefix).'";' . "\n" .
'$dbtype = "'.$servidor_db.'";' . "\n" .
'$sitekey = "'.$chave.'";' . "\n" .
'$gfx_chk = '.$seguranca.';' . "\n" .
'$subscription_url = "'.$subscription_url.'";' . "\n" .
''. "\n" .
'$reasons = array("As Is",' . "\n" .
' 		    "Offtopic",' . "\n" .
' 		    "Flamebait",' . "\n" .
'		    "Troll",' . "\n" .
' 		    "Redundant",' . "\n" .
' 		    "Insighful",' . "\n" .
' 		    "Interesting",' . "\n" .
' 		    "Informative",' . "\n" .
' 		    "Funny",' . "\n" .
' 		    "Overrated",' . "\n" .
' 		    "Underrated");' . "\n" .
'$badreasons = 4;' . "\n" .
''. "\n" .
'$AllowableHTML = array('.$html.');' . "\n" .
''. "\n" .
'$CensorList = array('.$palavroes.');' . "\n" .
'$tipath = "images/topics/";' . "\n" .
''. "\n" .
'if (eregi("config.php",$_SERVER[\'SCRIPT_NAME\'])) {' . "\n" .
'  Header("Location: index.php");' . "\n" .
'  die();' . "\n" .
'}' . "\n" .
'?>';

	$script_filename = getenv('PATH_TRANSLATED');
	if (empty($script_filename)) {
		$script_filename = getenv('SCRIPT_FILENAME');
	}

	$script_filename = str_replace('\\', '/', $script_filename);
	$script_filename = str_replace('//', '/', $script_filename);

	$dir_fs_www_root_array = explode('/', dirname($script_filename));
	$dir_fs_www_root = array();
	for ($i=0, $n=sizeof($dir_fs_www_root_array)-1; $i<$n; $i++) {
		$dir_fs_www_root[] = $dir_fs_www_root_array[$i];
	}
	$dir_fs_www_root = implode('/', $dir_fs_www_root) . '/';
	$fp = @fopen($dir_fs_www_root . 'config.php', 'w');
	if (!$fp) {
		$ttittle = "<font class=\"red\">". _LAN_55 ."</font>";
		$texto = "<span class=\"content\"><div align=\"justify\">
		<table width=\"100%\" cellpadding=0 cellspacing=0>
		<tr><td width=\"100%\"><span class=\"content\">". _LAN_56 ."<br /><br /><br /></span>
		<center><input type=\"submit\" value=\" << ". _LAN_78 ." \" onClick=\"history.go(-1)\" /></center>
		</td></tr>
		</table>
		</div></span>";
	} else {
		fputs($fp, $file_contents);
		fclose($fp);
		$ttittle = "<font class=\"red\">". _LAN_57 ."</font>";
		$texto = "<span class=\"content\"><div align=\"justify\">
		<table width=\"100%\" cellpadding=0 cellspacing=0>
		<tr><td width=\"100%\">". _LAN_58 . " " . strtolower($newprefix) .  " " . _LAN_22 .  " " . strtolower($newuserprefix) ."

		<hr />". _LAN_59 ."<br /><br /><center>
		<b>". _LAN_60 ."</b> <a href=\"http://phpnuke.org.br/modules.php?name=Forums&file=profile&mode=viewprofile&u=34\" target=\"_blank\">aleagi</a>.<br />
		<b>". _LAN_61 ."</b> <a href=\"http://phpnuke.org.br/modules.php?name=Forums&file=profile&mode=viewprofile&u=2583\" target=\"_blank\">XPK_FENIX</a>.
		<br /><br />
		<a href=\"http://phpnuke.org.br\" target=\"_blank\"><img src=\"http://phpnuke.org.br/images/minibanner.gif\" border=0 alt=\"". _LAN_62 ."\"></a><br />
		<a href=\"http://phpnuke.org.br\" target=\"_blank\">". _LAN_62 ."</a>
		<br /><br /><b>". _LAN_63 ."</b> <a href=\"http://rus-phpnuke.com\" target=\"_blank\">Rus-PHP-Nuke</a></center><br />
		</td></tr>
		</table>
		</div></span><br /><br /><center>
		<form action=\"index.php\" method=\"post\" id=\"pfybsthnzvhqatgsvgjt\" style=\"display:inline\">
		<input type=\"hidden\" name=\"servidor\" value=\"". $servidor ."\">
		<input type=\"hidden\" name=\"usuario\" value=\"". $usuario ."\">
		<input type=\"hidden\" name=\"senha\" value=\"". $senha ."\">
		<input type=\"hidden\" name=\"bd\" value=\"". $bd ."\">
		<input type=\"hidden\" name=\"newprefix\" value=\"". $newprefix ."\">
		<input type=\"hidden\" name=\"newuserprefix\" value=\"". $newuserprefix ."\">
		<input id=\"enviar\" onclick=\"pfybsthnzvhqatgsvgjt();\" name=\"enviar\" type=\"submit\" value=\" ". _LAN_77 ." >> \" />
		<input type=\"hidden\" name=\"op\" value=\"reprefix\">
		<input type=\"hidden\" name=\"linguagem\" value=\"". $linguagem ."\">
		</form></center>";
		$template->assign_block_vars('CORPO', array(
			'TITULO' 	=> '6 . ' . $ttittle,
			'CONTEUDO'	=> $texto
		));
	}
}

function reprefix() {
	global $linguagem, $template, $prefix, $user_prefix;
	$servidor = $_POST['servidor']; 
	$usuario = $_POST['usuario'];
	$senha = $_POST['senha'];
	$bd = $_POST['bd'];
	$newprefix = $_POST['newprefix'];
	$newuserprefix = $_POST['newuserprefix'];
	$ttittle = "<table border=0 cellpadding=0 cellspacing=0 width=\"100%\">
  		<tr>
    		<td align=\"center\" background=\"http://phpnuke.org.br/themes/fisubice/images/cellpic_bkg.jpg\" height=101 valign=\"top\">
				<img src=\"http://phpnuke.org.br/images/altera_prefixo.jpg\" border=0>
			</td>
		</tr>
		<tr>
			<td background=\"http://phpnuke.org.br/themes/fisubice/images/bar.jpg\" height=8 nowrap colspan=3></td>
		</tr>
	</table>" . _LAN_64;
	$newuserprefix = strtolower($newuserprefix);
	$newprefix = strtolower($newprefix);
	$dbhost = $servidor;
	$dbuname = $usuario;
	$dbpass = $senha;
	$dbname = $bd;
	$cpr = strlen($prefix);
    $uscpr = strlen($user_prefix);
   
    if (!mysql_connect($dbhost, $dbuname, $dbpass)) {
        print 'Could not connect to mysql';
        exit;
    }

    $result = mysql_list_tables($dbname);
    
    if (!$result) {
        print "DB Error, could not list tables\n";
        print 'MySQL Error: ' . mysql_error();
        exit;
    }
	
	$texto = "";
    
    while ($row = mysql_fetch_row($result)) {
        $tabname = $row[0];

        $prlong = substr($tabname, 0, $cpr);
        $pruslong = substr($tabname, 0, $uscpr);

        if (($prefix == "$prlong") OR ($user_prefix == "$pruslong")) {
        
        if (($tabname == "".$user_prefix."_users") OR ($tabname == "".$user_prefix."_users_temp")) {
        $newtabname = substr($tabname, $uscpr);
        mysql_query("ALTER TABLE $tabname RENAME $newuserprefix$newtabname");
        $texto .= "$user_prefix$newtabname ===> $newuserprefix$newtabname<br />";
        
        }
        else {
        $newtabname = substr($tabname, $cpr);
        mysql_query("ALTER TABLE $tabname RENAME $newprefix$newtabname");
        $texto .= "$prefix$newtabname ===> $newprefix$newtabname<br />";
        
        }
        }
    }

    mysql_free_result($result);
	$texto .= "<center><br /><br />
		<b>". _LAN_60 ."</b> <a href=\"http://phpnuke.org.br/modules.php?name=Forums&file=profile&mode=viewprofile&u=34\" target=\"_blank\">aleagi</a>.<br />
		<b>". _LAN_61 ."</b> <a href=\"http://phpnuke.org.br/modules.php?name=Forums&file=profile&mode=viewprofile&u=2583\" target=\"_blank\">XPK_FENIX</a>.
		<br /><br />
		<a href=\"http://phpnuke.org.br\" target=\"_blank\"><img src=\"http://phpnuke.org.br/images/minibanner.gif\" border=0 alt=\"". _LAN_62 ."\"></a><br>
		<a href=\"http://phpnuke.org.br\" target=\"_blank\">". _LAN_62 ."</a>
		<br /><b>". _LAN_63 ."</b> <a href=\"http://rus-phpnuke.com\" target=\"_blank\">Rus-PHP-Nuke</a></center><hr />

		<center><form action=\"index.php\" method=\"post\" id=\"pfybsthnzvhqatgsvgjt\" style=\"display:inline\">
		<input id=\"enviar\" onclick=\"pfybsthnzvhqatgsvgjt();\" name=\"enviar\" type=\"submit\" value=\" ". _LAN_77 ." >> \" />
		<input type=\"hidden\" name=\"linguagem\" value=\"". $linguagem ."\">
		<input type=\"hidden\" name=\"op\" value=\"pronto\"></form></center>";
	$template->assign_block_vars('CORPO', array(
		'TITULO' 	=> '7 . ' . $ttittle,
		'CONTEUDO'	=> $texto
	));
}

function pronto() {
	global $linguagem, $template;
	$texto = "<span class=\"content\"><div align=\"justify\">
		<table width=\"100%\" cellpadding=0 cellspacing=0>
		<tr><td width=\"100%\">
		<span class=\"content\">
		". _LAN_66 ."<br /><br /><br />
		<center><form action=\"../admin.php\" method=\"post\" id=\"pfybsthnzvhqatgsvgjt\" style=\"display:inline\">
		<input id=\"enviar\" onclick=\"pfybsthnzvhqatgsvgjt();\" name=\"enviar\" type=\"submit\" value=\" ". _LAN_77 ." >> \" /></form></center>
		</span></td></tr>
		</table>
		</div></span>
	";
	$template->assign_block_vars('CORPO', array(
		'TITULO' 	=> '8 . ' . _LAN_65,
		'CONTEUDO'	=> $texto
	));
}
//======================================================================================================
$end_time=get_time();
$creation_time=round($end_time-$start_time,4);
$template->assign_vars(array(
	'TEMPO'=>$creation_time,
	'_LAN_21'=>_LAN_21,
	'_LAN_22'=>_LAN_22,
	'_LAN_23'=>_LAN_23,
	'_LAN_24'=>_LAN_24,
	'_LAN_25'=>_LAN_25,
	'_LAN_26'=>_LAN_26,
	'_LAN_19'=>_LAN_19,
	'_LAN_20'=>_LAN_20
));

$template->pparse('header');
if ( $template->test_pparse('corpo') ) { 
	$template->pparse('corpo'); 
}
$template->pparse('footer');
?>