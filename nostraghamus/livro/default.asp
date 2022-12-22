<!--#include file="bd.inc"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>NOSTRAGHAMUS Cerveja & Mulher</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<LINK href="default.css" type=text/css rel=STYLESHEET>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#000000 text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> </font> 
<div align="center">
  <p>&nbsp;</p>
  <p><font face="Arial, Helvetica, sans-serif"><strong><em>NOSTRAGHAMUS</em></strong></font></p>
  <p><img src="cirrose.jpg" width="180" height="250"></p>
  <p><em><strong><font face="Arial, Helvetica, sans-serif">Cerveja &amp; Mulher</font></strong></em></p>
  <p>&nbsp;</p>
  <p><font color="#FFFFFF" size="4" face="Verdana, Arial, Helvetica, sans-serif">Assinantes</font></p>
  <p>&nbsp;</p>
  <p> 
    <%
ler.MoveFirst
DO WHILE NOT ler.EOF
%>
    <%
nome = ler("nome")
url = ler("url")
id = ler("id")
msg = ler("msg")
email = ler("email")
ip = ler("ip")
data = ler("data")
hora = ler("hora")
%>
  </p>
  <table width="70%" border="0" align="center" bordercolorlight="#99CC66" bordercolordark="#99CC66" bgcolor="#000000">
    <tr bgcolor="#292929"> 
      <td bgcolor="#000000"> <div align="left"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Assinante:</font><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
          <%=nome%></font></div></td>
    </tr>
    <tr bgcolor="#99CC66"> 
      <td bgcolor="#000000"><div align="left"><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:<%=email%>">E-mail: 
          <%=email%></a> 
          <%if url <> "" then%>
          </font></div></td>
    </tr>
    <tr bgcolor="#99CC66"> 
      <td bgcolor="#000000"><div align="left"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Assunto:</font><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
          <%=url%> 
          <%end if%>
          </font></div></td>
    </tr>
    <tr bgcolor="#99CC66"> 
      <td bgcolor="#000000"> <p align="left"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data 
          / Hora:</font> <font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=data%></font> 
          <font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">/ 
          <%=hora%> 
          <% sqv = "SELECT * FROM c_guest_cont WHERE email = '"& email &"'"
set v = c.execute(sqv)
v = v("vezes") %>
          </font></p></td>
    </tr>
    <tr bgcolor="#99CC66"> 
      <td bgcolor="#000000"> <div align="left"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Mensagem:</font></div></td>
    </tr>
    <tr bgcolor="#99CC66"> 
      <td width="500" nowrap bgcolor="#000000"> <div align="left"> 
          <table width="100%" border="0">
            <tr> 
              <td width="500" nowrap> <div align="center"> 
                  <p><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=msg%></font></p>
                  <hr color="#FFFFFF">
                  <p>&nbsp;</p>
                </div></td>
            </tr>
          </table>
        </div></td>
    </tr>
  </table>
  <%ler.MoveNext%>
  <%loop%>
  <p>&nbsp; </p>
</div>
</BODY></HTML>
