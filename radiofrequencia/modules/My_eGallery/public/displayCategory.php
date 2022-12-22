<?php

include ("modules/My_eGallery/public/imageFunctions.php");
include ("admin/modules/gallery/fileFunctions.php");

function getThumbnail($img, $galloc) {
	global $gallerypath,	$imagepath, $prefix, $db, $default_thumb;
	
	$default_thumb = 0;
	$ext = substr($img, (strrpos($img,'.') +  1));
	$name_gif = str_replace(".$ext", ".gif", $img);
	$name_jpg = str_replace(".$ext", ".jpg", $img);

	if (file_exists("$gallerypath/$galloc/thumb/$name_gif")) {
		$thumb = "$gallerypath/$galloc/thumb/$name_gif";
	}
	elseif (file_exists("$gallerypath/$galloc/thumb/$name_jpg")) {
		$thumb = "$gallerypath/$galloc/thumb/$name_jpg";
	}
	else {
		$row = $db->sql_fetchrow($db->sql_query("SELECT thumbnail from $prefix"._gallery_media_types." where extension='$ext'"));
		$thumbnail = $row[thumbnail];
		$thumb = "$imagepath/$thumbnail";
		$default_thumb = 1;
	}

	//echo $thumb;
	return $thumb;
}

function displayPictureGall($filetype, $gid, $pid, $thumbwidth, $galloc, $name, $img, $orderby, $desc) {
	global $gallerypath, $font, $baseurl, $adminurl, $imagepath, $galleryvar, $admin, $row, $default_thumb;

	$image = "$gallerypath/$galloc/$img";
	$thumb_dir = "$gallerypath/$galloc/thumb";
	$thumb = "$thumb_dir/$img";

	// create the thumbnail if missing
	if(!file_exists($thumb)) {
		if(!file_exists($thumb_dir) && $galleryvar['imageSoftware']!="browser")
		{
			makeDir("$gallerypath/$galloc", "thumb");
		}
		if ($filetype==1) {
                	$thumb = RatioResizeImg("$gallerypath/$galloc/$img", $thumb, $gid);
                }

		if ($thumb=="browser")
			$thumb = $image;
		else
			$thumb = getThumbnail($img, $galloc);
	}

	$imginfo = @getimagesize($thumb);
	if (!$default_thumb) {
	    if( $imginfo[0] > $imginfo[1] ) {
		$scaleimg = " width=\"$thumbwidth\" ";
	    } else {
		$scaleimg = "height=\"$thumbwidth\" ";
	    }
	} else {
	    $scaleimg = "";
	}

	$desc = substr($desc, 0, 255);
	$tabheight = intval($galleryvar['ThumbWidth'])+32;
	$colheight = $galleryvar['ThumbWidth'];
	$out ="<table width=\"100%\" height=\"$tabheight\" cellspacing=\"0\" cellpadding=\"0\">"
			."<tr><td height=\"$colheight\" align=\"center\">"
				."<a class=\"".$font['normal']."\" href=\"$baseurl&amp;do=showpic&amp;pid=$pid&amp;orderby=$orderby\">"
				."<img src=\"$thumb\" $scaleimg alt=\"$desc\" border=\"0\" align=\"middle\"></a>\n"
			."</td></tr>"
			."<tr><td height=\"30\" align=\"center\">"
				."<a class=\"".$font['normal']."\" href=\"$baseurl&amp;do=showpic&amp;pid=$pid&amp;orderby=$orderby\">"
				.underscoreTospace($name)."</a>"
			."</td></tr>"
		    ."</table>\n";


	return $out;
}

function displayDescriptionGall($row, $crow) {
        global $font;
	$m = 90 / $crow[numcol];
		if(strlen($row[description]) > $m) {
			$row[description] = trim(substr($row[description],0,$m));
			$p = strrpos($row[description], ' ');
			$row[description] = trim(substr($row[description],0,$p)).'...';
		}
		return "<font class=\"".$font['tiny']."\">$row[description]</font>\n";
}

