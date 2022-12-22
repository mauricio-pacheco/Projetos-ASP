<?

function top() {
	global $font, $galleryvar, $baseurl, $bgcolor1, $bgcolor2, $user, $prefix, $db, $name, $adminpath;

        galleryHeader();
        $result = $db->sql_query("select pid, name, counter, rate, votes, visible from $prefix"._gallery_pictures." p, $prefix"._gallery_categories." c WHERE p.gid=c.gallid AND c.visible>0 order by counter DESC, votes DESC");
        $result1 = $db->sql_query("select pid, name, counter, rate, votes, visible from $prefix"._gallery_pictures." p, $prefix"._gallery_categories." c WHERE p.gid=c.gallid AND c.visible>0 order by votes DESC, rate DESC");

	 if ($galleryvar['allowrate'])
         	$col = 4;
	 else
		$col = 3;
	OpenTable();
         echo "
	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">
          <tr>
             <td>&nbsp;</td>
             <td width=\"70%\" align=\"center\">";
	echo '
	<table width="400" align="center" border="0" cellspacing="0" cellpadding="1" bgcolor="#000000">
	<tr><td>
	<table width="100%" align="center" border="0" cellspacing="0" cellpadding="3" bgcolor="'.$bgcolor1.'">
	<tr>
	  <td colspan="'.$col.'" width="100%" align="center"  bgcolor="'.$bgcolor2.'"><font class="'.$font['title'].'">'._GALTOP10.'<br>'._GALTOP10HITS.'</font></td>
	</tr>
	<tr>
	  <td align="center" colspan="'.$col.'"><br></td>
	</tr>
	<tr>
	  <td align="center"><font class="'.$font['title'].'">'._GALTOPPOS.'</font></td>
	  <td align="center"><font class="'.$font['title'].'">'._GALTOPHITS.'</font></td>';
	if ($allowrate) echo '<td align="center"><font class="'.$font['title'].'">'._GALTOPRATING.'</font></td>';
	  echo '<td align="left"><font class="'.$font['title'].'">'._GALTOPMEDIA.'</font></td>
	</tr>';
	$pos = 1;
        while((list($pid, $name, $counter, $rate, $votes, $visible) = $db->sql_fetchrow($result)) && $pos<=10) {

		echo '
		<tr>
		<td align="center"><font class="'.$font['normal'].'">'.$pos.'</font></td>
		<td align="center"><font class="'.$font['normal'].'">'.$counter.'</font></td>';
		if ($allowrate) echo '<td align="center"><font class="'.$font['normal'].'">'.$rate.'</font></td>';
		if ($visible==1) {
			if (is_user($user))
				echo "<td align=\"left\"><a class=\"".$font['normal']."\" href=\"".$baseurl."&amp;do=showpic&amp;pid=$pid\">$name</a></td>";
			else
				echo "<td align=\"left\"><font class=\"".$font['normal']."\"> $name (*)</font></td";
		}
		else
			echo "<td align=\"left\"><a class=\"".$font['normal']."\" href=\"".$baseurl."&amp;do=showpic&amp;pid=$pid\">$name</a></td>";
		echo "</tr>";
		$pos += 1;
        } // While
        echo "</table></td></tr></table>";
        echo "<br><br>";
	if ($galleryvar['allowrate']) {
// pk
	       	echo '
		<table width="400" align="center" border="0" cellspacing="0" cellpadding="1" bgcolor="#000000">
		<tr><td>
		<table width="100%" align="center" border="0" cellspacing="0" cellpadding="3" bgcolor="'.$bgcolor1.'">
		<tr>
		  <td colspan="4" width="100%" align="center" bgcolor="'.$bgcolor2.'"><font class="'.$font['title'].'">'._GALTOP10.'<br>'._GALTOP10VOTE.'</font></td>
		</tr>
		<tr>
		  <td colspan="4"><br></td>
		</tr>
		<tr>
		  <td align="center"><font class="'.$font['title'].'">'._GALTOPPOS.'</font></td>
		  <td align="center"><font class="'.$font['title'].'">'._GALTOPVOTES.'</font></td>
		  <td align="center"><font class="'.$font['title'].'">'._GALTOPRATING.'</font></td>
		  <td align="left"><font class="'.$font['tilte'].'">'._GALTOPMEDIA.'</font></td>
		</tr>';
		$pos = 1;
	        while((list($pid, $name, $counter, $rate, $votes, $visible) = $db->sql_fetchrow($result1)) && $pos<=10) {
			if ($visible==1) {
				if (is_user($user))
					echo '
					<tr>
					<td align="center"><font class="'.$font['normal'].'">'.$pos.'</font></td>
					<td align="center"><font class="'.$font['normal'].'">'.$votes.'</font></td>
					<td align="center"><font class="'.$font['normal'].'">'.$rate.'</font></td>
					<td align="left"><a class="'.$font['normal'].'" href="'.$baseurl.'&amp;do=showpic&amp;pid='.$pid.'">'.$name.'</a></font></td>
					</tr>';
				else
					echo '
					<tr>
					<td align="center"><font class="'.$font['normal'].'">'.$pos.'</font></td>
					<td align="center"><font class="'.$font['normal'].'">'.$votes.'</font></td>
					<td align="center"><font class="'.$font['normal'].'">'.$rate.'</font></td>
					<td align="left"><font class="'.$font['normal'].'">'.$name.' (*)</font></td>
					</tr>';
			}
			else
				echo '
				<tr>
				<td align="center"><font class="'.$font['normal'].'">'.$pos.'</font></td>
				<td align="center"><font class="'.$font['normal'].'">'.$votes.'</font></td>
				<td align="center"><font class="'.$font['normal'].'">'.$rate.'</font></td>
				<td align="left"><a class="'.$font['normal'].'" href="'.$baseurl.'&amp;do=showpic&amp;pid='.$pid.'">'.$name.'</a></td>
				</tr>';

			$pos += 1;
	        } // While
	        echo "</table>
	 	</td>
		</tr></table>";
		if (!is_user($user))
			print '<br><center><font class="'.$font['tiny'].'"><i>'._GALCATMEMBERS.'</i></font></center>';

        }
	echo "<br></td><td>&nbsp;</td>
        </tr></table>";
	CloseTable();
	galleryFooter();

}

?>
