<% Option Explicit %>
<!--#include file="functions/functions_chat.asp"-->
<!--#include file="functions/functions_users.asp"-->
<!--#include file="functions/functions_ban.asp"-->
<%
If Trim(strUsername) = "" OR isNull(strUsername) OR IsEmpty(strUsername) Then
	Session.Abandon

	Response.Write(vbCrLf & "alert('Por Favor Digite seu Nick!');")
	Response.Write(vbCrLf & "parent.location=""default.asp"";")
	Response.End
End If

If CheckIfBanned(getIP()) Then
	Response.Write(vbCrLf & "alert('Seu IP foi proibido!');")
	Response.Write(vbCrLf & "parent.location=""default.asp"";")
	Response.End
End If

Application.Lock

'Get the array
If IsArray(Application(ApplicationUsers)) Then
	saryActiveUsers = Application(ApplicationUsers)
	blnIsArray = True
Else
	blnIsArray = False

	ReDim saryActiveUsers(6, 0)
End If

Dim intArrayPass
Dim intArrayPos
Dim blnUserFound
Dim blnAdmin

blnAdmin = CBool(Session("Admin"))

intArrayPos = 0

blnUserFound = False

For intArrayPass = 1 TO UBound(saryActiveUsers, 2)
	'If saryActiveUsers(3, intArrayPass) = getIP() Then
	If saryActiveUsers(1, intArrayPass) = strUsername Then

		intArrayPos = intArrayPass

		blnUserFound = True

		'Update the user to let the chatroom know they are still active
		saryActiveUsers(0, intArrayPass) = CBool(Session("Admin"))
		saryActiveUsers(1, intArrayPass) = strUsername
		saryActiveUsers(3, intArrayPass) = getIP()
		saryActiveUsers(5, intArrayPass) = CDbl(Now())

		strAdminCommand = saryActiveUsers(6, intArrayPass)

		Exit For
	End If
Next

'Array dimension lookup table
'0 = Access
'1 = Username
'2 = Joined Date
'3 = IP
'4 = Last Post
'5 = Last Active
'6 = Pending Admin Command

If blnUserFound = False Then
	ReDim Preserve saryActiveUsers(6, (UBound(saryActiveUsers, 2) + 1))

	saryActiveUsers(0, UBound(saryActiveUsers, 2)) = 0
	saryActiveUsers(1, UBound(saryActiveUsers, 2)) = strUsername
	saryActiveUsers(2, UBound(saryActiveUsers, 2)) = CDbl(Now())
	saryActiveUsers(3, UBound(saryActiveUsers, 2)) = getIP()
	saryActiveUsers(4, UBound(saryActiveUsers, 2)) = CDbl(Now())
	saryActiveUsers(5, UBound(saryActiveUsers, 2)) = CDbl(Now())
	saryActiveUsers(6, UBound(saryActiveUsers, 2)) = ""

	Call PostMessage("", saryActiveUsers(1, intArrayPass) & " Entrou na Sala.", 1)
End If

Select Case strAdminCommand
	Case "kick"
		Call LogOut()

		Response.Write(vbCrLf & "alert('Você retrocedeu!');")
		Response.Write(vbCrLf & "parent.location=""default.asp"";")
		Response.End
End Select

'Remove the unactive users
Call RemoveUnActive()

Application(ApplicationUsers) = saryActiveUsers

'Javascript stuff
Response.Write(vbCrLf & "var addUsers = ""<u>Total de Usuários: " & UBound(saryActiveUsers, 2) & "</u><br>"";")

For intArrayPass = 1 TO UBound(saryActiveUsers, 2)


	Response.Write(vbCrLf & "addUsers += ""<table width=\""100%\""><tr><td>")

	If saryActiveUsers(0, intArrayPass) = True Then
		Response.Write("<b>" & saryActiveUsers(1, intArrayPass) & "</b>")
	Else
		Response.Write(saryActiveUsers(1, intArrayPass))
	End If

	Response.Write(" - <a onclick=\""insertText('/" & saryActiveUsers(1, intArrayPass) & " ')\"" style=\""cursor: hand;\"" title=\""Private Message User\""><u>PM</u></a>")

	If blnAdmin Then Response.Write("<br><span style=\""font-size:10px;\""><i><a onclick=\""insertText('/kick " & saryActiveUsers(1, intArrayPass) & "')\"" style=\""cursor: hand;\""><u>Usuário Inicial</u></a> - <a onclick=\""insertText('/ban " & saryActiveUsers(3, intArrayPass) & "')\"" style=\""cursor: hand;\""><u>Ban IP</u></a></i></span>")

	Response.Write("</td></tr></table>"";")
Next

Application.UnLock

'Extra javascript stuff
Response.Write(vbCrLf & "var usersBoxHTML = document.getElementById(""usersBox"");")
Response.Write(vbCrLf & "usersBoxHTML.innerHTML = addUsers;")
'Response.Write(vbCrLf & "toBottom()")
%>