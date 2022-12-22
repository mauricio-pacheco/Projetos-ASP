<?
function editmediatypes() {
  global $prefix, $db, $adminurl, $font;

	galleryHeader();
  	navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; "._GALEDITMEDIATYPE."</font>");
	print '<br>';
	OpenTable();

  echo "<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">
	<tr><td>";
/////
print '<br>
      <p align="center">
      <font class="'.$font['normal'].'">
      '._GALMEDIATYPEDESC.'
      </font>
      </p>
      </td></tr></table>';
      CloseTable();
      print '<br>';

      print OpenTable().'<table border="0" cellpadding="10" cellspacing="0" width="100%"><tr><td align="center">';
      print '
      <p><font class="'.$font['normal'].'">'._GALMEDIAADDTYPE.'</font></p>
	  <table border="0" cellpadding="10" cellspacing="0" width="100%">
	  <form method="POST" action="'.$adminurl.'">
	  <input type="hidden" name="do" value="editmediatypes">
	  <input type="hidden" name="type" value="new">
          <tr>
		<td valign="top">
		<font class="title">'._GALMEDIACLASSTYPE.'</font><br>
		<select name="class">';
		$res = $db->sql_query("SELECT * FROM $prefix"._gallery_media_class."");
		while (list($id, $class) = $db->sql_fetchrow($res)) {
			print "<option value=\"$id\">$class</option>";
		}
		print '</select>
	    	</td>

          	<td valign="top"><font class="title">
		  '._GALMEDIADESCTYPE.'</font><br>
		  <input type="text" name="description" size="15" value="">
		</td>
          	<td valign="top" >
		  <font class="title">'._GALMEDIAEXTENSION.'</font><br>
		  <input type="text" name="extension" size="5" value="">
		</td>
          	<td valign="top" >
		  <font class="title">'._GALMEDIATHUMB.'</font><br>
		  <input type="text" name="thumbnail" size="15" value="">
		</td>

	</tr>
	<tr>
          	<td colspan="4" align="center" valign="top">
          	  <font class="title">'._GALMEDIATAG.'</font><br>
          	  <textarea  name="code" rows="10" cols="60"></textarea>
          	</td>
        </tr>
        <tr>
	  	<td Align="center" colspan="4">
		  <input type="submit" value="'._NEW.'" name="create">
	  	</td>
        </tr>
        </form>
      </table>';
      print '</td><tr></table>'.CloseTable().'<br>';


$sql = "SELECT * FROM $prefix"._gallery_media_types." ORDER BY filetype, description";
$result = $db->sql_query($sql);

      print OpenTable().'<table border="0" cellpadding="10" cellspacing="0" width="100%"><tr><td align="center">';
      print '
       <p><font class="title">'._GALEDITMEDIATYPES.'</font></p>

      <table border="0" cellpadding="5" cellspacing="0" width="100%">';
	while ($row = $db->sql_fetchrow($result)) {
		print '
			  <form method="POST" action="'.$adminurl.'">
			  <input type="hidden" name="do" value="editmediatypes">
			  <input type="hidden" name="type" value="edit">
			  <input type="hidden" name="oldext" value="'.$row[extension].'">

		        <tr>
				<td valign="top">
				<font class="title">'._GALMEDIACLASSTYPE.'</font><br>
				<select name="class">';
				$res = $db->sql_query("SELECT * FROM $prefix"._gallery_media_class."");
				$sel_filetype[$row[filetype]] = ' selected';
				while (list($id, $class) = $db->sql_fetchrow($res)) {
					print "<option value=\"$id\"$sel_filetype[$id]>$class</option>";
				}
				print '</select>
			    	</td>

		          	<td valign="top"><font face="Verdana,Arial">
				  <font class="title">'._GALMEDIADESCTYPE.'</font><br>
				  <input type="text" name="description" size="15" value="'.$row[description].'">
				</td>
		          	<td valign="top" >
				  <font class="title">'._GALMEDIAEXTENSION.'</font><br>
				  <input type="text" name="extension" size="5" value="'.$row[extension].'">
				</td>
		          	<td valign="top" >
				  <font class="title">'._GALMEDIATHUMB.'</font><br>
				  <input type="text" name="thumbnail" size="15" value="'.$row[thumbnail].'">
				</td>

			</tr>
			<tr>
		          	<td colspan="4" align="center" valign="top">
		          	  <font class="title">'._GALMEDIATAG.'</font><br>
		          	  <textarea  name="code" rows="10" cols="60">'.$row[displaytag].'</textarea>
		          	</td>
		        </tr>
		        <tr>
			  	<td Align="center" colspan="4">
				  <input type="submit" value="'._SAVE.'" name="save">&nbsp;&nbsp;
				  <input type="submit" value="'._DELETE.'" name="delete">
				  <br><hr><br>
			  	</td>
		        </tr>
		        </form>';
	}

	print '</table>';
       print '</td><tr></table>'.CloseTable().'<br>';
	print '<br>';
	adminFooter();
}
?>
