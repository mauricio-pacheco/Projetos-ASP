<?php

function editcategory($gid, $parent) {
  global $prefix, $db, $adminurl, $bgcolor3, $bgcolor4, $font, $galleryvar, $font ;

  galleryHeader();


if (isset($gid) && $gid!="")
  	navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; </font><a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=editallcategories\">"._GALEDITALLCATEGORIES."</a><font class=\"".$font['normal']."\"> &gt; "._GALEDITCATEGORY."</font>");
  else
	navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; </font><a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=editallcategories\">"._GALEDITALLCATEGORIES."</a><font class=\"".$font['normal']."\"> &gt; "._GALCREATECATEGORY."</font>");

  print '<br>';
  OpenTable();
	if (isset($gid) && $gid!="") {
		//$sql = "select gallname, gallimg, galloc,description, parent, visible, template, thumbwidth, numcol from $prefix"._gallery_categories." where gallid=$gid";
		$sql = "select * from $prefix"._gallery_categories." where gallid=$gid";
		//echo $sql;
		$result = $db->sql_query($sql);
		//list ($name, $img, $galloc, $description, $parent, $visible, $templateID, $thumbwidth, $numcol) = $db->sql_fetchrow($result);
		$row = $db->sql_fetchrow($result);
		$db->sql_freeresult($result);
	}

	if (isset($parent) && $parent!="" && $parent!=-1) {
		$sql = "select galloc from $prefix"._gallery_categories." where gallid=$parent";
		//echo $sql;
		$result = $db->sql_query($sql);
		list ($parentloc) = $db->sql_fetchrow($result);
		$db->sql_freeresult($result);
	}

	if (isset($gid) && $gid!="")
		echo "<form method=\"POST\" action=\"$adminurl\">";
	else
		echo "<form method=\"POST\" action=\"$adminurl\"  enctype=\"multipart/form-data\">";
	echo "<input type=\"hidden\" name=\"do\" value=\"editcategory\">";
	if (isset($gid) && $gid!="") {
		echo "<input type=\"hidden\" name=\"type\" value=\"save\">";
	}
	else {
		echo "<input type=\"hidden\" name=\"type\" value=\"create\">";
	}
	echo "
	<input type=\"hidden\" name=\"parent\" value=\"$parent\">
	<input type=\"hidden\" name=\"parentloc\" value=\"$parentloc\">
	<input type=\"hidden\" name=\"category\" value=\"$gid\">";

	echo "
	<table border=\"0\" width=\"100%\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#000000\">
	<tr>
	  <td bgcolor=\"$bgcolor3\" width=\"100%\">
	<!-- Start of Body -->
	  <table border=\"0\" width=\"100%\">
	  <tr>
	    <td width=\"60%\" valign=\"top\">
		<font class=\"".$font['title']."\">"._GALCATAEGOYNAME."</font><br>
		<table border=\"0\" width=\"100%\">
		<tr>
		<td width=\"10%\">&nbsp;</td>
		<td width=\"90%\"><font class=\"".$font['normal']."\">"._GALCATAEGOYNAMEDESC."</font></td>
		</tr>
		</table>
		</td>
		<td width=\"40%\" valign=\"middle\">
		<input type=\"text\" width=\"30\" name=\"categoryname\" value=\"$row[gallname]\">
	    </td>
	  </tr>
	  </table>
	  </td>
	</tr>

	<tr>
	  <td bgcolor=\"$bgcolor4\" width=\"100%\">
	  <table border=\"0\" width=\"100%\">	  <tr>
	    <td width=\"60%\" valign=\"top\">
		<font class=\"".$font['title']."\">"._GALCATLOC."</font><br>
		<table border=\"0\" width=\"100%\">
		<tr>
		<td width=\"10%\">&nbsp;</td>
		<td width=\"90%\"><font class=\"".$font['normal']."\">"._GALCATLOCDESC."</font></td>
		</tr>
		</table>
		</td>
		<td width=\"40%\" valign=\"middle\">";
		if (isset($gid) && $gid!="")
			echo "$row[galloc]";
		else
			echo "
		<input type=\"text\" width=\"30\" name=\"categoryloc\" value=\"$row[galloc]\">";

		//Initial Default Value
		if (!$row[thumbwidth]) { $row[thumbwidth] = $galleryvar['SubCatIconwidth']; }

		echo "
	    </td>
	  </tr>
	  </table>
	  </td>
	</tr>

	<tr>
	<td bgcolor=\"$bgcolor3\">
	  <table border=\"0\" width=\"100%\">
	  <tr>
		<td width=\"60%\" valign=\"top\">
		<font class=\"".$font['title']."\">"._GALCATDESC."</font><br>
		<table border=\"0\" width=\"100%\">
		<tr><td width=\"10%\">&nbsp;</td>
		<td width=\"90%\"><font class=\"".$font['normal']."\">
		"._GALCATDESCDESC."</font>
		</td>
		</tr>
		</table>
		</td>
		<td width=\"40%\" valign=\"middle\">
		<textarea rows=\"8\" name=\"description_cat\" cols=\"30\" wrap=\"virtual\">$row[description]</textarea>
	    </td>
	  </tr>
	  </table>
	</td>
	</tr>

	<tr>
	<td bgcolor=\"$bgcolor4\">
	  <table border=\"0\" width=\"100%\">
	  <tr>
		<td width=\"60%\" valign=\"top\">
		<font class=\"".$font['title']."\">"._GALCATICON."</font><br>
		<table border=\"0\" width=\"100%\">
		<tr><td width=\"10%\">&nbsp;</td>
		<td width=\"90%\"><font class=\"".$font['normal']."\">
		"._GALCATICONDESC."</font>
		</td>
		</tr>
		</table>
		</td>
		<td width=\"40%\" valign=\"middle\">";
		if (isset($gid) && $gid!="")
			echo "<input type=\"text\" width=\"20\" name=\"image\" value=\"$row[gallimg]\">";
		else {
			echo "<INPUT TYPE=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"1000000\">";
			echo "<input type=\"file\" width=\"20\" name=\"userfile\" >";
		}
	
	     //Initial Default Value
	     if (!$row[thumbwidth]) { $row[thumbwidth] = $galleryvar['SubCatIconwidth']; }
	    echo "
	    </td>
	  </tr>
	  </table>
	</td>
	</tr>

	<tr>
	<td bgcolor=\"$bgcolor3\">
	  <table border=\"0\" width=\"100%\">
	  <tr>
		<td width=\"60%\" valign=\"top\">
		<font class=\"".$font['title']."\">"._GALCATTHUMB."</font><br>
		<table border=\"0\" width=\"100%\">
		<tr>
		<td width=\"10%\">&nbsp;</td>
		<td width=\"90%\"><font class=\"".$font['normal']."\">"._GALCATTHUMBDESC."</font></td>
		</tr>
		</table>
		</td>
		<td width=\"40%\" valign=\"middle\">
			<input type=\"text\" width=\"20\" name=\"thumbwidth\" value=\"$row[thumbwidth]\">
	    	</td>
	  </tr>
	  </table>
	</td>
	</tr>

	<tr>
	  <td bgcolor=\"$bgcolor4\" width=\"100%\">
	  <table border=\"0\" width=\"100%\">	  <tr>
	    <td width=\"60%\" valign=\"top\">
		<font class=\"".$font['title']."\">"._GALNUMCOLCAT."</font><br>
		<table border=\"0\" width=\"100%\">
		<tr><td width=\"10%\">&nbsp;</td>
		<td width=\"90%\"><font class=\"".$font['normal']."\">
		"._GALNUMCOLCATDESC."</font>
		</td>
		</tr>
		</table>
		</td>
		<td width=\"40%\" valign=\"middle\">
		<select name=\"numcol\">";

	        //Initial Default Value
		if (!$row[numcol]) { $row[numcol] = $galleryvar['numColMain']; }
		for ($k=1; $k<=4; $k++) {
		   if ($k==$row[numcol])
			echo "<option selected value=\"$k\">$k</option>";
		   else
			echo "<option value=\"$k\">$k</option>";
		}
		echo "
		</select>
	    </td>
	  </tr>
	  </table>
	  </td>
	</tr>\n";
