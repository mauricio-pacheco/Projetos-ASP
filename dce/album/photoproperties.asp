<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/security.inc"-->
<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="include/gfxSpex.inc"-->
<!--#INCLUDE FILE="language/lang_global.inc"-->
<!--#INCLUDE FILE="language/lang_photoproperties.inc"-->

<%
'##### Original Image Size ######
ImagePath 		= UploadPath &"\"& Request("f") &"\" & Request("i")
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
Response.Expires = 0
%>

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<script language="JavaScript1.2" type="text/javascript">
<!--
function imagePopup(url) {
TheNewWin = window.open(url+'&sh='+screen.height+'&sw='+screen.width,'','fullscreen=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no'); 
}
<% If LCase(Request("mode")) = "apply" Then %>
var unloadPop = true;
function Nav() {
unloadPop = false;
window.navigate(arguments[0]);
}
function UnloadTrigger() {
if (unloadPop) {
//window.opener.document.location='editimage.asp?image=<%= URLSpace(Request("Image")) %>&folder=<%= URLSpace(Replace(Request("Folder"),"'","\'")) %>'
window.opener.location.reload(true);
}
}
window.onunload = UnloadTrigger;
<% End If %>
//-->
</script>

<style>
.textxsm {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 7.5pt; 
color: #004835;
}
.textsm {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 8pt; 
color: #504941;
}
.text {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 9pt; 
color: #504941;
}
.textmed {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 10pt; 
color: #504941;
}
.textlg {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 12pt; 
color: #504941;
}

.linkxsm {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 7.5pt; 
color: gray;
}
.linkxsm:hover {
color: #65A2DA;
}
.linksm {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 8pt; 
color: gray;
}
.linksm:hover {
color: #65A2DA;
}
.link {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 9pt; 
color: gray;
}
.link:hover {
color: #65A2DA;
}
.linkmed {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 10pt; 
color: gray;
}
.linkmed:hover {
color: #65A2DA;
}
.linklg {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 12pt; 
color: gray;
}
.linklg:hover {
color: #65A2DA;
}
.selectbox {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 9pt;
}

.input {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 9pt; 
border: solid 1px #706F6B; 
background: #ffffff;
height: 21px;
padding-left: 3px;
padding-top: 1px;
}

.textarea {
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: 9pt; 
border: solid 1px #706F6B; 
padding-left: 3px;
padding-top: 1px;
}
</style>
	
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10" marginwidth="10" marginheight="10">

<% If LCase(Request("mode")) = "adjust" Then %>

<font class="text">
<b><%= IGpp_adj1 %>:</b>&nbsp;
<% If Request("ro") <> "" OR Request("sv") <> "" OR Request("rt") <> "" Then %>
<% If Request("ro") <> "" Then %>
<%= IGpp_adj2 %>&nbsp;<b><%= Request("ow") %> x <%= Request("oh") %></b>&nbsp;<%= IGpp_adj4 %>&nbsp;<b><%= ImageWidth %> x <%= ImageHeight %></b>&nbsp;<%= IGpp_adj4 %>.
<% End If %>
<% If Request("sv") <> "" AND Request("rt") <> "" Then %>
<%= IGpp_shrp1 %>&nbsp;<% If Request("rd")="1" Then %><%= IGpp_shrp2 %><% Else %><%= IGpp_shrp3 %><% End If %>
<% ElseIf Request("sv") <> "" Then %>
<%= IGpp_shrp4 %>
<% ElseIf Request("rt") <> "" Then %>
<%= IGpp_shrp1 %>&nbsp;<% If Request("rd")="1" Then %><%= IGpp_shrp2 %><% Else %><%= IGpp_shrp3 %><% End If %>
<% End If %>
<% Else  %>
<%= IGpp_opmsg1 %>&nbsp;<b><% = ImageWidth %>x<% = ImageHeight %></b>&nbsp;<%= IGpp_opmsg2 %>.&nbsp; <% If ImageWidth > 800 OR ImageHeight > 600 Then %><%= IGpp_opmsg3 %><% Else %><%= IGpp_opmsg4 %><% End If %>
<% End If %>
</font>

<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">

