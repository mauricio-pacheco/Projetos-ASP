<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="include/gfxSpex.inc"-->
<!--#INCLUDE FILE="include/filesize.inc"-->
<!--#INCLUDE FILE="language/lang_global.inc"-->
<!--#INCLUDE FILE="language/lang_igallery.inc"-->

<%
Set objF   = fsdir
Set objFC  = objF.Files
intPage = Request.Querystring("page")
If intPage <> "" Then intPage = intPage else intPage = 0
i = 1
Dim RecordsCount
RecordsCount = 0 
Dim rowcount
rowcount = 1 
%>

<%
Sub DisplayGallery(dirfile,f1)

If dirFile = "DISPLAYFOLDERS" Then

strFolderName 	= f1.Name
strBaseDir 		= BaseDir
If strBaseDir <> "" Then strBaseDir = strBaseDir Else strBaseDir = ""
%>

<table width="120" cellspacing="1" cellpadding="2" border="0">
<tr>
<td align="center" nowrap>
<table background="images/largefolder.gif" width="98" height="142" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="middle" align="center">

<table cellspacing="1" cellpadding="2" border="0">
<tr>
<%
Set tlist = f1.Files

tpf 	= 4
tpr 	= 2
tPage 	= 0
t 		= 1
tcount 	= 0

For Each thumbnail in tlist

If (tcount >= (tPage * tpf)) And (tcount < (tPage * tpf) + tpf) Then

If NOT InStr(thumbnail, "tn-") > 0 Then 

ThumbPath 		= UploadPath &"\"& Replace(strBaseDir,"/","\") &"\"& strFolderName &"\" & thumbnail.Name

FileExt = fExt(thumbnail.Name)
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png"

If gfxSpex(ThumbPath, width, height, colors, strType) = True Then
strwidth  = "37"
strheight = FormatNumber(strwidth*(height/width),0)
If strheight > 33 Then 
strheight = "33"
strwidth  = FormatNumber(strheight*(width/height),0)
Else
strheight = strheight
End If
Else
strwidth  = 37
strheight = 33
End If

If nailer Then
strURL = URLpath&"/"& strBaseDir &"/"& strFolderName&"/tn-"&thumbnail.Name
Else
strURL = URLpath&"/"& strBaseDir &"/"& strFolderName&"/"&thumbnail.Name
End If

