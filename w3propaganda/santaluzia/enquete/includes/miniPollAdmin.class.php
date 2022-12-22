<?php
class miniPollAdmin {

	var $results_page;
	var $max_questions;
	var $maxpoll;

	function miniPollAdmin() {
		$this->results_page = "adiciona.php"; // name of file where this class is called
		$this->max_questions = 10;
	
	}
	
	function getLastPollId() {
		$sql = @mysql_query ("SELECT MAX(pollid) AS maxpoll FROM galeria_enquete_desc");
		$row = @mysql_fetch_object($sql);
		$this->maxpoll = $row->maxpoll + 1;
		return $this->maxpoll;
	}
	
	function listPolls() {
		$sql = @mysql_query ("SELECT pollid, polltitle, status, timestamp FROM galeria_enquete_desc ORDER BY timestamp DESC");
		echo "<table border=\"0\" bgcolor=\"#E8E8E8\">
		<tr><td><font face=\"verdana, arial\" size=\"1\"><b>ID</b></font></td>
		<td><font face=\"verdana, arial\" size=\"1\">TITULO</font></td>
		<td><font face=\"verdana, arial\" size=\"1\">DATA</font></td>
		<td><font face=\"verdana, arial\" size=\"1\">A&Ccedil;&Atilde;O</font></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td></tr>";
		while ($row = @mysql_fetch_object($sql)) {
			echo "\t<tr><td><font face=\"verdana, arial\" size=\"1\">$row->pollid</font></td>
			<td><font face=\"verdana, arial\" size=\"1\">$row->polltitle</font></td>
			<td><font face=\"verdana, arial\" size=\"1\">$row->timestamp</font></td>
			<td><font face=\"verdana, arial\" size=\"1\">" . strtoupper($row->status) . "</font></td>
			<td><a href=\"$this->results_page?opt=activate&amp;pollid=$row->pollid\"><font face=\"verdana, arial\" size=\"1\">Ativar</font></a></td>
			<td><a href=\"$this->results_page?opt=delete&amp;pollid=$row->pollid\"><font face=\"verdana, arial\" size=\"1\">Apagar</font></a></td></tr>\r\n";
		}
		echo "</table>\r\n";
	}
	
	function newPollForm() {
		echo "<fieldset>
		<legend>Administração enquete</legend>
		<form method=\"get\" name=\"form1\" method=\"post\" action=\"$this->results_page\"><br />\r\n";
		echo "<strong>PERGUNTA:</strong><br><input name=\"pollname\" type=\"text\" id=\"pollname\" class=\"formlook\" /><br />\r\n";
		for ($i = 1; $i <= $this->max_questions; $i ++) { 
		    echo "Resposta $i: <br><input name=\"q[$i]\" type=\"text\" id=\"q[$i]\" class=\"formlook\" /><br />\r\n"; 
		} 
		echo "<input type=\"submit\" name=\"Submit\" value=\"Cadastrar\" class=\"formlook\" /><br />\r\n</form><br />\r\n</fieldset>\r\n";
	}
	
	function createPoll($pollname, $q) {
		$this->getLastPollId();
		$insert_title = @mysql_query ("INSERT INTO galeria_enquete_desc(pollid, polltitle, timestamp) VALUES ('$this->maxpoll', '$pollname', now())");
		for ($i = 1; $i <= count($q); $i ++) {
			$insert_questions = @mysql_query ("INSERT INTO galeria_enquete_data(pollid, polltext, voteid) VALUES ('$this->maxpoll', '$q[$i]', '$i')");
		}
	
	}
	
	function activatePoll($pollid) {
		$deactivate_poll = @mysql_query ("UPDATE galeria_enquete_desc SET status = '' WHERE status = 'active'");
		$activate_poll = @mysql_query ("UPDATE galeria_enquete_desc SET status = 'active' WHERE pollid = '$pollid'");
		if (mysql_affected_rows() > 0) {
			echo "Enquete ativada com sucesso<br />\r\n";
		}
	}
	
	function deletePoll($pollid) {
		$delete_poll = @mysql_query ("DELETE FROM galeria_enquete_desc WHERE pollid = '$pollid'");
		if (mysql_affected_rows() > 0) {
			$delete_poll_questions = @mysql_query ("DELETE FROM galeria_enquete_data WHERE pollid = '$pollid'");
			echo "Enque apagada com sucesso<br />\r\n";
		}
	}

}
?>