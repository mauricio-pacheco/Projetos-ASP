<%
Set Conn = Server.CreateObject("ADODB.Connection")
DSNtest="DRIVER={Microsoft Access Driver (*.mdb)}; "
DSNtest=dsntest & "DBQ=" & Server.MapPath("/santa900/santaluz.mdb")
Conn.Open DSNtest
%> 
