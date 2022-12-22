<%
SET c = CreateObject("ADODB.Connection")
csl = "DRIVER={Microsoft Access Driver (*.mdb)};"
csl = csl &"DBQ="& Server.MapPath("c_guest2.mdb") &""
c.Open csl
SQLer = "SELECT * from c_guest ORDER BY data"
SET LER = c.EXECUTE(SQLer)
%>
