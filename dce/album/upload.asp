<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/security.inc"-->
<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_global.inc"-->
<!--#INCLUDE FILE="language/lang_upload.inc"-->

<%
Function FormatImageSize(intFileSize)
const DecimalPlaces = 1
const FileSizeBytes = 1
const FileSizeKiloByte = 1024
const FileSizeMegaByte = 1048576
const FileSizeGigaByte = 1073741824
const FileSizeTeraByte = 1099511627776
Dim strFileSize, newFilesize
If (Int(intFileSize / FileSizeTeraByte) <> 0) Then
newFilesize = Round(intFileSize / FileSizeTeraByte, DecimalPlaces)
strFileSize = newFilesize & " TB"
ElseIf (Int(intFileSize / FileSizeGigaByte) <> 0) Then
newFilesize = Round(intFileSize / FileSizeGigaByte, DecimalPlaces)
strFileSize = newFilesize & " GB"
ElseIf (Int(intFileSize / FileSizeMegaByte) <> 0) Then
newFilesize = Round(intFileSize / FileSizeMegaByte, DecimalPlaces)
strFileSize = newFilesize & " MB"
ElseIf (Int(intFileSize / FileSizeKiloByte) <> 0) Then
newFilesize = Round(intFileSize / FileSizeKiloByte, DecimalPlaces)
strFileSize = newFilesize & " KB"
ElseIf (Int(intFileSize / FileSizeBytes) <> 0) Then
newFilesize = intFilesize
strFileSize = newFilesize & " Bytes"
ElseIf Int(intFileSize) = 0 Then
strFilesize = 0 & " Bytes"
End If
FormatImageSize = strFileSize
End Function
%>

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<script language="JavaScript1.2" type="text/javascript">
<!--
function ValFileField(entered, alertbox) {
with (entered){
ext=value.substr(value.lastIndexOf(".")).toLowerCase();
if (
<%
AllowedFiles 	= Replace(AllowedFiles,",",", ")
strallowedfiles = Replace(AllowedFiles,", ",",")
strallowedfiles = Replace(strallowedfiles," ,",",")
strallowedfiles = Split(strallowedfiles,",")
For a1 = LBound(strallowedfiles) To UBound(strallowedfiles)
response.write "ext!=""."&strallowedfiles(a1)&""" "&chr(38)&chr(38)&"" & VBCRLF
Next
%>ext!=""
){
if (alertbox!="") {
alert(alertbox);
}
return false;
}
else {
return true;
}}}

// Value Validation
function attachValue(entered, confirmbox) {
with (entered){
if (value==null || value=="")
{if (confirmbox!="") {alert(confirmbox);} return false;}
else {return true;}
}}

function FileValidation(thisform) {
with (thisform) {
if (Attachment.value.length == "") {
if (attachValue(Attachment,"<%= IGupld_warn1 %>")==false) {Attachment.focus(); return false;};
}
else{
if (ValFileField(Attachment,"<%= IGupld_warn2 %> <%= UCase(AllowedFiles) %>")==false) {Attachment.focus(); return false;};
}}}

function setScripts() {
self.name = 'igallery';
}
window.onload = setScripts;
//-->
</script>

<link rel="stylesheet" type="text/css" href="style/style.css">

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10" marginwidth="10" marginheight="10">

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

<font class="text">

<%
ImageDir    = UploadPath&"\"&Request("D")
UploadDir   = ImageDir

DisplayFolder = Request("D")
DisplayFolder = Left(DisplayFolder,Len(DisplayFolder)-1)
DisplayFolder = Right(DisplayFolder,Len(DisplayFolder)-1)
%>

<form onSubmit="return FileValidation(this)" name="imageUpload" method="POST" enctype="multipart/form-data" action="upload-inc.asp?D=<%= URLSpace(ImageDir) %>&BP=<%= URLSpace(DllPath) %>" target="upload">

<table width="510" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="28"><img src="images/lg-image.gif" width=24 height=32 border=0 alt=""></td>
<td><font class="largeheader"><%= IGupld_upimg %></font></td>
</tr>
</table>

</td>
<td align="right">

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="20"><img src="images/spacer.gif" width="1" height="2"><br><a class="linkmed" href="igallery.asp?D=<%= URLSpace(ImageDir) %>\"><img src="images/sm-return.gif" width="18" height="18" border="0"></a></td>
<td><a class="link" href="igallery.asp?D=<%= URLSpace(Request("D"))  %>"><b><%= IGupld_rtn %></b></a></td>
</tr>
</table>

</td>
</tr>
</table>

<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<font class="text">
<%= IGupld_msg %><br>
</font>

<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>

<table align="center" cellspacing="0" cellpadding="0" border="0">
<tr>
<td><img src="images/folder-open.gif" width=30 height=32 border=0 alt=""></td>
<td><font class="textmed">&nbsp;<b><%= DisplayFolder %></b></font><br></td>
</tr>
</table>

<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>

<script language="JavaScript1.2" type="text/javascript">
<!--
function Reset1(url) {
window.open(url,"upload");
}
// -->
</script>

<table align="center" cellspacing="0" cellpadding="1"><tr>
<td>

<font size="1">
<input type="file" name="Attachment" size="40">
</font>

</td>
<td><input style="font-size: 8.5pt;" type="submit" value="<%= IGupld_but1 %>"></td>
<td><input onClick="Reset1('blank.asp')" style="font-size: 8.5pt;" type="reset" value="<%= IGupld_but2 %>"></td>
</tr>
</table>

<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>

<table cellspacing="0" cellpadding="1" border="0">
<tr>
<td nowrap><font face="Verdana" size="1"><b><%= IGupld_aft %>:&nbsp;&nbsp;</font></td>
<td nowrap><font face="Verdana" size="1"><%= UCase(AllowedFiles) %></font></td>
</tr>
<tr>
<td nowrap><font face="Verdana" size="1"><b><%= IGupld_mus %>:&nbsp;&nbsp;</font></td>
<td nowrap><font face="Verdana" size="1"><%= FormatImageSize(MaxUploadSize) %></font></td>
</tr></form>
</table>

<iframe name="upload" src="blank.asp?DN=yes&D=<%= URLSpace(ImageDir) %>" width="530" height="200" frameborder="0" scrolling="no"></iframe> 

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