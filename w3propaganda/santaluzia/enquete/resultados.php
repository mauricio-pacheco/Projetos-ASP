<?php
error_reporting(E_ALL); 

include_once ("includes/miniPoll.class.php");
include_once ("config.php");

$connection = mysql_connect ($host, $user, $pass) or die ("Unable to connect");
mysql_select_db ($db) or die ("Unable to select database");

?>

<?php echo "<?xml version=\"1.0\" encoding=\"\"?".">"; ?>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=" />
<link href="style/poll.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	background-color: #ffffff;
	margin-left: 2px;
	margin-top: 2px;
	margin-right: 2px;
	margin-bottom: 0px;
}
-->
</style></head>
<body>
<?php

$test = new miniPoll;

if (isset($_GET['poll']) && is_numeric($_GET['pollid'])) {
	$pollid = $_GET['pollid'];

	if (isset($_GET['voteid']) && is_numeric($_GET['voteid'])) {
		$voteid = $_GET['voteid'];
		$test->processPoll($pollid, $voteid);
	}

}
if (isset($_GET['pollid'])) {
	$pollid = $_GET['pollid'];
	$test->pollResults($pollid);
}

@mysql_close($connection);

?>

</body>
</html>