<%
dbf=Server.MapPath(dbName)
set my_conn= Server.CreateObject("ADODB.Connection")
my_Conn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" + dbf
%>