<?php
#-----------------------------------------------------------------------#
# PHP i-Stats: Web Traffic Analysis System                              #
# =========================================                             #
#                                                                       #
# Copyright (c) 2004 by Sam Tang                                        #
# http://www.samphp.com/                                                #
#                                                                       #
# This program is free software. You can redistribute it and/or modify  #
# it under the terms of the GNU General Public License as published by  #
# the Free Software Foundation; either version 2 of the License.        #
#-----------------------------------------------------------------------#
# Description: Upgrade PHP i-Stats from 1.0 and 1.1 to 1.2              #
# Last Update: 20 Dec 2004 20:43                                        #
#-----------------------------------------------------------------------#


require_once('global.php');

//----- start checking version
$field_info = $db->getResult("select * from is_count");

if(isset($field_info[0]['ref_days'])){
	// version 1.1
	$new_ref_time = time() - ($field_info[0]['ref_days'] * 3600 * 24);
	$sql = file_get_contents("sql/SQL_upgrade.sql");
	$sql = str_replace("[new_ref_time]", $new_ref_time, $sql);
	
	$sql = explode(";", $sql);

	for($i=0; $i<sizeof($sql); $i++){
		$sql[$i] = trim($sql[$i]);
		if($sql[$i] != ""){
			$db->query(trim($sql[$i]));
		}
	}
	echo "Upgrade Successful, please upload all new files to your web server.";
}elseif(!isset($field_info[0]['days'])){
	// version 1.0
	$count_days = $db->getResult("select count(*) as total from is_daycount");
	$new_ref_time = time() - ($count_days[0]['total'] * 3600 * 24);
	$sql = file_get_contents("sql/SQL_upgrade2.sql");
	$sql = str_replace("[new_ref_time]", $new_ref_time, $sql);

	$sql = explode(";", $sql);

	for($i=0; $i<sizeof($sql); $i++){
		$sql[$i] = trim($sql[$i]);
		if($sql[$i] != ""){
			$db->query(trim($sql[$i]));
		}
	}
	echo "Upgrade Successful, please upload all new files to your web server.";
}else{
	// version 1.2
	echo "You already upgraded to version 1.2.";
}