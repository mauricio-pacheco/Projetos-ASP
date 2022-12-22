<!--#include file="bd.inc"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Festa do Reencontro - Cadastrados</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<LINK href="default.css" type=text/css rel=STYLESHEET>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#000000 text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> </font> 
<div align="center">
  <p>&nbsp;</p>
  <p><img src="reencontro2.gif" width="200" height="86"></p>
  <p>&nbsp;</p>
  <p><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>FESTA 
    DO REENCONTRO</em></strong></font></p>
  <p><font color="#FFFFFF" size="4" face="Verdana, Arial, Helvetica, sans-serif">ASSINANTES</font></p>
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
      <td bordercolor="#000000" bgcolor="#000000"> 
        <div align="left"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Assinante:</font><font color="#FFFF33" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
          <%=nome%></font></div></td>
    </tr>
    <tr bgcolor="#99CC66"> 
      <td bgcolor="#000000"><div align="left"><font color="#FFFF33" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:<%=email%>">E-mail: 
          <%=email%></a> 
          <%if url <> "" then%>
          </font></div></td>
    </tr>
    <tr bgcolor="#99CC66"> 
      <td bgcolor="#000000"><div align="left"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Assunto:</font><font color="#FFFF33" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
          <%=url%> 
          <%end if%>
          </font></div></td>
    </tr>
    <tr bgcolor="#99CC66"> 
      <td bgcolor="#000000"> <div align="left"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Mensagem:</font></div></td>
    </tr>
    <tr bgcolor="#99CC66"> 
      <td width="500" nowrap bgcolor="#000000"> <div align="left"> 
          <table width="100%" border="0">
            <tr> 
              <td width="500" nowrap> <div align="center"> 
                  <p><font color="#FFFF33" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=msg%></font></p>
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
