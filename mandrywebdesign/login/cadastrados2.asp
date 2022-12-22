<%
Option Explicit
Dim sql,rsUsers

if Request.Cookies("philoginadmin") = "True" then
%>
<!--#include file="conn.asp"-->
<%
sql = "SELECT * FROM users ORDER BY username"
Set rsUsers = Server.CreateObject("ADODB.Recordset")
rsUsers.Open sql, conn, 3, 3
%>
<STYLE type="text/css">
<!--
BODY {
scrollbar-face-color:#0080C0;
scrollbar-highlight-color:#0080C0;
scrollbar-3dlight-color:#454545;
scrollbar-darkshadow-color:#454545;
scrollbar-shadow-color:#454545;
scrollbar-arrow-color:#FFFFFF;
scrollbar-track-color:#454545;
}
-->
</STYLE>

<html>
<head>

<script language="JavaScript">
<!-- hide on

function popup(popupfile,winheight,winwidth,scrolls)
{
open(popupfile,"PopupWindow","resizable=no,height=" + winheight + ",width=" + winwidth + ",scrollbars=no" + scrolls);
}

// hide off -->
</script>

<title>Philogin User List</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="default.css" type=text/css rel=STYLESHEET>
<body bgcolor="#454545" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size="2"> <font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%if not rsUsers.EOF then%>
</font> 
<table cellpadding="2" cellspacing="0" border="0" bordercolor="#B4B4B4" width="100%">
  <%rsUsers.Movefirst
do until rsUsers.EOF%>
  <tr> 
    <td><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><img src="radio.gif" width="16" height="16"> 
      - <%=rsUsers("username")%></font></td>
  </tr>
  <%rsUsers.Movenext
loop%>
</table>
<font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%else%>
</font><font color="#FFFFFF"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%end if%>
<%else
Response.Redirect("philogin_admin.asp")
end if%>
</font></font> </font> 
</body>
</html>

<%
rsUsers.close
set rsUsers = nothing
conn.close
set conn = nothing
%>
