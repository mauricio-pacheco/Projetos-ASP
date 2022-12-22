<?php
function editalltemplates() {
global 	$prefix, $db, $adminurl, $bgcolor1, $bgcolor3, $font ;

	galleryHeader();
	print '<br>';
	navigationAdmin("<a class=\"normal\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"normal\"> &gt; "._GALEDITALLTEMPLATES."</font>");
	print '<br>';
	OpenTable();

	echo "
	<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">
	<tr>
		<td bgcolor=\"$bgcolor3\">
	  	<table border=\"0\" bgcolor=\"$bgcolor3\" width=\"100%\">
	  	<tr>

			<td ><font class=\"".$font['normal']."\">"._GALECDTEMPLATESDESC."</font>
			<p></p>

			<form method=\"POST\" action=\"$adminurl\">
			<input type=\"hidden\" name=\"op\" value=\"GallAdmin\">
			<input type=\"hidden\" name=\"do\" value=\"edittemplate\">
			<input type=\"hidden\" name=\"type\" value=\"edit\">
			<hr size=\"1\" color=\"#000000\">

			<p></p>
		  	<table border=\"0\" width=\"100%\" cellpadding=\"1\" cellspacing=\"0\" bgcolor=\"#000000\">
			<tr>
				<td>
				<table border=\"0\" width=\"100%\" cellpadding=\"2\" cellspacing=\"0\" bgcolor=\"$bgcolor1\">
				<tr>
					<td><a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=edittemplate&amp;type=edit&amp;xtype=2\">"._GALCLICK2CREATETEMP."</a></td>
					<td align=\"right\"><a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=edittemplate&amp;type=edit&amp;xtype=1\">"._GALCLICK2CREATETEMPMAIN."</a></td>
				</tr>
				</table>
				</td>
			</tr>
			</table>
			<br>";
	echo "<select name=\"template\">";
	$sel_template[$templateID] = ' selected';
	$tempres = $db->sql_query("SELECT id, title, type FROM $prefix"._gallery_template_types." ORDER BY type, title");
	while($row = $db->sql_fetchrow($tempres)) {
		$sel = $sel_template[$row[id]];
		if($row[type] == 1){$type = '[Main Page]';}else{$type = '[Gallery Pages]';}
		print "<option value=\"$row[id]\"$sel>$type $row[title]</option>\n";
	}
	echo "</select>
	  		<hr size=\"1\" color=\"#000000\">
	  		<input type=\"submit\" name=\"save\" value=\""._GALEDIT."\"> <input type=\"submit\" name=\"delete\" value=\""._GALDELETE."\">
			</form>
	  		</td>
	  	</tr>
	  	</table>
		</td>
	</tr>
	</table>
	";

  CloseTable();
  print '<br>';
	adminFooter();
}

?>
