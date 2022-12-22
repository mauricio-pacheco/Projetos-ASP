<%
Set Conn = Server.CreateObject("ADODB.Connection")
wm="DRIVER={Microsoft Access Driver (*.mdb)}; "
wm=wm & "DBQ=" & Server.MapPath("/santa900/santaluz.mdb")
Conn.Open wm
%> 