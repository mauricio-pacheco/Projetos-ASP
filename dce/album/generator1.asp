<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/security.inc"-->
<!--#INCLUDE FILE="include/globalsets.asp"-->

<% 
Sub SyncDatabase()

strfolder 	= Request("Folder")
strfolder   = Replace(strfolder,"/","\")
Session(strfolder&"-sync") = 1

ThumbPath = UploadPath &"\"& strfolder

Set FSO 	= CreateObject("Scripting.FileSystemObject") 
Set F 		= FSO.Getfolder(ThumbPath) 
Set FC 		= F.Files 

For Each F1 in FC

On Error Resume Next

strimage1 		= f1.Name
strfolder1 		= Request("folder")
If DateFormat = 1 Then
strdate1			= USDate(igalleryNow)
ElseIf DateFormat = 2 Then
strdate1			= EuroDate(igalleryNow)
Else
strdate1 		= FormatDateTime(igalleryNow,2)
End If

If NOT InStr(f1.Name, "tn-") > 0 Then

Set SyncConn = Server.CreateObject("ADODB.Connection")
Set cRS = Server.CreateObject("ADODB.Recordset")
SyncConn.Open strConnect
Set cRS.ActiveConnection = SyncConn
cRS.CursorType = adOpenStatic

cSQL = "SELECT ID, imagename, folder, title, description, dateadded, lasttime, lastdate, total FROM Descriptions WHERE imagename='"&strimage1&"' AND folder='"&Replace(strfolder1,"'","''")&"'"
cRS.Open cSQL,,,adCmdTable
If cRS.recordcount = 0 Then
cRS.AddNew
cRS("imagename") 	= strimage1
cRS("folder") 		= strfolder1
cRS("dateadded") 	= strdate1
End If
cRS.Update
cRS.Close
SyncConn.Close

End If

Next

Set FSO = Nothing 
Set F 	= Nothing
Set FC 	= Nothing 

response.redirect "igallery.asp?d=\"&URLSpace(strfolder)&"\"

End Sub 

SyncDatabase()  
%>

