<?php

if (!isset($mainfile)) { include("mainfile.php"); }
if (!eregi("modules.php", $PHP_SELF)) {
die ("Vous ne pouvez pas y accéder directement...");
}

$index =0;
$screens = "1";
$nom = "Recherches";
$offset= "20";

require_once("mainfile.php");

$index = 1;

global $user_prefix, $prefix, $currentlang, $screens;
get_lang($nom);
include("header.php");
if ($query == "") {
OpenTable();
echo "<a name=#top><center>"._HAUTDEPAGE."</center>";
CloseTable();
OpenTable();
$stats = sql_query("select query, date from ".$prefix."_recherches order by date DESC limit 0,1", $dbi);
list($query) = sql_fetch_row($stats, $dbi);
echo "<center><b>"._TEXTE1."</b><br><i>"._TEXTE2."</i></center><br><br><form action=\"modules.php?op=modload&amp;name=$nom&amp;file=index\" method=\"post\">"
."<table border=\"0\" align=\"center\"><tr><td valign=\"middle\"><input type=\"text\" name=\"query\" ></td>"
."<td valign=\"middle\" align=\"left\"><input type=\"image\" src=\"modules/$nom/icon.gif\" align=\"absmiddle\"></td>"
."</tr></table></form>"
."<center><b><font size=\"2\">"._TEXTE."</font></b></center><br><table border=\"0\" width=\"100%\"><tr><td align=\"left\">"._STATS."<b>$query</b></font></td><td align=\"right\"> (<a href=\"modules.php?op=modload&name=$nom&file=stats\">"._STATS0."</a>)</td></tr></table>";
CloseTable();
echo "<br>";
OpenTable();
// Please let this copyright, with this i will be able for continue my works on NUKESEI...
// Laissez le copyright svp... ca me donnera certainement envie de continuer à travailler sur ce module...
echo "<p align=\"right\"><small>"._SEARCHS."</small></p>";
CloseTable();
}else {
global $screens;
OpenTable();
echo "<center>"._HAUTDEPAGE."</center><br><br></font><table width=\"100%\" border=\"0\"><tr><td align=\"left\"><b>[ "._VOTRERECHERCHE.":  $query ]</b></td><td align=\"right\"><b>[ <a href=\"modules.php?op=modload&name=$nom&file=stats\">"._STATS0."</a> ]</b></td></tr></table><br><br>";
if ($screens) {
echo "<center>[ <a href=#news>"._SNEWS."</a> | <a href=#comment>"._SCOMMENTAIRES."</a> | <a href=#dossiers>"._SDOSSIERS."</a> | <a href=#sond>"._SONDAGES."</a> | <a href=#faq>"._SFAQ."</a> | <a href=#gal>Imagens</a> | <a href=#membres>"._SMEMBRES."</a> | <a href=#dl>"._SDOWNLOADS."</a> | <a href=#links>"._SLIENS."</a> ]";
} else {
echo "<center>[ <a href=#news>"._SNEWS."</a> | <a href=#comment>"._SCOMMENTAIRES."</a> | <a href=#dossiers>"._SDOSSIERS."</a> | <a href=#sond>"._SONDAGES."</a> | <a href=#faq>"._SFAQ."</a> | <a href=#membres>"._SMEMBRES."</a> | <a href=#dl>"._SDOWNLOADS."</a> | <a href=#links>"._SLIENS."</a> ]";
}
CloseTable();
switch($op) {
default:
if (!isset($min)) $min=0;
if (!isset($max)) $max=$min+$offset;
$query = stripslashes($query);
######################## AUTRE RECHERCHE #####################
OpenTable();
echo "<a name=#new><form action=\"modules.php?op=modload&amp;name=$nom&amp;file=index\" method=\"post\">";
echo "<table border=\"0\" width=\"100%\"><td align=\"left\"><font face=verdana><b>"._RETEST."</b></td>";
echo "<td align=\"right\"><input type=text size=20 name=query value=\"$query\">&nbsp;<input type=submit value=\""._CHERCHER."\"></td></tr></table>";
CloseTable();
echo "</form>";
#############################################################
########################## ARTICLES ###########################
OpenTable();
if (!$type) {
if ($category > 0) {
$categ = "AND catid=$category ";
} elseif ($category == 0) {
$categ = "";
}
$q = "select s.sid, s.aid, s.informant, s.title, s.time, s.hometext, s.bodytext, a.url, s.comments, s.topic from $prefix"._stories." s, $prefix"._authors." a where s.aid=a.aid $categ";
if (isset($query)) $q .= "AND (s.title LIKE '%$query%' OR s.hometext LIKE '%$query%' OR s.bodytext LIKE '%$query%' OR s.notes LIKE '%$query%') ";
if ($author != "") $q .= "AND s.aid='$author' ";
if ($topic != "") $q .= "AND s.topic='$topic' ";
if ($days != "" && $days!=0) $q .= "AND TO_DAYS(NOW()) - TO_DAYS(time) <= $days ";
$q .= " ORDER BY s.time DESC LIMIT $min,$offset";
$t = $topic;
$result = mysql_query($q);
$nrows1  = mysql_num_rows($result);
$x=0;
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#news><font size=\"2\"><b>$nrows1 "._RESULTATS." "._NEWS."</b></font></center></td></tr></table><br>";
if ($nrows1>0) {
while(list($sid, $aid, $informant, $title, $time, $hometext, $bodytext, $url, $comments, $topic) = mysql_fetch_row($result)) {
$result2=mysql_query("select topictext from $prefix"._topics." where topicid=$topic");
list($topictext) = mysql_fetch_row($result2);
$furl = "modules.php?name=News&file=article&sid=$sid";
$datetime = formatTimestamp($time);
if ($informant == "") {
$informant = $anonymous;
} else {
$informant = "<a href=\"modules.php?name=Your_Account&op=userinfo&amp;uname=$informant\">$informant</a>";
}
if ($query != "") {
if (eregi("$query",$title)) {
$a = 1;
}
$text = "$hometext$bodytext";
if (eregi("$query",$text)) {
$a = 2;
}
if (eregi("$query",$text) AND eregi("$query",$title)) {
$a = 3;
}
if ($a == 1) {
$match = _MATCHTITLE;
} elseif ($a == 2) {
$match = _MATCHTEXT;
} elseif ($a == 3) {
$match = _MATCHBOTH;
}
if (!isset($a)) {
$match = "";
} else {
$match = "$match";
}}
printf("<br><img src=\"modules/$nom/icon1.gif\" border=\"0\" alt=\"\">&nbsp;<a href=\"%s\"><b>%s</b></a> [<font size=\"1\">"._POSTEDBY." <a href=\"%s\">%s</a> "._LE." $datetime]",$furl,$title,$url,$aid,$informant);
echo "</font>";
$x++;
}} else {
echo "<center><b><font class=\"link1\">"._NOREPONSES."</font></b></center>";
}
$prev=$min-$offset;
if ($prev>=0) {
print "<br><br><center><a href=\"modules.php?name=Search&author=$author&amp;topic=$t&amp;min=$prev&amp;query=$query&amp;type=$type&amp;category=$category\">";
print "<b>$min "._AVANT."</b></a></center>";
}
$next=$min+$offset;
if ($x>=9) {
print "<br><br><center><a href=\"modules.php?name=Search&author=$author&amp;topic=$t&amp;min=$max&amp;query=$query&amp;type=$type&amp;category=$category\">";
print "<b>"._APRES."</b></a></center>";
}
CloseTable();
#######################################################################

########################## COMMENTAIRES ###########################
OpenTable();
$result = mysql_query("select tid, sid, subject, date, name from $prefix"._comments." where (comment like '%$query%') order by date DESC limit $min,$offset");
$nrows2  = mysql_num_rows($result);
$x=0;
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#comment><b><font size=\"2\"><center>$nrows2 "._RESULTATS." "._COMMENTS."</b></center></font></td></tr></table><br>";
if ($nrows2>0) {
while(list($tid, $sid, $subject, $date, $name) = mysql_fetch_row($result)) {
$res = mysql_query("select title from $prefix"._stories." where sid='$sid'");
list($title) = mysql_fetch_row($res);
$reply = mysql_num_rows(mysql_query("select * from $prefix"._comments." where pid='$tid'"));
$furl = "modules.php?name=News&file=article&thold=-1&mode=flat&order=0&sid=$sid#$tid";
if(!$name) {
$name = "$anonymous";
} else {
$name = "<a href=\"modules.php?name=Your_Account&op=userinfo&amp;uname=$name\">$name</a>";
}
$datetime = formatTimestamp($date);
echo "<br><img src=\"modules/$nom/icon1.gif\" border=\"0\" alt=\"\">&nbsp;<a href=\"$furl\"><b>$subject</b></a><font size=\"1\"> ["._POSTEDBY." $name ]";
if ($reply == 1) {
if (is_admin($admin)) {
echo " [ <a href=\"admin.php?op=RemoveComment&amp;tid=$tid&amp;sid=$sid\">"._DELETE."</a> ]";
}
} else {
if (is_admin($admin)) {
echo " [ <a href=\"admin.php?op=RemoveComment&amp;tid=$tid&amp;sid=$sid\">"._DELETE."</a> ]";
}
}
$x++;
}
} else {
echo "<center><b><font class=\"link1\">"._NOREPONSES."</font></b></center>";
}
$prev=$min-$offset;
if ($prev>=0) {
print "<br><br><center><a href=\"modules.php?name=Search&author=$author&amp;topic=$topic&amp;min=$prev&amp;query=$query&amp;type=$type\">";
print "<b>$min "._AVANT."</b></a></center>";
}
$next=$min+$offset;
if ($x>=9) {
print "<br><br><center><a href=\"modules.php?name=Search&author=&topic=&min=10&query=$query&amp&type=comments\">";
print "<b>"._APRES."</b></a></center>";
}
CloseTable();
#######################################################################

############################ COMPTES-RENDUS ###################################
OpenTable();
$result = mysql_query("select id, title, text, reviewer, score from $prefix"._reviews." where (title like '%$query%' OR text like '%$query%') order by date DESC limit $min,$offset");
$nrows3  = mysql_num_rows($result);
$x=0;
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#dossiers><b><font size=\"2\"><center>$nrows3 "._RESULTATS." "._REVIEWS."</b></font></center></td></tr></table><br>";
if ($nrows3>0) {
while(list($id, $title, $text, $reviewer, $score) = mysql_fetch_row($result)) {
$furl = "modules.php?name=Reviews&rop=showcontent&amp;id=$id";
$pages = count(explode( "<!--pagebreak-->", $text ));
echo "<br><img src=\"modules/$nom/icon1.gif\" border=\"0\" alt=\"\">&nbsp;<a href=\"$furl\"><b>$title</b></a>";
print "</font>";
$x++;
}
} else {
echo "<center><b><font class=\"link1\">"._NOREPONSES."</font></b></center>";
}
$prev=$min-$offset;
if ($prev>=0) {
print "<br><br><center><a href=\"modules.php?name=Search&author=$author&amp;topic=$t&amp;min=$prev&amp;query=$query&amp;type=reviews\">";
print "<b>$min "._AVANT."</b></a></center>";
}
$next=$min+$offset;
if ($x>=9) {
print "<br><br><center><a href=\"modules.php?name=Search&author=$author&amp;topic=$t&amp;min=$max&amp;query=$query&amp;type=reviews\">";
print "<b>"._APRES."</b></a></center>";
}
CloseTable();
#######################################################################

############################ SONDAGES ##################################
OpenTable();
$result = mysql_query("select pollID, pollTitle, voters from $prefix"._poll_desc." where (pollTitle like '%$query%') order by pollID DESC limit $min,$offset");
$nrows4  = mysql_num_rows($result);
$x=0;
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#sond><b><font size=\"2\"><center>$nrows4 "._RESULTATS." "._SONDAGES."</b></font></center></td></tr></table><br>";
if ($nrows4>0) {
while(list($pollID, $pollTitle, $voters) = mysql_fetch_row($result)) {
$furl = "modules.php?name=Surveys&pollID=$pollID";
echo "<br><img src=\"modules/$nom/icon1.gif\" border=\"0\" alt=\"\">&nbsp;<a href=\"$furl\"><b>$pollTitle</b></a>&nbsp;($voters "._VOTES.")";
$x++;
}
} else {
echo "<center><b><font class=\"link1\">"._NOREPONSES."</font></b></center>";
}
$prev=$min-$offset;
CloseTable();
#######################################################################

############################# PAGES (CONTENU) ################################
OpenTable();
$result = mysql_query("select pid, cid, title, subtitle, page_header, text, page_footer, date  from $prefix"._pages." where (title like '%$query%' OR subtitle like '%$query%'  OR page_header like '%$query%' OR text like '%$query%' OR page_footer like '%$query%' ) order by date DESC limit $min,$offset");
$nrows5  = mysql_num_rows($result);
$x=0;
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#pages><b><font size=\"2\"><center>$nrows5 "._RESULTATS." "._PAGES."</b></center></td></tr></table>";
if ($nrows5>0) {
$result2 = sql_query("select cid, title from $prefix"._pages_categories." where title LIKE '%$query%' ORDER BY title DESC", $dbi);
while(list($cid, $title) = sql_fetch_row($result2, $dbi)) {
$res = sql_query("select * from $prefix"._pages." where cid=$cid", $dbi);
$numrows = sql_num_rows($res, $dbi);
echo "<a href=\"modules.php?name=Content&pa=list_pages_categories&amp;cid=$cid\"></a>";
}
}
if ($nrows5>0) {
echo "<br>";
while(list($pid, $cid, $title, $subtitle, $page_header, $text, $page_footer, $date) = mysql_fetch_row($result)) {
$furl = "modules.php?name=Content&pa=showpage&amp;pid=$pid";
$pages = count(explode( "<!--pagebreak-->", $text ));
echo "<img src=\"modules/$nom/icon1.gif\" border=\"0\" alt=\"\">&nbsp;<a href=\"$furl\"><b>$title</b></a><br>";
print "</font>";
$x++;
}
} else {
echo "<center><b><font class=\"link1\">"._NOREPONSES."</font></b></center>";
}
$prev=$min-$offset;
CloseTable();
#######################################################################

############################ SECTIONS ##################################
//OpenTable();
//$result = mysql_query("select artid, secid, title, content, counter from $prefix"._seccont." where (title like '%$query%' OR content like '%$query%') order by artid DESC limit $min,$offset");
//$nrows6  = mysql_num_rows($result);
//$x=0;
//echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#sections><b><font size=\"2\"><center>$nrows6 "._RESULTATS." "._SECTIONS."</b></font></center></td></tr></table><br>";
//if ($nrows6>0) {
//while(list($artid, $secid, $title, $content, $counter) = mysql_fetch_row($result)) {
//$pages = count(explode( "<!--pagebreak-->", $content ));
//$result2 = mysql_query("select secname from $prefix"._sections." where secid='$secid'");
//list($sectitle) = mysql_fetch_row($result2);
//$surl = "modules.php?name=Sections&op=listarticles&amp;secid=$secid";
//$furl = "modules.php?name=Sections&op=viewarticle&amp;artid=$artid";
//echo "<br><img src=\"modules/$nom/icon1.gif\" border=\"0\" alt=\"\">&nbsp;<a href=\"$furl\"><b>$title</b></a><font size=\"1\"> [ "._RUB.": <a href=\"$surl\">$sectitle</a> ] ["._HITS.": <b><font face=verdana>$counter</font></b>]";
//echo "</font>";
//$x++;
//}
//} else {
//echo "<center><b><font class=\"link1\">"._NOREPONSES."</font></b></center>";
//}
//$prev=$min-$offset;
//if ($prev>=0) {
//print "<br><br><center><a href=\"modules.php?name=Search&author=$author&amp;topic=$t&amp;min=$prev&amp;query=$query&amp;type=sections\">";
//print "<b>$min "._AVANT."</b></a></center>";
//}
//$next=$min+$offset;
//if ($x>=9) {
//print "<br><br><center><a href=\"modules.php?name=Search&author=$author&amp;topic=$t&amp;min=$max&amp;query=$query&amp;type=sections\">";
//print "<br><b>"._APRES."</b></a></center>";
//}
//CloseTable();
#######################################################################

############################### F.A.Q ################################
OpenTable();
$result = mysql_query("select id, question, answer, id_cat from $prefix"._faqanswer." where (question like '%$query%' OR answer like '%$query%') order by id DESC limit $min,$offset");
$nrows7  = mysql_num_rows($result);
$x=0;
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#faq><b><font size=\"2\"><center>$nrows7 "._RESULTATS." "._FAQ."</b></font></center></td></tr></table><br>";
if ($nrows7>0) {
while(list($id, $question, $answer, $id_cat) = mysql_fetch_row($result)) {
$result2 = mysql_query("select categories from $prefix"._faqCategories." where id_cat='$id_cat'");
list($categories) = mysql_fetch_row($result2);
$furl = "modules.php?op=modload&amp;name=FAQ&amp;file=index&amp;myfaq=yes&amp;id_cat=$id_cat#$id";
$furl1 = "modules.php?op=modload&amp;name=FAQ&amp;file=index&amp;myfaq=yes&amp;id_cat=$id_cat";            
echo "<br><img src=\"modules/$nom/icon1.gif\" border=\"0\" alt=\"\">&nbsp;<a href=\"$furl\"><b>$question</b></a> &nbsp;<font size=1>["._CAT.": <a href=\"$furl1\">$categories</a></b>]</font>";
echo "</font>";
$x++;
}
} else {
echo "<center><b><font class=\"link1\">"._NOREPONSES."</font></b></center>";
}
$prev=$min-$offset;
CloseTable();
#######################################################################

############################ My_eGallery ####################################
global $screens;
if ($screens) {
OpenTable();
$result = mysql_query("select pid, comment, name from $prefix"._gallery_comments." where (comment like '%$query%') order by pid DESC limit $min,$offset");
//$nrows8  = mysql_num_rows($result);
$x=0;
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#gal><b><font size=\"2\"><center>$nrows8 "._RESULTATS." "._CSCREENS."</b></font></center></td></tr></table><br>";
if ($nrows8>0) {
while(list($pid, $comment, $name) = mysql_fetch_row($result)) {
$furl = "modules.php?op=modload&name=My_eGallery&file=index&do=showpic&pid=$pid";
echo "<br><img src=\"modules/$nom/icon1.gif\" border=\"0\" alt=\"\">&nbsp;<a href=\"$furl\"><b>$comment</b></a> ["._PAR." <a href=modules.php?name=Your_Account&op=userinfo&uname=$name>$name</a>]";
echo "</font>";
}
echo "<br><br><br>";
} else {
echo "<center><b><font class=\"link1\">"._NOREPONSES."</font></b></center>";
}
$prev=$min-$offset;
#########################################################################
$result2 = mysql_query("select pid, description, name, counter, submitter from $prefix"._gallery_pictures." where (name like '%$query%' OR description like '%$query%') order by pid DESC limit $min,$offset");
//$nrows9  = mysql_num_rows($result2);
$x=0;
echo "<br><table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#gal><b><font size=\"2\"><center>$nrows9 "._RESULTATS." "._SCREENS."</b></font></center></td></tr></table><br>";
if ($nrows9>0) {
while(list($pid1, $description1, $name1, $counter1, $submitter1) = mysql_fetch_row($result2)) {
$furl1 = "modules.php?op=modload&name=My_eGallery&file=index&do=showpic&pid=$pid1";
$furl = "modules.php?name=Your_Account&op=userinfo&amp;uname=$submitter1";
echo "<br><img src=\"modules/$nom/icon1.gif\" border=\"0\" alt=\"\">&nbsp;<a href=\"$furl1\"><b>$name1</b></a> <font size=1>["._DE." <a href=$furl>$submitter1</a>] ["._HITS.": <b><font face=verdana>$counter1</font></b>] &nbsp; $description1";
echo "</font>";
}
} else {
echo "<center><b><font class=\"link1\">"._NOREPONSES."</font></b></center>";
}
$prev=$min-$offset;
CloseTable();
}
#########################################################################

############################## MEMBRES ####################################
OpenTable();
$result = mysql_query("select uid, uname, name, user_intrest, user_sig, user_from from $user_prefix"._users." where (uname like '%$query%' OR name like '%$query%' OR user_intrest like '%$query%' OR user_sig like '%$query%' OR user_from like '%$query%') order by uname ASC limit $min,$offset");
//$nrows10  = mysql_num_rows($result);
$x=0;
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#membres><b><font size=\"2\"><center>$nrows10 "._RESULTATS." "._USERS."</b></font></center></td></tr></table><br>";
if ($nrows10>0) {
while(list($uid, $uname, $name, $user_intrest, $user_sig, $user_from) = mysql_fetch_row($result)) {
$furl = "modules.php?name=Your_Account&op=userinfo&amp;uname=$uname";
echo "<br><img src=\"modules/$nom/icon1.gif\" border=\"0\" alt=\"\">&nbsp;<a href=\"$furl\"><b>$uname</b></a></font>";
echo "</font>";
$x++;
}} else {
echo "<center><b><font class=\"link1\">"._NOREPONSES."</font></b></center>";
}
$prev=$min-$offset;
if ($prev>=0) {
print "<br><br><center><a href=\"modules.php?name=Search&author=$author&amp;topic=$t&amp;min=$prev&amp;query=$query&amp;type=users\">";
print "<b>$min "._AVANT."</b></a></center>";
}
$next=$min+$offset;
if ($x>=9) {
print "<br><br><center><a href=\"modules.php?name=Search&author=$author&amp;topic=$t&amp;min=$max&amp;query=$query&amp;type=users\">";
print "<b>"._APRES."</b></a></center>";
}}CloseTable();}

#######################################################################

############################### DOWNLOADS ###############################
function download($query, $min, $orderby, $show) {
include("modules/Downloads/d_config.php");
global $prefix, $dbi, $admin, $bgcolor2;
if (!isset($min)) $min=0;
if (!isset($max)) $max=$min+$downloadsresults;
if(isset($orderby)) {
$orderby = convertorderbyin($orderby);
} else {
$orderby = "title ASC";
}
if ($show!="") {
$downloadsresults = $show;
} else {
$show=$downloadsresults;
}
$query = addslashes($query);
$result = sql_query("select lid, cid, title, url, description, date, hits, filesize, version, homepage from ".$prefix."_nsngd_downloads where title LIKE '%$query%' OR description LIKE '%$query%' ORDER BY $orderby LIMIT $min,$downloadsresults", $dbi);
$fullcountresult = sql_query("select lid, title, description, date, hits from ".$prefix."_nsngd_downloads where title LIKE '%$query%' OR description LIKE '%$query%' ", $dbi);
$totalselecteddownloads = sql_num_rows($fullcountresult, $dbi);
$nrows11  = sql_num_rows($result, $dbi);
$x=0;
$the_query = stripslashes($query);
$the_query = str_replace("\'", "'", $the_query);
OpenTable();
if ($query != "") {
if ($nrows11>0) {
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#dl><b><font size=\"2\"><center>$nrows11 "._RESULTATS." "._DOWNLOADS."</b></font></center></td></tr></table><br>";
$result2 = sql_query("select cid, title from ".$prefix."_nsngd_categories where title LIKE '%$query%' ORDER BY title DESC", $dbi);
while(list($cid, $stitle) = sql_fetch_row($result2, $dbi)) {
$res = sql_query("select * from ".$prefix."_nsngd_downloads where cid=$cid", $dbi);
$numrows = sql_num_rows($res, $dbi);
$result3 = sql_query("select cid,title,parentid from ".$prefix."_nsngd_categories where cid=$cid", $dbi);
list($cid3,$title3,$parentid3) = sql_fetch_row($result3, $dbi);
if ($parentid>0) $title3 = getparent($parentid,$title);
$title3 = ereg_replace($query, "$query", $title);
}
echo "<br>";
while(list($lid, $cid, $title, $url, $description) = sql_fetch_row($result, $dbi)) {
$downloadratingsummary = number_format($downloadratingsummary, $mainvotedecimal);
$title = stripslashes($title); $description = stripslashes($description);
$transfertitle = str_replace (" ", "_", $title);
$title = ereg_replace($query, "$query", $title);
global $prefix, $dbi, $admin;
if (is_admin($admin)) {
echo "<a href=\"admin.php?op=DownloadsModDownload&amp;lid=$lid\"><img src=\"modules/Recherches/icon1.gif\" border=\"0\">&nbsp;</a>&nbsp;";
} else {
echo "<img src=\"modules/Recherches/icon1.gif\" border=\"0\" alt=\"\">&nbsp;";
}
echo "<a href=\"modules.php?name=Downloads&d_op=viewdownloaddetails&amp;lid=$lid&amp;ttitle=$transfertitle\"><b>$title</b></a> $description";
echo "<br>";
$result3 = sql_query("select cid,title,parentid from ".$prefix."_nsngd_categories where cid=$cid", $dbi);
list($cid3,$title3,$parentid3) = sql_fetch_row($result3, $dbi);
$x++;
}
echo "</font>";
} else {
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#dl><b><font size=\"2\"><center>$nrows11 "._RESULTATS." "._DOWNLOADS."</b></font></center></td></tr></table><br><center><font class=\"option\"><b><font class=\"link1\">"._NOREPONSES."</font></b></font></center>";
}
$downloadpagesint = ($totalselecteddownloads / $downloadsresults);
$downloadpageremainder = ($totalselecteddownloads % $downloadsresults);
if ($downloadpageremainder != 0) {
$downloadpages = ceil($downloadpagesint);
if ($totalselecteddownloads < $downloadsresults) {
$downloadpageremainder = 0;
}
} else {
$downloadpages = $downloadpagesint;
}
if ($downloadpages!=1 && $downloadpages!=0) {
echo "<br><br>"
.""._SELECTPAGE.": ";
$prev=$min-$downloadsresults;
if ($prev>=0) {
echo "&nbsp;&nbsp;<b>[ <a href=\"modules.php?name=Downloads&d_op=search&amp;query=$the_query&amp;min=$prev&amp;orderby=$orderby&amp;show=$show\">"
." &lt;&lt; "._AVANT."</a> ]</b> ";
}
$counter = 1;
$currentpage = ($max / $downloadsresults);
while ($counter<=$downloadpages ) {
$cpage = $counter;
$mintemp = ($perpage * $counter) - $downloadsresults;
if ($counter == $currentpage) {
echo "<b>$counter</b> ";
} else {
echo "<a href=\"modules.php?name=Downloads&d_op=search&amp;query=$the_query&amp;min=$mintemp&amp;orderby=$orderby&amp;show=$show\">$counter</a> ";
}
$counter++;
}
$next=$min+$downloadsresults;
if ($x>=$perpage) {
echo "&nbsp;&nbsp;<b> <a href=\"modules.php?name=Downloads&d_op=search&amp;query=$the_query&amp;min=$max&amp;orderby=$orderby&amp;show=$show\">"
." "._APRES." &gt;&gt;</a></b>";
}
}
} else {
echo "";
}CloseTable();}
#######################################################################

################################ LIENS WEB #################################
function search($query, $min, $orderby, $show) {
include("modules/Web_Links/l_config.php");
global $prefix, $dbi, $admin, $bgcolor2;
if (!isset($min)) $min=0;
if (!isset($max)) $max=$min+$linksresults;
if(isset($orderby)) {
$orderby = convertorderbyin($orderby);
} else {
$orderby = "title ASC";
}
if ($show!="") {$linksresults = $show;
} else {
$show=$linksresults;}
$query = stripslashes($query);
$result = sql_query("select lid, cid, sid, title, url, description, date, hits, linkratingsummary, totalvotes, totalcomments from $prefix"._links_links." where title LIKE '%$query%' OR description LIKE '%$query%' ORDER BY $orderby LIMIT $min,$linksresults", $dbi);
$fullcountresult=sql_query("select lid, title, description, date, hits, linkratingsummary, totalvotes, totalcomments from $prefix"._links_links." where title LIKE '%$query%' OR description LIKE '%$query%'", $dbi);
$totalselectedlinks = sql_num_rows($fullcountresult, $dbi);
$nrows12  = sql_num_rows($result, $dbi);
$x=0;
OpenTable();
if ($query != "") {
if ($nrows12>0) {
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#links><b><font size=\"2\"><center>$nrows12 "._RESULTATS." "._WEBLINKS."</font></center></b></td></tr></table><br>";
$result2 = sql_query("select cid, title from $prefix"._links_categories." where title LIKE '%$query%' ORDER BY title DESC", $dbi);
while(list($cid, $stitle) = sql_fetch_row($result2, $dbi)) {
$res = sql_query("select * from $prefix"._links_links." where cid=$cid", $dbi);
$numrows = sql_num_rows($res, $dbi);
$result3 = sql_query("select cid,title,parentid from $prefix"._links_categories." where cid=$cid", $dbi);
list($cid3,$title3,$parentid3) = sql_fetch_row($result3, $dbi);
if ($parentid3>0) $title3 = getparent($parentid3,$title3);
$title3 = ereg_replace($query, "$query", $title3);
}
while(list($lid, $cid, $sid, $title, $url, $description, $time, $hits, $linkratingsummary, $totalvotes, $totalcomments) = sql_fetch_row($result, $dbi)) {
$linkratingsummary = number_format($linkratingsummary, $mainvotedecimal);
$title = stripslashes($title); $description = stripslashes($description);
$transfertitle = str_replace (" ", "_", $title);
$title = ereg_replace($query, "$query", $title);
echo "<img src=\"modules/Recherches/icon1.gif\" border=\"0\" alt=\"\"> <b><a href=\"modules.php?op=modload&name=Web_Links&file=index&l_op=visit&amp;lid=$lid\" target=\"new\">$title</a></b> ";
echo " ";
$description = ereg_replace($query, "<b>$query</b>", $description);
echo "  $description<br>";
echo "";
$x++;
}
echo "</font>";
} else {
echo "<table width=100% bgcolor=$bgcolor2><tr><td align=center><a name=#links><b><font size=\"2\"><center>$nrows12 "._RESULTATS." "._WEBLINKS."</font></center></b></td></tr></table><br><center><font class=\"option\"><b><font class=\"link1\">"._NOREPONSES."</font></b></font></center>";
}
$linkpagesint = ($totalselectedlinks / $linksresults);
$linkpageremainder = ($totalselectedlinks % $linksresults);
if ($linkpageremainder != 0) {
$linkpages = ceil($linkpagesint);
if ($totalselectedlinks < $linksresults) {
$linkpageremainder = 0;
}
} else {
$linkpages = $linkpagesint;
}
if ($linkpages!=1 && $linkpages!=0) {
echo "<br><br>"
.""._SELECTPAGE.": ";
$prev=$min-$linksresults;
if ($prev>=0) {
echo "&nbsp;&nbsp;<b>[ <a href=\"modules.php?op=modload&name=Web_Links&file=index&l_op=search&amp;query=$query&amp;min=$prev&amp;orderby=$orderby&amp;show=$show\">"
." &lt;&lt; "._AVANT."</a> ]</b> ";
}
$counter = 1;
$currentpage = ($max / $linksresults);
while ($counter<=$linkpages ) {
$cpage = $counter;
$mintemp = ($perpage * $counter) - $linksresults;
if ($counter == $currentpage) {
echo "<b>$counter</b> ";
} else {
echo "<a href=\"modules.php?op=modload&name=Web_Links&file=index&l_op=search&amp;query=$query&amp;min=$mintemp&amp;orderby=$orderby&amp;show=$show\">$counter</a> ";
}$counter++;}
$next=$min+$linksresults;
if ($x>=$perpage) {
echo "&nbsp;&nbsp;<b> <a href=\"modules.php?op=modload&name=Web_Links&file=index&l_op=search&amp;query=$query&amp;min=$max&amp;orderby=$orderby&amp;show=$show\">"
." "._APRES." &gt;&gt;</a> </b>";
}}} else {}CloseTable();}
##########################################
################ STATS ####################
global $user, $cookie, $anonymous, $prefix;
if (is_user($user)) {
cookiedecode($user);
$userid = $cookie[1];
} else {    $userid = ""._ANONYME.""; }
$query = stripslashes(FixQuotes(check_html($query)));
$ip = getenv("REMOTE_ADDR");

$date = date("d-m-Y "._A." H:i", time());
$total = $nrows1 + $nrows2 + $nrows3 + $nrows4 + $nrows5 + $nrows6 + $nrows7 + $nrows8 + $nrows9 + $nrows10 + $nrows11 + $nrows12;
sql_query("insert into ".$prefix."_recherches values (NULL, '$ip', '$query', '$date', '$userid', '$total')", $dbi);
##########################################
################ BUG FIXE ##################
function getparent($parentid,$title) {
global $prefix, $dbi;
$result = sql_query("select cid, title, parentid from ".$prefix."_downloads_categories where cid=$parentid", $dbi);
list($cid, $ptitle, $pparentid) = sql_fetch_row($result, $dbi);
if ($ptitle!="") $title=$ptitle."/".$title;
if ($pparentid!=0) {
$title=getparent($pparentid,$title);
}return $title;}
#########################################
download($query, $min, $orderby, $show);
search($query, $min, $orderby, $show);
$query = trim($query);
$searchresults = "";
echo "<br>";
################### SIGNET TOP ############
OpenTable();
 echo "<center><b>[ <a href=#top>"._BACKHAUT."</a> ]";
CloseTable();
OpenTable();
echo "<p align=\"right\"><b>"._SEARCHS."</p>";
CloseTable();
#########################################
}


include("footer.php");

?>