<form action="photoproperties.asp?mode=apply" method="post" name="MainForm">
<input type="hidden" name="Folder" value="<% = Request("f") %>">
<input type="hidden" name="Image"  value="<% = Request("i") %>">
<input type="hidden" name="Width"  value="<% = ImageWidth %>">
<input type="hidden" name="Height" value="<% = ImageHeight %>">

<fieldset style="width: 325px; padding: 10px;">
<legend><font class="textlg"><b><%= IGpp_fldset1 %></b></font></legend>  
<img src="images/spacer.gif" width="1" height="5" border="0"><br>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td class="text" width="120" nowrap><input type="radio" name="ResizeOption" value="1" checked><%= IGpp_frm1 %>&nbsp;</td>
<td>
<select name="Scale" class="textsm" onFocus="document.MainForm.ResizeOption[0].checked=true">
<option value="100"><%= IGpp_frm1a %>
<option value="200" <% If Round((2 * ImageWidth),0) >=700 AND Round((2 * ImageWidth),0) <=900 AND Round((2 * ImageHeight),0) >=400 AND Round((2 * ImageHeight),0) <=600 Then response.write "selected" %>>200% = <%= Response.write(Round((2 * ImageWidth),0)) %>x<%= Response.write(Round((2 * ImageHeight),0)) %>&nbsp;<%= IGpp_frm1b %>
<option value="150" <% If Round((1.5 * ImageWidth),0) >=700 AND Round((1.5 * ImageWidth),0) <=900 AND Round((1.5 * ImageHeight),0) >=400 AND Round((1.5 * ImageHeight),0) <=600 Then response.write "selected" %>>150% = <%= Response.write(Round((1.5 * ImageWidth),0)) %>x<%= Response.write(Round((1.5 * ImageHeight),0)) %>&nbsp;<%= IGpp_frm1b %>
<option value="125" <% If Round((1.25 * ImageWidth),0) >=700 AND Round((1.25 * ImageWidth),0) <=900 AND Round((1.25 * ImageHeight),0) >=400 AND Round((1.25 * ImageHeight),0) <=600 Then response.write "selected" %>>125% = <%= Response.write(Round((1.25 * ImageWidth),0)) %>x<%= Response.write(Round((1.25 * ImageHeight),0)) %>&nbsp;<%= IGpp_frm1b %>
<option value="75"  <% If Round((.75 * ImageWidth),0) >=700 AND Round((.75 * ImageWidth),0) <=900 AND Round((.75 * ImageHeight),0) >=400 AND Round((.75 * ImageHeight),0) <=600 Then response.write "selected" %>>75% = <%= Response.write(Round((.75 * ImageWidth),0)) %>x<%= Response.write(Round((.75 * ImageHeight),0)) %>&nbsp;<%= IGpp_frm1b %>
<option value="50"  <% If Round((.5 * ImageWidth),0) >=700 AND Round((.5 * ImageWidth),0) <=900 AND Round((.5 * ImageHeight),0) >=400 AND Round((.5 * ImageHeight),0) <=600 Then response.write "selected" %>>50% = <%= Response.write(Round((.5 * ImageWidth),0)) %>x<%= Response.write(Round((.5 * ImageHeight),0)) %>&nbsp;<%= IGpp_frm1b %>
<option value="30"  <% If Round((.30 * ImageWidth),0) >=700 AND Round((.30 * ImageWidth),0) <=900 AND Round((.30 * ImageHeight),0) >=400 AND Round((.30 * ImageHeight),0) <=600 Then response.write "selected" %>>30% = <%= Response.write(Round((.30 * ImageWidth),0)) %>x<%= Response.write(Round((.30 * ImageHeight),0)) %>&nbsp;<%= IGpp_frm1b %>
<option value="25"  <% If Round((.25 * ImageWidth),0) >=700 AND Round((.25 * ImageWidth),0) <=900 AND Round((.25 * ImageHeight),0) >=400 AND Round((.25 * ImageHeight),0) <=600 Then response.write "selected" %>>25% = <%= Response.write(Round((.25 * ImageWidth),0)) %>x<%= Response.write(Round((.25 * ImageHeight),0)) %>&nbsp;<%= IGpp_frm1b %>
<option value="20"  <% If Round((.2 * ImageWidth),0) >=700 AND Round((.2 * ImageWidth),0) <=900 AND Round((.2 * ImageHeight),0) >=400 AND Round((.2 * ImageHeight),0) <=600 Then response.write "selected" %>>20% = <%= Response.write(Round((.2 * ImageWidth),0)) %>x<%= Response.write(Round((.2 * ImageHeight),0)) %>&nbsp;<%= IGpp_frm1b %>
<option value="15"  <% If Round((.15 * ImageWidth),0) >=700 AND Round((.15 * ImageWidth),0) <=900 AND Round((.15 * ImageHeight),0) >=400 AND Round((.15 * ImageHeight),0) <=600 Then response.write "selected" %>>15% = <%= Response.write(Round((.15 * ImageWidth),0)) %>x<%= Response.write(Round((.15 * ImageHeight),0)) %>&nbsp;<%= IGpp_frm1b %>
<option value="10"  <% If Round((.1 * ImageWidth),0) >=700 AND Round((.1 * ImageWidth),0) <=900 AND Round((.1 * ImageHeight),0) >=400 AND Round((.1 * ImageHeight),0) <=600 Then response.write "selected" %>>10% = <%= Response.write(Round((.1 * ImageWidth),0)) %>x<%= Response.write(Round((.1 * ImageHeight),0)) %>&nbsp;<%= IGpp_frm1b %>
</select><br>
</td>
</tr>
</table>

