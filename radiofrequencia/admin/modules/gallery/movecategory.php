<?

function movecategory($gid) {
	global $prefix, $db, $adminurl, $gallerypath, $font;

  galleryHeader();
  navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; </font><a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=editallcategories\">"._GALEDITALLCATEGORIES."</a><font class=\"".$font['normal']."\"> &gt; "._GALMOVECATEGORY.'</font>');
  print '<br>';
  OpenTable();
  echo "
		<p align=\"center\">
			<form action=\"$adminurl\" method=\"post\">
			<input type=\"hidden\" name=\"do\" value=\"editcategory\">
			<input type=\"hidden\" name=\"type\" value=\"move\">";

			list($cat) = $db->sql_fetchrow($db->sql_query("SELECT gallname FROM $prefix"._gallery_categories." WHERE gallid=$gid"));

			echo "
			<font class=\"pn-pagetitle\">"._GALMOVEOPTION." '$cat'</font><br>
			  <br><font class=\"".$font['title']."\">"._GALMOVEWARNING."</font><br><br><font class=\"".$font['normal']."\">"._GALMOVESELECT."</font>
				<input type=\"hidden\" name=\"oldlocation\" size=\"14\" value=\"$gid\">
			        <select size=\"1\" name=\"newparent\">";

				$categories = listcategories("$gallerypath");
				$categories = explode(" ", trim($categories));
				echo "<option selected value=\"-1\">/</option> ";
				while(list($key, $val) = each($categories)) {
					$result = $db->sql_query("select gallid, gallname, parent from $prefix"._gallery_categories." where gallid=".$val);

					list($gallid, $gallname, $parent) = $db->sql_fetchrow($result);
					$nbtabs = indent($gallid);
					$tab = "";
					for ($i=0; $i<$nbtabs; $i++)
						$tab .= "&nbsp;&nbsp;&nbsp;";
					if ($gallid!=$gid)
						echo "<option value=\"$gallid\">$tab$gallname</option> ";
				}
			        echo "</select><br><br>

			<input type=\"submit\" name=\"confirmed\" value=\""._GALMOVE."\">

		</form>
		</p>";
  CloseTable();
  adminFooter();
}


function copydir($source , $destination){
	global $prefix, $db, $adminurl, $gallerypath;


	$dossier=opendir($source);
	if (!file_exists($destination))
		mkdir($destination, fileperms($source));
	$total = 0;
	while ($file = readdir($dossier)) {
	  	if ($file != "." && $file != ".."){
	  		if (is_dir($source."/".$file)){
	  			$total += copydir("$source/$file", "$destination/$file");
				$newgalloc = substr($destination, strlen("$gallerypath/"));
				$oldgalloc = substr($source, strlen("$gallerypath/"));
				$db->sql_query("UPDATE $prefix"._gallery_categories." SET galloc='$newgalloc/$file' WHERE galloc='$oldgalloc/$file'");
	  		} else {
	  			copy("$source/$file", "$destination/$file");
	  			$total++;
	  		}
	  	}
	}
	return $total;
}



function rmove($source, $destination)
{
	if (copydir($source, $destination))
		rdel($source);
}

function rdel($path) {
    global $prefix, $db, $adminurl, $gallerypath;

    if ($path[strlen($path)-1] != "/")
        $path .= "/";

    if (is_dir($path))
    {
        $d = opendir($path);

        while ($f = readdir($d))
        {
            if ($f != "." && $f != "..")
            {
                $rf = $path . $f;
                if (is_dir($rf)) {
		    $galloc = substr($rf, strlen("$gallerypath/"));
		    list($gallid) = $db->sql_fetchrow($db->sql_query("SELECT gallid FROM $prefix"._gallery_categories." where galloc='$galloc'"));
		    $db->sql_query("DELETE FROM $prefix"._gallery_categories." WHERE gallid=$gallid");
		    $db->sql_query("DELETE FROM $prefix"._gallery_pictures." WHERE gid=$gallid");
	 	    $db->sql_query("DELETE FROM gallery_template WHERE gid=$gallid");
                    rdel($rf);
		}
                else
                    unlink($rf);
            }
        }

        closedir($d);


        return rmdir($path);
    }
}

?>