function displayNewGall($row) {
	global $imagepath;
	if($row[new_day] == 0) {
		return "<img src=\"$imagepath/newred.gif\" border=\"0\" width=\"34\" height=\"14\" alt=\""._GALNEWMEDIA1.'">';
	}
	elseif($row[new_day] < 3) {
		return "<img src=\"$imagepath/newgreen.gif\" border=\"0\" width=\"34\" height=\"14\" alt=\"".sprintf(_GALNEWMEDIA2, $row[new_day]).'">';
	}
	elseif($row[new_day] < 7) {
		return "<img src=\"$imagepath/newblue.gif\" border=\"0\" width=\"34\" height=\"14\" alt=\"".sprintf(_GALNEWMEDIA2, $row[new_day]).'">';
	} else {
		if ($row[counter] > 50) {
			return "<img src=\"".$imagepath."/rank_fire.gif\" border=\"0\" alt=\"".$row[counter]." views\">";
		} else {
			$count = floor($row[counter]/10);
			return "<img src=\"".$imagepath."/rank".$count.".gif\" border=\"0\" alt=\"".$row[counter]." views\">";
		}

	}

}

function displaySizeGall($row, $crow) {
        global $font;

	if($row[imginfo][2]) {
		$size = $row[imginfo];
		return "<font class=\"".$font['tiny']."\"><b>"._GALSIZE."</b>: $size[0]x$size[1]</font>";
	}
	else {
		return "<font class=\"".$font['tiny']."\"><b>"._GALSIZE."</b>: "._GALUNKNOWN."</font>";
	}
}

function displayFormatGall($row) {
        global $font;

	$ext = $row[imginfo][2];
	switch($ext) {
		case 1: $type = 'GIF'; break;
		case 2: $type = 'JPEG'; break;
		case 3: $type = 'PNG'; break;
		case 4: $type = 'WBMP'; break;
		default:
			$type = $ext; break;
	}
	return "<font class=\"".$font['tiny']."\"><b>Format</b>: $type</font>";
}

function displayNumCommentsGall($row) {
	global $galleryvar, $prefix, $db, $font;

	$numcomments = $db->sql_fetchrow($db->sql_query("SELECT COUNT(cid) AS total FROM $prefix"._gallery_comments." WHERE pid=$row[pid]"));
	if($galleryvar['allowcomments']) {
		return "<font class=\"".$font['tiny']."\"><b>"._GALNBCOMMENTS."</b>: $numcomments[total]</font>";
	}
}

function displayHitsGall($row) {
	global $font;
        return "<font class=\"".$font['normal']."\"><b>"._GALVIEWED."</b>: $row[counter]</font>";
}

function displayRateGall($row) {
	global $galleryvar, $font	;
	return "<font class=\"".$font['normal']."\"><b>"._GALRATING."</b>: ".round($row[rate])."</font>";
}

function displayVoteGall($row) {
	global $galleryvar, $font	;
	return "<font class=\"".$font['normal']."\"><b>"._GALVOTES."</b>: ".round($row[votes])."</font>";
}

function displayDateAddedGall($row) {
        global $font;

	return "<font class=\"".$font['normal']."\"><b>"._GALADDED.'</b></font><br><font class="'.$font['tiny'].'">'.strftime(_GALDATEBRIEF,$row[unix_date]).'</font>';
}

function displayName($row) {
        global $font;

	return "<font class=\"".$font['normal']."\"><b>$row[name]</b></font>";
}

