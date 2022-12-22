<?

function listcategories($dir){
  global 	$gallerypath, $prefix, $db  ;

  $dossier = opendir($dir);
  $category = "";
  while ($file = readdir($dossier)) {
	if ($file != "." && $file != ".." && $file!="thumb"){
		if (is_dir($dir."/".$file) && is_writable($dir."/".$file)){
			$galloc  = substr($dir."/".$file, strlen("$gallerypath/"));
			$result = $db->sql_query("select gallid from $prefix"._gallery_categories." where galloc='$galloc'");
			if ($result) {
				list($gid) = $db->sql_fetchrow($result);
				$category .= "$gid ";
			}
			$category .= listcategories("$dir/$file");
  		}
  	}
  }
  return $category;
}

function upload_file() {
	global $name, $font, $galleryvar, $basepath, $user, $gallerypath, $prefix, $db, $baseurl, $bgcolor1, $bgcolor2;

	galleryHeader();
	OpenTable();
	$size = intval($galleryvar['maxSize']) / 1000;
	$up_title = "<font class=\"".$font['title']."\"><b>"._GALUPLOADMEDIA."</b></font>\n";

	if (is_user($user) || !$galleryvar['anonpostpics']) {
	    $up_form = "<form enctype=\"multipart/form-data\" action=\"".$baseurl."\" method=\"post\">
		    <input type=\"hidden\" name=\"do\" value=\"upload\">\n";
	    $gall_select_txt = "<font class=\"".$font['normal']."\">"._GALSELECTCATEGORY."</font>";
	    $gall_select = "<select name=\"Category\">";

			$categories = listcategories("$gallerypath");
			if (isset($categories) && $categories!="") {
				$categories = explode(" ", trim($categories));
				while(list($key, $val) = each($categories)) {
					if (is_user($user))
						$result = $db->sql_query("select gallid, gallname, parent from $prefix"._gallery_categories." where visible>0 and gallid=".$val);
					else
						$result = $db->sql_query("select gallid, gallname, parent from $prefix"._gallery_categories." where visible>1 and gallid=".$val);
					if ($db->sql_numrows($result)>0) {
						list($gallid, $gallname, $parent) = $db->sql_fetchrow($result);
						$nbtabs = indent($gallid);
						$tab = "";
						for($k=0; $k<$nbtabs; $k++)
							$tab .= "&nbsp;&nbsp;";
						$gall_select .= "<option value=\"$gallid\">$tab$gallname</option>\n";
					}
				}
			}
			$gall_select .= "</select>\n";
			$gall_name_txt = "<font class=\"".$font['normal']."\">"._GALMEDIANAME."<br></font>";
		       $gall_name = "<input type=\"text\" name=\"MediaName\" size=\"14\" value=\"\">";
		       $gall_filename_txt = "<font class=\"".$font['normal']."\">"._GALFILENAME."</font>";
		       $gall_filename = "";
		       if ($galleryvar['limitSize']) {
			    $gall_filename .= "<INPUT TYPE=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"".$galleryvar['maxSize']."\">\n";
		       }
		       $gall_filename .= "<input type=\"file\"  name=\"userfile\" id=\"userfile\" size=\"20\">";
		       $gall_submitter_txt ="<font class=\"".$font['normal']."\">"._GALSUBMITTER.":</font>";
			if (is_user($user)) {
			    $userdata=cookiedecode($user);
			    $gall_submitter = "<input type=\"hidden\" name=\"Submitter\" value=\"".$userdata[1]."\">".$userdata[1];
			} else {
			    $gall_submitter = "<input type=\"text\" name=\"Submitter\" size=\"14\">";
			}

			$gall_desc_txt = "<font class=\"".$font['normal']."\">"._GALDESCRIPTION.":</font>";
			$gall_desc = "<textarea  name=\"Description\" rows=\"10\" cols=\"45\"></textarea>";
			$submit_btn = "<input type=\"submit\" value=\"Upload\" name=\"add\">";
			 echo "$up_form\n
			<table width=\"75%\" border=\"0\" cellspacing=\"1\" cellpadding=\"10\" align=\"center\" bgcolor=\"$bgcolor2\">
			  <tr>
			    <td align=\"center\" valign=\"middle\">$up_title</td>
			  </tr>
			  <tr>
			    <td align=\"center\" valign=\"middle\">
			      <table width=\"75%\" border=\"0\" cellspacing=\"1\" cellpadding=\"10\" bgcolor=\"$bgcolor1\">
				<tr>
				  <td width=\"200\" align=\"left\" bgcolor=\"$bgcolor2\">$gall_select_txt</td>
				  <td  align=\"left\" bgcolor=\"$bgcolor2\">$gall_select</td>
				</tr>
				<tr>
				  <td width=\"200\" align=\"left\" bgcolor=\"$bgcolor2\">$gall_name_txt</td>
				  <td  align=\"left\" bgcolor=\"$bgcolor2\">$gall_name</td>
				</tr>
				<tr>
				  <td width=\"200\" align=\"left\" bgcolor=\"$bgcolor2\">$gall_filename_txt</td>
				  <td  align=\"left\" bgcolor=\"$bgcolor2\">$gall_filename</td>
				</tr>
				<tr>
				  <td width=\"200\" align=\"left\" bgcolor=\"$bgcolor2\">$gall_submitter_txt</td>
				  <td  align=\"left\" bgcolor=\"$bgcolor2\">$gall_submitter</td>
				</tr>
				<tr>
				  <td width=\"200\" align=\"left\" bgcolor=\"$bgcolor2\">$gall_desc_txt</td>
				  <td  align=\"left\" bgcolor=\"$bgcolor2\">$gall_desc</td>
				</tr>
				<tr>
				  <td width=\"200\" align=\"left\" bgcolor=\"$bgcolor2\">&nbsp;</td>
				  <td  valign=\"middle\" align=\"center\" bgcolor=\"$bgcolor2\">$submit_btn</td>
				</tr>
			      </table>
			     </form>  
			    </td>
			  </tr>
			  <tr>
			     <td>";
				    echo "
				    <table border=\"0\" align=\"center\">
					<tr>
						<td align=\"center\">
						<font class=\"".$font['normal']."\">";
						if ($galleryvar['limitSize']) {
							echo "".sprintf(_GALMAXSIZEPOST,$size)."  <br>";
						}
						echo _GALCLICKONCE."
						</font>
						</td>
					</tr>
				     </table>";
			echo "
			    </td>
			  </tr>
			</table>\n";

	} else {
	    echo "<p align=\"center\"><font class=\"".$font['normal']."\">"._GALREGISTER2POSTPICS."</font></p>";
	}
	CloseTable();
	galleryFooter();
}


