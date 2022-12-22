<script language="JavaScript">
function abre()
{
nj=window.open("","mini","toolbar=no,top=20,scrollbars=no,resizable=no,width=468,height=340");
nj.document.open();
}
</script>
<?php
class miniPoll {

	var $show_vote_count;
	var $active_poll_id;
	var $active_poll_title;
	var $timestamp;
	var $timeout;
	var $ip;
	var $repeated_vote;
	var $results_page;
	var $old_polls;

	function miniPoll() {
		$this->show_vote_count = true; // display total votes? true/false
		$this->pollLayout();
		$this->getActivePoll();
		$this->timestamp = time();
		$this->timeout = $this->timestamp - 1800;
		$this->ip = $_SERVER['REMOTE_ADDR'];
		$this->repeated_vote = "<font color=#0878BA><b>VOCÊ JÁ VOTOU HOJE.</b></font><br />";
		$this->results_page = "resultados.php"; // page where you display results
		$this->old_polls = true; // if true enables view of old polls. this only display old polls it doesn't allow users to vote. true/false
		
	}
	
	function pollLayout() {
		// it allows you to set visual settings using CSS definitions included in file where you're calling this class
		// replace these with your own CSS styles
		$this->form_table_width = "100%";
		$this->form_title = "menuhd";
		$this->form_table = "tabele";
		$this->form_table_cell = "poll";
		$this->form_button = "formlook";
		$this->poll_question = "fat"; // this is for <span> tag
		$this->results_title = "menuhd";
		$this->results_table = "";
		$this->results_poll_question = "fat";
		$this->result_table_width = "100%";
		$this->result_table_cell = "pollbg";
		$this->bar_image = "images/bar.jpg"; // please select 1px width x 15px height image
	}
	
	function getActivePoll() {
		$sql = @mysql_query ("SELECT pollid, polltitle FROM galeria_enquete_desc WHERE status = 'active'");
		$row = @mysql_fetch_object($sql);
		$this->active_poll_id = $row->pollid;
		$this->active_poll_title = $row->polltitle;
		return;
	}
	
	function voteCount() {
		$sql = @mysql_query ("SELECT SUM(votecount) AS votecount FROM galeria_enquete_data WHERE pollid = '$this->active_poll_id'");
		$row = @mysql_fetch_object($sql);
		$this->votecount = $row->votecount;
		return $this->votecount;
	}
	
