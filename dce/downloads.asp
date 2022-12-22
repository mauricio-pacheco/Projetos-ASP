<%@ LANGUAGE="VBSCRIPT" %>
<%Response.Buffer=TRUE%>
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
                              <DIV align=justify><STRONG>&raquo;</STRONG> DOWNLOADS</DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD align=middle height=1><IMG height=1 
                  src="home_arquivos/tc_layout_barra.gif" width=480></TD></TR>
          </TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width=482 border=0>
              <TBODY>
              <TR>
                <TD height=10></TD></TR>
              <TR>
                <TD class=fontedestaque>
</TD>
              </TR>
              <TR>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD class=fonte vAlign=center bgColor=#ffffff 
                        height=18><!--#include file='dbconnectionhome.inc'-->
<%
   Set rsDownloadAdmin = Server.CreateObject("ADODB.Recordset")
   strSQL = "SELECT downloadid, downloadtitle, downloadcount FROM tbldownload ORDER BY DownloadID"
   rsDownloadAdmin.Open strSQL, adoCon

   Set rsSettings = Server.CreateObject("ADODB.Recordset")
   strSettingsSQL = "SELECT sitelink FROM tblsettings"
   rsSettings.Open strSettingsSQL, adoCon

   strCountDSQL = "SELECT Count(*) AS myDCount FROM tbldownload"
   Set rsCountD = adoCon.Execute(strCountDSQL)
   If rsCountD("myDCount") <= "0" then
    Response.Write ("Não há nenhum download no momento.")
   Else
   
   
   Dim strBGColor
   strBGColor = "#F4F4F4"

Do While NOT rsDownloadAdmin.EOF
   if strBGColor = "#F4F4F4" Then strBGColor = "#F4F4F4" Else strBGColor = "#F4F4F4" %><%
   Response.Write ("<span class=""style3"">")
   Response.Write ("<div> <strong>&raquo;</strong>&nbsp;<a href='")
   Response.Write (rsSettings("sitelink"))
   Response.Write ("/download.asp?DownloadID=")
   Response.Write (rsDownloadAdmin("DownloadID"))
   Response.Write ("' target='_new'>")
   Response.Write (rsDownloadAdmin("DownloadTitle"))
   Response.Write (" - <img src=""anexo.gif"" border=""0""></a> Número de Downloads: <font color=""#006600"">")
   Response.Write (rsDownloadAdmin("DownloadCount"))
   Response.Write ("</font>")
   Response.Write ("</center><br>")
   Response.Write ("</span></div>")
   
   rsDownloadAdmin.MoveNext
Loop
End If
Set rsDownloadAdmin = Nothing
Set adoCon = Nothing
%></TD>
                    </TR>
                    </TBODY>
                  </TABLE></TD></TR>
              <TR>
                <TD height=10></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle height=1><IMG height=1 
            src="home_arquivos/tc_layout_barra.gif" width=480></TD></TR></TBODY></TABLE>
    </TD>
    <TD vAlign=top align=middle width=140 bgColor=#f2f2f2>
      <!--#include file="tdireita.asp"--><!--#include file="baixo.asp"--></BODY></HTML>
