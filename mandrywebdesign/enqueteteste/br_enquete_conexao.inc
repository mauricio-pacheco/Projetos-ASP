<%

'Dimensões variáveis

Dim adoCon 			
Dim rsWeeklyPoll 		
Dim strAccessDB 		
Dim strSQL 		
Dim strPollQuestion 	
Dim intPollIDNum		
Dim intSelectionLoopCounter	
Dim intVotedIDNo		
Dim blnCheckForPoll		
Dim blnAlreadyVoted	


On Error Resume Next


blnCheckForPoll = True
blnAlreadyVoted = False
intPollIDNum = 1


'Inicio da conexao com o banco de dados
strAccessDB = "br_enquete_db"


'Criando a conexão
Set adoCon = Server.CreateObject("ADODB.Connection")
Set rsWeeklyPoll = Server.CreateObject("ADODB.Recordset")
 
'Abrindo a conexão
adoCon="DRIVER={Microsoft Access Driver (*.mdb)};"

adoCon = adoCon & "DBQ=" & server.mappath(strAccessDB)

'Inicio das variaveis strSQL 
strSQL = "SELECT * FROM br_enquete_dados ORDER By id_no DESC;"

rsWeeklyPoll.Open strSQL, adoCon, 3

If rsWeeklyPoll.EOF Then

	blnCheckForPoll = False	

Else 
	
	strPollQuestion = rsWeeklyPoll("Question")	
	
	intPollIDNum = CInt(rsWeeklyPoll("id_no"))
	
	For intReadInVotesLoopCounter = 1 To 7

	intToatalPollVotes = intToatalPollVotes + CInt(rsWeeklyPoll("Votes_" & intReadInVotesLoopCounter & ""))
	Next
	
	intVotedIDNo = CInt(Request.Cookies("Poll")("PollID"))
	
	If intVotedIDNo = intPollIDNum Then blnAlreadyVoted = True
	
End If
%>
<script  language="JavaScript">
<!-- br_enquete

//Função pop-up
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}

// -->
</script>
<form method="post" action="br_enquete.asp" target="poll" onSubmit="window.open('', 'poll', 'toolbar=0,location=0,status=0,menubar=0,scrollbars=1,resizable=1,width=460,height=400')">
  <table width="200" border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#eeeeee">
    <tr> 
      <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2"> 
        <% = strPollQuestion %>
        </font></td>
    </tr>
    <tr> 
      <td> 
        <%
If blnCheckForPoll = True Then

	For intSelectionLoopCounter = 1 To 7
	
If NOT rsWeeklyPoll("Selection_" & intSelectionLoopCounter) = "" Then
		
			If blnAlreadyVoted = False Then		
				
				Response.Write vbCrLf & "	<tr><td><input type=""radio"" name=""PollVote"" value=""Votes_" & intSelectionLoopCounter & """>"
					
				
				Response.Write vbCrLf & "	<font face=""Arial, Helvetica, sans-serif"" size=""1"">" & rsWeeklyPoll("Selection_" & intSelectionLoopCounter) & "</font></td></tr>"
				
			Else
			
				If intToatalPollVotes = 0 Then 
					dblPollVotePercentage = FormatPercent(0, 0)
					
				Else
					
					dblPollVotePercentage = FormatPercent((rsWeeklyPoll("Votes_" & intSelectionLoopCounter) / intToatalPollVotes), 0)
				End If
				
				
				Response.Write vbCrLf & "  	     <tr>"
				Response.Write vbCrLf & "  	       <td colspan=""2""><font face=""Arial, Helvetica, sans-serif"" size=""1"">" & rsWeeklyPoll("Selection_" & intSelectionLoopCounter) & "</font></td>"
				Response.Write vbCrLf & "  	     </tr>"
				Response.Write vbCrLf & "  	     <tr>"
				Response.Write vbCrLf & "  	     <td width=""140""><img src=""barra.gif"" width=""" & dblPollVotePercentage & """ height=""11""></td>"
				Response.Write vbCrLf & "  	     <td width=""9"" align=""right""><font face=""Arial, Helvetica, sans-serif"" size=""1"">" & dblPollVotePercentage & "</font></td>"
				Response.Write vbCrLf & "  	     </tr>"
			
			End If
		End If
	Next	
			
	%>
      </td>
    </tr>
    <tr> 
      <td align="center" colspan="2"> 
        <%
        If blnAlreadyVoted = False Then	
        %>
        <input type="hidden" name="id" value="<% = intPollIDNum %>">
        <input type="submit" value="Votar" name="submit">
        <%
        
        Else
	         
		Response.Write vbCrLf & "		<font face=""Arial, Helvetica, sans-serif"" size=""1"">Total de votos: " & intToatalPollVotes & "</font>"
	End If


Else	
	Response.Write vbCrLf & "Não existem enquetes para serem exibidas"
End If	


Set adoCon = Nothing
rsWeeklyPoll.Close
Set rsWeeklyPoll = Nothing 
      
%>
      </td>
    </tr>
    <tr> 
      <td align="center" colspan="2"><a href="JavaScript:openWin('br_enquete.asp?ID=<% = intPollIDNum %>','poll','toolbar=0,location=0,status=0,menubar=0,scrollbars=1,resizable=1,width=460,height=400')"><font face="Arial, Helvetica, sans-serif" size="1">Ver resultados</font></a></td>
    </tr>
  </table>
</form>
