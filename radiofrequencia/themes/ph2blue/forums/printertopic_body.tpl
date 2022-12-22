<a class="maintitle" href="{U_VIEW_TOPIC}"><font color=black>{TOPIC_TITLE}</font></a><br />
<span class="gensmall"><b><font color=black>{PAGINATION}</font></b><br /></span>


<span class="nav"><font color=black><a href="{U_INDEX}" class="nav"><font color=black>{SITENAME}</font></a>
	  -> <a href="{U_VIEW_FORUM}" class="nav"><font color=black>{FORUM_NAME}</font></a></font></span>


	{POLL_DISPLAY} 

	<!-- BEGIN postrow -->
	<center><hr width=80%></center>
<span class="name"><a name="{postrow.U_POST_ID}"></a><font color=black>{L_AUTHOR}:&nbsp;<b>{postrow.POSTER_NAME}</b>,&nbsp;</font></span><span class="postdetails"><font color=black>{postrow.POSTER_FROM}</font></span>
<a href="{postrow.U_MINI_POST}"><img src="{postrow.MINI_POST_IMG}" width="12" height="9" alt="{postrow.L_MINI_POST_ALT}" title="{postrow.L_MINI_POST_ALT}" border="0" /></a><span class="postdetails"><font color=black>{L_POSTED}: {postrow.POST_DATE}</font><span class="gen">&nbsp;</span>&nbsp; &nbsp;<font color=black>{L_POST_SUBJECT}: <b>{postrow.POST_SUBJECT}</b></font></span><br>
	<center><hr width=80%></center>

<span class="postbody">{postrow.MESSAGE}</span><span class="gensmall">{postrow.EDITED_MESSAGE}</span></td>
	<!-- END postrow -->
	<center><hr width=80%></center>
	<center><hr width=60%></center>
	<center><hr width=40%></center>
<span class="nav"><a href="{U_INDEX}" class="nav"><font color=black>{SITENAME}</font></a> 
	  -> <a href="{U_VIEW_FORUM}" class="nav"><font color=black>{FORUM_NAME}</font></a></span>
<p align=right><span class="gensmall">{S_TIMEZONE}</span></p><span class="nav">{PAGINATION}</span>
<center><span class="nav">{PAGE_NUMBER}</span></center>
