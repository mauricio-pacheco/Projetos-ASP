<?php

function MakeDate($time) {
    global $datetime, $locale, $lang;
    setlocale (LC_TIME, $locale);
    ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $time, $datetime);
    $yy = strftime("%Y", mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]));
    if ($lang == "thai") {
	$yy = intval($yy) + 543;
    }

    $dt = strftime("%d %b $yy %H:%M:%S", mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]));
    return($dt);
}


function navigationPic($name, $gid, $pid, $orderby) {
	global $baseurl, $basepath, $font, $prefix, $db ;

	$orderbyA = convertorderbyin($orderby);
	$sql = "SELECT pid, name FROM $prefix"._gallery_pictures." where gid=$gid ORDER BY $orderbyA";
	$res = $db->sql_query($sql);
	$max = $db->sql_numrows($res);
	if (!$max) {
		return "&nbsp;";
	}
	$ind = getPos($res, $pid);
	if ($ind>0) {
		$prev = mysql_result($res, $ind-1, 0);
		$pname = mysql_result($res, $ind-1, 1);
	}
	if ($ind<$max-1) {
		$next = mysql_result($res, $ind+1, 0);
		$nname = mysql_result($res, $ind+1, 1);
	}

	$out = '<p align="right">';
	if ($prev) {
		$out .= '<a class="'.$font['normal'].'" href="'.$baseurl.'&amp;do=showpic&amp;gid='.$gid.'&amp;pid='.$prev.'&amp;orderby='.$orderby.'"><img src="modules/My_eGallery/images/left.gif" alt="'._GALPREV.'" border="0" align="middle"></a><font class="'.$font['normal'].'">';
	} else {
		$out .= '<img src="modules/My_eGallery/images/left_2.gif" alt="'._GALPREV.'" border="0" align="middle" >';
	}

	$out .= '<img src="modules/My_eGallery/images/dot.gif" alt="" border="0" align="middle">';

 	if ($next) {
		$out .= '<a class="'.$font['normal'].'" href="'.$baseurl.'&amp;do=showpic&amp;gid='.$gid.'&amp;pid='.$next.'&amp;orderby='.$orderby.'"><img src="modules/My_eGallery/images/right.gif" alt="'._GALNEXT.'" border="0" align="middle"></a>';
	} else {
		$out .= '<img src="modules/My_eGallery/images/right_2.gif" alt="'._GALNEXT.'" border="0" align="middle">';
	}

	$out .= '&nbsp;</p>';
	return $out;
}


function displayPicturePic($row, $size) {
	global $gallerypath	;
	$desc = str_replace("\"", "''", $row['description']);
	$desc = substr($desc, 0, 255);
	$template = $row[displaytag];
	$template = str_replace('<:FILENAME:>', "$gallerypath/$row[galloc]/$row[img]", $template);
	$template = str_replace('<:WIDTH:>', $size[0], $template);
	$template = str_replace('<:HEIGHT:>', $size[1], $template);
	$template = str_replace('<:DESCRIPTION:>', $desc, $template);
	return $template;
}

function displayDescriptionPic($row) {
	global $bgcolor1, $bgcolor2, $font ;
	$desc ="<table border=\"0\" width=\"100%\" cellspacing=\"1\" cellpadding=\"10\" bgcolor=\"$bgcolor1\">
						<tr><td bgcolor=\"$bgcolor2\" align=\"center\" valign=\"middle\">";
							
	if ($row[description]!="") {
	    $desc .= "<font class=".$font['title'].">"._GALDESCRIPTIONS."</font><br><br>". str_replace("\n","<br>",$row['description']);
	    $desc .= "<br>...";
	} else {
	    $desc .= "<font class=".$font['title'].">"._GALDESCRIPTIONS."</font><br><br>";
	    $desc .= "...";
	}
	$desc .= "</td></tr></table>\n";
	return $desc;
}

function displaySizePic($row, $size) {
	global $font;
	return '<font class="'.$font['tiny'].'">['.$size[0].' x '.$size[1].' '.substr($row[img],strrpos($row[img], '.')+1).']</font>';
}

