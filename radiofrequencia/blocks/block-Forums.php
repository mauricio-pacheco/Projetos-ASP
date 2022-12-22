<?php

# $Author: cs $
# $Date: 2003/07/31 01:21:57 $

/************************************************************************/
/* Forums Block for phpBB 2.0.0 port to PHP Nuke 6.5b5- and 6.0         */
/* ============================================================         */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi (fbc@mandrakesoft.com)         */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* Version 1, modified by Sébastien Vaast                               */
/* http://membres.lycos.fr/projectpluto/                                */
/*                                                                      */
/* Updated by Tom Nitzschner 22/06/2002 to add the scrolling text       */
/*                                                                      */
/* Updated by Paul Laudanski 14 Jan 2003                                */
/* NukeCops.com  |  ComputerCops.biz                                    */
/*                                                                      */
/* Last Edited - 14 Jan 2003                                            */
/*                                                                      */
/* This Block shows the last 10 topics where a message was posted,      */
/* along with the username of the last poster and the day and time      */
/* of the post.                                                         */
/* It will also show smileys in the topic titles thanks to the          */
/* smileys.php file found in Leo Tan Block Forums version               */
/* (http://www.cybercomp.d2g.com).                                      */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/

if (eregi("block-Forums.php", $PHP_SELF)) {
    Header("Location: index.php");
    die();
}

include_once ('blocks/smileys.php');

global $prefix, $dbi, $sitename, $user, $cookie, $group_id, $user_prefix;
$count = 1;
$content = "<center><table width=\"100% align=\"center\"><tr><td align=\"center\">";
// $content .="<a href=\"backendforums.php\"><img src=\"images/xml.gif\" border=\"0\"></a></center><br>";
$content .="<A name= \"scrollingCode\"></A>";
$content .="<MARQUEE behavior= \"scroll\" align= \"center\" direction= \"up\" height=\"180\" scrollamount= \"2\" scrolldelay= \"70\" onmouseover='this.stop()' onmouseout='this.start()'>";
$content .="<center><font color=\"#666666\"><b>Últimas 30 mensagens nos Foros</b></center>";
$forum1 = sql_query("SELECT t.topic_id, t.topic_last_post_id, t.topic_title, t.topic_poster, t.topic_views, t.topic_replies, f.forum_name, f.forum_id FROM ".$prefix."_bbtopics t, ".$prefix."_bbforums f where t.forum_id=f.forum_id and f.auth_view=0  ORDER BY t.topic_last_post_id DESC LIMIT 30", $dbi);
$content .= "<br>";
while(list($topic_id, $topic_last_post_id, $topic_title, $topic_poster, $topic_views, $topic_replies, $forum_name, $forum_id) = sql_fetch_row($forum1, $dbi)) {
$forum2 = sql_query("SELECT topic_id, poster_id, FROM_UNIXTIME(post_time,'%d.%m.%Y às %T') as post_time FROM ".$prefix."_bbposts where post_id='$topic_last_post_id'", $dbi);
list($topic_id, $poster_id, $post_time)=sql_fetch_row($forum2, $dbi);

$forum3 = sql_query("SELECT username, user_id FROM ".$user_prefix."_users where user_id='$topic_poster'", $dbi);
list($username, $user_id)=sql_fetch_row($forum3, $dbi);
$avtor=$username;
$sifra=$user_id;                                      

$forum4 = sql_query("SELECT username, user_id FROM ".$user_prefix."_users where user_id='$poster_id'", $dbi);
list($username, $user_id)=sql_fetch_row($forum4, $dbi);

$topic_title=parseEmoticons($topic_title);
// Remove the comment below to add the counter
//$content .="<><font color=\"#666666\"><b>Message: $count<br></b>";

$content .= "<img src=\"modules/Forums/templates/subSilver/images/icon_minipost.gif\" border=\"0\" alt=\"\"><a href=\"ftopict-$topic_id.html#$topic_last_post_id\"><b> $topic_title </b></a> <br />
			<font color=\"#666666\"><b>Fórum:</b> <a href=\"modules.php?name=Forums&amp;file=viewforum&amp;f=$forum_id\">$forum_name</a> | <b>Autor:</b> <A HREF=\"userinfo-$avtor.html\">$avtor</a> | <b>Respostas:</b> $topic_replies | <b>Visualizações:</b> $topic_views<br />
			<b>Última mensagem de:</b> <A HREF=\"userinfo-$username.html\">$username</a>, no dia </b> $post_time<br>
			<br><br>";
;
$count = $count + 1;
}
$content .= "<br><center><a href=\"index.php\"><img src=\"http://phpnuke.org.br/images/minibanner.gif\" border=\"0\" alt=\"Foros da Comunidade PHP-Nuke Brasil - CNB\"></a><br>Foros da Comunidade PHP-Nuke Brasil - CNB</td></tr></table></center>";

# $Log: block-Forums.php,v $
# Revision 1.3  2003/07/31 01:21:57  cs
# Updated to 6.7
#
# Revision 1.2  2003/07/25 18:02:55  zx
# This next release offers the scrolling block forums as seen at nukecops.com
#
?>