strimagesrc = "<img src="""&strURL&""" width="""&strwidth&""" height="""&strheight&""" border=""0"">"
Case "mid", "midi", "au", "aif", "aiff", "snd", "wav", "mp3", "mpga"
strimagesrc = "<img src=""images/sm-audio1.gif"" width=""30"" height=""30"" border=""0"">"
Case "avi", "mpg", "mpeg", "mov", "rm", "ram", "swf", "wmv", "qt"
strimagesrc = "<img src=""images/sm-video1.gif"" width=""30"" height=""30"" border=""0"">"
Case Else
strimagesrc = "<img src=""images/sm-unknown1.gif"" width=""30"" height=""30"" border=""0"">"
End Select 

If Not t Mod tpr = 0 Then
%>
<td align="center">
<a href="igallery.asp?d=<%= URLSpace(Replace(LCase(f1),LCase(UploadPath),"")) %>\"><%= strimagesrc %></a><br>
</td>
<% Else %>
<td align="center">
<a href="igallery.asp?d=<%= URLSpace(Replace(LCase(f1),LCase(UploadPath),"")) %>\"><%= strimagesrc %></a><br>
</td>
</tr>
<%
End if
End If	
tcount = tcount + 1	
t = t + 1
End If
Set Jpeg = Nothing

If tcount > 3 Then Exit For

Next
%>
</table>

</td>
</tr>
</table>
<img src="images/spacer.gif" width="1" height="3" border="0"><br>
<a class="linkxsm" href="igallery.asp?d=<%= URLSpace(Replace(LCase(f1),LCase(UploadPath),"")) %>\"><b><%= f1.name %></b></a><br>
</td>
</tr>
</table>
<%
'##### End Display Folders ######


'##### Begin Display Images ######
ElseIf dirFile = "DISPLAYIMAGES" Then

strBaseDir 		= BaseDir

If strBaseDir <> "" Then strBaseDir = strBaseDir Else strBaseDir = ""
If NOT InStr(f1, "tn-") > 0 AND NOT InStr(LCase(f1), "thumbs.db") > 0 Then ' Hide Non-Thumnails & Thumbs.db In View

'##### Original Image Size ######
'FileExt = fExt(f1.Name)
'Select Case FileExt
'Case "jpg", "jpeg", "gif", "bmp", "png"
'ImagePath 		= UploadPath &"\"& strImageFolder &"\" & strimage
'If gfxSpex(Replace(f1.Path,"tn-",""), width, height, colors, strType) = True Then
'ImageWidth  = width
'ImageHeight = height
'End If
'End Select

If Nailer Then

'If ImageWidth > 145 Then
strwidth  = "145"
'strheight = Round(145*ImageHeight/ImageWidth,0)
strimagesrc = "<img class=""shadow1"" style=""border: 1px solid gray;"" src="""& URLPath&"/"&strBaseDir &"/tn-"&f1.Name&""" width="""&strwidth&"""  border=""0"">"
'Else
'strwidth = ImageWidth
'strHeight = ImageHeight
'strimagesrc = "<img style=""border: 1px solid gray;"" src="""& URLPath&"/"&strBaseDir &"/"&f1.Name&""" width="""&strwidth&""" height="""&strheight&""" border=""0"">"
'End If

Else

'If ImageWidth > 145 Then
strwidth  = "145"
'strheight = Round(145*ImageHeight/ImageWidth,0)
'Else
'strwidth = ImageWidth
'strHeight = ImageHeight
'End If

strimagesrc = "<img style=""border: 1px solid gray;"" src="""& URLPath&"/"&strBaseDir &"/"&f1.Name&""" width="""&strwidth&"""  border=""0"">"

End If

If (RecordsCount >= (intPage * RecordsPerPage)) and (RecordsCount < (intPage * RecordsPerPage) + RecordsPerPage) Then
If NOT i MOD RecordsPerRow = 0 Then
strImageName 	= f1.name 
QS 			 	= "?image="&URLSpace(Replace(strImageName,"tn-",""))&"&folder="&URLSpace(BaseDir)&"&page="&intPage
%>
<td style="padding: 5px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>
<!--#INCLUDE FILE="igallery.inc"-->
</td>
<%
Else
strImageName 	= f1.name 
QS 			 	= "?image="&URLSpace(Replace(strImageName,"tn-",""))&"&folder="&URLSpace(BaseDir)&"&page="&intPage
%>
<td style="padding: 5px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>
<!--#INCLUDE FILE="igallery.inc"-->
</td>
</tr>
<%
End If
End If
RecordsCount = RecordsCount + 1
If rowcount = RecordsPerRow Then rowcount = 0
rowcount = rowcount + 1
i = i + 1
End If
%>

<%
'##### End Display Images ######

End If 
End Sub
'################# End SUB DisplayGallery Folder & Object Set-Up #################
%>

<html>
<head>

<title>DCE - URI - Frederico Westphalen/RS</title>

<script language="Javascript"> 
<!--
function imagePopup(url) {
if(document.all)
TheNewWin = window.open(url+'&sh='+screen.height+'&sw='+screen.width,'','fullscreen=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no'); 
else
TheNewWin = window.open(url+'&sh='+window.screen.availHeight+'&sw='+window.screen.availWidth,'','titlebar=no,width=' + window.screen.availWidth+',height='+window.screen.availHeight+',screenX=0,screenY=0')
}
function VotePopup(url,pwidth,pheight) {
var leftPos = (screen.availWidth-pwidth) / 2
var topPos = (screen.availHeight-pheight) / 2 
var vpop = window.open(url,'votepop','width=' + pwidth + ',height=' + pheight + ',scrollbars=yes,resizable=no,status=no,toolbar=no,location=no,top=' + topPos + ',left=' + leftPos);
if (window.focus) vpop.window.focus();
}
function checkField(theForm) {
if (theForm.F.value == "") {
alert("Please enter a value in the provided field before proceeding!.");
theForm.F.focus();
return (false);
}
return (true);
}
function VerifyDelete(URL) {
var verify = confirm("Are you sure you want to permanently delete the selected \"Item\" from the i-Gallery database?  All information will be lost!");
if (verify == true) {
window.open(URL,"_self");
}}
function button_over(eButton){
eButton.style.backgroundColor 	= "#C1D2EE";
eButton.style.borderColor 		= "darkblue darkblue darkblue darkblue";
eButton = null; 
}
function button_out(eButton){
eButton.style.backgroundColor 	= "#EFEFEF";
eButton.style.borderColor 		= "#DDDDDD #DDDDDD #DDDDDD #DDDDDD"; 
}
function button_down(eButton){
eButton.style.backgroundColor 	= "#98B5E2";
eButton.style.borderColor 		= "darkblue darkblue darkblue darkblue";
}
function button_up(eButton){
eButton.style.backgroundColor 	= "#C1D2EE";
eButton.style.borderColor 		= "darkblue darkblue darkblue darkblue";
eButton.style.cursor 			= "hand"; 
}
i = 0;
deg2rad = Math.PI * 2 / 360;
function SetRotation(divID,deg,M11,M12,M21,M22) {
rad = deg * deg2rad;
costheta = Math.cos(rad);
sintheta = Math.sin(rad);
divID.filters.item(0).M11 = costheta;
divID.filters.item(0).M12 = -sintheta;
divID.filters.item(0).M21 = sintheta;
divID.filters.item(0).M22 = costheta;
}
function setScripts() {
self.name = 'igallery';
}
window.onload = setScripts;
//-->
</script>

<link rel="stylesheet" type="text/css" href="style/style.css">

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="750" cellspacing="0" cellpadding="0" border="0">

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/header.asp"--></td>
</tr>

<tr>
<td style="padding-top:7px;" width="200" valign="top">

<!--#INCLUDE FILE="include/menu.asp"-->
<img src="images/spacer.gif" width=200 height=5 border=0 alt=""><br>

</td>

<td width="20" valign="top"><img src="images/spacer-bevel.gif" width=20 height=235 border=0 alt=""></td>
<td style="padding-left:10px;padding-top:15px;" width="100%" valign="top">

<%
'################ Begin Display Folder & Object Layout ################
Sub iGallery
Set f = fso.GetFolder(fsDir)
Set FileList = f.subFolders

Dim emptyDir
emptyDir = TRUE

If TopLevel Then
Parent = ""
%>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="34" height="32"><img src="images/folder-open.gif" width=30 height=32 border=0 alt=""></td>
<td><font class="largeheader"><%= GalleryName %></font></td>
</tr>
</table>
<img src="images/spacer.gif" width=10 height=5 border=0 alt=""><br>

<%
Else
Parent = fso.GetParentFolderName(fsDir)
Parent = Replace(LCase(Parent),LCase(UploadPath),"")
Parent = Replace(Parent,"\\","\")
%>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="34" height="32"><img src="images/folder-open.gif" width=30 height=32 border=0 alt=""></td>
<td><font class="largeheader"><%= f.name %></font></td>
</tr>
</table>
</td>
<td align="right">

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="22"><img src="images/sm-uponelevel.gif" width=22 height=23 border=0 alt=""></td>
<td><a class="link" title="VOLTAR UMA PASTA" href="igallery.asp?d=<%= URLSpace(Parent) %>\"><b><%= IG_uol %></b></a></td>
</tr>
</table>

</td>
</table>

<% End If %>

<!-- ################ Folder Layout ################ -->
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<%
'On Error Resume Next
fi 	= 1
fpr = FoldersPerRow
For Each fn in FileList
emptyDir = FALSE
If Not LCase(fn.Name) = "_vti_cnf" AND TopLevel Then
If Not fi Mod fpr = 0 then
%>
<td align="center">
<% DisplayGallery "DISPLAYFOLDERS",fn %>
</td>
<td width="10">&nbsp;</td>
<% Else %>
<td align="center">
<% DisplayGallery "DISPLAYFOLDERS",fn %>
</td>
</tr>
<%
End If
fi = fi + 1
End If
Next
%>
</table>
<!-- ################ End Folder Layout ################ -->

<img src="images/spacer.gif" width=10 height=10 border=0 alt=""><br>

<!-- ################ Object Layout With Paging ################ -->
<table align="center" bgcolor="gray" cellpadding=0 cellspacing=0 border=0>
<tr>
<td>

<table width="100%" cellpadding=1 cellspacing=1 border=0>
</tr>
<%
Set filelist = f.Files

If Nailer Then

For Each fn in filelist
emptyDir = FALSE
DisplayGallery "DISPLAYIMAGES",fn
Next

Else

For Each fn in filelist
emptyDir = FALSE
If NOT InStr(LCase(fn.Name), "tn-") > 0 Then
DisplayGallery "DISPLAYIMAGES",fn
End If

Next

End If
%>

<%
If Request("Page") = "" Then
CurrentPage = 0
Else
CurrentPage = CInt(Request("Page"))
End If
PageCount = Round((RecordsCount/RecordsPerPage),1)
'If (PageCount > 1) Then PageCount = int(PageCount) + 1
If InStrRev(PageCount, ".") > 0 Then
DotPosition = InStrRev(PageCount, ".")
Decimal = Mid(PageCount,DotPosition + 1)
If Decimal <= 5 Then
PageCount = Round(PageCount+.5,0)
Else
PageCount = Round(PageCount,0)
End If
Else
PageCount = Round(PageCount,0)
End If
%>

<%
lastrowtotal 	= rowcount-1
blankspaces 	= RecordsPerRow - lastrowtotal

If NOT CurrentPage+1 < PageCount AND NOT TopLevel AND NOT blankspaces = RecordsPerRow Then
Select Case blankspaces
Case 1
%>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<%
Case 2
%>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<%
Case 3
%>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<%
Case 4
%>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<%
Case 5
%>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<td style="padding: 3px;" <% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>width="245"<% Else %>width="155"<% End If %> bgcolor="#f4f4f4" onMouseOver="this.bgColor='#efefef'" onMouseOut="this.bgColor='#f7f7f7'" valign="top" nowrap>&nbsp;</td>
<%
End Select 
End If
%>

</tr>
</table>

</td>
</tr>
</table>

<!--#INCLUDE FILE="include/paging-ig.asp"-->

<% If PageCount > 1 Then %>
<img src="images/spacer.gif" width=5 height=5 border=0 alt=""><br>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>
<% If PageCount > 1 Then %>
<font class="paging"><%= IG_pg1 %> [<%= CurrentPage+1 %>&nbsp;<%= IG_pg2 %>&nbsp;<%= PageCount %>]</font>
<% End If %>
</td>
<td align="right">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<%= pgHTML %>
</tr>
</table>
</td>
</tr>
</table>
<% End If %>
<!-- ################ End Object Layout With Paging ################ -->


<!-- ################ Begin Empty Root Folder Message ################ -->
<% If TopLevel AND emptyDir Then %>
<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>
<font class="text"><%= IG_erfm1 %><br></font>
<% Else %>
<font class="text"><%= IG_erfm2 %><br></font>
<% End If %>
<% End If %>
<!-- ################ End Empty Root Folder Message ################ -->


<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>

<!-- ################ Delete Empty Directory ################ -->

<% If NOT TopLevel AND emptyDir AND RecordsCount = "0" Then %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<form method="post" action="igallery.asp">
<input type="hidden" name="PARENT" value="<%= Parent %>">
<input type="hidden" name="PATHNAME" value="<%=  fsdir %>">
<td><img src="images/spacer.gif" width=4 height=1 border=0><font face="Arial" size=1><%= IG_ded %></font></td>
<td>&nbsp;<input type="CHECKBOX" name="OK">&nbsp;</td>
<td><input class="button" style="font-size: 8.5pt;" type="SUBMIT" name="POSTACTION" value="DELETE"></td>
</tr></form>
</table>
<% End If %>
<!-- ################ End Delete Empty Directory ################ -->

<% If Nailer AND Not TopLevel AND NOT RecordsCount = "0" Then %>

<img src="images/spacer.gif" width=5 height=5 border=0 alt=""><br>
<table align="center" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16" height="17"><img src="images/sm-broken.gif" width="12" height="11" border="0" alt=""></td>
<td><a class="linkxsm" href="generator.asp?folder=<%= URLSpace(BaseDir) %>" title="Repair Broken Thumbnails In This Folder"><%= IG_ri %></a></td>
<td width="14" align="right"><% If Session(BaseDir&"-repair") = 1 Then %><img src="images/sm-greencheck.gif" width="12" height="11" border="0" alt=""><% End If %></td>
</tr>
</table>
<% End If %>
<% If Not TopLevel AND NOT RecordsCount = "0" Then %>
<table align="center" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16" height="17"><img src="images/sm-syncimages.gif" width="12" height="11" border="0" alt=""></td>
<td><a class="linkxsm" href="generator1.asp?folder=<%= URLSpace(BaseDir) %>" title="Sync All Images In This Folder To Database"><%= IG_si %></a></td>
<td width="14" align="right"><% If Session(BaseDir&"-sync") = 1 Then %><img src="images/sm-greencheck.gif" width="12" height="11" border="0" alt=""><% End If %></td>
</tr>
</table>
<% End If %>

<%
Dim CurrentDir
CurrentDir = Replace(BaseDir,"/","\")

Dim ParentDir
ParentDir = Replace(Parent,LCase(UploadPath),"")
'ParentDir = Right(ParentDir,Len(ParentDir)-1)
ParentDir = Replace(ParentDir,"\","/")
%>

<img src="images/spacer.gif" width=1 height=15 border=0 alt=""><br>

<table align="center" cellspacing="0" cellpadding="0" border="0">
<% If TopLevel Then %>
<tr>
<td>
<!-- ################ Create New Directory ################ -->
<table style="filter:progid:DXImageTransform.Microsoft.Shadow(color='#a9a9a9', Direction=135, Strength=2);" align="center" bgcolor="gray" cellspacing="0" cellpadding="1" border="0">
<tr>
<td>
<table width="100%" cellspacing="0" cellpadding="3" border="0">
<tr>
<td bgcolor="#F7F7F7">
<table width="100%" cellspacing="0" cellpadding="1" border="0">
<form name="newdir" method="get" action="igallery.asp" onSubmit="return checkField(newdir)">
<input type="hidden" name="C" value="<%= CurrentDir %>">
<input type="hidden" name="D" value="<%= fsdir %>">
<input type="hidden" name="T" value="F">
<tr>
<td colspan="2">
<table cellspacing="0" cellpadding="2" border="0">
<tr>
<td><img src="images/sm-folder.gif" width="16" height="14" border="0"></td>
<td class="textsm"><b><%= IG_cnd1 %>:</b></td>
</tr>
</table>
</tr>
<tr>
<td><font class="textsm"><input type="text" style="width: 150px;" size=12 name="F" class="input"></td>
<td><font class="textsm"><input class="button" style="font-size: 8.5pt;" type="submit" value="<%= IG_but1 %>"></td>
</tr></form>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
<!-- ################ End Create New Directory ################ -->
</td>
<% End If %>
<% If NOT TopLevel Then %>
<td width="15"><img src="images/spacer.gif" width=15 height=1 border=0 alt=""></td>
<td>
<!-- ################ Re-Name Directory ################ -->
<table style="filter:progid:DXImageTransform.Microsoft.Shadow(color='#a9a9a9', Direction=135, Strength=2);" align="center" bgcolor="gray" cellspacing="0" cellpadding="1" border="0">
<tr>
<td>
<table width="100%" cellspacing="0" cellpadding="3" border="0">
<tr>
<td bgcolor="#F7F7F7">
<table width="100%" cellspacing="0" cellpadding="1" border="0">
<form name="renamedir" method="get" action="igallery.asp" onSubmit="return checkField(renamedir)">
<input type="hidden" name="PARENT" value="<%= Parent %>">
<input type="hidden" name="PFOLDER" value="<%= ParentDir %>">
<input type="hidden" name="OFOLDER" value="<%= BaseDir%>">
<input type="hidden" name="C" value="<%= CurrentDir %>">
<input type="hidden" name="D" value="<%= fsdir %>">
<input type="hidden" name="T" value="R">
<tr>
<td colspan="2">
<table cellspacing="0" cellpadding="2" border="0">
<tr>
<td><img src="images/sm-folder.gif" width="16" height="14" border="0"></td>
<td class="textsm"><b><%= IG_rnd1 %>:</b></td>
</tr>
</table>
</tr>
<tr>
<td><font class="textsm"><input type="text" style="width: 150px;" size=12 name="F" class="input"></td>
<td><font class="textsm"><input class="button" style="font-size: 8.5pt;" type="submit" value="<%= IG_but2 %>"></td>
</tr></form>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
<!-- ################ End Re-Name Directory ################ -->
</td>
<% End If %>
</tr>
</table>

<% Else %>

<!-- ################ Empty Directory Message ################ -->
<% If Not TopLevel AND RecordsCount = "0" Then %>
<font class="text">
<%= IG_edm %><br>
</font>
<% End If %>
<!-- ################ End Empty Directory Message ################ -->

<% End If %>

<!-- ################ Upload & Return To Main Link ################ -->
<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>

<%
Directory = f
Directory = Replace(LCase(Directory),LCase(UploadPath),"")
Directory = Replace(Directory,"\\","\")
%>

<img src="images/spacer.gif" width=10 height=10 border=0 alt=""><br>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>
<% If Not TopLevel Then %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="25" nowrap><img src="images/sm-upload1.gif" alt="" width="25" height="20" border="0"></td>
<td nowrap><a class="link" href="upload.asp?d=<%= URLSpace(Directory&"\") %>"><b><%= IG_upttf1 %></b></a></td>
</tr>
</table>
<% End If %>
</td>
<td align="right">
<% If Not TopLevel Then %>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="22" nowrap><img src="images/spacer.gif" width="1" height="2"><br><a class="linkmed" href="igalery.asp"><img src="images/sm-return.gif" width="18" height="18" border="0"></a></td>
<td nowrap><a class="link" href="igallery.asp"><b><%= IG_upttf2 %></b></a></td>
</tr>
</table>
<% End If %>
</td>
</tr>
</table>
<% End If %>
<!-- ################ End Upload & Return To Main Link ################ -->

</td>
</tr>

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/footer.asp"--></td>
</tr>

</table>

<p>

<%
End Sub
%>

<%
'################ Create New Folder ################
Sub CreateFolder

fn = fn
fn = Replace(fn,"\","")
fn = Replace(fn,"/","")
fn = Replace(fn,":","")
fn = Replace(fn,"?","")
fn = Replace(fn,"<","")
fn = Replace(fn,">","")
fn = Replace(fn,"|","")
fn = Replace(fn,chr(42),"")
fn = Replace(fn,chr(34),"")

PathOrig 	= Request.QueryString("D")
PathName    = PathOrig & fn

PathCurrent = Request.QueryString("C")
PathCurrent = "\"&PathCurrent&"\"
NewFolderRedirect = PathCurrent&fn&"\"

PathRename 	= Request.QueryString("PARENT") & fn
OldDirectory = LCase(Request.QueryString("OFOLDER"))

If Request.QueryString("PFOLDER") <> "" Then
NewDirectory = LCase(Request.QueryString("PFOLDER") &"/"& fn)
Else
NewDirectory = LCase(fn)
End If

PathParent 	= Request.QueryString("PARENT")
RenameFolderRedirect = PathParent&"\"&fn&"\"

If right(PathName,1) = "\" Then PathName = Left(PathName,len(PathName)-1)

Select Case UCase(Request.QueryString("T"))

Case "F" 'Create Folder
If NOT fso.FolderExists(PathName) Then
Set f = fso.CreateFolder(PathName)
response.redirect "igallery.asp?d="&URLSpace(NewFolderRedirect)
Else
response.redirect "igallery.asp?d="&URLSpace(PathCurrent)
End If

Case "R" 'Rename Folder
If fso.FolderExists(PathOrig) Then
Set f = fso.GetFolder(PathOrig)
f.Name = fn

' Batch Folder Update
Set renameConn = Server.CreateObject("ADODB.Connection")
Set RS = Server.CreateObject("ADODB.Recordset")
renameConn.Open strConnect
Set RS.ActiveConnection = renameConn
RS.CursorType = adOpenStatic
RS.LockType = adLockBatchOptimistic
SQL = "SELECT * FROM Descriptions"
SQL = SQL & " WHERE (1=1) "
RS.Open SQL,,,adCmdTable
While Not RS.EOF

If Instr(RS("folder"),OldDirectory) Then
strnewdir = Replace(RS("folder"),OldDirectory,rURLSpace(NewDirectory))
RS("folder") = rURLSpace(strnewdir)
End if

RS.MoveNext
Wend
RS.UpdateBatch
RS.close
Set RS = Nothing
' End Batch Folder Update

response.redirect "igallery.asp?d="&URLSpace(RenameFolderRedirect)
Else
response.redirect "igallery.asp?d="&URLSpace(PathCurrent)
End If

End Select

End Sub
%>

<%
'################ Begin Main Guts ################
' Root Image Directory
fsDir = LCase(UploadPath&Request("d"))
fsDir = Replace(fsDir,"\..","")
fsDir = Replace(fsDir,"..","")

If fsDir = UploadPath Then fsDir = Request.Form("fsDir")
fsRoot   = LCase(UploadPath)&"\"
If Instr(fsdir,fsroot) <> 1 Then fsDir = fsRoot
If Lcase(fsDir) = Lcase(fsRoot) Then TopLevel = TRUE

' Base Image Directory
Dim BaseDir
BaseDir 	= Replace(Mid(fsDir,len(fsRoot),250),"\","/")
BaseDir 	= Left(BaseDir,Len(BaseDir)-1)
BaseDir 	= Right(BaseDir,Len(BaseDir)-1)

' Form Action
Action 		= Request.Form("POSTACTION")
PathName 	= Request.Form("PATHNAME")

' Delete Empty Folders
Select Case UCase(Action)
Case "DELETE"
If Request.Form("OK") = "on" Then
PathParent = Request.Form("PARENT")
If Instr(PathName,fsroot) = 1 Then
fso.DeleteFolder Left(PathName,Len(PathName)-1),TRUE
response.redirect "igallery.asp?d="&URLSpace(PathParent)&"\"
End If
End If
If Request.Form("DELETEOK") = "on" Then
If Instr(PathName,fsroot) = 1 Then
If fso.FileExists(Request.Form("PathName")) Then
Set f = fso.GetFile(Request.Form("PathName"))
f.delete
End If
End If
End If
End Select

' Choose Re-Direct
If Action <> "" Then
tstr = "igallery.asp?d="
If NOT TopLevel Then 
tstr = tstr & URLSpace(fsDir)
End If
response.redirect tstr
End If

' Page Display 
fn = Request.QueryString("f")
If fn = "" Then
iGallery
Else
CreateFolder
End If

'#################  End Main Guts  #################
%>

<% 
Set objFC 	= nothing
Set objF 	= nothing
Set objFSO 	= Nothing
Set FSO 	= Nothing
Set f 		= Nothing
Set fsDir 	= Nothing
%>

</body>
</html>