<hr size="1" color="silver">

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td class="text" width="120" nowrap><input type="radio" name="ResizeOption" value="2"><%= IGpp_frm2 %>:&nbsp;</td>
<td><input class="textsm" style="height:19px;" type="input" size="10" name="NewWidth"  onfocus="document.MainForm.ResizeOption[1].checked=true">&nbsp;</td>
<td>
<select name="measurement" class="textsm">
<option value="pixels"><%= IGpp_frm2a %></option>
</select>&nbsp;<br>
</td>
<td rowspan="2"><img src="images/pp-linked.gif" width="26" height="29" border="0"></td>
</tr>
<tr>
<td class="text" nowrap><input type="radio" name="ResizeOption" value="3"><%= IGpp_frm3 %>:&nbsp;</td>
<td><input class="textsm" style="height:19px;" type="input" size="10" name="NewHeight" onFocus="document.MainForm.ResizeOption[2].checked = true">&nbsp;</td>
<td>
<select name="measurement" class="textsm">
<option value="pixels"><%= IGpp_frm3a %></option>
</select>&nbsp;<br>
</td>
</tr>
</table>
</fieldset>

<% If NailerApp = 1 OR NailerApp = 2 Then %>
<fieldset style="width: 325px; padding: 10px;">  
<legend><font class="textlg"><b><%= IGpp_frm4 %></b></font></legend>  
<img src="images/spacer.gif" width="1" height="5" border="0"><br>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td class="text" nowrap><input type="checkbox" name="Sharpen" <% if request("Sharpen") <> "" Then Response.Write "CHECKED" %>>Sharpen:&nbsp;</td>
<td nowrap>
<input type="TEXT" class="textsm" style="height:19px;" size="4" name="SharpenValue" value="<% = Request("sharpenvalue")%>" onFocus="document.MainForm.Sharpen.checked = true"><font class="text">&nbsp;<b>%</b></font>&nbsp;<font class="textxsm"><%= IGpp_frm4a %></font><br>
</td>
</tr>
</table>
</fieldset>
<% End If %>

<% If NailerApp = 1 OR NailerApp = 2 Then %>
<fieldset style="width: 325px; padding: 10px;">  
<legend><font class="textlg"><b><%= IGpp_frm5 %></b></font></legend>  
<img src="images/spacer.gif" width="1" height="5" border="0"><br>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td nowrap><input type="radio" name="Rotate" value="1"></td>
<td class="text" nowrap><%= IGpp_frm5a %></td>
<td class="text" nowrap>&nbsp;&nbsp;|&nbsp;</td>
<td nowrap><input type="radio" name="Rotate" value="2"></td>
<td class="text" nowrap><%= IGpp_frm5b %></td>
<td class="text" nowrap>&nbsp;&nbsp;|&nbsp;</td>
<td nowrap><input type="radio" name="Rotate" value="0"></td>
<td class="text" nowrap><%= IGpp_frm5c %></td>
</tr>
</table>
</fieldset>
<% End If %>

</td>
<td width="10" nowrap></td>
<td valign="top">

