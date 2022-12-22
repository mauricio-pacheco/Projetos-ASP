<?

function createmedia($pid="") {
	global $prefix, $db, $galleryvar,$bgcolor1, $gallerypath, $adminurl, $font;

	galleryHeader();
	navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; "._GALINSERTNMEDIA."</font>");

  	echo "<br>";
  	OpenTable();
	//Check Gall Main Category
	$categories = listcategories("$gallerypath");
	$categories = explode(" ", trim($categories));
	list($key, $val) = each($categories);
	if (!$val) {
		echo ""._GALCATNOTFOUND."";
		CloseTable();
		print '<br>';
		adminFooter();
		die;
	}


  	echo "<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tr><td>";

	echo "		<form method=\"POST\" action=\"$adminurl\" enctype=\"multipart/form-data\">
			<input type=\"hidden\" name=\"do\" value=\"editmedia\">
			<input type=\"hidden\" name=\"type\" value=\"new\">
			<input type=\"hidden\" name=\"add\" value=\"Insert\">
		</td>
	  <tr>
		<td width=\"100%\" bgcolor=\"$bgcolor1\">
			  <table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" ><tr>
			    <td align=\"left\" valign=\"top\" >
				<font class=\"".$font['title']."\">"._GALSELECTCATEGORY."</font><br>
	            		<select name=\"Category\">";
		 		$categories = listcategories("$gallerypath");
				$categories = explode(" ", trim($categories));

				while(list($key, $val) = each($categories)) {
					if ($val) {
						$result = $db->sql_query("select gallid, gallname, parent from $prefix"._gallery_categories." where gallid=".$val);
						list($gallid, $gallname, $parent) = $db->sql_fetchrow($result);
						$nbtabs = indent($gallid);
						$tab = "";
						for($k=0; $k<$nbtabs; $k++) {
							$tab .= "&nbsp;&nbsp;";
						}
						echo "<option value=\"$gallid\">$tab$gallname</option>\n";
					}

				}
	            	   echo "
				</select><br>
				<font class=\"".$font['title']."\">"._GALMEDIANAME."<br></font>
					<input type=\"text\" name=\"MediaName\" size=\"14\" value=\"\"><br>
			        <font class=\"".$font['title']."\">"._GALFILENAME."</font><br>";
       				if ($galleryvar['limitSize'])
					echo "<INPUT TYPE=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"".$galleryvar['maxSize']."\">";
				echo "
					<input type=\"file\" name=\"userfile\" size=\"14\"><br>
			        <font class=\"".$font['title']."\">"._GALSUBMITTER."</font><br>
					<input type=\"text\" name=\"Submitter\" size=\"14\" value=\"\"><br>
			     </td>
			     <td align=\"left\" valign=\"top\"><font class=\"".$font['title']."\">"._GALDESCRIPTION."</font><br>
		        	<textarea  name=\"Description\" rows=\"9\" cols=\"25\"></textarea>
			     </td></tr>
			<tr><td align=\"center\"><input type=\"submit\" value=\""._GALADDNEWMEDIA."\" name=\"addbtn\"></td></tr>
	          </table>
		      </td>
			  </tr>
		</form>
	  </table>";
	CloseTable();

  	print '<br>';
	adminFooter();
}
?>
