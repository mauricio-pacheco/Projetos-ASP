<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_global.inc"-->
<!--#INCLUDE FILE="language/lang_submitphotos.inc"-->

<%
Function SendPhoto(comp, mailserv, fromname, fromemail, toname, toemail, subject, image, body)
Dim myMail
On Error Resume Next	
Select Case comp
Case 1 'ASPMail
Set myMail 			= Server.CreateObject("SMTPsvg.Mailer")
myMail.FromName   	= fromname
myMail.FromAddress	= fromemail
myMail.ContentType  = strcontent
myMail.Priority 	= strpriority
myMail.ReturnReceipt= strreceipt
myMail.RemoteHost 	= mailserv
myMail.AddRecipient toname, toemail
myMail.Subject    	= subject
myMail.AddAttachment image
myMail.BodyText   	= body
myMail.SendPhoto
Case 2  'ASPEmail
Set myMail 		= CreateObject("Persits.MailSender") 
myMail.From 	= fromemail
myMail.FromName = fromname
myMail.IsHTML 	= strcontent
myMail.Priority = strpriority
myMail.Host 	= mailserv
myMail.AddAddress toemail
myMail.Subject 	= subject
myMail.AddAttachment image
myMail.Body 	= body
myMail.Send 
Case 3  'CDONTS
Set myMail 			= server.CreateObject("CDONTS.NewMail")
myMail.To 			= toemail
myMail.Value("Reply-To") = fromemail
myMail.From 		= fromemail
myMail.Subject 		= subject
myMail.AttachFile  image
myMail.MailFormat 	= strcontent
myMail.BodyFormat 	= strcontent
myMail.Importance 	= strpriority
myMail.Body = body
myMail.Send
Case 10  'CDOSYS
Set myMail 		= Server.CreateObject("CDO.Message")
myMail.To 		= toemail
myMail.From 	= fromemail
myMail.Subject 	= subject
myMail.HTMLBody = body
myMail.AddAttachment image
myMail.Fields("urn:schemas:httpmail:importance").Value = strpriority
myMail.Fields.Update()
myMail.Send()
End Select
Set myMail = Nothing
If Err Then
SendPhoto = False
Else
SendPhoto = True
End If	
End Function
%>

<%
Private Function FormatImageSize(intFileSize)
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

<%
mode 			= Request.Querystring("mode")

If mode = "send" then

