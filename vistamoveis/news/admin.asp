<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Not&iacute;cias</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<LINK href="Radio95.9FM_arquivos/default.css" type=text/css rel=STYLESHEET>
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#FFFFFF text="#000000" link="#000000" vlink="#000000" alink="#000000" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> </font> 
<div align="center"> 
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><img src="../menornn.gif" width="120" height="109"> </p>
  <p><font color="#000000" size="3" face="Verdana, Arial, Helvetica, sans-serif">Administra&ccedil;&atilde;o 
    das not&iacute;cias</font></p>
  <p><font color="#000000" size="3" face="Verdana, Arial, Helvetica, sans-serif"><a href="submit.asp">POSTAR 
    NOT&Iacute;CIA</a> </font></p>
  <form method="POST" action="admin.asp?flag=1">
    <font color="#000000"> 
    <%
flag = request.querystring("flag")

if flag = 1 then

If IsEmpty(request.form("ID")) then 

			response.write "<br><br><br><br><br><br><p align=center>"
			response.write "<table border=1 cellpadding=3 cellspacing=0 width=423 bordercolor=#000000><tr><td width=415> <p align=center><font face=Verdana size=2>User Error</font></p></td></tr>"
			response.write "<tr><td width=415 bgcolor=#C0C0C0><p align=center><font face=Verdana size=2>If you want to delete an"
			response.write " entry, check the checkbox<br>Hit the back button and try again.</font></p></td></tr></table>"
			response.end
		
End If
		
set rs = nothing
ID = request.form("ID")
		set conn = server.createobject("adodb.connection")
		DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
    	DSNtemp=dsntemp & "DBQ=" & server.mappath("journal.mdb")
    	conn.Open DSNtemp
		For each record in request("ID")
    		sqlstmt = "DELETE * from journal WHERE ID=" & record
			Set RS = conn.execute(sqlstmt)
		Next

end if
%>
    <br>
    </font> 
    <div align="center"> 
      <center>
        <table border="0" cellpadding="3" cellspacing="0" width="423" bordercolor="#0099CC">
          <%
set rs = nothing
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
		name = rs("pname")
	  	link = "" & date1 & ""
		description = name
   %>
          <tr> 
            <td width="415"><font color="#000000"> 
              <input type="checkbox" name="ID" value="<% =id %>">
              <font face="Verdana" size="2"> 
              <% =link%>
              &nbsp; -- 
              <% =description%>
              </font></font></td>
          </tr>
          <%
rs.MoveNext
End If
Next%>
        </table>
      </center>
    </div>
    <p align="center"> <font color="#000000"> 
      <input type="submit" value="Delete" name="B1">
      <br>
      </font></p>
  </form>
  <p>&nbsp; </p>
</div>
</BODY></HTML>
