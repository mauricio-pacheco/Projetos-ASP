<% 
if not fso.FolderExists(UploadPath) then
response.redirect "system-firsttime.asp"
end if
fileName = UploadPath & "\dbtest.txt"
on error resume next
Set testFile = fso.CreateTextFile(fileName, true)
If Err.Number<>0 then
response.redirect "system-firsttime.asp"
end if
Err.Clear
testFile.Close
fso.DeleteFile(fileName)
If Err.Number<>0 then
response.redirect "system-firsttime.asp"
end if
Err.Clear
Set streamTest = Server.CreateObject("ADODB.Stream")
If Err.Number<>0 then
response.redirect "system-firsttime.asp"
end if
Set streamTest = Nothing
%>