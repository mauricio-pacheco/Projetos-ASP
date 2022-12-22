<%
Dim strBanFile
Dim saryBanList

strBanFile = Server.MapPath("ban.txt")

Function CheckIfBanned(strIP)
	Dim intArrayLoop

	If IsArray(Application("BanList")) = False Then
		saryBanList = GetBanList()
	Else
		saryBanList = Application("BanList")
	End If

	CheckIfBanned = False

	For intArrayLoop = 0 TO UBound(saryBanList)
		If strIP = saryBanList(intArrayLoop) Then
			CheckIfBanned = True
			Exit For
		End if
	Next
End Function

Function BanUser(strIP)
	Dim fso
	Dim stream
	Dim strBanList

	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	Set stream = Nothing

	'Save the text file
	Set stream = fso.OpenTextFile(strBanFile, 2)

	stream.WriteLine(strIP)

	stream.Close

	Set stream = Nothing
	Set fso = Nothing

	'Update the ban list
	Call GetBanList()
End Function

Function UnBanUser(strIP)
	Dim fso
	Dim stream
	Dim strBanList

	Set fso = Server.CreateObject("Scripting.FileSystemObject")

	'Open the file to see if ip is in it
	Set stream = fso.OpenTextFile(strBanFile, 1, True)

	strBanList = stream.ReadAll()

	'If IP not found return false
	If Instr(strBanList, strIP) = 0 Then
		UnBanUser = False

	'If IP found then remove it
	Else
		UnBanUser = True
		strBanList = Replace(strBanList, strIP & vbCrLf, "")
	End If

	stream.Close
	Set stream = Nothing

	'Save the text file
	Set stream = fso.OpenTextFile(strBanFile, 2)

	stream.Write(strBanList)

	stream.Close

	Set stream = Nothing
	Set fso = Nothing

	'Update the ban list
	Call GetBanList()
End Function

Function GetBanList()
	Dim fso
	Dim stream
	Dim strBanList

	strBanList = ""

	Set fso = Server.CreateObject("Scripting.FileSystemObject")

	'Open the file to see if ip is in it
	Set stream = fso.OpenTextFile(strBanFile, 1, True)

	If NOT stream.AtEndOfStream Then strBanList = stream.ReadAll()

	stream.Close

	Set stream = Nothing
	Set fso = Nothing

	If strBanList = "" Then
		saryBanList = Array(0)
	Else
		saryBanList = Split(strBanList, vbCrLf)
	End If

	Application.Lock
	Application("BanList") = saryBanList
	Application.Unlock

	GetBanList = saryBanList
End Function
%>