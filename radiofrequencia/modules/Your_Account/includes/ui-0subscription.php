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
if ($Version_Num > 7.0) {
    if (paid() AND !is_admin($admin)) {
      echo "<br>\n";
      OpenTable();
      $row = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$cookie[0]'"));
      if ($subscription_url != "") {
        echo "<center>"._YOUARE." <a href='$subscription_url'>"._SUBSCRIBER."</a> "._OF." $sitename<br>";
      } else {
        echo  "<center>"._YOUARE." "._SUBSCRIBER." "._OF." $sitename<br>";
      }
      $diff = $row[subscription_expire]-time();
      $yearDiff = floor($diff/60/60/24/365);
      $diff -= $yearDiff*60*60*24*365;
      if ($yearDiff < 1) {
        $diff = $row[subscription_expire]-time();
      }
      $daysDiff = floor($diff/60/60/24);
      $diff -= $daysDiff*60*60*24;
      $hrsDiff = floor($diff/60/60);
      $diff -= $hrsDiff*60*60;
      $minsDiff = floor($diff/60);
      $diff -= $minsDiff*60;
      $secsDiff = $diff;
      if ($yearDiff < 1) {
        $rest = "$daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
      } elseif ($yearDiff == 1) {
        $rest = "$yearDiff "._SBYEAR.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
      } elseif ($yearDiff > 1) {
        $rest = "$yearDiff "._SBYEARS.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
      }
      echo "<b>"._SUBEXPIREIN."<br><font color='#FF0000'>$rest</font></b></center>";
      CloseTable();
    } elseif (is_admin($admin)) {
      echo "<br>\n";
      OpenTable();
      $subnum = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$usrinfo[user_id]'"));
      if ($subnum != 0) {
        echo "<center><b>"._ADMSUB."</b></center><br>";
        $row = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$usrinfo[user_id]'"));
        $diff = $row[subscription_expire]-time();
        $yearDiff = floor($diff/60/60/24/365);
        $diff -= $yearDiff*60*60*24*365;
        if ($yearDiff < 1) {
          $diff = $row[subscription_expire]-time();
        }
        $daysDiff = floor($diff/60/60/24);
        $diff -= $daysDiff*60*60*24;
        $hrsDiff = floor($diff/60/60);
        $diff -= $hrsDiff*60*60;
        $minsDiff = floor($diff/60);
        $diff -= $minsDiff*60;
        $secsDiff = $diff;
        if ($yearDiff < 1) {
          $rest = "$daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
        } elseif ($yearDiff == 1) {
          $rest = "$yearDiff "._SBYEAR.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
        } elseif ($yearDiff > 1) {
          $rest = "$yearDiff "._SBYEARS.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
        }
        echo "<center><b>"._ADMSUBEXPIREIN."<br><font color='#FF0000'>$rest</font></b></center>";
      } else {
        echo "<center><b>"._ADMNOTSUB."</b></center>";
      }
      CloseTable();
    } elseif (!paid()) {
      echo "<br>\n";
      OpenTable();
      if ($subscription_url != "") {
        echo "<center>"._NOTSUB." $sitename. "._SUBFROM." <a href='$subscription_url'>"._HERE."</a> "._NOW."</center>";
      } else {
        echo "<center>"._NOTSUB." $sitename.</center>";
      }
      CloseTable();
    }
}

?>