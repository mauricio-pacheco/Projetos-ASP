<?php
######################################################################
# For NUKE: Web Portal System
# ===========================
# My_eGallery
# Copyright (c) 2001 by MarsisHere (marsishere@yahoo.fr)
#
# This modules is for image galleries
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License.
######################################################################


if( !eregi('admin.php', $_SERVER['SCRIPT_NAME']) ){die('Access Denied');}


$ModName = "My_eGallery";
include("modules/$ModName/include-admin.inc");

require_once("mainfile.php");

function galleryHeader() {
	include('header.php');
}

function adminFooter() {
        global $font;
	print '<br>';
	OpenTable();
	print '<font class="'.$font['normal'].'">My_eGallery Version - '._GALVERSION.'<br>'._GALVISITUPDATE.'</font>';
	CloseTable();
  	include('footer.php');
}

function navigationAdmin($url) {
        global $font;
 	#GraphicAdmin($hlpfile);
 	OpenTable();
	print '<center><font size="4"><b>'._GALADMIN.'</b></font></center><br>';
	print '<center><font size="4"><b>'._MAINADMIN.'</b></font></center>';
  	CloseTable();
	print '<br>';
	OpenTable();
	print $url;
	CloseTable();
}

function getThumbnail($img, $galloc) {
	global $gallerypath, $imagepath, $prefix, $db, $font;

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
	}

	//echo $thumb;
	return $thumb;
}

function showoptions() {
	global $prefix, $db, $adminurl, $font;

	galleryHeader();
	#GraphicAdmin($hlpfile);
	OpenTable();
	print '<center><font size="4"><b>'._GALADMIN.'</b></font></center><br>';
	print '<center><font size="4"><b>'._MAINADMIN.'</b></font></center>';

	CloseTable();
	print '<br>';
        OpenTable();

	$result = $db->sql_query("SELECT pid FROM $prefix"._gallery_pictures_newpicture."");
        $wait = $db->sql_numrows($result);
        print "<a class=\"".$font['title']."\" href=\"$adminurl&amp;do=Configure\">"._GALGENERALSETTINGS."</a> <font class=\"".$font['normal']."\">- "._GALGENERALSETTINGSDESC."</font><br><br>\n"
                ."<a class=\"".$font['title']."\" href=\"$adminurl&amp;do=editallcategories\">"._GALEDITCATEGORIES."</a> <font class=\"".$font['normal']."\">- "._GALEDITCATEGORIESDESC."</font><br><br>\n"
                ."<a class=\"".$font['title']."\" href=\"$adminurl&amp;do=editmedia\">"._GALEDITMEDIA."</a> <font class=\"".$font['normal']."\">- "._GALEDITMEDIADESC."</font><br><br>\n"
                ."<a class=\"".$font['title']."\" href=\"$adminurl&amp;do=editmediatypes\">"._GALEDITMEDIATYPE."</a> <font class=\"".$font['normal']."\">- "._GALEDITMEDIATYPEDESC."</font><br><br>\n"
                ."<a class=\"".$font['title']."\" href=\"$adminurl&amp;do=editmedia&amp;type=new\">"._GALADDNEWMEDIA."</a> <font class=\"".$font['normal']."\">- "._GALADDNEWMEDIADESC."</font><br><br>\n"
                ."<a class=\"".$font['title']."\" href=\"$adminurl&amp;do=quickaddpics\">"._GALBATCHBUILD."</a> <font class=\"".$font['normal']."\">- "._GALBATCHBUILDDESC."</font><br><br>\n"
                ."<a class=\"".$font['title']."\" href=\"$adminurl&amp;do=validnew&amp;type=checknew\">"._GALPOSTEDMEDIA.' ['.sprintf(_GALWAITING, $wait)."]</a> <font class=\"".$font['normal']."\">- "._GALPOSTEDMEDIADESC."</font><br><br>\n";
        CloseTable();
	print '<br>';
	adminFooter();
}

