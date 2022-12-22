<%
CurrentUrl = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("PATH_INFO")
CurrentUrl = CurrentUrl & "?d=" & Request("d") & "&page="

If CurrentPage <> 0 Then
pgHTML = "<td nowrap><a class=""paging"" href=""" & CurrentUrl & CurrentPage-1 & """><b>&#171;Prev</b></a><img src=""images/spacer.gif"" width=""1"" hspace=""2"" height=""1""></td>"
End If

If PageCount > 1 Then

for i = 1 to PageCount		
If NOT (i-1 = CurrentPage) Then

If Int(i/10) = Int(CurrentPage/10) Then

pgHTML = pgHTML & "<td nowrap><a class=""paging"" href=""" & CurrentUrl & i-1 & """>" & i & "</a><img src=""images/spacer.gif"" width=""1"" hspace=""2"" height=""1""></td>"

Else

' Determine last page [ - X] 
If i+9 > PageCount Then
lastx = PageCount
Else
lastx = i+9
If lastx = 10 Then
lastx = 9
End If
End If

pgHTML = pgHTML & "<td nowrap><a class=""paging"" href=""" & CurrentUrl & i & """>[" & i & "-" & lastx & "]</a><img src=""images/spacer.gif"" width=""1"" hspace=""2"" height=""1""></td>"

i = (int(i/10)+1)*10-1
End If

Else

pgHTML = pgHTML & "<td nowrap>"
pgHTML = pgHTML & "<table cellspacing=""0"" cellpadding=""0"" border=""0""><tr>"
pgHTML = pgHTML & "<td style=""background-color: #4F8FCF; border: 1px solid #0C5444; padding-left: 2px; padding-right: 2px; padding-bottom: 1px;"">"
pgHTML = pgHTML & "<font class=""paging"" style=""color: #ffffff""><b>" & i & "</b></font>"
pgHTML = pgHTML & "</td>"
pgHTML = pgHTML & "<td>"
pgHTML = pgHTML & "<img src=""images/spacer.gif"" width=""1"" hspace=""2"" height=""1"">"
pgHTML = pgHTML & "</td></tr>"
pgHTML = pgHTML & "</table>"
pgHTML = pgHTML & "</td>"

End If

Next
End If

If CurrentPage+1 < PageCount Then
pgHTML = pgHTML & "<td nowrap><a class=""paging"" href=""" & CurrentUrl & CurrentPage+1 & """><b>Next&#187;</b></a></td>"
End If
%>
