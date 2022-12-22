<!-- $Author: zx $ -->
<!-- $Date: 2003/07/18 15:11:03 $ -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir="{S_CONTENT_DIRECTION}">
<head>
<meta http-equiv="Content-Type" content="text/html; charset={S_CONTENT_ENCODING}">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta name="CreatedBy" content="Pitcher - http://www.pitcher.no/">
<link rel="stylesheet" href="themes/PH2BLUE/forums/style.css" type="text/css" />
{META}
{NAV_LINKS}
<title>{SITENAME} :: {PAGE_TITLE}</title>

<!-- BEGIN switch_enable_pm_popup -->
<script language="Javascript" type="text/javascript">
<!--
	if ( {PRIVATE_MESSAGE_NEW_FLAG} )
	{
		window.open('{U_PRIVATEMSGS_POPUP}', '_phpbbprivmsg', 'HEIGHT=225,resizable=yes,WIDTH=400');;
	}
//-->
</script>
<!-- END switch_enable_pm_popup -->

<a name="top"></a>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
  <td align="center" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="2">
<tr>
<td height="40" align="center" class="topnav2">&nbsp;<a href="{U_FAQ}"><img src="themes/PH2BLUE/forums/images/icon_mini_faq.gif" alt="Forum FAQ"></a>&nbsp;<a href="{U_FAQ}">{L_FAQ}</a>&nbsp;&nbsp;<a href="{U_SEARCH}"><img src="themes/PH2BLUE/forums/images/icon_mini_search.gif" alt="Search Forums"></a>&nbsp;<a href="{U_SEARCH}">{L_SEARCH}</a><a href="{U_RANKS}">{L_RANKS}</a>
&nbsp;<a href="{U_MEMBERLIST}"><img src="themes/PH2BLUE/forums/images/icon_mini_members.gif" alt="Members List"></a>&nbsp;<a href="{U_MEMBERLIST}">{L_MEMBERLIST}</a>&nbsp;&nbsp;<a href="{U_GROUP_CP}"><img src="themes/PH2BLUE/forums/images/icon_mini_groups.gif" alt="Usergroups"></a>&nbsp;<a href="{U_GROUP_CP}">{L_USERGROUPS}</a>
{PROFILE_VIEW}
&nbsp;<a href="{U_PROFILE}"><img src="themes/PH2BLUE/forums/images/icon_mini_profile.gif" alt="Profile"></a>&nbsp;<a href="{U_PROFILE}">{L_PROFILE}</a>&nbsp;&nbsp;<a href="{U_PRIVATEMSGS}"><img src="themes/PH2BLUE/forums/images/icon_mini_message.gif" alt="{PRIVATE_MESSAGE_INFO}"></a>&nbsp;<a href="{U_PRIVATEMSGS}">{PRIVATE_MESSAGE_INFO}</a>&nbsp;
<a href="{U_LOGIN_LOGOUT}"><img src="themes/PH2BLUE/forums/images/icon_mini_login.gif" alt="{L_LOGIN_LOGOUT}"></a>&nbsp;<a href="{U_LOGIN_LOGOUT}">{L_LOGIN_LOGOUT}</a></td>
</tr>
</table></td>
			</tr>
		</table>
<!-- BEGIN switch_board_msg -->
		<br />
<center>
<table border="0" width={BM_WIDTH} class="forumline">
  <tr>
	<th colspan="3" class="thCornerL" height="25" nowrap="nowrap">&nbsp;{BM_TITLE}&nbsp;</th>
  </tr>
  <tr>
	<td width="10%" align="center" class="row1">{BM_IMAGES}</td>
	<td class="row1"><span class="gen">{BM_MSG}</a></span></td>
	<td width="10%" align="center" class="row1">{BM_IMAGES}</td>
  </tr>

</table>
<table border="0" width={BM_WIDTH}>
  <tr>
	<td align="left" valign="top"><span class="gensmall"><a href={U_BM_PRV} title="{BM_PRV_TITLE}" class="nav">{L_BM_PRV}</a></span></td>
	<td align="right" valign="top"><span class="gensmall"><a href={U_BM_NXT} title="{BM_NXT_TITLE}" class="nav">{L_BM_NXT}</a></span></td>
  </tr>

</table>
</center>

<!-- END switch_board_msg -->
		<br />

<!-- $Log: overall_header.tpl,v $
<!-- Revision 1.2  2003/07/18 15:11:03  zx
<!-- Removed additional HTML, HEAD, and BODY tag sections
<!-- -->
