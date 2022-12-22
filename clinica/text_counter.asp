<%
' Text Hit Counter Example By www.PowerASP.com
	
' Declare variables
Dim ObjCounterFile, ReadCounterFile, WriteCounterFile
Dim CounterFile
Dim CounterHits
	
Set ObjCounterFile = Server.CreateObject("Scripting.FileSystemObject")
	
	CounterFile = Server.MapPath ("counter.txt")	
	
	Set ReadCounterFile= ObjCounterFile.OpenTextFile (CounterFile, 1, True)
	
		If Not ReadCounterFile.AtEndOfStream Then
			CounterHits = Trim(ReadCounterFile.ReadLine)
			If CounterHits = "" Then CounterHits = 0
		Else
			CounterHits = 0
		End If
	
	ReadCounterFile.Close
	Set ReadCounterFile = Nothing
	
	CounterHits = CounterHits + 1
	
	Set WriteCounterFile= ObjCounterFile.CreateTextFile (CounterFile, True)
		WriteCounterFile.WriteLine(CounterHits)
	WriteCounterFile.Close
	Set WriteCounterFile = Nothing
	
Set ObjCounterFile = Nothing
%>

<% =CounterHits %><br>