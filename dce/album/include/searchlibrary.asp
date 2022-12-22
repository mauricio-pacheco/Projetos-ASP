<%
Function highlight(byval myStr, byval words, byval wordsC, byval color)

myStr = Replace(myStr, "&amp;", chr(244))
myStr = Replace(myStr, "&nbsp;", chr(245))
myStr = Replace(myStr, "&quot;", chr(246))
myStr = Replace(myStr, "&lt;", chr(247))
myStr = Replace(myStr, "&gt;", chr(248))	
myStr = Replace(myStr, "&trade;", chr(153))
myStr = Replace(myStr, "&copy;", chr(169))
myStr = Replace(myStr, "&reg;", chr(174))

Dim regex
Dim ptrn
Dim rStr
rstr = "<SPAN style=""background-color: " & color & """>$1</SPAN>"
Set regEx = New RegExp 
ptrn = "("
for i = 0 to wordsC
ptrn = ptrn & words(i)
if NOT i = wordsC then
ptrn = ptrn & "|"
end if
next
ptrn = ptrn & ")"
regEx.Global = true
regEx.Pattern = ptrn
regEx.IgnoreCase = True
highlight = regEx.Replace(myStr, rStr) 

myStr = Replace(myStr, chr(244), "&amp;")
myStr = Replace(myStr, chr(245), "&nbsp;")
myStr = Replace(myStr, chr(246), "&quot;")
myStr = Replace(myStr, chr(247), "&lt;")
myStr = Replace(myStr, chr(248), "&gt;")
myStr = Replace(myStr, chr(153), "&trade;")
myStr = Replace(myStr, chr(169), "&copy;")
myStr = Replace(myStr, chr(174), "&reg;")	

End Function

Function qhighlight(byval myStr, byval words, byval wordsC, byval color)

myStr = Replace(myStr, "&amp;", chr(244))
myStr = Replace(myStr, "&nbsp;", chr(245))
myStr = Replace(myStr, "&quot;", chr(246))
myStr = Replace(myStr, "&lt;", chr(247))
myStr = Replace(myStr, "&gt;", chr(248))	
myStr = Replace(myStr, "&trade;", chr(153))
myStr = Replace(myStr, "&copy;", chr(169))
myStr = Replace(myStr, "&reg;", chr(174))

Dim index, done, place, oplace
done = false
index = 0
Dim plcA(1000)
Dim plcB(1000)
place = 0
oplace = 0
for i = 0 to wordsC
place = 0
oplace = 0
done = false
myStrlen = len(myStr)
myWordlen = len(words(i))

words(i) = Replace(words(i), "&", chr(244))
words(i) = Replace(words(i), " ", chr(245))
words(i) = Replace(words(i), """", chr(246))
words(i) = Replace(words(i), "<", chr(247))
words(i) = Replace(words(i), ">", chr(248))	

myWord = uCase(words(i))

Do Until done
if len(myWord) then
place = instr(Ucase(Right(myStr, myStrlen-oplace)), myWord)
if place then
oplace = place + oplace
plcA(index) = oplace - 1
plcB(index) = oplace + myWordlen - 1
index = index + 1
else
done = True
exit do
end if
else
done = True
exit do
end if
loop
next

if index then	
Dim tmpA, tmpB, tmindex
tmindex = index-1
for ia = 0 to index-1
keepgoing = False
for ib = 0 to tmindex
if plcA(ib) < plcA(ib+1) then
tmpA = plcA(ib)
plcA(ib) = plcA(ib+1)
plcA(ib+1) = tmpA
tmpB = plcB(ib)
plcB(ib) = plcB(ib+1)
plcB(ib+1) = tmpB
end if
next
tmindex = tmindex -1
next

done = False
ia = 0
Do
if (plcA(ia) <= plcB(ia+1)) then
plcA(ia) = plcA(ia+1)
if 	plcB(ia) < plcB(ia+1) then
plcB(ia) = plcB(ia+1)
end if

for i = ia + 1 to index
plcA(i) = plcA(i+1)
plcB(i) = plcB(i+1)
next
index = index - 1
else
ia = ia + 1 
end if
loop until ia = index

i = 0
do
myStr = left(myStr, plcB(i)) & "</SPAN>" & Right(myStr, len(myStr)-plcB(i))
myStr = left(myStr, plcA(i)) & "<SPAN style=""background-color: " & color & """>" & Right(myStr, len(myStr)-plcA(i))	
i = i + 1
loop until i > index

end if

myStr = Replace(myStr, chr(244), "&amp;")
myStr = Replace(myStr, chr(245), "&nbsp;")
myStr = Replace(myStr, chr(246), "&quot;")
myStr = Replace(myStr, chr(247), "&lt;")
myStr = Replace(myStr, chr(248), "&gt;")
myStr = Replace(myStr, chr(153), "&trade;")
myStr = Replace(myStr, chr(169), "&copy;")
myStr = Replace(myStr, chr(174), "&reg;")	

highlight = myStr
End Function

Function parsethis( byval myStr, byref myArray ,byref myCount , fields)

Dim done
Dim doneb
Dim pluson
Dim mySQL
Dim i
Dim quotes(1000)
Dim attribs(100)
Dim qcount
Dim tNum
Dim otNum
Dim takenout
takenout = 0
myCount = -1
qcount = -1
tNum = 0
otNum = 0
i = 0
pluson = False
done = False

While NOT done
tNum = instr(Right(myStr, len(myStr)-otNum), """") 
if tNum then
qcount = qcount + 1
quotes(qcount) = tNum+otNum
otNum = tNum+otNum
else
done = True
end if
wend

