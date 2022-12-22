<%
function CropIt(chkString,sNum)
if IsNull(chKString) = False And chkString > sNum Then
strTot = Len(chkString)
While Right(chkString, 1) = " "
chkString = Left(chkString, strTot - 1)
strTot = Len(chkString)
Wend
chkString = Left(chkString, sNum)
if Right(chkString, 1) = " " Then
chkString = Left(chkString, sNum - 1)
End if
if Len(chkString) <> strTot Then chkString = chkString & "..."
CropIt = chkString
End if
End function
%>