function Add($gid, $file, $submitter, $medianame, $description, $userfile, $userfile_name, $userfile_size) {
    global $user, $font, $galleryvar, $basepath, $temppath, $prefix, $db, $sitekey;

    $gid =intval($gid);
    //Rename file for security//
    $ext = substr($userfile_name, (strrpos($userfile_name,'.') +  1));
    $tmp_name = date("YmdHis");
    $tmp_name = MD5($tmp_name.$userfile_name.$sitekey);
    $tmp_name = substr($tmp_name,0,15);
    $tmp_name .= ".$ext";
    //echo "Name = $tmp_name<br>";

    $sql = "select img from $prefix"._gallery_pictures." where gid='$gid' and img='$file'";
    //echo $sql;
    $result = $db->sql_query($sql);
    $numrows = $db->sql_numrows($result);
    //$navgall = navigationGall();

    if ($file==$galleryvar['GalleryPictureName'] || $numrows>0) {
	galleryHeader();
	OpenTable();
	print '<table border="0" width="100%" align="center" cellpadding="0">'
	 	.'<tr><td>';

	echo "<br>";
	echo "<center><b>"._GALPICALREADYEXT."</b><br><br>"
	    .""._GOBACK."";
	print '</td></tr></table>';
	CloseTable();
	galleryFooter();
    }
    else {
	    if(is_user($user)) {
		$user2 = base64_decode($user);
		$cookie = explode(":", $user2);
		cookiedecode($user);
		$submitter = $cookie[1];
	    }

	// Check if Media Name exist
	    if (!isset($medianame) || $medianame=="") {
		galleryHeader();
		echo "<br>";
		OpenTable();
		print '<table border="0" width="100%" align="center" cellpadding="0">'
	 	.'<tr><td>'.$navgall;
		echo "<br>";
		echo "<center><b>"._GALPICNONAME."</b><br><br>"
		    .""._GOBACK."";
		print '</td></tr></table>';
		CloseTable();
		galleryFooter();
	    }
	    else
	// Check if Description exist
	    if (!isset($description) || $description=="") {
		galleryHeader();
		echo "<br>";
		OpenTable();
		print '<table border="0" width="100%" align="center" cellpadding="0">'
	 	.'<tr><td>'.$navgall;
		echo "<center><b>"._GALPICNODESC."</b><br><br>"
		    .""._GOBACK."";
		print '</td></tr></table>';
		CloseTable();
		galleryFooter();
	    }
	    else
	// Check if Submitter exist
	    if (!isset($submitter) || $submitter=="") {
		galleryHeader();
		echo "<br>";
		OpenTable();
		print '<table border="0" width="100%" align="center" cellpadding="0">'
	 	.'<tr><td>'.$navgall;
		echo "<br>";
		echo "<center><b>"._GALPICNOSUBMITTER."</b><br><br>"
		    .""._GOBACK."";
		print '</td></tr></table>';
		CloseTable();
		galleryFooter();
	    } else {
		$medianame = FixQuotes($medianame);
		$description = FixQuotes($description);
		$wdir = "/";
		$upload_return = UploadFile($temppath, $userfile, $tmp_name, $userfile_size);
		if ($upload_return=="OK") {
			$ext = substr($file, (strrpos($file,'.') +  1));
			list($type) = $db->sql_fetchrow($db->sql_query("select filetype from $prefix"._gallery_media_types." where extension='$ext'"));

			switch($type) {
				case 1 :
					$size = @getimagesize("$temppath/$tmp_name");
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

			$file = $tmp_name;
			if ($size!=NULL)
				$sql = "insert into $prefix"._gallery_pictures_newpicture." (pid, gid, img, counter, submitter, date, name, description, votes, rate, extension, width, height) values(NULL, $gid, '$file', 0, '$submitter', now(), '$medianame', '$description', 0, 0, '$ext', ".$size[0].", ".$size[1].")";
			else
				$sql = "insert into $prefix"._gallery_pictures_newpicture." (pid, gid, img, counter, submitter, date, name, description, votes, rate, extension, width, height) values(NULL, $gid, '$file', 0, '$submitter', now(), '$medianame', '$description', 0, 0, '$ext', 0, 0)";
			//echo $sql;
			$db->sql_query($sql);
		}
		else
			return $upload_return;
		return "OK";
	}
    }
}
?>
