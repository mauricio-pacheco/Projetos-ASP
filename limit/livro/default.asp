<!--#include file="bd.inc"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Mural de Recados - LIMIT</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<LINK href="default.css" type=text/css rel=STYLESHEET>
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#000000 text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> </font> 
<div align="center"> 
  <p>&nbsp;</p>
  <p><font size="3" face="Verdana, Arial, Helvetica, sans-serif">Mural de Recados</font></p>
  <p><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif">LIMIT</font></p>
  <p><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Assinantes</font></p>
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
  <table border="0" width="70%" bgcolor="#000000">
    <tr bgcolor="#000000"> 
      <td bgcolor="#000000"> 
        <div align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Assinante:</font><font color="#FF0000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
          <%=nome%></font></div></td>
    </tr>
    <tr bgcolor="#000000"> 
      <td bgcolor="#000000"> 
        <div align="center"><font color="#003333" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:<%=email%>"><font color="#FFFFFF">E-mail:<font color="#FF0000"> 
          </font></font><font color="#FF0000"><%=email%></font></a> <font color="#FF0000"> 
          <%if url <> "" then%>
          </font><font color="#FF0000"> </font></font></div></td>
    </tr>
    <tr bgcolor="#000000"> 
      <td bgcolor="#000000"> 
        <div align="center"><font color="#003333" size="1" face="Verdana, Arial, Helvetica, sans-serif"><font color="#FFFFFF"><a href="<%=url%>" target="blablabla"><font color="#FFFFFF">Home 
          Page: </font><font color="#FF0000"><%=url%></font></a></font> <font color="#FF0000"> 
          <%end if%>
          </font></font></div></td>
    </tr>
    <tr bgcolor="#000000"> 
      <td bgcolor="#000000"> 
        <div align="center"> 
          <p><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data 
            / Hora:</font> <font color="#FF0000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=data%></font> 
            <font color="#FF0000" size="1" face="Verdana, Arial, Helvetica, sans-serif">/ 
            <%=hora%> 
            <% sqv = "SELECT * FROM c_guest_cont WHERE email = '"& email &"'"
set v = c.execute(sqv)
v = v("vezes") %>
            </font></p>
        </div></td>
    </tr>
    <tr bgcolor="#000000"> 
      <td bgcolor="#000000"> 
        <div align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Mensagem:</font></div></td>
    </tr>
    <tr bgcolor="#000000"> 
      <td width="500"> <div align="center"> 
          <table width="100%" border="0">
            <tr> 
              <td width="500"> 
                <div align="center"> 
                  <p><font color="#FF0000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=msg%></font></p>
                  <hr color="#FFFFFF">
                  <p><font color="#0099CC" size="1" face="Verdana, Arial, Helvetica, sans-serif"></font></p>
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
