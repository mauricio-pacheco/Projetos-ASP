<!--#include file="bd.inc"-->
<LINK 
href="style2.css" type=text/css rel=StyleSheet>
<html>
<style type="text/css">
<!--
a:active {  color: #333366; text-decoration: none}
a:hover {  color: #333366; text-decoration: underline overline}
a:link {  color: #333366; text-decoration: none}
-->
</style>

<title>Livro de Visitas</title>
<body bgcolor="#000000" text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" bordercolorlight="#999999" bordercolordark="#CCCC99" bgcolor="#000000">
  <tr> 
    <td colspan="3"> 
      <div align="center"><b><font size="5"><i></i></font></b></div>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <div align="center"> 
        <p>
          <embed src="titulolivro.swf" width="500" height="50"></embed></p>
        <p><font size="3" color="#FFFFFF"><b>Bem Vindo ao livro de visitas da 
          Mandry Web Design, leia as mensagens deixadas <br>
          pelos nossos internautas e aproveite e deixe a sua tamb&eacute;m!</b></font></p>
        <p><a href="livrodevisitas.asp"><img src="assina.jpg" width="102" height="32" border="0"></a><img src="preto.jpg" width="103" height="33"><a href="http://www.mandrywebdesign.net/index.asp"><img src="homeforum.jpg" width="102" height="32" border="0"></a></p>
      </div>
    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <div align="center"><font color="#999999"><a href="livrodevisitas.asp"> 
        <embed src="barralivro.swf" width="800" height="30"></embed></a></font></div>
    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <div align="center"> <%
ler.MoveFirst
DO WHILE NOT ler.EOF
%> <%
nome = ler("nome")
url = ler("url")
id = ler("id")
msg = ler("msg")
email = ler("email")
ip = ler("ip")
data = ler("data")
hora = ler("hora")
%> 
        <table border="0" width="70%" bgcolor="#000000" bordercolorlight="#99CC66" bordercolordark="#99CC66">
          <tr bgcolor="#99CC66"> 
            <td bgcolor="#000000"><font color="#FF0000">Assinante: </font><font color="#003333"><font color="#FFFFFF"><%=nome%> 
              <font color="#FF0000">E-mail: </font></font><a href="mailto:<%=email%>"><font color="#FFFFFF"><%=email%></font></a> 
              <%if url <> "" then%>
              <font color="#FF0000">Home Page: </font><font color="#FFFFFF"><a href="<%=url%>" target="blablabla"><font color="#FFFFFF"><%=url%></font></a></font> 
              <%end if%>
              </font></td>
          </tr>
          <tr bgcolor="#99CC66"> 
            <td bgcolor="#000000"><font color="#FF0000">Data / Hora:</font> <font color="#FFFFFF"><%=data%></font> 
              <font color="#FFFFFF">/</font><font color="#FFFFFF"> <%=hora%> 
              <% sqv = "SELECT * FROM c_guest_cont WHERE email = '"& email &"'"
set v = c.execute(sqv)
v = v("vezes") %>
              </font></td>
          </tr>
          <tr bgcolor="#99CC66"> 
            <td bgcolor="#000000"><font color="#FF0000">Mensagem:</font></td>
          </tr>
          <tr bgcolor="#99CC66"> 
            <td bgcolor="#000000"> 
              <div align="center"> <font color="#FFFFFF"><%=msg%> </font></div>
            </td>
          </tr>
          <tr bgcolor="#99CC66"> 
            <td bgcolor="#000000"> 
              <div align="center"><font color="#00FF00">Visitas:</font><font color="#FFFFFF"> 
                <%=v%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#00FF00"> 
                <font size="2">IP:</font></font><font size="2" color="#FFFFFF"> 
                <%=ip%> </font></div>
            </td>
          </tr>
        </table>
        <%ler.MoveNext%><%loop%> </div>
    </td>
  </tr>
  <tr> 
    <td align="center" colspan="3"><embed src="barralivro.swf" width="800" height="30"></embed></td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" bordercolorlight="#CCCC99" bordercolordark="#303400">
        <tr> 
          <td width="19%" valign="middle">&nbsp;</td>
          <td width="65%"><CENTER>
              <p><FONT class=footmsg><font color="#FFFFFF"> Frederico Westphalen 
                - RS - CEP:98400-000 </font></FONT></p>
              <p><font color="#FFFFFF" class="footmsg"> Cel: (55) 99898544 </font><font color="#FFFFFF"><a href="mailto:mandry@brturbo.com"><font class="footmsg"><font color="#FFFFFF">E-mail: 
                mandry@brturbo.com</font></font></a></font> </p>
            </CENTER>
            <p align="center"><font color="#FFFFFF">Todos os direitos reservados</font></p>
            <p> 
            <CENTER>
              <p><FONT color="#FF0000" face="Verdana" class=footmsg>DESIGNED BY 
                MANDRY</FONT><FONT color="#FFFFFF" class=footmsg></FONT></p>
            </CENTER>
          </td>
          <td width="16%" valign="middle">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>