function displayDateAddedPic($row) {
	global $locale, $lang, $font;
	 
	 $time = strftime("%Y-%m-%d %H:%M:%S", $row[unix_time]);
	setlocale (LC_TIME, $locale);
	ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $time, $datetime);
	$yy = strftime("%Y", mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]));
	if ($lang == "thai") {
	    $yy = intval($yy) + 543;
	}
	$dt = strftime("%d %b $yy %H:%M:%S", mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]));
	return '<font class="'.$font['tiny'].'">'.$dt.'</font>';
	
}

function displaySubmitterPic($row) {
	global $bgcolor1, $bgcolor2, $font, $prefix, $db	;

	$result = $db->sql_query("SELECT * FROM $prefix"._users." where username='".$row[submitter]."'");
	if($db->sql_numrows($result)>0) {
		$row[submitter] = '<a href="modules.php?name=Your_Account&amp;op=userinfo&amp;username='.$row[submitter].'" target="_blank">'.$row[submitter].'</a>';
	}
	return '<font class="'.$font['tiny'].'">'.$row[submitter].'</font>';
}


function displayHitsPic($row) {
	global $bgcolor1, $bgcolor2, $font	;
	return '<font class="'.$font['tiny'].'">'.$row[counter].' '._GALTIMES.'</font>' ;
}


function displayRatePic($row) {
	global $font, $galleryvar;
	return '<font class="'.$font['tiny'].'">'.$row[votes].' '._GALTIMES.'</font>' ;
}

function displayRatingBarPic($row, $orderby) {
	global $galleryvar, $user, $baseurl, $imagepath, $font ;

	if (!$galleryvar['allowrate']) {
	    return "";
	}

	if(!$galleryvar['anonrate'] || $user) {
		return  '<form action="'.$baseurl.'&amp;do=Vote" method="post">'

			.'<input type="hidden" name="pid" value="'.$row[pid].'">'
			.'<input type="hidden" name="orderby" value="'.$orderby.'">'
			.'<table width="160" border="0" cellpadding="5" cellspacing="1" align="center">'
			.'<tr>'
			.'<td align="center" valign="middle">'._RATING.':&nbsp;&nbsp;'
			.'<select name="rate">'
			.'<option value="1">1</option>'
			.'<option value="2">2</option>'
			.'<option value="3">3</option>'
			.'<option value="4">4</option>'
			.'<option value="5">5</option>'
			.'<option value="6">6</option>'
			.'<option value="7">7</option>'
			.'<option value="8">8</option>'
			.'<option value="9">9</option>'
			.'<option value="10" selected>10</option>'
			.'</select>'
			.'</td></tr><tr>'
			.'<td align="center" valign="middle">'
			.'<input src="'.$imagepath.'/vote.gif" type="image">'
			.'</td>'
			.'</tr>'
			.'</table>'
			.'</form>';
	} else {
		return '<p align="center"><font class="'.$font['tiny'].'">'._GALMEMBERSRATE.'</font></p>';
	}
}

