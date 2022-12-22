<?php

/********************************************************/
/* NSN Groups Universal                                 */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

require_once("mainfile.php");
$module = 1;
$name = trim($name);
if (isset($name)) {
    if (eregi("http\:\/\/", $name)) { die("Hi&nbsp;and&nbsp;Bye"); }
    if (eregi("http\:\/\/", $file)) { die("Hi&nbsp;and&nbsp;Bye"); }
    $modstring = strtolower($_SERVER['QUERY_STRING']);
    if (stripos_clone($modstring,"&user=") AND ($name=="Private_Messages" || $name=="Forums" || $name=="Members_List")) header("Location: index.php");
    global $nukeuser, $db, $prefix;
    $nukeuser = base64_decode($user);
    $nukeuser = addslashes($nukeuser);
    $result = $db->sql_query("SELECT * FROM ".$prefix."_modules WHERE title='$name'");
    $row = $db->sql_fetchrow($result);
    $mod_active = intval($row['active']);
    $view = intval($row['view']);
    $groups = $row['groups'];
    if (($mod_active == 1) OR is_admin($admin)) {
        if (!isset($mop)) { $mop="modload"; }
        if (!isset($file)) { $file="index"; }
        if (ereg("\.\.",$name) || ereg("\.\.",$file) || ereg("\.\.",$mop)) {
            $pagetitle = "- "._SOCOOL;
            include("header.php");
            OpenTable();
            echo "<center><b>"._SOCOOL."</b></center><br>";
            echo "<center>"._GOBACK."</center>";
            CloseTable();
            include("footer.php");
            die();
        } else {
            $ThemeSel = get_theme();
            if (file_exists("themes/$ThemeSel/modules/".$name."/".$file.".php")) {
                $modpath = "themes/$ThemeSel/";
            } else {
                $modpath = "";
            }
            $modpath .= "modules/".$name."/".$file.".php";
            if (file_exists($modpath)) {
                if ($view == 0) {
                    include($modpath);
                } elseif ($view == 1 AND (is_user($user) OR is_group($user, $name) OR is_admin($admin))) {
                    include($modpath);
                } elseif ($view == 2 AND is_admin($admin)) {
                    include($modpath);
                } elseif ($view == 3 AND paid()) {
                    include($modpath);
                } elseif ($view > 3 AND in_groups($groups)) {
                    include($modpath);
                } else {
                    $pagetitle = "- "._RESTRICTEDAREA;
                    include("header.php");
                    OpenTable();
                    echo "<center><b>"._RESTRICTEDAREA."</b></center><br>";
                    echo "<center>"._GOBACK."</center>";
                    CloseTable();
                    include("footer.php");
                    die();
                }
            } else {
                $pagetitle = "- "._FILENOTFOUND;
                include("header.php");
                OpenTable();
                echo "<center><b>"._FILENOTFOUND."</b></center><br>";
                echo "<center>"._GOBACK."</center>";
                CloseTable();
                include("footer.php");
                die ();
            }
        }
    } else {
        $pagetitle = "- "._MODULENOTACTIVE;
        include("header.php");
        OpenTable();
        echo "<center>"._MODULENOTACTIVE."</center><br>";
        echo "<center>"._GOBACK."</center>";
        CloseTable();
        include("footer.php");
        die ();
    }
} else {
    $pagetitle = "- "._MODULENOTFOUND;
    include("header.php");
    OpenTable();
    echo "<center>"._MODULENOTFOUND."</center><br>";
    echo "<center>"._GOBACK."</center>";
    CloseTable();
    include("footer.php");
    die ();
}

?>