function navigationCat($gid, $picnum, $orderby) {
	global $font, $galleryvar, $baseurl, $prefix, $db;

	$limit = $galleryvar['maxNumberMedia'];
	$orderby = convertorderbyout($orderby);
	$numresults = $db->sql_query("select * from $prefix"._gallery_pictures." where gid=$gid");
	$numrows=$db->sql_numrows($numresults);
	$nav = '';
	$pages=intval($numrows/$limit);

	if ($numrows>0 & $pages>=1) {
		if ($picnum!=0) {
        		$prevpicnum=$picnum-$limit;
        		$nav = "<a class=\"".$font['normal']."\" href=\"$baseurl&amp;do=showgall&amp;gid=$gid&amp;picnum=$prevpicnum&amp;orderby=$orderby\">[&lt;&lt;]</a>&nbsp;.&nbsp;";
		}

		if ($numrows%$limit) {
        		$pages++;
		}

		for ($i=1;$i<=$pages; $i++) {
        		$newpicnum=$limit*($i-1);
        		if ($newpicnum==$picnum) {
	        		$nav .= "<font class=\"".$font['normal']."\">";
	        		if ($i==1)
	        			if ($pages==1)
	        				$nav .= "[&lt;&lt;] . ".$i." . [&gt;&gt;]";
	        			else
	        				$nav .= "[&lt;&lt;] . ".$i."&nbsp;.&nbsp;";
	        		elseif  ($i==$pages)
	        			$nav .= $i."&nbsp;.&nbsp;[&gt;&gt;]";
	        		else
	        			$nav .= $i."&nbsp;.&nbsp;";
	        		$nav .= "</font>";
        		}
        		else {
	        		$nav .= "<a class=\"".$font['normal']."\" href=\"$baseurl&amp;do=showgall&amp;gid=$gid&amp;picnum=$newpicnum&amp;orderby=$orderby\">$i</a>&nbsp;.&nbsp;";
        		}
		}
		if (!(($picnum/$limit)==($pages-1)) && $pages!=1) {
        		$newpicnum=$picnum+$limit;
        			$nav .= "<a class=\"".$font['normal']."\" href=\"$baseurl&amp;do=showgall&amp;gid=$gid&amp;picnum=$newpicnum&amp;orderby=$orderby\">[&gt;&gt;]</a>";
		}
	}
	return $nav;
}

