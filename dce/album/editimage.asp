<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/security.inc"-->
<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="include/gfxSpex.inc"-->
<!--#INCLUDE FILE="language/lang_global.inc"-->
<!--#INCLUDE FILE="language/lang_editimage.inc"-->

<%
Set EditConn = Server.CreateObject ("ADODB.Connection")
EditConn.Open strConnect
DataTable   = "Descriptions"
%>

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<script language="JavaScript1.2" type="text/javascript">
<!--
function clearfield(){
if (document.rename.RName.value == "<%= IGei_click %>")
	document.rename.RName.value = "";
}

function imagePopup(url) {
TheNewWin = window.open(url+'&sh='+screen.height+'&sw='+screen.width,'','fullscreen=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no'); 
}

function imageResize(url) {
var leftPos = (screen.availWidth-400) / 2
var topPos  = (screen.availHeight-350) / 2 
var iforgot = window.open(url,'','width=500,height=350,scrollbars=no,resizable=no,status=no,toolbar=no,location=no,top=' + topPos + ',left=' + leftPos);
}

function textCounter(field, countfield, maxlimit) {
if (field.value.length > maxlimit)
{field.value = field.value.substring(0, maxlimit);}
else
{countfield.value = maxlimit - field.value.length;}
}
//-->
</script>

<link rel="stylesheet" type="text/css" href="style/style.css">

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="760" cellspacing="0" cellpadding="0" border="0">

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/header.asp"--></td>
</tr>

<tr>
<td style="padding-top:7px;" width="200" valign="top">

<!--#INCLUDE FILE="include/menu.asp"-->
<img src="images/spacer.gif" width=200 height=5 border=0 alt=""><br>

</td>

<td width="20" valign="top"><img src="images/spacer-bevel.gif" width=20 height=235 border=0 alt=""></td>
<td style="padding-left:10px;padding-top:15px;" width="530" valign="top">

<% If Request.Querystring("mode") = "rename" Then %>

<%
ID 				= Request("ID")
oldImageName 	= Request("oName")
newImageName 	= Request("RName")
imageExt     	= Request("iExt")
strfolder 		= Request("Folder")
imageDirectory 	= Request("fsDir")

If newImageName <> "" AND NOT newImageName = IGei_click Then

