<?php

include ("modules/My_eGallery/public/imageFunctions.php");
include ("admin/modules/gallery/fileFunctions.php");

function is_in($f, $gid, $logo) {
	global $prefix, $db;
	if($f == $logo){return true;}
	$f = addslashes($f);
	$sql = "SELECT COUNT(pid) AS total FROM $prefix"._gallery_pictures." WHERE gid=$gid AND img='$f'";
	//echo $sql.'<br>';
	$row = $db->sql_fetchrow($db->sql_query($sql));
	if($row[total]) {
		return true;
	}
}

function radd($par, $path, $recursive, $submitter, $desc_pic, $desc_cat) {
	global $prefix, $db, $font, $galleryvar, $gallerypath, $imagepath, $baseurl, $adminurl ;

	$c = 0;

	$loc = substr($path, strlen("$gallerypath/"));
	//echo "*$loc*<br>";
	$result = $db->sql_query("SELECT gallid, galloc, gallimg FROM $prefix"._gallery_categories." where galloc='$loc'");
	if($db->sql_numrows($result)>0) {
		$row = $db->sql_fetchrow($result);
	}
	//echo $row[gallid].'<br>';
	if(is_dir($path)) {
		$d = opendir($path);
		while($f = readdir($d)) {
			//echo $f."<br>";
			if($f == '.' || $f == '..' || $f == 'thumb'){continue;}
			$rf = "$path/$f";
			$isdir = is_dir($rf);
			if(!$isdir && $par !=-1) { // check if this is a sub-directory
				$ext = substr($f, (strrpos($f,'.') +  1));
				$sql = "select filetype from $prefix"._gallery_media_types." where extension='$ext'";
				list($type) = $db->sql_fetchrow($db->sql_query($sql));
				//echo $type;
				if($type && !is_in($f, $row[gallid], $row[gallimg])) {
					switch($type) {
						case 1:
							$size[0] = 0;
							$size[1] = 0;
							if ($ext!="bmp" && $ext!="BMP")
								$size = getimagesize($rf);
							break;
						case 3:
							$size[0] = 320;
							$size[1] = 240;
							break;
						default:
							$size[0] = 0;
							$size[1] = 0;
							break;
					}
					$f = addslashes($f);
					$sql = "INSERT INTO $prefix"._gallery_pictures." (pid, gid, img, counter, submitter, date, name, description, votes, rate, extension, width, height) VALUES (NULL, $row[gallid], '$f', 0, '$submitter', NOW(), '$f', '$desc_pic', 0, 0, '$ext', $size[0], $size[1])";
					//echo $sql.'<br>';
					$db->sql_query($sql);
					print "<font size=\"1\">&nbsp;&nbsp;".sprintf(_GALFILEADDED, $f, $loc)."</font><br>";

					
					$img = $f;
					$image = "$gallerypath/$loc/$img";
					$thumb_dir = "$gallerypath/$loc/thumb";
					$thumb = "$thumb_dir/$img";

					// create the thumbnail
					if(!file_exists($thumb)) {
						if(!file_exists($thumb_dir) && $galleryvar['imageSoftware']!="browser") {
							makeDir("$gallerypath/$loc", "thumb");
						}
						if ($type==1) {
							$thumb = RatioResizeImg("$gallerypath/$loc/$img", $thumb, $row[gallid]);
						}

					}

					$c++;

				} else {
				    //no action
				}
			} elseif ($isdir) {
				$isindatabase = 0;
				if ($par==-1)
					$galloc = $f;
				else
					$galloc = "$loc/$f";
				$sql = "SELECT gallid, gallimg FROM $prefix"._gallery_categories." where galloc='$galloc'";
				//echo $sql.'<br>';
				$result = $db->sql_query($sql);
				if ($db->sql_numrows($result)>0)
					$isindatabase=1;
				if (!$isindatabase) {
					$sql = "INSERT INTO $prefix"._gallery_categories." (gallid, gallname, gallimg, galloc, description, parent, visible, template, numcol, total, lastadd, thumbwidth) VALUES (NULL, '$f', '".$galleryvar['GalleryPictureName']."', '$galloc', '$desc_cat', $par, 0, 2, 3, 0, 0,".$galleryvar['ThumbWidth'].")";
					//echo $sql.'<br>';
					$c += 1;
					$db->sql_query($sql);
					//echo $sql.'<br>'.mysql_error();
					if ( $loc == "" ) {
						$cat_loc = ""._GALHOME."";
					} else {
						$cat_loc = trim($loc);
					}
					print '<br><font class="'.$font['title'].'"><strong>'.sprintf(_GALNEWMEDIAADDED, $f, $cat_loc).'</strong></font><br>';
					$row2 = $db->sql_fetchrow($db->sql_query("SELECT gallid FROM $prefix"._gallery_categories." WHERE gallid=LAST_INSERT_ID()"));
				} else {
					$row2 = $db->sql_fetchrow($db->sql_query("SELECT gallid FROM $prefix"._gallery_categories." WHERE galloc='$galloc'"));
				}

				if ($recursive==1) {
					$c += radd($row2[gallid], $rf, $recursive, $submitter, $desc_pic, $desc_cat);
				}

			}

		} // while
		closedir($d);
		return $c;
	}
}

