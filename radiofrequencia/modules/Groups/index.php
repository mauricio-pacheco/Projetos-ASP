<?php

/********************************************************/
/* NSN Groups Universal                                 */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$module_name = basename(dirname(__FILE__));
if (!eregi("modules.php", $_SERVER['PHP_SELF'])) { Header("Location: ../../modules.php?name=$module_name"); }

$index = 1;
require_once("mainfile.php");
get_lang($module_name);

switch ($op) {

    default:
        include("header.php");
        title(_GR_PUBLICGROUPS);
        OpenTable();
        echo "<center><table border='0' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2'>\n";
        echo "<tr bgcolor='$bgcolor2'>\n";
        echo "<td align='center' width='200'><b>"._GR_GRPNAME."</b></td>\n";
        echo "<td align='center' width='100'><b>"._GR_NUMUSERS."</b></td>\n";
        echo "<td align='center' width='100'><b>"._GR_LIMIT."</b></td>\n";
        echo "<td align='center' width='100'><b>&nbsp;</b></td>\n";
        echo "</tr>\n";
        $result = $db->sql_query("SELECT gid, gname, glimit FROM ".$prefix."_nsngr_groups WHERE gpublic>'0' ORDER BY gname");
        if ($db->sql_numrows($result) > 0) {
            while(list($gid, $gname, $glimit) = $db->sql_fetchrow($result)) {
                $numusers = $db->sql_numrows($db->sql_query("SELECT `uid` FROM ".$prefix."_nsngr_users WHERE `gid`='$gid'"));
                echo "<tr bgcolor='$bgcolor1' onmouseover='this.style.backgroundColor='$bgcolor2'' onmouseout='this.style.backgroundColor='$bgcolor1''>\n";
                echo "<td align='center'>$gname</td>\n";
                echo "<td align='center'>$numusers</td>\n";
                if ($glimit == 0) {
                $gmlimit = _GR_NOLIMIT;
                } elseif ($glimit <= $numusers) {
                $gmlimit = _GR_FILLED;
                } else {
                $gmlimit = $glimit;
                }
                echo "<td align='center'>$gmlimit</td>\n";
                echo "<td align='center'>\n";
                echo "<a href='modules.php?name=$module_name&amp;op=info&amp;gid=$gid'><img src='modules/$module_name/images/info.png' height='16' width='36' border='0' alt='"._GR_INFO."' title='"._GR_INFO."'></a>\n";
                if (($glimit == 0 OR $numusers < $glimit) AND !in_group($gid)) {
                    echo "<a href='modules.php?name=$module_name&amp;op=join&amp;gid=$gid'><img src='modules/$module_name/images/join.png' height='16' width='36' border='0' alt='"._GR_JOIN."' title='"._GR_JOIN."'></a>\n";
                } else {
                    echo "<img src='modules/$module_name/images/blank.png' height='16' width='36' border='0'>\n";
                }
                echo "</td>\n";
                echo "</tr>\n";
            }
        } else {
            echo "<tr bgcolor='$bgcolor1'><td align='center' colspan='4'>"._GR_NOPUBLICGROUPS."</td></tr>\n";
        }
        echo "</table></center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "info":
        $gid = intval($gid);
        include("header.php");
        title(_GR_GROUPINFO."");
        OpenTable();
        echo "<center><table border='0' cellpadding='2' cellspacing='2' bgcolor='$bgcolor1'>\n";
        $result = $db->sql_query("SELECT gid, gname, gdesc, glimit FROM ".$prefix."_nsngr_groups WHERE gpublic>'0' AND gid='$gid'");
        if ($db->sql_numrows($result) > 0) {
            while(list($gid, $gname, $gdesc, $glimit) = $db->sql_fetchrow($result)) {
                echo "<tr><td bgcolor='$bgcolor2'><b>"._GR_GRPNAME.":</b></td><td>$gname ";
                if (($glimit == 0 OR $glimit <= $numusers) AND !in_group($gid)) {
                    echo "<a href='modules.php?name=$module_name&amp;op=join&amp;gid=$gid'><img src='modules/$module_name/images/join.png' height='16' width='36' border='0' alt='"._GR_JOIN."' title='"._GR_JOIN."'></a>\n";
                } else {
                    echo "<img src='modules/$module_name/images/blank.png' height='16' width='36' border='0'>\n";
                }
                echo "</td></tr>\n";
                $numusers = $db->sql_numrows($db->sql_query("SELECT `uid` FROM ".$prefix."_nsngr_users WHERE `gid`='$gid'"));
                echo "<tr><td bgcolor='$bgcolor2'><b>"._GR_NUMUSERS.":</b></td><td>$numusers</td></tr>\n";
                if ($glimit == 0) {
                $gmlimit = _GR_NOLIMIT;
                } elseif ($glimit <= $numusers) {
                $gmlimit = _GR_FILLED;
                } else {
                $gmlimit = $glimit;
                }
                echo "<tr><td bgcolor='$bgcolor2'><b>"._GR_LIMIT.":</b></td><td>$gmlimit</td></tr>\n";
                echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._GR_DESCRIPTION.":</b></td><td>".nl2br($gdesc)."</td>\n";
                echo "</tr>\n";
            }
        } else {
            echo "<tr bgcolor='$bgcolor1'><td align='center' colspan='2'>"._GR_NOPUBLICGROUP."</td></tr>\n";
        }
        echo "</table></center><br>\n";
        echo "<center>"._GOBACK."</center>\n";
        CloseTable();
        include("footer.php");
    break;

    case "join":
        include("header.php");
        $result = $db->sql_query("SELECT glimit, gpublic FROM ".$prefix."_nsngr_groups WHERE gid='$gid'");
        list($glimit, $gpublic) = $db->sql_fetchrow($result);
        $numusers = $db->sql_numrows($db->sql_query("SELECT uid FROM ".$prefix."_nsngr_users WHERE gid='$gid'"));
        cookiedecode($user);
        $uid = $cookie[0];
        $gid = intval($gid);
        title(_GR_GROUPJOIN);
        OpenTable();
        if (is_ingroup($uid,$gid)) {
            echo "<center><b>"._GR_INGROUP."</b></center><br>\n";
            echo "<center>"._GOBACK."</center>\n";
        } elseif ($gpublic == 0) {
            echo "<center><b>"._GR_NOTPUBLIC."</b></center><br>\n";
            echo "<center>"._GOBACK."</center>\n";
        } elseif ($glimit <= $numusers AND $glimit != 0) {
            echo "<center><b>"._GR_GROUPFILLED."</b></center><br>\n";
            echo "<center>"._GOBACK."</center>\n";
        } else {
            $xdate = time();
            $db->sql_query("INSERT INTO ".$prefix."_nsngr_users (gid, uid, sdate) VALUES ('$gid', '$uid', '$xdate')");
            echo "<center><b>"._GR_ADDGROUP."</b></center><br>\n";
            echo "<center>"._GOBACK."</center>\n";
        }
        CloseTable();
        include("footer.php");
    break;

}

?>
