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

<title>Grupo Vanguarda</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>
<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<font face="arial,helvetica" size="2"> 
<h3 align="center">&nbsp; </h3>
</font>
<p align="center"><font color="#0000FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>GRUPO</strong></font> 
  <strong><font color="#009900" size="2" face="Verdana, Arial, Helvetica, sans-serif">VANGUARDA</font></strong></p>
<p align="center">&nbsp;</p>
<p align="center"><img src="../logo.JPG" width="102" height="114"></p>
<p align="center">&nbsp;</p>
<p align="center"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">RECURSOS 
  HUMANOS</font></p>
<font face="arial,helvetica" size="2">
<h3 align="center">&nbsp;</h3>
<h3 align="center"><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif">Administra&ccedil;&atilde;o 
  dos Curriculuns Online</font></h3>
<p align="center">&nbsp;</p>
<p align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="philogin_admin.asp">Deletar 
  Usu&aacute;rios</a></font></p>
</font>
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
    <td>
<p align="center">&nbsp;</p>
      <p align="center"><strong><em>CURRICULUM VITAE</em></strong></p>
      <p>&nbsp;</p>
      <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Dados 
        Trabalhador</em></strong></font></p>
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
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">CPF: 
        <%=rsUsers("cpf")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cidade: 
        <%=rsUsers("cidade")%> - <%=rsUsers("estado")%> - <%=rsUsers("outropais")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Pa&iacute;s: 
        <%=rsUsers("pais")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">CEP: 
        <%=rsUsers("cep")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data 
        Nascimento: <%=rsUsers("datanascimento")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">V&iacute;nculo: 
        <%=rsUsers("vinculo")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">&Aacute;rea 
        de Trabalho: <%=rsUsers("area")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cargo 
        Desejado: <%=rsUsers("cargo")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Endere&ccedil;o: 
        <%=rsUsers("endereco")%> - <%=rsUsers("numero")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Complemento: 
        <%=rsUsers("complemento")%></font></p>
      <p>&nbsp;</p>
      <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Forma&ccedil;&atilde;o 
        Acad&ecirc;mica</em></strong></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">N&iacute;vel: 
        <%=rsUsers("nivel")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Status: 
        <%=rsUsers("status_")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Institui&ccedil;&atilde;o: 
        <%=rsUsers("inst")%></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">N&iacute;vel: 
        <%=rsUsers("nivel2")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Status: 
        <%=rsUsers("status2")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Institui&ccedil;&atilde;o: 
        <%=rsUsers("inst2")%></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">N&iacute;vel: 
        <%=rsUsers("nivel3")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Status: 
        <%=rsUsers("status3")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Institui&ccedil;&atilde;o: 
        <%=rsUsers("inst3")%></font></p>
      <p>&nbsp;</p>
      <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Cursos 
        Realizados</em></strong></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        do Curso: <%=rsUsers("nomecurso")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Entidade: 
        <%=rsUsers("entidadecurso")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data 
        do Curso: <%=rsUsers("datacurso")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Carga 
        Hor&aacute;ria: <%=rsUsers("cargacurso")%></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        do Curso: <%=rsUsers("nomecurso2")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Entidade: 
        <%=rsUsers("entidadecurso2")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data 
        do Curso: <%=rsUsers("datacurso2")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Carga 
        Hor&aacute;ria: <%=rsUsers("cargacurso2")%></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        do Curso: <%=rsUsers("nomecurso3")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Entidade: 
        <%=rsUsers("entidadecurso3")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data 
        do Curso: <%=rsUsers("datacurso3")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Carga 
        Hor&aacute;ria: <%=rsUsers("cargacurso3")%></font></p>
      <p>&nbsp;</p>
      <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>&Iacute;diomas</em></strong></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("ingles")%> 
        - <%=rsUsers("inglesc")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("espanhol")%></font> 
        - <font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("espanholc")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("italiano")%></font> 
        - <font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("italianoc")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("alemao")%></font> 
        - <font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("alemaoc")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("outroidioma")%></font> 
        - <font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("outroidiomac")%></font></p>
      <p>&nbsp;</p>
      <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Conhecimentos 
        em Inform&aacute;tica</em></strong></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("editort")%> 
        - <%=rsUsers("editortc")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("planilha")%> 
        - <%=rsUsers("planilhac")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("programas")%> 
        - <%=rsUsers("programasc")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("conhecimento")%> 
        - <%=rsUsers("conhecimentoc")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Outros 
        Conhecimentos na &aacute;rea</font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("infoutros")%></font></p>
      <p>&nbsp;</p>
      <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Experi&ecirc;ncia 
        Profissional</em></strong></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        da Empresa: <%=rsUsers("nomeempresa")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cargo 
        na Empresa: <%=rsUsers("cargoempresa")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Estado 
        da Empresa: <%=rsUsers("estadoemp")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cidade 
        da Empresa: <%=rsUsers("cidadeemp")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Pa&iacute;s 
        da Empresa: <%=rsUsers("paisemp")%></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        da Empresa: <%=rsUsers("nomeempresa2")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cargo 
        na Empresa: <%=rsUsers("cargoempresa2")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Estado 
        da Empresa: <%=rsUsers("estadoemp2")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cidade 
        da Empresa: <%=rsUsers("cidadeemp2")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Pa&iacute;s 
        da Empresa: <%=rsUsers("paisemp2")%></font></p>
      <p>&nbsp;</p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
        da Empresa: <%=rsUsers("nomeempresa3")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cargo 
        na Empresa: <%=rsUsers("cargoempresa3")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Estado 
        da Empresa: <%=rsUsers("estadoemp3")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cidade 
        da Empresa: <%=rsUsers("cidadeemp3")%></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Pa&iacute;s 
        da Empresa: <%=rsUsers("paisemp3")%></font></p>
      <p>&nbsp;</p>
      <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><em>Resumo</em></strong></font></p>
      <p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=rsUsers("sugestao")%></font></p>
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
