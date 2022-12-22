<?
function validnew() {
	global $prefix, $db, $db, $picnum, $gallerypath, $adminurl, $basepath, $font;

	galleryHeader();
  	navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; "._GALVALIDNEWMEDIA."</font>");

  	echo "<br>";
  	OpenTable();


	echo "
	<form method=\"POST\" action=\"admin.php\">
	<input type=\"hidden\" name=\"op\" value=\"GallAdmin\">
	<input type=\"hidden\" name=\"do\" value=\"validnew\">
	<input type=\"hidden\" name=\"type\" value=\"validate\">

	<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">
	  <tr>";
	//$sql = "SELECT gallname FROM $prefix"._gallery_categories." WHERE gallid=$gid";
	//list ($gallname) = $db->sql_fetchrow($db->sql_query($sql));

	$sql = "SELECT count(*) FROM $prefix"._gallery_pictures_newpicture."";
	$result = $db->sql_query($sql);

	$limit = 5;
	echo "<input type=\"hidden\" name=\"limit\" value=\"$limit\">";
	list($numrows) = $db->sql_fetchrow($result);

	if ($numrows>0) {

		if (!isset($picnum) || $picnum=="") {
                	$picnum=0;
        	}
		$pages = intval($numrows/$limit);
		$sql = "SELECT p.pid, p.gid, p.img, p.submitter, p.date, p.name, p.description, p.width, p.height, t.filetype, t.thumbnail  FROM $prefix"
				._gallery_pictures_newpicture." p, $prefix" 
				 ._gallery_media_types." t  Where (p.extension=t.extension)  limit $picnum, $limit";
		//echo $sql;
		$res = $db->sql_query($sql);



		if ($numrows%$limit) {
        		$pages++;
		}

		for ($i=1;$i<=$pages; $i++) {
        		$newpicnum=$limit*($i-1);
        		if ($newpicnum==$picnum) {
	        		$nav .= "[$i]";
	        		$end = $limit*$i;
	        		if ($end>$numrows)
	        			$end = $numrows;
        		}
        		else {
	        		$nav .= "[<a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=validnew&amp;type=checknew&amp;picnum=$newpicnum\">$i</a>]";
        		}
		}
		$deb = $picnum+1;

		 echo "
		    <td width=\"100%\" align=\"center\"><font class=\"".$font['title']."\">
			"._GALNOWDISPLAYFILES." $deb - $end of $numrows<br>
			"._GALJUMP2PAGE." $nav</font></td></tr>";

		$i=0;
		while (list($pid, $gid, $img, $submitter, $date, $name, $description, $width, $height, $filetype, $thumbnail) = $db->sql_fetchrow($res)) {
			//check file type
			if ($filetype==1) {
			    $thumb = "<a href=\"modules/My_eGallery/temp/$img\" target=\"_new\">
							<img src=\"modules/My_eGallery/temp/$img\" width=\"75\" border=\"0\">
						  </a>";
			} else {
			    $thumb = "<a href=\"modules/My_eGallery/temp/$img\" target=\"_new\">
							<img src=\"modules/My_eGallery/images/$thumbnail\" border=\"0\">
						  </a>";
			}

			echo " <tr><td width=\"100%\"><br>";
			OpenTable();
			echo "
				  <table border=\"0\" cellpadding=\"10\" cellspacing=\"0\"><tr>
					<td width=\"150\" valign=\"top\">
			        <p align=\"left\"> $thumb <br>
			        <font class=\"".$font['title']."\">"._GALFILENAME."</font><br>
					<input type=\"hidden\" name=\"OldFileName$i\" size=\"14\" value=\"$img\">
					<input type=\"text\" name=\"FileName$i\" size=\"14\" value=\"$img\"><br>
					<input type=\"hidden\" name=\"FileId$i\" size=\"14\" value=\"$pid\">
					<font class=\"".$font['title']."\">
					<INPUT TYPE=\"radio\" NAME=\"Task$i\" VALUE=\"Validate\" checked><font class=\"tiny\">"._GALVALIDNEW."</font><br>
					<INPUT TYPE=\"radio\" NAME=\"Task$i\" VALUE=\"Delete\"><font class=\"tiny\">"._GALDELETE."</font>
					</td>
				    <td width =\"150\" align=\"left\" valign=\"top\">
					<font class=\"".$font['title']."\">"._GALSELECTCATEGORY."</font><br>
		            		<select name=\"Category$i\">";

					$categories = listcategories("$gallerypath");
					$categories = explode(" ", trim($categories));
					while(list($key, $val) = each($categories)) {
						$result = $db->sql_query("select gallid, gallname, parent from $prefix"._gallery_categories." where gallid=".$val);
						list($gallid, $gallname, $parent) = $db->sql_fetchrow($result);
						$nbtabs = indent($gallid);
						$tab = "";
						for ($j=0; $j<$nbtabs; $j++)
							$tab .= "&nbsp;&nbsp;";
						if ($gallid==$gid)
							echo "<option selected value=\"$gallid\">$tab$gallname</option> ";
						else
							echo "<option value=\"$gallid\">$tab$gallname</option> ";
					 }
		            echo "</select><br>
 				<font class=\"".$font['title']."\">"._GALWIDTHXHEIGHT."</font><br>
				<input type=\"text\" name=\"Width$i\" size=\"4\" value=\"$width\"> x <input type=\"text\" name=\"Height$i\" size=\"4\" value=\"$height\"><br>
				<font class=\"".$font['title']."\">"._GALMEDIANAME."</font><br>
				<input type=\"text\" name=\"MediaName$i\" size=\"14\" value=\"$name\"><br>
			        <font class=\"".$font['title']."\">"._GALDATEADDED."<br></font>
					<input type=\"text\" name=\"Date$i\" size=\"14\" value=\"$date\"><br>
			        <font class=\"".$font['title']."\">"._GALSUBMITTER."</font><br>
					<input type=\"text\" name=\"Submitter$i\" size=\"14\" value=\"$submitter\"></td>
					<td align=\"left\" valign=\"top\" width=\"609\">
				<font class=\"".$font['title']."\">"._GALDESCRIPTION."</font><br>
			        <textarea  name=\"Description$i\" rows=\"9\" cols=\"25\">$description</textarea>
				  </td></tr>
		          </table>";
			CloseTable();
			echo"<br>
			      </td>
				  </tr>";
			$i++;
		} //while
		echo "
		<tr><td align=\"center\" colspan=\"2\"><input type=\"submit\" value=\""._SAVECHANGES."\" name=\"add\"></form>";
	}
	else
		echo "<tr><td align=\"center\" colspan=\"2\"><br><font class=\"".$font['normal']."\">No Media Found</font><br>";

	echo "</td></tr></table></form>";
	CloseTable();
	print '<br>';
	adminFooter();
}


?>
