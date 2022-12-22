<%
Dim ConnectString, conn

ConnectString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("siteusers.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.open ConnectString
%>