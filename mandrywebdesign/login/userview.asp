<%
Option Explicit
Dim sql,rsUsers
%>
<!--#include file="conn.asp"-->
<%
sql = "SELECT * FROM users ORDER BY username"
Set rsUsers = Server.CreateObject("ADODB.Recordset")
rsUsers.Open sql, conn, 3, 3
%>

<LINK href="default.css" type=text/css rel=STYLESHEET>
<html>
<head>
<title>User List</title>
</head>
<!--Code generated by Cool Web Scrollbars from Harmony Hollow Software-->
<!--http://www.harmonyhollow.net-->
<STYLE type="text/css">
<!--
BODY {
scrollbar-face-color:#000000;
scrollbar-highlight-color:#000000;
scrollbar-3dlight-color:#FFFFFF;
scrollbar-darkshadow-color:#000000;
scrollbar-shadow-color:#FFFFFF;
scrollbar-arrow-color:#FFFFFF;
scrollbar-track-color:#000000;
}
-->
</STYLE>
<!--End Cool Web Scrollbars code-->


<body bgcolor="#454545" link="#DD0000" vlink="#DD0000" alink="#000000">
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Usu&aacute;rios 
  Cadastrados</font></p>
<font face="arial,helvetica" size=2>
<table cellpadding="2" cellspacing="0" border="0" bordercolor="#B4B4B4" width="100%">
  <%rsUsers.Movefirst
  do until rsUsers.EOF%>
  <tr> 
    <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
      </font><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
      <img src="bp.gif" width="9" height="9"> - <%=rsUsers("username")%></font></td>
  </tr>
  <%rsUsers.Movenext
  loop%>
</table>
</font> 
</body>
</html>