<img src="images/spacer.gif" width=1 height=9 border=0 alt=""><br>
<font class="textxsm"><%= IGpp_cursize %>: <%= ImageWidth %>x<%= ImageHeight %></font>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
<a class="linksm" href="javascript:void('0');" onClick="imagePopup('viewphoto.asp?i=<%= URLSpace(Request("i")) %>&f=<%= URLSpace(Replace(Request("f"),"'","\'")) %>');"><img style="border: 1px solid gray;" src="<%= URLPath &"/"& Request("f") %>/tn-<%= Request("i") %>" width="<%= strwidth %>" height="<%= strheight %>" border="0" alt="<%= IGpp_viewfi %>"></a><br>
<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16"><img src="images/sm-locate.gif" height="14" width="14" border="0" alt=""></td>
<td><a class="linksm" href="javascript:void('0');" onClick="imagePopup('viewphoto.asp?i=<%= URLSpace(Request("i")) %>&f=<%= URLSpace(Replace(Request("f"),"'","\'")) %>');"><%= IGpp_viewfi %></a></td>
</tr>
</table>
<img src="images/spacer.gif" width=1 height=12 border=0 alt=""><br>
<input class="textsm"  type="submit" name="create" value="<%= IGpp_but %>">

</td>
</tr></form>
</table>

<%
ElseIf LCase(Request("mode")) = "apply" Then

If Request("ResizeOption") <> "" OR Request("SharpenValue") <> "" OR Request("Rotate") <> "" Then

If NailerApp = 1 Then ' ########## ASPJpeg ##########

Set Jpeg = Server.CreateObject("Persits.Jpeg")
jPath = UploadPath &"\"& Request("Folder") &"\"& Request("Image")
Jpeg.Open jPath

' Percentage scaling
If Request("ResizeOption") = 1 Then
Scale = Request("Scale") / 100
Jpeg.Width = Jpeg.OriginalWidth * Scale
Jpeg.Height = Jpeg.OriginalHeight * Scale
End If

' User Specified Width
If Request("ResizeOption") = 2 Then
Jpeg.Width = Request("NewWidth")
Jpeg.Height = Request("NewWidth") * Jpeg.OriginalHeight / Jpeg.OriginalWidth
End If

' User Specified Height
If Request("ResizeOption") = 3 Then
Jpeg.Height = Request("NewHeight")
Jpeg.Width = Request("NewHeight") * Jpeg.OriginalWidth / Jpeg.OriginalHeight
End If

SharpenValue = Request("SharpenValue")
If SharpenValue >= 100 Then
Jpeg.Sharpen 1, SharpenValue
End If

' Rotate Original
If Request("Rotate") = 1 Then 
Jpeg.RotateL
End if
If Request("Rotate") = 2 Then 
Jpeg.RotateR
End If

' Save Image Enhancements
Jpeg.Save jPath

' Rotate Thumbs
If Request("Rotate") = 1 Then 
tPath = UploadPath &"\"& Request("Folder") &"\tn-"& Request("Image")
Jpeg.Open tPath
Jpeg.RotateL
Jpeg.Save tPath
End if
If Request("Rotate") = 2 Then 
tPath = UploadPath &"\"& Request("Folder") &"\tn-"& Request("Image")
Jpeg.Open tPath
Jpeg.RotateR
Jpeg.Save tPath
End if

' Rotate Thumb
If Request("Rotate") = 1 OR Request("Rotate") = 2 Then
Jpeg.Open jPath
Jpeg.Width = 145
Jpeg.Height = 145 * Jpeg.OriginalHeight / Jpeg.OriginalWidth
Jpeg.Save UploadPath &"\"& Request("Folder") &"\tn-"& Request("Image")
End if

ElseIf NailerApp = 2 Then ' ########## ASPJpeg ##########

Set Jpeg = server.createobject("aspimage.image")
jPath = UploadPath &"\"& Request("Folder") &"\"& Request("Image")
Jpeg.loadimage jPath

' Percentage scaling
If Request("ResizeOption") = 1 Then
Scale = Request("Scale") / 100
newWidth  = Jpeg.MaxX * Scale
newHeight = Jpeg.MaxY * Scale
Jpeg.resize newWidth, newHeight
End If

' User Specified Width
If Request("ResizeOption") = 2 Then
newWidth  = Request("NewWidth")
newHeight = Request("NewWidth") * Jpeg.MaxY / Jpeg.MaxX
Jpeg.resize newWidth, newHeight
End If