newImageName = newImageName
newImageName = Replace((lTrim(rTrim(newImageName)))," ","_")
newImageName = Replace(newImageName,"\","")
newImageName = Replace(newImageName,"/","")
newImageName = Replace(newImageName,":","")
newImageName = Replace(newImageName,"?","")
newImageName = Replace(newImageName,"<","")
newImageName = Replace(newImageName,">","")
newImageName = Replace(newImageName,"|","")
newImageName = Replace(newImageName,"'","")
newImageName = Replace(newImageName,chr(34),"") ' Double Quotes
newImageName = Replace(newImageName,chr(37),"") ' Percentage
newImageName = Replace(newImageName,chr(42),"") ' Asterisk
newImageName = Replace(newImageName,chr(94),"") ' ^

tnsource_file= imageDirectory & "tn-" & oldImageName 'Old Thumb Name
tntarget_file= imageDirectory & "tn-" & newImageName&"."&imageExt 'New Thumb Name

source_file= imageDirectory & oldImageName 'Old Image Name
target_file= imageDirectory & newImageName&"."&imageExt 'New Image Name

If nailer Then
objFSO.CopyFile tnsource_file,tntarget_file,true 'Add New Files
End If
objFSO.CopyFile source_file,target_file,true

If Not LCase(source_file) = LCase(target_file) Then 'Delete Old Files
If nailer Then
objFSO.DeleteFile(tnsource_file)
End If
objFSO.DeleteFile(source_file)
End If

strimage = newImageName&"."&imageExt

Set RenameConn = Server.CreateObject ("ADODB.Connection")

If ID <> "" Then
RenameConn.Open strConnect
SQL = "UPDATE Descriptions SET "
SQL = SQL & "imagename ='" & strimage & "'"
SQL = SQL & " WHERE ID ="  & ID & ";"
RenameConn.Execute(SQL)
Else
Set RS = Server.CreateObject("ADODB.Recordset")
RenameConn.Open strConnect
Set RS.ActiveConnection = RenameConn
RS.CursorType = adOpenStatic
SQL = "SELECT ID, imagename, folder, title, description, votes, rating, dateadded, lasttime, lastdate, total FROM Descriptions WHERE ID = '" & ID & "'"
RS.Open SQL,,,adCmdTable
If RS.recordcount = 0 then
RS.AddNew
RS("imagename") = strimage
RS("folder") = strfolder
end if
RS("imagename") = strimage
RS.update
RS.close
End If

RenameConn.Close

Else
strimage = oldImageName
End If

response.redirect "editimage.asp?image="&strimage&"&folder="&URLSpace(strfolder)&"&msg=rename"
%>


<% ElseIf Request.Querystring("mode") = "description" Then %>


<%
strimage 		= Request("Image")
strfolder 		= Request("Folder")
strdescription 	= Request("Description")
strtitle       	= Request("Title")
If DateFormat = 1 Then
strdate			= USDate(igalleryNow)
ElseIf DateFormat = 2 Then
strdate			= EuroDate(igalleryNow)
Else
strdate 		= FormatDateTime(igalleryNow,2)
End If

If strtitle <> "" OR strdescription <> "" Then 

Set DescriptionConn = Server.CreateObject("ADODB.Connection")
Set dRS = Server.CreateObject("ADODB.Recordset")
DescriptionConn.Open strConnect
Set dRS.ActiveConnection = DescriptionConn
dRS.CursorType = adOpenStatic
lSQL = "SELECT ID, imagename, folder, title, description, votes, rating, dateadded, lasttime, lastdate, total FROM Descriptions WHERE imagename='"&strimage&"' AND folder='"&Replace(strfolder,"'","''")&"'"
dRS.Open lSQL,,,adCmdTable
If dRS.recordcount = 0 Then
dRS.AddNew
dRS("imagename") 	= strimage
dRS("folder") 		= strfolder
dRS("title")       	= strtitle
dRS("description") 	= strdescription
dRS("dateadded") 	= strdate
End If
dRS("title")       	= strtitle
dRS("description") 	= strdescription
dRS.Update
dRS.Close
DescriptionConn.Close

response.redirect "editimage.asp?image="&strimage&"&folder="&URLSpace(strfolder)&"&msg=desc"

Else
response.redirect "editimage.asp?image="&strimage&"&folder="&URLSpace(strfolder)
End If
%>


<% ElseIf Request.Querystring("mode") = "move" Then %>


<%
ID 			= Request("ID")
strimage    = Request("Image")
strfolder 	= Request("Folder")
olddirectory  = Replace(Request("oldDir"),"/","\")
movedirectory = Replace(Request("moveDir"),"/","\")

D = movedirectory
D = Replace(LCase(D),LCase(UploadPath),"")
D = URLSpace(D) 

If movedirectory <> "" Then

tnsource_file = olddirectory & "tn-" & strimage    
tntarget_file = movedirectory & "tn-" & strimage

source_file   = olddirectory & strimage    
target_file   = movedirectory & strimage

If nailer Then
objFSO.MoveFile tnsource_file,tntarget_file 'Move Thumbnail
End If
objFSO.MoveFile source_file,target_file

FN = LCase(UploadPath)
NF = LCase(Replace(Request("moveDir"),FN,""))
NF = Replace(NF,"\","/")
NF = Left(NF,Len(NF)-1)
NF = Right(NF,Len(NF)-1)

If DateFormat = 1 Then
strdate			= USDate(igalleryNow)
ElseIf DateFormat = 2 Then
strdate			= EuroDate(igalleryNow)
Else
strdate 		= FormatDateTime(igalleryNow,2)
End If

Set MoveConn = Server.CreateObject ("ADODB.Connection")

If ID <> "" Then
MoveConn.Open strConnect
SQL = "UPDATE Descriptions SET "
SQL = SQL & "folder ='" & Replace(NF,"'","''") & "'"
SQL = SQL & " WHERE ID ="  & ID & ";"
MoveConn.Execute(SQL)
Else
Set RS = Server.CreateObject("ADODB.Recordset")
MoveConn.Open strConnect
Set RS.ActiveConnection = MoveConn
RS.CursorType = adOpenStatic
SQL = "SELECT ID, imagename, folder, title, description, votes, rating, dateadded, lasttime, lastdate, total FROM Descriptions WHERE ID = '" & ID & "'"
RS.Open SQL,,,adCmdTable
If RS.recordcount = 0 then
RS.AddNew
RS("imagename") = strimage
RS("folder") 	= NF
RS("dateadded") = strdate
end if
RS("folder") 	= NF
RS("dateadded") = strdate
RS.update
RS.close
End If

MoveConn.Close

response.redirect "igallery.asp?D="&D
Else
response.redirect "editimage.asp?image="&strimage&"&folder="&URLSpace(strfolder)
End If
%>


<% ElseIf Request.Querystring("mode") = "copy" Then %>


<%
ID 				= Request("ID")
strimage     	= Request("Image")
strfolder 		= Request("Folder")
strdescription 	= Request("Description")
strtitle       	= Request("Title")
olddirectory  	= Replace(Request("oldDir"),"/","\")
copydirectory 	= Replace(Request("copyDir"),"/","\")

D = copydirectory
D = Replace(LCase(D),LCase(UploadPath),"")
D = URLSpace(D) 

If copydirectory <> "" Then

If nailer Then
tnsource_file = olddirectory & "tn-" & strimage
tntarget_file = copydirectory & "tn-" & strimage
End If

source_file   = olddirectory & strimage
target_file   = copydirectory & strimage

If nailer Then
objFSO.CopyFile tnsource_file,tntarget_file 'Copy Thumbnail
End If
objFSO.CopyFile source_file,target_file

FN = LCase(UploadPath)
NF = LCase(Replace(Request("copyDir"),FN,""))
NF = Replace(NF,"\","/")
NF = Left(NF,Len(NF)-1)
NF = Right(NF,Len(NF)-1)

If DateFormat = 1 Then
strdate			= USDate(igalleryNow)
ElseIf DateFormat = 2 Then
strdate			= EuroDate(igalleryNow)
Else
strdate 		= FormatDateTime(igalleryNow,2)
End If

Set CopyConn = Server.CreateObject("ADODB.Connection")
Set dRS = Server.CreateObject("ADODB.Recordset")

CopyConn.Open strConnect
Set dRS.ActiveConnection = CopyConn
dRS.CursorType = adOpenStatic
lSQL = "SELECT ID, imagename, folder, title, description, votes, rating, dateadded, lasttime, lastdate, total FROM Descriptions WHERE imagename='"&strimage&"' AND folder='"&Replace(strfolder,"'","''")&"'"
dRS.Open lSQL,,,adCmdTable
dRS.AddNew
dRS("imagename") 	= strimage
dRS("folder") 		= NF
dRS("title")       	= strtitle
dRS("description") 	= strdescription
dRS("dateadded") 	= strdate
dRS.Update
dRS.Close

CopyConn.Close

response.redirect "igallery.asp?D="&D
Else
response.redirect "editimage.asp?image="&strimage&"&folder="&URLSpace(strfolder)
End If
%>


<% ElseIf Request.Querystring("mode") = "delete" Then %>


<% 
ID 				= Request("ID")
strimage     	= Request("Image")
strfolder 		= Request("Folder")
strpage 		= Request("Page")
deletedirectory = Replace(Request("delDir"),"/","\")

D = deletedirectory
D = Replace(LCase(D),LCase(UploadPath),"")
D = URLSpace(D) 

tnsource_file = deletedirectory & "tn-" & strimage
source_file   = deletedirectory & strimage

If Request.Form("deleteok") = "on" Then

If nailer Then
objFSO.DeleteFile(tnsource_file) 'Delete Thumbnail
End If
objFSO.DeleteFile(source_file)

If ID <> "" Then
Set DeleteConn = Server.CreateObject ("ADODB.Connection")
DeleteConn.Open strConnect
SQL = "DELETE * FROM Descriptions "
SQL = SQL & " WHERE ID=" & ID & ";"
DeleteConn.Execute(SQL)
DeleteConn.Close
End If

response.redirect "igallery.asp?D="&D&"&page="&strpage
Else
response.redirect "editimage.asp?image="&strimage&"&folder="&URLSpace(strfolder)&"&page="&strpage
End If
%>


<% Else %>


<%
strPage = Request("page")
strImageFolder = Request("folder")
strImage = Request("image")
strSync = True
Set RS = Server.CreateObject("ADODB.RecordSet")
Set EditConn = Server.CreateObject ("ADODB.Connection")
EditConn.Open strConnect

SQL = "SELECT * FROM Descriptions " & _
"WHERE imagename ='" & strImage & _
"' AND folder ='" & Replace(strImageFolder,"'","''") &  _
"' "

RS.Open SQL, EditConn, adOpenStatic, adLockReadOnly, adCmdText

If RS.EOF And RS.BOF Then
strID = ""
strdescription = ""
strtitle = ""
strSync = False
Else
strID = RS("ID")
strdescription = RS("description")
strtitle = RS("title")
End If
%>

<%
strimgfolder = "\"&strImageFolder&"\"
fsDir = Replace(F & strimgfolder,"/","\")

fn = strImage
fn = fn
fn = Replace(fn,"\","")
fn = Replace(fn,"/","")
fn = Replace(fn,":","")
fn = Replace(fn,"?","")
fn = Replace(fn,"<","")
fn = Replace(fn,">","")
fn = Replace(fn,"|","")
fn = Replace(fn,"'","")
fn = Replace(fn,chr(34),"")
fn = Replace(fn,chr(37),"")
fn = Replace(fn,chr(42),"")
fn = Replace(fn,chr(94),"")

pathName = fsDir & fn

FileExt = fExt(fn)

Directory = fsDir
Directory = Replace(Directory,UploadPath,"")
Directory = URLSpace(Directory) 
%>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="20"><img src="images/spacer.gif" width="1" height="2"><br><a class="linkmed" href="igallery.asp?d=<%= URLSpace(fsDir) %>"><img src="images/sm-return.gif" width="18" height="18" border="0"></a></td>
<td><a class="linkmed" href="igallery.asp?d=<%= URLSpace(Replace(strimgfolder,"/","\")) %>&page=<%= Request("page") %>"><%= IGei_rtnfldr %></a></td>
</tr>
</table>

<br>

<table align="center" class="shadow1" bgcolor="gray" cellspacing="0" cellpadding="1" border="0">
<tr>
<td>
<table width="100%" cellspacing="0" cellpadding="8" border="0">
<tr>
<td bgcolor="#FFFFFF">
<table width="100%" cellspacing="0" cellpadding="1" border="0">
<tr>
<td>

<table width="400" cellspacing="0" cellpadding="0" border="0">
<tr>
<td colspan="3">

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="30"><img src="images/files/<%= FileExt %>.gif" width=27 height=30 border=0 alt=""></td>
<td><font class="largeheader"><%= strImage %></font></td>
</tr>
</table>

</td>
</tr>

<tr>
<td colspan="3"><hr size=1 color=silver></td>
</tr>

<tr>
<td colspan="3">

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<form name="rename" action="editimage.asp?mode=rename" method="post" style="margin-top: 0px; margin-bottom: 0px;">
<input type="hidden" name="ID" value="<%= strID %>">
<input type="hidden" name="Folder" value="<%= strImageFolder %>">
<input type="hidden" name="fsDir" value="<%= Replace(fsDir,"/","\") %>">
<input type="hidden" name="oName" value="<%= strImage %>">
<input type="hidden" name="iExt" value="<%= FileExt %>">
<td height="20"><img src="images/sm-renameas.gif" width="23" height="18" border="0" alt=""></td>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="text" maxlength=255 size=40 name="RName" class="input" onFocus="clearfield()" value="<%= IGei_click %>"></td>
<td><font class="text">&nbsp;<b>.<%= Ucase(FileExt) %></b>&nbsp;&nbsp;</font></td>
<td><input class="button" style="font-size: 8.5pt;" type="submit" value="<%= IGei_but1 %>"></td>
</tr>
</table>
</td>
</tr></form>
</table>

</td>
</tr>
<tr>
<td colspan="3"><hr size=1 color=silver></td>
</tr>
<tr>
<td width="145" align="center" valign="top">

<%
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png"
'##### Original Image Size ######
ImagePath 		= UploadPath &"\"& strImageFolder &"\" & strimage
If gfxSpex(ImagePath, width, height, colors, strType) = True Then
ImageWidth  = width
ImageHeight = height
End If
If ImageWidth > 145 Then
strwidth  = "145"
strheight = Round(145*ImageHeight/ImageWidth,0)
Else
strwidth = ImageWidth
strHeight = ImageHeight
End If
%>
<% If Nailer Then %>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16"><img src="images/sm-system1.gif" height="14" width="14" border="0" alt=""></td>
<td>
<% If NailerApp = 1 OR NailerApp = 2 Then %>
<a class="linksm" href="javascript:void('0');" onClick="imageResize('photoproperties.asp?mode=adjust&i=<%= URLSpace(strImage) %>&f=<%= URLSpace(Replace(strImageFolder,"'","\'")) %>');"><%= IGei_adj1 %></a><br>
<% ElseIf NailerApp = 3 Then %>
<a class="linksm" href="javascript:void('0');" onClick="imageResize('photoproperties.asp?mode=adjust&i=<%= URLSpace(strImage) %>&f=<%= URLSpace(Replace(strImageFolder,"'","\'")) %>');"><%= IGei_adj2 %></a><br>
<% End If %>
</td>
</tr>
</table>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
<a class="linksm" href="javascript:void('0');" onClick="imagePopup('viewphoto.asp?i=<%= URLSpace(strImage) %>&f=<%= URLSpace(Replace(strImageFolder,"'","\'")) %>');"><img  style="border: 1px solid gray;" src="<%= URLPath &"/"& strImageFolder %>/tn-<%= strImage %>" width="<%= strwidth %>" height="<%= strheight %>" border="0" alt="<%= IGei_img1 %>"></a><br>
<% Else %>
<a class="linksm" href="javascript:void('0');" onClick="imagePopup('viewphoto.asp?i=<%= URLSpace(strImage) %>&f=<%= URLSpace(Replace(strImageFolder,"'","\'")) %>');"><img style="border: 1px solid gray;" src="<%= URLPath &"/"& strImageFolder %>/<%= strImage %>" width="<%= strwidth %>" height="<%= strheight %>" border="0" alt="<%= IGei_img1 %>"></a><br>
<% End If %>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16"><img src="images/sm-locate.gif" height="14" width="14" border="0" alt=""></td>
<td><a class="linksm" href="javascript:void('0');" onClick="imagePopup('viewphoto.asp?i=<%= URLSpace(strImage) %>&f=<%= URLSpace(Replace(strImageFolder,"'","\'")) %>');"><%= IGei_img2 %></a></td>
</tr>
</table>
</td>
<td align="right"><font class="textxsm"><%= ImageWidth %> X <%= ImageHeight %></font></td>
</tr>
</table>
<% Case "mid", "midi", "au", "aif", "aiff", "wav", "mp3" %>
<br><br>
<img src="images/file-audio1.gif" height="60" width="60" border="0" alt="<%= IGei_dwnaudio %>"><br>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16" height="18"><a href="streamfile.asp?i=<%= URLSpace(strimage) %>&f=<%= URLSpace(Replace(strImageFolder,"'","\'")) %>"><img src="images/xsm-download.gif" height="10" width="13" border="0" alt=""></a></td>
<td nowrap><a class="linksm" href="streamfile.asp?i=<%= URLSpace(strimage) %>&f=<%= URLSpace(Replace(strImageFolder,"'","\'")) %>"><%= IGei_dwnaudio %></a></td>
</tr>
</table>
<% Case "avi", "mpg", "mpeg", "mov", "rm", "ram", "swf", "wmv", "qt" %>
<br><br>
<img src="images/file-video1.gif" height="60" width="60" border="0" alt="<%= IGei_dwnvideo %>"><br>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16" height="18"><a href="streamfile.asp?i=<%= URLSpace(strimage) %>&f=<%= URLSpace(Replace(strImageFolder,"'","\'")) %>"><img src="images/xsm-download.gif" height="10" width="13" border="0" alt=""></a></td>
<td nowrap><a class="linksm" href="streamfile.asp?i=<%= URLSpace(strimage) %>&f=<%= URLSpace(Replace(strImageFolder,"'","\'")) %>"><%= IGei_dwnvideo %></a></td>
</tr>
</table>
<% Case Else %>
<br><br>
<img src="images/file-unknown.gif" height="60" width="82" border="0" alt="<%= IGei_unkn %>&nbsp;.<%= UCase(FileExt) %>&nbsp;<%= IGei_f %>"><br>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="14" height="18"><img src="images/xsm-question.gif" height="10" width="13" border="0" alt=""></td>
<td><font class="linksm"><%= IGei_unkn %>&nbsp;.<%= UCase(FileExt) %>&nbsp;<%= IGei_f %></font></td>
</tr>
</table>
<% End Select %>

</td>
<td width="8" nowrap>&nbsp;</td>
<td valign="top">

<form action="editimage.asp?mode=description" method="post" name="description" style="margin-top: 0px; margin-bottom: 0px;">
<input type="hidden" name="Folder" value="<%= strImageFolder %>">
<input type="hidden" name="Image" value="<%= strImage %>">
<table cellspacing="0" cellpadding="0" border="0">

<tr>
<td colspan="2">
<font class="textxsm"><b><%= IGei_title %>:</b></font><br>
<input class="input" style="font-family:arial;font-size:8pt;padding-left:5px;padding-top:2px;" type="text" maxlength=<%= TitleMax %> size=33 name="Title" onKeyDown="textCounter(this.form.Title,this.form.remLen1,<%= TitleMax %>);" onKeyUp="textCounter(this.form.Title,this.form.remLen1,<%= TitleMax %>);" value="<%= strTitle %>"><font class="textxsm">&nbsp;<%= IGei_max %>:<%= TitleMax %></font><input type=hidden name=remLen1><br>
</td>
</tr>

<tr>
<td nowrap><font class="textxsm"><b><%= IGei_desc %>:</b></font></td>
<td nowrap align="right"><font class="textxsm"><%= IGei_maxchar %>&nbsp;</font><input style="font-family:arial;font-size:8pt;width:30px;height: 17px;padding:0px;text-align:center;" type=text name=remLen value="<%= DescMax %>"></td>
</tr>
<tr>
<td colspan="2">
<textarea style="font-family:arial;font-size:8pt;padding-left:5px;height:70px;" name="Description" rows="3" cols="44" wrap="virtual" onKeyDown="textCounter(this.form.Description,this.form.remLen,<%= DescMax %>);" onKeyUp="textCounter(this.form.Description,this.form.remLen,<%= DescMax %>);"><%= strDescription %></textarea><br>
</td>
</tr>
</table>
<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
<input class="button" style="font-size: 8pt; width: 60px;" type="submit" value="<%= IGei_but2 %>">
</form>

</td>
</tr>
<tr>
<td colspan="3"><hr size=1 color=silver></td>
</tr>

<tr>
<td colspan="3">

<form action="editimage.asp?mode=move" method="post" name="delete" style="margin-top: 0px; margin-bottom: 0px;">
<input type="hidden" name="ID" value="<%= strID %>">
<input type="hidden" name="Image" value="<%= strImage %>">
<input type="hidden" name="Folder" value="<%= strImageFolder %>">
<input type="hidden" name="oldDir" value="<%= Replace(fsDir,"/","\") %>">

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><img src="images/sm-moveto.gif" width=25 height=20 border=0 alt=""></td>
<td><font class="text"><%= IGei_move1 %>:&nbsp;&nbsp;</font></td>
</tr>
</table>
<img src="images/spacer.gif" width=1 height=2 border=0 alt=""><br>

</td>

<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<!-- ################ Begin Move Image Select Box ################ -->
<select name="moveDir" class="selectbox">
<option value=""><%= IGei_move2 %> &#187;&#187;</option>
<option value="">-----------------------------------</option>
<%
fCount = 0
CurrentFolder = "XXXXX"
For Each fn In FileList

If CurrentFolder <> fn.Name AND NOT LCase(fn.Name) = "_vti_cnf" Then
CurrentFolder = fn.Name
%>
<option value="<%= LCase(fn) %>\">&#127; &#187; <%= fn.Name %></option>
<%
Set FileList1 = fn.SubFolders
For Each fn1 in FileList1
If NOT LCase(fn1.Name) = "_vti_cnf" Then
%>
<option value="<%= LCase(fn1) %>\">&#127;&#127; &#187; <%= fn1.Name %></option>
<%
End If
Set FileList2 = fn1.SubFolders
For Each fn2 in FileList2
If NOT LCase(fn2.Name) = "_vti_cnf" Then
%>
<option value="<%= LCase(fn2) %>\">&#127;&#127;&#127; &#187; <%= fn2.Name %></option>
<%
End If
Set FileList3 = fn2.SubFolders
For Each fn3 in FileList3
If NOT LCase(fn3.Name) = "_vti_cnf" Then
%>
<option value="<%= LCase(fn3) %>\">&#127;&#127;&#127;&#127; &#187; <%= fn3.Name %></option>
<%
End If
Next
Next
Next

fCount = fCount+1
End If
If CurrentFolder <> "XXXXX" AND fcount > 0 Then
%>
<option value="">-----------------------------------</option>
<%
End If
Next
%>
</select><br>
<!-- ################ End Move Image Select Box ################ -->


</td>
<td><font class="text">&nbsp;&nbsp;<input class="button" style="font-size: 8.5pt;" type="submit" value="<%= IGei_but3 %>"></font></td>
</tr>
</table>
</td>
</tr></form>
</table>

</td>
</tr>
<tr>
<td colspan="3"><hr size=1 color=silver></td>
</tr>

<tr>
<td colspan="3">

<form action="editimage.asp?mode=copy" method="post" name="delete" style="margin-top: 0px; margin-bottom: 0px;">
<input type="hidden" name="ID" value="<%= strID %>">
<input type="hidden" name="Folder" value="<%= strImageFolder %>">
<input type="hidden" name="oldDir" value="<%= Replace(fsDir,"/","\") %>">
<input type="hidden" name="Image" value="<%= strImage %>">
<input type="hidden" name="Title" value="<%= strTitle %>">
<input type="hidden" name="Description" value="<%= strDescription %>">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><img src="images/sm-copyto.gif" width=25 height=20 border=0 alt=""></td>
<td><font class="text"><%= IGei_copy1 %>:&nbsp;&nbsp;</font></td>
</tr>
</table>
<img src="images/spacer.gif" width=1 height=2 border=0 alt=""><br>

</td>

<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<!-- ################ Begin Move Image Select Box ################ -->
<select name="copyDir" class="selectbox">
<option value=""><%= IGei_copy2 %> &#187;&#187;</option>
<option value="">-----------------------------------</option>
<%
fCount = 0
CurrentFolder = "XXXXX"
For Each fn In FileList

If CurrentFolder <> fn.Name AND NOT LCase(fn.Name) = "_vti_cnf" Then
CurrentFolder = fn.Name
%>
<option value="<%= LCase(fn) %>\">&#127; &#187; <%= fn.Name %></option>
<%
Set FileList1 = fn.SubFolders
For Each fn1 in FileList1
If NOT LCase(fn1.Name) = "_vti_cnf" Then
%>
<option value="<%= LCase(fn1) %>\">&#127;&#127; &#187; <%= fn1.Name %></option>
<%
End If
Set FileList2 = fn1.SubFolders
For Each fn2 in FileList2
If NOT LCase(fn2.Name) = "_vti_cnf" Then
%>
<option value="<%= LCase(fn2) %>\">&#127;&#127;&#127; &#187; <%= fn2.Name %></option>
<%
End If
Set FileList3 = fn2.SubFolders
For Each fn3 in FileList3
If NOT LCase(fn3.Name) = "_vti_cnf" Then
%>
<option value="<%= LCase(fn3) %>\">&#127;&#127;&#127;&#127; &#187; <%= fn3.Name %></option>
<%
End If
Next
Next
Next

fCount = fCount+1
End If
If CurrentFolder <> "XXXXX" AND fcount > 0 Then
%>
<option value="">-----------------------------------</option>
<%
End If
Next
%>
</select><br>
<!-- ################ End Move Image Select Box ################ -->

</td>
<td><font class="text">&nbsp;&nbsp;<input class="button" style="font-size: 8.5pt;" type="submit" value="<%= IGei_but4 %>"></font></td>
</tr>
</table>
</td>
</tr></form>
</table>

</td>
</tr>
<tr>
<td colspan="3"><hr size=1 color=silver></td>
</tr>

<tr>
<td colspan="3">

<form action="editimage.asp?mode=delete" method="post" name="delete" style="margin-top: 0px; margin-bottom: 0px;">
<input type="hidden" name="ID" value="<%= strID %>">
<input type="hidden" name="Image" value="<%= strImage %>">
<input type="hidden" name="Folder" value="<%= strImageFolder %>">
<input type="hidden" name="delDir" value="<%= fsDir %>">
<input type="hidden" name="Page" value="<%= strPage %>">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="25"><img src="images/sm-delete1.gif" width=22 height=18 border=0></td>
<td><font class="text"><%= IGei_del1 %><br></font></td>
</tr>
</table>

</td>
<td width="10" nowrap>&nbsp;</td>
<td width="1" bgcolor="silver"></td>
<td width="10" nowrap>&nbsp;</td>
<td>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><font class="text"><%= IGei_del2 %></font></td>
<td><input type="checkbox" name="deleteok"></td>
<td>&nbsp;<input class="button" style="font-size: 8.5pt;" type="submit" value="<%= IGei_but5 %>"></td>
</tr>
</table>

</td>
</tr></form>
</table>

</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>

</td>
</tr>
</table>

<% If Request("msg") <> "" Then %>
<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>
<table align="center" cellspacing="0" cellpadding="0" border="0">
<tr>
<td><img src="images/sm-checkmark.gif" width=16 height=20 border=0></td>
<% If Request("msg") = "desc" Then %>
<td><font style="color:green; font-weight:bold;" class="textmed">&nbsp;<%= IGei_msg1 %></font></td>
<% ElseIf Request("msg") = "rename" Then %>
<td><font style="color:green; font-weight:bold;" class="textmed">&nbsp;<%= IGei_msg2 %></font></td>
<% End If %>
</tr>
</table>
<% End If %>

<% End If %>

</font>

</td>
</tr>

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/footer.asp"--></td>
</tr>

</table>

<p>

<script language="JavaScript" type="text/javascript">
<!-- 
var Today = new Date;
var mm1 = Today.getMonth() + 1;
if (mm1<10){mm1="0"+ mm1;}
var dd1 = Today.getDate();
if (dd1<10){dd1="0"+dd1;}
var yy1= Today.getFullYear();
if((yy1 >= 0) &&  (yy1 < 50)) {yy1=yy1+2000;}
if ((yy1 >= 50) && (yy1<100)){yy1=yy1+1900;}
var hh1= Today.getHours()	
var min1= Today.getMinutes()
var min2 = min1 + 10;
if (min1<10){min1="0"+ min1;}	
var chkDATE1=mm1+ "/" + dd1+ "/" + yy1 + " " + hh1 + ":" + min1;	
if(min2 >= 60) {
hh1=hh1+1;
min2=min2-60;}
if (min2<10){min2="0"+ min2;}		
var chkDATE2=mm1+ "/" + dd1+ "/" + yy1 + " " + hh1 + ":" + min2;			
var AlertMessage = "<%= IG_timeout %>";
var TimeOutMinutes = 1;	
function AlertUser()
{
switch(TimeOutMinutes)
{
case 1:
break;
case 2:
alert(AlertMessage);
break;
default:
break;								
}
TimeOutMinutes++;
setTimeout('AlertUser()', <%= OutMinusTwo %>);
}
AlertUser();
// -->
</script>

</body>
</html>