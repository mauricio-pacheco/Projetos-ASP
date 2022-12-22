<!--#include file="bd2.inc"-->
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
    <td> <div align="center"><b><font size="5"><i></i></font></b></div></td>
  </tr>
  <tr> 
    <td> <div align="center"> 
        <p> 
          <embed src="contatos.swf" width="400" height="80"></embed></p>
        <p><font size="3" color="#FFFFFF"><b>Contatos Mandry Web Design!<br>
          </b></font></p>
      </div></td>
  </tr>
  <tr> 
    <td> <div align="center"><font color="#999999"><a href="livrodevisitas.asp"> 
        </a></font></div></td>
  </tr>
  <tr> 
    <td> <div align="center"> 
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
        <table border="0" width="70%" bgcolor="#000000" bordercolorlight="#99CC66" bordercolordark="#99CC66">
          <tr bgcolor="#99CC66"> 
            <td bgcolor="#000000"><p><font color="#FF0000">Nome: </font><font color="#003333"><font color="#FFFFFF"><%=nome%></font></font></p>
              <p><font color="#003333"><font color="#FFFFFF"><font color="#FF0000">E-mail: 
                </font></font><a href="mailto:<%=email%>"><font color="#FFFFFF"><%=email%></font></a> 
                <%if url <> "" then%>
                </font></p>
              <p><font color="#003333"><font color="#FF0000">Assunto: </font><font color="#FFFFFF"><a href="<%=url%>" target="blablabla"><font color="#FFFFFF"><%=url%></font></a></font> 
                <%end if%>
                </font></p></td>
          </tr>
          <tr bgcolor="#99CC66"> 
            <td bgcolor="#000000"><p>&nbsp;</p>
              <p><font color="#FF0000">Data / Hora:</font> <font color="#FFFFFF"><%=data%></font> 
                <font color="#FFFFFF">/</font><font color="#FFFFFF"> <%=hora%> 
                <% sqv = "SELECT * FROM c_guest_cont WHERE email = '"& email &"'"
set v = c.execute(sqv)
v = v("vezes") %>
                </font></p></td>
          </tr>
          <tr bgcolor="#99CC66"> 
            <td bgcolor="#000000"><p>&nbsp;</p>
              <p><font color="#FF0000">Mensagem:</font></p></td>
          </tr>
          <tr bgcolor="#99CC66"> 
            <td bgcolor="#000000"> <div align="center"> <font color="#FFFFFF"><%=msg%> 
                </font></div></td>
          </tr>
          <tr bgcolor="#99CC66"> 
            <td bgcolor="#000000"> <div align="center">
                <p><font color="#00FF00">Visitas:</font><font color="#FFFFFF"> 
                  <%=v%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#00FF00"> 
                  <font size="2">IP:</font></font><font size="2" color="#FFFFFF"> 
                  <%=ip%> </font></p>
                <hr>
                <p><font color="#FFFFFF" size="2"></font></p>
              </div></td>
          </tr>
        </table>
        <%ler.MoveNext%>
        <%loop%>
        <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
      </div></td>
  </tr>
  <tr> 
    <td align="center">&nbsp;</td>
  </tr>
</table>
</html>