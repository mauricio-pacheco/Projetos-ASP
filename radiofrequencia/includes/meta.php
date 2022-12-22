<?php

# $Author: chatserv $
# $Date: 2004/12/07 22:25:22 $
/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/

if (stristr($_SERVER['SCRIPT_NAME'], "meta.php")) {
    Header("Location: ../index.php");
    die();
}

##################################################
# Include for Meta Tags generation               #
##################################################

echo "<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset="._CHARSET."\">\n";
echo "<META HTTP-EQUIV=\"EXPIRES\" CONTENT=\"0\">\n";
echo "<META NAME=\"RESOURCE-TYPE\" CONTENT=\"DOCUMENT\">\n";
echo "<META NAME=\"DISTRIBUTION\" CONTENT=\"GLOBAL\">\n";
echo "<META NAME=\"AUTHOR\" CONTENT=\"$sitename\">\n";
echo "<META NAME=\"COPYRIGHT\" CONTENT=\"Copyright (c) by $sitename\">\n";
echo "<META NAME=\"KEYWORDS\" CONTENT=\"PHP-Nuke, PHP, Nuke, PHPNUKE, CNB, Baggio Tecnologia, Hospedagem, Servidor dedicado, servidores dedicados, dedicados, streaming, áudio, vídeo, Your_Account, Your Account, CNB Die, Sentinel, Instalação, configuração, suporte, MySQL, apache, linux, software livre, colaborar, governo federal, windows, Luiz Gustavo Aleagi Nunes, André Escudero, Linux, Tux, config.php, linha 88, manutenção, acessoria, dicas, tutorial, tutoriais, downloads, Forums, Foros, aleagi, XPK, Aparecido, Escudero, consultoria, módulos sob encomenda, Temas, Nuke_miau, Nuke_flog\">\n";
echo "<META NAME=\"DESCRIPTION\" CONTENT=\"$slogan\">\n";
echo "<META NAME=\"ROBOTS\" CONTENT=\"INDEX, FOLLOW\">\n";
echo "<META NAME=\"REVISIT-AFTER\" CONTENT=\"1 DAYS\">\n";
echo "<META NAME=\"RATING\" CONTENT=\"GENERAL\">\n";

###############################################
# DO NOT REMOVE THE FOLLOWING COPYRIGHT LINE! #
# YOU'RE NOT ALLOWED TO REMOVE NOR EDIT THIS. #
###############################################

// IF YOU REALLY NEED TO REMOVE IT AND HAVE MY WRITTEN AUTHORIZATION CHECK: http://phpnuke.org/modules.php?name=Commercial_License
// PLAY FAIR AND SUPPORT THE DEVELOPMENT, PLEASE!

echo "<META NAME=\"GENERATOR\" CONTENT=\"PHP-Nuke - Copyright by http://phpnuke.org\">\n";
# $Log: meta.php,v $
# Revision 1.2  2004/12/07 22:25:22  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.1  2004/10/05 02:27:50  chatserv
# Initial CVS Addition
#

?>