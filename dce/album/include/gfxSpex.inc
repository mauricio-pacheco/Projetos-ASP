<%
function GetBytes(flnm, offset, bytes)
Dim objFSO
Dim objFTemp
Dim objTextStream
Dim lngSize
on error resume next
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFTemp = objFSO.GetFile(flnm)
lngSize = objFTemp.Size
set objFTemp = nothing
fsoForReading = 1
Set objTextStream = objFSO.OpenTextFile(flnm, fsoForReading)
if offset > 0 then
strBuff = objTextStream.Read(offset - 1)
end if
if bytes = -1 then
GetBytes = objTextStream.Read(lngSize)
else
GetBytes = objTextStream.Read(bytes)
end if
objTextStream.Close
set objTextStream = nothing
set objFSO = nothing
end function
function lngConvert(strTemp)
lngConvert = clng(asc(left(strTemp, 1)) + ((asc(right(strTemp, 1)) * 256)))
end function
function lngConvert2(strTemp)
lngConvert2 = clng(asc(right(strTemp, 1)) + ((asc(left(strTemp, 1)) * 256)))
end function
function gfxSpex(flnm, width, height, depth, strImageType)
dim strPNG 
dim strGIF
dim strBMP
dim strType
strType = ""
strImageType = "(Unknown)"
gfxSpex = False
strPNG = chr(137) & chr(80) & chr(78)
strGIF = "GIF"
strBMP = chr(66) & chr(77)
strType = GetBytes(flnm, 0, 3)
if strType = strGIF then				' is GIF
strImageType = "GIF"
Width = lngConvert(GetBytes(flnm, 7, 2))
Height = lngConvert(GetBytes(flnm, 9, 2))
Depth = 2 ^ ((asc(GetBytes(flnm, 11, 1)) and 7) + 1)
gfxSpex = True
elseif left(strType, 2) = strBMP then		' is BMP
strImageType = "BMP"
Width = lngConvert(GetBytes(flnm, 19, 2))
Height = lngConvert(GetBytes(flnm, 23, 2))
Depth = 2 ^ (asc(GetBytes(flnm, 29, 1)))
gfxSpex = True
elseif strType = strPNG then			' Is PNG
strImageType = "PNG"
Width = lngConvert2(GetBytes(flnm, 19, 2))
Height = lngConvert2(GetBytes(flnm, 23, 2))
Depth = getBytes(flnm, 25, 2)
select case asc(right(Depth,1))
case 0
Depth = 2 ^ (asc(left(Depth, 1)))
gfxSpex = True
case 2
Depth = 2 ^ (asc(left(Depth, 1)) * 3)
gfxSpex = True
case 3
Depth = 2 ^ (asc(left(Depth, 1)))  '8
gfxSpex = True
case 4
Depth = 2 ^ (asc(left(Depth, 1)) * 2)
gfxSpex = True
case 6
Depth = 2 ^ (asc(left(Depth, 1)) * 4)
gfxSpex = True
case else
Depth = -1
end select
else
strBuff = GetBytes(flnm, 0, -1)
lngSize = len(strBuff)
flgFound = 0
strTarget = chr(255) & chr(216) & chr(255)
flgFound = instr(strBuff, strTarget)
if flgFound = 0 then
exit function
end if
strImageType = "JPG"
lngPos = flgFound + 2
ExitLoop = false
do while ExitLoop = False and lngPos < lngSize
do while asc(mid(strBuff, lngPos, 1)) = 255 and lngPos < lngSize
lngPos = lngPos + 1
loop
if asc(mid(strBuff, lngPos, 1)) < 192 or asc(mid(strBuff, lngPos, 1)) > 195 then
lngMarkerSize = lngConvert2(mid(strBuff, lngPos + 1, 2))
lngPos = lngPos + lngMarkerSize  + 1
else
ExitLoop = True
end if
loop
if ExitLoop = False then
Width = -1
Height = -1
Depth = -1
else
Height = lngConvert2(mid(strBuff, lngPos + 4, 2))
Width = lngConvert2(mid(strBuff, lngPos + 6, 2))
Depth = 2 ^ (asc(mid(strBuff, lngPos + 8, 1)) * 8)
gfxSpex = True
end if
end if
end function
%>