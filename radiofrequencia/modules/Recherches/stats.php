<?php
if (!isset($mainfile)) { include("mainfile.php"); }
if (!eregi("modules.php", $PHP_SELF)) {
die ("Vous ne pouvez pas y accéder directement...");
}

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
$index =0;			/*      (1: afficher les blocks de droite   0: ne pas afficher les blocks de droite)---------*/
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
$top = "20";			/*      (Nombre de données affichées dans le tableau)----------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
$nom = "Recherches";		/*      (nom de votre module)-------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

require_once("mainfile.php");
get_lang($nom);

global $dbi, $bgcolor2, $bgcolor1, $prefix;
include("header.php");

OpenTable();	
echo "<font size=\"3\"><center><b>"._STATS1."</center></font></b><br><br>";
echo "<table border=\"1\" cellpadding=\"0\" cellspacing=\"1\" style=\"border-collapse: collapse\" bordercolor=\"$bgcolor1\" width=\"100%\" align=center>"
    ."<tr>"
    ."<td width=\"6%\" bgcolor=\"$bgcolor2\">"
    ."<p align=\"center\"><b>"._STATS2."</td>";
if (is_admin($admin)) {
   echo "<td width=\"20%\" bgcolor=\"$bgcolor2\">"
    ."<p align=\"center\"><b>"._STATS3."</b></td>";
}else{}
    echo "<td width=\"20%\" bgcolor=\"$bgcolor2\">"
    ."<p align=\"center\"><b>"._STATS4."</b></td>"
    ."<td width=\"20%\" bgcolor=\"$bgcolor2\">"
    ."<p align=\"center\"><b>"._STATS5."</td>"
    ."<td width=\"24%\" bgcolor=\"$bgcolor2\">"
    ."<p align=\"center\"><b>"._STATS6."</td>"
    ."<td width=\"17%\" bgcolor=\"$bgcolor2\">"
    ."<p align=\"center\"><b>"._STATS9."</td>"
    ."</tr>";
    $result = sql_query("select * from ".$prefix."_recherches order by primkey DESC limit 0,$top", $dbi);
    while($liste= mysql_fetch_array($result, $dbi)) {
if (is_admin($admin)) {
echo "<tr><td><div align='center'>".$liste[primkey]."</div></td><td><div align='center'>".$liste[ip]."</div></td><td><div align='center'><a href='modules.php?name=Your_Account&op=userinfo&uname=".$liste[userid]."'>".$liste[userid]."</a></div></td><td><div align='center'>".$liste[date]."</div></td><td><div align='center'><b><font face=\"verdana\"><b><a href=\"modules.php?op=modload&name=$nom&query=".$liste[query]."\">".$liste[query]."</a></div></td><td><div align='center'><b><font face=\"verdana\"><b>".$liste[total]."</div></td></tr>";
}else{
echo "<tr><td><div align='center'>".$liste[primkey]."</div></td><td><div align='center'><a href='modules.php?name=Your_Account&op=userinfo&uname=".$liste[userid]."'>".$liste[userid]."</a></div></td><td><div align='center'>".$liste[date]."</div></td><td><div align='center'><b><font face=\"verdana\"><b><a href=\"modules.php?op=modload&name=$nom&query=".$liste[query]."\">".$liste[query]."</a></div></td><td><div align='center'><b><font face=\"verdana\"><b>".$liste[total]."</div></td></tr>";
}}
echo "</table>";
echo "<br><br><center><b>[<a href=\"javascript:history.go(-1)\">"._STATS8."</a>]";
CloseTable();
echo "<br>";
OpenTable();
echo "<p align=\"right\"><b>"._SEARCHS."</p>";
CloseTable();
	
include("footer.php");
?>