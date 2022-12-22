<% Option Explicit %>
<% Response.Buffer = True %>
<%

'Dimensões variáveis
Dim adoCon 
Dim rsWeeklyPoll 
Dim strCon	
Dim strAccessDB 
Dim strSQL 
Dim strPreviousPollQuestion	
Dim intPreviousPollQuestionID	
Dim dtmPreviousPollQuestionDate
Dim intRecordPositionPageNum 	
Dim intRecordLoopCounter


'Declarações

Const intRecordsPerPage = 9 	'Número de enquetes anteriores por página

If Request.QueryString("pagina") = "" Then
	intRecordPositionPageNum = 1

Else
	intRecordPositionPageNum = CInt(Request.QueryString("pagina"))
End If	

%>
<html>
<head>
<!-- BR Enquete V.1 - Desenvolvido por Bruno Linhares - www.brdesign.net -->
<title>BR Enquete V.1 - Enquetes anteriores</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="br_enquete_estilo.css" rel="stylesheet" type="text/css">
	
</head>
<body bgcolor="#FFFFFF" text="#000000" link="#0000CC" vlink="#0000CC" alink="#FF0000"><div align="center">
<p align="center"><font size="3" face="Verdana"><strong>Enquetes anteriores</strong></font></p>
<table width="370" border="0" cellspacing="0" cellpadding="1">
    <%
strAccessDB = "br_enquete_db"

Set adoCon = Server.CreateObject("ADODB.Connection")
Set rsWeeklyPoll = Server.CreateObject("ADODB.Recordset")
			 
strCon="DRIVER={Microsoft Access Driver (*.mdb)};"
		
strCon = strCon & "DBQ=" & Server.MapPath(strAccessDB)

strSQL = "SELECT * FROM br_enquete_dados "
strSQL = strSQL & " ORDER By br_enquete_dados.id_no DESC;"

rsWeeklyPoll.Open strSQL, strCon, 3

rsWeeklyPoll.PageSize = intRecordsPerPage

If NOT rsWeeklyPoll.EOF Then rsWeeklyPoll.AbsolutePage = intRecordPositionPageNum

For intRecordLoopCounter = 1 to intRecordsPerPage

	If rsWeeklyPoll.EOF Then Exit For

	intPreviousPollQuestionID = CInt(rsWeeklyPoll("id_no"))

	strPreviousPollQuestion = rsWeeklyPoll("Question")

	dtmPreviousPollQuestionDate = rsWeeklyPoll("Date")
	
	Response.Write vbCrLf & "	 <tr>"
	Response.Write vbCrLf & "         <td width=""250""><a href=""br_enquete.asp?PollID=" &  intPreviousPollQuestionID  & "&pagina=" & intRecordPositionPageNum & """ target=""_self"">" & strPreviousPollQuestion & "</a></td>"	
	Response.Write vbCrLf & "	  <td width=""120"" align=""right"">" & FormatDateTime(dtmPreviousPollQuestionDate, VbLongDate) & "</td>"
	Response.Write vbCrLf & "	 </tr>"
	
	rsWeeklyPoll.MoveNext

Next

 %>
  </table>
  <br>
  
<table width="370" border="0" cellspacing="1" cellpadding="1" align="center" height="21">
  <tr align="center"> 
    <td align="left" width="119"> 
      <%
	
If intRecordPositionPageNum > 1 Then 
	Response.Write "	<a href=""br_enquete_anteriores.asp?pagina=" &  intRecordPositionPageNum - 1  & """ target=""_self"">&lt;&lt;&nbsp;Anterior</a>"   	     	
End If
      
      %>
    </td>
    <td width="20"> 
      <%
       
If intRecordPositionPageNum > 1 or NOT rsWeeklyPoll.EOF Then
	Response.Write "Enquetes Anteriores"
End If
       
      %>
    </td>
    <td align="right" width="114"> 
      <%
       
If NOT rsWeeklyPoll.EOF then   	
	Response.Write "	<a href=""br_enquete_anteriores.asp?pagina=" &  intRecordPositionPageNum + 1  & """ target=""_self"">proxima&nbsp;&gt;&gt;</a>"	   	
End If 

Set adoCon = Nothing
rsWeeklyPoll.Close
Set rsWeeklyPoll = Nothing       
       
      %>
      <div align="right"></div></td>
  </tr>
</table>
  
<div align="center"><br>
  <a href="JavaScript:window.close()"><font size="2" face="Verdana">Fechar janela</font></a><br>
  <br>
</div>
</body>
</html>