function CommentBox($pid) {
   global $adminpath, $user, $baseurl, $admin, $imagepath, $prefix, $db, $font, $galleryvar, $bgcolor1, $bgcolor2 ;
	
	if ( !$galleryvar['allowcomments'] ) {
		$cmmbox = "&nbsp;";
		return $cmmbox;
	}
	/*<form action="'.$baseurl.'" method="POST">'
		.'<input type="hidden" name="do" value="Post">'
	*/
	
	if ( is_user($user) ) {
		//Member Comment
		$userdata=cookiedecode($user);
		$uname = "<b>".$userdata[1]."</b>"
							  ."<input type=\"hidden\" name=\"gname\" value=\"".$userdata[1]."\">"
							  ."<input type=\"hidden\" name=\"member\" value=\"1\"><br>";
		$cmmbox = "<p align=\"center\"><font class=\"" . $font['title'] . "\">" ._GALCOMMPOST."</font></p>\n
									<form action=\"$baseurl\" method=\"Post\">
										<input type=\"hidden\" name=\"do\" value=\"Post\">
										<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"5\" bgcolor=\"$bgcolor1\">
										  <tr bgcolor=\"$bgcolor2\"> 
											<td width=\"21%\">"._GALNAME."</td>
											<td width=\"79%\">$uname</td>
										  </tr>
										  <tr bgcolor=\"$bgcolor2\"> 
											<td width=\"21%\" valign=\"top\">"._GALCOMMENT."</td>
											<td width=\"79%\">
												<textarea name=\"comment\" cols=\"45\" rows=\"10\"></textarea><br>
												<font class=\"".$font['tiny']."\">&nbsp;&nbsp;"._GALNOTE."</font>
											</td>
										  </tr>
										  <tr bgcolor=\"$bgcolor2\"> 
											<td width=\"21%\">&nbsp;</td>
											<td width=\"79%\">
											    <input class=\"textbox\" type=\"hidden\" name=\"pid\" value=\"$pid\">
											    <input type=\"submit\" value=\""._GALCOMMPOST."\">
											</td>
										  </tr>
										</table>
									</form>\n";

	} elseif ($galleryvar['anoncomments']) {

		//Anonymouse Comment
		 $uname = '<input type="text" SIZE="20" MAXLENGTH="20" name="gname">'
     						.'<input type="hidden" name="member" value="0">';
		$cmmbox = "<p align=\"center\"><font class=\"" . $font['title'] . "\">" ._GALCOMMPOST."</font></p>\n
									<form action=\"$baseurl\" method=\"Post\">
										<input type=\"hidden\" name=\"do\" value=\"Post\">
										<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"5\" bgcolor=\"$bgcolor1\">
										  <tr bgcolor=\"$bgcolor2\"> 
											<td width=\"21%\">"._GALNAME."</td>
											<td width=\"79%\">$uname</td>
										  </tr>
										  <tr bgcolor=\"$bgcolor2\"> 
											<td width=\"21%\" valign=\"top\">"._GALCOMMENT."</td>
											<td width=\"79%\">
												<textarea name=\"comment\" cols=\"45\" rows=\"10\"></textarea><br>
												<font class=\"".$font['tiny']."\">&nbsp;&nbsp;"._GALNOTE."</font>
											</td>
										  </tr>
										  <tr bgcolor=\"$bgcolor2\"> 
											<td width=\"21%\">&nbsp;</td>
											<td width=\"79%\">
											    <input class=\"textbox\" type=\"hidden\" name=\"pid\" value=\"$pid\">
											    <input type=\"submit\" value=\""._GALCOMMPOST."\">
											</td>
										  </tr>
										</table>
									</form>\n";

	} else {
		//Not Allow Anonymouse Comment
		$cmmbox = "<p align=\"center\"><font class=\"" . $font['title'] . "\">" ._GALCOMMPOST."</font></p>\n";
		$cmmbox .= '<p align="center"><font class="'.$font['tiny'].'">'._GALREGISTER.'</font></p>';
	}

   return $cmmbox;
}

