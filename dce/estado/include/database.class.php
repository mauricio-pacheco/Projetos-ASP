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
# Description: connect MySQL database class                             #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#

class database{
	var $dbName;
	var $dbCon;
	var $dbQuery;
	var $dbResult = 0;
	var $dbRow;
	

	/* this function connect to database server and select the database */
	function database($dbHost, $dbUser, $dbPass, $dbName){
		if(!$this->dbCon){
			$this->dbCon = @mysql_connect($dbHost, $dbUser, $dbPass) or die ("Could not connect: " . mysql_error());
			mysql_select_db($dbName, $this->dbCon);
			$this->dbName = $dbName;
		}
	}
	

	/* run SQL query */
	function query($query, $type=0){
		if($type == 0){
			$this->dbQuery = $query;
			$this->dbResult = mysql_query($query);
		}else{
			@mysql_query($query);
		}
		
		//print error message from MySQL server
		if(!$this->dbResult && $type == 0){
			echo @mysql_error() . "<br>" . $query;
			exit();
		}
	}
	
	
	function getTotalRows($query){
		$this->query($query);
		return @mysql_num_rows($this->dbResult);
	}
	
	
	/* get data from database */
	function getRows(){
		if($this->dbRow = @mysql_fetch_array($this->dbResult)){
			return $this->dbRow;
		}else{
			return false;
		}
	}


	function getResult($query){
		$result = mysql_query($query);
		while($row = mysql_fetch_array($result)){
			$data[] = $row;
		}
		if(isset($data)){
			return $data;
		}else{
			return false;
		}
	}
	
	
	function hasResult(){
		if(mysql_num_rows($this->dbResult) > 0){
			return true;
		}else{
			return false;
		}
	}
	
	
	function getInsertId(){
		return mysql_insert_id($this->dbCon);
	}
	
	
	function freeResult(){
		mysql_free_result($this->dbResult);
	}
	
	
	function dbClose(){
		mysql_close($this->dbCon);
	}
}
?>