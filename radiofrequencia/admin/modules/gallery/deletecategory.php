<?php


function rdel($path)
{
    global $prefix, $db, $gallerypath;

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
		    $galloc = substr($rf, strlen("gallerypath/"));
		    list($gallid) = $db->sql_fetchrow($db->sql_query("SELECT gallid FROM $prefix"._gallery_categories." where galloc='$galloc'"));
		    $db->sql_query("DELETE FROM $prefix"._gallery_categories." WHERE gallid=$gallid");
		    $db->sql_query("DELETE FROM $prefix"._gallery_pictures." WHERE gid=$gallid");
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



function deletecategory($gallid) {
	global $prefix, $db, $gallerypath;

	list($galloc, $gallimg) = $db->sql_fetchrow($db->sql_query("SELECT galloc, gallimg FROM $prefix"._gallery_categories." where gallid=$gallid"));
	$basedir = $gallerypath;
	if ($galloc != "")
		rdel($basedir."/".$galloc);
	else
		echo "ERROR : Galloc is Wrong !";

	$db->sql_query("DELETE FROM $prefix"._gallery_categories." WHERE gallid=$gallid");
	$db->sql_query("DELETE FROM $prefix"._gallery_pictures." WHERE gid=$gallid");
	$result = $db->sql_query("SELECT pid FROM $prefix"._gallery_pictures." WHERE gid = $gallid");
	while(list($pid) = $db->sql_fetchrow($result)) {
		$db->sql_query("DELETE FROM gallery_comments WHERE pid=$pid");
	}
}



?>
