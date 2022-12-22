<%

Dim SMPConn, DirectConn, strConnect, DBLocation
SMPConn  	 = True 	
DirectConn 	 = False 	

If SMPConn Then

DBLocation = "../dcebd/dcedata.mdb"

strConnect = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ="& Server.MapPath(DBLocation) & ";"

ElseIf DirectConn Then

DBLocation = "../dcebd/dcedata.mdb" ' Passwords

strConnect = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ="& DBLocation & ";"

End if
%>