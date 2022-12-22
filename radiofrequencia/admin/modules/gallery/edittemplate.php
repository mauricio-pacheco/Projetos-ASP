<?php
function edittemplate($tid) {
	global $prefix, $db, $adminurl, $bgcolor3, $xtype, $font;

	if(isset($tid) && $tid) {
		$trow = $db->sql_fetchrow($db->sql_query("SELECT id, title, type, templateCategory, templatePictures, templateCSS FROM $prefix"._gallery_template_types." WHERE id=$tid"));
		$optype = 'save';
		$navtitle = _GALEDITTEMPLATE." &gt; $trow[title]";
	}
	else {
		$trow = $db->sql_fetchrow($db->sql_query("SELECT id, type, templateCategory, templatePictures, templateCSS FROM $prefix"._gallery_template_types." WHERE id=$xtype"));
		$optype = 'create';
		$navtitle = _GALCREATETEMPLATE;
	}
	$trow[templateCategory] = stripslashes($trow[templateCategory]);
	$trow[templatePictures] = stripslashes($trow[templatePictures]);
	$trow[templateCSS] = stripslashes($trow[templateCSS]);
	if($trow[type] == 1) {
		$cattext = _GALTEMPLMAIN;
		$catdesc = _GALTEMPLMAINDESC;
	}
	else {
		$cattext = _GALTEMPLCAT;
		$catdesc = _GALTEMPLCATDESC;
	}

	// Start Of Output
	galleryHeader();
  	navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; </font><a class=\"".$font['normal']."\" href=\"$adminurl&amp;do=edittemplate\">"._GALEDITALLTEMPLATES."</a><font class=\"".$font['normal']."\"> &gt; $navtitle</font>");
	print '<br>';
	OpenTable();
	print
	"<form method=\"post\" action=\"$adminurl\">"
			.'<input type="hidden" name="do" value="edittemplate">'
			."<input type=\"hidden\" name=\"type\" value=\"$optype\">"
			."<input type=\"hidden\" name=\"xtype\" value=\"$trow[type]\">"
			."<input type=\"hidden\" name=\"templateid\" value=\"$tid\">"
	;
	// Table Header
	print
	'<table border="0" width="100%">'
			.'<tr>'
				.'<td width="50%" valign="top">'
					.'<font class="title">'._GALTEMPLATENAME.'</font><br>'
					.'<table border="0" width="100%">'
						.'<tr><td width="10%">&nbsp;</td>'
							.'<td width="90%"><font class="'.$font['normal'].'">'
								._GALTEMPLATENAMEDESC
							.'</font></td>'
						.'</tr>'
					.'</table>'
				.'</td>'
				.'<td width="50%" valign="middle">'
					."<input type=\"text\" width=\"30\" name=\"xtemplatename\" value=\"$trow[title]\">"
				.'</td>'
			.'</tr>'
	.'</table>'
	;
	// Start Of For Fields
	print
	'<table border="0" width="100%" cellspacing="0" cellpadding="0">'
	;
	// Category Template
	print
	'<tr>'
		."<td bgcolor=\"$bgcolor3\">"
			.'<table border="0" width="100%">'
				.'<tr>'
					.'<td width="50%" valign="top">'
						."<font class=\"".$font['title']."\">$cattext</font><br>"
						.'<table border="0" width="100%">'
							.'<tr><td width="10%">&nbsp;</td>'
								.'<td width="90%">'
									."<font class=\"".$font['normal']."\">$catdesc</font>"
								.'</td>'
							.'</tr>'
						.'</table>'
					.'</td>'
					.'<td width="50%" valign="middle">'
						."<textarea name=\"xtemplateCat\" cols=\"50\" rows=\"30\" wrap=\"soft\">$trow[templateCategory]</textarea>"
					.'</td>'
				.'</tr>'
			.'</table>'
		.'</td>'
	.'</tr>'
	;
	// Pictures Template
	if($trow[type] != 1) {
		print
		'<tr>'
			."<td bgcolor=\"$bgcolor3\">"
				.'<table border="0" width="100%">'
					.'<tr>'
						.'<td width="50%" valign="top">'
							.'<font class="title">'._GALTEMPLPIC.'</font><br>'
							.'<table border="0" width="100%">'
								.'<tr><td width="10%">&nbsp;</td>'
									.'<td width="90%">'
										.'<font class="'.$font['normal'].'">'._GALTEMPLPICDESC.'</font>'
									.'</td>'
								.'</tr>'
							.'</table>'
						.'</td>'
						.'<td width="50%" valign="middle">'
							."<textarea name=\"xtemplatePic\" cols=\"50\" rows=\"30\" wrap=\"soft\">$trow[templatePictures]</textarea>"
						.'</td>'
					.'</tr>'
				.'</table>'
			.'</td>'
		.'</tr>'
		;
	}
	// CSS Template
	print
		'<tr>'
			."<td bgcolor=\"$bgcolor3\">"
				.'<table border="0" width="100%">'
					.'<tr>'
						.'<td width="50%" valign="top">'
							.'<font class="title">'._GALTEMPLCSS.'</font><br>'
							.'<table border="0" width="100%">'
								.'<tr><td width="10%">&nbsp;</td>'
									.'<td width="90%">'
										.'<font class="'.$font['normal'].'">'._GALTEMPLCSSDESC.'</font>'
									.'</td>'
								.'</tr>'
							.'</table>'
						.'</td>'
						.'<td width="50%" valign="middle">'
							."<textarea name=\"xtemplateCSS\" cols=\"50\" rows=\"30\" wrap=\"soft\">$trow[templateCSS]</textarea>"
						.'</td>'
					.'</tr>'
				.'</table>'
			.'</td>'
		.'</tr>'
	;
	// Save / Reset
	print
		'<tr>'
			."<td bgcolor=\"$bgcolor3\">"
				.'<table border="0" width="100%">'
					.'<tr>'
						.'<td width="100%" align="center">'
							.'<input type="submit" name="save" value="'._GALSAVECHANGES.'"> <input type="reset" name="reset" value="Reset">'
						.'</td>'
					.'</tr>'
				.'</table>'
			.'</td>'
		.'</tr>'
	;
	// Copyright
	print  '</table>'

	;
	// End Of Form Fields
	print
	'</form>'
	;
	CloseTable();
	print '<br>';
	adminFooter();
}
?>
