
<%
strimage 		= Replace(f1.Name,"tn-","")
strfolder 		= BaseDir

Set RS1 = Server.CreateObject("ADODB.RecordSet")
Set GalleryConn1 = Server.CreateObject ("ADODB.Connection")
GalleryConn1.Open strConnect

SQL1 = "SELECT * FROM Descriptions " & _
"WHERE imagename ='" & strimage & _
"' AND folder ='" & Replace(strfolder,"'","''") &  _
"' "

RS1.Open SQL1, GalleryConn1, adOpenStatic, adLockReadOnly, adCmdText

If RS1.EOF And RS1.BOF Then
strtitle1		= strimage
If Session("userLevel") = "99" OR Session("userLevel") = "98" Then
strtitle2 		= CropIt(strimage,TitleMax+10)
Else
strtitle2 		= CropIt(strimage,TitleMax)
End If
strdescription1 = ""
Else
If RS1("title") <> "" Then
strtitle1 		= RS1("title")
strtitle2 		= RS1("title")
Else
strtitle1 		= strimage
If Session("userLevel") = "99" OR Session("userLevel") = "98" Then
strtitle2 		= CropIt(strimage,TitleMax+10)
Else
strtitle2 		= CropIt(strimage,TitleMax)
End If
End If

strid 			= RS1("ID")
strdescription1 = RS1("description")
strviews 		= RS1("total")
strvotes 		= RS1("votes")
strrating 		= RS1("rating")
strdateadded	= RS1("dateadded")
End If

RS1.Close
GalleryConn1.Close

'DotPosition = InStrRev(f1.name, ".")
'FileExt = Mid(f1.name,DotPosition + 1)
'FileExt = LCase(FileExt)
FileExt = fExt(f1.name)
qs1="vote.asp?link="&strid&"&image="&URLSpace(Replace(f1.Name,"'","\'"))&"&folder="&URLSpace(Replace(strfolder,"'","\'"))&"&page="&intPage

