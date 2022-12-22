<%
'Dimensões variáveis
Dim adoCon 
Dim strCon	
Dim strAccessDB 	
Dim strSQL 
Dim saryInputChoice(7)			
Dim blnAddNewPoll

blnAddNewPoll = True


strInputQuestion = Request.Form("Question")

strInputQuestion = Replace(strInputQuestion, "'", "''")

For intGetChoiceLoopCounter = 1 To 7
	saryInputChoice(intGetChoiceLoopCounter) = Request.Form("choice" & intGetChoiceLoopCounter)
	
	saryInputChoice(intGetChoiceLoopCounter) = Replace(saryInputChoice(intGetChoiceLoopCounter), "'", "''")
Next


If strInputQuestion = "" OR saryInputChoice(1) = "" OR saryInputChoice(2) = "" Then blnAddNewPoll = False
 
 
If blnAddNewPoll = True Then
	
	strAccessDB = "br_enquete_db"

	Set adoCon = Server.CreateObject("ADODB.Connection")
	Set adoRec = Server.CreateObject("ADODB.Recordset")
					 
	strCon="DRIVER={Microsoft Access Driver (*.mdb)};"
				
	strCon = strCon & "DBQ=" & Server.MapPath(strAccessDB)
		
	strSQL = "INSERT INTO br_enquete_dados ( Question, Selection_1, Selection_2, Selection_3, Selection_4, Selection_5, Selection_6, Selection_7 )"
	strSQL = strSQL & " VALUES"
	strSQL = strSQL & "('" & strInputQuestion 
	
	For intSQLChoiceLoopCounter = 1 To 7		
			strSQL = strSQL & "', '" & saryInputChoice(intSQLChoiceLoopCounter)		
	Next
	
	strSQL = strSQL & "');"
	
	adoCon.Open strCon
			
	adoCon.Execute(strSQL)

	Set adoCon = Nothing
End If

%>

<html> 
<head>
<!-- BR Enquete V.1 - Desenvolvido por Bruno Linhares - www.brdesign.net -->
<title>BR Enquete V.1 - Administra&ccedil;&atilde;o - Adicionar nova enquete</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="br_enquete_estilo.css" rel="stylesheet" type="text/css">
<body bgcolor="#FFFFFF" text="#000000" link="#0000CC" vlink="#0000CC" alink="#FF0000">
<div align="center"> 
  <h2>Adicionar nova enquete</h2>
  <p><br>
    <%
  If blnAddNewPoll = True Then 
  	Response.Write " Enquete criada com sucesso!"
  Else
  	Response.Write "ERRO! Sua enquete não pôde se criada!<br><br><a href=""JavaScript:history.back(1)"">Tente novamente</a>"
  End If
  %>
    <br>
    <br>
    <br>
    <a href="default.asp" target="_self"><font size="2" face="Verdana">Voltar 
    a página inicial</font></a><br>
  </p>
  <p>&nbsp; </p>
  <table width="90%" border="0">
    <tr> 
      <td height="10" align="center" valign="top">&nbsp;</td>
    </tr>
    <tr> 
      <td align="center" valign="top"> <div align="center"><font size="2"><font size="1"> 
          Copyright <font size="2"><font size="1">&copy;</font></font> 2003 - 
          Todos os direitos reservados - <a href="http://www.brdesign.net/" target="_blank">BRdesign</a></font></font></div></td>
    </tr>
    <tr> 
      <td height="18" align="center" valign="top"> <div align="center"><font size="2"><font size="1"><font face="Verdana"><a href="http://www.brdesign.net/" target="_blank">w 
          w w . b r d e s i g n . n e t</a></font></font></font></div></td>
    </tr>
  </table>
  
</div>
</body>
</html>