function installoptions() {
	global $font;

	galleryHeader();
	navigationAdmin("<font class=\"".$font['normal']."\"><a class=\"".$font['normal']."\" href=\"admin.php?op=GallAdmin\">"._GALADMIN."</a> &gt; "._GALINSTALL."</font>");
	print '<br>';
        OpenTable();

        print "<center>"
        	."<a class=\"".$font['title']."\" href=\"admin.php?op=GallInstall\">"._GALINSTALLNEW."</a><br><br>\n"
                ."<a class=\"".$font['title']."\" href=\"admin.php?op=GallUpdate\">"._GALUPDATE."</a><br><br>\n"
                ."<a class=\"".$font['title']."\" href=\"admin.php?op=GallUnInstall\">"._GALUNINSTALL."</a><br><br>\n"
                ."</center>"
        ;
        CloseTable();
	adminFooter();
}

function indent($gid) {
	global $prefix, $db;
	$tab = 0;
	list($parent) = $db->sql_fetchrow($db->sql_query("SELECT parent FROM $prefix"._gallery_categories." WHERE gallid=$gid"));
	while ($parent != -1) {
		list($parent) = $db->sql_fetchrow($db->sql_query("SELECT parent FROM $prefix"._gallery_categories." WHERE gallid=$parent"));
		$tab ++;
	}
	return $tab;
}

function listcategories($dir){
  global $prefix, $db, $gallerypath;

  $dossier = opendir($dir);
  $category = "";
  while ($file = readdir($dossier)) {
	if ($file != "." && $file != ".." && $file!="thumb"){
		if (is_dir($dir."/".$file)){
			$galloc  = substr($dir."/".$file, strlen("$gallerypath/"));
			$result = $db->sql_query("select gallid from $prefix"._gallery_categories." where galloc='$galloc'");
			if ($db->sql_numrows($result)>0) {
				list($gid) = $db->sql_fetchrow($result);
				$category .= "$gid ";
			}
			$category .= listcategories("$dir/$file");
  		}
  	}
  }
  return $category;
}


function rebuild_totals($debug = false) {
	global $prefix, $db;
	$result = $db->sql_query("SELECT gallid FROM $prefix"._gallery_categories." WHERE visible>0 ORDER BY gallid");
	while($row = $db->sql_fetchrow($result)) {
		$total = $db->sql_fetchrow($db->sql_query("SELECT COUNT(pid) AS total FROM $prefix"._gallery_pictures." WHERE gid=$row[gallid]"));
		$catTotal[$row[gallid]] = $total[total]; // id=>total
	}
	// total for parents
	$result = $db->sql_query("SELECT gallid, parent FROM $prefix"._gallery_categories." WHERE visible>0 ORDER BY parent DESC");
	while($row = $db->sql_fetchrow($result)) {
		if($row[parent]) {
			$t[$row[parent]] = ($t[$row[parent]] + $catTotal[$row[gallid]]) + $t[$row[gallid]];
		}
	}
	// add total of current category to total of all sub-categories
	$result = $db->sql_query("SELECT gallid, parent FROM $prefix"._gallery_categories." WHERE visible>0 ORDER BY parent DESC");
	while($row = $db->sql_fetchrow($result)) {
		$t[$row[gallid]] = $t[$row[gallid]] + $catTotal[$row[gallid]];
	}
	// do some zero filling on all categories, even non-visible
	$result = $db->sql_query("SELECT gallid FROM $prefix"._gallery_categories." ORDER BY gallid");
	while($row = $db->sql_fetchrow($result)) {
		$t[$row[gallid]] = intval($t[$row[gallid]]);
	}
	// ok, update our tables here
	foreach($t as $k=>$v) {
		$db->sql_query("UPDATE $prefix"._gallery_categories." SET total=$v WHERE gallid=$k");
		if($debug) print mysql_error();
	}
	// debug
	if($debug) {
		print '<table><tr><th>ID</th><th>Category</th><th>Total</th></tr>';
		$result = $db->sql_query("SELECT gallid, gallname, total FROM $prefix"._gallery_categories." ORDER BY parent DESC");
		while($row = $db->sql_fetchrow($result)) {
			print "<tr><td>$row[gallid]</td><td>$row[gallname]</td><td>$row[total]</td></tr>\n";
		}
		print '</table>';
		exit;
	}
}
if($do == 'test_totals') {
	rebuild_totals(true);
	exit;
}

