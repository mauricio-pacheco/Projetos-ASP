<?

function editallcategories() {
	global $prefix, $db, $font, $imagepath, $gallerypath, $adminurl, $bgcolor1, $bgcolor2, $bgcolor3;
	
	include("modules/My_eGallery/public/imageFunctions.php");

	galleryHeader();
	print '<br>';
	navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; "._GALEDITALLCATEGORIES."</font>");
	print '<br>';
	OpenTable();
  	echo "<table border=\"0\"  bordercolor=\"$bgcolor2\" cellspacing=\"0\" cellpadding=\"5\" bgcolor=\"$bgcolor3\" width=\"100%\">
  	<tr>
		<td><font class=\"".$font['normal']."\">"._GALECDCATEGORIESDESC."</font>
		<p></p>

		<hr size=\"1\" color=\"#000000\">

		<p></p>
	  	<table border=\"0\" width=\"100%\" cellpadding=\"1\" cellspacing=\"0\" bgcolor=\"#000000\">
		<tr>
			<td>
			<table border=\"0\" width=\"100%\" cellpadding=\"2\" cellspacing=\"0\" bgcolor=\"$bgcolor1\">
			<tr>
				<td>
				<a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=editcategory&amp;parent=-1\">"._GALCLICK2CREATECAT."</a>.
				</td>
			</tr>
			</table>
			</td>
		</tr>
		</table>
		<br>";


	list($numcategories) = $db->sql_fetchrow($db->sql_query("SELECT count(*) from $prefix"._gallery_categories.""));
	if ($numcategories>0)
	{
	$categories = listcategories("$gallerypath");
	$categories = explode(" ", trim($categories));
	$cpt = 0;

	while(list($key, $val) = each($categories)) {
		//echo "*$val*<br>";
		$result = $db->sql_query("select gallid, galloc, gallname, parent, visible, gallimg, thumbwidth from $prefix"._gallery_categories." where gallid=".$val);
		list ($gid, $galloc, $name, $parent, $visible, $gallimg, $thumbwidth) = $db->sql_fetchrow($result);
		//echo "$gid : $galloc : $namle : $parent : $visible<br>";

		$tab = indent($gid)*50;
		list($count) = $db->sql_fetchrow($db->sql_query("SELECT count(*) FROM $prefix"._gallery_pictures." WHERE gid=$gid"));
		//echo "*$count*".mysql_error();
		$gallicons = "$gallerypath/$galloc/$gallimg";
		if(!file_exists($gallicons)) {

		    $dir =opendir("$gallerypath/$galloc");
		    $notfound = 1;
		    $canwrite = is_writeable("$gallerypath/$galloc");
		    while( ($file=readdir($dir)) && ($notfound && $canwrite) ) {
			$file = "$gallerypath/$galloc/$file";
			 if ( $imginfo = @getimagesize($file) ) {
			     $gallicons = RatioResizeIcon("$file", "$gallerypath/$galloc/$gallimg", $gid);
			     $notfound = 0;
			}
		    }
		}
		
		if ( $imginfo = @getimagesize($gallicons) ) {
		    $gallicons="<img src=\"$gallicons\" width=\"80\" border=\"0\">";
		} else {
		    $gallicons = "<font color=\"red\">"._GALICONNOTFOUND."</font>";
		}
		
		echo "
			<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">
			<tr>
				<td>
		  			<img src=\"$imagepath/blank.gif\" height=\"20\" width=\"$tab\">
				</td>
				<td>
		 		<table border=\"0\" cellpadding=\"1\" cellspacing=\"0\" bgcolor=\"#000000\">
  		  		<tr>
		  			<td>
		  			<table border=\"0\" cellpadding=\"2\" cellspacing=\"0\" bgcolor=\"$bgcolor1\">

		  			<tr>
		  				<td>
							<font class=\"".$font['normal']."\">
							<a name=\"cat$gid\"></a> 
							$name	[<a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=editcategory&amp;category=$gid\">"._GALCATEDIT."</a>]
							[<a class=\"".$font['normal']."\"href=\"$adminurl&amp;do=editcategory&type=move&category=$gid\">"._GALCATMOVE."</a>]
							[<a class=\"".$font['normal']."\"href=\"$adminurl&amp;do=editcategory&type=delete&category=$gid\" onClick=\"return confirm('"._GALSURE2DELETECAT."')\">"._GALCATDELETE."</a>]
							[<a class=\"".$font['normal']."\"href=\"$adminurl&amp;do=editcategory&parent=$gid\">"._GALCATCREATESUB."</a>]
							</font>
							<hr color=\"#000000\" height=\"1\">
		    					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">
							<tr>
								<td align=\"left\">
									$gallicons
								</td>
								<td align=\"right\"><font class=\"".$font['normal']."\">
									"._GALCATMEDIACOUNT." $count<br>
									"._GALCATSTATE. "</font> ";
									switch ($visible)
									{
									case 0:
										print "<a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=editcategory&amp;type=status&amp;visible=1&amp;category=$gid\" title=\""._GALVISIBLEADMIN.'">'._GALVISIBLEADMIN."</a>&nbsp;<img src=\"$imagepath/red_dot.gif\" border=\"0\" width=\"11\" height=\"11\" alt=\""._GALVISIBLEADMIN.'">&nbsp;';
										break;
									case 1:
										print "<a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=editcategory&amp;type=status&amp;visible=2&amp;category=$gid\" title=\""._GALVISIBLEMEMBER.'">'._GALVISIBLEMEMBER."</a>&nbsp;<img src=\"$imagepath/yellow_dot.gif\" border=\"0\" width=\"11\" height=\"11\" alt=\""._GALVISIBLEMEMBER.'">&nbsp;';
										break;
									default:
										print "<a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=editcategory&amp;type=status&amp;visible=0&amp;category=$gid\" title=\""._GALVISIBLEPUBLIC.'">'._GALVISIBLEPUBLIC."</a>&nbsp;<img src=\"$imagepath/green_dot.gif\" border=\"0\" width=\"11\" height=\"11\" alt=\""._GALVISIBLEPUBLIC.'">&nbsp;';
										break;
									}
				print "</td>
							</tr>
							</table>
		   				</td>
		   			</tr>
		   			</table>
		  			</td>
		  		</tr>
		  		</table>
				</td>
	        	</tr>
	        	</table>
			<br>";
	}// While
	}
	echo "
	  		<hr size=\"1\" color=\"#000000\">
	  		</td>
	  	</tr>
	  	</table>";
  CloseTable();
  print '<br>';
	adminFooter();

}

?>
