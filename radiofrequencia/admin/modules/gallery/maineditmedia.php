<?
function maineditmedia() {
global $prefix, $db, $adminurl, $gallerypath, $font;

  galleryHeader();
  navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; "._GALEDITMEDIA."</font>");
  print '<br>';
  OpenTable();
  echo "
  <!-- Start of Body -->
	<p align=\"center\">
	</p>
	  <p align=\"center\">
		<font class=\"".$font['title']."\">"._GALEDITBYCATEGORYDESC."</font>
		<font class=\"".$font['title']."\"><br>
			[<a href=\"$adminurl&amp;do=editmedia&amp;type=new\">Add Media</a>]
		</font>
	</p>
	<br>"
	. _GALEDITCATEGORIES . "<br>";

	$categories = listcategories("$gallerypath");
	$categories = explode(" ", trim($categories));
	while(list($key, $val) = each($categories)) {
		if ($val) {
			$found=1;
			$result = $db->sql_query("select gallid, gallname, parent from $prefix"._gallery_categories." where gallid=".$val);
			list ($gid, $name, $parent) = $db->sql_fetchrow($result);
			$nbtabs = indent($gid);
			$tab = "";
			for ($i=0; $i<$nbtabs; $i++) {
				$tab .= "&nbsp;&nbsp;&nbsp;";
			}
			echo "$tab<a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=editmedia&amp;type=edit&amp;category=$gid\">$name</a><br>";
		}

	}
	echo "</p>";
	if (!$found) {
		printf(_GALNONEWMEDIAFOUND,""._GALHOME."");
	}
 	CloseTable();
 	print '<br>';
	adminFooter();
}

?>
