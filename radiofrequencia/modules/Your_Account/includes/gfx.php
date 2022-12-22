<?php

/********************************************************/
/* CNB Your Account                                     */
/* By: Comunidade PHP Nuke Brasil                       */
/* escudero@phpnuke.org.br                              */
/* http://dev.phpnuke.org.br                            */
/* http://www.phpnuke.org.br                            */
/* Copyright © 2004 by Comunidade PHP Nuke Brasil       */
/* ==================================================== */
/* Based from:                                          */
/* PHP-NUKE: Web Portal System                          */
/********************************************************/

    $dir = "modules/Your_Account/images/bg";
	$d = dir($dir);
	$code_bg = array();
    //$bg_type = 'medium';
	$bg_type = 'small';
	while (false !== ($entry = $d->read())) {
        if (eregi("small-[0-9]\.png", $entry) && $bg_type == 'small') array_push($code_bg, $entry);
        if (eregi("medium-[0-9]\.png", $entry) && $bg_type == 'medium') array_push($code_bg, $entry);
	}
	mt_srand ((double)microtime()*1000000); $i_bg = mt_rand(0, count($code_bg) - 1);
    mt_srand ((double)microtime()*10000); $rand_1 = mt_rand(0, 50);
	mt_srand ((double)microtime()*600000); $rand_2 = mt_rand(0, 2);
	mt_srand ((double)microtime()*1078900); $rand_3 = mt_rand(0, 3);
	mt_srand ((double)microtime()*4560090); $rand_4 = mt_rand(0, 4);
	
	$datekey = date("F j");
    $rcode = hexdec(md5($_SERVER[HTTP_USER_AGENT] . $sitekey . $random_num . $datekey));
    $code = substr($rcode, 2, $ya_config['codesize']);
	$codeimg = "$dir/$code_bg[$i_bg]";
	$imgwhite = ImageCreateFromPNG("$dir/white-$bg_type.png");
	$imgwhite2 = ImageCreateFromPNG("$dir/white-$bg_type.png");
	$image = ImageCreateFromPNG("$dir/white-$bg_type.png");
	//$image = ImageCreateFromPNG("$codeimg");
	
	switch ($bg_type) {
	case 'small':
		$a = 2;
		$b = 3*3.1415/imagesx($imgwhite);
		$c = 2;
		$d = 2*3.1415/imagesx($imgwhite);
		$pror = .7;
		break;
	case 'medium':
		$a = 7;
		$b = (1 + $rand_3) * 3.1415 / imagesx($imgwhite);
		$c = 4;
		$d = (2 + $rand_2) * 3.1415 / imagesx($imgwhite);
		$pror = 1;
		break;
	}
	
	$posx = 2;
	for ($i = 0; $i < strlen($code); $i++) {
		$number = substr($code, $i, 1);
		mt_srand ((double)microtime()*3456090); $rand_ang = mt_rand(-20, 20);
		mt_srand ((double)microtime()*4560790); $rand_y = mt_rand(0, 5);
		mt_srand ((double)microtime()*4554790); $tempx = mt_rand(60, 80);
		mt_srand ((double)microtime()*44790); $tempy = mt_rand(70, 90);
		$xp = $tempx / 100;
		$yp = $tempy / 100;
		$imgtemp = ImageCreateFromPNG("$dir/$number-medium.png");
		imagecopyresampled($imgwhite, $imgtemp, $posx, $rand_y, 0, 0, $pror*$xp*imagesx($imgtemp), $pror*$yp*imagesy($imgtemp), imagesx($imgtemp), imagesy($imgtemp));
		$posx += $pror*$xp*imagesx($imgtemp);
		ImageDestroy($imgtemp);
	}
    mt_srand ((double)microtime()*10030); $rand_l1 = mt_rand(0, imagesx($imgwhite)-1);
	mt_srand ((double)microtime()*600400); $rand_l2 = mt_rand(0, imagesx($imgwhite)-1);
	mt_srand ((double)microtime()*10700); $rand_l3 = mt_rand(0, imagesy($imgwhite)-1);
	mt_srand ((double)microtime()*45690); $rand_l4 = mt_rand(0, imagesy($imgwhite)-1);
	imageline($imgwhite, 0, $rand_l3, imagesx($imgwhite), $rand_l4, 0);
	imageline($imgwhite, $rand_l1, 0, $rand_l2, imagesy($imgwhite), 0);

    Header("Content-type: image/png");

	for ($i = 0; $i < imagesx($imgwhite); $i++) {
		for ($j = 0; $j < imagesy($imgwhite); $j++) {
			$dx = $a * sin($b*$j) * sin($d*$i);
			$dy = $c * sin($d*$i);
			$new_color = imagecolorat($imgwhite, $i + $dx, $j + $dy);
			$color = imagecolorsforindex($imgwhite, $new_color);
			if ($i + $dx > 0 && $i + $dx < imagesx($imgwhite) && $j + $dy > 0 && $j + $dy < imagesy($imgwhite) && imagecolorexact($imgwhite,255,255,255) != $new_color) {
				imagerectangle($imgwhite2, $i, $j, $i, $j, $new_color);
			}
		}
	}
	imagecolortransparent($imgwhite2,imagecolorexact($imgwhite2,255,255,255));
	imagecopymerge($image, $imgwhite2, 0,0,0,0, imagesx($imgwhite2), imagesy($imgwhite2), 100);
	ImagePNG($image, '', 75);
    ImageDestroy($image);
	ImageDestroy($imgwhite);
	ImageDestroy($imgwhite2);
    die();




?>