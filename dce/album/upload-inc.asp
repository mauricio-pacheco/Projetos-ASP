<%@ LANGUAGE="VBSCRIPT" %>


<% 
option explicit 
Response.Expires = -1
Server.ScriptTimeout = 600
%>

<!--#INCLUDE FILE="include/security.inc"-->
<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_upload.inc"-->

<!--#INCLUDE FILE="freeaspupload.asp" -->

<%
Dim ImageDir, UploadDir
ImageDir    = Request("D")
UploadDir   = ImageDir

Dim BeaverPath
BeaverPath    = Request("BP")

Dim Directory
Directory = Replace(ImageDir,UploadPath,"")
Directory = Replace(Directory,"\\","\")
Directory = URLSpace(Directory)

Dim BaseDir
BaseDir = Replace(Replace(ImageDir,UploadPath,""),"\","/")
BaseDir	= Replace(BaseDir,"//","/")
BaseDir = Left(BaseDir,Len(BaseDir)-1)
BaseDir = Right(BaseDir,Len(BaseDir)-1)
%>

<%
Function SaveFiles
Dim Upload, fileName, fileSize, ks, fileKey

Set Upload = New FreeASPUpload
Upload.Save(UploadDir)

'###### Failure ######
If Err.Number<>0 then Exit function

SaveFiles = ""
ks = Upload.UploadedFiles.keys

If NOT (UBound(ks) <> -1) Then

SaveFiles = "<table cellspacing=""0"" cellpadding=""0"" border=""0"">"
SaveFiles = SaveFiles & "<tr>"
SaveFiles = SaveFiles & "<td><img src=""images/sm-close.gif"" width=20 height=20 border=0></td>"
SaveFiles = SaveFiles & "<td><font style=""color:#CC0000; font-weight:bold;"" class=""textmed"">&nbsp;"&IGupinc_ferr&"</font></td>"
SaveFiles = SaveFiles & "</tr>"
SaveFiles = SaveFiles & "</table>"
SaveFiles = SaveFiles & "<img src=""images/spacer.gif"" width=1 height=5 border=0 alt=""""><br>"
SaveFiles = SaveFiles & IGupinc_ferrmsg

End If
End Function
%>

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<style>
.text 			{font-family: Arial, Helvetica; font-size: 10pt; color: #000000;}
.textxsm 		{font-family: Verdana, Arial, Helvetica; font-size: 7pt; color: #004835;}
.link 			{font-family: Arial, Helvetica; font-size: 10pt; color: #3078BF;}
.link:hover 	{color: #5090CF;}
.textmed 		{font-family: Arial, Helvetica; font-size: 12pt; color: #000000;}
.linkmed 		{font-family: Arial, Helvetica; font-size: 12pt; color: #3078BF;}
.linkmed:hover 	{color: #5090CF;}
</style>

<script language="JavaScript">
<!--
function OpenPopup(url,pwidth,pheight) {
var leftPos = (screen.availWidth-pwidth) / 2
var topPos = (screen.availHeight-pheight) / 2 
var vpop = window.open(url,'votepop','width=' + pwidth + ',height=' + pheight + ',scrollbars=yes,resizable=no,status=no,toolbar=no,location=no,top=' + topPos + ',left=' + leftPos);
if (window.focus) vpop.window.focus();
}
//-->
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<hr size="1" color="silver">

<font class="text">

<%
response.write SaveFiles()
%>

</font>

</body>
</html>