	function pollForm() {
		$sql = @mysql_query ("SELECT polltext, voteid FROM galeria_enquete_data WHERE pollid = '$this->active_poll_id' ORDER BY voteid");
		if (@mysql_num_rows($sql) > 0) {
			echo "<table width=\"$this->form_table_width\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" class=\"$this->form_table\">
			<tr><td class=\"$this->form_table_cell\">\r\n";
			echo "<form action=\"$this->results_page\" name=\"pollf\" id=\"pollf\" method=\"get\" target=\"mini\" onsubmit=\"abre()\">
			<span class=\"$this->poll_question\"><img src=interroga.gif>&nbsp;" . $this->active_poll_title . "</span><br />\r\n";
			
			while ($row = @mysql_fetch_object($sql)) {
				if (!empty($row->polltext)) {
					echo "\t<input type=\"radio\" name=\"voteid\" value=\"$row->voteid\" /> $row->polltext <br />\r\n";
				}
			}
			
			echo "<input type=\"hidden\" name=\"pollid\" id=\"pollid\" value=\"$this->active_poll_id\" /><br />\r\n";
			echo "<input type=\"submit\" name=\"poll\" id=\"poll\" value=\"Votar\" class=\"$this->form_button\" />
			";
			if ($this->show_vote_count) {
				echo "Total de votos: " . $this->voteCount() . "\r\n";
			}
			echo "<a href=\"#\" onclick=\"window.open('$this->results_page?pollid=$this->active_poll_id',
'popup','width=468,height=340,left=300,top=20');\"><p>VER RESULTADOS</a>
			</form>\r\n</td></tr></table>\r\n";
		}
	}
	
	function deleteCheck() {
		$sql = @mysql_query ("DELETE FROM galeria_enquete_check WHERE time < '$this->timeout'");
		return;
	}
	
	function insertCheck() {
		$sql = @mysql_query ("INSERT INTO galeria_enquete_check (ip, time) VALUES ('$this->ip', '$this->timestamp')");
		return;
	}
	
	function voteCheck() {
		$this->deleteCheck();
		$sql = @mysql_query ("SELECT ip FROM galeria_enquete_check WHERE ip = '$this->ip'");
		if (@mysql_num_rows($sql) == 0) {
			$this->insertCheck();
			return true;
		}
		else {
			return false;
		}
	}
	
	function processPoll($pollid, $voteid) {
		if ($this->voteCheck()) {
			$sql = @mysql_query ("UPDATE galeria_enquete_data SET votecount = votecount + 1 WHERE voteid = '$voteid' AND pollid = '$pollid'");
		}
		else {
			echo $this->repeated_vote;
		}
	
	}
	
	function selectedPoll($pollid) {
		$sql = @mysql_query ("SELECT polltitle FROM galeria_enquete_desc WHERE pollid = '$pollid'");
		$row = @mysql_fetch_object($sql);
		$this->polltitle = $row->polltitle;
		return $this->polltitle;
	}
	
	function selectedPollVotecount($pollid) {
		$sql = @mysql_query ("SELECT SUM(votecount) AS votecount FROM galeria_enquete_data WHERE pollid = '$pollid'");
		$row = @mysql_fetch_object($sql);
		$this->votecount = $row->votecount;
		return $this->votecount;
	}
	
	function formatDate($val) {
		$arr = explode("-", $val);
		return date("d/m/Y.", mktime (0,0,0, $arr[1], $arr[2], $arr[0]));
	}
	
	function oldPolls($pollid) {
		$sql = mysql_query ("SELECT pollid, polltitle, timestamp FROM galeria_enquete_desc WHERE pollid <> '$pollid'");
		if (mysql_num_rows($sql) > 0) {
			echo "<tr><td class=\"$this->result_table_cell\" colspan=\"2\" cellspacing\"0\" cellpadding=\"1\">\r\n";
			while ($row = mysql_fetch_object($sql)) {
				$datum = $this->formatDate($row->timestamp);
				echo "<a href=\"$this->results_page?pollid=$row->pollid\">$row->polltitle</a> $datum<br />\r\n";
			}
			echo "</td></tr>\r\n";
		}
	}
	
	function pollResults($pollid) {
		$this->selectedPoll($pollid);
		$this->selectedPollVotecount($pollid);
		$sql = @mysql_query ("SELECT polltext, votecount, voteid FROM galeria_enquete_data WHERE pollid = '$pollid' AND polltext <> '' ORDER BY voteid");
		echo "<table border=\"0\" width=\"$this->result_table_width\" class=\"$this->results_table\">
		<tr><td class=\"$this->results_title\"><font color=#C10000><b>- RESULTADOS DA ENQUETE</b></font></td></tr>";
		if (@mysql_num_rows($sql) > 0) {
			echo "<tr><td class=\"$this->results_poll_question\" colspan=\"2\"><img src=interroga.gif>&nbsp;$this->polltitle</td></tr>\r\n";
			while ($row = mysql_fetch_object($sql)) {
				if ($this->votecount == 0) {
					$tmp_votecount = 1;
				}
				else {
					$tmp_votecount = $this->votecount;
				}
				$vote_percents = number_format(($row->votecount / $tmp_votecount * 100), 1);
				$image_width = intval($vote_percents * 1);
				echo "<tr><td class=\"$this->result_table_cell\">$row->polltext $row->votecount votos. ($vote_percents %)</td><td class=\"$this->result_table_cell\"> <img src=\"$this->bar_image\" width=\"$image_width\" alt=\"$vote_percents %\" height=\"15\" /> </td></tr>\r\n";
			}
			echo "<tr><td class=\"$this->result_table_cell\" colspan=\"2\">TOTAL DE VOTOS: <font color=#005300><b>$this->votecount</b></font></td></tr>\r\n";
		}
		if ($this->old_polls) {
			$this->oldPolls($pollid);
		}
		echo "</table>\r\n";	
	}

}
?>