<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Vista M&oacute;veis</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<LINK href="Radio95.9FM_arquivos/default.css" type=text/css rel=STYLESHEET>
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#f6f6f6 text="#000000" link="#000000" vlink="#000000" alink="#000000" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<table width="340" border="0">
  <tr>
    <td><div align="center"> 
  <form method="POST" action="admin.asp?flag=1">
    <div align="center"> 
      <center>
    <table width="350" border="0" align="left" cellpadding="3" cellspacing="0" bordercolor="#469148">
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
        id = rs("ID")
		name = rs("musica")
	    data = rs("data")
        hora = rs("hora")
		nome2 = rs("nome")
	    cidade2 = rs("cidade")
		estado2 = rs("estado")
		comentario2 = rs("comentario")
		
		
		description = name
   %>
          <tr> 
            <td width="780"> 
              <p><font color="#000000" size="1"> <strong><font face="Verdana"> 
                      </font><font color="#000000"> <font size="2"> <em> 
                      <%
	 Dim  cidade2, estado2, nome2, comentario2, data, hora
flag = request.querystring("flag")

if flag = 1 then

If IsEmpty(request.form("ID")) then 

			response.write "<br><br><br><br><br><br><p align=center>"
			response.write "<table border=1 cellpadding=3 cellspacing=0 width=423 bordercolor=#000000><tr><td width=415> <p align=center><font face=Verdana size=2>Erro na exclusão</font></p></td></tr>"
			response.write "<tr><td width=415 bgcolor=#C0C0C0><p align=center><font face=Verdana size=2>Para você deletar"
			response.write " selecione uma caixa<br>e clique no botão para excluir o item novamente.</font></p></td></tr></table>"
			response.end
		
End If
		
set rs = nothing
ID = request.form("ID")
		set conn = server.createobject("adodb.connection")
		DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
    	DSNtemp=dsntemp & "DBQ=" & server.mappath("journal.mdb")
    	conn.Open DSNtemp
		For each record in request("ID")
    		sqlstmt = "DELETAE * from journal WHERE ID=" & record
			Set RS = conn.execute(sqlstmt)
		Next

end if
%>
                      </em></font></font><em><font size="2" face="Verdana"> 
                      <% =nome2%>
                      </font></em></strong></font></p>
              <table width="350" border="0" align="left">
                <tr>
                        <td><div align="center"><font color="#000000" size="1"><font size="2" face="Verdana"> 
                            <% =comentario2%>
                            </font></font></div></td>
                </tr>
              </table>
              
            </td>
          </tr>
          <%
rs.MoveNext
End If
Next%>
        </table>
        <font color="#000000"> </font><font color="#000000"> </font>
      </center>
    </div>
    </form>
  
</div>
</td>
  </tr>
</table>
</BODY></HTML>