function quickaddpics($gallid, $recursive, $submitter, $desc_pic, $desc_cat) {
	global $prefix, $db, $adminurl, $gallerypath, $baseurl, $font	;
	galleryHeader();
	if (isset($gallid) && $gallid!="") {
		$nav = '<a class="'.$font['normal'].'" href="'.$adminurl.'&amp;do=quickaddpics">'._GALBATCHBUILD.'</a><font class="'.$font['normal'].'"> &gt; </font>'
		.'<font class="'.$font['normal'].'">'._GALBATCHBUILDRESULT.'</font>';
	} else {
		$nav= '<font class="'.$font['normal'].'">'._GALBATCHBUILD.'</font>';
	}

  	navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; </font>".$nav);

  	echo "<br>";
  	OpenTable();
	print '<p align="center">';

	if (isset($gallid) && $gallid!="") {
		if ($submitter==_GALDEFAULTSUBMITTERDESC)
			$submitter="";
		if ($desc_pic==_GALDEFAULTDESCPICDESC)
			$desc_pic="";
		if ($desc_cat==_GALDEFAULTDESCCATDESC)
			$desc_cat="";

		if ($gallid==-1) {
			$nb = radd($gallid, $gallerypath, $recursive, $submitter, $desc_pic, $desc_cat);
			$row[gallname] = "/";
		}
		else {

			$row = $db->sql_fetchrow($db->sql_query("select galloc, gallname from $prefix"._gallery_categories." where gallid=".$gallid));
			$nb = radd($gallid, $gallerypath."/".$row[galloc], $recursive, $submitter, $desc_pic, $desc_cat);
		}
		if($nb>0) {
			print "<hr><font class=\"".$font['title']."\">".sprintf(_GALNBMEDIAADDED, $nb)." </ont>";
			print '<br><br><a href="admin.php?op=GallAdmin&amp;do=editallcategories">'._GALEDITCATEGORY.'</a>';

		}
		else {
			echo '<font class="'.$font['normal'].'">'.sprintf(_GALNONEWMEDIAFOUND, $row[gallname]).'</font>';
		}
	}
	else {
		print "
		<form action=\"$adminurl\" method=\"post\">
		<input type=\"hidden\" name=\"do\" value=\"quickaddpics\">
		<font class=\"".$font['normal']."\">"._GALQUICKSELECT."</font>&nbsp;&nbsp;&nbsp;
		<select name=\"gallid\">";
		$categories = listcategories("$gallerypath");
	        echo "<option selected value=\"-1\">/</option> ";
		if (isset($categories) && $categories!="") {
			$categories = explode(" ", trim($categories));
			while(list($key, $val) = each($categories)) {
				$result = $db->sql_query("select gallid, gallname from $prefix"._gallery_categories." where gallid=".$val);
				list($gallid, $gallname) = $db->sql_fetchrow($result);
				$nbtabs = indent($gallid);
				$tab = "";
				for($k=0; $k<$nbtabs; $k++)
					$tab .= "&nbsp;&nbsp;";
				echo "<option value=\"$gallid\">$tab$gallname</option>\n";
			}
		}
		echo "</select><br><br><font class=\"".$font['normal']."\">"._GALQUICKRECURSIVE."</font>&nbsp;&nbsp;&nbsp;"
		."<input type=\"radio\" name=\"recursive\" value=\"1\" checked>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"recursive\" value=\"0\">"._NO
		."<br><br>"
		.'<font class="">'._GALDEFAULTSUBMITTER."</font><br><input type=\"text\" size=\"90\" name=\"submitter\" value=\""._GALDEFAULTSUBMITTERDESC."\"><br><br>"
		.'<font class="">'._GALDEFAULTDESCPIC."</font><br><input type=\"text\" size=\"90\" name=\"desc_pic\" value=\""._GALDEFAULTDESCPICDESC."\"><br><br>"
		.'<font class="">'._GALDEFAULTDESCCAT."</font><br><input type=\"text\" size=\"90\" name=\"desc_cat\" value=\""._GALDEFAULTDESCCATDESC."\">"
		."<br><br>"
		."<input type=\"submit\" name=\""._SEARCH."\" value=\""._SEARCH."\">"
		."</form>";
	}
	print '</p>';
	CloseTable();
	print '<br>';
	adminFooter();
}
?>
