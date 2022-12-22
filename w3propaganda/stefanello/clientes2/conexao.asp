<%
Dim wm
Set wm = Server.CreateObject("ADODB.Connection")
wm.Open "Provider=SQLOLEDB.1; Network Library=dbmssocn; Data Source=localhost;" & _
"User ID=stefa; Password=w37001; Initial Catalog=stefanello;"
%>