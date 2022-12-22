<%
' Graphical Hit Counter Example By www.PowerASP.com
	
' Declare variables
Dim ObjCounterFile, ReadCounterFile, WriteCounterFile
Dim CounterFile
Dim CounterHits
Dim FixedDigitCount
Dim DigitCount
Dim DigitCountLength
Dim DigitZerosToAdd
Dim DigitZeroCount
Dim ShowDigits
Dim DigitPath
	
' (FixedDigitCount) will add zeros to the front of your count
' if the count is less then the (FixedDigitCount)
' just like "frontpage" counters let you do
	
FixedDigitCount = 5
DigitPath = "digits/red_on_white"
	
On Error Resume Next
	
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
	
DigitCountLength = Len(CounterHits)
	
If DigitCountLength < FixedDigitCount Then
	DigitZerosToAdd= FixedDigitCount - DigitCountLength
	DigitZeroCount = 1
	For DigitZeroCount = DigitZeroCount to DigitZerosToAdd
		ShowDigits = ShowDigits & "<img src=""" & DigitPath & "/0.gif"" Alt =""" & CounterHits & " Visitors"" >"
	Next
End If
	
DigitCount = 1
For DigitCount = DigitCount to DigitCountLength
	ShowDigits = ShowDigits & "<img src=""" & DigitPath & "/" & Mid(CounterHits,DigitCount,1) & ".gif"" Alt =""" & CounterHits & " Visitors"">"
Next
%>

<% =ShowDigits %><br>