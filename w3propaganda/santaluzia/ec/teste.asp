 <%
DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
          DSNtemp=dsntemp & "DBQ=" & server.mappath("/santa900/santaluz.mdb")
          sqlstmt = "SELECT * FROM liberacao"
          Set rs = Server.CreateObject("ADODB.Recordset")
          rs.Open sqlstmt, DSNtemp, 3, 3
TotalRecs = rs.recordcount

		liberalo = rs("liberar")
		
   %>
   <% =liberalo %>