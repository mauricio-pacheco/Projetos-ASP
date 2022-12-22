<?php
error_reporting(E_ALL); 

include_once ("includes/miniPoll.class.php");
include_once ("config.php");

$connection = mysql_connect ($host, $user, $pass) or die ("Unable to connect");
mysql_select_db ($db) or die ("Unable to select database");

?>

<link href="style/poll.css" rel="stylesheet" type="text/css" />
<?php

$test = new miniPoll;

$test->pollForm();

@mysql_close($connection);

?>
<style type="text/css">
<!--
body {
	background-color: #ffffff;
	margin-left: 2px;
	margin-top: 2px;
	margin-right: 2px;
	margin-bottom: 2px;
}
-->
</style>