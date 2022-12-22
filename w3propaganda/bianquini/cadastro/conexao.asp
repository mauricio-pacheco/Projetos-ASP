<%
Dim wm
Set wm = Server.CreateObject("ADODB.Connection")
wm.Open "Provider=SQLOLEDB.1; Network Library=dbmssocn; Data Source=localhost;" & _
"User ID=bianq; Password=bi7002; Initial Catalog=bianquini;"
%>