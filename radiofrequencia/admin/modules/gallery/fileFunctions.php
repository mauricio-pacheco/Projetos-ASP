<?
// UNITE DE TAILLE DES FICHIER (octets "o", bytes "b")
// (Unit of file size, "o" or "b")

$size_unit="o";

// Police des caractères (letters font)

$font="Verdana";

$max_caracteres = 20;

//-----------------------------------------------------------------------------------------------------------------------------------------
//	FONCTIONS
//-----------------------------------------------------------------------------------------------------------------------------------------

function taille($fichier)
	{
	global $prefix, $db, $size_unit;
	$taille=filesize($fichier);
	if ($taille >= 1073741824) {$taille = round($taille / 1073741824 * 100) / 100 . " G".$size_unit;}
	elseif ($taille >= 1048576) {$taille = round($taille / 1048576 * 100) / 100 . " M".$size_unit;}
	elseif ($taille >= 1024) {$taille = round($taille / 1024 * 100) / 100 . " K".$size_unit;}
	else {$taille = $taille . " ".$size_unit;}
	if($taille==0) {$taille="-";}
	return $taille;
	}

function date_modif($fichier)
	{
	$tmp = filemtime($fichier);
	return date("d/m/Y H:i",$tmp);
	}

function slash()
	{
	global $prefix, $db, $racine;
	if(ereg("\\\\",$racine)){$slash="\\";}
	else {$slash="/";}
	return $slash;
	}



function deldir($location)
	{
	if(is_dir($location))
		{
		$all=opendir($location);
		while ($file=readdir($all))
			{
			if (is_dir($location.slash().$file) && $file <> ".." && $file <> ".")
				{
				deldir($location.slash().$file);
				if(file_exists($location.slash().$file)){rmdir($location.slash().$file); }
				unset($file);
				}
			elseif (!is_dir($location.slash().$file))
				{
				unlink($location.slash().$file);
				unset($file);
				}
			}
		closedir($all);
		rmdir($location);
		}
	else
		{
		unlink($location);
		}
	}

function enlever_controlM($fichier)
	{
	$fic=file($fichier);
	$fp=fopen($fichier,"w");
	while (list ($cle, $val) = each ($fic))
		{
		$val=str_replace(CHR(10),"",$val);
		$val=str_replace(CHR(13),"",$val);
		fputs($fp,"$val\n");
		}
	fclose($fp);
	}

function traite_nom_fichier($nom)
	{
	global $prefix, $db, $max_caracteres;
	$nom=stripslashes($nom);
	$nom=str_replace("'","",$nom);
	$nom=str_replace("\"","",$nom);
	$nom=str_replace("\"","",$nom);
	$nom=str_replace("&","",$nom);
	$nom=str_replace(",","",$nom);
	$nom=str_replace(";","",$nom);
	$nom=str_replace("/","",$nom);
	$nom=str_replace("\\","",$nom);
	$nom=str_replace("`","",$nom);
	$nom=str_replace("<","",$nom);
	$nom=str_replace(">","",$nom);
	$nom=str_replace(" ","_",$nom);
	$nom=str_replace(":","",$nom);
	$nom=str_replace("*","",$nom);
	$nom=str_replace("|","",$nom);
	$nom=str_replace("?","",$nom);
	$nom=str_replace("é","e",$nom);
	$nom=str_replace("è","e",$nom);
	$nom=str_replace("ç","c",$nom);
	$nom=str_replace("@","",$nom);
	$nom=str_replace("â","a",$nom);
	$nom=str_replace("ê","e",$nom);
	$nom=str_replace("î","i",$nom);
	$nom=str_replace("ô","o",$nom);
	$nom=str_replace("û","u",$nom);
	$nom=str_replace("ù","u",$nom);
	$nom=str_replace("à","a",$nom);
	$nom=str_replace("!","",$nom);
	$nom=str_replace("§","",$nom);
	$nom=str_replace("+","",$nom);
	$nom=str_replace("^","",$nom);
	$nom=str_replace("(","",$nom);
	$nom=str_replace(")","",$nom);
	$nom=str_replace("#","",$nom);
	$nom=str_replace("=","",$nom);
	$nom=str_replace("$","",$nom);
	$nom=str_replace("%","",$nom);
	$nom=str_replace("ä","ae",$nom);
 	$nom=str_replace("Ä","Ae",$nom);
 	$nom=str_replace("ö","oe",$nom);
	$nom=str_replace("Ö","Oe",$nom);
	$nom=str_replace("ü","ue",$nom);
	$nom=str_replace("Ü","Ue",$nom);
	$nom=str_replace("ß","ss",$nom);
	if (strlen($nom)> $max_caracteres) {
		 $ext = substr($nom, (strrpos($nom,'.') +  1));
		$nom = substr ($nom,0,$max_caracteres-4);
		$nom = $nom.".".$ext;
	}
 	return $nom;
 	}


