<?php

function search_form($vars) {
	global $baseurl, $bgcolor1, $bgcolor2;

        if(!$vars[bool]) { $vars[bool] = 'AND'; }
	$q = $vars[q];

	$bool_select[$vars[bool]] = ' selected';
        $out = "<table width=\"100%\" border=\"0\" cellpadding=\"5\" cellspacing=\"1\" bgcolor=\"$bgcolor2\"><tr><td align=\"center\">\n";
	$out .= '<p align="center">'
		.'<form action="'.$baseurl.'" method="post">'
		.'<input type="hidden" name="do" value="search">'
		.'<input type="hidden" name="search_picname" value="1">'
		.'<input type="hidden" name="search_picdesc" value="1">'
		.'<input type="hidden" name="search_catname" value="0">'
		.'<input type="hidden" name="search_catdesc" value="0">'
		.'<table border="0" cellpadding="2" cellspacing="0" summary="Search form to help in locating the items you are looking for.">'
		// query
		.'<tr>'
		.'<td nowrap><font size="2"><b><label for="q">'._SEARCH.'</label>:</b></font></td>'
		.'<td colspan="2" align="left"><font size="2">'
		.'<input type="text" name="q" id="q" size="20" maxlength="255" value="'.$q.'"> '
		.'<input type="submit" value="'._SEARCH.'">'
		.'</font></td>'
		.'</tr>'
		// bool
		.'<tr>'
		.'<td>&nbsp;</td>'
		.'<td colspan="2" align="left"><font size="2">'
		.'<select name="bool" size="1">'
		."<option value='AND'$bool_select[AND]>"._GALALLWORDSAND."</option>"
		."<option value='OR'$bool_select[OR]>"._GALALLWORDSOR."</option>"
		.'</select>'
		.'</font></td>'
		.'</tr>'
		.'</table>'
		.'</form>'
               .'</p></td></tr></table>';

        return $out;
}

function search_split_query($q) {
	$w = array();
	$qwords = explode(' ', $q);
	if(phpversion() >= '4.0.0') { // php4
		foreach($qwords as $word) {
			$w[] = "%$word%";
		}
	}
	else { // php3
		while(list($word) = each($qwords)) {
			$w[] = "%$word%";
		}
	}
	return $w;
}