' User Specified Height
If Request("ResizeOption") = 3 Then
newWidth = Request("NewHeight") * Jpeg.MaxX / Jpeg.MaxY
newHeight = Request("NewHeight")
Jpeg.resize newWidth, newHeight
End If

' Rotate Original
If Request("Rotate") = 1 Then '90 Left
Jpeg.RotateImage 90
End if
If Request("Rotate") = 2 Then '90 Right
Jpeg.RotateImage -90
End If

Jpeg.JPEGQuality = 80
Jpeg.Filename = jPath
Jpeg.SaveImage

' Rotate Thumb
If Request("Rotate") = 1 OR Request("Rotate") = 2 Then
Jpeg.loadimage jPath
intWidth    = Jpeg.MaxX
intHeight   = Jpeg.MaxY
Jpeg.resize 145, 145*intHeight/intWidth
Jpeg.JPEGQuality = 100
Jpeg.Filename = UploadPath &"\"& Request("Folder") &"\tn-"& Request("Image")
Jpeg.SaveImage
End if

ElseIf NailerApp = 3 Then ' ########## CrazyBeaver ##########

strImagerDLL = DllPath
jPath = UploadPath &"\"& Request("Folder") &"\"& Request("Image")

OriginalWidth 	= Request("Width")
OriginalHeight 	= Request("Height")

' Percentage scaling
If Request("ResizeOption") = 1 Then
Scale = Request("Scale") / 100
If OriginalWidth > OriginalHeight Then
newWidth  = Round(OriginalWidth * Scale,0)
Else
newHeight = Round(OriginalHeight * Scale,0)
End If
End If

' User Specified Width
If Request("ResizeOption") = 2 Then
newWidth = Request("NewWidth")
newHeight = Request("NewWidth") * OriginalHeight / OriginalWidth
End If

' User Specified Height
If Request("ResizeOption") = 3 Then
newHeight = Request("NewHeight")
newWidth = Request("NewHeight") * OriginalWidth / OriginalHeight
End If

Set xml = Server.CreateObject("MSXML2.ServerXMLHTTP")
'Set xml = Server.CreateObject("Microsoft.XMLHTTP")
xml.Open "POST", strImagerDLL & "?Image="&jPath&"&Width="&newWidth&"&Height="&newHeight&"&Compression=80", False
xml.Send()
bData = xml.ResponseBody
Set xml = nothing

dim oStream
Set oStream = Server.CreateObject("ADODB.Stream")
oStream.type = 1 'adTypeBinary
oStream.mode = 3 'adModeReadWrite
oStream.open
oStream.write bData
oStream.Position = 0

oStream.SaveToFile(UploadPath &"\"& Request("Folder") &"\ri-"& Request("Image")) 

oStream.Close
Set oStream = Nothing

source_file   = UploadPath &"\"& Request("Folder") &"\ri-"& Request("Image")
target_file   = UploadPath &"\"& Request("Folder") &"\"& Request("Image")
objFSO.CopyFile source_file,target_file, True
objFSO.DeleteFile(source_file)

End If

mq = ""
If Request("ResizeOption") <> "" Then
mq = mq & "&ro=1&ow="&Request("Width")&"&oh="&Request("Height")&""
End If
If Request("SharpenValue") >= "100" Then
mq = mq & "&sv=1&sp="&Request("SharpenValue")&""
End If
If Request("Rotate") <> "" Then
mq = mq & "&rt=1&rd="&Request("Rotate")&""
End if
%>

<SCRIPT LANGUAGE="JavaScript">
<!--
function redirect() {
window.location.href="photoproperties.asp?mode=adjust&i=<%= URLSpace(Request("Image")) %>&f=<%= URLSpace(Replace(Request("Folder"),"'","\'")) & mq %>"
}
setTimeout('redirect()',5000)
// -->
</script>

<img src="images/spacer.gif" width=1 height=7 border=0 alt=""><br>
<img src="images/processing.gif" border="0" alt="">

<% 
Else
response.redirect "photoproperties.asp?mode=adjust&i="& URLSpace(Request("Image")) &"&f="& URLSpace(Replace(Request("Folder"),"'","\'"))
End If
%>

<% End If %>

</body>
</html>
