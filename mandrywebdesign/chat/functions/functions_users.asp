<%
Const ApplicationUsers = "ChatUsers"

Dim saryActiveUsers
Dim strUsername
Dim blnIsArray
Dim strAdminCommand

'Get the username
strUsername = Session("Username")


Function RemoveUnActive()
	'Iterate through the array to remove old entires
	For intArrayPass = 1 To UBound(saryActiveUsers, 2)
		'Check the last checked date. If user wasnt updated 20 seconds ago then they must be gone
		If CDate(saryActiveUsers(5, intArrayPass)) < CDate(CDbl(DateAdd("s", -20, Now()))) Then

			'Post message that the user has left
			Call PostMessage("", saryActiveUsers(1, intArrayPass) & " saiu da sala.", 1)

			'Swap this array postion with the last in the array
			saryActiveUsers(0, intArrayPass) = saryActiveUsers(0, UBound(saryActiveUsers, 2))
			saryActiveUsers(1, intArrayPass) = saryActiveUsers(1, UBound(saryActiveUsers, 2))
			saryActiveUsers(2, intArrayPass) = saryActiveUsers(2, UBound(saryActiveUsers, 2))
			saryActiveUsers(3, intArrayPass) = saryActiveUsers(3, UBound(saryActiveUsers, 2))
			saryActiveUsers(4, intArrayPass) = saryActiveUsers(4, UBound(saryActiveUsers, 2))
			saryActiveUsers(5, intArrayPass) = saryActiveUsers(5, UBound(saryActiveUsers, 2))
			saryActiveUsers(6, intArrayPass) = saryActiveUsers(6, UBound(saryActiveUsers, 2))

			'Remove the last array position as it is no-longer needed
			ReDim Preserve saryActiveUsers(6, UBound(saryActiveUsers, 2) - 1)

			'Exit for loop to prevent errors
			Exit For
		End If
	Next
End Function

Function getIP()
	getIP = Request.ServerVariables("REMOTE_ADDR")
End Function

Function Reset()
	Dim saryMessages
	Dim saryActiveUsers

	ReDim saryMessages(5, 0)
	ReDim saryActiveUsers(6, 0)

	Application.Lock
	Application(ApplicationUsers) = saryActiveUsers
	Application(ApplicationMsg) = saryMessages
	Application.UnLock
End Function

Function LogOut()
	Dim intArrayPass

	Session.Abandon

	saryActiveUsers(5, intArrayPos) = CDbl(DateAdd("s", -30, Now()))

	Call RemoveUnActive()

	'******************************************
	'***   Update application level array	***
	'******************************************
	Application.Lock			'Lock the application
	Application(ApplicationUsers) = saryActiveUsers	'Update the applicaiton
	Application.UnLock			'Unlock the application
End Function

Function CheckUsername(strUsername)
	CheckUsername = False

	Dim intArrayPass
	Dim saryActiveUsers

	'Get the array
	If IsArray(Application(ApplicationUsers)) Then
		saryActiveUsers = Application(ApplicationUsers)
	Else
		ReDim saryActiveUsers(6, 0)
	End If

	For intArrayPass = 1 TO UBound(saryActiveUsers, 2)
		If saryActiveUsers(1, intArrayPass) = strUsername AND saryActiveUsers(3, intArrayPass) <> getIP() Then
			CheckUsername = True
			Exit For
		End If
	Next

	Application.UnLock
End Function
%>