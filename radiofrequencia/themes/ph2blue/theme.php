<?php

//*********************************************************************************************************//
// Theme Name: PH2 Blue (Original Theme by: Pitcher.no - http://pitcher.no)              			    	      
// Theme re-Design by: Lorkan (http://lorkan.com)		      
// version 2.0blue                                              
// 
// Lorkan Themes and/or Lorkan is a Registered Organization and holds a copyright with CIPO
// (Canadian Intellectual Property Office)                                                         
// Original Author of file: Lorkan Themes - http://lorkan.com
// Developed by: Lorkan Themes - Simply The Best Themes for Nuke
// Forum Template: Desgined by SubBlue Designs, but ported by: Lorkan Themes for use with PHP-Nuke©
// Copyright © 2004 by Lorkan Themes - All Rights Reserved
// ----------------------------------------------------------------------
// THEME MODIFICATION 
// Users may alter or modify this theme at their own risk,
// but only for their own use. They may also hire Lorkan Themes to modify their own copy of the theme.
// Although users may modify the code for their use,
// modified code may not be resold or distributed,
// without express written permission from Lorkan Themes.
//
// DISPLAY OF COPYRIGHT NOTICES REQUIRED
// All copyright notices used within the scripts that the scripts generate,
// MUST remain intact. Furthermore, these notices must remain visible.
//
// SUPPORT
// Lorkan Themes provide free support on all their theme designs, BUT not on Forum Templates,
// (includes consulting, troubleshooting and fixing problems).
//
// Lorkan Themes is not liable for any products or services offered by means of the theme.
// The user must assume the entire risk of using the program.
//
// Lorkan Themes
// For commercial themes, exclusive themes, visit our Theme Shop http://lorkan.com/modules.php?name=Themes
// For some free themes, visit us at: http://lorkan.com
//*********************************************************************************************************//

/************************************************************/
/* Theme Colors Definition                                  */
/*                                                          */
/* Define colors for your web site. $bgcolor2 is generaly   */
/* used for the tables border as you can see on OpenTable() */
/* function, $bgcolor1 is for the table background and the  */
/* other two bgcolor variables follows the same criteria.   */
/* $texcolor1 and 2 are for tables internal texts           */
/************************************************************/

$bgcolor1 = "#F2F1ED";
$bgcolor2 = "#F2F1ED";
$bgcolor3 = "#F2F1ED";
$bgcolor4 = "#F2F1ED";
$textcolor1 = "#004A9D";
$textcolor2 = "#FFFFFF";

/************************************************************/
/* OpenTable Functions                                      */
/* 									      */
/* Define the tables look&feel for you whole site. For this */
/* we have two options: OpenTable and OpenTable2 functions. */
/* Then we have CloseTable and CloseTable2 function to      */
/* properly close our tables. The difference is that        */
/* OpenTable has a 100% width and OpenTable2 has a width    */
/* according with the table content                         */
/************************************************************/

function OpenTable() {
    global $bgcolor1, $bgcolor2;
echo"<table width=\"100%\" border=\"0\" cellspacing=\"5\" cellpadding=\"0\">"
  . "  <tr>"
  . "    <td bgcolor=\"#0A34AA\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"1\">"
  . "  <tr>"
  . "    <td>"
  . "	<table width=\"100%\" border=\"0\" cellpadding=\"4\" cellspacing=\"0\">"
  . "	<tr><td bgcolor=\"#F2F1ED\">"
 ."";
}

function CloseTable() {
echo"</td>"
  . "        </tr>"
  . "      </table></td></tr></table></td>"
  . "  </tr>"
  . "</table>"
 ."";

}

function OpenTable2() {
    global $bgcolor1, $bgcolor2;
echo"<table width=\"100%\" border=\"0\" cellspacing=\"5\" cellpadding=\"0\">"
  . "  <tr>"
  . "    <td bgcolor=\"#0A34AA\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"1\">"
  . "  <tr>"
  . "    <td>"
  . "	<table width=\"100%\" border=\"0\" cellpadding=\"4\" cellspacing=\"0\">"
  . "	<tr><td bgcolor=\"#F2F1ED\">"
 ."";
}

function CloseTable2() {
echo"</td>"
  . "        </tr>"
  . "      </table></td></tr></table></td>"
  . "  </tr>"
  . "</table>"
 ."";

}

