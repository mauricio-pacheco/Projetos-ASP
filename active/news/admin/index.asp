<%
option explicit'must be declared
%>
<!--#include file="config.inc"-->
<%
'setting buffering to true
response.buffer=true
'decleration
dim useraction
dim conn
dim rs
dim sql
dim DownNumber
dim sql3
dim sql2
dim uemail
dim subs
dim totalmails
'----------------------

'get action from user
useraction=request("action")
select case useraction
case "save"
	Uemail=lcase(request.form("email"))
	subs=request.form("subs")
	set conn=server.createobject("adodb.connection")
	set rs=server.createobject("adodb.recordset")
	sql = "select * from emails where emails='"&Uemail&"'"
	conn.open dsn
	rs.open sql,conn
	select case subs
	'in case someOne wants to join the list
	case "1"
		if rs.bof and rs.eof then
			sql2="insert into emails(emails) values('"&Uemail&"')"
			conn.execute(sql2)
			response.write "<script>alert('Obrigado!')</script>"
		else
			response.write "<script>alert('Você está registrado!')</script>"
		end if

	
	'in case someOne wants to unsubscribe
		case "0"
	if rs.bof and rs.eof then
			response.write "<script>alert('Você está registrado')</script>"
	else
			sql2="delete from emails where emails='"&Uemail&"'"
			conn.execute(sql2)
			response.write "<script>alert('Seu nome foi excluído')</script>"
	end if

		
		
	end select
rs.close
set rs=nothing

end select

'counting
set conn=server.createobject("adodb.connection")
set rs=server.createobject("adodb.recordset")
sql = "select id from emails"
conn.open dsn
rs.Open SQL, Conn, 1, 3
totalMails = rs.recordcount
rs.close
set rs = nothing
conn.close
set conn = nothing
'----end counting ----------------------
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
if (email.indexOf('@', 0) == -1 || email.indexOf('.', 0) == -1){ alert("O E-mail não é válido!");
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
<TITLE>mysub</TITLE>

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
			Please subscribe/Unsubscribe.<br><form name="subform" action="index.asp?action=save" method="post" onsubmit="return submitit()">
&nbsp;Email : <input class="inputBut" type="Text" name="email" size=30><br>
<input type="radio" name="subs" value="1" checked>Subscribe<br>
<input type="radio" name="subs" value="0">Unsubscribe
<br><br>
<input class="inputSubmit" type="submit" name="submit" value="ENVIAR!">
</form></TD>
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