imgnew12 = "<img src=""images/newlink12.gif"" width=27 height=10 border=0 alt="""&IGi_add&": "&strdateadded&""">"
imgnew8  = "<img src=""images/newlink8.gif"" width=27 height=10 border=0 alt="""&IGi_add&": "&strdateadded&""">"
imgnew4  = "<img src=""images/newlink4.gif"" width=27 height=10 border=0 alt="""&IGi_add&": "&strdateadded&""">"
imgnew0  = "<img src=""images/spacer.gif"" width=27 height=10 border=0>"

if DateDiff("d",strdateadded,Date())>"" and DateDiff("d",strdateadded,Date())<8 then
strhistory = imgnew12
elseif DateDiff("d",strdateadded,Date())>7 and DateDiff("d",strdateadded,Date())<15 then
strhistory = imgnew8
elseif DateDiff("d",strdateadded,Date())>14 and DateDiff("d",strdateadded,Date())<22 then
strhistory = imgnew4
else
strhistory = imgnew0
end if
%>

<table width="100%" align="center" cellspacing="0" cellpadding="0" border="0">

<tr>
<td colspan="2" style="padding-bottom: 4px;">
</td>
</tr>

<%
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png"
%>

<tr>
<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>
<td valign="top">
<table width="100%" cellspacing="0" cellpadding="1" border="0">
<tr>
<td colspan="2"><img src="images/spacer.gif" width=1 height=1 border=0 alt=""></td>
</tr>
<% If gfxSpex(Replace(f1.Path,"tn-",""), width, height, colors, strType) = True Then %>
<tr>
<td><font class="textxsm"><i><%= IGi_ht %>:</td>
<td><font class="textxsm" style="color: #CC0000;"><%= height %></td>
</tr>
<tr>
<td><font class="textxsm"><i><%= IGi_wd %>:</td>
<td><font class="textxsm" style="color: #CC0000;"><%= width %></td>
</tr>
<% Else  %>
<tr>
<td><font class="textxsm"><i><%= IGi_ht %>:</td>
<td><font class="textxsm"><%= IGi_un %></td>
</tr>
<tr>
<td><font class="textxsm"><i><%= IGi_wd %>:</td>
<td><font class="textxsm"><%= IGi_un %></td>
</tr>
<% 
End If

If DateFormat = 1 Then
modified			= USDate(f1.DateLastModified)
ElseIf DateFormat = 2 Then
modified			= EuroDate(f1.DateLastModified)
Else
modified 		= FormatDateTime(f1.DateLastModified,2)
End If
%>
<tr>
<td><font class="textxsm"><i><%= IGi_mod %>:</td>
<td><font class="textxsm"><%= modified %><br></td>
</tr>
<tr>
<td><font class="textxsm"><i><%= IGi_sz %>:</td>
<td nowrap><font class="textxsm"><%= FileSize(f1.Size) %><br></td>
</tr>
<tr>
<td colspan="2">
<a class="linkxsm" href="editimage.asp<%= QS %>"><%= IGi_adjprop %></a><br>
</td>
</tr>
</table>
</td>
<% End If %>

<td valign="top" style="padding-left: 2px; padding-right: 2px;" align="center"><% If (ie) Then %><div id="mydiv<%= RecordsCount %>" class="displayretainer"><% End If %>
<a href="javascript:void('0');" onClick="imagePopup('viewphoto.asp?i=<%= URLSpace(Replace(f1.Name,"tn-","")) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>');" title="<%= IGi_view %>: <%= strtitle1 %>"><%= strimagesrc %></a><br>
<% If (ie) Then %></div><% End If %></td>
</tr>

<% If ToolBar Then %>
<tr>
<td align="center" style="padding-top: 4px; padding-bottom: 4px;" colspan="2">
<!--#INCLUDE FILE="include/toolbar.asp"-->
</td>
</tr>
<% End If %>

<% Case "mid", "midi", "au", "aif", "aiff", "snd", "wav", "mp3", "mpga" %>

<tr>
<td height="115" align="center" valign="center">
<a href="streamfile.asp?i=<%= URLSpace(f1.Name) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>&mode=other"><img src="images/file-audio1.gif" height="60" width="60" border="0" alt="<%= IGi_dwnaudio %>: <%= strtitle1 %>"></a><br>
<img src="images/spacer.gif" width="1" height="4"><br>
<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>
<% If ToolBar Then %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="22"><a href="editimage.asp<%= QS %>"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/sm-pencil1.gif" width="23" height="22" border="0" alt="<%= IGi_editaudio %>"></a></td>
<td width="2"><img src="images/spacer.gif" width="2" height="24" border="0" border=0 alt=""></td>
<td width="22"><a href="streamfile.asp?i=<%= URLSpace(f1.Name) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>&mode=other"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/gallery/download.gif" width="23" height="22" border="0" alt="<%= IGi_dwnaudio %>"></a></td>
</tr>
</table>
<% Else %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="18" nowrap><a href="editimage.asp<%= QS %>"><img src="images/sm-editimage.gif" height="20" width="25" border="0" alt="<%= IGi_editaudio %>"></a></td>
<td nowrap><a class="linksm" href="editimage.asp<%= QS %>"><%= IGi_editaudio %></a></td>
</tr>
</table>
<% End If %>
<% Else %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16" height="18"><a href="streamfile.asp?i=<%= URLSpace(f1.Name) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>&mode=other"><img src="images/xsm-download.gif" height="10" width="13" border="0" alt=""></a></td>
<td><a class="linksm" href="streamfile.asp?i=<%= URLSpace(f1.Name) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>&mode=other"><%= IGi_dwnld %>&nbsp;.<%= UCase(FileExt) %>&nbsp;<%= IGi_f %></a></td>
</tr>
</table>
<% End If %>
</td>
</tr>

<% Case "avi", "mpg", "mpeg", "mov", "rm", "ram", "swf", "wmv", "qt" %>

<tr>
<td height="115" align="center" valign="center">
<a href="streamfile.asp?i=<%= URLSpace(f1.Name) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>&mode=other"><img src="images/file-video1.gif" height="60" width="60" border="0" alt="<%= IGi_dwnld %>: <%= strtitle1 %>"></a><br>
<img src="images/spacer.gif" width="1" height="4"><br>
<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>
<% If ToolBar Then %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="22"><a href="editimage.asp<%= QS %>"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/sm-pencil1.gif" width="23" height="22" border="0" alt="<%= IGi_editvideo %>"></a></td>
<td width="2"><img src="images/spacer.gif" width="2" height="24" border="0" border=0 alt=""></td>
<td width="22"><a href="streamfile.asp?i=<%= URLSpace(f1.Name) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>&mode=other"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/gallery/download.gif" width="23" height="22" border="0" alt="<%= IGi_dwnvideo %>"></a></td>
</tr>
</table>
<% Else %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="18" nowrap><a href="editimage.asp<%= QS %>"><img src="images/sm-editimage.gif" height="20" width="25" border="0" alt="<%= IGi_editvideo %>"></a></td>
<td nowrap><a class="linksm" href="editimage.asp<%= QS %>"><%= IGi_editvideo %></a></td>
</tr>
</table>
<% End If %>
<% Else %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16" height="18"><a href="streamfile.asp?i=<%= URLSpace(f1.Name) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>&mode=other"><img src="images/xsm-download.gif" height="10" width="13" border="0" alt=""></a></td>
<td><a class="linksm" href="streamfile.asp?i=<%= URLSpace(f1.Name) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>&mode=other"><%= IGi_dwnld %>&nbsp;.<%= UCase(FileExt) %>&nbsp;<%= IGi_f %></a></td>
</tr>
</table>
<% End If %>
</td>
</tr>

<% Case Else %>

<tr>
<td>
<table width="100%" align="center" cellspacing="0" cellpadding="1" border="0">
<tr>
<td height="115" align="center" valign="center">
<img src="images/file-unknown1.gif" height="60" width="60" border="0" alt="<%= IGi_unkn %>&nbsp;.<%= UCase(FileExt) %>&nbsp;<%= IGi_f %>"><br>
<img src="images/spacer.gif" width="1" height="4"><br>
<font class="linksm">
<%= IGi_unkn %>&nbsp;.<%= UCase(FileExt) %>&nbsp;<%= IGi_f %>
</font>
</td>
</tr>
</table>
</td>
</tr>

<% End Select %>

<%
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png", "mid", "midi", "au", "aif", "aiff", "snd", "wav", "mp3", "mpga", "avi", "mpg", "mpeg", "mov", "rm", "ram", "swf", "wmv", "qt"
%>

<tr>
<td colspan="2">
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<% If Vote Then %>
<% End If %>
<td align="center"><font class="textxsm"><b><%= IGi_views %>:</b> <% If strviews <> "" Then response.write strviews Else response.write "0" %></font></td>
</tr>
<% If Description Then %>
<tr>
<td colspan="2"><font class="textxsm"><%= strdescription1 %></font></td>
</tr>
<% End If %>
</table>
</td>
</tr>

<% Case Else %>

<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>
<tr>
<td colspan="2">
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td></td>
<td align="right">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="13"><img src="images/xsm-delete.gif" width=10 height=10 border="0" alt=""></td>
<td><a class="textxsm" style="text-decoration: none;" href="editimage.asp<%= QS %>"><b><%= IGi_delunkn %></b></a></td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
<% End If %>

<% End Select %>

</table>