/************************************************************/
/* Function formatstory()                                   */
/*                                                          */
/* This function formats the stories on the Homepage        */
/************************************************************/

function FormatStory($thetext, $notes, $aid, $informant) {
    global $anonymous;
    if ($notes != "") {
	$notes = "<br><br><b>"._NOTE."</b> <i>$notes</i>\n";
   } else {
	$notes = "";
   }
    if ("$aid" == "$informant") {
	echo "<font class=\"content\">$thetext$notes</font>\n";
   } else {
	if($informant != "") {
	    $boxstuff = "<a href=\"modules.php?name=Your_Account&op=userinfo&amp;username=$informant\">$informant</a> ";
   } else {
	    $boxstuff = "$anonymous ";
   }
	$boxstuff .= ""._WRITES.": $thetext $notes\n";
	echo "<font class=\"content\">$boxstuff</font>\n";
   }
   }

/************************************************************/
/* Function themeheader()                                   */
/*                                                          */
/* Control the header for your site. You need to define the */
/* BODY tag and in some part of the code call the blocks    */
/* function for left side with: blocks(left);               */
/************************************************************/

function themeheader() {
    global  $admin, $user, $banners, $sitename, $slogan, $cookie, $prefix, $db, $nukeurl, $anonymous, $name, $index, $blockside;


	/* Check of right block on/off */

	if ($index == 1) {
		$topblock = "<td width=\"194\" height=\"12\"><img src=\"themes/PH2BLUE/images/right_block_top.jpg\"></td>";
	} else {
		$topblock = "<td width=\"194\" height=\"12\" background=\"themes/PH2BLUE/images/middle_block_top.jpg\"></td>";
	}
    if ($banners == 1) {
    $numrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_banner WHERE type='0' AND active='1'"));
   /* Get a random banner if exist any. */
   /* More efficient random stuff, thanks to Cristian Arroyo from http://www.planetalinux.com.ar */

    if ($numrows>1) {
   $numrows = $numrows-1;
   mt_srand((double)microtime()*1000000);
   $bannum = mt_rand(0, $numrows);
    } else {
   $bannum = 0;
    }
    $sql = "SELECT bid, imageurl, clickurl, alttext FROM ".$prefix."_banner WHERE type='0' AND active='1' LIMIT $bannum,1";
    $result = $db->sql_query($sql);
    $row = $db->sql_fetchrow($result);
    $bid = $row[bid];
    $imageurl = $row[imageurl];
    $clickurl = $row[clickurl];
    $alttext = $row[alttext];

    if (!is_admin($admin)) {
       $db->sql_query("UPDATE ".$prefix."_banner SET impmade=impmade+1 WHERE bid='$bid'");
    }
    if($numrows>0) {
   $sql2 = "SELECT cid, imptotal, impmade, clicks, date FROM ".$prefix."_banner WHERE bid='$bid'";
   $result2 = $db->sql_query($sql2);
   $row2 = $db->sql_fetchrow($result2);
   $cid = $row2[cid];
   $imptotal = $row2[imptotal];
   $impmade = $row2[impmade];
   $clicks = $row2[clicks];
   $date = $row2[date];

/* Check if this impression is the last one and print the banner */

   if (($imptotal <= $impmade) AND ($imptotal != 0)) {
       $db->sql_query("UPDATE ".$prefix."_banner SET active='0' WHERE bid='$bid'");
       $sql3 = "SELECT name, contact, email FROM ".$prefix."_bannerclient WHERE cid='$cid'";
       $result3 = $db->sql_query($sql3);
       $row3 = $db->sql_fetchrow($result3);
       $c_name = $row3[name];
       $c_contact = $row3[contact];
       $c_email = $row3[email];
       if ($c_email != "") {
      $from = "$sitename <$adminmail>";
      $to = "$c_contact <$c_email>";
      $message = ""._HELLO." $c_contact:\n\n";
      $message .= ""._THISISAUTOMATED."\n\n";
      $message .= ""._THERESULTS."\n\n";
      $message .= ""._TOTALIMPRESSIONS." $imptotal\n";
      $message .= ""._CLICKSRECEIVED." $clicks\n";
      $message .= ""._IMAGEURL." $imageurl\n";
      $message .= ""._CLICKURL." $clickurl\n";
      $message .= ""._ALTERNATETEXT." $alttext\n\n";
      $message .= ""._HOPEYOULIKED."\n\n";
      $message .= ""._THANKSUPPORT."\n\n";
      $message .= "- $sitename "._TEAM."\n";
      $message .= "$nukeurl";
      $subject = "$sitename: "._BANNERSFINNISHED."";
      mail($to, $subject, $message, "From: $from\nX-Mailer: PHP/" . phpversion());
       }
   }
    $showbanners = "<a href=\"banners.php?op=click&bid=$bid\" target=\"_blank\"><img src=\"$imageurl\" border=\"0\" alt='$alttext' title='$alttext'></a>";
    }
}
    cookiedecode($user);
    $username = $cookie[1];
    if ($username == "") {
        $username = "Anonymous";
    }

    echo "<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" onLoad=\"MM_preloadImages('themes/PH2BLUE/images/header_05_on.jpg','themes/PH2BLUE/images/header_06_on.jpg','themes/PH2BLUE/images/header_07_on.jpg','themes/PH2BLUE/images/header_08_on.jpg','themes/PH2BLUE/images/header_09_on.jpg')\">\n";
    echo'<script src="themes/PH2BLUE/style/grade.js" language="Javascript"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>';


    if ($username == "Anonymous") {
        $theuser = "&nbsp;&nbsp;<a href=\"modules.php?name=Your_Account&op=new_user\">Create an account";
    } else {
        $theuser = "&nbsp;&nbsp;Welcome $username!";
    }
        $public_msg = public_message();
echo"<table align=\"right\" cellspacing=\"0\" cellpadding=\"0\" width=\"120\" border=\"0\">"
  . "<tr><td align=\"center\"><br><br><br><br><br><br><br><br><br><br><br>Banners - Publicidade</td>"
  . "</tr>"
  . "</table>";

echo"<table class=\"bodyline\" align=\"left\" width=\"770\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">"
  . "<tr><td valign=\"top\">"
  . "<table width=\"100%\" height=\"134\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">"
  . "	<tr>"
  . "		<td><embed src=\"cima.swf\" width=\"770\" height=\"136\"></embed></td>"
  . "		<td width=\"100%\" background=\"themes/PH2BLUE/images/spacer_top.jpg\"></td>"
  . "	</tr>"
  . "</table>"
  . "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">"
  . "<tr>"
  . "<td width=\"194\" height=\"12\"><img src=\"themes/PH2BLUE/images/left_block_top.jpg\"></td>"
  . "<td width=\"100%\" height=\"12\" background=\"themes/PH2BLUE/images/middle_block_top.jpg\"></td>"
  . "$topblock"
  . "</tr></table>"
  . ""
  . "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\">"
  . "<tr valign=\"top\">"
  . "<td valign=\"top\" background=\"themes/PH2BLUE/images/block_left.jpg\">";

// Modification to hide left blocks in Forums
blocks(left);


    echo "</td><td align=\"center\" bgcolor=\"#FCFCFC\" valign=\"top\" width=\"100%\">\n";
   }

