<table width="100%" cellspacing="0" cellpadding="2" border="0">
<tr> 
<td valign="bottom" class="gensmall"> 
<!-- BEGIN switch_user_logged_in -->
{LAST_VISIT_DATE}<br />
<!-- END switch_user_logged_in -->
{CURRENT_TIME}<br />
<a href="{U_INDEX}" class="nav">{L_INDEX}</a></td>
<td align="right" valign="bottom" class="gensmall"> 
<!-- BEGIN switch_user_logged_in -->
<a href="{U_SEARCH_NEW}">{L_SEARCH_NEW}</a><br />
<!-- END switch_user_logged_in -->
<a href="{U_SEARCH_UNANSWERED}">{L_SEARCH_UNANSWERED}</a><br />
<a href="{U_MARK_READ}"><strong>{L_MARK_FORUMS_READ}</strong></a></td>
</tr>
</table>
<table width="100%" cellpadding="3" cellspacing="1" border="0" class="forumline">
  <tr>
	  <th width="7%" class="thCornerL">{L_AVATAR}</th>
	  <th width="15%" class="thTop">{L_USERNAME}</th>
	  <th width="15%" class="thTop">{L_EMAIL}</th>
	  <th width="7%" class="thTop">{L_PM}</th>
	  <th width="10%" class="thTop">{L_MESSENGER}</th>
	  <th width="10%" class="thTop">{L_YAHOO}</th>
	  <th width="10%" class="thTop">{L_AIM}</th>
	  <th width="10%" class="thCornerR">{L_ICQ_NUMBER}</th>
  </tr>
<!-- BEGIN staff -->
  <tr>
          <td align="center" class="row1">{staff.AVATAR}</td>
          <td align="center" class="row2"><span class="gen">{staff.NAME}</span><br /><span class="genmed">{staff.LEVEL}</span></td>
          <td align="center" class="row1">{staff.MAIL}</td>
          <td align="center" class="row2">{staff.PM}</td>
          <td align="center" class="row1"><span class="genmed">{staff.MSN}</span></td>
          <td align="center" class="row2">{staff.YIM}</td>
          <td align="center" class="row1">{staff.AIM}</td>
          <td align="center" class="row2">{staff.ICQ}</td>
  </tr>
<!-- END staff -->
</table>