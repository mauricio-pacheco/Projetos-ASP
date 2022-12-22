<LINK href="css/styles.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
body {
	background-color: #f4f4f4;
}
.style3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
}
-->
</style>
<%@ LANGUAGE="VBSCRIPT" %>
<%Response.Buffer=TRUE%>
<!--#include file='dbconnection.inc'-->

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
    Response.Write ("<table bgcolor=""#f4f4f4"" cellpadding='0' cellspacing='0' width='100%'><tr><td class='error'><font face=""verdana"" size=""1"">Não há nenhum download no momento.</font></td></tr></table><br><br>")
   Else
   Response.Write ("<MARQUEE behavior= ""scroll"" align= ""center"" direction= ""up"" height=""208"" scrollamount= ""1"" scrolldelay= ""80"" onmouseover='this.stop()' onmouseout='this.start()'>")
   
   
   Dim strBGColor
   strBGColor = "#ffffff"

Do While NOT rsDownloadAdmin.EOF
   if strBGColor = "#ffffff" Then strBGColor = "#ffffff" Else strBGColor = "#ffffff" %>
   <tr bgcolor="<%= Cstr(strBGColor) %>"><td><center>
   <%
   Response.Write ("<div align=""center""><span class=""style3"">")
   Response.Write ("<img src=""anexo.gif""> Nº: <font color=""#006600"">")
   Response.Write (rsDownloadAdmin("DownloadCount"))
   Response.Write ("</font><br>")
   Response.Write ("<td><center><a href='")
   Response.Write (rsSettings("sitelink"))
   Response.Write ("/download.asp?DownloadID=")
   Response.Write (rsDownloadAdmin("DownloadID"))
   Response.Write ("' target='_new'>")
   Response.Write (rsDownloadAdmin("DownloadTitle"))
   Response.Write ("</a></center><br></td></tr>")
   Response.Write ("</span></div>")
   
   rsDownloadAdmin.MoveNext
Loop
Response.Write ("</table>")
Response.Write ("</marquee>")
End If
Set rsDownloadAdmin = Nothing
Set adoCon = Nothing
%>

<center>
</center>
<!--#include file='footer.inc'--> 