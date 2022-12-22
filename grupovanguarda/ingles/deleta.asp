<%
  
		Dim email, con, data_source, sql_delete

	email = Request("email_deleta")
	sql_delete = "delete email from users where email = '" & email & "'"
	data_source = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & _ 
	Server.MapPath("mail.mdb")
		Set con = Server.CreateObject("ADODB.Connection")
	con.Open data_source
	con.Execute sql_delete
	con.Close
		Set con = Nothing
   
   
%>