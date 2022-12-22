<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/globalsets.asp"-->

<%
If LCase(Request("mode")) = "other" Then
' Track Download
strimage 	= Request("i")
strfolder 	= Request("f")
strtime 	= FormatDateTime(igalleryNow,3)
strdate 	= FormatDateTime(igalleryNow,2)
Set CountConn = Server.CreateObject("ADODB.Connection")
Set cRS = Server.CreateObject("ADODB.Recordset")
CountConn.Open strConnect
Set cRS.ActiveConnection = CountConn
cRS.CursorType = adOpenStatic
cSQL = "SELECT ID, imagename, folder, title, description, dateadded, lasttime, lastdate, total FROM Descriptions WHERE imagename='"&strimage&"' AND folder='"&Replace(strfolder,"'","''")&"'"
cRS.Open cSQL,,,adCmdTable
If cRS.recordcount = 0 Then
cRS.AddNew
cRS("imagename") 	= strimage
cRS("folder") 		= strfolder
cRS("dateadded") 	= strdate
cRS("lasttime") 	= strtime
cRS("lastdate") 	= strdate
cRS("total") = 0
End If
cRS("lasttime") 	= strtime
cRS("lastdate") 	= strdate
cRS("total") = CLng(cRS("total")) + 1
cRS.Update
cRS.Close
CountConn.Close
' End Track Downloads
End If

Dim sFilePath, sFileFolder, sFileName, sFullFileName
sFilePath 		= UploadPath
sFileFolder 	= rURLSpace(Request("f"))
sFileFolder		= Replace(sFileFolder,"\'","'")
sFileFolder		= "\"&sFileFolder&"\"
sFileName 		= rURLSpace(Request("i"))
sFileName		= Replace(sFileName,"\'","'")
sFullFileName 	= sFilePath & sFileFolder & sFileName

Response.Contenttype="application/x-unknown"
Response.Addheader "Content-Disposition", "attachment; filename=" & chr(34) & sFileName & chr(34)
Response.Binarywrite GetBinaryFile(sFullFileName)

Function GetBinaryFile(ByVal sFileSpec)
Const adTypeBinary = 1
Dim objStream
Set objStream = Server.Createobject("ADODB.Stream")
objStream.Open
objStream.Type = adTypeBinary
objStream.LoadFromFile sFileSpec
GetBinaryFile = objStream.read
Set objStream = Nothing
End Function
%>