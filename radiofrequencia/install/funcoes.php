<?php
/************************************************************************/
/* PHP-NUKE: Advanced Content Management System                         */
/* ============================================                         */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/*                                                                      */
/************************************************************************/

###################################################################################
# Instalador PHP-Nuke v1.4                                                        #
# =============================================================================== #
# Copyright (c) 2004  Aparecido Gomes Lagoeiro ( XNUKE )                          #
# E-Mail: fenix@xnuke.com.br                                                      #
# URL: http://www.xnuke.net                                                    	  #
#                                                                                 #																														#
# Este	programa é freeware. Você pode redistribuí-lo e/ou modificá-lo            #
# sob os termos da licença GNU General Public License, editados na                #
# versão 2 ou posterior pela Free Software Foundation.                            #
###################################################################################
if ( !defined('INSTALL') )
{
	die("Illegal File Access");
}

function get_time() {
	$mtime = microtime();
    $mtime = explode(" ",$mtime);
    $mtime = $mtime[1] + $mtime[0];
   	return($mtime);
}

/*
  Released under the GNU General Public License
*/

  function nuke_db_connect($server, $username, $password, $link = 'db_link') {
    global $$link, $db_error;

    $db_error = false;

    if (!$server) {
      $db_error = _LAN_68;
      return false;
    }

    $$link = @mysql_connect($server, $username, $password) or $db_error = mysql_error();

    return $$link;
  }

  function nuke_db_select_db($database) {
    return mysql_select_db($database);
  }

  function nuke_db_close($link = 'db_link') {
    global $$link;

    return mysql_close($$link);
  }

  function nuke_db_query($query, $link = 'db_link') {
    global $$link;

    return mysql_query($query, $$link);
  }

  function nuke_db_fetch_array($db_query) {
    return mysql_fetch_array($db_query);
  }

  function nuke_db_num_rows($db_query) {
    return mysql_num_rows($db_query);
  }

  function nuke_db_data_seek($db_query, $row_number) {
    return mysql_data_seek($db_query, $row_number);
  }

  function nuke_db_insert_id() {
    return mysql_insert_id();
  }

  function nuke_db_free_result($db_query) {
    return mysql_free_result($db_query);
  }

  function nuke_db_test_create_db_permission($database) {
    global $db_error;

    $db_created = false;
    $db_error = false;

    if (!$database) {
      $db_error = _LAN_69;
      return false;
    }

    if (!$db_error) {
      if (!@nuke_db_select_db($database)) {
        $db_created = true;
        if (!@nuke_db_query('create database ' . $database)) {
          $db_error = mysql_error();
        }
      } else {
        $db_error = mysql_error();
      }
      if (!$db_error) {
        if (@nuke_db_select_db($database)) {
          if (@nuke_db_query('create table temp ( temp_id int(5) )')) {
            if (@nuke_db_query('drop table temp')) {
              if ($db_created) {
                if (@nuke_db_query('drop database ' . $database)) {
                } else {
                  $db_error = mysql_error();
                }
              }
            } else {
              $db_error = mysql_error();
            }
          } else {
            $db_error = mysql_error();
          }
        } else {
          $db_error = mysql_error();
        }
      }
    }

    if ($db_error) {
      return false;
    } else {
      return true;
    }
  }

  function nuke_db_test_connection($database) {
    global $db_error;

    $db_error = false;

    if (!$db_error) {
      if (!@nuke_db_select_db($database)) {
        $db_error = mysql_error();
      } else {
        if (!@nuke_db_query('select count(*) from configuration')) {
          $db_error = mysql_error();
        }
      }
    }

    if ($db_error) {
      return false;
    } else {
      return true;
    }
  }

  function nuke_db_install($database, $sql_file) {
    global $db_error;

    $db_error = false;

    if (!@nuke_db_select_db($database)) {
      if (@nuke_db_query('create database ' . $database)) {
        nuke_db_select_db($database);
      } else {
        $db_error = mysql_error();
      }
    }

    if (!$db_error) {
      if (file_exists($sql_file)) {
        $fd = fopen($sql_file, 'rb');
        $restore_query = fread($fd, filesize($sql_file));
        fclose($fd);
      } else {
        $db_error = _LAN_70 . $sql_file;
        return false;
      }

      $sql_array = array();
//It does not remove! ( bug fix )	  
	  $restore_query = $restore_query . "CREATE TABLE xpk_install (
  											id int(10) NOT NULL auto_increment,
  											PRIMARY KEY  (id)
										) TYPE=MyISAM;
										DROP TABLE IF EXISTS xpk_install;
										DROP TABLE IF EXISTS xpk_install;";
//It does not remove! ( bug fix )										
      $sql_length = strlen($restore_query);
      $pos = strpos($restore_query, ';');
      for ($i=$pos; $i<$sql_length; $i++) {
        if ($restore_query[0] == '#') {
          $restore_query = ltrim(substr($restore_query, strpos($restore_query, "\n")));
          $sql_length = strlen($restore_query);
          $i = strpos($restore_query, ';')-1;
          continue;
        }
        if ($restore_query[($i+1)] == "\n") {
          for ($j=($i+2); $j<$sql_length; $j++) {
            if (trim($restore_query[$j]) != '') {
              $next = substr($restore_query, $j, 6);
              if ($next[0] == '#') {
// find out where the break position is so we can remove this line (#comment line)
                for ($k=$j; $k<$sql_length; $k++) {
                  if ($restore_query[$k] == "\n") break;
                }
                $query = substr($restore_query, 0, $i+1);
                $restore_query = substr($restore_query, $k);
// join the query before the comment appeared, with the rest of the dump
                $restore_query = $query . $restore_query;
                $sql_length = strlen($restore_query);
                $i = strpos($restore_query, ';')-1;
                continue 2;
              }
              break;
            }
          }
          if ($next == '') { // get the last insert query
            $next = 'insert';
          }
          if ( (eregi('create', $next)) || (eregi('insert', $next)) || (eregi('drop t', $next)) ) {
            $next = '';
            $sql_array[] = substr($restore_query, 0, $i);
            $restore_query = ltrim(substr($restore_query, $i+1));
            $sql_length = strlen($restore_query);
            $i = strpos($restore_query, ';')-1;
          }
        }
      }

      for ($i=0; $i<sizeof($sql_array); $i++) {
        nuke_db_query($sql_array[$i]);
      }
    } else {
      return false;
    }
  }
?>

<?php
/*
  Released under the GNU General Public License
*/

  function nuke_in_array($value, $array) {
    if (!$array) $array = array();

    if (function_exists('in_array')) {
      if (is_array($value)) {
        for ($i=0; $i<sizeof($value); $i++) {
          if (in_array($value[$i], $array)) return true;
        }
        return false;
      } else {
        return in_array($value, $array);
      }
    } else {
      reset($array);
      while (list(,$key_value) = each($array)) {
        if (is_array($value)) {
          for ($i=0; $i<sizeof($value); $i++) {
            if ($key_value == $value[$i]) return true;
          }
          return false;
        } else {
          if ($key_value == $value) return true;
        }
      }
    }

    return false;
  }

////
// Sets timeout for the current script.
// Cant be used in safe mode.
  function nuke_set_time_limit($limit) {
    if (!get_cfg_var('safe_mode')) {
      set_time_limit($limit);
    }
  }
	
	function FixQuotes ($what = "") {
    while (eregi("\\\\'", $what)) {
        $what = ereg_replace("\\\\'","\"",$what);
    }
    return $what;
	}
?>