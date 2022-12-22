<%
Response.Buffer = "true"
'########## System Settings Do Not Edit Below This Line... REALLY ##########
%>

<!--#include file = "adovbs.inc"-->
<!--#include file = "connection.inc"-->

<%
Dim SysConn,SysRec,GalleryName,UploadPath,URLPath,NailerApp,DllPath,DateFormat,RecordsPerRow,RecordsPerPage,FoldersPerRow,MaxUploadSize,MailServer,MailAddress,EmailApp,Anonymous,MessageBoard,AllowedFiles,TitleMax,History,Vote,ToolBar,DescMax,Description,SlideShow,DelaySpeed,Transition,StartColor1,EndColor1,StartColor2,EndColor2,TitleColor,DateColor,FullScreen,ViewerBG
Set SysConn 	= Server.CreateObject ("ADODB.Connection")
SysConn.Open strConnect
Set sysRec 		= SysConn.Execute ("SELECT * FROM System;")
GalleryName 	= SysRec("GalleryName")
UploadPath 		= SysRec("UploadPath")
URLPath 		= SysRec("URLPath")
NailerApp 		= SysRec("NailerApp")
DllPath 		= SysRec("DllPath")
DateFormat 		= SysRec("DateFormat")
RecordsPerRow	= sysRec("RecordsPerRow")
RecordsPerPage	= sysRec("RecordsPerPage")
FoldersPerRow	= sysRec("FoldersPerRow")
MaxUploadSize   = SysRec("MaxUpload")
MailServer 		= SysRec("EmailServer")
MailAddress		= SysRec("EmailAddress")
EmailApp		= SysRec("EmailApp")
Anonymous		= SysRec("Anonymous")
MessageBoard	= SysRec("MessageBoard")
AllowedFiles	= SysRec("AllowedFiles")
TitleMax		= SysRec("TitleMax")
History			= SysRec("History")
Vote			= SysRec("Vote")
ToolBar			= SysRec("ToolBar")
DescMax			= SysRec("DescMax")
Description	    = SysRec("Description")
SlideShow		= SysRec("SlideShow")
DelaySpeed		= SysRec("DelaySpeed")
Transition	    = SysRec("Transition")
StartColor1 	= SysRec("StartColor1")
EndColor1  		= SysRec("EndColor1")
DateColor 		= SysRec("DateColor")
StartColor2 	= SysRec("StartColor2")
EndColor2  		= SysRec("EndColor2")
TitleColor 		= SysRec("TitleColor")
FullScreen		= SysRec("FullScreen")
ViewerBG		= SysRec("ViewerBG")

On Error Resume Next

Dim SecurityTimeout
SecurityTimeout = 10 'Amount of time idle before security session expires (MIN = 3)

'########## Do Not Edit Below This Line... REALLY ##########

Dim objFSO
Set objFSO = CreateObject("Scripting.FileSystemObject")

Dim FSO
Set FSO = CreateObject("Scripting.FileSystemObject")

Dim f
Set f = FSO.GetFolder(UploadPath)

Dim fsDir
Set fsDir = FSO.GetFolder(UploadPath)

Dim FileList
Set FileList = f.subFolders

Dim GalleryVersion
GalleryVersion = " "

Dim sAgent, b_IE, b_NN6
Dim ie, nn6
b_IE  = false
b_NN6 = false
sAgent = Request.ServerVariables("HTTP_USER_AGENT")
if (inStr(sAgent,"MSIE")>0) then
b_IE = true
end if
if (inStr(sAgent,"Gecko")>0) then
b_NN6 = true
end if
ie = b_IE
nn6 = b_NN6

Function URLSpace(s)
URLspace = s
URLSpace = Replace(URLSpace," ","+")
URLSpace = Replace(URLSpace,"&","%26")
End Function 'URLSpace

Function rURLSpace(s)
rURLspace = s
rURLSpace = Replace(rURLSpace,"+"," ")
rURLSpace = Replace(rURLSpace,"%26","&")
End Function 'URLSpace

Function fExt(fname)
filename = fname
DotPosition = InStrRev(filename, ".")
fExt = Mid(filename,DotPosition + 1)
fExt = LCase(fExt)
End Function 'File Extension

Dim igalleryNow
igalleryNow = Now

Function EuroDate(MyDate) 
EuroDate = Day(MyDate) & "/" & Month(MyDate) & "/" & mid(Year(MyDate),3,2) 
End Function

Function USDate(MyDate) 
USDate = Month(MyDate) & "/" & Day(MyDate) & "/" & mid(Year(MyDate),3,2) 
End Function

Dim OutMinusTwo
Session.Timeout = SecurityTimeout
OutMinusTwo = (SecurityTimeout-2)*60000

Dim Nailer
If NailerApp="1" OR NailerApp="2" OR NailerApp="3" Then 
Nailer = True
ElseIf NailerApp="4" OR NailerApp="" Then
Nailer = False
NailerApp = 4
End If
%>

<!--#include file = "encryption.inc"-->
<!--#include file = "cropper.inc"-->
<!--#include file = "emailinc.asp"-->