//-----------------------------------------------------------------------------------------------------------------------------------------
//	MAIN
//-----------------------------------------------------------------------------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------------------------------------------
//	DEPLACER / MOVE
//-----------------------------------------------------------------------------------------------------------------------------------------

function moveFile($fic, $dest) {
	//$rep=stripslashes($rep);
	$fic=stripslashes($fic);
	$dest=stripslashes($dest);
	if($dest!="") {$destination=$dest.slash();}
	$destination.=basename($fic);
	if(file_exists($fic)) {copy($fic,$destination);}
	if($fic!=$destination) {if(file_exists($fic)) {unlink($fic);}}
	$messtmp= "<font face=\"$font\" size=\"2\">\n";
	$messtmp.= sprintf(_GALFILEMOVED, $fic)." <b>"; $err=0;
	if($dest=="") {$messtmp.= "/";} else {$messtmp.= "$dest";}
	$messtmp.= "</b>\n";
	$messtmp.= "</font>\n";
	if ($err!=0)
		return $messtmp;
	else
		return $err;
}


//-----------------------------------------------------------------------------------------------------------------------------------------
//	SUPPRIMER / DELETE
//-----------------------------------------------------------------------------------------------------------------------------------------

function deleteFile($rep, $fic) {
	$rep=stripslashes($rep);
	$fic=stripslashes($fic);
	$messtmp="<font face=\"$font\" size=\"2\">";
	$a_effacer=$fic;
	if(file_exists($a_effacer))
		{
		if(is_dir($a_effacer)){deldir($a_effacer);$messtmp.=sprintf(_GALFILEDELETED, $fic);}
		else {unlink($a_effacer); $messtmp.=sprintf(_GALFILEDELETED2, $fic);}
		}
	else {$messtmp.=_GALFILEDELETED3;}
	$messtmp.="</font>";
	return $messtmp;
}


//-----------------------------------------------------------------------------------------------------------------------------------------
//	RENOMMER / RENAME
//-----------------------------------------------------------------------------------------------------------------------------------------

function renameFile($fic) {
	$err="";
	$rep=stripslashes($rep);
	$fic=stripslashes($fic);
	$nom_fic=basename($fic);
	$messtmp="<font face=\"$font\" size=\"2\">";
	$fic_new=traite_nom_fichier($fic_new);
	$old=$racine.slash().$fic;
	$new=dirname($old).slash().$fic_new;
	if($fic_new=="")
		{
		$messtmp.= _GALFILERENAMED; $err=1;
		}
	else if(file_exists($new))
		{
		$messtmp.=sprintf(_GALFILERENAMED1, $fic_new); $err=1;
		}
	else
		{
		rename($old,$new);
		$messtmp.=sprintf(_GALFILERENAMED2, $fic, $fic_new);
		}
	$messtmp.="</font>";
	if ($err!=0)
		return $messtmp;
	else
		return "OK";
}


//-----------------------------------------------------------------------------------------------------------------------------------------
//	CREER UN REPERTOIRE / CREATE DIR
//-----------------------------------------------------------------------------------------------------------------------------------------

function makeDir($rep, $nomdir) {
	$rep=stripslashes($rep);
	//$nomdir=traite_nom_fichier($nomdir);

	if($nomdir=="")
		{
		$err=1; return _GALFILECREATED;
		}
	else
	if(file_exists("$rep/$nomdir"))
		{
		 $err=2; return _GALFILECREATED1;
		}
	else
		{
		        umask(000);
			$ret = @mkdir("$rep/$nomdir",0777);
			if ($ret) {
		                $messtmp = sprintf(_GALFILECREATED2, $nomdir);
		                $messtmp.="<b>";
		                if($rep=="") {$messtmp.="/";} else {$messtmp.="$rep";}
		                $messtmp.="</b>";
		                $err=0;
		                return "OK";
                        }
                        else
                        	{ $err=1; return _GALCREATECATERROR;  }
		}

}


//-----------------------------------------------------------------------------------------------------------------------------------------
//	UPLOAD
//-----------------------------------------------------------------------------------------------------------------------------------------


function UploadFile($rep, $userfile, $userfile_name, $userfile_size) {

	$rep=stripslashes($rep);
	if($rep!=""){$rep_source=$rep;}
	$destination=$rep_source;
	if ($userfile_size!=0)
		{$taille_ko=$userfile_size/1024;}
	else
		{$taille_ko=0; $err=1; return _GALUPLOADERROR.""; }

	if ($userfile=="none")
		{$err=2; return _GALUPLOADERROR2;}

	if ($userfile!="none" && $userfile_size!=0) {
		$userfile_name=traite_nom_fichier($userfile_name);
 	  	if (!@move_uploaded_file($userfile, "$destination/$userfile_name"))
			{
	        		$err=3; return _GALUPLOADERROR3;
		        }
	       	else
			{
			@chmod("$destination/$userfile_name",0664);
			$message = sprintf(_GALFILEUPLOADED1, $userfile_name, $rep);
			$err=0; return "OK";
			}
		}

}


?>