function navigationSubCat($gid) {
	global $baseurl, $adminurl, $imagepath, $admin, $user,	$prefix, $db, $gallerypath, $galleryvar, $font, $bgcolor1, $bgcolor2;

	if (is_admin($admin)) {
		$result = $db->sql_query("SELECT gallid, gallname, galloc, gallimg, description, visible, total, (TO_DAYS(NOW()) - TO_DAYS(lastadd)) AS new_day FROM $prefix"._gallery_categories." WHERE parent=$gid AND visible>=0 ORDER by gallname");
	} else {
		$result = $db->sql_query("SELECT gallid, gallname, galloc, gallimg, description, visible, total, (TO_DAYS(NOW()) - TO_DAYS(lastadd)) AS new_day FROM $prefix"._gallery_categories." WHERE parent=$gid AND visible>0 ORDER by gallname");
	}

	$nb = $db->sql_numrows($result);
	if(!$nb) { return false;}

	$c = 0;
	$col_num=intval($galleryvar['numColMain']);
	$pc = ceil(100/$col_num);

	print "\n<tr><td bgcolor=\"$bgcolor1\">";
	OpenTable();
	print "<br><center><b>.:"._GALSUBCATE.":.</b></center></br>";
	print '<table border="0" cellpadding="1" cellspacing="0" align="center"><tr>';

	$isuser = is_user($user);
	$isadmin = is_admin($admin);

	while($row = $db->sql_fetchrow($result)) {
		switch ($row[visible])
		{
			case 0:
				$vis = "<img src=\"$imagepath/red_dot.gif\" border=\"0\" width=\"10\" height=\"10\" alt=\""._GALVISIBLEADMIN.'">';
				break;
			case 1:
				$vis = "<img src=\"$imagepath/yellow_dot.gif\" border=\"0\" width=\"10\" height=\"10\" alt=\""._GALVISIBLEMEMBER.'">';
				break;
			default:
				$vis = "<img src=\"$imagepath/green_dot.gif\" border=\"0\" width=\"10\" height=\"10\" alt=\""._GALVISIBLEPUBLIC.'">';
				break;
		}
		
		//Display Shot Name by Config
		$desc = underscoreTospace($row[gallname]);
		$sLen = intval($galleryvar['SubCatLen']);
		if ($sLen) {
		    if(strlen($desc) > $sLen) {
			$desc = substr($desc,0, abs($sLen-2) ) . "..";
		    }
		}

		if ($galleryvar['displaySubCatIcon']) {

			//Make Icons Auto Stretch
			$src_file = "$gallerypath/".$row[galloc]."/".$row[gallimg];
			if ($imginfo = @getimagesize($src_file)) {
		    		$srcWidth = $imginfo[0];
				$srcHeight = $imginfo[1];
				$Iconwidth = intval($galleryvar['SubCatIconwidth']);
				if ($Iconwidth < 1) { $Iconwidth = $srcWidth; }
				if ( ($srcWidth > $Iconwidth) || ($srcHeight > $Iconwidth) ) {
				    	if ($srcWidth > $srcHeight) {
					    $ratioWidth = $srcWidth/$Iconwidth;
					    $destWidth = $Iconwidth;
					    $destHeight =round($srcHeight / $ratioWidth);
					} else {
					    $ratioWidth = $srcHeight/$Iconwidth;
					    $destHeight = $Iconwidth;
					    $destWidth = round($srcWidth / $ratioWidth);
					}
				} else {
				     $destWidth = $srcWidth;
				     $destHeight = $srcHeight;
				}
			}

			if (isset($galleryvar['SubCatIconwidth']) && $galleryvar['SubCatIconwidth']!="") {
				$icon = "<br><img src=\"$gallerypath/".$row[galloc]."/".$row[gallimg]."\" width=\"".$destWidth."\" height=\"$destHeight\" border=\"0\" alt=\"$row[description]\">";
			} else {
				$icon = "<br><img src=\"$gallerypath/".$row[galloc]."/".$row[gallimg]."\" border=\"0\" alt=\"$row[description]\">";
			}

			//Check  Visible Permission
			if ($row[visible]==1 && !$isuser && !$isadmin) {
				$hdrlink = $desc." ($row[total])";
			} else {
				//if  OK make a hyperlink image
				$hdrlink = "<a class=\"".$font['normal']."\" href=\"$baseurl&amp;do=showgall&amp;gid=$row[gallid]\">".$desc."</a> ($row[total])";
				$icon = "<a class=\"".$font['normal']."\" href=\"$baseurl&amp;do=showgall&amp;gid=$row[gallid]\">".$icon."</a>";
			}
				//Let make stretch table
				//$Iconwidth = $Iconwidth+2;
				$icon = '<div align="center">'
							.'<table border="0" cellpadding="0" cellspacing="0" align="center">'
								.'<tr><td height="'.($Iconwidth+20).'" width="'.$Iconwidth.'" align="center" valign="middle">'.$icon
								.'</td></tr><tr>'
								.'<td height="15" align="center"> ('.$vis.')' 
								.'</td></tr>'
							.'</table></div>'."\n";
			//}
			//End Check Visible Permission

		} else { //If not display sub category icons //Let build only folder images 
			$icon = "<img src=\"$imagepath/folder.gif\" width=\"15\" height=\"13\" border=\"0\" alt=\""
					.underscoreTospace($row[gallname])."\">";

			//Check Visible Permission
			if ($row[visible]==1 && !$isuser && !$isadmin) {
				$hdrlink = $desc." ($row[total])";
				$icon .="&nbsp;($vis)";
			} else {
				//if  OK make a hyperlink image
				$hdrlink = "<a class=\"".$font['normal']."\" href=\"$baseurl&amp;do=showgall&amp;gid=$row[gallid]\">".$desc."</a> ($row[total])";
				$icon = "<a class=\"".$font['normal']."\" href=\"$baseurl&amp;do=showgall&amp;gid=$row[gallid]\">".$icon."</a>&nbsp;($vis)";
			}
			$icon = "<div align=\"center\"> $icon </div>";
			//End Check Visible Permission
		}
		//End Check Display Sub-Cat Icons

		//Check New Images
		if($row[new_day] == 0) {
			$newimg = "<img src=\"$imagepath/newred.gif\" border=\"0\" width=\"34\" height=\"14\" alt=\""._GALNEWMEDIA1.'">';
		} elseif($row[new_day] < 3) {
			$newimg = "<img src=\"$imagepath/newgreen.gif\" border=\"0\" width=\"34\" height=\"14\" alt=\"".sprintf(_GALNEWMEDIA2, $row[new_day]).'">';
		} elseif($row[new_day] < 7) {
			$newimg = "<img src=\"$imagepath/newblue.gif\" border=\"0\" width=\"34\" height=\"14\" alt=\"".sprintf(_GALNEWMEDIA2, $row[new_day]).'">';
		} else {
			$newimg = "<img src=\"".$imagepath."/blank.gif\" border=\"0\" height=\"14\" alt=\"\">";
		}
	


		$hdrlink .= $newimg;
		print "<td width=\"$pc%\" align=\"center\" valign=\"top\">";
		OpenTable();
		print '<div align="center">';
		themesidebox($hdrlink, $icon);
		print '</div>';
		CloseTable();

		$c++;
		if($c == $col_num&& $nb != $col_num) {
			print  '</tr><tr>';
			$c = 0;
		}
	}
	print '</tr></table><br>';
	CloseTable();
	print "\n</td></tr>\n";
}



