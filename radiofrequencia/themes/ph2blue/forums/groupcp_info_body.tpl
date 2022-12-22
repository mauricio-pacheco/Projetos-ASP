<form action="{S_GROUPCP_ACTION}" method="post">
<table width="100%" cellspacing="2" cellpadding="3" border="0">
<tr>
	<td colspan="2" class="maintitle">{L_GROUP_INFORMATION}</td>
	</tr>
<tr>
<td class="nav"><a href="{U_INDEX}">{L_INDEX}</a> &raquo; <a href="{U_GROUP_CP}">{L_USERGROUPS}</a> &raquo; {L_GROUP_INFORMATION}</td>
<td align="right" class="nav" nowrap="nowrap">{PAGINATION}</td>
</tr>
</table>
<table class="forumline" width="100%" cellspacing="1" cellpadding="4" border="0">
<tr>
<th colspan="2">{L_GROUP_INFORMATION}</th>
</tr>
<tr>
<td width="20%" align="right" class="row1"><span class="explaintitle">{L_GROUP_NAME}:</span></td>
<td class="row2" width="80%"><strong>{GROUP_NAME}</strong></td>
</tr>
<tr>
<td align="right" class="row1"><span class="explaintitle">{L_GROUP_DESC}:</span></td>
<td class="row2">{GROUP_DESC}</td>
</tr>
<tr>
<td align="right" class="row1"><span class="explaintitle">{L_GROUP_MEMBERSHIP}:</span></td>
<td class="row2">{GROUP_DETAILS} &nbsp;&nbsp; 
<!-- BEGIN switch_subscribe_group_input -->
<input class="mainoption" type="submit" name="joingroup" value="{L_JOIN_GROUP}" />
<!-- END switch_subscribe_group_input -->
<!-- BEGIN switch_unsubscribe_group_input -->
<input class="mainoption" type="submit" name="unsub" value="{L_UNSUBSCRIBE_GROUP}" />
<!-- END switch_unsubscribe_group_input -->
</td>
</tr>
<!-- BEGIN switch_mod_option -->
<tr>
<td align="right" class="row1"><span class="explaintitle">{L_GROUP_TYPE}:</span></td>
<td class="row2"><table border="0" cellspacing="0" cellpadding="0">
<tr>
<td><input type="radio" name="group_type" value="{S_GROUP_OPEN_TYPE}" {S_GROUP_OPEN_CHECKED} /></td>
<td>{L_GROUP_OPEN} &nbsp;&nbsp; </td>
<td><input type="radio" name="group_type" value="{S_GROUP_CLOSED_TYPE}" {S_GROUP_CLOSED_CHECKED} /></td>
<td>{L_GROUP_CLOSED} &nbsp;&nbsp;</td>
<td><input type="radio" name="group_type" value="{S_GROUP_HIDDEN_TYPE}" {S_GROUP_HIDDEN_CHECKED} /></td>
<td>{L_GROUP_HIDDEN} &nbsp;&nbsp;</td>
<td><input class="mainoption" type="submit" name="groupstatus" value="{L_UPDATE}" /></td>
</tr>
</table> 
</td>
</tr>
<!-- END switch_mod_option -->
</table>
<table border="0" cellpadding="0" cellspacing="0" class="tbl"><tr><td class="tbll"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td><td class="tblbot"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td><td class="tblr"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td></tr></table>
{S_HIDDEN_FIELDS} 
</form>
<br />
<form action="{S_GROUPCP_ACTION}" method="post" name="post">
<table width="100%" cellpadding="4" cellspacing="1" border="0" class="forumline">
<tr>
<th>{L_PM}</th>
<th>{L_USERNAME}</th>
<th>{L_POSTS}</th>
<th>{L_FROM}</th>
<th>{L_EMAIL}</th>
<th>{L_WEBSITE}</th>
<th>{L_SELECT}</th>
</tr>
<tr>
<td class="cat" colspan="7">{L_GROUP_MODERATOR}</td>
</tr>
<tr>
<td class="row1" align="center">&nbsp;{MOD_PM_IMG}&nbsp;</td>
<td class="row1" align="center"><a href="{U_MOD_VIEWPROFILE}" class="name">{MOD_USERNAME}</a></td>
<td class="row1" align="center">{MOD_POSTS}</td>
<td class="row1" align="center">{MOD_FROM}</td>
<td class="row1" align="center">{MOD_EMAIL_IMG}</td>
<td class="row1" align="center">{MOD_WWW_IMG}</td>
<td class="row1" align="center">&nbsp;</td>
</tr>
<tr>
<td class="cat" colspan="7">{L_GROUP_MEMBERS}</td>
</tr>
<!-- BEGIN member_row -->
<tr>
<td class="{member_row.ROW_CLASS}" align="center"> {member_row.PM_IMG} </td>
<td class="{member_row.ROW_CLASS}" align="center"><a href="{member_row.U_VIEWPROFILE}" class="name">{member_row.USERNAME}</a></td>
<td class="{member_row.ROW_CLASS}" align="center">{member_row.POSTS}</td>
<td class="{member_row.ROW_CLASS}" align="center">{member_row.FROM}</td>
<td class="{member_row.ROW_CLASS}" align="center">{member_row.EMAIL_IMG}</td>
<td class="{member_row.ROW_CLASS}" align="center">{member_row.WWW_IMG}</td>
<td class="{member_row.ROW_CLASS}" align="center"> &nbsp; 
<!-- BEGIN switch_mod_option -->
<input type="checkbox" name="members[]" value="{member_row.USER_ID}" />
<!-- END switch_mod_option -->
&nbsp;</td>
</tr>
<!-- END member_row -->
<!-- BEGIN switch_no_members -->
<tr>
<td class="row1" colspan="7" align="center">{L_NO_MEMBERS}</td>
</tr>
<!-- END switch_no_members -->
<!-- BEGIN switch_hidden_group -->
<tr>
<td class="row1" colspan="7" align="center">{L_HIDDEN_MEMBERS}</td>
</tr>
<!-- END switch_hidden_group -->
<!-- BEGIN switch_mod_option -->
<tr>
<td class="cat" colspan="7">
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
 	<tr>
 		<td>
<input type="text"  class="post" name="username" maxlength="50" size="20" />
<input type="submit" name="add" value="{L_ADD_MEMBER}" class="mainoption" />
<input type="submit" name="usersubmit" value="{L_FIND_USERNAME}" class="button" onclick="window.open('{U_SEARCH_USER}', '_phpbbsearch', 'height=250,resizable=yes,width=400');return false;" />
</td>
 		<td align="right"><input type="submit" name="remove" value="{L_REMOVE_SELECTED}" class="mainoption" /></td>
 		</tr>
 	</table>
 
</td>
</tr>
<!-- END switch_mod_option -->
</table>
<table border="0" cellpadding="0" cellspacing="0" class="tbl"><tr><td class="tbll"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td><td class="tblbot"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td><td class="tblr"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td></tr></table>
<table width="100%" cellspacing="2" border="0" cellpadding="3">
<tr>
<td width="100%" class="nav"><a href="{U_INDEX}">{L_INDEX}</a> &raquo; <a href="{U_GROUP_CP}">{L_USERGROUPS}</a> &raquo; {L_GROUP_INFORMATION}</td>
<td align="right" class="nav" nowrap="nowrap">{PAGINATION}</td>
</tr>
</table>
{PENDING_USER_BOX} {S_HIDDEN_FIELDS} 
</form>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
	<tr>
		<td><br />{JUMPBOX}</td>
	</tr>
</table>
