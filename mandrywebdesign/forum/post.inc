<form method="POST" action="process.asp" name="form" onSubmit="return checkFields()" ;>
  <table border="0" width="50%" height="231">
    <tr>
      <td width="20%" height="23" align="right"></td>
      <td width="80%" height="23"><small><font face="Arial">
<%If TypeOfPost="Reply" Then%>
Poste a sua mensagem:
<%Else%>
Poste uma nova mensagem:<%End If%></font></small></td>
    </tr>
    <tr>
      <td width="20%" height="23" align="right"><small><font face="Arial">Nome:</font></small></td>
      <td width="80%" height="23"><font face="Arial"><input type="text" name="name" size="31"></font></td>
    </tr>
    <tr>
      <td width="20%" height="23" align="right"><small><font face="Arial">E-mail:</font></small></td>
      <td width="80%" height="23"><font face="Arial"><input type="text" name="email" size="31"></font></td>
    </tr>
    <tr>
      <td width="20%" height="23" align="right"><small><font face="Arial">Pergunta:</font></small></td>
      <td width="80%" height="23"><font face="Arial"><input type="text" name="subject" value="<%If TypeOfPost="Reply" Then 
If Left(subject,3)<>"Re:" Then
Response.write "Re: "
End If
Response.write subject
End If%>" size="31"></font></td>
    </tr>
    <tr>
      <td width="20%" height="138" align="right"><small><font face="Arial">Comentários:</font></small></td>
      <td width="80%" height="138"><font face="Arial"><textarea rows="14" name="comments" cols="54"></textarea> </font> </td>
    </tr>
    <tr>
      <td width="20%" height="23" align="right"></td>
      <td width="80%" height="23"><input type="submit" value="Enviar Mensagem" name="B1"></td>
     <input type="hidden" name="TypeofPost" value="<%=TypeofPost%>">
      <input type="hidden" name="prevID" value="<%=prevID%>">
<input type="hidden" name="threadID" value="<%=threadID%>">
    </tr>
  </table>
</form>
