<%
option explicit'must be declared
response.buffer = true
dim flag
dim bgcolor
%>
<style>
BODY
{
    BACKGROUND-COLOR: white;font-size:14px;font-family:Arial,Verdana;
}
a
{
color:blue;text-decoration:none;
}

a:hover
{
color:red;text-decoration:underline;
}

td
{
font-size:12px;font-family:Arial,Verdana;
}


.inputSubmit
{
font-size:7pt;
color:white;
background-color: black;
BORDER-BOTTOM: 1px solid;
BORDER-LEFT: 1px solid;
BORDER-RIGHT: 1px solid;
BORDER-TOP: 1px solid;
z-index:10;
}

.inputBut
{
font-family:Arial,Verdana;
font-size:10pt;
background-color: white;
BORDER-BOTTOM: 1px solid;
BORDER-LEFT: 1px solid;
BORDER-RIGHT: 1px solid;
BORDER-TOP: 1px solid;
z-index:10;
}

</style>
<script>
function rusure() { 

 if (confirm("Are you sure You want to Delete?")) { 
return true; 
 } else { 

return false; 
 } 
} 
</script>
<!--#include file="config.inc"-->
<%
response.buffer = true
dim useraction,subject,comm,emails,conn,rs,sql
dim id

	Set Conn = Server.CreateObject("ADODB.Connection")
	Set Rs = Server.CreateObject("ADODB.Recordset")
    Conn.Open dsn
    SQL = "SELECT id,emails from emails order by id desc"
	rs.open sql,conn
	if rs.eof and rs.bof then
		response.write "The database is Empty!<br><a href=index.asp>go back</a>"
	else
		response.write "<table>"
		do while not rs.eof
			if flag = 0 then
				flag = 1
				bgcolor = "#F3F3F3"
			else
				flag = 0
				bgcolor = "white"
	end if
			response.write "<tr><td bgcolor=" & bgcolor & ">"
			id = rs("id")
			emails = rs("emails") & "</td><td><a onclick='return rusure()' href='delete.asp?id="& id &"'>Delete User</a></td></tr>"
			response.write emails
		rs.movenext
		loop
		response.write "</table>"
	end if
%>