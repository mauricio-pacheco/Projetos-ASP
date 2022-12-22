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
$textcolor1 = "#000000";
$textcolor2 = "#000000";

/* ********************************** */
/* Definição das tabelas...           */
/* ********************************** */

function OpenTable() {
    global $bgcolor1, $bgcolor2;
    echo "<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"0\" bgcolor=\"$bgcolor2\"><tr><td>\n";
    echo "<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"8\" bgcolor=\"$bgcolor1\"><tr><td>\n";
}

function OpenTable2() {
    global $bgcolor1, $bgcolor2;
    echo "<table border=\"0\" cellspacing=\"1\" cellpadding=\"0\" bgcolor=\"$bgcolor2\" align=\"center\"><tr><td>\n";
    echo "<table border=\"0\" cellspacing=\"1\" cellpadding=\"8\" bgcolor=\"$bgcolor1\"><tr><td>\n";
}


function OpenTable3() {
     global $bgcolor1, $bgcolor2;
     echo "<table border=\"0\" cellspacing=\"1\" cellpadding=\"0\" bgcolor=\"$bgcolor2\"><tr><td>\n";
     echo "<table border=\"0\" cellspacing=\"1\" cellpadding=\8\" bgcolor=\"$bgcolor1\"><tr><td>\n";
}

function CloseTable() {
    echo "</td></tr></table></td></tr></table>\n";
}

function CloseTable2() {
    echo "</td></tr></table></td></tr></table>\n";
}

function CloseTable3() {
    echo "</td></tr></table></td></tr></table>\n";
}


/* ********************************** */
/* Função do cabeçalho...             */
/* ********************************** */

function themeheader() {
global $banners;
echo "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#888888\">"
. "<tr><td colspan=\"3\" rowspan=\"3\"><a href=\"index.php\"><img src=\"themes/Kayapo/images/logo.jpg\" alt=\"Comunidade PHP Nuke Brasil - Kayapo\" border=\"0\"></a></td>"
. "<td style=\"background-image:url(themes/Kayapo/images/header_bg.gif)\" rowspan=\"3\" width=\"100%\"></td>"
. "<td class=\"top\" style=\"background-image:url(themes/Kayapo/images/header_bg.gif)\" width=\"100%\" colspan=\"5\" align=\"right\">"
. "<img class=\"header\" src=\"themes/Kayapo/images/header_03.gif\" width=\"290\" height=\"27\" alt=\"\" border=\"0\"><br><br><br>";

    if ($banners == 1) {
        include("includes/banners1.php");
    }
	
echo "$tbanners1</td>"
. "</tr></table>";

    $public_msg = public_message();
    echo "$public_msg";
    echo "<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#FFFFFF\" align=\"center\"><tr valign=\"top\">";
    echo "<td class=\"top\" style=\"background-image:url(themes/Kayapo/images/block-bg.jpg)\" width=\"200\">\n";
          blocks(left);
    echo "</td><td width=\"100%\">\n";
}

/* ********************************** */
/* Função que gera os Blocos...       */
/* ********************************** */

function themesidebox($title, $content) {
    echo "<center><table width=\"200\" border=\"0\" cellspacing=\"1\" cellpadding=\"3\"><tr><td bgcolor=\"#ECECEC\">"
    ."<font class=\"link1\"><b>$title</b></font></td></tr><tr><td><font class=\"content\">"
    ."$content"
	."</font></td></tr></table></center>";
}

/* ********************************** */
/* Função de formato da notícia...    */
/* ********************************** */

function FormatStory($thetext, $notes, $aid, $informant) {
    global $anonymous;
    if ($notes != "") {
	$notes = "<b>"._NOTE."</b> <i>$notes</i>\n";
    } else {
	$notes = "";
    }
    if ("$aid" == "$informant") {
	echo "<font class=\"content\">$thetext<br>$notes</font>\n";
    } else {
	if($informant != "") {
	    $boxstuff = "<a href=\"modules.php?name=Your_Account&amp;op=userinfo&amp;username=$informant\">$informant</a> ";
	} else {
	    $boxstuff = "$anonymous ";
	}
	$boxstuff .= ""._WRITES." <i>\"$thetext\"</i> $notes\n";
	echo "<font class=\"content\">$boxstuff</font>\n";
    }
}

/* ********************************** */
/* Função da página da notícia...     */
/* ********************************** */

