<%
Option Explicit
Dim sql,rsUsers

if Request.Cookies("philoginadmin") = "True" then
%>
<!--#include file="conn.asp"-->
<%
sql = "SELECT * FROM users ORDER BY username"
Set rsUsers = Server.CreateObject("ADODB.Recordset")
rsUsers.Open sql, conn, 3, 3
%>

<html>
<head>

<script language="JavaScript">
<!-- hide on

function popup(popupfile,winheight,winwidth,scrolls)
{
open(popupfile,"PopupWindow","resizable=no,height=" + winheight + ",width=" + winwidth + ",scrollbars=no" + scrolls);
}

// hide off -->
</script>

<title>Vista M&oacute;veis - Administra&ccedil;&atilde;o</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>
<body bgcolor="#efefe7" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<font face="arial,helvetica" size="2"> 
<h3 align="center">&nbsp;</h3>
<h3 align="center"><img src="logi.gif" width="151" height="97"> <font face="arial,helvetica" size="2"> 
  </font></h3>
</font> 
<h3 align="center">&nbsp;</h3>
<font color="#000000" size="2" face="arial,helvetica">
<div align="center"><font size="4"><font size="2"><strong>Administra&ccedil;&atilde;o 
  do conte&uacute;do</strong></font></font></div>
</font> 
<h3 align="center"><font size="2" face="arial,helvetica"><a onClick="window.open('../admin.asp','Janela','toolbar=no,location=no,width=500,height=500,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes'); return false;" href="submit.asp">ENVIAR 
  CONTE&Uacute;DO</a></font></h3>
<h3 align="center"><font color="#000000" size="2" face="arial,helvetica"><strong>Administra&ccedil;&atilde;o 
  dos Cadastros Vista M&oacute;veis</strong></font></h3>
<p align="center"><font color="#FFFFFF" size="2" face="arial,helvetica"><a href="philogin_admin.asp"><font color="#000000">Deletar 
  Usu&aacute;rios</font></a></font></p>
<p><font color="#000000" size="2" face="arial,helvetica"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
  <%if not rsUsers.EOF then%>
  </font></font></p>
<font face="arial,helvetica" size="2">
<table cellpadding="2" cellspacing="0" border="0" bordercolor="#FFFFFF" width="100%">
  <tr> 
    <th width="27%"><hr></th>
  </tr>
  <%rsUsers.Movefirst
do until rsUsers.EOF%>
  <tr> 
    <td> <p align="center">&nbsp;</p>
      <p align="center"><font color="#000000"><strong><em><font size="2" face="arial,helvetica">Lista 
        de Cadastros Vista M&oacute;veis</font></em></strong></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Dados 
        Usu&aacute;rio</em></strong></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Usu&aacute;rio: 
        <%=rsUsers("username")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Senha: 
        <%=rsUsers("password")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome: 
        <%=rsUsers("firstname")%>&nbsp;<%=rsUsers("surname")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">E-mail: 
        <%=rsUsers("email")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Telefone: 
        <%=rsUsers("telefone")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Celular: 
        <%=rsUsers("celular")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Estado 
        Civil: <%=rsUsers("estadocivil")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Naturalidade: 
        <%=rsUsers("natural")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nacionalidade: 
        <%=rsUsers("nacional")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cidade: 
        <%=rsUsers("cidade")%> - <%=rsUsers("estado")%> - <%=rsUsers("outropais")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Pa&iacute;s: 
        <%=rsUsers("pais")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">CEP: 
        <%=rsUsers("cep")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data 
        Nascimento: <%=rsUsers("datanascimento")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Endere&ccedil;o: 
        <%=rsUsers("endereco")%> - <%=rsUsers("numero")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Complemento: 
        <%=rsUsers("complemento")%></font></p>
      <p><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Mensagem</em></strong></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("infoutros")%></font></p>
      <p>&nbsp;</p></td>
  </tr>
  <tr> 
    <td><hr> </td>
  </tr>
  <%rsUsers.Movenext
loop%>
</table>
</font><font color="#000000" size="2" face="arial,helvetica"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%else%>
</font></font><font face="arial,helvetica" size="2"><font color="#FFFFFF">
<p align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b>N&atilde;o 
  h&aacute; usu&aacute;rios cadastrados!</b></font></p>
<font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
<%end if%>
<%else
Response.Redirect("philogin_admin.asp")
end if%>
</font></font> </font> 
</body>
</html>

<%
rsUsers.close
set rsUsers = nothing
conn.close
set conn = nothing
%>