function convertorderbytrans($orderby) {
    if ($orderby == "counter ASC, name ASC")	$orderbyTrans = ""._GALPOPULARITY1."";
    if ($orderby == "counter DESC, name ASC")	$orderbyTrans = ""._GALPOPULARITY2."";
    if ($orderby == "name ASC")		$orderbyTrans = ""._GALNAMEAZ."";
    if ($orderby == "name DESC")	$orderbyTrans = ""._GALNAMEZA."";
    if ($orderby == "date ASC, name ASC")		$orderbyTrans = ""._GALDATE1."";
    if ($orderby == "date DESC, name ASC")	$orderbyTrans = ""._GALDATE2."";
    if ($orderby == "rate ASC, name ASC")		$orderbyTrans = ""._GALRATING1."";
    if ($orderby == "rate DESC, name ASC")	$orderbyTrans = ""._GALRATING2."";
    return $orderbyTrans;
}



function showgall($gid, $picnum, $orderby) {

	global $imagepath, $galleryvar, $font, $prefix, $db, $user, $admin, $bgcolor1, $bgcolor2;
	include "admin/modules/gallery/config.php";

	$res = $db->sql_fetchrow($db->sql_query("SELECT count(*) as total FROM $prefix"._gallery_categories." WHERE parent=$gid AND visible=1"));
	$crow = $db->sql_fetchrow($db->sql_query("SELECT c.galloc, c.numcol, c.description, c.visible, c.thumbwidth, c.gallname, t.templateCategory, t.templateCSS FROM $prefix"._gallery_categories." AS c LEFT JOIN $prefix"._gallery_template_types." AS t ON t.id=c.template WHERE gallid=$gid"));
	
	if (!$crow) {
	    echo "Can not retrieve main gallery  catagory infomation!";
	    die;
	}

	$ok=0;
	switch ($crow[visible]) {
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
		galleryHeader();
		//OpenTable();
		if(isset($orderby)) {
			$orderby = convertorderbyin($orderby);
		}
		else {
			$orderby = convertorderbyin($galleryvar['defaultsortmedia']);
		}
		if(!$gid) {
			header("Location: $baseurl");
			exit;
		}

		$limit = $galleryvar['maxNumberMedia'];

		if(empty($picnum)) {
			$picnum = 0;
		}
		$orderbyTrans = convertorderbytrans($orderby);
		$navtree = navigationTree($gid, false);
		$nav =  navigationCat($gid, $picnum, $orderby);
		$navgall = navigationGall();

		$sql ="SELECT m.*, UNIX_TIMESTAMP(m.date) AS unix_date, (TO_DAYS(NOW()) - TO_DAYS(m.date)) AS new_day, f.displaytag, f.thumbnail, f.filetype, f.description AS description_media, m.counter FROM $prefix"._gallery_pictures." AS m LEFT JOIN $prefix"._gallery_media_types." AS f ON f.extension=m.extension WHERE gid=$gid ORDER BY $orderby LIMIT $picnum, $limit";
		$result = $db->sql_query($sql);
		//echo $sql;
		$nb = $db->sql_numrows($result);
		$pc = ceil(100/$crow[numcol]);
		$c = 0;

		if($crow[description]) {
		    $galldesc = $crow[description];
		} else {
		   $galldesc = $crow[gallname];
		}
		OpenTable();
		print $navtree;
		CloseTable();
		print "\n<br>\n";
		OpenTable();
		print "<p align=\"center\"><b><font class=\"".$font['title']."\">.:$galldesc:.</font></b></p>\n";
		if($galleryvar['displaysortbar']) {
			print '<p align="center"><font class="tiny">'._GALSORTMEDIABY.': '
				._NAME." (<a class=\"".$font['tiny']."\" href=\"$baseurl&amp;do=showgall&amp;gid=$gid&amp;picnum=$newpicnum&amp;orderby=titleA\">"._GALASC."</a>\<a href=\"$baseurl&amp;do=showgall&amp;gid=$gid&amp;picnum=$newpicnum&amp;orderby=titleD\">"._GALDESC.'</a>) '
				._DATE." (<a class=\"".$font['tiny']."\" href=\"$baseurl&amp;do=showgall&amp;gid=$gid&amp;picnum=$newpicnum&amp;orderby=dateA\">"._GALASC."</a>\<a href=\"$baseurl&amp;do=showgall&amp;gid=$gid&amp;picnum=$newpicnum&amp;orderby=dateD\">"._GALDESC.'</a>) '
				._RATING." (<a class=\"".$font['tiny']."\" href=\"$baseurl&amp;do=showgall&amp;gid=$gid&amp;picnum=$newpicnum&amp;orderby=ratingA\">"._GALASC."</a>\<a href=\"$baseurl&amp;do=showgall&amp;gid=$gid&amp;picnum=$newpicnum&amp;orderby=ratingD\">"._GALDESC.'</a>) '
				._POPULARITY." (<a class=\"".$font['tiny']."\" href=\"$baseurl&amp;do=showgall&amp;gid=$gid&amp;picnum=$newpicnum&amp;orderby=hitsA\">"._GALASC."</a>\<a href=\"$baseurl&amp;do=showgall&amp;gid=$gid&amp;picnum=$newpicnum&amp;orderby=hitsD\">"._GALDESC.'</a>) '
				.'<br>'._GALMEDIASORTED.": $orderbyTrans</font></p>";
		}

		print '<p align="center">'.$nav.'</p>';
		//make border table
		print '<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="'.$bgcolor1.'"><tr><td>';
		//make lay out table (thumbnail section and search section)
		print '<table border="0" width="100%" cellspacing="1" cellpadding="5" bgcolor="'.$bgcolor2.'">';

		if($subcats != -1) {
			navigationSubCat($gid);
		}
		
		//Make Thumbnail Section
		print  '<tr><td bgcolor="'.$bgcolor1.'">';
		OpenTable();
		print '<br><div align="center">-'._IMAGEINSUBCAT.'-</div><br>' ;

		//Table to split thumb column
		print '<table border="0" width="100%" align="center" cellpadding="5" cellspacing="0"><tr>';
		while($row = $db->sql_fetchrow($result)) {

			// get some image info stuff out of the way here
			if($row[filetype] == 1) {
				$row[imginfo] = @getimagesize("$gallerypath/$crow[galloc]/$row[img]");
			} else {
				$row[imginfo] = false;
				$row[imginfo][0] = $row[width];
				$row[imginfo][1] = $row[height];
				$row[imginfo][2] = $row[description_media];
				$row[imginfo][3] = "width=\"$row[width]\" height=\"$row[height]\"";
			}

			// ok, back to what we were doing
			$val_description = displayDescriptionGall($row, $crow);
			$val_vote = displayVoteGall($row);
			$val_format = displayFormatGall($row);
			$val_size = displaySizeGall($row, $crow);
			$val_nmbComments = displayNumCommentsGall($row);
			$val_new = displayNewGall($row);
			$val_hits = displayHitsGall($row);
			$val_date = displayDateAddedGall($row);
			$val_name = displayName($row);
			
			print '<td width="'.$pc.'%" height="'.$galleryvar['ThumbWidth'].'">';
			
			//Table of thumbnail info
			//OpenTable();
			print '<table border="0" width="100%" cellspacing="1" cellpadding="5" bgcolor="'.$bgcolor2.'"><tr><td bgcolor="'.$bgcolor1.'">';
			print '<div align="center">';
			print  $val_new;
			print '</div></td></tr><tr><td bgcolor="'.$bgcolor1.'"><br>';
			print displayPictureGall($row[filetype], $row[gid], $row[pid], $crow[thumbwidth], $crow[galloc], $row[name], $row[img], convertorderbyout($orderby), $row[description]);
			print '</td></tr>';

			print '<tr><td bgcolor="'.$bgcolor1.'">';
			if (is_admin($admin)) {
				print "<div align=\"center\"><a class='".$font['normal']."' href=\"$adminurl&amp;do=editmedia&amp;type=edit&amp;category=$gid&amp;pid=$row[pid]&amp;gid=$gid\"><img src=\"$imagepath/edit.gif\" alt=\"Edit\" border=\"0\"></a></div>\n";
			}

			print "<div align=\"center\">[ $val_size px]<br>[ $val_hits / $val_vote ]</div>\n";
			print '</td></tr></table>';
			//CloseTable();
			print '</td>'."\n";

			$c++;
			if($c == $crow[numcol] && $nb != $crow[numcol]) {
				print '</tr>'."\n".'<tr>';
				$c = 0;
			}
		}// end build thumbnail loop

		//make blank column to full fill table
		while ($c <> $crow[numcol]) {
			echo "<td>&nbsp;</td>\n";
			$c++;
		}

		print '</tr></table>';
		CloseTable();
		//End Thumbnail Section

		print "<br><center>$nav</center><br></td></tr>";
		if ($galleryvar['displaySearchForm']) {
			print '<tr><td bgcolor="'.$bgcolor1.'">';
                        include("modules/My_eGallery/public/search.php");
			print search_form($GLOBALS[HTTP_POST_VARS]);
			print '</td></tr>';
                }

		print '</center>';
		print '</table>';
		print '</td></tr></table>';
		if ($res[total]>0 && !is_user($user)) {
		        $vis = "<img src=\"$imagepath/yellow_dot.gif\" border=\"0\" width=\"10\" height=\"10\" alt=\""._GALVISIBLEMEMBER.'">';
			print '<br><center><font class="'.$font['tiny'].'">';
			printf (""._GALCATMEMBERS."",$vis);
			print '</font></center>';
		}
		
		CloseTable();
		galleryFooter();
	} // If Ok
	else {
	}
}
?>
