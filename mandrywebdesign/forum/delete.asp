<%
if Session("admin")<>"Yes" Then
	Response.redirect("index.asp")
End If
%>
<html>

<head>
<title>Delete Message</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body bgcolor="#000000" text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<!-- #Include File="basics.inc" -->
<!-- #Include file="db.inc" -->
<div align="center">
  <center>

<table border="0" width="701" cellspacing="0" cellpadding="0">
  <tr>
      <td width="18" bgcolor="#000000" valign="top">&nbsp;</td>  
      <td width="315" bgcolor="#000000"><font face="Arial" color="#FFFFFF"><big>Deletar 
        Mensagens </big></font></td>
  </center>

      <td width="315" bgcolor="#000000"> 
        <p align="right"><b><font face="Arial" color="#FFFFFF"><a href="index.asp">Lista 
          T&oacute;picos </a></font></b></td>
  <center>
      <td width="3" bgcolor="#000000" valign="top"> 
        <p align="left">&nbsp;</p>
  </td>

    </tr>
    <tr>
      <td width="18" bgcolor="#000000" valign="top">&nbsp;</td>
      <td width="630" bgcolor="#000000" colspan="2"> 
        <%

messageNo=Request.QueryString("MessageNo")
threadID=Request.QueryString("threadID")

If MessageNo=1 Then
MySql =  "DELETE DistinctRow threads.threadID From threads Where threads.threadID =" & threadID & ";"
deltyp="thread"
Else
MySql =  "DELETE DistinctRow messages.messageNo From messages Where (messages.threadID =" & threadID & ") And messages.MessageNo=" & messageNo & ";"
deltyp="message"
End If

my_Conn.Execute MySql

my_Conn.close
Set my_Conn = Nothing

%>
        <p><font face="Arial"><small>The requested <%=deltyp%> has been deleted. </small></font></p>

<p>&nbsp;</p>
</td>
      <td width="1" bgcolor="#000000" valign="top">&nbsp; </td>
  </tr><tr>
      <td width="28" bgcolor="#000000" valign="top">&nbsp;</td>
      <td width="745" valign="top" bgcolor="#000000" colspan="2"> 
        <p align="center"><font color="#FFFFFF"><b></b></font></p>
 </td>
      <td width="21" bgcolor="#000000" valign="top">&nbsp;</td>
  </tr>
</table>
  </center>
</div>

</body>
</html>
