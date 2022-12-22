<title>Superchat - ICQ</title>
<body bgcolor="#0066CC">
<p>
<font face="verdana "size="2"> 
<%
uin = Request.Querystring("uin")
If uin = "" then
%>
<font color="#FFFFFF"><br>
</font><font face="verdana "size="2"><font color="#FFFFFF"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Superchat 
- ICQ</font></b></font></font><font color="#FFFFFF"><br>
<br>
Digite o número do ICQ destinatário:</font><br>
<form action="icq.asp" method="get">
  <font color="#FFFFFF">ICQ: </font> 
  <input type="text" name="uin" size="13">
  <font face="verdana "size="2"> 
  <input type="submit" name="Submit" value="Enviar" style="BACKGROUND-COLOR: #eeeeee; COLOR: #09096f; FONT-FAMILY: verdana,geneva; FONT-SIZE: 11px">
  <input type="button" name="Submit32" value="Sair" style="BACKGROUND-COLOR: #eeeeee; COLOR: #09096f; FONT-FAMILY: verdana,geneva; FONT-SIZE: 11px" onClick="javascript:self.close()">
  </font> 
</form>
<% else %>
</font> 
<form action="http://web.icq.com/whitepages/page_me/1,,,00.html" method="post" name="form1">
  <font color="#FFFFFF"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Superchat 
  - ICQ</font></b></font><br>
<br>
  <br>
  <input type="HIDDEN" name="to" value="<%=uin%>">
  <table width="85%" border="0" align="center">
    <tr> 
      <td colspan="2"><font face="Arial" size="2" color="#FFFFFF"><b>Enviar ICQ 
        para <%=uin%>:</b></font></td>
    </tr>
    <tr> 
      <td><font face="Arial" size="2" color="#FFFFFF"><b>Seu nome:</b></font></td>
      <td><font face="Arial" size="2" color="#FFFFFF"><b>Seu email:</b></font></td>
    </tr>
    <tr> 
      <td> <font color="#FFFFFF"> 
        <input type="text" name="from" size="13">
        </font></td>
      <td> <font color="#FFFFFF"> 
        <input type="text" name="fromemail" size="13">
        </font></td>
    </tr>
    <tr> 
      <td colspan="2"> <font face="Arial" size="2" color="#FFFFFF"><b>Mensagem:</b></font><font color="#FFFFFF"><br>
        <textarea name="body" cols="32" rows="8" wrap="hard" onBlur="Enablecounter()" onChange="Enablecounter()"></textarea>
        </font></td>
    </tr>
    <tr> 
      <td colspan="2"><font color="#FFFFFF">&nbsp;</font> </td>
    </tr>
    <tr> 
      <td colspan="2" align="right" valign="top"> <font face="verdana "size="2"> 
        <input type="submit" name="Submit2" value="Enviar" style="BACKGROUND-COLOR: #eeeeee; COLOR: #09096f; FONT-FAMILY: verdana,geneva; FONT-SIZE: 11px">
        </font><font face="verdana "size="2">
        <input type="button" name="Submit3" value="Sair" style="BACKGROUND-COLOR: #eeeeee; COLOR: #09096f; FONT-FAMILY: verdana,geneva; FONT-SIZE: 11px" onClick="javascript:self.close()">
        </font><font color="#FFFFFF">&nbsp; </font></td>
    </tr>
  </table>
</form>
<% end if %>