print "<tr>
	<td bgcolor=\"$bgcolor3\">
	  <table border=\"0\" width=\"100%\">
	  <tr>
		<td width=\"60%\" valign=\"top\">
		<font class=\"".$font['title']."\">"._GALCATVISIBLE."</font><br>
		<table border=\"0\" width=\"100%\">
		<tr><td width=\"10%\">&nbsp;</td>
		<td width=\"90%\"><font class=\"".$font['normal']."\">
		"._GALCATVISIBLEDESC."</font>
		</td>
		</tr>
		</table>
		</td>
		<td width=\"40%\" valign=\"middle\">
		<select name=\"visible\">";
                $ind = $row[visible];
                $selected[$ind] = "selected";
                print "<option value=\"0\" $selected[0]>"._GALVISIBLEADMIN."</option>
                <option value=\"1\" $selected[1]>"._GALVISIBLEMEMBER."</option>
                <option value=\"2\" $selected[2]>"._GALVISIBLEPUBLIC."</option>";
		print "
		</select>
	    </td>
	  </tr>
	  </table>
	</td>
	</tr>";
	if (isset($gid) && $gid!="") {
		list($nb) = $db->sql_fetchrow($db->sql_query("SELECT count(*) FROM $prefix"._gallery_pictures." WHERE gid=$gid"));
		list($sub) = $db->sql_fetchrow($db->sql_query("SELECT count(*) FROM $prefix"._gallery_categories." WHERE parent=$gid"));
		echo "
		<tr>
		<td bgcolor=\"$bgcolor4\">
		  <table border=\"0\" width=\"100%\">
		  <tr>
		    <td width=\"60%\" valign=\"top\">
			<font class=\"".$font['title']."\">"._GALCATDETAILS."</font><br>
			<table border=\"0\" width=\"100%\">
			<tr><td width=\"10%\">&nbsp;</td>
			<td width=\"90%\"><font class=\"".$font['normal']."\">
			"._GALCATDETAILSDESC."</font>
			</td>
			</tr>
			</table>
			</td>
			<td width=\"40%\" valign=\"middle\"><font class=\"".$font['normal']."\">
			"._GALCATMEDIACOUNT." $nb<br>
			"._GALSUBCATEGORIES." $sub<br></font>
		    </td>
		  </tr>
		  </table>
		</td>
		</tr>";
	}
	echo "
	<tr>
	<td bgcolor=\"$bgcolor3\" valign=\"center\" align=\"center\">
		<input type=\"submit\" name=\"save\" value=\""._GALSAVECHANGES."\">
	</td>
	</tr>
	</table></form>";
  CloseTable();
  print '<br>';
	adminFooter();
}
?>
