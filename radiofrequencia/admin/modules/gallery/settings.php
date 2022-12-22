<?php

function Configure() {
	global $prefix, $db, $temppath, $galleryvar, $bgcolor3, $bgcolor4, $textcolor2, $adminpath, $adminurl, $font;

	galleryHeader();
	navigationAdmin("<a class=\"".$font['normal']."\" href=\"$adminurl\">"._GALCONFIG."</a><font class=\"".$font['normal']."\"> &gt; "._GALGENERALSETTINGS.'</font>');

  	echo "<br>";
	$bg = $bgcolor3;
	$fg = $textcolor2;
	// fetch the main page template
	$templateRow = $db->sql_fetchrow($db->sql_query("SELECT templateCategory AS templateMain, templatePictures AS numcol, templateCSS FROM $prefix"._gallery_template_types." WHERE id=1"));

	// now, on with the page
	print   '<!-- Start of Body --><br>'
		.'<form action="admin.php" method="post">'
		.'<input type="hidden" name="op" value="GallAdmin">'
		.'<input type="hidden" name="do" value="ConfigSave">';

	//Save
	OpenTable();
	print "<table width=\"100%\"><tr height=\"60\"><td colspan=\"2\"><br>"
		.'<center><input type="submit" value="'._SAVECHANGES.'"></center><br>'
		.'</td></tr></table>'	;
	CloseTable();
	print '<br>';

	OpenTable();
	print "<table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" width=\"100%\" bgcolor=\"$bgcolor4\">";

	// Default Gallery Icon
	print "<tr height=\"60\" bgcolor=\"$bg\"><td width=\"75%\"><font class=\"".$font['normal']."\">"._GALDEFPICNAME.'</font></td><td>'
		."<input type=\"text\" name=\"xGalleryPictureName\" value=\"".$galleryvar['GalleryPictureName']."\" size=\"15\">"
		.'</td></tr>'
	;

	// Temp Directory Location
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALTEMPPATH.'</font></td><td>'
		."<input type=\"text\" name=\"xtemppath\" value=\"$temppath\" size=\"25\">"
		.'</td></tr>'
	;

	// Display Sub-Gallery Icon
        $displaySubCatIcon = $galleryvar['displaySubCatIcon'];
	$check_displaySubCatIcon[$displaySubCatIcon] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALPICSUBCAT."</font></td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xdisplaySubCatIcon\" value=\"1\"$check_displaySubCatIcon[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xdisplaySubCatIcon\" value=\"0\"$check_displaySubCatIcon[0]>"._NO
		.'</font></td></tr>'
	;

	// Sub-Gallery Icon width
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALSUBCATWIDTH.'</font></td><td>'
		."<input type=\"text\" name=\"xSubCatIconwidth\" value=\"".$galleryvar['SubCatIconwidth']."\" size=\"8\">"
		.'</td></tr>'
	;

	// Thumbnail Icon width
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._THUMBWIDTH.'</font></td><td>'
		."<input type=\"text\" name=\"xThumbWidth\" value=\"".$galleryvar['ThumbWidth']."\" size=\"8\">"
		.'</td></tr>'
	;

	// Main Gallery Description Length (Char)
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._DESCRIPTLEN.'</font></td><td>'
		."<input type=\"text\" name=\"xDescriptLen\" value=\"".$galleryvar['DescriptLen']."\" size=\"8\">"
		.'</td></tr>'
	;

	// SubCat Gallery Description Length (Char)
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._SUBCATLEN.'</font></td><td>'
		."<input type=\"text\" name=\"xSubCatLen\" value=\"".$galleryvar['SubCatLen']."\" size=\"8\">"
		.'</td></tr>'
	;

	// Display Search Form
	$displaySearchForm = $galleryvar['displaySearchForm'];
        $check_displaysearchform[$displaySearchForm] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALDISPLAYSEARCHFORM."</font></td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xdisplaySearchForm\" value=\"1\"$check_displaysearchform[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xdisplaySearchForm\" value=\"0\"$check_displaysearchform[0]>"._NO
		.'</font></td></tr>'
	;

	// Display Top 10
	$displaytop = $galleryvar['displaytop'];
        $check_displaytop[$displaytop] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALDISPLAYTOP."</font></td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xdisplaytop\" value=\"1\"$check_displaytop[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xdisplaytop\" value=\"0\"$check_displaytop[0]>"._NO
		.'</font></td></tr>'
	;

	// Allow Visitors to print Medias
	$allowprint = $galleryvar['allowprint'];
        $check_allowprint[$allowprint] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALALLOWPRINT."</font></td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xallowprint\" value=\"1\"$check_allowprint[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xallowprint\" value=\"0\"$check_allowprint[0]>"._NO
		.'</font></td></tr>'
	;

	print '</table>';
	CloseTable();
                print '<br>';
	OpenTable();
	print "<table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" width=\"100%\" bgcolor=\"$bgcolor4\">";

	// Allow Visitors to download Medias
	$allowdownload = $galleryvar['allowdownload'];
        $check_allowdownload[$allowdownload] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td width=\"75%\"><font class=\"".$font['normal']."\">"._GALALLOWDOWNLOAD."</font></td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xallowdownload\" value=\"1\"$check_allowdownload[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xallowdownload\" value=\"0\"$check_allowdownload[0]>"._NO
		.'</font></td></tr>'
	;

	// Select the Mode of Download (zip ot tar.gz)
	$downloadmode = $galleryvar['downloadmode'];
        $check_downloadmode[$downloadmode] = ' selected';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><br><font class=\"".$font['normal']."\">"._GALDOWNLOADMODE.'</td><td><br>'
		.'<select name="xdownloadmode">'
	;
	print "<option value=\"zip\"$check_downloadmode[zip]>"._GALZIP."</option>\n";
	print "<option value=\"gz\"$check_downloadmode[gz]>"._GALGZ."</option>\n"
		.'</select>'
		.'</td></tr>'
	;

	print '</table>';
	CloseTable();
        print '<br>';
	OpenTable();
	print "<table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" width=\"100%\" bgcolor=\"$bgcolor4\">";

	// Allow Visitors to send Postcards
	$allowpostcard = $galleryvar['allowpostcard'];
        $check_allowpostcard[$allowpostcard] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td width=\"75%\"><font class=\"".$font['normal']."\">"._GALALLOWPOSTCARD."</font></td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xallowpostcard\" value=\"1\"$check_allowpostcard[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xallowpostcard\" value=\"0\"$check_allowpostcard[0]>"._NO
		.'</font></td></tr>'
	;
	// Postcard Script Location
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALPOSCARDLOCATION.'</font></td><td>'
		."<input type=\"text\" name=\"xpostcardpath\" value=\"".$galleryvar['postcardpath']."\" size=\"25\">"
		.'</td></tr>'
	;

	print '</table>';
	CloseTable();
        print '<br>';
	OpenTable();
	print "<table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" width=\"100%\" bgcolor=\"$bgcolor4\">";
	// Maximum Number Of Pictures Per Page
	$maxNumberMedia = $galleryvar['maxNumberMedia'];
        $sel_maxNumberMedia[$maxNumberMedia] = ' selected';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td width=\"75%\"><font class=\"".$font['normal']."\">"._GALNUMBERMEDIA.'</font></td><td>'
		.'<select name="xmaxNumberMedia">'
	;
	for($i=1; $i<=50; $i++) {
		$sel = $sel_maxNumberMedia[$i];
		print "<option value=\"$i\"$sel>$i</option>\n";
	}
	print '</select>'
		.'</td></tr>'
	;
	// Number Of Columns In Main Page
	$numColMain = $galleryvar['numColMain'];
        $sel_numColMain[$numColMain] = ' selected';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALNUMCOLMAIN.'</font></td><td>'
		.'<select name="xnumColMain">'
	;
	for($i=1; $i<=4; $i++) {
		$sel = $sel_numColMain[$i];
		print "<option value=\"$i\"$sel>$i</option>\n";
	}
	print '</select>'
		.'</td></tr>';
	print '</table>';

	CloseTable();

        print '<br>';

	OpenTable();
	print "<table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" width=\"100%\" bgcolor=\"$bgcolor4\">";

	// Display Sort Bar
	$displaysortbar = $galleryvar['displaysortbar'];
        $check_displaysortbar[$displaysortbar] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\">
		<td width=\"75%\"><font class=\"".$font['normal']."\">"._GALDISPLAYSORTBAR."</font></td>
		<td><font class=\"".$font['normal']."\">
		<input type=\"radio\" name=\"xdisplaysortbar\" value=\"1\"$check_displaysortbar[1]>"._YES."&nbsp;
		<input type=\"radio\" name=\"xdisplaysortbar\" value=\"0\"$check_displaysortbar[0]>"._NO."
		</font>
		</td>
	      </tr>"
	;

	// Default Sort
	print '<tr height="60" bgcolor="'.$bg.'">'
		.'<td><font class="'.$font['normal'].'">'._GALDEFAULTSORTMEDIA.'</font></td>'
		.'<td  align="left">'
		.'<select name="xdefaultsortmedia">';
	    $defaultsortmedia = $galleryvar['defaultsortmedia'];
        $sel_SortingMedia[$defaultsortmedia] = ' selected';
	    print "<option value=\"titleA\"$sel_SortingMedia[titleA]>"._GALNAMEAZ."</option>\n";
	    print "<option value=\"titleD\"$sel_SortingMedia[titleD]>"._GALNAMEZA."</option>\n";
	    print "<option value=\"dateA\"$sel_SortingMedia[dateA]>"._GALDATE1."</option>\n";
	    print "<option value=\"dateD\"$sel_SortingMedia[dateD]>"._GALDATE2."</option>\n";
	    print "<option value=\"hitsA\"$sel_SortingMedia[hitsA]>"._GALPOPULARITY1."</option>\n";
	    print "<option value=\"hitsD\"$sel_SortingMedia[hitsD]>"._GALPOPULARITY2."</option>\n";
	    print "<option value=\"ratingA\"$sel_SortingMedia[ratingA]>"._GALRATING1."</option>\n";
	    print "<option value=\"ratingD\"$sel_SortingMedia[ratingD]>"._GALRATING2."</option>\n";
	print '</select>'
	.'</td></tr>';

	print '</table>';
	CloseTable();
    print '<br>';
	OpenTable();
	print "<table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" width=\"100%\" bgcolor=\"$bgcolor4\">";

	// Allow Comments
	$allowcomments = $galleryvar['allowcomments'];
    $check_allowcomments[$allowcomments] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td width=\"75%\"><fontclass=\"".$font['normal']."\">"._GALALLOWCOMMENTS."</td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xallowcomments\" value=\"1\"$check_allowcomments[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xallowcomments\" value=\"0\"$check_allowcomments[0]>"._NO
		.'</font></td></tr>' ;

	// Allow Anon Comments
	$anoncomments = $galleryvar['anoncomments'];
    $check_anoncomments[$anoncomments] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALANONCOMMENTS."</td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xanoncomments\" value=\"1\"$check_anoncomments[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xanoncomments\" value=\"0\"$check_anoncomments[0]>"._NO
		.'</font></td></tr>';


	// Comment Sort Order
	$commentsASC = $galleryvar['commentsASC'];
    $check_commentsASC[$commentsASC] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALSORTASC."</td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xcommentsASC\" value=\"1\"$check_commentsASC[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xcommentsASC\" value=\"0\"$check_commentsASC[0]>"._NO
		.'</font></td></tr>';


	print '</table>';
	CloseTable();
    print '<br>';
	OpenTable();
	print "<table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" width=\"100%\" bgcolor=\"$bgcolor4\">";

	
	

	// Allow Upload
	$allowpostpics = $galleryvar['allowpostpics'];
        $check_allowpostpics[$allowpostpics] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td width=\"75%\"><font class=\"".$font['normal']."\">"._GALALLOWPOSTPICS."</td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xallowpostpics\" value=\"1\"$check_allowpostpics[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xallowpostpics\" value=\"0\"$check_allowpostpics[0]>"._NO
		.'</font></td></tr>'
	;
	// Allow Anon Upload
        $anonpostpics = $galleryvar['anonpostpics'];
	$check_anonpostpics[$anonpostpics] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALANONPOSTPICS."</td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xanonpostpics\" value=\"1\"$check_anonpostpics[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xanonpostpics\" value=\"0\"$check_anonpostpics[0]>"._NO
		.'</font></td></tr>'
	;
	// Limit Upload Size
	$limitSize = $galleryvar['limitSize'];
        $check_limitSize[$limitSize] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALLIMITSIZE."</td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xlimitSize\" value=\"1\"$check_limitSize[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xlimitSize\" value=\"0\"$check_limitSize[0]>"._NO
		.'</font></td></tr>'
	;
	// Maximum Upload Size
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALMAXSIZE.'</font></td><td>'
		."<input type=\"text\" name=\"xmaxSize\" value=\"".$galleryvar['maxSize']."\" size=\"15\"> <br>"
		.'</td></tr>';

	print '</table>';
	CloseTable();
        print '<br>';
	OpenTable();
	print "<table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" width=\"100%\" bgcolor=\"$bgcolor4\">";

        // Allow Rate
	$allowrate = $galleryvar['allowrate'];
        $check_allowrate[$allowrate] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td width=\"75%\"><font class=\"".$font['normal']."\">"._GALALLOWRATE."</td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xallowrate\" value=\"1\"$check_allowrate[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xallowrate\" value=\"0\"$check_allowrate[0]>"._NO
		.'</font></td></tr>';
		
	// Allow Anon Rate
	$anonrate = $galleryvar['anonrate'];
        $check_anonrate[$anonrate] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALANONRATE."</td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xanonrate\" value=\"1\"$check_anonrate[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xanonrate\" value=\"0\"$check_anonrate[0]>"._NO
		.'</font></td></tr>';

	// Sum For Rating
	$sumRate = $galleryvar['SumRate'];
	$check_sumRate[$sumRate] = 'checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._SUMRATE."</td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xSumRate\" value=\"1\"$check_sumRate[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xSumRate\" value=\"0\"$check_sumRate[0]>"._NO
		.'</font></td></tr>';

	// Use Cookies For Rating
	$setRateCookies = $galleryvar['setRateCookies'];
	$check_setRateCookies[$setRateCookies] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALSETRATECOOKIES."</td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xsetRateCookies\" value=\"1\"$check_setRateCookies[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xsetRateCookies\" value=\"0\"$check_setRateCookies[0]>"._NO
		.'</font></td></tr>';

	// Flood time interval 
	$floodtime = $galleryvar['floodtime'];
        $check_floodtime[$floodtime] = ' checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._FLOODTIME.'</font></td><td>'
		."<input type=\"text\" name=\"xfloodtime\" value=\"".$galleryvar['floodtime']."\" size=\"15\"> <br>"
		.'</td></tr>';

	print '</table>';
	CloseTable();
        print '<br>';
	OpenTable();
	print "<table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" width=\"100%\" bgcolor=\"$bgcolor4\">";

	// Image Conversion System
	$imageSoftware = $galleryvar['imageSoftware'];
        $sel_imageSoftware[$imageSoftware] = ' selected';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td  rowspan=\"2\" width=\"75%\"><br><font class=\"".$font['normal']."\">"._GALIMAGESOFTWARE.'</td><td><br>'
		.'<select name="ximageSoftware">'
		."<option value=\"none\"$sel_imageSoftware[none]>"._GALNONEIMAGESOFTWARE."</option>\n"
	;
	print "<option value=\"browser\"$sel_imageSoftware[browser]>"._GALBROWSERIMAGESOFTWARE."</option>\n";
	print "<option value=\"NetPBM\"$sel_imageSoftware[NetPBM]>"._GALNETPBMIMAGESOFTWARE."</option>\n";
	if( extension_loaded("gd") ) {
		print "<option value=\"GD\"$sel_imageSoftware[GD]>"._GALGDIMAGESOFTWARE."</option>\n";
	}
	print "<option value=\"ImageMagick\"$sel_imageSoftware[ImageMagick]>ImageMagick</option>\n"
		.'</select>'
		.'</td></tr>';
	
	//Make Image to Check GD Version
	print "<tr bgcolor=\"$bg\"><td align=\"center\" valign=\"middle\">";
	if( extension_loaded("gd") ) {
	    print '<img src="modules.php?op=modload&name=My_eGallery&file=gd" alt="GD Version">';
	} else {
	    print '<font color="red">Your system not support GD Library</font>';
	}
	print '</td></tr>';


	// GDVersion 2.x
	$GDVersion2= $galleryvar['GDVersion2'];
	$check_GDVersion2[$GDVersion2] = 'checked';
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GDVersion2."</td><td><font class=\"".$font['normal']."\">"
		."<input type=\"radio\" name=\"xGDVersion2\" value=\"1\"$check_GDVersion2[1]>"._YES.'&nbsp;'
		."<input type=\"radio\" name=\"xGDVersion2\" value=\"0\"$check_GDVersion2[0]>"._NO
		.'</font></td></tr>';

       	// Image Conversion Path
	print "<tr height=\"60\" bgcolor=\"$bg\"><td><font class=\"".$font['normal']."\">"._GALGDIMAGESOFTWAREPATH.'</font></td><td>'
		."<input type=\"text\" name=\"ximageSoftwarePath\" value=\"".$galleryvar['imageSoftwarePath']."\" size=\"15\"> <br>"
		.'</td></tr>';

	print '</table>';
	CloseTable();
	print '<br>';

	// Save
	OpenTable();
	print "<table width=\"100%\"><tr height=\"60\"><td colspan=\"2\"><br>"
		.'<center><input type="submit" value="'._SAVECHANGES.'"></center><br>'
		.'</td></tr></table>'	;
	CloseTable();
	print '</form>';
	adminFooter();
}