function themeindex ($aid, $informant, $time, $title, $counter, $topic, $thetext, $notes, $morelink, $topicname, $topicimage, $topictext) {
global $anonymous, $tipath, $lado;
//static $lado;
$lado++;
    if ($notes != "") {
	$notes = "<br><br><b>"._NOTE."</b> <i>$notes</i>\n";
    } else {
	$notes = "";
    }
    if ("$aid" == "$informant") {
	$content = "$thetext$notes\n";
    } else {
	if($informant != "") {
	    $content = "<a href=\"modules.php?name=Your_Account&amp;op=userinfo&amp;username=$informant\">$informant</a> ";
	} else {
	    $content = "$anonymous ";
	}
	$content .= ""._WRITES." <i>\"$thetext\"</i>$notes\n";
    }
    $posted = ""._POSTEDBY." ";
    $posted .= get_author($aid);
    $posted .= "<br>$time $timezone";
if (is_integer($lado/2)) {
	echo "<table width=\"100%\" cellpadding=\"3\" cellspacing=\"0\">"
	. "<tr>"
	. "<td width=\"100%\" bgcolor=\"#ECECEC\"><font class=\"link1\"><b>$title</b></font></td></tr>"
	. "<tr><td>$posted</td></tr>"
    . "<tr><td class=\"top\" align=\"justify\"><a href=\"modules.php?name=News&amp;new_topic=$topic\"><img src=\"$tipath$topicimage\" border=\"0\" alt=\"$topictext\" title=\"$topictext\" align=\"right\" hspace=\"2\" vspace=\"2\"></a>"
	. "<p align=\"justify\">$content</td></tr>"
	. "<tr><td colspan=\"2\" align=\"right\">$morelink</td>"
	. "</tr>"
	. "</table>";
} else {
	echo "<table width=\"100%\" cellpadding=\"3\" cellspacing=\"0\">"
	. "<tr>"
	. "<td width=\"100%\" bgcolor=\"#ECECEC\" align=\"right\"><font class=\"link1\"><b>$title</b></font></td></tr>"
	. "<tr><td>$posted</td></tr>"
    . "<tr><td class=\"top\" align=\"justify\"><a href=\"modules.php?name=News&amp;new_topic=$topic\"><img src=\"$tipath$topicimage\" border=\"0\" alt=\"$topictext\" title=\"$topictext\" align=\"left\" hspace=\"2\" vspace=\"2\"></a>"
	. "<p align=\"justify\">$content</td></tr>"
	. "<tr><td colspan=\"2\">$morelink</td>"
	. "</tr>"
	. "</table>";
}

}

/* ********************************** */
/* Função da página da notícia...     */
/* ********************************** */
/* Aparece quando se clica em         */
/* Leia mais...                       */
/* Também utilizei nova formatação    */
/* sem aspas simples ou duplas.
/* ********************************** */


function themearticle ($aid, $informant, $datetime, $title, $thetext, $topic, $topicname, $topicimage, $topictext) {
    global $admin, $sid, $index;
$index = 0;
    if ("$aid" == "$informant") {
	echo"
	<table border=0 cellpadding=0 cellspacing=0 align=center bgcolor=FFFFFF width=100%><tr><td>
	<table border=0 cellpadding=0 cellspacing=0 width=100%><tr><td bgcolor=FFFFFF>
	<b><table width=100%><tr><td bgcolor=EFEFEF><font class=link1><b>$title</b></font></b></td></tr></table><br><font class=tiny>Publicado em $datetime";      
	if ($admin) {
	    echo "&nbsp;&nbsp; $font2 [ <a href=admin.php?op=EditStory&sid=$sid>Edit</a> | <a href=admin.php?op=RemoveStory&sid=$sid>Delete</a> ]";
	}
	echo "
	<br>Topic: <a href=modules.php?name=News&amp;new_topic=$topic>$topictext</a>
	</td></tr><tr><td bgcolor=ffffff>
	<p align=justify>$thetext</p>
	</td></tr></table></td></tr></table><br>";
    } else {
	if($informant != "") $informant = "<a href=modules.php?name=Your_Account&amp;op=userinfo&username=$informant>$informant</a> ";
	else $boxstuff = "$anonymous ";
	$boxstuff .= "writes <i>\"$thetext\"</i> $notes";
	echo "
	<table border=0 cellpadding=0 cellspacing=0 align=center bgcolor=FFFFFF width=100%><tr><td>
	<table border=0 cellpadding=3 cellspacing=1 width=100%><tr><td bgcolor=EFEFEF><font class=link1><b>$title</b></font></b><br><font class=content>Enviado por $informant<br><b>Data:</b> $datetime</font>";
	if ($admin) {
	    echo "&nbsp;&nbsp; $font2 [ <a href=admin.php?op=EditStory&sid=$sid>Editar</a> | <a href=admin.php?op=RemoveStory&sid=$sid>Apagar</a> ]";
	}
	echo "
	<br>Topic: <a href=modules.php?name=News&amp;new_topic=$topic>$topictext</a>
	</td></tr><tr><td bgcolor=ffffff><p align=justify>
	$thetext
	</td></tr></table></td></tr></table><br>";
    }
}

/* ********************************** */
/* Função do rodapé...                */
/* ********************************** */

function themefooter() {
    global $index, $banners;

	echo "</td>";
	if ($index == 1) {
		echo "<td class=\"top\" style=\"background-image:url(themes/Kayapo/images/block-bg.jpg)\" width=\"200\" valign=\"top\">";
		blocks(right);
		echo "</td>";
	}
    echo "</tr></table><table width=\"100%\"><tr><td bgcolor=\"#888888\" align=\"center\">";

/*
Nota Importante:
****************
Caso se deseje banners também no rodapé, basta descomentar as 4 seguintes linhas:
*/

//    if ($banners == 1) {
//        include("includes/banners2.php");
//    }
// echo "<center>$tbanners2</center><br>";

    footmsg();
echo "</td></tr></table>";
}

?>
