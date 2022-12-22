<%
mq = ""
If Request("d") <> "" OR Request("folder") <> "" Then
If Request("d") <> "" Then
mq = "&d="&URLSpace(Request("d"))
ElseIf Request("folder") <> "" Then
mq = "&folder="&URLSpace(Request("folder"))
End if
If Request("image") <> "" Then
mq = mq & "&image="&URLSpace(Request("image"))
End If
If Request("page") <> "" Then
mq = mq & "&page="&URLSpace(Request("page"))
End If
End If

If Session("userLevel") < 99 Then Response.Redirect "login.asp?n="& Request.ServerVariables("SCRIPT_NAME")& mq
If Session("userLevel") > 99 Then Response.Redirect "login.asp?n="& Request.ServerVariables("SCRIPT_NAME")& mq
%>