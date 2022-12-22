<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Not&iacute;cias</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<LINK href="default.css" type=text/css rel=STYLESHEET>
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#f6f6f6 text="#000000" link="#000000" vlink="#000000" alink="#000000" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> </font> 
<div align="center"> 
  <p>&nbsp;</p>
  <p><img src="../menornn.gif" width="120" height="109"> </p>
  <p> <font color="#000000">
    <%
id = request.querystring("id")
DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
          DSNtemp=dsntemp & "DBQ=" & server.mappath("journal.mdb")
          sqlstmt = "SELECT * FROM journal where id =" & id & " ORDER BY id DESC"
          Set rs = Server.CreateObject("ADODB.Recordset")
          rs.Open sqlstmt, DSNtemp, 3, 3
TotalRecs = rs.recordcount

		date1 = rs("pdate")
		id = rs("ID")
		name1 = rs("pname")
		p1= rs("pentry")
		
	  	description = p1
   %>
    <br>
    </font></p>
  <div align="center"> 
    <center>
      <table border="0" cellpadding="3" cellspacing="0" width="90%" bordercolor="#0099CC">
        <tr> 
          <td width="627"><font color="#000000" size="2" face="Verdana"><b> 
            <% =name1 %>
            </b> </font></td>
        </tr>
        <tr> 
          <td width="627"><font color="#000000" size="2" face="Verdana">&nbsp;</font> 
            <font color="#000000" size="2" face="Verdana"><br>
            <% =description%>
            </font> <p align="center"><font color="#000000" size="2" face="Verdana"><a href="index.asp">Voltar</a></font></p></td>
        </tr>
      </table>
    </center>
  </div>
  <p>&nbsp; </p>
</div>
</BODY></HTML>
