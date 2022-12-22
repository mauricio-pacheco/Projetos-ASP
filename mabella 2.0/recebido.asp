<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>&Uacute;ltimas Not&iacute;cias Mabella</TITLE>
<META http-equiv=refresh content=900>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<LINK href="style.css" type=text/css rel=STYLESHEET>
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#F9F4E6 text="#000000" link="#000000" vlink="#000000" alink="#000000" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> </font> 
<div align="center"> 
  <table border="0" cellpadding="3" cellspacing="0" width="100%" bordercolor="#0099CC">
    <%
DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
          DSNtemp=dsntemp & "DBQ=" & server.mappath("journal.mdb")
          sqlstmt = "SELECT * FROM journal ORDER BY id DESC"
          Set rs = Server.CreateObject("ADODB.Recordset")
          rs.Open sqlstmt, DSNtemp, 3, 3
TotalRecs = rs.recordcount
x = 0
For x = 1 to 9999
	If rs.eof then
		Exit For
	Else
		date1 = rs("pdate")
		id = rs("ID")
		name1 = rs("pname")
	  	link = "<a href='view.asp?id=" & id & "' target=_parent>" & name1 & "</a>"
		description = date1
   %>
    <tr> 
      <td width="415"><font color="#000000" size="1" face="Arial, Helvetica, sans-serif"> 
        <% =description%>
        <img src="mar.gif" width="9" height="5">
        <% =link%>
        </font></td>
    </tr>
    <%
rs.MoveNext
End If
Next%>
  </table>
  <p>&nbsp;</p>
</div>
</BODY></HTML>
