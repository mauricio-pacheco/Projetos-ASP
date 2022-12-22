<%
dim id
dim conn
dim sql
id = request.querystring("id")
%>
<!--#include file="config.inc"-->
<%
Set Conn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
    
Conn.Open dsn
    
SQL = "DELETE FROM emails WHERE id="&id
rs.Open SQL, Conn

response.write "<script>alert('deleted!');location.href='edit.asp';</script>"
%>