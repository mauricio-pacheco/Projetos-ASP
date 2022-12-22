<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<META HTTP-EQUIV="Refresh" CONTENT="10;URL=bannercima1.asp">
<title>Documento sem título</title>
</head>

<body topmargin="0">
<table align="center" width="100%" border="0">
  <tr>
    <td><%
strCaminho = Server.MapPath("/santa900/santaluz.mdb")
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strCaminho & ";"

Set rs = Server.CreateObject("ADODB.Recordset") 
SQL = "SELECT * FROM cima"
rs.Open SQL, objConn,3,3

RANDOMIZE
menor = 1
maior = 3
sorteado = 3

Do While NOT rs.EOF 
   
	%>
    <%
	SELECT Case sorteado
	Case "3"
	 %>
    <a class=home_titulo1000 href="<%=rs("link3")%>"><img src="<%=rs("foto3")%>" border="0" ></a>
	
	<% 
	end select
	  rs.MoveNext
      Loop
	  					 %>
	</td>
  </tr>
</table>
</body>
</html>