function rebuild_lastadd($debug = false) {
	global $prefix, $db;
	// update each category last add first
	$result = $db->sql_query("SELECT gallid FROM $prefix"._gallery_categories." ORDER BY gallid");
	while($row = $db->sql_fetchrow($result)) {
		$high = $db->sql_fetchrow($db->sql_query("SELECT COUNT(pid) AS total, TO_DAYS(date) AS days FROM $prefix"._gallery_pictures." WHERE gid=$row[gallid] GROUP BY date ORDER BY date DESC"));
		print mysql_error();
		if($high[total]) {
			$db->sql_query("UPDATE $prefix"._gallery_categories." SET lastadd=FROM_DAYS($high[days]) WHERE gallid=$row[gallid]");
			if($debug) print mysql_error();
		}
		else {
			$db->sql_query("UPDATE $prefix"._gallery_categories." SET lastadd=0 WHERE gallid=$row[gallid]");
			if($debug) print mysql_error();
		}
	}
	// step backward and compare
	$result = $db->sql_query("SELECT gallid, parent, TO_DAYS(lastadd) AS days FROM $prefix"._gallery_categories." WHERE visible>0 ORDER BY parent DESC");
	while($row = $db->sql_fetchrow($result)) {
		if($row[parent]) {
			$prow = $db->sql_fetchrow($db->sql_query("SELECT TO_DAYS(lastadd) AS days FROM $prefix"._gallery_categories." WHERE gallid=$row[parent]"));
			// update parent is current is greater
			if($row[days] > $prow[days]) {
				$db->sql_query("UPDATE $prefix"._gallery_categories." SET lastadd=FROM_DAYS($row[days]) WHERE gallid=$row[parent]");
				if($debug) print mysql_error();
			}
		}
	}
	// debug
	if($debug) {
		print '<table><tr><th>ID</th><th>Category</th><th>Last Add</th></tr>';
		$result = $db->sql_query("SELECT gallid, gallname, lastadd AS days FROM $prefix"._gallery_categories." ORDER BY parent DESC");
		while($row = $db->sql_fetchrow($result)) {
			print "<tr><td>$row[gallid]</td><td>$row[gallname]</td><td>$row[days]</td></tr>\n";
		}
		print '</table>';
		exit;
	}
}
if($do == 'test_add') {
	rebuild_lastadd(true);
	exit;
}


