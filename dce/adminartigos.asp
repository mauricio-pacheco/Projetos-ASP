<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>R&aacute;dio Arinos FM</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<LINK href="Radio95.9FM_arquivos/default.css" type=text/css rel=STYLESHEET>
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#FFFFFF text="#000000" link="#000000" vlink="#000000" alink="#000000" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> </font> 
<div align="center"> 
  <p>&nbsp;</p>
  <p><img src="dce.jpg" width="202" height="103"></p>
  <p><font color="#000000" size="3" face="Verdana, Arial, Helvetica, sans-serif">Administra&ccedil;&atilde;o 
    dos Artigos </font></p>
  <form method="POST" action="adminartigos.asp?flag=1">
    <p><font color="#000000"> 
      <%
	 Dim  cidade2, estado2, nome2, comentario2, data, hora
flag = request.querystring("flag")

if flag = 1 then

If IsEmpty(request.form("ID")) then 

			response.write "<br><br><br><br><br><br><p align=center>"
			response.write "<table border=1 cellpadding=3 cellspacing=0 width=423 bordercolor=#000000><tr><td width=415> <p align=center><font face=Verdana size=2>Erro na exclus�o</font></p></td></tr>"
			response.write "<tr><td width=415 bgcolor=#C0C0C0><p align=center><font face=Verdana size=2>Para voc� deletar"
			response.write " selecione uma caixa<br>e clique no bot�o para excluir o item novamente.</font></p></td></tr></table>"
			response.end
		
End If
		
set rs = nothing
ID = request.form("ID")
		set conn = server.createobject("adodb.connection")
		DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
    	DSNtemp=dsntemp & "DBQ=" & server.mappath("dcebd/dcedata.mdb")
    	conn.Open DSNtemp
		For each record in request("ID")
    		sqlstmt = "DELETE * from artigos WHERE ID=" & record
			Set RS = conn.execute(sqlstmt)
		Next

end if
%>
      </font></p>
    <p><font color="#000000">
      <input type="submit" value="Apagar Selecionadas" name="B1">
      <br>
      </font> </p>
    <div align="center"> 
      <center>
        <table width="786" border="0" align="center" cellpadding="3" cellspacing="0" bordercolor="#469148">
          <%
set rs = nothing
DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
          DSNtemp=dsntemp & "DBQ=" & server.mappath("dcebd/dcedata.mdb")
          sqlstmt = "SELECT * FROM artigos ORDER BY id DESC"
          Set rs = Server.CreateObject("ADODB.Recordset")
          rs.Open sqlstmt, DSNtemp, 3, 3
TotalRecs = rs.recordcount
x = 0
For x = 1 to 9999
	If rs.eof then
		Exit For
	Else
        id = rs("ID")
		data = rs("data")
        hora = rs("hora")
		autor2 = rs("autor")
	    assunto2 = rs("assunto")
		mensagem2 = rs("mensagem")
	
   %>
          <tr> 
            <td width="780" bgcolor="#FFFFFF"> <p><font color="#000000" size="1"> 
                <input type="checkbox" name="ID" value="<% =id %>">
                <strong><font face="Verdana"> 
                <% =autor2%> - <% =hora%> - <% =hora%>
                </font></strong></font>- <font size="1"><font size="1"><font size="1"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000"><font size="1"><b><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000">
                <%
		If rs("autoriza") = "s" then
		Response.Write ("<font color=""#808080"">LIBERADO</font>") 
		else
		Response.Write ("<font color=""#008040"">AGUARDANDO LIBERA&Ccedil;&Atilde;O</font>") 
		end if
		
		
		%>
                </font></b></font></b></font></font></font></font></font></p>
              <p><font color="#000000" size="1" face="Verdana">Assunto:</font><font color="#000000" size="1"><font face="Verdana">
              <% =assunto2%>
              </font></font></p>
              <p><font color="#000000" size="1"><font color="#000000" size="1"><font face="Verdana">Texto </font></font></font><font color="#000000" size="1" face="Verdana">:</font><font color="#000000" size="1"><font face="Verdana"> 
                <% =mensagem2%>
              </font></font></p>
            <hr> </td>
          </tr>
          <%
rs.MoveNext
End If
Next%>
        </table>
      </center>
    </div>
    <p align="center">&nbsp;</p>
    <p align="center"><font color="#000000"> </font><font color="#000000"> </font></p>
  </form>
  <p>&nbsp; </p>
</div>
</BODY></HTML>
