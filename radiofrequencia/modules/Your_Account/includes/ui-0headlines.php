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
   if ($my_headlines == 1 AND ($username == $cookie[1]) AND ($usrinfo[user_password] == $cookie[2])) {
    echo "<br>";
    OpenTable();
    echo "<center><b>"._MYHEADLINES."</b><br><br>"
	.""._SELECTASITE."<br><br>"
	."<form action=\"modules.php?name=$module_name\" method=\"post\">"
	."<input type=\"hidden\" name=\"op\" value=\"userinfo\">"
	."<input type=\"hidden\" name=\"username\" value=\"$username\">"
	."<input type=\"hidden\" name=\"bypass\" value=\"$bypass\">"
	."<input type=\"hidden\" name=\"url\" value=\"0\">"
	."<select name=\"hid\" onChange='submit()'>\n"
	."<option value=\"0\">"._SELECTASITE2."</option>";
    $sql4 = "SELECT hid, sitename FROM ".$prefix."_headlines ORDER BY sitename";
    $headl = $db->sql_query($sql4);
    while($row4 = $db->sql_fetchrow($headl)) {
	$nhid = intval($row4[hid]);
	$hsitename = $row4[sitename];
	if ($hid == $nhid ) {
	    $sel = "selected";
	} else {
	    $sel = "";
	}
	echo "<option value=\"$nhid\" $sel>$hsitename</option>\n";
    }
    echo "</select></form>"
	.""._ORTYPEURL."<br><br>"
	."<form action=\"modules.php?name=$module_name\" method=\"post\">"
	."<input type=\"hidden\" name=\"op\" value=\"userinfo\">"
	."<input type=\"hidden\" name=\"username\" value=\"$username\">"
	."<input type=\"hidden\" name=\"bypass\" value=\"$bypass\">"
	."<input type=\"hidden\" name=\"hid\" value=\"0\">"
	."<input type=\"text\" name=\"url\" size=\"40\" maxlength=\"200\" value=\"http://\">&nbsp;&nbsp;"
	."<input type=\"submit\" value=\""._GO."\"></form>"
	."</center><br>";
    if ($hid != 0 OR ($hid == 0 AND $url != "0" AND $url != "http://") AND $url != "") {
	if ($hid != 0) {
    	    $sql5 = "SELECT sitename, headlinesurl FROM ".$prefix."_headlines WHERE hid='$hid'";
	    $result5 = $db->sql_query($sql5);
	    $row5 = $db->sql_fetchrow($result5);
	    $nsitename = $row5[sitename];
	    $url = $row5[headlinesurl];
	    $title = stripslashes(check_html($nsitename, "nohtml"));
	    $siteurl = eregi_replace("http://", "", $url);
	    $siteurl = explode("/", $siteurl);
	} else {
	    if (!ereg("http://", $url)) {
		$url = "http://$url";
	    }
	    $siteurl = eregi_replace("http://", "", $url);
	    $siteurl = explode("/", $siteurl);
	    $title = "http://$siteurl[0]";
	}
	$rdf = parse_url($url);
	$fp = fsockopen($rdf['host'], 80, $errno, $errstr, 15);
	if (!$fp) {
    	    $content = "<center><font class=\"content\">"._RSSPROBLEM."</font></center>";
	}
	if ($fp) {
    	    fputs($fp, "GET " . $rdf['path'] . "?" . $rdf['query'] . " HTTP/1.0\r\n");
    	    fputs($fp, "HOST: " . $rdf['host'] . "\r\n\r\n");
    	    fputs($fp, 'GET ' . $rss['path'] . '?' . $rss['query'] . " HTTP/1.0\r\n");
            fputs($fp, "Referer: " . $nukeurl . "\r\n");
            fputs($fp, "User-Agent: CNBYA RSS READER\r\n"); 
            
    	    $string	= "";
    	    while(!feof($fp)) {
		$pagetext = fgets($fp,300);
		$string .= chop($pagetext);
	    }
	    fputs($fp,"Connection: close\r\n\r\n");
	    fclose($fp);
	    $items = explode("</item>",$string);
	    $content = "<font class=\"content\">";
	    for ($i=0;$i<10;$i++) {
		$yalink = ereg_replace(".*<link>","",$items[$i]);
		$yalink = ereg_replace("</link>.*","",$yalink);
		$yatitle2 = ereg_replace(".*<title>","",$items[$i]);
		$yatitle2 = ereg_replace("</title>.*","",$yatitle2);
        $yadesc2 = ereg_replace(".*<description>","",$items[$i]);
		$yadesc2 = ereg_replace("</description>.*","",$yadesc2);
		if ($items[$i] == "" AND $cont != 1) {
	    	    $content = "<center>"._RSSPROBLEM."</center>";
		} else {
			$yalink = check_html($yalink, 'nohtml');
			$yatitle2 = check_html($yatitle2, 'nohtml');
			$yadesc2 = ya_doti(ya_superhtmlentities(check_html($yadesc2, 'nohtml')));
	    	    if (strcmp($yalink,$yatitle2) AND $items[$i] != "") {
	    		$cont = 1;
			$content .= "<img src=\"images/arrow.gif\" border=\"0\" hspace=\"5\"><a href=\"$yalink\" target=\"_BLANK\">$yatitle2</a><p>$yadesc2</p>\n";
		    }
		}
	    }
	}
	if ($content != "") {
	    OpenTable2();
	    echo "<center><b>"._HEADLINESFROM." <a href=\"http://$siteurl[0]\" target=\"_BLANK\">$title</a></b></center><br>";
	    echo "$content";
	    CloseTable2();
	    $content="";
	} elseif (($cont == 0) OR ($content == "")) {
	    OpenTable2();
	    echo "<center>"._RSSPROBLEM."</center><br>";
	    CloseTable2();
	}
	echo "<br>";
    }
    CloseTable();
    }
    function ya_superhtmlentities($text) {
        // Thanks to mirrorball_girl for this
        $entities = array(128 => 'euro', 130 => 'sbquo', 131 => 'fnof', 132 => 'bdquo', 133 => 'hellip', 134 => 'dagger', 135 => 'Dagger', 136 => 'circ', 137 => 'permil', 138 => 'Scaron', 139 => 'lsaquo', 140 => 'OElig', 145 => 'lsquo', 146 => 'rsquo', 147 => 'ldquo', 148 => 'rdquo', 149 => 'bull', 150 => '#45', 151 => 'mdash', 152 => 'tilde', 153 => 'trade', 154 => 'scaron', 155 => 'rsaquo', 156 => 'oelig', 159 => 'Yuml');
        $new_text = '';
        for($i = 0; $i < strlen($text); $i++) {
            $num = ord($text {
                $i }
            );
            if (array_key_exists($num, $entities)) {
                switch ($num) {
                    case 150:
                    $new_text .= '-';
                    break;
                    default:
                    $new_text .= '&'.$entities[$num].';';
                }
            }
            else
                if ($num < 127 || $num > 159) {
                $new_text .= htmlentities($text {
                    $i }
                );
            }
        }
        $new_text = ereg_replace("  +", " ", $new_text);
        ## remove double spaces.
        return $new_text;
    }
    function ya_doti($str, $len = 500, $dots = "...") {
        // $len=max length of hometext displayed
        if (strlen($str) > $len) {
            // $dot = " whatever you want here ")
            $str = explode(".", $str);
            // Displayed at the end of hometext
            $dotlen = strlen($dots);
            $str = substr_replace($str[0].$str[1].$str[2].$str[3].$str[4], $dots, $len - $dotlen);
        }
        return $str;
    }
?>