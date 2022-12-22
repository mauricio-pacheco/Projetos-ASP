<table cellspacing="2" cellpadding="2" border="0" align="center">
<tr>
<td>{INBOX_IMG}</td>
<td class="nav">{INBOX} &nbsp;</td>
<td>{SENTBOX_IMG}</td>
<td class="nav">{SENTBOX} &nbsp;</td>
<td>{OUTBOX_IMG}</td>
<td class="nav">{OUTBOX} &nbsp;</td>
<td>{SAVEBOX_IMG}</td>
<td class="nav">{SAVEBOX} &nbsp;</td>
</tr>
</table>
<br />
<form method="post" action="{S_PRIVMSGS_ACTION}">
<table width="100%" cellspacing="2" cellpadding="2" border="0">
<tr>
<td>{REPLY_PM_IMG}</td>
<td width="100%" class="nav">&nbsp;<a href="{U_INDEX}">{L_INDEX}</a></td>
</tr>
</table>
<table border="0" cellpadding="3" cellspacing="1" width="100%" class="forumline">
<tr>
<th colspan="2">{BOX_NAME} :: {L_MESSAGE}</th>
</tr>
<tr>
<td align="right" class="row2"><span class="explaintitle">{L_FROM}:</span></td>
<td class="row2"><span class="name">{MESSAGE_FROM}</span></td>
</tr>
<tr>
<td align="right" class="row2"><span class="explaintitle">{L_TO}:</span></td>
<td class="row2"><span class="name">{MESSAGE_TO}</span></td>
</tr>
<tr>
<td align="right" class="row2"><span class="explaintitle">{L_POSTED}:</span></td>
<td class="row2"><span class="genmed">{POST_DATE}</span></td>
</tr>
<tr>
<td align="right" class="row2"><span class="explaintitle">&nbsp;&nbsp;{L_SUBJECT}:</span></td>
<td width="100%" class="row2"><table width="100%" border="0" cellspacing="1" cellpadding="0">
	<tr>
		<td class="genmed">{POST_SUBJECT}</td>
		<td align="right">{QUOTE_PM_IMG}{EDIT_PM_IMG}</td>
	</tr>
</table></td>
</tr>
<tr>
<td valign="top" colspan="2" class="row1"><span class="postbody">{MESSAGE}</span>
<br />&nbsp;</td>
</tr>
<tr>
<td height="28" valign="bottom" colspan="2" class="row1"> {PROFILE_IMG} {BUDDY_IMG} {PM_IMG}
{EMAIL_IMG} {WWW_IMG} {AIM_IMG} {YIM_IMG} {MSN_IMG} {ICQ_IMG}</td>
</tr>
<tr>
<td class="cat" colspan="2" align="right">{S_HIDDEN_FIELDS}
<input type="submit" name="save" value="{L_SAVE_MSG}" class="button" />
&nbsp;
<input type="submit" name="delete" value="{L_DELETE_MSG}" class="button" />
</td>
</tr>
</table>
{ROPM_QUICKREPLY_OUTPUT}
<table border="0" cellpadding="0" cellspacing="0" class="tbl"><tr><td class="tbll"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td><td class="tblbot"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td><td class="tblr"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td></tr></table>
<table width="100%" cellspacing="2" border="0" cellpadding="2">
<tr>
<td>{REPLY_PM_IMG}</td>
<td width="100%" class="nav">&nbsp;<a href="{U_INDEX}">{L_INDEX}</a></td>
</tr>
</table>
</form>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
	<tr>
		<td><br />{JUMPBOX}</td>
	</tr>
</table>
