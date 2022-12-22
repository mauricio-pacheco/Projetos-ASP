<form method="POST" action="{S_POLL_ACTION}">
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="forumline">
<tr> 
<th>Poll :: {POLL_QUESTION}</th>
</tr>
<tr>
<td align="center" class="row2">
<br />
<table cellspacing="0" cellpadding="1" border="0">
<!-- BEGIN poll_option -->
<tr> 
<td> 
<input type="radio" name="vote_id" value="{poll_option.POLL_OPTION_ID}" /></td>
<td class="postbody">{poll_option.POLL_OPTION_CAPTION}</td>
</tr>
<!-- END poll_option -->
</table>
<br />
{S_HIDDEN_FIELDS}
</td>
</tr>
<tr>
	<td align="center" class="cat"><table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td><input type="submit" name="submit" value="{L_SUBMIT_VOTE}" class="mainoption" /></td>
			<td>&nbsp;&nbsp;</td>
			<td class="fakebut"><a class="but" href="{U_VIEW_RESULTS}">&nbsp; {L_VIEW_RESULTS} &nbsp;</a></td>
		</tr>
	</table>
		</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" class="tbl"><tr><td class="tbll"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td><td class="tblbot"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td><td class="tblr"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td></tr></table>
</form>
<br />