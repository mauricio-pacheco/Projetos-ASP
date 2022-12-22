
<%
HighlightTitle 	= TitleHighlight
HighlightDesc  	= DescHighlight
igName 			= rs("imagename")
igTitle 		= rs("title")
igDesc 			= rs("description")
igName	 		= highlight(igName, words, wCount, HighlightTitle) 
igTitle 		= highlight(igTitle, words, wCount, HighlightTitle) 
igDesc  		= highlight(igDesc, words, wCount, HighlightDesc)
igDate			= rs("dateadded")
NumCount = NumCount+1
If CurrentPage="1" Then
ResultsCount = NumCount
Else
ResultsCount = (CurrentPage&"0")+NumCount-10
End if

FileExt = fExt(rs("imagename"))
QS 			= "?image="&URLSpace(rs("imagename"))&"&folder="&URLSpace(rs("folder"))
%>

<tr>
<td width="100%" valign="top">

<table width="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
<td width="25" valign="top">
<img src="images/spacer.gif" width=1 height=1 border=0 alt=""><br>
<font class="text"><b><% If NumberSearchResults Then response.write""&ResultsCount&"." %></b></font><br>
</td>
<td>
<table cellspacing="0" cellpadding="1" border="0">
<tr>
<td><font class="text"><b><%= IGsrslt_nm %></b>:&nbsp;</font></td>
<td width="100%"><font class="text"><%= igName %></font></td>
</tr>
<tr>
<td><font class="text"><b><%= IGsrslt_indx %></b>:&nbsp;</font></td>
<td><font class="text"><%= FormatDateTime(igDate,1) %></font></td>
</tr>
<% If igTitle <> "" Then %>
<tr>
<td><font class="text"><b><%= IGsrslt_title %></b>:&nbsp;</td>
<td><font class="text"><%= igTitle %></font></td>
</tr>
<% End If %>
<% If igDesc <> "" Then %>
<tr>
<td colspan="2" style="padding-right:20px;">
<font class="text">
<b><%= IGsrslt_desc %></b>:<br>
</font>
<img src="images/spacer.gif" width=1 height=2 border=0 alt=""><br>
<font class="textsm">
<%= igDesc %><br>
</font>
</td>
</tr>
<% End If %>
</table>
</td>
</tr>

</table>

</td>
<td align="center">

<% If RS.Fields("Score") <> "" Then %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td align="center"><font class="textxsm" style="color: #BFBFBF;">&nbsp;<%= FormatPercent(RS.Fields("Score"),0) %></font></td>
<td>
<table width="100" cellpadding="0" border="0" cellspacing="0" style="border: #104a7b 1px solid; padding:1px; padding-right: 1px; padding-left: 1px;" width="100%">
<tr>
<td width="100%">
<div style="height: 6px; width:<%= Formatnumber((RS.Fields("Score")*100),0) %>%; font-size: 3px; background-color: #4F8FCF; FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=<%= StartColor1 %>,endColorStr=<%= EndColor1 %>);"></div>
</td>
</tr>
</table>
<% End If %>

</td>
</tr>


<tr>
<td colspan="2" align="center">

<%
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png"
%>

<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>
<% If Nailer Then %>
<a class="linksm" href="javascript:void('0');" onClick="imagePopup('viewphoto.asp?i=<%= URLSpace(rs("imagename")) %>&f=<%= URLSpace(Replace(rs("folder"),"'","\'")) %>');"><img class="shadow1" style="border: 1px solid gray;" src="<%= URLPath &"/"& rs("folder") %>/tn-<%= rs("imagename") %>" width="145" border="0" alt="<%= IGsrslt_ctvi %>"></a><br>
<% Else %>
<a class="linksm" href="javascript:void('0');" onClick="imagePopup('viewphoto.asp?i=<%= URLSpace(rs("imagename")) %>&f=<%= URLSpace(Replace(rs("folder"),"'","\'")) %>');"><img class="shadow1" style="border: 1px solid gray;" src="<%= URLPath &"/"& rs("folder") %>/<%= rs("imagename") %>" width="145" border="0" alt="<%= IGsrslt_ctvi %>"></a><br>
<% End If %>

<% Case "mid", "midi", "au", "aif", "aiff", "snd", "wav", "mp3", "mpga" %>

<img src="images/spacer.gif" width="1" height="4"><br>
<a href="streamfile.asp?i=<%= URLSpace(f1.Name) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>&mode=other"><img src="images/file-audio1.gif" height="60" width="60" border="0" alt="<%= IGsrslt_dwnaudio %>"></a><br>

<% Case "avi", "mpg", "mpeg", "mov", "rm", "ram", "swf", "wmv", "qt" %>

<img src="images/spacer.gif" width="1" height="4"><br>
<a href="streamfile.asp?i=<%= URLSpace(f1.Name) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>&mode=other"><img src="images/file-video1.gif" height="60" width="60" border="0" alt="<%= IGsrslt_dwnvideo %>"></a><br>

<% End Select %>

</td>
</tr>
</table>

</td>
</tr>