function changeStatus($gid, $visible) {
	global $prefix, $db;
	$sql = "UPDATE $prefix"._gallery_categories." SET visible=$visible WHERE gallid=$gid";
	$db->sql_query($sql);
	$sql= "SELECT gallid FROM $prefix"._gallery_categories." WHERE parent=$gid";
	$result = $db->sql_query($sql);
	while ($row = $db->sql_fetchrow($result)) {
		changeStatus($row[gallid], $visible);
	}
	$db->sql_freeresult($result);
}


  switch($do) {

    case "Configure": //OK!
    	include("admin/modules/gallery/settings.php");
        Configure();
    	break;

    	case "ConfigSave": //OK!
        include("admin/modules/gallery/settings.php");
    	ConfigSave($GLOBALS[HTTP_POST_VARS]);
    	Header("Location: $adminurl");
	break;

	case "editallcategories": //OK!
		include ("admin/modules/gallery/editallcategories.php");
		editallcategories();
	break;

	case "editcategory": //OK!
		if (isset($type) && $type!="") {
		  switch ($type) {
		  	case "save": //OK!
				if (isset($category) && $category!="") {
					$sql = "UPDATE $prefix"._gallery_categories." SET ";
					$sql .= "thumbwidth='$thumbwidth', ";
					$sql .= "gallname='$categoryname', ";
					$sql .= "gallimg='$image', ";
					$sql .= "description='$description_cat', ";
					$sql .= "template='$xtemplate', ";
					$sql .= "visible='$visible', ";
					$sql .= "numcol='$numcol' ";
					$sql .= "WHERE gallid=$category";
					//echo $sql;
					$db->sql_query($sql);
				}
				rebuild_totals();
				rebuild_lastadd();
				Header("Location: $adminurl&do=editallcategories");
				break;

			case "create": //OK!
				include ("admin/modules/gallery/fileFunctions.php");
				$categoryloc = traite_nom_fichier($categoryloc);
				if ($parent!=-1)
					$categoryloc = "$parentloc/$categoryloc";

				$wdir = "/";

				$makeDir_return = makeDir($gallerypath, $categoryloc);
				if ($makeDir_return=="OK") {
					if (!isset($userfile) ||$userfile=="" || $userfile=="none") {
						$userfile = $imagepath."/gallery.gif";
						$userfile_name = "gallery.gif";
						$userfile_size = 10;
						if (!copy($userfile, "$gallerypath/$categoryloc/$userfile_name"))
							$upload_return = _GALUPLOADERROR3;
						else
							$upload_return = "OK";
					}
					else
						$upload_return = UploadFile($gallerypath.$wdir.$categoryloc, $userfile, $userfile_name, $userfile_size) ;
					if ($upload_return == "OK") {
						$sql = "INSERT INTO $prefix"._gallery_categories." (gallid, gallname, gallimg, galloc, description, parent, visible, template, numcol, total, lastadd) VALUES (NULL, '$categoryname', '$userfile_name', '$categoryloc', '$description_cat', '$parent', '$visible', '2', '$numcol', '0', now())";
						//echo $sql;
						$db->sql_query($sql);
					}
					else {
						include ("header.php");
						#GraphicAdmin($hlpfile);
					  	OpenTable();
						print '<center><font size="4"><b>'._GALADMIN.'</b></font></center><br>';
						print '<center><font size="4"><b>'._MAINADMIN.'</b></font></center>';
					  	CloseTable();
					  	echo "<br>";
					  	OpenTable();
						echo '<br>';
						echo '<center>'.$upload_return.'<br><br>'._GOBACK.'</center>';
						CloseTable();
						adminFooter();
					}
					rebuild_totals();
					rebuild_lastadd();
				}
				else {
					include ("header.php");
					#GraphicAdmin($hlpfile);
				  	OpenTable();
					print '<center><font size="4"><b>'._GALADMIN.'</b></font></center><br>';
					print '<center><font size="4"><b>'._MAINADMIN.'</b></font></center>';
				  	CloseTable();
				  	echo "<br>";
				  	OpenTable();
					echo '<br>';
					echo '<center>'.$makeDir_return.'<br><br>'._GOBACK.'</center>';
					CloseTable();
					adminFooter();
				}
				header("Location: $adminurl&do=editallcategories");
				break;

			case "move": //OK!
				include ("admin/modules/gallery/movecategory.php");
				$basedir = "$gallerypath";
				$wdir = "/";
				if (!isset($confirmed) || $confirmed=="")
					movecategory($category);
				else {
					list($oldloc) = $db->sql_fetchrow($db->sql_query("SELECT galloc FROM $prefix"._gallery_categories." WHERE gallid=$oldlocation"));
					list($newloc) = $db->sql_fetchrow($db->sql_query("SELECT galloc FROM $prefix"._gallery_categories." WHERE gallid=$newparent"));
					$dir = substr (strrchr ($oldloc, "/"), 1);

					if ($dir=="") {
						if ($newloc!="") {
							//echo $basedir.$wdir.$oldloc." 1-> ".$basedir.$wdir.$newloc.$wdir.$oldloc."<br>";
							$db->sql_query("UPDATE $prefix"._gallery_categories." SET thumbwidth='$thumbwidth', parent=$newparent, galloc='$newloc/$oldloc' WHERE gallid=$oldlocation");
							rmove($basedir.$wdir.$oldloc,$basedir.$wdir.$newloc.$wdir.$oldloc);
						}
						else {
							//echo $basedir.$wdir.$oldloc." 2-> ".$basedir.$wdir.$oldloc."<br>";
							$db->sql_query("UPDATE $prefix"._gallery_categories." SET thumbwidth='$thumbwidth', parent=$newparent, galloc='$oldloc' WHERE gallid=$oldlocation");
							rmove($basedir.$wdir.$oldloc,$basedir.$wdir.$oldloc);
						}
					}
					else {
						if ($newloc!="") {
							//echo $basedir.$wdir.$oldloc." 3-> ".$basedir.$wdir.$newloc.$wdir.$dir."<br>";
							$db->sql_query("UPDATE $prefix"._gallery_categories." SET thumbwidth='$thumbwidth', parent=$newparent, galloc='$newloc/$dir' WHERE gallid=$oldlocation");
							rmove($basedir.$wdir.$oldloc,$basedir.$wdir.$newloc.$wdir.$dir);
						}
						else {
							//echo $basedir.$wdir.$oldloc." 4-> ".$basedir.$wdir.$dir."<br>";
							$db->sql_query("UPDATE $prefix"._gallery_categories." SET thumbwidth='$thumbwidth', parent=$newparent, galloc='$dir' WHERE gallid=$oldlocation");
							rmove($basedir.$wdir.$oldloc,$basedir.$wdir.$dir);
						}

					}
					rebuild_totals();
					rebuild_lastadd();
					Header("Location: $adminurl&do=editallcategories");
				}

				break;

			case "delete": //OK!
				include ("admin/modules/gallery/deletecategory.php");
				deletecategory($category);
				rebuild_totals();
				rebuild_lastadd();
				Header("Location: $adminurl&do=editallcategories");
				break;

			case 'status':
				changeStatus($category, $visible);
				rebuild_totals();
				rebuild_lastadd();
				Header("Location: $adminurl&do=editallcategories");
				break;
		  }
		}
		else {
			include ("admin/modules/gallery/editcategory.php");
			editcategory($category, $parent);
		}

	break;

	case "edittemplate":

		if (isset($delete) && $delete!="") {
			$sql = "DELETE FROM $prefix"._gallery_template_types." WHERE id=$template";
			//echo $sql;
			$db->sql_query($sql);
			Header("Location: $adminurl&do=edittemplate");
		}
		else
		if (isset($type) && $type!="") {
			switch ($type) {
				case "edit":
					include("admin/modules/gallery/edittemplate.php");
					edittemplate($template);
					break;

				case "save":
					$sql = "UPDATE $prefix"._gallery_template_types." SET title='$xtemplatename', templateCategory='$xtemplateCat', templatePictures='$xtemplatePic', templateCSS='$xtemplateCSS' WHERE id=$templateid";
					//echo $sql;
					$db->sql_query($sql);
					Header("Location: $adminurl&do=edittemplate");
					break;

				case "create":
					$sql = "INSERT INTO $prefix"._gallery_template_types." (id, title, type, templateCategory, templatePictures, templateCSS) VALUES (NULL, '$xtemplatename', $xtype, '$xtemplateCat', '$xtemplatePic', '$xtemplateCSS')";
					//echo $sql;
					$db->sql_query($sql);
					Header("Location: $adminurl&do=edittemplate");
					break;
				default:
					include("admin/modules/gallery/edittemplate.php");
					edittemplate($template);
					break;

			}
		}
		else {
			include("admin/modules/gallery/editalltemplates.php");
			editalltemplates();
		}
		break;

	case "editmedia": //OK!
		$limit=5;
		if (isset($type) && $type!="") {
		  switch ($type) {
			case "edit": //OK!
				include("modules/My_eGallery/public/imageFunctions.php");
				include ("admin/modules/gallery/fileFunctions.php");
				include ("admin/modules/gallery/editmedia.php");
				editmedia($category, $pid);
				break;

			case "new": //OK!
				include ("admin/modules/gallery/fileFunctions.php");
				if (isset($add) && $add=="Insert") {

					$userfile_name = $_FILES['userfile']['name'];
					$userfile_temp = $_FILES['userfile']['tmp_name'];
					$userfile_size = $_FILES['userfile']['size'];
					$userfile_type = $_FILES['userfile']['type'];

					echo "<br> userfile_name = $userfile_name<br>userfile_temp = $userfile_temp <br>";
					echo "<br> userfile_size = $userfile_size<br>userfile_type = $userfile_type<br>";

					list($galloc) = $db->sql_fetchrow($db->sql_query("SELECT galloc FROM $prefix"._gallery_categories." WHERE gallid=$Category"));
					$wdir = "/";
					$userfile_name=  traite_nom_fichier($userfile_name);
					$ext = substr($userfile_name, (strrpos($userfile_name,'.') +  1));
					$result = $db->sql_query("select filetype from $prefix"._gallery_media_types." where extension='$ext'");

					if ($db->sql_numrows($result)==0) {
						include ("header.php");
						#GraphicAdmin($hlpfile);
					  	OpenTable();
					  	echo "<center><font size=\"4\"><b>"._GALADMIN."</b></font></center>";
					  	CloseTable();
					  	echo "<br>";
					  	OpenTable();
						echo '<br>';
						echo '<center>'._GALTYPENOTSUPPORTED.'<br><br>'._GOBACK.'</center>';
						CloseTable();
						adminFooter();
					}

					list($type) = $db->sql_fetchrow($result);
					$upload_return = UploadFile($gallerypath.$wdir.$galloc, $userfile_temp, $userfile_name, $userfile_size);
					if ($upload_return=="OK") {
						switch($type) {
							case 1:
								if ($ext!="bmp" && $ext!="BMP")
									$size = @getimagesize($gallerypath.$wdir.$galloc.$wdir.$userfile_name);
								break;
							case 3 :
								$size[0] = 320;
								$size[1] = 240;
								break;
							default:
								$size[0] = 0;
								$size[1] = 0;
								break;
						}

						//$MediaName = FixQuotes($MediaName);//strtr($MediaName,$trans);
						//$Description = FixQuotes($Description);//strtr($Description,$trans);

						if ($ext!="bmp" && $ext!="BMP") {
							$sql = "insert into $prefix"._gallery_pictures." (pid, gid, img, counter, submitter, date, name, description, votes, rate, extension, width, height) values(NULL, $Category, '$userfile_name', 0, '$Submitter', now(), '$MediaName', '$Description', 0, 0, '$ext', ".$size[0].", ".$size[1].")";
						} else {
							$sql = "insert into $prefix"._gallery_pictures." (pid, gid, img, counter, submitter, date, name, description, votes, rate, extension, width, height) values(NULL, $Category, '$userfile_name', 0, '$Submitter', now(), '$MediaName', '$Description', 0, 0, '$ext', 0, 0)";
						}
						$db->sql_query($sql);
						$insertrow=$db->sql_affectedrows();
						include ("header.php");
					  	OpenTable();
						navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; "._GALINSERTNMEDIA."</font>");
					  	CloseTable();
					  	echo "<br>";
					  	OpenTable();
						echo '<br>';
						if ($insertrow) {
							$sql = "select pid from $prefix"._gallery_pictures." where (gid='$Category') and (img='$userfile_name') ";
							$result = $db->sql_query($sql);
							list($pid) = $db->sql_fetchrow($result);
							printf (""._UPLOADOK."",$pid);
						} else {
							$error=$db->sql_error();
							echo '<center>$error<br><br>'._GOBACK.'</center>';
						}
						CloseTable();
						adminFooter();

					} else { //upload error!.
						include ("header.php");
					  	OpenTable();
						print '<center><font size="4"><b>'._GALADMIN.'</b></font></center><br>';
						print '<center><font size="4"><b>'._MAINADMIN.'</b></font></center>';
					  	CloseTable();
					  	echo "<br>";
					  	OpenTable();
						echo '<br>';
						echo '<center>'.$upload_return.'<br><br>'._GOBACK.'</center>';
						CloseTable();
						adminFooter();
					}
				} else {
					include ("admin/modules/gallery/createmedia.php");
					createmedia();
				}
				rebuild_totals();
				rebuild_lastadd();
				break;

			case "existing": //OK!
				for ($i=0; $i<$limit; $i++) {
					$task = "Task$i";

					if (isset($$task)) {
						switch ($$task) {
							case "Save" : // OK!
								$file = "FileName$i";
								$fileid = "FileId$i";
								$desc = "Description$i";
								$name = "FileName$i";
								//$oldname = "OldFileName$i";
								$mname = "MediaName$i";
								$date = "Date$i";
								$cat = "Category$i";
								$oldcat = "OldCategory$i";
								$submitter = "Submitter$i";
								$width = "Width$i";
								$height = "Height$i";
								//list($galloc) = $db->sql_fetchrow($db->sql_query("SELECT galloc FROM $prefix"._gallery_categories." WHERE gallid=".$$cat));

								$$mname = FixQuotes($$mname);//strtr($$mname,$trans);
								$$desc = FixQuotes($$desc);//strtr($$desc,$trans);

								$sql  = "UPDATE $prefix"._gallery_pictures." ";
								$sql .= "SET gid=".$$cat.", ";
								$sql .= "submitter='".$$submitter."', date='".$$date."', img='".$$name."', ";
								$sql .= "name='".$$mname."', description = '".$$desc."', ";
								$sql .= "width='".$$width."', height='".$$height."' ";
								$sql .= "WHERE pid=".$$fileid;
								//echo $sql;
								$okcat =1;
								$basedir = "modules/My_eGallery";
								$wdir = "/";
								if ($$cat != $$oldcat) {
									// We move the picture
									list($oldloc) = $db->sql_fetchrow($db->sql_query("SELECT galloc from $prefix"._gallery_categories." WHERE gallid=".$$oldcat));
									list($newloc) =  $db->sql_fetchrow($db->sql_query("SELECT galloc from $prefix"._gallery_categories." WHERE gallid=".$$cat));
									if (rename($gallerypath.$wdir.$oldloc.$wdir.$$name,$gallerypath.$wdir.$newloc.$wdir.$$name)) {
										$okcat = 1;
										$thumb = getThumbnail($$name, $oldloc);
										if (!strstr($thumb,$imagepath)) {
											$thumb = substr (strrchr ($thumb, "/"), 1);
											//echo "move : ".$gallerypath.$wdir.$oldloc.$wdir."thumb/".$thumb." -> ".$gallerypath.$wdir.$newloc.$wdir."thumb/".$thumb."<br>";
											if (rename($gallerypath.$wdir.$oldloc.$wdir."thumb/".$thumb,$gallerypath.$wdir.$newloc.$wdir."thumb/".$thumb))
												$okcat = 1;
											else
												$okcat = 0;
										}
									}
									else
										$okcat = 0;
								}
								if ($okcat)
									$db->sql_query($sql);
								rebuild_totals();
								rebuild_lastadd();
								break;

							case "Delete" : // OK!
								$file = "FileName$i";
								$cat = "Category$i";
								$fileid = "FileId$i";
								list($galloc) = $db->sql_fetchrow($db->sql_query("SELECT galloc FROM $prefix"._gallery_categories." WHERE gallid=".$$cat));
								$basedir = "$gallerypath";
								$wdir = "/";
								//echo "delete : ".$basedir.$wdir.$galloc.$wdir.$$file."<br>";
								if (file_exists($basedir.$wdir.$galloc.$wdir.$$file))
									unlink($basedir.$wdir.$galloc.$wdir.$$file);
								$thumb = getThumbnail($$file, $galloc);
								//echo "delete thumb: $thumb<br>";
								if (!strstr($thumb, $imagepath))
									if (file_exists($thumb))
										unlink($thumb);
								$sql  = "DELETE FROM $prefix"._gallery_pictures." WHERE pid=".$$fileid;
								//echo $sql;
								$db->sql_query($sql);
								rebuild_totals();
								rebuild_lastadd();
								break;
						}
					}
				} // for
				rebuild_totals();
				rebuild_lastadd();
				Header("Location: $adminurl&do=editmedia");
				break;
		  } // Switch
		} // If
		else {
			include ("admin/modules/gallery/maineditmedia.php");
			maineditmedia();
		}
		break;


        case "quickaddpics": //OK!
              include ("admin/modules/gallery/quickaddmedia.php");
              quickaddpics($gallid, $recursive, $submitter, $desc_pic, $desc_cat);
	      rebuild_totals();
	      rebuild_lastadd();
              break;

	case "validnew":
		$limit=6;
		if (isset($type) && $type!="") {
		   //echo $type;
  		   switch($type) {
			case "validate":
				for ($i=0; $i<$limit; $i++) {
					$task = "Task$i";

					if (isset($$task)) {
						//echo $$task;
						switch ($$task) {
							case "Validate" :
								$fileid = "FileId$i";
								$desc = "Description$i";
								$name = "FileName$i";
								$oldname = "OldFileName$i";
								$mname = "MediaName$i";
								$date = "Date$i";
								$cat = "Category$i";
								$submitter = "Submitter$i";
								$width = "Width$i";
								$height = "Height$i";
								// We move the picture
								$basedir = "modules/My_eGallery";
								$wdir = "/";
								list($newloc) =  $db->sql_fetchrow($db->sql_query("SELECT galloc from $prefix"._gallery_categories." WHERE gallid=".$$cat));
								//echo $basedir.$wdir."temp".$wdir.$$name." -> ".$basedir.$wdir."gallery".$wdir.$newloc.$wdir.$$name;
								if (rename($basedir.$wdir."temp".$wdir.$$oldname,$basedir.$wdir."gallery".$wdir.$newloc.$wdir.$$name)) {
									$ext = substr($$name, (strrpos($$name,'.') +  1));
									$sql  = "INSERT INTO $prefix"._gallery_pictures." (pid, gid, img, counter, submitter, date, name, description, votes, rate, extension, width, height) VALUES(NULL, ".$$cat.", '".$$name."', 0, '".$$submitter."', '".$$date."', '".$$mname."', '".$$desc."', 0, 0, '".$ext."', ".$$width.", ".$$height.")";
									//echo $sql;
									$db->sql_query($sql);
									$sql = "DELETE FROM $prefix"._gallery_pictures_newpicture." WHERE pid=".$$fileid;
									$db->sql_query($sql);
									rebuild_totals();
									rebuild_lastadd();
								}
								else
									echo "Failed to move ".$$name."...<br>\n";
								break;

							case "Delete" : // OK
								$file = "FileName$i";
								$fileid = "FileId$i";

								$basedir = "modules/My_eGallery/temp";
								$wdir = "/";
								//echo "delete : ".$basedir.$wdir.$$file."<br>";
								if (file_exists($basedir.$wdir.$$file))
									unlink($basedir.$wdir.$$file);
								$sql  = "DELETE FROM $prefix"._gallery_pictures_newpicture." WHERE pid=".$$fileid;
								//echo $sql;
								$db->sql_query($sql);
								rebuild_totals();
								rebuild_lastadd();
								break;
						}
					}
				} // for
 				Header("Location: $adminurl");
				//showoption();

			        break;

			case "checknew":
				include ("admin/modules/gallery/validnewmedia.php");
				validnew();
				rebuild_totals();
				rebuild_lastadd();
	      			break;
 		    }// Switch
		} // If
		else
			Header("Location: $adminurl");
		break;

	case "editmediatypes" :
		include ("admin/modules/gallery/editmediatypes.php");
		if (isset($type) && $type!="") {
			switch($type) {
			case "edit":
				if (isset($save)) {
					$sql = "UPDATE $prefix"._gallery_media_types." SET extension='$extension', description='$description', filetype=$class, displaytag='$code', thumbnail='$thumbnail' WHERE extension='$oldext'";
				}
				if (isset($delete)) {
					$sql = "DELETE FROM $prefix"._gallery_media_types." WHERE extension='$oldext'";
				}
				$db->sql_query($sql);
				Header("Location: $adminurl&do=editmediatypes");
				break;

			case "new":
				$sql = "INSERT INTO $prefix"._gallery_media_types." (extension, description,filetype, displaytag, thumbnail) VALUES ('$extension','$description', $class, '$code', '$thumbnail')";

				$db->sql_query($sql);
				//echo "$sql".mysql_error();

				//Header("Location: $adminurl&do=editmediatypes");
				break;

			}
		}
		else
			editmediatypes();
		break;

        default:
              showoptions();
              break;

  } // Switch

?>