function ConfigSave($vars) {
	global  $prefix, $db, $adminpath, $ModName;

	include "admin/modules/gallery/config.php";

	// first, write the config file
	if(!$fp = fopen("admin/modules/gallery/config.php",w)) {
		print 'Unable to create config file!';
		exit;
	}

	$content = "<?php\n"
	."##################################################################\n"
	."# General Gallery Configuration\n"
	."#\n"
	."# Go to the Admin Panel (General Settings) to modify this File\n"
	."#\n"
	."##################################################################\n\n"
	."\$basepath= \"modules/$ModName\";\n"
	."\$baseurl= \"modules.php?op=modload&name=$ModName&file=index\";\n"
	."\$adminurl= \"admin.php?op=GallAdmin\";\n\n"
	."\$imagepath= \"modules/$ModName/images\";\n"
	."\$gallerypath= \"modules/$ModName/gallery\";\n"
	."\$languagepath= \"modules/$ModName/lang\";\n"
        ."\$temppath= \"$vars[xtemppath]\";\n\n"
	."\$galleryvar['allowcomments']= \"$vars[xallowcomments]\";\n"
	."\$galleryvar['anoncomments']= \"$vars[xanoncomments]\";\n"
	."\$galleryvar['commentsASC']= \"$vars[xcommentsASC]\";\n"
	."\$galleryvar['allowpostpics']= \"$vars[xallowpostpics]\";\n"
	."\$galleryvar['anonpostpics']= \"$vars[xanonpostpics]\";\n"
	."\$galleryvar['allowrate']= \"$vars[xallowrate]\";\n"
	."\$galleryvar['anonrate']= \"$vars[xanonrate]\";\n"
	."\$galleryvar['setRateCookies']= \"$vars[xsetRateCookies]\";\n"
	."\$galleryvar['floodtime']= \"$vars[xfloodtime]\";\n"
	."\$galleryvar['limitSize']= \"$vars[xlimitSize]\";\n"
	."\$galleryvar['maxSize']= \"$vars[xmaxSize]\";\n"
	."\$galleryvar['GalleryPictureName']= \"$vars[xGalleryPictureName]\";\n"
	."\$galleryvar['maxNumberMedia']= \"$vars[xmaxNumberMedia]\";\n"
	."\$galleryvar['displaytop']= \"$vars[xdisplaytop]\";\n"
	."\$galleryvar['displaysortbar']= \"$vars[xdisplaysortbar]\";\n"
	."\$galleryvar['defaultsortmedia']= \"$vars[xdefaultsortmedia]\";\n"
	."\$galleryvar['maintemplate']= \"$vars[xmaintemplate]\";\n"
	."\$galleryvar['numColMain']= \"$vars[xnumColMain]\";\n"
	."\$galleryvar['imageSoftware']= \"$vars[ximageSoftware]\";\n"
        ."\$galleryvar['imageSoftwarePath']= \"$vars[ximageSoftwarePath]\";\n"
	."\$galleryvar['displaySearchForm']= \"$vars[xdisplaySearchForm]\";\n"
	."\$galleryvar['postcardpath']= \"$vars[xpostcardpath]\";\n"
	."\$galleryvar['allowpostcard']= \"$vars[xallowpostcard]\";\n"
	."\$galleryvar['allowdownload']= \"$vars[xallowdownload]\";\n"
	."\$galleryvar['downloadmode']= \"$vars[xdownloadmode]\";\n"
	."\$galleryvar['allowprint']= \"$vars[xallowprint]\";\n"
	."\$galleryvar['displaySubCatIcon']= \"$vars[xdisplaySubCatIcon]\";\n"
	."\$galleryvar['SubCatIconwidth']= \"$vars[xSubCatIconwidth]\";\n"
	."\$galleryvar['ThumbWidth']= \"$vars[xThumbWidth]\";\n"
	."\$galleryvar['DescriptLen']= \"$vars[xDescriptLen]\";\n"
	."\$galleryvar['SubCatLen']= \"$vars[xSubCatLen]\";\n"
	."\$galleryvar['SumRate']= \"$vars[xSumRate]\";\n"
	."\$galleryvar['GDVersion2']= \"$vars[xGDVersion2]\";\n\n"
	.'?>';

	fwrite($fp, $content);
	fclose($fp);
	return;
}

?>
