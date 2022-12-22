<% Response.buffer = True %>
<html>
<head>
<title>Mandry Web Design Forum</title><STYLE TYPE="text/css">
<!--
A:hover {background-color: cornsilk; color: black; text-decoration: none;}
-->
</STYLE>
<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function checkFields() {
missinginfo = "";
if (document.form.name.value == "") {
missinginfo += "\n     -  Name";
}
if(document.form.subject.value == "") {
missinginfo += "\n     -  Subject";
}
if(document.form.comments.value == "") {
missinginfo += "\n     -  Comments";
}

if (missinginfo != "") {
missinginfo ="_____________________________\n" +
"You failed to correctly fill in your:\n" +
missinginfo + "\n_____________________________" +
"\nPlease re-enter and submit again!";
alert(missinginfo);
return false;
}
else return true;
}
//-->
</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>

<body bgcolor="#000000" text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<div align="center">
  <p>
    <!-- #Include File="basics.inc" -->
    <!-- #Include file="db.inc" -->
    <!--#include file="adovbs.inc"-->
    <img src="mandryforum.jpg"> </p>
  <p><a href="../index.asp"><img src="../homeforum.jpg" width="102" height="32" border="0"></a></p>
</div>
<div align="center">
  <center>

<table border="0" width="701" cellspacing="0" cellpadding="0">
  <tr>
      <td width="8" bgcolor="#000000" valign="top">&nbsp;</td>  
      <td width="462" bgcolor="#000000"><p><font face="Arial" color="#FFFFFF"><big><%=forumName%></big></font></p>
        </td>
      <td width="82"></center>
      <td width="133" bgcolor="#000000"> 
        <p align="right"><b><font face="Arial" color="#FFFFFF"> 
          <%if Session("admin")="Yes" Then
      %>
          [ <a href="logout.asp">Logout</a> ] 
          <%
      End If
      %>
          <a href="<%=homeURL%>">Forum</a></font></b></td>
  <td width="12"><center>
      <td width="4" bgcolor="#000000" valign="top"> 
        <p align="left">&nbsp;</p>
  </td>

    </tr>
    <tr>
      <td width="8" bgcolor="#000000" valign="top">&nbsp;</td>
      <td bgcolor="#000000" colspan="2"> 
        <%
  
  Set RS = Server.CreateObject("ADODB.Recordset")

   MySql="SELECT Count(*) AS MessageTot FROM messages"
  Rs.Open MySql, my_conn
  MessageTot=rs("MessageTot")
  rs.close
  
  
  %>
        <font face="Arial" size="2">O Forum Cont&eacute;m <%=MessageTot%> mensagens:</font> 
        <p> 
          <% Rem Now extract the message list from the database and thread messages%>
          <%


'MySql="SELECT messages.* FROM threads INNER JOIN messages ON threads.ThreadID = messages.threadID ORDER BY messages.threadID DESC, messages.MessageID;"
MySql="SELECT messages.* FROM messages ORDER BY messages.threadID DESC, messages.MessageID;"


RS.cursorlocation=aduseclient
RS.Open MySql, my_Conn, adOpenStatic, adLockReadOnly, adCmdText
If Request.QueryString("page") = "" Then
	iCurrentPage = 1
Else
	iCurrentPage = CInt(Request.QueryString("page"))
End If

RS.PageSize = postsperpage

If RS.PageCount > 0 then
	RS.AbsolutePage = iCurrentPage
Else
	iCurrentPage = 0
End If

Session("CurrentPage") = iCurrentPage


indents=0
do while RS.AbsolutePage = iCurrentPage And Not RS.EOF 	
	dim tt 
   tt = rs("messageID")
	For n = 1 to len(tt)
	if mid(tt, n, 1) = "." Then
	indents = indents + 1
	End If
	next
	
Response.write "<font color = '#00FF00' face='Arial'><small>"
For n= 1 to indents
Response.write "&nbsp;&nbsp;&nbsp;"
Next

lpDate=RS("Posted")
If DateDiff("d",lpDate , DATE) < DAYflag then 
    lastpostday=weekday(lpDate)
    pTime =  formatdatetime(lpDate, 4)
    lpDate =pweekday(lastpostday) & " " & pTime
  End If


Response.write "&nbsp;<img src='bull.gif'>&nbsp;<a href='display.asp?messageNo=" & rs("MessageNo") & "&threadID=" & rs("threadID") & "'>" & rs("Subject") & "</a> Mensagem enviada por " & RS("Poster") & " Dia: " & lpDate & "</small></font>"
 
snow1 = Now
	If DateDiff("d", snow1, DATE) < NEWflag then 
		Response.write "<font color = 'red' face='Arial'><small><i> - NOVA!!</i></small></font>"
	End If
	
if Session("admin")="Yes" Then
	response.write "  - <a href='delete.asp?messageNo=" & rs("MessageNo") & "&threadID=" & rs("threadID") & "'>Delete</a>"
	if rs("MessageNo")=1 Then
		Response.write " (thread)"
	End If
End If

Response.write "<br>"

indents = 0
RS.MoveNext
Loop

%>
        </p>
        <p> 
          <%
If RS.PageCount > 1 then

'Print Previous Page if required
If iCurrentPage <> 1 then
	Response.Write "<font face='Arial'><small><a href=""index.asp?page=" & iCurrentPage - 1 & """>Página Anterior</a></small></font>"
Else
	Response.Write "<font face='Arial'><small>Página Anterior</small></font>"
End If

'Print direct access page numbers.
For intCount = 1 to RS.PageCount
	
	If intCount = 1 then
		Response.Write " | "
	End If
	
	If intCount = iCurrentPage then
		Response.Write "<font face='Arial'><small>" & intCount & " | </small></font>"
	Else
		Response.Write "<font face='Arial'><small><a href=""index.asp?page=" & intCount & """>" & intCount & "</a> | </small></font>"
	End If
	
Next

'Print Next Page if required
If iCurrentPage <> RS.PageCount then
	Response.Write "<font face='Arial'><small><a href=""index.asp?page=" & iCurrentPage + 1 & """>Próxima Página</a></small></font>"
Else
	Response.Write "<font face='Arial'><small>Próxima Página</small></font>"
End If

End If

Response.Write "<br><font face='Arial'><small>Página " & iCurrentPage & " de " & RS.PageCount & "</small></font>"
%>
        </p>
        <p align="center"><img src="barraforum.jpg" width="603" height="33"></p>
        <% Rem Not draw the form where new messages can be entered:%>
        <%
TypeofPost="New"
PrevID=""
my_conn.close

%>
        <!-- #Include File="post.inc" -->
</td>
      <td width="133" bgcolor="#000000" valign="top">&nbsp; </td>
  </tr><tr>
      <td width="8" bgcolor="#000000" valign="top">&nbsp;</td>
      <td valign="top" bgcolor="#000000" colspan="2"> 
        <p align="center"><font color="#FFFFFF"><b>&nbsp;&nbsp;</b></font></p>
 </td>
      <td width="133" bgcolor="#000000" valign="top">&nbsp;</td>
  </tr>
</table>
  </center>
</div>
</body>
</html>