/************************************************************/
/* Function themefooter()                                   */
/*                                                          */
/* Control the footer for your site. You don't need to      */
/* close BODY and HTML tags at the end. In some part call   */
/* the function for right blocks with: blocks(right);       */
/* Also, $index variable need to be global and is used to   */
/* determine if the page your're viewing is the Homepage or */
/* and internal one.                                        */
/************************************************************/

function themefooter() {
    global $index;
    if ($index == 1) {
echo"</td><td valign=\"top\" width=\"194\" background=\"themes/PH2BLUE/images/block_right.jpg\">";

blocks(right);

	}

echo"</td></table>";
echo"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"AutoNumber1\" height=\"36\" background=\"themes/PH2BLUE/images/bottomline.jpg\">"
  ."<tr>"
  ."<td align=\"center\" width=\"100%\"><div align=\"center\"><font color=\"#ffffff\" size=\"1\" face=\"Verdana, Arial, Helvetica, sans-serif\">Engine by PHP-Nuke - <a href=\"http://phpnuke.org/files/gpl.txt\" target=_blank>GLP License</a> 
               - Desenvolvido por <a href=\"http://www.casadaweb.net\" target=_blank>Casa da Web</a></font></div></td>"
  ."</tr></table>";
}

/************************************************************/
/* Function themeindex()                                    */
/*                                                          */
/* This function format the stories on the Homepage         */
/************************************************************/

