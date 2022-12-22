<?php

function editmedia($gid, $pid="") {
	 global $prefix, $db, $gallerypath, $basepath, $baseurl, $adminurl, $picnum, $galleryvar, $font;

	$limit = 5;

	galleryHeader();
  	navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; </font><a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=editmedia\">"._GALEDITMEDIA."</a><font class=\"".$font['normal']."\"> &gt; "._GALEDITMEDIADESC."</font>");

  	echo "<br>";
  	OpenTable();


	$sql = "SELECT gallname FROM $prefix"._gallery_categories." WHERE gallid=$gid";
	list ($gallname) = $db->sql_fetchrow($db->sql_query($sql));

	if (isset($pid) && $pid!="")
		$numrows = 1;
	else {
		$sql = "SELECT count(*) FROM $prefix"._gallery_pictures." WHERE gid=$gid";
		$result = $db->sql_query($sql);
		list($numrows) = $db->sql_fetchrow($result);
	}

	if ($numrows>0) {

		if (!isset($picnum) || $picnum=="") {
                	$picnum=0;
        	}
		$pages = intval($numrows/$limit);


		if (isset($pid) && $pid!="")
			$sql = "SELECT p.pid, p.gid, c.galloc, p.img, p.counter, p.submitter, p.date, p.name, p.description, p.votes, p.rate, p.width, p.height, c.thumbwidth  FROM $prefix"._gallery_pictures." p, $prefix"._gallery_categories." c WHERE p.pid=$pid AND p.gid=$gid and p.gid=c.gallid limit $picnum, $limit";
		else
			$sql = "SELECT p.pid, p.gid, c.galloc, p.img, p.counter, p.submitter, p.date, p.name, p.description, p.votes, p.rate, p.width, p.height, c.thumbwidth  FROM $prefix"._gallery_pictures." p, $prefix"._gallery_categories." c WHERE p.gid=$gid and p.gid=c.gallid limit $picnum, $limit";
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
	        		$nav .= "[<a class=\"".$font['normal']."\" href=\"$adminurl&do=editmedia&type=edit&category=$gid&picnum=$newpicnum\">$i</a>]";
        		}
		}
		$deb = $picnum+1;

		 echo "
		<form method=\"POST\" action=\"$adminurl\">
		<input type=\"hidden\" name=\"do\" value=\"editmedia\">
		<input type=\"hidden\" name=\"type\" value=\"existing\">
		<input type=\"hidden\" name=\"limit\" value=\"$limit\">

		    <p align=\"center\"><font class=\"".$font['title']."\">"._GALDISPLAYMEDIAIN." $gallname<br>
			"._GALNOWDISPLAYFILES." $deb - $end of $numrows<br>
			"._GALJUMP2PAGE." $nav</font>
		    </p>";
		$i=0;
		print '<table width=\"100%\" align="center">';
		while (list($pid, $gid, $galloc, $img, $counter, $submitter, $date, $name, $description, $votes, $rate, $width, $height, $thumbnailwidth ) = $db->sql_fetchrow($res)) {
			
			$dir="../gallery/$galloc/"; // the directory where your image's at with "/" at the end, leave it 				     // blank if you are calling the image from the same directory
			$pic="$img"; // your image file name
			$target++; // leave this alone
			$nmdir="modules/My_eGallery/public/"; // the directory where your nmimage.php's at with "/" at the end

			$print = "\n\n<A HREF=\"#\" onMouseOver=\"window.status='Full Screen Image Preview';return true\" onMouseOut=\"window.status='';return true\" onClick=\"window.open('$nmdir";
			$print .= "nmimage.php?z=$dir$pic&width=$width&height=$height','$target','width=$width,height=$height,directories=no,location=no,menubar=no,scrollbars=no,status=no,toolbar=no,resizable=no,left=0,top=0,screenx=50,screeny=50');return false\">";

		echo "
	  	<tr>
			<td width=\"100%\">";
			OpenTable();
			echo "
			<table border=\"0\" cellpadding=\"5\" cellspacing=\"1\">
			<tr>
		        	<td>$print";
					//<a href=\"$gallerypath/$galloc/$img\" target=\"_new\">";
                                        $image = "$gallerypath/$galloc/$img";
				        $thumb_dir = "$gallerypath/$galloc/thumb";
					$thumb = "$thumb_dir/$img";
					if(!file_exists($thumb))
			                {
						if (!file_exists($thumb_dir) && $galleryvar['imageSoftware']!="browser")
						{
							makeDir("$gallerypath/$galloc", "thumb");
						}
						$ext = substr($img, (strrpos($img,'.') +  1));
						$sql = "select filetype from $prefix"._gallery_media_types." where extension='$ext'";
						list($filetype) = $db->sql_fetchrow($db->sql_query($sql));
						if ($filetype==1)
				                	$thumb = RatioResizeImg("$gallerypath/$galloc/$img", $thumb, $gid);

						if ($thumb=="browser")
							$thumb = $image;
						else
							$thumb = getThumbnail($img, $galloc);
					}

					$imginfo = @getimagesize($thumb);
					if( $imginfo[0] > $imginfo[1] ) {
					    $scaleimg = "width=\"$thumbnailwidth\"";
					} else {
					    $scaleimg = "height=\"$thumbnailwidth\"";
					}

					print '<img src="'.$thumb.'" $scaleimg alt="'.$name.'"  border="0">';
					echo "
					</a><br>
				        <font class=\"".$font['normal']."\">"._GALFILENAME."</font><br>
					<font class=\"".$font['normal']."\">$img</font><br>
					<input type=\"hidden\" name=\"FileName$i\" size=\"14\" value=\"$img\">
					<input type=\"hidden\" name=\"FileId$i\" size=\"14\" value=\"$pid\">
					<font class=\"".$font['normal']."\">
					<INPUT TYPE=\"radio\" NAME=\"Task$i\" VALUE=\"Save\" checked><small>"._GALSAVECHANGES."</small><br>
					<INPUT TYPE=\"radio\" NAME=\"Task$i\" VALUE=\"Delete\"><small>"._GALDELETE."</small>
			  	</td>
			  	<td align=\"left\" valign=\"top\">
					<font class=\"".$font['normal']."\">"._GALSELECTCATEGORY."</font><br>
					<input type=\"hidden\" name=\"OldCategory$i\" size=\"14\" value=\"$gid\">
		            		<select size=\"1\" name=\"Category$i\">";

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
		            echo "	</select><br>
					<font class=\"".$font['normal']."\">"._GALWIDTHXHEIGHT."</font><br>
					<input type=\"text\" name=\"Width$i\" size=\"4\" value=\"$width\"> x <input type=\"text\" name=\"Height$i\" size=\"4\" value=\"$height\"><br>
					<font class=\"".$font['normal']."\">"._GALMEDIANAME."<br></font>
					<input type=\"text\" name=\"MediaName$i\" size=\"14\" value=\"$name\"><br>
			        	<font class=\"".$font['normal']."\">"._GALDATEADDED."<br></font>
					<input type=\"text\" name=\"Date$i\" size=\"14\" value=\"$date\"><br>
			        	<font class=\"".$font['normal']."\">"._GALSUBMITTER."</font><br>
					<input type=\"text\" name=\"Submitter$i\" size=\"14\" value=\"$submitter\"><br>
		                	<font class=\"".$font['normal']."\">
			    		"._GALHITS." $counter<br>
			    		"._GALVOTES." $votes<br>
			    		"._GALRATING." $rate</font>
				</td>
				<td align=\"left\" valign=\"top\">
					<font class=\"".$font['normal']."\">"._GALDESCRIPTION."</font><br>
			        	<textarea  name=\"Description$i\" rows=\"10\" cols=\"25\">$description</textarea>
				</td>
			</tr>
		        </table>";
			CloseTable();
			echo "
			</td>
		</tr>";
		$i++;
		} //while
		echo "</table>
		<p align=\"center\"><input type=\"submit\" value=\""._SAVECHANGES."\" name=\"add\"></p>
		</form>";
	}
	else
		echo "<br><font class=\"".$font['normal']."\">No Media Found</font><br>";
	CloseTable();
	print '<br>';
	adminFooter();
}
?>
