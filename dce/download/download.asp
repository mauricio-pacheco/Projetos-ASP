<title>DCE - URI - Campus de Frederico Westphalen/RS</title><!--#include file='dbconnection.inc'--> 
<style type="text/css">
<!--
body {
	background-color: #ffffff;
}
.style3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
}
-->
</style>
<%

Dim DataConn, rsDC
Dim sRequestIP, FileToDownload
Dim objRecordset

FileToDownload=Clng(Request.QueryString("DownloadID"))
sRequestIP=Request.ServerVariables("REMOTE_ADDR")

Set rsDC = Server.CreateObject("ADODB.Recordset")
strSQL = "SELECT * FROM tbldownload WHERE DownloadID =" & FileToDownload 
rsDC.Open strSQL, adoCon

If Not rsDC.EOF Then 

numDLCount = rsDC("DownloadCount") + 1

Response.Write ("<span class=""style3"">")
   
response.write "<META HTTP-EQUIV='refresh' CONTENT='3; URL=" & rsDC("DownloadURL") & "'>"
response.write "<p align='center'>Downloading <B>" & rsDC("DownloadTitle") & "</B> (" & rsDC("DownloadSize") & " bytes)<BR>" 
response.write "<a href='" & rsDC("DownloadURL") & "' target='main'>"
response.write "Clique aqui se o seu download não começar em 3 segundos</a></p>"


Set objRecordset = Server.CreateObject("ADODB.Recordset")
strSQL = "UPDATE tbldownload SET tbldownload.DownloadCount='" & numDLCount & "' WHERE DownloadID =" & FileToDownload
objRecordset = adoCon.Execute(strSQL)

else

response.write "Arquivo muito grande para o download"
  Response.Write ("</span>")
 
end if

Set rsDC = Nothing
Set objRecordset = Nothing
adoCon.Close
Set adoConn = Nothing
%><style type="text/css">
<!--
body {
	background-color: #ffffff;
}
-->
</style>