function search_go($vars) {
	global
		$baseurl,
		$gallerypath,
		$user,
		$admin,
		$prefix, $db
	;
	$navgall = navigationGall();
	$w = search_split_query($vars[q]);
	$flag = false;

	if (is_admin($admin))
		$query = "SELECT p.*, c.gallname, c.description AS galldesc, c.galloc, c.numcol, c.thumbwidth, t.templateCategory, t.templateCSS, UNIX_TIMESTAMP(p.date) AS unix_date, (TO_DAYS(NOW()) - TO_DAYS(p.date)) AS new_day, f.displaytag, f.thumbnail, f.filetype, f.description AS description_media FROM $prefix"._gallery_pictures." AS p LEFT JOIN $prefix"._gallery_categories." AS c ON c.gallid=p.gid LEFT JOIN $prefix"._gallery_template_types." AS t ON t.id=c.template LEFT JOIN $prefix"._gallery_media_types." AS f ON f.extension=p.extension WHERE c.visible>=0 AND ";
	elseif (is_user($user))
		$query = "SELECT p.*, c.gallname, c.description AS galldesc, c.galloc, c.numcol, c.thumbwidth, t.templateCategory, t.templateCSS, UNIX_TIMESTAMP(p.date) AS unix_date, (TO_DAYS(NOW()) - TO_DAYS(p.date)) AS new_day, f.displaytag, f.thumbnail, f.filetype, f.description AS description_media FROM $prefix"._gallery_pictures." AS p LEFT JOIN $prefix"._gallery_categories." AS c ON c.gallid=p.gid LEFT JOIN $prefix"._gallery_template_types." AS t ON t.id=c.template LEFT JOIN $prefix"._gallery_media_types." AS f ON f.extension=p.extension WHERE c.visible>=1 AND ";
	else
		$query = "SELECT p.*, c.gallname, c.description AS galldesc, c.galloc, c.numcol, c.thumbwidth, t.templateCategory, t.templateCSS, UNIX_TIMESTAMP(p.date) AS unix_date, (TO_DAYS(NOW()) - TO_DAYS(p.date)) AS new_day, f.displaytag, f.thumbnail, f.filetype, f.description AS description_media FROM $prefix"._gallery_pictures." AS p LEFT JOIN $prefix"._gallery_categories." AS c ON c.gallid=p.gid LEFT JOIN $prefix"._gallery_template_types." AS t ON t.id=c.template LEFT JOIN $prefix"._gallery_media_types." AS f ON f.extension=p.extension WHERE c.visible>=2 AND ";

	foreach($w as $word) {
		if($flag) {
			switch($vars[bool]) {
				case 'AND' :
					$query .= ' AND ';
					break;
				case 'OR' :
				default :
					$query .= ' OR ';
					break;
			}
		}
		$query .= '(';
		if($vars[search_picname]) {
			$query .= "p.name LIKE '$word' OR ";
		}
		if($vars[search_picdesc]) {
			$query .= "p.description LIKE '$word' OR ";
		}
		if($vars[search_catname]) {
			$query .= "c.gallname LIKE '$word' OR ";
		}
		if($vars[search_catdesc]) {
			$query .= "c.description LIKE '$word' OR ";
		}
		$query .= '0)'; // little bit of filler to reduce code requirements :-)
		$flag = true;
	}
	$query .= ' ORDER BY c.gallname ASC, p.name ASC';
	$result = $db->sql_query($query);
	//print mysql_error()."<br>$query<br>\n";
	$total_rows = $db->sql_numrows($result);
	include 'header.php';
	OpenTable();
	print '<table border="0" width="100%" align="center" cellpadding="0"><tr><td>';
	print '<table border="0" width="100%"><tr><td>'.$navgall.'</td></tr></table>';
	if($total_rows) {
		$col = 1;

		print '<table border="0" width="100%"><tr>';
		while($row = $db->sql_fetchrow($result)) {
			if($row[gid] != $curGal) {
				if($col <= 2) {
					while($col <= 2) {
						print '<td>&nbsp;</td>';
						$col++;
					}
				}
				print "<tr bgcolor=\"$bgcolor2\"><td colspan=\"2\" align=\"center\"><font class=\"content\">".underscoreTospace($row[gallname])."</font></td></tr><tr>\n";
				$curGal = $row[gid];
				$col = 1;
			}
			if($col > 2) {
				print '</tr><tr>';
				$col = 1;
			}
			$template = $row[templateCategory];
			$template = str_replace('<:IMAGE:>', displayPictureGall($row[filetype], $row[gid], $row[pid], $row[thumbwidth], $row[galloc], $row[name], $row[img], convertorderbyout($orderby)), $template);
			// get some image info stuff out of the way here
			//echo $row[extension];
			if($row[filetype] == 1) {
				$row[imginfo] = @getimagesize("$gallerypath/$row[galloc]/$row[img]");
			}
			else {
				$row[imginfo] = false;
				$row[imginfo][0] = $row[width];
				$row[imginfo][1] = $row[height];
				$row[imginfo][2] = $row[description_media];
				$row[imginfo][3] = "width=\"$row[width]\" height=\"$row[height]\"";
			}
			// ok, back to what we were doing
			$val_description = displayDescriptionGall($row, $row);
			$val_rate = displayRateGall($row);
			$val_format = displayFormatGall($row);
			$val_size = displaySizeGall($row, $row);
			$val_nmbComments = displayNumCommentsGall($row);
			$val_new = displayNewGall($row);
			$val_hits = displayHitsGall($row);
			$val_date = displayDateAddedGall($row);
			$val_name = displayName($row);
			$template = str_replace('<:DESCRIPTION:>', $val_description, $template);
			$template = str_replace('<:RATE:>', $val_rate, $template);
			$template = str_replace('<:FORMAT:>', $val_format, $template);
			$template = str_replace('<:SIZE:>', $val_size, $template);
			$template = str_replace('<:NBCOMMENTS:>', $val_nmbComments, $template);
			$template = str_replace('<:NEW:>', $val_new, $template);
			$template = str_replace('<:HITS:>', $val_hits, $template);
			$template = str_replace('<:DATE:>', $val_date, $template);
			$template = str_replace('<:NAME:>', $val_name, $template);
			print "<td>$template</td>\n";
			$col++;
		}
		if($col <= 2) {
			while($col <= 2) {
				print '<td>&nbsp;</td>';
				$col++;
			}
		}
		print '</tr></table>';
	}
	else {
		print '<p align="center">'._GALNOTHINGMATCHSEARCH.'</p>';
	}
	print search_form($vars);
	print '</td></tr></table>';
	CloseTable();
	include 'footer.php';
}


?>
