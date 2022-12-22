<% Option Explicit %>
<!--#include file="functions/functions_chat.asp"-->
<!--#include file="functions/functions_users.asp"-->
<!--#include file="functions/functions_ban.asp"-->
<%
Dim saryMessages
Dim intArrayPass
Dim intTempArrayPass
Dim intLastMessageID
Dim blnShowMessage
Dim blnRecordstoShow

Dim blnFormatText

blnFormatText = CBool(Session("FormatText"))
intLastMessageID = Clng(Session("lastMessage"))
strUsername = Session("Username")
blnRecordstoShow = False

If strUsername = "" OR CheckIfBanned(getIP()) Then Response.End

'Get the array
If IsArray(Application(ApplicationMsg)) Then
	saryMessages = Application(ApplicationMsg)
Else
	ReDim saryMessages(6, 0)

	Application.Lock
	Application(ApplicationMsg) = saryMessages
	Application.UnLock
End If

Response.Write(vbCrLf & "var addHTML = """";")

For intArrayPass = 1 TO UBound(saryMessages, 2)
	'Array Legend
	'0 = Author
	'1 = Message
	'2 = Date
	'3 = Type
	'4 = User ID, 0 = All
	'5 = Message ID

	Dim strAuthor
	Dim strMessage
	Dim dtmDate
	Dim intType
		'0 = Regular Chat
		'1 = Admin Chat
		'2 = New User
		'3 = User Left
		'4 = /me Command
		'5 = Private Message
		'6 = Command Notification
	Dim saryUserMsgTo
	Dim intMsgID

	blnShowMessage = True

	strAuthor = saryMessages(0, intArrayPass)
	strMessage = saryMessages(1, intArrayPass)
	dtmDate = saryMessages(2, intArrayPass)
	intType = saryMessages(3, intArrayPass)
	saryUserMsgTo = saryMessages(4, intArrayPass)
	intMsgID = Clng(saryMessages(5, intArrayPass))

	If isArray(saryUserMsgTo) Then
		blnShowMessage = False

		For intTempArrayPass = 0 TO UBound(saryUserMsgTo)
			If saryUserMsgTo(intTempArrayPass) = strUsername Then
				blnShowMessage = True
			End If
		Next
	End If

	If blnShowMessage AND intMsgID > intLastMessageID Then
		If intType <> 1 Then
			If blnFormatText Then
				strMessage = Replace(strMessage, "\", "\\")
				strMessage = Replace(strMessage, """", "\""")
				strMessage = removeAllTags(strMessage)
				strMessage = FormatMessage(strMessage)
			Else
				strMessage = CleanMessage(strMessage)
			End If
		End If

		strMessage = CheckForLink(strMessage)

		Select Case intType
			Case 0
				Response.Write(vbCrLf & "addHTML += ""<table width=\""100%\""><tr><td><b>" & strAuthor & ":</b> " & strMessage & "</td></tr></table>"";")
				Response.Write(vbCrLf & "NewMSGSound();")
			Case 1
				Response.Write(vbCrLf & "addHTML += ""<table width=\""100%\""><tr><td class=\""consolemessage\"">" & strMessage & "</td></tr></table>"";")
				Response.Write(vbCrLf & "NewMSGSound();")
			Case 2
				Response.Write(vbCrLf & strMessage)

			'PM
			Case 3
				Response.Write(vbCrLf & "addHTML += ""<table width=\""100%\""><tr><td class=\""privatemessage\"">Mensagem De " & strAuthor & ": " & strMessage & "</td></tr></table>"";")
				Response.Write(vbCrLf & "NewMSGSound();")
		End Select

		blnRecordstoShow = True

		intLastMessageID = intMsgID

		Session("lastMessage") = intLastMessageID
	End If
Next

'Extra javascript stuff
If blnRecordstoShow Then
	Response.Write(vbCrLf & "var chatBoxHTML = document.getElementById(""chatBox"");")
	Response.Write(vbCrLf & "chatBoxHTML.innerHTML += addHTML;")
	Response.Write(vbCrLf & "toBottom()")
End If
%>