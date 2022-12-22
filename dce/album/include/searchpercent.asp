<%
For i = 1 to len(strText)
If mid(strText, i, 1) = " " Then
WordCounter = WordCounter + 1
End If
Next
WordCounter = WordCounter + 1
Dim Word(100)
CurrentWord = 1
For i = 1 to len(strText)
If mid(myquery, i, 1) = " " Then
CurrentWord = CurrentWord + 1
Else
Word(CurrentWord) = Word(CurrentWord) + mid(strText, i, 1)
End If
Next
For i = 1 to WordCounter

abcnt = 0
do until abcnt = 1
abcnt = abcnt + 1
ab = ab & "(Abs(InStr("&SearchDbTable1&"+"&SearchDbTable2&"+"&SearchDbTable3&",'" & word(i) & "')>0) / " & wordcounter & ")"
ab = replace(ab, ")(", ")+(")
loop
Next 
%>