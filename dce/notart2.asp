<!--#include file="cabecalho.asp"-->
<!--#include file="tabelacima.asp"-->
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
                              <DIV align=justify><STRONG>&raquo;</STRONG> NOT&Iacute;CIAS </DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
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
                <TD class=fontedestaque style="font-size: 10px"><p align="center">
                  <span class="style3" style="color: #434343">
                  <%
id = request.querystring("id")
DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
          DSNtemp=dsntemp & "DBQ=" & server.mappath("dcebd/dcedata.mdb")
          sqlstmt = "SELECT * FROM artigos where id =" & id & " ORDER BY id DESC"
          Set rs = Server.CreateObject("ADODB.Recordset")
          rs.Open sqlstmt, DSNtemp, 3, 3
TotalRecs = rs.recordcount

		date1 = rs("data")
		hora1 = rs("hora")
		id = rs("ID")
		autor1 = rs("autor")
		assunto1 = rs("assunto")
		
		p1= rs("mensagem")
		
	  	description = p1
   %>
                  </span></p>
                  <p align="left" class="fontedestaque"><font face="Verdana, Arial, Helvetica, sans-serif">Artigo 
                    postado em </font><font face="Arial, Helvetica, sans-serif">
                            <% =date1 %>
                          </font>- <font face="Arial, Helvetica, sans-serif">
                          <% =hora1 %>
                    </font></p>
                  <p align="left" class="fontemenor" style="color: #434343"><font face="Verdana"><b>Autor:
                    </b><font color="#008040"><% =autor1 %></font> 
                    
                    - <b>Assunto:</b>
                        <font color="#434343"><% =assunto1 %></font>
                  </font></p>
                  <p align="left" class="fontemenor" style="color: #434343"><font face="Verdana">
                    <font color="#434343"><% =description%></font>
                  </font></p>
                  <table width="12%" border="0">
                    <tr>
                      <td><div align="center"><a href="default.asp" style="color: #434343"><img src="seta9.gif" width="8" border="0" height="8"></a></div></td>
                      <td><div align="center"><span style="font-size: 9px"><font face="Verdana"><a href="default.asp" style="color: #434343">Voltar</a></font></span></div></td>
                    </tr>
                  </table>
                  </TD>
              </TR>
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
