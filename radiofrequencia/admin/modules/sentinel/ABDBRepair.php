<?php

/********************************************************/
/* NukeSentinel(tm) Universal                           */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/
/* CLIKE, UNION, & Email elements from HackAlert        */
/* HTTPAuth element                                     */
/* By: Raven PHP Scripts                                */
/* http://www.ravenphpscripts.com                       */
/* Copyright © 2004 by Raven PHP Scripts                */
/********************************************************/
/* Scripting Blocker elements                           */
/* By: ChatServ                                         */
/* http://www.nukeresources.com                         */
/* Copyright © 2004 by Nuke Resources                   */
/********************************************************/

if(is_god($admin)) {
  $pagetitle = _AB_NUKESENTINEL.": "._AB_DBREPAIR;
  include("header.php");
  title($pagetitle);
  OpenMenu();
  ipbanmenu();
  CarryMenu();
  ipdbmenu();
  CloseMenu();
  echo "<br />\n";
  OpenTable();
  echo "<table width='100%' border='0' cellpadding='2' cellspacing='2' align='center' bgcolor='$bgcolor2'>\n";
  echo "<tr>\n";
  echo "<td width='40%'><b>"._AB_TABLE."</b></td>\n";
  echo "<td align='center' width='15%'><b>"._AB_TYPE."</b></td>\n";
  echo "<td align='center' width='15%'><b>"._AB_STATUS."</b></td>\n";
  echo "<td align='right' width='15%'><b>"._AB_RECORDS."</b></td>\n";
  echo "<td align='right' width='15%'><b>"._AB_SIZE."</b></td>\n";
  echo "</tr>\n";
  $tot_data = $tot_idx = $tot_all = $tot_records = 0;
  $result = $db->sql_query("SHOW TABLE STATUS FROM ".$dbname);
  $tables = $db ->sql_numrows($result);
  if ($tables > 0) {
    while ($row = $db->sql_fetchrow($result)) {
      $checkrow = $db->sql_fetchrow($db->sql_query("CHECK TABLE $row[0]"));
      if($checkrow['Msg_text'] != "OK") {
        $repairrow = $db->sql_fetchrow($db->sql_query("REPAIR TABLE $row[Table] EXTENDED"));
        $status = $repairrow['Msg_text'];
      } else {
        $status = $checkrow['Msg_text'];
      }
      $records = $row['Rows'];
      $tot_records += $records;
      $total = $tot_data + $tot_idx;
      $total = $total / 1024 ;
      $total_total += $total;
      if(!$row['Engine']) { $etype = $row['Type']; } else { $etype = $row['Engine']; }
      echo "<tr onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\" bgcolor='$bgcolor1'>\n";
      echo "<td>".$row['Name']."</td>\n";
      echo "<td align='center'>$etype</td>\n";
      echo "<td align='center'>$status</td>\n";
      echo "<td align='right'>".number_format($records)."</td>\n";
      echo "<td align='right'>".number_format($total, 2, '.', ',')." Kb</td>\n";
      echo "</tr>\n";
    }
    $total_total = $total_total / 1024 ;
    echo "<tr>\n";
    echo "<td><b>$tables "._AB_TABLES."</b></td>\n";
    echo "<td align='center'><b>&nbsp;</b></td>\n";
    echo "<td align='right'><b>&nbsp;</td>\n";
    echo "<td align='right'><b>".number_format($tot_records)."</b></td>\n";
    echo "<td align='right'><b>".number_format($total_total, 2, '.', ',')." Mb</b></td>\n";
    echo "</tr>\n";
  }
  echo "</table>";
  CloseTable();
  include("footer.php");
} else {
  Header("Location: admin.php?op=ABMain");
}

?>