myStr = Replace(myStr, """", " ")

Dim onemore
onemore = 0	
for i = 0 to qcount
onemore = 0

if i = qcount then

else
quotes(i) = quotes(i) - takenout
quotes(i+1) = quotes(i+1) - takenout
difference = quotes(i+1)-quotes(i)
if difference > 1 then
myCount = myCount + 1
myArray(myCount) = mid(myStr, quotes(i)+1, difference-1)

if quotes(i)-1 > 0 then
if mid(myStr, quotes(i)-1, 1) = "+" then
attribs(myCount) = "+"
pluson = True
onemore = 1
elseif mid(myStr, quotes(i)-1, 1) = "-" then
attribs(myCount) = "-"
onemore = 1
end if	
end if

myStr = left(myStr, quotes(i)-1-onemore) & right(myStr, len(myStr)-quotes(i+1)+1)
takenout = takenout + ( quotes(i+1)-quotes(i)+1 )
end if
i = i + 1
end if 
next

Dim dist
lastpos = 1
dist = 1
Dim tmpword

for i = 1 to len(myStr)
If mid(myStr, i, 1) = " " Then 
if i > 1 then
if NOT mid(myStr, i-1, 1) = " " then
myCount = myCount + 1	
tmpword = trim(mid(myStr, lastpos, dist))
if left(tmpword, 1) = "+" AND (NOT mid(tmpword, 2,1) = "") then
attribs(myCount) = "+"
pluson = True
tmpword = right(tmpword, len(tmpword)-1)
elseif left(tmpword, 1) = "-" AND (NOT mid(tmpword, 2,1) = "") then
attribs(myCount) = "-"
tmpword = right(tmpword, len(tmpword)-1)
end if
words(myCount) = tmpword
lastpos = lastpos + dist
dist = 0
end if
end if
End If
dist = dist + 1

if i = len(myStr) AND NOT mid(myStr, i, 1) = " " then
myCount = myCount + 1
tmpword = trim(mid(myStr, lastpos, dist))
if left(tmpword, 1) = "+" AND (NOT mid(tmpword, 2,1) = "") then
attribs(myCount) = "+"
pluson = True
tmpword = right(tmpword, len(tmpword)-1)
elseif ( left(tmpword, 1) = "-" ) AND ( NOT mid(tmpword, 2,1) = "" ) then
attribs(myCount) = "-"
tmpword = right(tmpword, len(tmpword)-1)
end if
words(myCount) = tmpword
end if
next


Dim tmpA, tmpB, tmindex
tmindex = wCount
for ia = 0 to wCount
for ib = 0 to tmindex
if attribs(ib) < attribs(ib+1) then
tmpA = attribs(ib)
attribs(ib) = attribs(ib+1)
attribs(ib+1) = tmpA
tmpB = words(ib)
words(ib) = words(ib+1)
words(ib+1) = tmpB
end if
next
tmindex = tmindex -1
next

done = False
doneb = False

Dim firstneg
Dim dopand
Dim doand
doand = False
dopand = False
firstsig = True
Dim cursign
cursign = attribs(0)
for i = 0 to wCount
tmpword = replace(words(i), "'", "''")

if cursign = "" AND ( NOT pluson ) then
if dopand then
dopand = False
mySQL = mySQL & " OR "
end if
if firstsig then
mySQL = mySQL & " ( "
firstsig = False
end if
mySQL = mySQL & " ( "
for ia = 1 to fields
mySQL = mySQL & "<FIELD" & ia & "> LIKE '%" & tmpword & "%' "
if NOT ia = fields then
mySQL = mySQL & "OR "
end if
next
mySQL = mySQL & " ) "
if i = wCount then
mySQL = mySQL & " ) "
else	
dopand = True
end if				
end if			

if cursign = "+" then
if dopand then
dopand = False
mySQL = mySQL & " AND "
end if
if firstsig then
mySQL = mySQL & " ( "
firstsig = False
end if
mySQL = mySQL & " ( "
for ia = 1 to fields
mySQL = mySQL & "<FIELD" & ia & "> LIKE '%" & tmpword & "%' "
if NOT ia = fields then
mySQL = mySQL & "OR "
end if
next
mySQL = mySQL & " ) "
if NOT attribs(i+1) = "+" then
cursign = attribs(i+1)
firstsig = True
mySQL = mySQL & " ) "
else
dopand = True
end if
end if		

if cursign = "-" then
if dopand then
dopand = False
mySQL = mySQL & " OR "
end if			
if firstsig then
mySQL = mySQL & "( NOT ("
firstsig = False
end if
for ia = 1 to fields
mySQL = mySQL & "<FIELD" & ia & "> LIKE '%" & tmpword & "%' "
if NOT ia = fields then
mySQL = mySQL & "OR "
end if
next
if NOT attribs(i+1) = "-" then
cursign = attribs(i+1)
firstsig = True
mySQL = mySQL & " ) ) "
doand = True
else
dopand = True			
end if
if doand then
mySQL = mySQL & " AND "				
doand = False
end if

end if

next

parsethis = mySQL
End Function
%>