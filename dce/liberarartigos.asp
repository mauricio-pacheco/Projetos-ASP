<%
Option Explicit
Response.Expires = 0
Dim objConn, objRs, strQuery
Dim strConnection

'Conectando com o banco de dados contato.mdb
Set objConn =  Server.CreateObject("ADODB.Connection")
objConn.Open "DBQ=" & Server.MapPath("dcebd/dcedata.mdb") & ";Driver={Microsoft Access Driver (*.mdb)}"

'Seleciona da tabela contato
strQuery = "SELECT * FROM artigos"
Set ObjRs = objConn.Execute(strQuery)
%>
<LINK href="crm.css" type=text/css rel=StyleSheet>
<html>
<style type="text/css">
<!--
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
	color: #434343;
}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="expires" content="-1">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<title></title>
</head>

<body bgColor="#ffffff" text="#000080" link="#000080"	aLink=red vLink="red">
<br>
<p align="center"><img src="dce.jpg" width="202" height="103"><font size="2" face="Verdana" color="#000066"></font></p>
<p align="center" class="style1">LIBERAR ARTIGOS - Selecione o ARTIGO para liberar:</p>
<div align="center"> 
  <center>
  </center>
  
</div>
 <form method="GET" action="form_altera.asp"> 
  <table width="54%" border="0" align="center">
    <tr>
      <td width="95%"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000"> 
        <%While Not objRS.EOF %>
        </font><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000"> 
        </font></b></font></td>
      <td width="5%">&nbsp;</td>
    </tr>
    <tr>
      <td><font size="1"><font size="1"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000"> 
        </font><font size="1"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000"><font color="#FF0000">
        </font><font size="1"><b><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000">
        <%
		If ObjRS("autoriza") = "s" then
		Response.Write ("<font color=""#808080"">LIBERADO</font>") 
		else
		Response.Write ("<font color=""#008040"">AGUARDANDO LIBERAÇÃO</font>") 
		end if
		
		
		%>
        </font></b></font></b></font><font color="#FF0000">
        - 
        <%Response.write objRS("autor")%>
-        </font></font></font><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000">
        <%Response.write objRS("assunto")%>
        </font></font></font></td>
      <td><div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000"> 
          </font><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000">
          <input type="radio" name="id" value="<%=objRS(0)%>">
          </font></b></font><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000"> 
          </font></b></font></div></td>
    </tr>
    <tr>
      <td><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000"> 
        <%
  'Movendo para o proximo registro
  objRS.MoveNext
  Wend
  'Fechando as conexões
  objRs.close
  objConn.close
  Set objRs = Nothing
  Set objConn = Nothing
  %>
        </font></b></font></td>
      <td>&nbsp;</td>
    </tr>
  </table>
<p align="center"><font size="1" color="FFFFFF"> 
  <input type="submit" class=busca name="Submit" value="LIBERAR ARTIGO">
  </font></p></form>
<p align="center">&nbsp;</p>
<p><br>
</p>
</body></html>


