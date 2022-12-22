<html>

<head>
<title>Forum Posting</title><STYLE TYPE="text/css">
<!--
A:hover {background-color: cornsilk; color: black; text-decoration: none;}
-->
</STYLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>

<body bgcolor="#000000" text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<!-- #Include File="basics.inc" -->
<!-- #Include file="db.inc" -->
<div align="center">
  <p><img src="mandryforum.jpg" width="588" height="29"> </p>
  <p><a href="../index.asp"><img src="../homeforum.jpg" width="102" height="32" border="0"></a></p>
</div>
<div align="center">
  <center>

<table border="0" width="701" align="centre" cellspacing="0" cellpadding="0">
  <tr>
        <td width="18" bgcolor="#000000" valign="top">&nbsp;</td>

        <td width="315" bgcolor="#000000"><font face="Arial" color="#FFFFFF"><big>Mensagem 
          Enviada! </big></font></td>
        <td width="315" bgcolor="#000000"> 
          <p align="right"><font color="#FFFFFF" face="Arial"><b><a href="index.asp">Lista 
            Mensagens </a></b></font></td>
  <center>
        <td width="3" bgcolor="#000000" valign="top"> 
          <p align="right">&nbsp;</p>
  </td>

    </tr>
    <tr>
        <td width="18" bgcolor="#000000" valign="top">&nbsp;</td>
        <td width="630" bgcolor="#000000" colspan="2"> 
          <%
comments = Request.Form("comments")
name = Request.Form("name")
email = Request.Form("email")
If email="" then email="Not disclosed"
subject = Request.Form("subject")
name = REPLACE(name, "'", "&#39")
email = REPLACE(email, "'", "&#39")
subject = REPLACE(subject, "'", "&#39")
comments = REPLACE(comments, "'", "&#39")
name=REPLACE(name, "<", " ")
subject=REPLACE(subject, "<", " ")
email=REPLACE(email, "<", " ")
comments=REPLACE(comments, "<", "")
name=REPLACE(name, ">", " ")
subject=REPLACE(subject, ">", " ")
email=REPLACE(email, ">", " ")
comments=REPLACE(comments, ">", "")

comments=REPLACE(comments, Chr(13), "<br>")

Tp=Request.Form("TypeofPost")

Select case Tp

Case "New"
MessageID="1"
MessageNo=1

MyCols="[MessageID]" 
MyVals="'" & MessageID &"'"
MySql="INSERT INTO threads (" & MyCols & ") VALUES (" & MyVals & ")"
my_Conn.Execute MySql

MySql="SELECT Max(threadID) AS themax FROM threads"
Set RS = Server.CreateObject("ADODB.Recordset")
RS.Open MySql, my_Conn
threadID = RS("themax")


Case "Reply"
MySql="SELECT Max(MessageNo) AS themax FROM Messages Where ThreadID=" & Request.Form("ThreadID")
Set RS = Server.CreateObject("ADODB.Recordset")
RS.Open MySql, my_Conn
MessageNo = RS("themax") + 1
MessageID=Request.Form("PrevID") & "." & MessageNo
threadID=Request.Form("ThreadID")

End Select

RS.close


%>
          <%
MyCols="[MessageID],[ThreadID],[MessageNo], [Message],[Poster], [Posted], [Subject], [Email]" 
MyVals="'" & MessageID &"',"
MyVals=MyVals & threadID &","
MyVals=MyVals & MessageNo & ","
MyVals=MyVals & "'"&comments&"',"
MyVals=MyVals & "'"&name&"',"
subtime=Now
MyVals=MyVals & "'"&subtime&"',"
MyVals=MyVals & "'"&subject&"',"
MyVals=MyVals & "'"&email&"'"


MySql="INSERT INTO Messages (" & MyCols & ") VALUES (" & MyVals & ")"

my_Conn.Execute MySql
my_Conn.close
Set my_Conn = Nothing
%>
          <p></p>


          <p><font size="3" face="Arial">A Mandry Web Design agradece a sua opni&atilde;o.Obrigado!</font><font face="Arial"><small><br>
</small></font></p>

          <p><font face="Arial"><small><a href="index.asp">Clique aqui para enviar 
            mais mensagens ao nosso Forum</a></small></font><br>
          </p>
          <p align="center"><img src="barraforum.jpg" width="603" height="33"> 
          </p>

<p> <br>
<a href="../index.htm"></p>
</a></td>
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
