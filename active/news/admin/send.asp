<%
option explicit'must be declared
%>
<!--#include file="config.inc"-->
<%
response.buffer = true
Server.ScriptTimeout = 1000000

dim useraction,subject,comm,emails,conn,rs,sql
dim totalMails



Set Conn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Conn.Open dsn
SQL = "SELECT emails from emails"
rs.Open SQL, Conn, 1, 3
totalMails = rs.recordcount

useraction=request("action")
select case useraction
case "send"
	Set Conn = Server.CreateObject("ADODB.Connection")
	Set Rs = Server.CreateObject("ADODB.Recordset")
    Conn.Open dsn
    SQL = "SELECT emails from emails order by id"
	rs.open sql,conn
	do while not rs.eof
		emails=rs("emails")
		subject = request.form("subject")
		comm = request.form("comm")
		Dim objCDO
		Set objCDO = Server.CreateObject("CDONTS.NewMail")
		objCDO.To = emails
		'-----------------------------------
		'change to your email!!
		'-----------------------------------
		objCDO.From = "Ghost Net"
		objCDO.Subject = subject
		objCDO.Body = comm
		objCDO.Send
		rs.movenext
	loop
	set objCDO = nothing
	rs.close
	set rs = nothing
	conn.close
	set conn = nothing
	response.write "<script>alert('Enviado com sucesso!');"
	response.write "location.href='index.asp'</script>"
	response.end
end select
rs.close
	set rs = nothing
	conn.close
	set conn = nothing
%>
<HTML>
<HEAD>
<script>
function openwin()
{
	NewWindow =window.open("hebrew.htm","hebrew","width=500,height=200")
}
function submitit(){
var email=document.subform.email.value;
if (email==""){
alert("Digite seu E-mail")
document.subform.email.focus()
return false
	}
if (email.indexOf('@', 0) == -1 || email.indexOf('.', 0) == -1){ alert("E-mail inválido!");
		document.subform.email.focus()
		return false
		}
}

</script>
<style>
BODY
{
    BACKGROUND-COLOR: white;font-size:14px;font-family:Arial,Verdana;
}
a
{
color:blue;text-decoration:none;
}

a:hover
{
color:red;text-decoration:underline;
}

td
{
font-size:12px;font-family:Arial,Verdana;
}


.inputSubmit
{
font-size:7pt;
color:white;
background-color: black;
BORDER-BOTTOM: 1px solid;
BORDER-LEFT: 1px solid;
BORDER-RIGHT: 1px solid;
BORDER-TOP: 1px solid;
z-index:10;
}

.inputBut
{
font-family:Arial,Verdana;
font-size:10pt;
background-color: white;
BORDER-BOTTOM: 1px solid;
BORDER-LEFT: 1px solid;
BORDER-RIGHT: 1px solid;
BORDER-TOP: 1px solid;
z-index:10;
}

</style>
<TITLE>Ghost Net Newsletter</TITLE>

</HEAD>
<BODY BGCOLOR=#FFFFFF>
<!-- ImageReady Slices (mysub.gif) -->
<TABLE align="center" BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=3>
			<IMG SRC="images/mysub_01.gif" WIDTH=530 HEIGHT=10></TD>
	</TR>
	<TR>
		<TD ROWSPAN=5>
			<IMG SRC="images/mysub_02.gif" WIDTH=8 HEIGHT=330></TD>
		<TD>
			<IMG SRC="images/mysub_03.gif" WIDTH=390 HEIGHT=63></TD>
		<TD ROWSPAN=5>
			<IMG SRC="images/mysub_04.gif" WIDTH=132 HEIGHT=330></TD>
	</TR>
	<TR>
		<TD WIDTH=390 HEIGHT=220 valign=top>
			<form action="send.asp?action=send" method="post">
<table><tr><td>
Subject:</td><td><input class="inputBut" type="text" name="subject" size=20 maxlength=30></tr></td>
<tr><td>
message:</td><td><textarea class="inputBut" cols=27 rows=8 name="comm"></textarea></tr></td>
<tr><td colspan=2><input type=submit class="inputSubmit" name=submit value="Send">
</form>
</table></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="images/mysub_06.gif" WIDTH=390 HEIGHT=11></TD>
	</TR>
	<TR>
		<TD WIDTH=390 HEIGHT=28>
			Total Users : <%=totalMails%>&nbsp;&nbsp;&nbsp;&nbsp;<a href="send.asp">Send NewsLetter</a> | <a href="edit.asp">Edit List</a></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="images/mysub_08.gif" WIDTH=390 HEIGHT=8></TD>
	</TR>
</TABLE>
<!-- End ImageReady Slices -->
</BODY>
</HTML>