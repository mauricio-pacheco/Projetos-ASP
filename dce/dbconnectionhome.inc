<%
'Enter the details of your server below
src = Server.MapPath("dcebd/dcedata.mdb")

Set adoCon = Server.CreateObject("ADODB.Connection")
sConnStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & src
adoCon.Open  sConnStr
%>