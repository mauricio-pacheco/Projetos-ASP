<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Administra&ccedil;&atilde;o dos pedidos R&aacute;dio Luz e Alegria</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<LINK href="Radio95.9FM_arquivos/default.css" type=text/css rel=STYLESHEET>
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#EAEDF4 text="#000000" link="#000000" vlink="#000000" alink="#000000" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> </font> 
<div align="center"> 
  <p>&nbsp;</p>
  <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Administra&ccedil;&atilde;o 
    dos pedidos</font></p>
  <p> 
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
  </p>
  <p><img src="fundofm.jpg" width="84" height="61"> </p>
  <div align="center"> 
    <center>
      <table width="643" border="0" align="center" cellpadding="3" cellspacing="0" bordercolor="#000000">
        <tr> 
          <td width="637"><font color="#000000" size="1" face="Verdana">Nome: 
            <strong>
            <% =date1 %>
            </strong> M&uacute;sica: <b> 
            <% =name1 %>
            </b> </font></td>
        </tr>
        <tr> 
          <td width="637" bgcolor="#EAEDF4"> <p align="center"><br>
              <font color="#000000" size="1" face="Verdana">Mensagem:<br>
              </font></p>
            <p><font color="#000000" size="1" face="Verdana"><br>
              <% =description%>
              </font> </p><br>
            <p align="center"><font color="#000000" size="2" face="Verdana"><a href="admin.asp">Voltar</a></font></p>
            <p align="center">&nbsp;</p></td>
        </tr>
      </table>
    </center>
  </div>
  <p>&nbsp; </p>
</div>
<br>
<br>
</BODY></HTML>
