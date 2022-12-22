<%

	Dim email, con, data_source, sql_insert, sql_check, rs

	email = Request("email")
   
		If Len(email)    Then

	data_source = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & _ 
	Server.MapPath("mail.mdb")
   
	sql_check = "select email from users where email = '" & email & "'"
	sql_insert = "insert into users( email ) values ('" & email & "')"

'Abre conexão
	Set con = Server.CreateObject("ADODB.Connection")
	con.Open data_source
	Set rs = con.Execute (sql_check, , 1)
   
		If rs.EOF Then
	con.Execute sql_insert
		End If
'fecha conexão
	con.Close
	Set con = Nothing
   
		End If
 %>
