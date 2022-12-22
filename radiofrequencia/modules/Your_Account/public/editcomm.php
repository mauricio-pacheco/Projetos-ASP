<?php

/*********************************************************************************/
/* CNB Your Account: An Advanced User Management System for phpnuke     		*/
/* ============================================                         		*/
/*                                                                      		*/
/* Copyright (c) 2004 by Comunidade PHP Nuke Brasil                     		*/
/* http://dev.phpnuke.org.br & http://www.phpnuke.org.br                		*/
/*                                                                      		*/
/* Contact author: escudero@phpnuke.org.br                              		*/
/* International Support Forum: http://ravenphpscripts.com/forum76.html 		*/
/*                                                                      		*/
/* This program is free software. You can redistribute it and/or modify 		*/
/* it under the terms of the GNU General Public License as published by 		*/
/* the Free Software Foundation; either version 2 of the License.       		*/
/*                                                                      		*/
/*********************************************************************************/
/* CNB Your Account it the official successor of NSN Your Account by Bob Marion	*/
/*********************************************************************************/

if (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) {
    header("Location: ../../../index.php");
    die ();
}
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }

	cookiedecode($user); 
	getusrinfo($user); 
	if ((is_user($user)) AND (strtolower($userinfo[username]) == strtolower($cookie[1])) AND ($userinfo[user_password] == $cookie[2])) {
        include ("header.php");
        title(_COMMENTSCONFIG);
        OpenTable();
        nav();
        CloseTable();
        echo "<br>";
        OpenTable();
        echo "<table cellpadding=\"8\" border=\"0\">";
        echo "<form action=\"modules.php?name=$module_name\" method=\"post\">";
        echo "<tr><td><b>"._DISPLAYMODE."</b>";
        echo "<select name=\"umode\">";
        ?>        <option value="nocomments" <?php if ($userinfo[umode] == 'nocomments') { echo "selected"; } ?>><?php echo _NOCOMMENTS ?>        <option value="nested" <?php if ($userinfo[umode] == 'nested') { echo "selected"; } ?>><?php echo _NESTED ?>        <option value="flat" <?php if ($userinfo[umode] == 'flat') { echo "selected"; } ?>><?php echo _FLAT ?>        <option value="thread" <?php if (!isset($userinfo[umode]) || ($userinfo[umode]=="") || $userinfo[umode]=='thread') { echo "selected"; } ?>><?php echo _THREAD ?>        </select>
        <br><br>
        <b><?php echo _SORTORDER ?></b>
        <select name="uorder">
        <option value="0" <?php if (!$userinfo[uorder]) { echo "selected"; } ?>><?php echo _OLDEST ?>        <option value="1" <?php if ($userinfo[uorder]==1) { echo "selected"; } ?>><?php echo _NEWEST ?>        <option value="2" <?php if ($userinfo[uorder]==2) { echo "selected"; } ?>><?php echo _HIGHEST ?>        </select>
        <br><br>
        <b><?php echo _THRESHOLD ?></b>
        <?php echo _COMMENTSWILLIGNORED ?><br>
        <select name="thold">
        <option value="-1" <?php if ($userinfo[thold]==-1) { echo "selected"; } ?>>-1: <?php echo _UNCUT ?>        <option value="0" <?php if ($userinfo[thold]==0) { echo "selected"; } ?>>0: <?php echo _EVERYTHING ?>        <option value="1" <?php if ($userinfo[thold]==1) { echo "selected"; } ?>>1: <?php echo _FILTERMOSTANON ?>        <option value="2" <?php if ($userinfo[thold]==2) { echo "selected"; } ?>>2: <?php echo _USCORE ?> +2
        <option value="3" <?php if ($userinfo[thold]==3) { echo "selected"; } ?>>3: <?php echo _USCORE ?> +3
        <option value="4" <?php if ($userinfo[thold]==4) { echo "selected"; } ?>>4: <?php echo _USCORE ?> +4
        <option value="5" <?php if ($userinfo[thold]==5) { echo "selected"; } ?>>5: <?php echo _USCORE ?> +5
        </select><br>
        <i><?php echo _SCORENOTE ?></i>
        <br><br>
        <INPUT type="checkbox" name="noscore" <?php if ($userinfo[noscore]==1) { echo "checked"; } ?>><b> <?php echo _NOSCORES ?></b> <?php echo _HIDDESCORES ?>        <br><br>
        <b><?php echo _MAXCOMMENT ?></b> <?php echo _TRUNCATES ?><br>
        <input type="text" name="commentmax" value="<?php echo $userinfo[commentmax] ?>" size=11 maxlength=11> <?php echo _BYTESNOTE ?>        <br><br>
        <input type="hidden" name="username" value="<?php echo"$userinfo[username]"; ?>">
        <input type="hidden" name="user_id" value="<?php echo"$userinfo[user_id]"; ?>">
        <input type="hidden" name="op" value="savecomm">
        <input type="submit" value="<?php echo _SAVECHANGES ?>">
        </td></tr></form></table>
        <?php

/*********************************************************************************/
/* CNB Your Account: An Advanced User Management System for phpnuke     		*/
/* ============================================                         		*/
/*                                                                      		*/
/* Copyright (c) 2004 by Comunidade PHP Nuke Brasil                     		*/
/* http://dev.phpnuke.org.br & http://www.phpnuke.org.br                		*/
/*                                                                      		*/
/* Contact author: escudero@phpnuke.org.br                              		*/
/* International Support Forum: http://ravenphpscripts.com/forum76.html 		*/
/*                                                                      		*/
/* This program is free software. You can redistribute it and/or modify 		*/
/* it under the terms of the GNU General Public License as published by 		*/
/* the Free Software Foundation; either version 2 of the License.       		*/
/*                                                                      		*/
/*********************************************************************************/
/* CNB Your Account it the official successor of NSN Your Account by Bob Marion	*/
/*********************************************************************************/

        CloseTable();
        include ("footer.php");
	} else {
        mmain($user);
	}

?>