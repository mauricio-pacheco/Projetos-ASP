<?php
/* ************************************************************** */
/*           Tema Kayapó - Desenvolvido para PHP-Nuke             */
/* ************************************************************** */
/* Criação e desenvolvimento - 17.XI.2004 - 14hs25                */
/* ************************************************************** */
/* Luiz Gustavo Aleagi Nunes                                      */
/* Comunidade PHP-Nuke Brasil - CNB - http://phpnuke.org.br       */
/* aleagi@phpnuke.org.br - aleagi@hotmail.com - aleagi@gmail.com  */
/* ************************************************************** */

/* ********************************** */
/* Definição das variáves de cores... */
/* ********************************** */
$bgcolor1 = "#ffffff";
$bgcolor2 = "#ffffff";
$bgcolor3 = "#ffffff";
$bgcolor4 = "#eeeeee";
$textcolor1 = "#ffffff";
$textcolor2 = "#000000";

/* ********************************** */
/* Definição das tabelas...           */
/* ********************************** */

function OpenTable() {
    global $bgcolor1, $bgcolor2;
    $text =  "<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"0\" bgcolor=\"$bgcolor2\"><tr><td>\n";
    $text .= "<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"8\" bgcolor=\"$bgcolor1\"><tr><td>\n";
	return $text;
}

function OpenTable2() {
    global $bgcolor1, $bgcolor2;
    $text = "<table border=\"0\" cellspacing=\"1\" cellpadding=\"0\" bgcolor=\"$bgcolor2\" align=\"center\"><tr><td>\n";
    $text .= "<table border=\"0\" cellspacing=\"1\" cellpadding=\"8\" bgcolor=\"$bgcolor1\"><tr><td>\n";
	return $text;
}


function OpenTable3() {
     global $bgcolor1, $bgcolor2;
     $text = "<table border=\"0\" cellspacing=\"1\" cellpadding=\"0\" bgcolor=\"$bgcolor2\"><tr><td>\n";
     $text .= "<table border=\"0\" cellspacing=\"1\" cellpadding=\"0\" bgcolor=\"$bgcolor1\"><tr><td>\n";
	 return $text;
}

function CloseTable() {
    $text = "</td></tr></table></td></tr></table>\n";
	return $text;
}

function CloseTable2() {
    $text = "</td></tr></table></td></tr></table>\n";
	return $text;
}

function CloseTable3() {
    $text = "</td></tr></table></td></tr></table>\n";
	return $text;
}

$template->assign_vars(array(
	'OpenTable'=> OpenTable(),
	'OpenTable2'=> OpenTable2(),
	'OpenTable3'=> OpenTable3(),
	'CloseTable'=> CloseTable(),
	'CloseTable2'=> CloseTable2(),
	'CloseTable3'=> CloseTable3()
));
?>