<% Option Explicit %>
<% Response.Buffer = True %>
<%

'Dimensões variáveis
Dim adoCon 
Dim rsWeeklyPoll 
Dim strCon
Dim strAccessDB 		
Dim strSQL 
Dim strPollVote
Dim strPollQuestion 
Dim intPollIDNum
Dim intToatalPollVotes
Dim dblPollVotePercentage
Dim intSelectionLoopCounter	
Dim intReadInVotesLoopCounter
Dim blnSaveVote	


'Iniciando variáveis
intPollIDNum = 0
intToatalPollVotes = 0
blnSaveVote = True

If Request.QueryString("PollID") = "" Then

	intPollIDNum = CInt(Request.Form("id"))
	
	strPollVote = Request.Form("PollVote")
	
	If NOT strPollVote = "" Then
	
	blnSaveVote =  SavePollVotes(strPollVote, intPollIDNum)
	
	End If

Else
	intPollIDNum = CInt(Request.QueryString("PollID"))

End If
%>
<html>
<head>
<!-- BR Enquete V.1 - Desenvolvido por Bruno Linhares - www.brdesign.net -->
<title>BR Enquete V.1 - Resultado parcial</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="br_enquete_estilo.css" rel="stylesheet" type="text/css">	
</head>
<body bgcolor="#FFFFFF" text="#000000" link="#0000CC" vlink="#0000CC" alink="#FF0000">
<h2 align="center">Resultado parcial</h2>
<h2 align="center"> 
  <%
'Iniciando conexão com o banco de dados
strAccessDB = "br_enquete_db.mdb"

Set adoCon = Server.CreateObject("ADODB.Connection")
Set rsWeeklyPoll = Server.CreateObject("ADODB.Recordset")

strCon="DRIVER={Microsoft Access Driver (*.mdb)};"

strCon = strCon & "DBQ=" & Server.MapPath(strAccessDB)

strSQL = "SELECT * FROM br_enquete_dados "
If NOT intPollIDNum = 0 Then
	strSQL = strSQL & "WHERE br_enquete_dados.id_no = " & intPollIDNum
End If
strSQL = strSQL & " ORDER By id_no DESC;"

rsWeeklyPoll.Open strSQL, strCon

If rsWeeklyPoll.EOF Then

	Response.Write vbCrLf & "Não existe nenhuma enquete."

Else 	
	
	strPollQuestion = rsWeeklyPoll("Question")
	
	intPollIDNum = CInt(rsWeeklyPoll("id_no"))

	For intReadInVotesLoopCounter = 1 To 7
	
		intToatalPollVotes = intToatalPollVotes + CInt(rsWeeklyPoll("Votes_" & intReadInVotesLoopCounter & ""))
	Next
		
	
	If blnSaveVote = False Then
		Response.Write vbCrLf & "<div align=""center"">Desculpe, mas você já votou hoje.</div><br>"
	End If
	%>
</h2>
<table width="220" border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#666666">
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#eeeeee">
        <tr> 
          <td align="center"> 
            <%
	 
        Response.Write vbCrLf & "    <table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""1"">"
        Response.Write vbCrLf & "      <tr>"
               
	Response.Write vbCrLf & "            <td align=""center"" height=""31""><font face=""Arial, Helvetica, sans-serif"">" & strPollQuestion & "</font></td>"
	
	Response.Write vbCrLf & "      </tr>"
	Response.Write vbCrLf & "     </table>"	
	
	Response.Write vbCrLf & "       <table width=""215"" border=""0"" cellspacing=""0"" cellpadding=""1"" align=""center"">"

	For intSelectionLoopCounter = 1 To 7
	
		If NOT rsWeeklyPoll("Selection_" & intSelectionLoopCounter) = "" Then
	
			If intToatalPollVotes = 0 Then 
				dblPollVotePercentage = FormatPercent(0, 0)
				
			Else
		
				dblPollVotePercentage = FormatPercent((rsWeeklyPoll("Votes_" & intSelectionLoopCounter) / intToatalPollVotes), 0)
			End If
			
			Response.Write vbCrLf & "  	     <tr>"
			Response.Write vbCrLf & "  	       <td colspan=""3""><font face=""Arial, Helvetica, sans-serif"" size=""2"">" & rsWeeklyPoll("Selection_" & intSelectionLoopCounter) & "</font></td>"
			Response.Write vbCrLf & "  	     </tr>"
			Response.Write vbCrLf & "  	     <tr>"
			Response.Write vbCrLf & "  	     <td width=""142""><img src=""barra.gif"" width=""" & dblPollVotePercentage & """ height=""15""></td>"
			Response.Write vbCrLf & "  	     <td width=""7"" align=""right""><font face=""Arial, Helvetica, sans-serif"" size=""2"">" & dblPollVotePercentage & "</font></td>"
			Response.Write vbCrLf & "  	     </tr>"
			
		End If
	Next
	
	Response.Write vbCrLf & "	     </table>"

	Response.Write vbCrLf & "		<font face=""Arial, Helvetica, sans-serif"" size=""2"">Total de votos: " & intToatalPollVotes & "</font>"
	
End If


Set adoCon = Nothing
rsWeeklyPoll.Close
Set rsWeeklyPoll = Nothing      
%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td align="center" height="31"><a href="JavaScript:window.close()">Fechar 
      janela </a></td>
  </tr>
</table>
</body>
</html>
<%

Private Function SavePollVotes(ByRef strPollVoteChoice, ByRef intPollIDNum)

	Dim adoCon 			
	Dim rsSavePollVotes 
	Dim strCon	
	Dim strAccessDB 
	Dim strSQL 
	Dim intVoteChoiceCount		
	Dim intVotedIDNo
	
	SavePollVotes = True
	
	intVotedIDNo = CInt(Request.Cookies("Poll")("PollID"))
	
	If intVotedIDNo = intPollIDNum Then
	
		SavePollVotes = False
	
	Else
		
		strAccessDB = "br_enquete_db"
		
		Set adoCon = Server.CreateObject("ADODB.Connection")
		Set rsSavePollVotes = Server.CreateObject("ADODB.Recordset")

		strCon="DRIVER={Microsoft Access Driver (*.mdb)};"

		strCon = strCon & "DBQ=" & Server.MapPath(strAccessDB)
		
		strSQL = "SELECT * FROM br_enquete_dados "
		strSQL = strSQL & " WHERE id_no =" & CInt(intPollIDNum)
		
		rsSavePollVotes.CursorType = 2
	
		rsSavePollVotes.LockType = 3
		
		rsSavePollVotes.Open strSQL, strCon
						
		intVoteChoiceCount = CInt(rsSavePollVotes(strPollVoteChoice))
		      	
		intVoteChoiceCount = intVoteChoiceCount + 1
		 		 
		rsSavePollVotes.Fields(strPollVote) = CInt(intVoteChoiceCount)			
		rsSavePollVotes.Update
		
		rsSavePollVotes.Requery
						
	
		Set adoCon = Nothing
		rsSavePollVotes.Close
		Set rsSavePollVotes = Nothing 
	 	

		Response.Cookies("Poll")("PollID") = intPollIDNum
		
		'Data de experação - (14 dias)
		Response.Cookies("Poll").Expires = Now() + 14

	End If
	
End Function

%>