<?php

/*********************************************************************************/
/* CNB Your Account: An Advanced User Management System for phpnuke     		*/
/* ============================================                         		*/
/*                                                                      		*/
/* Copyright (c) 2004 by Comunidade PHP Nuke Brasil                     		*/
/* http://dev.phpnuke.org.br & http://www.phpnuke.org.br                		*/
/*                                                                      		*/
/* Contact author: escudero@phpnuke.org.br                              		*/
/* International Support Forum: http://ravenphpscripts.com/forum76.html 		*/
/*                                                                      		*/
/* This program is free software. You can redistribute it and/or modify 		*/
/* it under the terms of the GNU General Public License as published by 		*/
/* the Free Software Foundation; either version 2 of the License.       		*/
/*                                                                      		*/
/*********************************************************************************/
/* CNB Your Account it the official successor of NSN Your Account by Bob Marion	*/
/*********************************************************************************/

if (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) {
    header("Location: ../../../index.php");
    die ();
}
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }

    $result = $db->sql_query("SELECT headlinesurl FROM ".$prefix."_headlines WHERE hid='$hid'");
    $row = $db->sql_fetchrow($result);
    $url = $row[headlinesurl];
    $rdf = parse_url($url);
    $fp = fsockopen($rdf['host'], 80, $errno, $errstr, 15);
    if (!$fp) {
        $content = "<font class=\"content\">"._ERRORHL."</font>";
        return;
    }
    if ($fp) {
        fputs($fp, "GET " . $rdf['path'] . "?" . $rdf['query'] . " HTTP/1.0\r\n");
        fputs($fp, "HOST: " . $rdf['host'] . "\r\n\r\n");
        $string = "";
        while(!feof($fp)) {
            $pagetext = fgets($fp,300);
            $string .= chop($pagetext);
        }
        fputs($fp,"Connection: close\r\n\r\n");
        fclose($fp);
        $items = explode("</item>",$string);
        $content = "<font class=\"content\">";
        for ($i=0;$i<10;$i++) {
            $link = ereg_replace(".*<link>","",$items[$i]);
            $link = ereg_replace("</link>.*","",$link);
            $title2 = ereg_replace(".*<title>","",$items[$i]);
            $title2 = ereg_replace("</title>.*","",$title2);
            if ($items[$i] == "") {
                $content = "";
                return;
            } else {
                if (strcmp($link,$title)) {
                    $cont = 1;
                    $content .= "<img src=\"images/arrow.gif\" border=\"0\" hspace=\"5\"><a href=\"$link\" target=\"new\">$title2</a><br>\n";
                }
            }
        }
    }
    echo "$content";

?>