function displayCommentsPic($pid, $orderby) {
   global $adminpath, $galleryvar, $user, $baseurl, $admin, $imagepath, $prefix, $db, $font ,$bgcolor1, $bgcolor2;

   include("admin/modules/gallery/config.php");

   if ($galleryvar['commentsASC']) {
	   $sort ="ASC";
   } else { 
		$sort ="DESC";
   }

	$out = '<br><p align="center">';
	$out .= '<font class="'.$font['title'].'">'._GALCOMMENTS.'</font></p>';


	$result3 = $db->sql_query("select cid, pid, comment, date, name, member from $prefix"._gallery_comments." where pid=$pid order by date $sort");
	$total = $db->sql_numrows($result3);
	if ( $total == 0) {
		$out .= '<p align="center"><font class="content">'._GALNOCOMM.'</font></p><br>';
	} else {

		if ( is_user($user) ){
		    $userdata=cookiedecode($user);
		    $uname = $userdata[1];
		} else {
		    $uname="";
		}
		
		if (is_admin($admin)) {
		    $adm = 1;
		} else {
		    $adm = 0;
		}
		
		$out .= '<TABLE border="0" bgcolor="'.$bgcolor2.'" cellPadding="5" cellSpacing="1" width="90%" align="center">';
		$out .= "<tr>";
		$out .= "<td bgcolor=\"$bgcolor1\" align=\"center\" width=\"30\">"._COMMENTNO."</td>";
		$out .= "<td bgcolor=\"$bgcolor1\" align=\"center\" width=\"180\">"._GALSUBMITTER."</td>";
		$out .= "<td bgcolor=\"$bgcolor1\" align=\"center\">"._GALNBCOMMENTS."</td>";
		$num = 0;
	        while(list($cid, $cpid, $comment, $date, $name, $member) = $db->sql_fetchrow($result3)) {
	        	if ($member) {
				$poster = "<img src=\"$basepath/images/member.gif\" border=\"0\"alt=\"Member\">";
	        		$poster .= '&nbsp;<a class="'.$font['normal'].'" href="modules.php?name=Your_Account&op=userinfo&amp;username='.$name.'">'
				.underscoreTospace($name).'</a>';
	        	} else {
				$poster = "<img src=\"$basepath/images/guest.gif\" border=\"0\" alt=\"Guest\">";
	        		$poster .=  '&nbsp;<font class="'.$font['normal'].'">'.underscoreTospace($name).'</font>';
			}


			if ($adm) {
			    $del = "<a href=\"$baseurl&amp;do=deletecomment&amp;cid=$cid&amp;pid=$pid&amp;orderby=$orderby\""
						."onClick=\"return confirm('"._GALSURE2DELETECOMMENT."')\">"
						."<img src=\"$imagepath/delete.gif\" border=\"0\" alt=\""._DELETE."\"></a>";
			} else {
			    $del = "";
			}

			if ( ($member) && ($name == $uname) ) {
				$edit = "<a href=\"$baseurl&amp;do=editcomment&amp;cid=$cid&amp;pid=$pid&amp;orderby=$orderby\"><img src=\"$basepath/images/edit.gif\" border=\"0\" alt=\""._COMMENTDEL."\"></a>";
			} else {
				$edit = "";
			}
			    
			$control = "<p align=\"right\">$del $edit</p>";

			   if ($galleryvar['commentsASC']) {
				   $num ++;
			   } else { 
				   $num = $total;
				   $total -=1;
			   }

			
			$comment = str_replace("\n", "<br>", $comment);
		  	$out .= "<tr>";
			$out .= "<td bgcolor=\"$bgcolor1\" align=\"center\" valign=\"middle\">$num</td>";
			
			$out .= '  <td align="left" bgColor="'.$bgcolor1.'" vAlign="middle"><font class="'.$font['normal'].'">'.$poster.'<br>('.MakeDate($date).')</font></TD>'
		        .'  <td align="left" bgColor="'.$bgcolor1.'" vAlign="top"><font class="'.$font['normal'].'">'.$comment.$control.'</font></TD>';
			$out .= '</TR>';

        	} //while

        	$out .= '</TABLE>';
	}

  return $out;


}