function themeindex ($aid, $informant, $time, $title, $counter, $topic, $thetext, $notes, $morelink, $topicname, $topicimage, $topictext) {
    global $anonymous, $tipath;

$ThemeSel = get_theme();
    if (file_exists("themes/$ThemeSel/images/topics/$topicimage")) {
	$t_image = "themes/$ThemeSel/images/topics/$topicimage";
    } else {
	$t_image = "$tipath$topicimage";
}

  echo"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">"
  ."<tr><td><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"1\">"
  ."<td bgcolor=\"#0A34AA\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">"
  ."<tr><td bgcolor=\"#3868D7\" width=\"100%\" height=\"29\" background=\"themes/PH2BLUE/images/newsbar_top.jpg\">&nbsp;"
  ."<font class=\"storytitle\"><b>$title</b></font>"
  ."</td></tr>"
  ."<tr><td bgcolor=\"#F2F1ED\">";

    FormatStory($thetext, $notes, $aid, $informant);


  echo"</td></tr>"
  ."<tr><td bgcolor=\"#F2F1ED\" background=\"themes/PH2BLUE/images/newsbar_bottom.jpg\" align=\"center\">";
  echo"<center><b><font class=\"tiny\">";

   

  echo " $time $timezone </center></td>"
  ."<tr><td bgcolor=\"#F2F1ED\" background=\"themes/PH2BLUE/images/newsbar_bottom.jpg\" align=\"center\">"
  ."<div align=\"right\"><font class=\"content\">$morelink</font></div></td>"
  ."</table></td></tr>"
  ."</table></td></tr>"
  ."</table><br>";

}

/************************************************************/
/* Function themearticle()                                  */
/*                                                          */
/* This function format the stories on the story page, when */
/* you click on that "Read More..." link in the home        */
/************************************************************/

function themearticle ($aid, $informant, $datetime, $title, $thetext, $topic, $topicname, $topicimage, $topictext) {
    global $admin, $sid, $tipath;

$ThemeSel = get_theme();
    if (file_exists("themes/$ThemeSel/images/topics/$topicimage")) {
	$t_image = "themes/$ThemeSel/images/topics/$topicimage";
    } else {
	$t_image = "$tipath$topicimage";
}

   echo"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">"
  ."<tr><td><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"1\">"
  ."<td bgcolor=\"#0A34AA\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">"
  ."<tr><td bgcolor=\"#3868D7\" width=\"100%\" height=\"29\" background=\"themes/PH2BLUE/images/newsbar_top.jpg\">&nbsp;"
  ."<font class=\"storytitle\"><b>$title</b></font>"
  ."</td></tr>"
  ."<tr><td bgcolor=\"#F2F1ED\"><a href=\"modules.php?name=News&new_topic=$topic\"><img src=\"$t_image\" alt=\"$topictext\" border=\"0\" align=\"right\" hspace=\"10\" vspace=\"10\"></a>";

    FormatStory($thetext, $notes, $aid, $informant);


  echo"</td></tr>"

  ."<tr><td bgcolor=\"#F2F1ED\" background=\"themes/PH2BLUE/images/newsbar_bottom.jpg\" align=\"center\">";

  echo"<center><b><font class=\"tiny\">";

  

   echo " $datetime</center>\n"
  ."</td>"
  ."</table></td></tr>"
  ."</table></td></tr>"
  ."</table>";

}


/************************************************************/
/* Function themesidebox()                                  */
/*                                                          */
/* Control look of your blocks. Just simple.                */
/************************************************************/

function themesidebox($title, $content) {
   echo"<table width=\"194\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
  ."<tr><td height=\"20\" background=\"themes/PH2BLUE/images/block_left_header.jpg\">&nbsp;&nbsp;&nbsp;&nbsp;<font class=\"block-title\"><strong>$title</strong></font></td>"
  ."</tr><tr>"
  ."<td height=\"2\"><img src=\"themes/PH2BLUE/images/block_left_shaddow.jpg\"></td></tr>"
  ."<tr><td background=\"themes/PH2BLUE/images/block_left.jpg\">"
  ."<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">"
  ."<tr><td><table align=\"center\" width=\"165\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td height=\"5\"></td></tr><tr><td><font class=\"content\">$content</font>"
  ."</td></tr></table>\n"
  ."<img src=\"themes/images/PH2BLUE/pixel.gif\" width=\"4\" height=\"3\">"
  ."</td></tr></table>"
  ."</td></tr></table>";

}

?>
