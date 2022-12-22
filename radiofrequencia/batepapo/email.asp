<%

msg = Request.QueryString("msg")
If msg = "erro" then
	msg = "Você precisa preencher todos os campos"
else
	msg = ""
end if
%>
<title>Bate Papo R&aacute;dio Luz e Alegria - Email</title>
<body bgcolor="#EFEFF7">
<form action="envia_email.asp" method="post" name="form1">
  <font color="#FFFFFF"><b><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Superchat 
  - Email</font></b></font><br>
<br>
  <br>
  <table width="85%" border="0" align="center">
    <tr> 
      <td colspan="2"><font face="Arial" size="2" color="#000000"><b><%=msg%></b></font> 
      </td>
    </tr>
    <tr> 
      <td><font face="Arial" size="2" color="#000000"><b>Seu nome:</b></font></td>
      <td><font face="Arial" size="2" color="#000000">&nbsp;</font> <font color="#000000">&nbsp; 
        </font></td>
    </tr>
    <tr> 
      <td> <font color="#000000"> 
        <input type="text" name="fromname" size="13">
        </font></td>
      <td><font color="#000000">&nbsp;</font></td>
    </tr>
    <tr> 
      <td><font face="Arial" size="2" color="#000000"><b>Nome do seu amigo:</b></font></td>
      <td><font face="Arial" size="2" color="#000000"><b>Email do seu amigo:</b></font></td>
    </tr>
    <tr> 
      <td> <font color="#000000"> 
        <input type="text" name="toname" size="13">
        </font></td>
      <td> <font color="#000000"> 
        <input type="text" name="tomail" size="13">
        </font></td>
    </tr>
    <tr> 
      <td colspan="2"> <font face="Arial" size="2" color="#000000"><b>Mensagem:</b></font><font color="#000000"><br>
        <textarea name="body" cols="32" rows="8" wrap="hard" onBlur="Enablecounter()" onChange="Enablecounter()"></textarea>
        </font></td>
    </tr>
    <tr> 
      <td colspan="2"><font color="#FFFFFF">&nbsp;</font> </td>
    </tr>
    <tr> 
      <td colspan="2" align="right" valign="top"> <font face="verdana "size="2"> 
        <input type="submit" name="Submit" value="Enviar" style="BACKGROUND-COLOR: #eeeeee; COLOR: #09096f; FONT-FAMILY: verdana,geneva; FONT-SIZE: 11px">
        <input type="button" name="Submit2" value="Sair" style="BACKGROUND-COLOR: #eeeeee; COLOR: #09096f; FONT-FAMILY: verdana,geneva; FONT-SIZE: 11px" onClick="javascript:self.close()">
        </font><font color="#FFFFFF">&nbsp; </font></td>
    </tr>
  </table>
</form>
