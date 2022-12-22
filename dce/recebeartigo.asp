<meta HTTP-EQUIV="refresh" CONTENT="2;URL=artigomostra.asp">
<!--#include file="cabecalho.asp"-->
<!--#include file="tabelacima.asp"-->
<%
Dim nome, comentario, data, hora, g, h

g = date

h = time

autor = request.form("autor")

assunto = request.form("assunto")

mensagem = request.form("mensagem")

data = request.form("data")

hora = request.form("hora")

'Conexão com o Banco de Dados
Set wm = Server.CreateObject("ADODB.Connection")

'abre o banco de dados 

wm.Open "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("dcebd/dcedata.mdb")
Set rs = Server.CreateObject("ADODB.Recordset")

'Insere o novo usuário na tabela usuarios

Comando = "INSERT INTO artigos (autor, assunto, mensagem, data, hora)" & "VALUES('" & autor & "','" & assunto & "','" & mensagem & "','" & g& "','" & h& "')"
wm.Execute(Comando)


%>
<TABLE cellSpacing=0 cellPadding=0 width=778 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=middle width=140 bgColor=#f2f2f2>
      <!--#include file="tesquerda.asp"--></TD>
    <TD vAlign=top align=middle width=498 
    background=home_arquivos/tc_layout_15.jpg height=25>
      <TABLE cellSpacing=0 cellPadding=0 width=498 border=0>
        <TBODY>
        <TR>
          <TD vAlign=center align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width=482 border=0>
              <TBODY>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD class=fonte>
                  <TABLE cellSpacing=0 cellPadding=0 width=482 border=0>
                    <TBODY>
                    <TR>
                      <TD width=62>
                        <DIV align=center><IMG height=50 
                        src="home_arquivos/default.jpg" width=50></DIV></TD>
                      <TD vAlign=center width=422>
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" 
border=0>
                          <TBODY>
                          <TR>
                            <TD class=fonte><span class="fontedestaque"><span style="color: #3A83A6"><strong>» DCE - Diret&oacute;rio Central dos Estudantes </strong></span></span></TD>
                          </TR>
                          <TR>
                            <TD class=fonte height=5></TD></TR>
                          <TR>
                            <TD class=fonte>
                              <DIV align=justify><STRONG>&raquo;</STRONG> ARTIGOS</DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD align=middle height=1><IMG height=1 
                  src="home_arquivos/tc_layout_barra.gif" width=480></TD></TR>
          </TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle>
            <TABLE width=482 border=0 align="center" cellPadding=0 cellSpacing=0>
              <TBODY>
              <TR>
                <TD height=10></TD></TR>
              <TR>
                <TD class=fontedestaque><div align="center">
                  <p><br>
                    <em>Por favor escreva seu artigo atentando para a gram&aacute;tica   e poss&iacute;veis erros de digita&ccedil;&atilde;o. <BR>
                    Voc&ecirc; fica ciente, desde j&aacute;, que nem todas as   contribui&ccedil;&otilde;es s&atilde;o publicadas.<BR>
                    Sua emiss&atilde;o ser&aacute; conferida e poder&aacute; ser   publicada no site.</em></p>
                  <p><img src="dce.jpg" width="202" height="103"></p>
                  <p>ARTIGO ENVIADO COM SUCESSO! </p>
                  <p>&nbsp;</p>
                  </div></TD>
              </TR>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD>
                  </TD></TR>
              <TR>
              <TD height=10></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle height=1><IMG height=1 
            src="home_arquivos/tc_layout_barra.gif" width=480></TD></TR></TBODY></TABLE>
    </TD>
    <TD vAlign=top align=middle width=140 bgColor=#f2f2f2>
      <!--#include file="tdireita.asp"--><!--#include file="baixo.asp"--></BODY></HTML>