function editcomment($cid, $pid, $orderby) {
   global $adminpath, $user, $baseurl, $admin, $imagepath, $gallerypath, $prefix, $db, $font ,$bgcolor1, $bgcolor2;

	include("admin/modules/gallery/config.php");
	include('header.php');
	title("My eGallery");
	OpenTable();

	$cid=intval($cid);
	$pid=intval($pid);

	if ( is_user($user) ) {
	    $userdata=cookiedecode($user);
	    $uname = $userdata[1];
	} else {
	    $uname= "";
	}

	

	$c = "$prefix"."_gallery_comments c";
	$p = "$prefix"."_gallery_pictures p";
	$g = "$prefix"."_gallery_categories g";

	$sql3 = "select c.cid, c.pid, c.comment, c.name, p.img, p.width, p.height, g.galloc, g.thumbwidth from $c, $p, $g "
			."where (c.pid=p.pid) and (p.gid=g.gallid) and (c.cid=$cid) and (c.pid=$pid) and (c.name='$uname')";

	$result3 = $db->sql_query($sql3);
	$row3 = $db->sql_fetchrow($result3);
	$total = $db->sql_numrows($result3);

	if ( $total == 0) {
		$out .= '<p align="center"><font class="content">'._GALNOCOMM.'</font></p><br>';
		CloseTable();
		galleryFooter();
		die;
	}

	if ($row3['width'] > $row3['height']) {
	    $size = "width=\"".$row3['thumbwidth']."\"";
	} else {
	    $size = "height=\"".$row3['thumbwidth']."\"";
	}
	$thumb = "$gallerypath/".$row3['galloc']."/thumb/".$row3['img'];
	if ( file_exists($thumb) ) {
	    $thumb = "<img src=\"$gallerypath/".$row3['galloc']."/thumb/".$row3['img']."\" border=\"0\" $size>";
	} else {
	    $thumb = "<img src=\"$gallerypath/".$row3['galloc']."/".$row3['img']."\" border=\"0\" $size>";
	}
	print "<p align=\"center\"><b>"._GALCOMMEDIT."</b></p>";
	print "<table border=\"0\" width=\"100%\" bgcolor=\"$bgcolor2\" cellpadding=\"10\" cellspacing=\"1\">";
	print "<tr><td bgcolor=\"$bgcolor1\">$thumb</td><td>";

	$user = "<b>".$uname."</b>"
							  ."<input type=\"hidden\" name=\"gname\" value=\"".$uname."\">"
							  ."<input type=\"hidden\" name=\"member\" value=\"1\"><br>";
	$cmmbox = "<p align=\"center\"><font class=\"" . $font['title'] . "\">" ._GALCOMMENTS."</font></p>\n
									<form action=\"$baseurl\" method=\"Post\">
										<input type=\"hidden\" name=\"do\" value=\"Post\">
									        <input type=\"hidden\" name=\"edit\" value=\"1\">
										<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"5\" bgcolor=\"$bgcolor1\">
										  <tr bgcolor=\"$bgcolor2\"> 
											<td width=\"21%\">"._GALNAME."</td>
											<td width=\"79%\">$user</td>
										  </tr>
										  <tr bgcolor=\"$bgcolor2\"> 
											<td width=\"21%\" valign=\"top\">"._GALCOMMENT."</td>
											<td width=\"79%\">
												<textarea name=\"comment\" cols=\"45\" rows=\"10\">$row3[comment]</textarea><br>
												<font class=\"".$font['tiny']."\">&nbsp;&nbsp;"._GALNOTE."</font>
											</td>
										  </tr>
										  <tr bgcolor=\"$bgcolor2\"> 
											<td width=\"21%\">&nbsp;</td>
											<td width=\"79%\">
											    <input class=\"textbox\" type=\"hidden\" name=\"pid\" value=\"$pid\">
											    <input class=\"textbox\" type=\"hidden\" name=\"cid\" value=\"$cid\">
											    <input type=\"submit\" value=\""._COMMSAVE."\">
											</td>
										  </tr>
										</table>
									</form>\n";


	
	echo $cmmbox;
	echo "</td></tr></table>";
	CloseTable();
	galleryFooter();

}

function getPos($res, $pid) {
	global $db;
	$i=0;
	while ($row=$db->sql_fetchrow($res)) {
		if ($row[pid] == $pid)
			return $i;
		$i++;
	}
}


function rateCollector($pid, $rate) {
    global $cookiePrefix, $HTTP_COOKIE_VARS, $adminpath, $prefix, $db, $sitekey, $galleryvar;

    include ("admin/modules/gallery/config.php");

    // Fix for lamers that like to cheat on polls
    $ip = getenv("REMOTE_ADDR");
    $past = time()-intval($galleryvar['floodtime']);
    $db->sql_query("DELETE FROM $prefix"._gallery_rate_check." WHERE time < $past");
    $result = $db->sql_query("SELECT ip, pid FROM $prefix"._gallery_rate_check." WHERE pid=$pid");

    list($ips, $pids) = $db->sql_fetchrow($result);
    $ctime = time();
    if (($ip == $ips) && ($pid == $pids)) {
	$voteValid = 0;
    } else {
	$db->sql_query("INSERT INTO $prefix"._gallery_rate_check." (ip, time, pid) VALUES ('$ip', '$ctime', '$pid')");
	$voteValid = 1;
    }
    // Fix end

    if(intval($galleryvar['setRateCookies']) > 0) {
	// we have to check for cookies, so get timestamp of this rate
	$cookieName = md5($ip.$sitekey.$pid);
	// check if cookie exists
	if($HTTP_COOKIE_VARS["$cookieName"] == "1") {

	    // cookie exists, invalidate this vote
	    include('header.php');
	    title("My eGallery");
	    OpenTable();
	    echo "<META HTTP-EQUIV=\"refresh\" content=\"3;URL=modules.php?op=modload&name=My_eGallery&file=index&do=showpic&pid=$pid\">";
	    echo "<center>"._RATEALREADY."</center><br>";
	    $ratetime = intval($galleryvar['floodtime']) / 3600;
	    printf("<div align=\"center\">"._RATETIME."",$ratetime)."</div><br><br>";
	    echo "<br><a href=\"javascript:history.go(-1)\">Back</a>";
	    CloseTable();
	    galleryFooter();

	    $voteValid = 0;
	} else {
	    // cookie does not exist yet, set one now
	    setcookie("$cookieName",1 ,time()+intval($galleryvar['floodtime']) );
	}
    }
    // update database if the vote is valid
    if($voteValid>0) {
	if ($galleryvar['SumRate']) {
	    $ratecompute = "rate=(rate + $rate)";
	} else {
	    $ratecompute = "rate=(rate*(votes-1) + $rate)/votes";
	}

        $db->sql_query("update $prefix"._gallery_pictures." set votes=votes+1, $ratecompute where pid=$pid");
    }

    // a lot of browsers can't handle it if there's an empty page
    print '<html><head></head><body></body></html>';

}