<tr>
<td>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><font class="textsm"><b><%= IGsrslt_dir %>:</b>&nbsp;</font></td>
<td width="19"><img src="images/sm-folder4.gif" width=17 height=16 border=0 alt=""></td>
<td><a class="linksm" href="igallery.asp?d=\<%= URLSpace(Replace(rs("folder"),"/","\")) %>\"><%= Replace(rs("folder"),"/","\") %></a></td>
</tr>
</table>

</td>
<td align="center">

<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>

<%
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png"
%>

<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="22"><a href="editimage.asp<%= QS %>"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/sm-pencil1.gif" width="23" height="22" border="0" alt="<%= IGsrslt_eimg %>"></a></td>
<td width="8" align="center"><img src="images/separator.gif" width="2" height="24" border="0" border=0 alt=""></td>
<td width="22"><a href="javascript:void('0');" onClick="imagePopup('viewphoto.asp?i=<%= URLSpace(rs("imagename")) %>&f=<%= URLSpace(Replace(rs("folder"),"'","\'")) %>');" title="Actual Size"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/actual-size.gif" width="23" height="22" border="0" alt="<%= IGsrslt_vimg %>"></a></td>
<td width="8" align="center"><img src="images/separator.gif" width="2" height="24" border="0" border=0 alt=""></td>
<td width="22"><a href="streamfile.asp?i=<%= URLSpace(rs("imagename")) %>&f=<%= URLSpace(Replace(rs("folder"),"'","\'")) %>"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/gallery/download.gif" width="23" height="22" border="0" alt="<%= IGsrslt_dimg %>"></a></td>
</tr>
</table>
<% Else %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16"><img src="images/sm-locate.gif" height="14" width="14" border="0" alt=""></td>
<td><a class="linksm" href="javascript:void('0');" onClick="imagePopup('viewphoto.asp?i=<%= URLSpace(rs("imagename")) %>&f=<%= URLSpace(Replace(rs("folder"),"'","\'")) %>');"><%= IGsrslt_cte %></a></td>
</tr>
</table>
<% End If %>

<% Case "mid", "midi", "au", "aif", "aiff", "snd", "wav", "mp3", "mpga" %>

<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="22"><a href="editimage.asp<%= QS %>"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/sm-pencil1.gif" width="23" height="22" border="0" alt="<%= IGsrslt_edtaudio %>"></a></td>
<td width="2"><img src="images/spacer.gif" width="2" height="24" border="0" border=0 alt=""></td>
<td width="22"><a href="streamfile.asp?i=<%= URLSpace(rs("imagename")) %>&f=<%= URLSpace(Replace(rs("folder"),"'","\'")) %>&mode=other"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/gallery/download.gif" width="23" height="22" border="0" alt="<%= IGsrslt_dwnaudio %>"></a></td>
</tr>
</table>
<% Else %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16" height="18"><a href="streamfile.asp?i=<%= URLSpace(rs("imagename")) %>&f=<%= URLSpace(Replace(rs("folder"),"'","\'")) %>&mode=other"><img src="images/xsm-download.gif" height="10" width="13" border="0" alt=""></a></td>
<td><a class="linksm" href="streamfile.asp?i=<%= URLSpace(rs("imagename")) %>&f=<%= URLSpace(Replace(rs("folder"),"'","\'")) %>&mode=other"><%= IGsrslt_dwn %>&nbsp;.<%= UCase(FileExt) %>&nbsp;<%= IGsrslt_f %></a></td>
</tr>
</table>
<% End If %>

<% Case "avi", "mpg", "mpeg", "mov", "rm", "ram", "swf", "wmv", "qt" %>

<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="22"><a href="editimage.asp<%= QS %>"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/sm-pencil1.gif" width="23" height="22" border="0" alt="<%= IGsrslt_edtvideo %>"></a></td>
<td width="2"><img src="images/spacer.gif" width="2" height="24" border="0" border=0 alt=""></td>
<td width="22"><a href="streamfile.asp?i=<%= URLSpace(rs("imagename")) %>&f=<%= URLSpace(Replace(rs("folder"),"'","\'")) %>&mode=other"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/gallery/download.gif" width="23" height="22" border="0" alt="<%= IGsrslt_dwnvideo %>"></a></td>
</tr>
</table>
<% Else %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16" height="18"><a href="streamfile.asp?i=<%= URLSpace(rs("imagename")) %>&f=<%= URLSpace(Replace(rs("folder"),"'","\'")) %>&mode=other"><img src="images/xsm-download.gif" height="10" width="13" border="0" alt=""></a></td>
<td><a class="linksm" href="streamfile.asp?i=<%= URLSpace(rs("imagename")) %>&f=<%= URLSpace(Replace(rs("folder"),"'","\'")) %>&mode=other"><%= IGsrslt_dwn %>&nbsp;.<%= UCase(FileExt) %>&nbsp;<%= IGsrslt_f %></a></td>
</tr>
</table>
<% End If %>

<% End Select %>

</td>
</tr>

<tr>
<td colspan="2"><hr size="1" color="silver">
</td>
</tr>

