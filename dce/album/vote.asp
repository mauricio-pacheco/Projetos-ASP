<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_vote.inc"-->

<%
Set objConn = Server.CreateObject ("ADODB.Connection")
objConn.Open strConnect
strimage  	= rURLSpace(Request("image"))
strfolder 	= rURLSpace(Request("folder"))
strpage 	= rURLSpace(Request("page"))
strtime 	= FormatDateTime(igalleryNow,3)
strdate 	= FormatDateTime(igalleryNow,2)
%>

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<link rel="stylesheet" type="text/css" href="style/style.css">

<script language="JavaScript">
<!--
function ShowVote(url,closeIt,delay){
opener.location.href = url;
if (closeIt == true)setTimeout('self.close()',delay);
}
//-->
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10" marginwidth="10" marginheight="10">

<% If Request("mode") = "vote" Then %>

<%
Dim myLink
Dim VoteOK
Dim ipAddr
Dim ipsRec
Set ipsRec = Server.CreateObject("ADODB.RecordSet")

VoteOK = False
ipAddr = Request.ServerVariables("REMOTE_ADDR")
myLink = Request.QueryString("pid")

If myLink = "" Then
%>

<font class="largeheader"><%= IGvote_err %><br></font>
<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>
<font class="text">
<%= IGvote_errmsg %>&nbsp;<a class="link" href="mailto:<%= MailAddress %>"><%= IGvote_sysadm %></a>.<br>
</font>

<p>

<table align="center" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="23"><img src="images/sm-close.gif" width=19 height=19 border=0 alt=""></td>
<td><a class="linkmed" href="javascript:void(0);" onClick="ShowVote('igallery.asp?d=\\<%= URLSpace(Replace(Request("folder"),"\","\\")) %>\\&page=<%= strpage %>',true,1000)">
<b><%= IGvote_close %></b></a></td>
</tr>
</table>

<%
Else

Set linkRec = Server.CreateObject("ADODB.RecordSet")
linkRec.Open "SELECT * FROM Descriptions WHERE ID = " & mylink, objConn, 3, 3, 1

If linkRec.EOF Then
%>

<font class="largeheader"><%= IGvote_err %><br></font>
<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>
<font class="text">
<%= IGvote_errmsg %>&nbsp;<a class="link" href="mailto:<%= MailAddress %>"><%= IGvote_sysadm %></a>.<br>
</font>

<p>

<table align="center" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="23"><img src="images/sm-close.gif" width=19 height=19 border=0 alt=""></td>
<td><a class="linkmed" href="javascript:void(0);" onClick="ShowVote('igallery.asp?d=\\<%= URLSpace(Replace(Request("folder"),"\","\\")) %>\\&page=<%= strpage %>',true,1000)">
<b><%= IGvote_close %></b></a></td>
</tr>
</table>

<%
Else
ipsrec.Open "SELECT * FROM votes WHERE ImageID = " & mylink & " AND IP = '" & ipAddr & "';", objConn, 3, 3, 1

if ipsRec.EOF then

Dim rating
Dim tvotes
Dim prate
Dim newrate
rating = Request.Form("rating")
tvotes = linkRec("votes")
prate = linkRec("rating")
objConn.Execute "UPDATE Descriptions SET rating = "& Round(((tvotes * prate) + rating)/(tvotes+1),2)_
&", votes = "& tvotes+1 &" WHERE ID = " & myLink
%>

<font class="largeheader"><%= IGvote_suc %><br></font>
<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>
<font class="text">
<%= IGvote_sucmsg %><br>
</font>

<p>

<table align="center" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="23"><img src="images/sm-close.gif" width=19 height=19 border=0 alt=""></td>
<td><a class="linkmed" href="javascript:void(0);" onClick="ShowVote('igallery.asp?d=\\<%= URLSpace(Replace(Request("folder"),"'","\'")) %>\\&page=<%= strpage %>',true,1000)">
<b><%= IGvote_close %></b></a></td>
</tr>
</table>

<%
objConn.Execute ("INSERT INTO Votes (ImageID, IP) SELECT '" & myLink & "' AS ImageID, '" & ipAddr & "' AS IP;")
VoteOK = True

Else
%>

<font class="largeheader"><%= IGvote_perr %><br></font>
<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>
<font class="text">
<%= IGvote_perrmsg %>&nbsp;<a class="link" href="mailto:<%= MailAddress %>"><%= IGvote_sysadm %></a>.<br>
</font>

<p>

<table align="center" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="23"><img src="images/sm-close.gif" width=19 height=19 border=0 alt=""></td>
<td><a class="linkmed" href="javascript:void(0);" onClick="ShowVote('igallery.asp?d=\\<%= URLSpace(Replace(Request("folder"),"'","\'")) %>\\&page=<%= strpage %>',true,1000)">
<b><%= IGvote_close %></b></a></td>
</tr>
</table>

<%
End If
End If
End if

Else

If Request.QueryString("pid") = "" Then