function showpic($pid, $orderby) {
	global $adminpath, $basepath, $prefix, $db, $gallerypath, $user, $admin, $baseurl, $galleryvar, $font, $PHP_SELF, 
				  $bgcolor1, $bgcolor2 ;

	include("admin/modules/gallery/config.php");

	if(!isset($orderby) || $orderby=="") {
		$orderby = $galleryvar['defaultsortmedia'];
	}

	$prow = $db->sql_fetchrow($db->sql_query("SELECT p.*, UNIX_TIMESTAMP(p.date) AS unix_time, c.galloc, c.visible, t.templatePictures, t.templateCSS, f.displaytag, f.filetype, f.description AS description_media FROM $prefix"._gallery_pictures." AS p LEFT JOIN $prefix"._gallery_categories." AS c ON c.gallid=p.gid LEFT JOIN $prefix"._gallery_template_types." AS t ON t.id=c.template LEFT JOIN $prefix"._gallery_media_types." AS f ON f.extension=p.extension WHERE pid=$pid"));

	$ok=0;
	switch ($prow[visible]) {
		case 0:
			if (is_admin($admin))
				$ok=1;
			break;
		case 1:
			if (is_user($user) || is_admin($admin))
				$ok=1;
			break;
		default:
			$ok=1;
			break;
	}

	if ($ok) {
		//galleryHeader();
		include('header.php');
		title("My eGallery");
		//OpenTable();
		//print navigationTree($prow[gid], $prow[pid]);
		//CloseTable();
		//print '<br>';


		if($prow[filetype] == 1) {
			$size = @getimagesize("$gallerypath/$prow[galloc]/$prow[img]");
		} else {
			$size[0] = $prow[width];
			$size[1] = $prow[height];
			$size[2] = $prow[description_media];
			$size[3] = "width=\"size[0]\" height=\"size[1]\"";
		}

		$navtree = navigationTree($prow[gid], $prow[pid]);
		$navpic = navigationPic($prow[name], $prow[gid], $prow[pid], $orderby);
		$imgsize = displaySizePic($prow, $size);
		$img = displayPicturePic($prow, $size);
		$date = displayDateAddedPic($prow);
		$submitter = displaySubmitterPic($prow);
		$hits = displayHitsPic($prow);
		$vote = displayRatePic($prow);
		$ratingbar = displayRatingBarPic($prow, $orderby);
		$description = displayDescriptionPic($prow);
		$imgname = $prow['name'];
		$filename = "<font class=\"".$font['tiny']."\">".$prow['img']."</font>";
		$rate = "<font class=\"".$font['tiny']."\">" . sprintf("%01.1f",$prow['rate']) . ' '._RATING."</font>";

		if ( trim($imgname) == "" ) { $imgname = $filename; }
		$imgname = "<div align=\"center\"><font class=\"".$font['title']."\">.:$imgname "._GALSUBMITTER." ".$prow['submitter'].":.</div>";

		
		//Comment box
		if ($galleryvar['allowcomments']) {
			$commentbox = CommentBox($prow[pid]);
			$comments = displayCommentsPic($prow[pid], $orderby);
		} else {
			$commentbox = "&nbsp";
			$comments = "&nbsp;";
		}
		
		//Media Info Box
		$infobox ="<p align=\"center\"><font class=\"" . $font['title'] . "\">" ._GALINFO."</font></p>";
		$infobox .= "<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"5\" bgcolor=\"$bgcolor1\">
								  <tr bgcolor=\"$bgcolor2\"> 
									<td width=\"35%\">"._GALSUBMITTER.":</td>
									<td width=\"65%\">$submitter</td>
								  </tr>
								  <tr bgcolor=\"$bgcolor2\"> 
									<td width=\"35%\">"._GALADDED.":</td>
									<td width=\"65%\">$date</td>
								  </tr>
								  <tr bgcolor=\"$bgcolor2\"> 
									<td width=\"35%\">"._GALFILENAME."</td>
									<td width=\"65%\">$filename</td>
								  </tr>
								  <tr bgcolor=\"$bgcolor2\"> 
									<td width=\"35%\">"._GALSIZE.":</td>
									<td width=\"65%\">$imgsize</td>
								  </tr>
								  <tr bgcolor=\"$bgcolor2\"> 
									<td width=\"35%\">"._GALVIEWED.":</td>
									<td width=\"65%\">$hits</td>
								  </tr>";

		if ($galleryvar['allowrate']) {

		    $infobox .=			  "<tr bgcolor=\"$bgcolor2\"> 
									<td width=\"35%\">"._GALVOTES.":</td>
									<td width=\"65%\">$vote</td>
								  </tr>
								  <tr bgcolor=\"$bgcolor2\"> 
									<td width=\"35%\">"._GALRATING.":</td>
									<td width=\"65%\">$rate</td>
								  </tr>";
		}


		$infobox .= "</table>\n";



		//E-Card
		if ($galleryvar['allowpostcard']) {
		       $path = substr($PHP_SELF, 0, strlen($PHP_SELF) - strlen("/modules.php"));
			if($prow[filetype] == 1) {
				$postcard = "<a class=\"".$font['normal']."\" href=\"$postscardpath?image=$path/$gallerypath/$prow[galloc]/$prow[img]\" target=\"_blank\">
                                  <img src=\"$imagepath/mailcard.gif\" border=\"0\" align=\"middle\" alt=\""._GALPOSTCARD."\">
                                   "._GALPOSTCARD."
                                  </a>";
                         }
		}
		
		//Print Media
		if ($galleryvar['allowprint'])  {
			// No Margin Pop Up Window Version 1.0 : Credits to Dodo : http://www.regretless.com
		      	$dir="../gallery/$prow[galloc]/"; // the directory where your image's at with "/" at the end, leave it 				     // blank if you are calling the image from the same directory
			$pic="$prow[img]"; // your image file name
			$width="$prow[width]"; // image width
			$height="$prow[height]"; // image height
			$target++; // leave this alone
			$nmdir="modules/My_eGallery/public/"; // the directory where your nmimage.php's at with "/" at the end
			// leave it blank if you are calling the image from the same directory

			$print = "&nbsp;&nbsp;<A class=\"".$font['normal']."\" HREF=\"#\" onMouseOver=\"window.status='pop up';return true\" onMouseOut=\"window.status='';return true\" onClick=\"window.open('$nmdir";
			$print .="nmimage.php?z=$dir$pic&width=$width&height=$height','$target','width=$width,height=".($height+60).",directories=no,location=no,menubar=no,scrollbars=no,status=no,toolbar=no,resizable=no,left=0,top=0,screenx=50,screeny=50');return false\">";
			$print .= "<img src=\"$imagepath/print.gif\" border=\"0\" align=\"middle\" alt=\""._GALPRINTMEDIA."\"></a>";
		}

		//Download 
		if ($galleryvar['allowdownload']) {
			$thefile = substr($prow[img], 0, strrpos($prow[img],'.'));
			$zipfile = $thefile.".zip";
			$gzfile = $prow[img].".gz";
			if ($galleryvar['downloadmode']=="zip") {
				$thefile = $zipfile;
			} elseif ($galleryvar['downloadmode']=="gz") {
				$thefile = $gzfile;
			}
			//Check File  Exist
			if ( file_exists("$gallerypath/$prow[galloc]/$thefile") ) {
				$download = "&nbsp;&nbsp;<a class=\"".$font['tiny']."\" href=\"$baseurl&amp;do=getit&amp;url=$prow[galloc]/$thefile&amp;filename=$thefile\"><img src=\"$imagepath/hit.gif\" border=\"0\" align=\"middle\" alt=\""._GALDOWNLOADMEDIA."\" ></a>";
			}
		}
		//Home button
		$home = "&nbsp;<a class=\"".$font['tiny']."\" href=\"$baseurl\"><img src=\"$imagepath/home.gif\" border=\"0\" align=\"middle\" alt=\""._GALHOME."\" ></a>";
			
		//Thumbnail button
		$back = "&nbsp;&nbsp;<a class=\"".$font['tiny']."\" href=\"$baseurl&amp;do=showgall&gid=".$prow['gid']."\"><img src=\"$imagepath/icon_up.gif\" border=\"0\" align=\"middle\" alt=\""._GALSUBCATE."\" ></a>";

		//Edit Media (Admin) button
		if (is_admin($admin)) {
		    $edit ="&nbsp;&nbsp;<a class=\"".$font['tiny']."\"  href=\"$adminurl&amp;do=editmedia&amp;type=edit&amp;category=$prow[gid]&amp;pid=$prow[pid]&amp;gid=$prow[gid]\"><img src=\"$imagepath/edit.gif\" alt=\"Edit\" border=\"0\" align=\"middle\"></a>";
		}

		//Start Display Picture Page
		echo "<br><table border=\"0\" width=\"100%\" bgcolor=\"$bgcolor2\" cellspacing=\"1\" cellpadding=\"2\"><tr bgcolor=\"$bgcolor1\"><td>";
		OpenTable();
		print $navtree;
		CloseTable();
		print "</td></tr><tr  bgcolor=\"$bgcolor1\"><td align=\"middle\">";
		print "<div align=\"center\">";
		OpenTable();
		print  "<table width=\"100%\" border=\"0\" cellpadding=\"2\"><tr>";
		print  "	<td width=\"25%\">".$home.$back.$print.$download.$edit."</td>";
		print  "	<td width=\"50%\">$imgname</td>";
		print  "	<td width=\"25%\">$navpic</td>";
		print  "</tr></table></div>";
		CloseTable();
		print "</td></tr><tr bgcolor=\"$bgcolor1\"><td align=\"top\">";
		OpenTable();
		print "<br><div align=\"center\">$img</div><br>";
		CloseTable();
		print "</td></tr><tr><td align=\"top\">\n";
		print "</td></tr><tr bgcolor=\"$bgcolor2\">"
				."<td align=\"center\">$description</td>";
		print "</tr><tr><td align=\"top\">\n";
		print "
		    <table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"10\" bgcolor=\"$bgcolor1\">
		      <tr>
				<td bgcolor=\"$bgcolor2\" width=\"35%\" valign=\"top\">$infobox<br>$ratingbar";

				if ($galleryvar['setRateCookies'] && $galleryvar['allowrate']) {
				    $ratetime = intval($galleryvar['floodtime']) / 3600;
				    printf("<div align=\"center\">"._RATETIME."",$ratetime)."</div>";
				}
		print "	</td>
				<td bgcolor=\"$bgcolor2\" width=\"65%\" valign=\"top\">$commentbox</td>
		      </tr>
		      <tr>
				<td colspan=\"2\" bgcolor=\"$bgcolor2\" width=\"100%\">";
					OpenTable();
					print "$comments <br>";
					CloseTable();
					print "
				</td>
		      </tr>
		    </table>";

		print "</td></tr></table>\n";
		galleryFooter();
	} else {
		galleryHeader();
		OpenTable();
		echo "<h1><font color=\"red\"><b><center><br>"._GALFILENOTFOUND."</center></b></font></h1>";
		CloseTable();
		galleryFooter();
	}
}
?>
