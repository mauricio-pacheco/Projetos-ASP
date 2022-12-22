<table width="100%" cellspacing="2" cellpadding="2" border="0">
<tr>
	<td class="maintitle">{L_WHO_IS_ONLINE}</td>
</tr>
<tr>
<td class="nav"><a href="{U_INDEX}">{L_INDEX}</a> &raquo; {L_WHO_IS_ONLINE}</td>
</tr>
</table>
<table width="100%" cellpadding="3" cellspacing="1" border="0" class="forumline">
<tr>
<th width="35%">{L_USERNAME}</th>
<th width="25%">{L_LAST_UPDATE}</th>
<th width="40%">{L_FORUM_LOCATION}</th>
</tr>
<tr>
<td class="cat" colspan="3">{TOTAL_REGISTERED_USERS_ONLINE}</td>
</tr>
<!-- BEGIN reg_user_row -->
<tr>
<td class="{reg_user_row.ROW_CLASS}"><a href="{reg_user_row.U_USER_PROFILE}">&nbsp;{reg_user_row.USERNAME}</a></td>
<td align="center" nowrap="nowrap" class="{reg_user_row.ROW_CLASS}">{reg_user_row.LASTUPDATE}</td>
<td class="{reg_user_row.ROW_CLASS}" align="center"><a href="{reg_user_row.U_FORUM_LOCATION}">{reg_user_row.FORUM_LOCATION}</a></td>
</tr>
<!-- END reg_user_row -->
<tr>
<td colspan="3" height="1" class="row3"><img src="themes/PH2BLUE/forums/images/spacer.gif" width="1" height="1" alt="" /></td>
</tr>
<tr>
<td class="cat" colspan="3">{TOTAL_GUEST_USERS_ONLINE}</td>
</tr>
<!-- BEGIN guest_user_row -->
<tr>
<td class="{guest_user_row.ROW_CLASS}">{guest_user_row.USERNAME}</td>
<td align="center" nowrap="nowrap" class="{guest_user_row.ROW_CLASS}">{guest_user_row.LASTUPDATE}</td>
<td class="{guest_user_row.ROW_CLASS}" align="center"><a href="{guest_user_row.U_FORUM_LOCATION}">{guest_user_row.FORUM_LOCATION}</a></td>
</tr>
<!-- END guest_user_row -->
<tr>
<td colspan="3" class="row1"><span class="gensmall">{L_ONLINE_EXPLAIN}</span></td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" class="tbl"><tr><td class="tbll"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td><td class="tblbot"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td><td class="tblr"><img src="themes/PH2BLUE/forums/images/spacer.gif" alt="" width="8" height="4" /></td></tr></table>
<table width="100%" cellspacing="2" cellpadding="2" border="0">
<tr>
<td class="nav"><a href="{U_INDEX}">{L_INDEX}</a> &raquo; {L_WHO_IS_ONLINE}</td>
</tr>
<tr>
	<td><br />{JUMPBOX}</td>
</tr>
</table>