Set RS = Server.CreateObject("ADODB.Recordset")
Set RS.ActiveConnection = objConn
RS.CursorType = adOpenStatic
lSQL = "SELECT ID, imagename, folder, title, description, lasttime, lastdate, total FROM Descriptions WHERE imagename='"&strimage&"' AND folder='"&Replace(strfolder,"'","''")&"'"
RS.Open lSQL,,,adCmdTable
If RS.recordcount = 0 Then
RS.AddNew
RS("imagename") 	= strimage
RS("folder") 		= strfolder
RS("title")       	= strtitle
RS("description") 	= strdescription
End If
RS.Update

Set RS1 = Server.CreateObject("ADODB.Recordset")
SQL1 = "SELECT * FROM Descriptions " & _
"WHERE imagename ='" & strimage & _
"' AND folder ='" & Replace(strfolder,"'","''") &  _
"' "
RS1.Open SQL1, objConn, adOpenStatic, adLockReadOnly, adCmdText

myLink = RS1("ID")

Else
myLink = Request.QueryString("pid")
End If

'DotPosition = InStrRev(strimage, ".")
'FileExt = Mid(strimage,DotPosition + 1)
'FileExt = LCase(FileExt)
FileExt = fExt(strimage)
%>

<font class="largeheader"><%= IGvote_vb %><br></font>
<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td style="padding-right: 5px;">
<%
Select Case FileExt
Case "jpg", "jpeg", "gif", "bmp", "png"
%>
<% If Nailer Then %>
<img src="<%= URLpath %>/<%= rURLSpace(strfolder) %>/tn-<%= rURLSpace(strimage) %>" width="130" border=""0""><br>
<% Else %>
<img src="<%= URLpath %>/<%= rURLSpace(strfolder) %>/<%= rURLSpace(strimage) %>" width="130" border=""0""><br>
<% End If %>
<%
Case "mid", "midi", "au", "aif", "aiff", "snd", "wav", "mp3", "mpga"
%>
<img src="images/file-audio1.gif" height="60" width="60" border="0" alt="Download Audio File"><br>
<font class="textsm"><b><%= IGvote_af %></b><br></font>
<%
Case "avi", "mpg", "mpeg", "mov", "rm", "ram", "swf", "wmv", "qt"
%>
<img src="images/file-video1.gif" height="60" width="60" border="0" alt="Download Video File"><br>
<font class="textsm"><b><%= IGvote_vf %></b><br></font>
<%
End Select 
%>
</td>
<td>

<table cellspacing="0" cellpadding="0" border="0">
<tr><form action="vote.asp?mode=vote&pid=<%= myLink %>" method="post">
<input type="hidden" name="folder" value="<%= strfolder %>">
<input type="hidden" name="page" value="<%= strpage %>">
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="radio" name="rating" value="10" checked></td>
<td><font class="textxsm">[5]&nbsp;</font></td>
<td><img src="images/str-10.gif" height="8" width="41" border=0 alt="5 Stars"></td>
</tr>
</table>
</td>
<td rowspan="5" width="20"></td>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="radio" name="rating" value="9"></td>
<td><font class="textxsm">[4 1/2]&nbsp;</font></td>
<td><img src="images/str-9.gif" height="8" width="41" border=0 alt="4 1/2 Stars"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="radio" name="rating" value="8"></td>
<td><font class="textxsm">[4]&nbsp;</font></td>
<td><img src="images/str-8.gif" height="8" width="41" border=0 alt="4 Stars"></td>
</tr>
</table>
</td>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="radio" name="rating" value="7"></td>
<td><font class="textxsm">[3 1/2]&nbsp;</font></td>
<td><img src="images/str-7.gif" height="8" width="41" border=0 alt="3 1/2 Stars"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="radio" name="rating" value="6"></td>
<td><font class="textxsm">[3]&nbsp;</font></td>
<td><img src="images/str-6.gif" height="8" width="41" border=0 alt="3 Stars"></td>
</tr>
</table>
</td>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="radio" name="rating" value="5"></td>
<td><font class="textxsm">[2 1/2]&nbsp;</font></td>
<td><img src="images/str-5.gif" height="8" width="41" border=0 alt="2 1/2 Stars"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="radio" name="rating" value="4"></td>
<td><font class="textxsm">[2]&nbsp;</font></td>
<td><img src="images/str-4.gif" height="8" width="41" border=0 alt="2 Stars"></td>
</tr>
</table>
</td>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="radio" name="rating" value="3"></td>
<td><font class="textxsm">[1 1/2]&nbsp;</font></td>
<td><img src="images/str-3.gif" height="8" width="41" border=0 alt="1 1/2 Stars"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="radio" name="rating" value="2"></td>
<td><font class="textxsm">[1]&nbsp;</font></td>
<td><img src="images/str-2.gif" height="8" width="41" border=0 alt="1 Stars"></td>
</tr>
</table>
</td>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input type="radio" name="rating" value="1"></td>
<td><font class="textxsm"><img src="images/spacer.gif" width=11 height=1 border=0 alt="">[1/2]&nbsp;</font></td>
<td><img src="images/str-1.gif" height="8" width="41" border=0 alt="1/2 Stars"></td>
</tr>
</table>
</td>
</tr>
</table>

</td>
</tr>
<tr>
<td style="padding-top: 7px;" colspan="2"><input class="button" style="font-size: 8.5pt; width: 130px" type="submit" value="<%= IGvote_but %>"></td>
</tr></form>
</table>


<% End If %>