'###### Temp Write For Image Attachment ######
ForWriting = 2
adLongVarChar = 201
lngNumberUploaded = 0
noBytes = Request.TotalBytes 
binData = Request.BinaryRead (noBytes)
Set RST = CreateObject("ADODB.Recordset")
LenBinary = LenB(binData)
If LenBinary > 0 then
RST.Fields.Append "myBinary", adLongVarChar, LenBinary
RST.Open
RST.AddNew
RST("myBinary").AppendChunk BinData
RST.Update
strDataWhole = RST("myBinary")
End If
strBoundry = Request.ServerVariables ("HTTP_CONTENT_TYPE")
lngBoundryPos = instr(1,strBoundry,"boundary=") + 8 
strBoundry = "--" & right(strBoundry,len(strBoundry)-lngBoundryPos)
lngCurrentBegin = instr(1,strDataWhole,strBoundry)
lngCurrentEnd = instr(lngCurrentBegin + 1,strDataWhole,strBoundry) - 1
Do While lngCurrentEnd > 0
strData = mid(strDataWhole,lngCurrentBegin, lngCurrentEnd - lngCurrentBegin)
strDataWhole = replace(strDataWhole,strData,"")
lngBeginFileName = instr(1,strdata,"filename=") + 10
lngEndFileName = instr(lngBeginFileName,strData,chr(34)) 
strFilename = mid(strData,lngBeginFileName,lngEndFileName - lngBeginFileName)
tmpLng = instr(1,strFilename,"\")
Do While tmpLng > 0
PrevPos = tmpLng
tmpLng = instr(PrevPos + 1,strFilename,"\")
Loop
FileName = right(strFilename,len(strFileName) - PrevPos)
lngCT = instr(1,strData,"Content-Type:")
If lngCT > 0 then
lngBeginPos = instr(lngCT,strData,chr(13) & chr(10)) + 4
Else
lngBeginPos = lngEndFileName
End If
lngEndPos = len(strData) 
lngDataLenth = lngEndPos - lngBeginPos
strFileData = mid(strData,lngBeginPos,lngDataLenth)
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile(UploadPath & "\" & FileName, ForWriting, True)
f.Write strFileData
Dim ThisFile
ThisFile = UploadPath & "\" & FileName
lngNumberUploaded = lngNumberUploaded + 1
Set f = Nothing
lngCurrentBegin = instr(1,strDataWhole,strBoundry)
lngCurrentEnd = instr(lngCurrentBegin + 1,strDataWhole,strBoundry) - 1
Loop

'###### Check For Max Upload Breach ######
MaxSize = MaxUploadSize
Set f = fso.GetFile(ThisFile) 
FileSize = f.size

If FileSize <= MaxSize Then

'###### Email Image ######
emailapp 	= EmailApp
emailserver = MailServer
fromname   	= Request.Querystring("fn")
fromaddress = Request.Querystring("fa")
toname   	= IGsp_mail1
toemail  	= MailAddress
image       = ThisFile
photodesc   = Request.Querystring("desc")
strsubject 	= IGsp_mail2

strmessage = 			  "<html>" & vbCrLf
strmessage = strmessage & "<body>" & vbCrLf
strmessage = strmessage & "<font face=arial size=2>" & vbCrLf
strmessage = strmessage & IGsp_mail1&",<p>" & vbCrLf
strmessage = strmessage & IGsp_mail3&"<p>" & vbCrLf
If photodesc <> "" Then
strmessage = strmessage & "<p><b>Photo Description:</b><br>" & vbCrLf
strmessage = strmessage & photodesc & vbCrLf
End If
strmessage = strmessage & "</font>" & vbCrLf
strmessage = strmessage & "</body>" & vbCrLf
strmessage = strmessage & "</html>" & vbCrLf

'###### Fill In The Blanks ######
If emailapp = "1" then
strcontent	= "text/html"
ElseIf emailapp = "2" or emailapp = "4" then
strcontent	= True
ElseIf emailapp = "3" then
strcontent	= "0"
End If
If emailapp = "1" then
strreceipt = False
End If
If emailapp = "1" or emailapp = "2" then
strpriority = "3"
ElseIf emailapp = "3" then
strpriority = "1"
End If

subject 	= strsubject
body 		= strmessage

'###### Send Email, Success and Failure Messages ######
If SendPhoto(emailapp, emailserver, fromname, fromaddress, toname, toemail, subject, image, body) Then
Msg = 		"<font class=""text"">" & vbCrLf
Msg = Msg & IGsp_msg1&"&nbsp;"&fromname&"," & vbCrLf
Msg = Msg & "<p>" & vbCrLf
Msg = Msg & IGsp_msg2 & vbCrLf
Msg = Msg & "<br><br>"&IGsp_msg3&"," & vbCrLf
Msg = Msg & "<br>"& IGsp_msg4 & vbCrLf
Msg = Msg & "</font>" & vbCrLf
Else
msg =       "<font class=""text""><font style=""color: #CC0000""><b>"&IGsp_err1&"!</b></font><br><br>"& IGsp_err2 & vbCrLf
msg = msg & "<p>" & vbCrLf
msg = msg & "<b>"&IGsp_err1&":</b> "&Err.Description&"" & vbCrLf
Msg = Msg & "<br><br>"&IGsp_err5&"," & vbCrLf
Msg = Msg & "<br>"&IGsp_err6 & vbCrLf
Msg = Msg & "</font>" & vbCrLf
End If

Else

msg =       "<font class=""text""><font style=""color: #CC0000""><b>"&IGsp_err1&"!</b></font><br><br>"&IGsp_err3&"&nbsp;<b>["&FormatImageSize(MaxSize)&"]</b>.&nbsp;"&IGsp_err4 & vbCrLf
Msg = Msg & "<br><br>"&IGsp_err5&"," & vbCrLf
Msg = Msg & "<br>"&IGsp_err6 & vbCrLf
Msg = Msg & "</font>" & vbCrLf

End If

fso.DeleteFile ThisFile
Set fso = nothing

End If
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

function attachValue(entered, confirmbox) {
with (entered){
if (value==null || value=="")
{if (confirmbox!="") {alert(confirmbox);} return false;}
else {return true;}
}}

function FileValidation(thisform) {
with (thisform) {
if (file1.value.length == "") {
if (attachValue(file1,"<%= IGsp_alrt1 %>")==false) {file1.focus(); return false;};
}
else{
if (ValFileField(file1,"<%= IGsp_alrt2 %> <%= UCase(AllowedFiles) %>")==false) {file1.focus(); return false;};
}}}

function emailValidation(entered, alertbox) {
with (entered) {
apos=value.indexOf("@"); 
dotpos=value.lastIndexOf(".");
lastpos=value.length-1;
if (apos<1 || dotpos-apos<2 || lastpos-dotpos>3 || lastpos-dotpos<2) 
{if (alertbox) {alert(alertbox);} return false;}
else {return true;}
}}

function confirmValidation(entered, alertbox) {
with (entered) {
subjectlen = value.length;
if (subjectlen == "") {
if (alertbox) {alert(alertbox);} return false;}
else {return true;}
}}

function FormValidation(thisform) {
with (thisform) {
if (confirmValidation(sname,"<%= IGsp_alrt3 %>")==false) {sname.focus(); return false;};
if (emailValidation(semail,"<%= IGsp_alrt4 %>")==false) {semail.focus(); return false;};
}}
// -->
</script>

<script language="JavaScript">
<!--
function textCounter(field, countfield, maxlimit) {
if (field.value.length > maxlimit) {
field.value = field.value.substring(0, maxlimit);}
else {
countfield.value = maxlimit - field.value.length;}
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

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="25"><img src="images/sm-email.gif" width="20" height="24" border=0 alt=""></td>
<td><font class="largeheader"><%= IGsp_titl %></font><br></td>
</tr>
</table>

<img src="images/spacer.gif" width="10" height="10" border="0" alt=""><br>

<font class="text">

<% If EmailApp = "1" OR EmailApp = "2" OR EmailApp = "3" OR EmailApp = "10" Then %>

<% If mode = "send" then %>

<span style="line-height: 17px;" class="text">

<%= msg %>

</span>

<% ElseIf mode = "attach" Then %>

<font class="text">

<%= IGsp_admsg1 %>
<p>
<%= IGsp_admsg2 %><br>

</font>

<img src="images/spacer.gif" width=5 height=10 border=0 alt=""><br>

<hr size="1" color="#EFEFEF">

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">

<%
fromname 		 = Request("sname")
fromaddress 	 = Request("semail")
photodescription = Request("smessage")
If photodescription <> "" Then
photodescription = photodescription
Else
photodescription = IGsp_frm3a
End If
%>

<table cellspacing="0" cellpadding="0" border="0">
<form onsubmit="return FileValidation(this)" enctype="multipart/form-data" action="submitphotos.asp?mode=send&fn=<%= URLSpace(fromname) %>&fa=<%= URLSpace(fromaddress) %>&desc=<%= URLSpace(photodescription) %>&mi=5" method="post">

<tr>
<td height="15" nowrap><font class="text"><i><%= IGsp_frml %>:&nbsp;</i></font></td>
<td><font class="text"><%= fromname %></font></td>
</tr>

<tr>
<td height="30" nowrap><font class="text"><i><%= IGsp_frm2 %>:&nbsp;</i></font></td>
<td><font class="text"><%= fromaddress %></font></td>
</tr>

<tr>
<td height="22" valign="top" nowrap><font class="text"><i><%= IGsp_frm3 %>:&nbsp;</i></font></td>
<td valign="top"><font class="textsm"><%= photodescription %></font></td>
</tr>

<tr>
<td colspan="2">

<hr size="1" color="#EFEFEF">

<font class="textmed">
<B><%= IGsp_step2 %>:</B><br>
</font>

</td>
</tr>

<tr>
<td height="22" nowrap><font class="text"><%= IGsp_frm4 %>:&nbsp;</font></td>
<td>
<input type="file" size="28" class="textsm" name="file1"><br>
</td>
</tr>
<tr>
<td nowrap></td>
<td height="15">
<font class="textxsm"><%= IGsp_frm4a %>: <b><%= FormatImageSize(MaxUploadSize) %></b><br></font>
</td>
</tr>

<tr>
<td colspan="2"><img src="images/spacer.gif" width=5 height=10 border=0 alt=""></td>
</tr>
</table>

<input class="textsm" style="width: 100px;" type="submit" value="<%= IGsp_but1 %>">

<input onClick="javascript:history.go(-1);" class="textsm" style="width: 90px;" type="button" value="<%= IGsp_but2 %>">

</td></form>

</td>
<td width="10"><img src="images/spacer.gif" width="10" height="10" border="0" alt=""></td>
<td width="1" bgcolor="#EFEFEF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
<td width="10"><img src="images/spacer.gif" width="10" height="10" border="0" alt=""></td>
<td valign="top"> 

<font class="textsm">
<B><%= IGsp_pnmsg1 %>:</B><br>
<%= IGsp_pnmsg2 %>&nbsp;<b><%= FormatImageSize(MaxUploadSize) %></b>&nbsp;<%= IGsp_pnmsg3 %>
</font>

</td>
</tr>
</table>

<% Else %>

<font class="text">

<%= IGsp_opnmsg1 %>&nbsp;<b>[<%= FormatImageSize(MaxUploadSize) %>]</b>.&nbsp;<%= IGsp_opnmsg2 %><br>

</font>

<img src="images/spacer.gif" width=5 height=10 border=0 alt=""><br>

<hr size="1" color="#EFEFEF">

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">

<font class="textmed">
<B><%= IGsp_step1 %>:</B><br>
</font>

<table cellspacing="0" cellpadding="0" border="0">
<form onsubmit="return FormValidation(this)" name="emailimage" action="submitphotos.asp?mode=attach&mi=5" method="post">
<tr>
<td nowrap><font class="text"><%= IGsp_frm5 %>:&nbsp;&nbsp;</font></td>
<td>
<input type="text" size="34" class="input" name="sname" value=""><br>
</td>
</tr>
<tr>
<td nowrap></td>
<td height="15">
<font class="textxsm"><%= IGsp_req %><br></font>
</td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGsp_frm6 %>:&nbsp;&nbsp;</font></td>
<td>
<input type="text" size="34" class="input" name="semail" value=""><br>
</td>
</tr>
<tr>
<td nowrap></td>
<td height="15">

<font class="textxsm"><%= IGsp_req %><br></font>

</td>
</tr>

<tr>
<td colspan="2">

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="100%">
<font class="text">
<%= IGsp_frm7 %>:<br>
</font>
</td>
<td align="right">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td nowrap align="right"><font class="textsm"><%= IGsp_max %>:&nbsp;</font><input style="border: 1px solid #EFEFEF;width:18pt;text-align:center;font-size:8pt;color:gray;" readonly type=text name=remLen value="<%= DescMax %>"></td>
</tr>
</table>
</td>
</tr>
</table>

</td>
</tr>
<tr>
<td colspan="2">
<textarea class="textarea" style="width:325px;" name="smessage" rows="5" cols="42" wrap="virtual" onKeyDown="textCounter(this.form.smessage,this.form.remLen,<%= DescMax %>);" onKeyUp="textCounter(this.form.smessage,this.form.remLen,<%= DescMax %>);"></textarea><br>
</td>
</tr>
<tr>
<td colspan="2">

<font class="textxsm"><%= IGsp_frm7a %>
<br></font>

</td>
</tr>

<tr>
<td colspan="2"><img src="images/spacer.gif" width=5 height=10 border=0 alt=""></td>
</tr>
</table>

<input class="textsm" style="width: 110px;" type="submit" value="<%= IGsp_but3 %>">

</td></form>
<td width="10"><img src="images/spacer.gif" width="10" height="10" border="0" alt=""></td>
<td width="1" bgcolor="#EFEFEF"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
<td width="10"><img src="images/spacer.gif" width="10" height="10" border="0" alt=""></td>
<td valign="top"> 

<font class="textsm">
<%= IGsp_xtra %>
</font>

</td>
</tr>
</table>

<% End If %>

<% Else %>

<%= IGsp_apperr %>

<% End If %>

</font>

</td>
</tr>

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/footer.asp"--></td>
</tr>

</table>

<p>

</body>
</html>