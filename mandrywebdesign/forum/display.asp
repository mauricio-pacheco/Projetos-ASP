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
    <img src="mandryforum.jpg" width="588" height="29"> </p>
  <p><a href="../index.asp"><img src="../homeforum.jpg" width="102" height="32" border="0"></a></p>
</div>
<div align="center">
  <center>

<table border="0" width="701" cellspacing="0" cellpadding="0">
  <tr>
      <td width="18" bgcolor="#000000" valign="top">&nbsp;</td>  
      <td width="315" bgcolor="#000000"><font face="Arial" color="#FFFFFF"><big>Ver 
        Mensagens </big></font></td>
  </center>

      <td width="315" bgcolor="#000000"> 
        <p align="right"><b><font face="Arial" color="#FFFFFF"><a href="index.asp?page=<%=Session("CurrentPage")%>">Forum</a></font></b></td>
  <center>
      <td width="3" bgcolor="#000000" valign="top"> 
        <p align="left">&nbsp;</p>
  </td>

    </tr>
    <tr>
      <td width="18" bgcolor="#000000" valign="top">&nbsp;</td>
      <td width="630" bgcolor="#000000" colspan="2"> 
        <% Rem Now extract the message list from the table and thread messages%>
        <%
threadID=Request.QueryString("threadID")
MessageNo=Request.QueryString("MessageNo")

'MySql="SELECT messages.MessageID FROM threads INNER JOIN messages ON threads.ThreadID = messages.threadID WHERE  ((threads.forumID)=1) ORDER BY messages.threadID DESC, messages.MessageID;"
MySql="SELECT messages.* FROM messages Where Messages.threadID=" & threadID & " ORDER BY messages.MessageID;"

Set RS = Server.CreateObject("ADODB.Recordset")

RS.Open MySql, my_Conn, adOpenStatic, adLockReadOnly, adCmdText

indents=0
do while  Not RS.EOF
	dim tt 
   tt = rs("messageID")
	For n = 1 to len(tt)
	if mid(tt, n, 1) = "." Then
	indents = indents + 1
	End If
	next
	
Response.write "<font color = '#FFFFFF' face='Arial'><small>"
For n= 1 to indents
Response.write "&nbsp;&nbsp;&nbsp;"
Next

lpDate=RS("Posted")
If DateDiff("d",lpDate , DATE) < DAYflag then 
    lastpostday=weekday(lpDate)
    pTime =  formatdatetime(lpDate, 4)
    lpDate =pweekday(lastpostday) & " " & pTime
  End If


if MessageNo<>Trim(RS("MessageNo")) Then 
Response.write "&nbsp;<img src='bull.gif'>&nbsp;<a href='display.asp?messageNo=" & rs("MessageNo") & "&threadID=" & rs("threadID") & "'>" & rs("Subject") & "</a> Mensagem enviada por " & rs("Poster") & " Dia: " & lpDate & "</small></font>"
Else
Response.write "&nbsp;<img src='bull.gif'>&nbsp;<b>" & rs("Subject") & " Mensagem enviada por " & rs("Poster") & " Dia: " & lpDate & "<i> - Estamos aqui pra isso!!!!</i></b></small></font>"
subject=RS("Subject")
poster=RS("Poster")
posted=RS("Posted")
email=RS("Email")
comments=RS("Message")
PrevID=RS("MessageID")
threadID=RS("threadID")
End If

snow1 = Now
	If DateDiff("d", snow1, DATE) < NEWflag then 
		Response.write "<font color = 'red' face='Arial'><small><i> - NOVA!!</i></small></font>"
	End If
Response.write "<br>"
indents = 0
RS.MoveNext
Loop

%>
        <p align="center"><img src="barraforum.jpg" width="603" height="33"></p>
        <p align="center">
          <%
Response.write "<font face='Arial'><small>"
Response.write "<p>Mensagem Resposta (Título: " & subject & ") mandada por "
If email<>"Not disclosed" Then
Response.write "<a href='mailto:" & email & "'>" & poster & "</a>"
else
Response.write poster
End If
Response.write ", Dia: " & posted & ".</p>"
Response.write "<p>" & comments & "</p></small></font>"
%>
        </p>
        <p> 
          <% Rem Not draw the form where new messages can be entered:%>
          <%
TypeofPost="Reply"
my_conn.close

%>
        </p>
        <p align="center"><img src="barraforum.jpg" width="603" height="33"></p>
        <!-- #Include File="post.inc" -->
</td>
      <td width="1" bgcolor="#000000" valign="top">&nbsp; </td>
  </tr><tr>
      <td width="28" bgcolor="#000000" valign="top">&nbsp;</td>
      <td width="745" valign="top" bgcolor="#000000" colspan="2"> 
        <p align="center"><font color="#FFFFFF"><b></b></font></p>
 </td>
      <td width="21" bgcolor="#000000" valign="top">&nbsp;</td>
  </tr>
</table>
  </center>
</div>
</body>
</html>
