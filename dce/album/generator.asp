<%@ LANGUAGE="VBSCRIPT" %>


<!--#INCLUDE FILE="include/security.inc"-->
<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="include/gfxSpex.inc"-->

<% 
Server.ScriptTimeout = 3600
Sub GenerateThumbs()

strfolder 	= Request("Folder")
strfolder   = Replace(strfolder,"/","\")
Session(strfolder&"-repair") = 1

ThumbPath = UploadPath &"\"& strfolder

Set FSO 	= CreateObject("Scripting.FileSystemObject") 
Set F 		= FSO.Getfolder(ThumbPath) 
Set FC 		= F.Files 

Dim strImagerDLL
strImagerDLL = DllPath

For Each F1 in FC

On Error Resume Next

FileExt = fExt(F1)
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png"

If NOT InStr(F1, "tn-") > 0 AND NOT (FSO.FileExists(ThumbPath&"\tn-"&f1.Name)) Then
If NailerApp=1 Then
Set Jpeg = Server.CreateObject("Persits.Jpeg")
OriginalPath = ThumbPath&"\"&f1.Name
Jpeg.Open OriginalPath

Jpeg.Width = 145
If Jpeg.OriginalWidth > Jpeg.OriginalHeight Then
Jpeg.Height = 145 * Jpeg.OriginalHeight / Jpeg.OriginalWidth
Else
Jpeg.Height = 145 * Jpeg.OriginalWidth / Jpeg.OriginalHeight
End if

Jpeg.Save ThumbPath&"\tn-"&f1.Name
ElseIf NailerApp=2 Then
Set Jpeg = server.createobject("aspimage.image")
OriginalPath = ThumbPath&"\"&f1.Name
Jpeg.loadimage OriginalPath
intWidth    = Jpeg.MaxX
intHeight   = Jpeg.MaxY

If intWidth > intHeight Then
Jpeg.resize 145, 145*intHeight/intWidth
Else
Jpeg.resize 145, 145*intWidth/intHeight
End if

Jpeg.ImageFormat = 1
Jpeg.JPEGQuality = 80
Jpeg.Filename=ThumbPath&"\tn-"&f1.Name
Jpeg.SaveImage
ElseIf NailerApp=3 Then

OriginalPath = ThumbPath&"\"&f1.Name

newWidth  = 145
If gfxSpex(OriginalPath, intWidth, intHeight, colors, strType) = True Then
If intWidth > intHeight Then
newHeight = 145*intHeight/intWidth
Else
newHeight = 145*intWidth/intHeight
End If
End If

Set xml = Server.CreateObject("MSXML2.ServerXMLHTTP")
'Set xml = Server.CreateObject("Microsoft.XMLHTTP") ' Optional
xml.Open "POST", strImagerDLL & "?Image="&OriginalPath&"&Width="&newWidth&"&Height="&newHeight&"&Compression=80", False
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
oStream.SaveToFile(ThumbPath&"\tn-"&f1.Name) 
oStream.Close
Set oStream = Nothing

ElseIf NailerApp=4 Then
End If
End If

End Select

Next

Set FSO = Nothing 
Set F 	= Nothing
Set FC 	= Nothing 

response.redirect "igallery.asp?d=\"&URLSpace(strfolder)&"\"

End Sub 

GenerateThumbs()  
%>

