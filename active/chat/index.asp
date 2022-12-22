<%
option explicit'must be declared

'setting buffering to true
response.buffer=true
'decleration
dim useraction
dim conn
dim rs
dim sql
dim dsn
dim DownNumber
dim sql3
dim sql2
dim uemail
dim subs
'----------------------

'get action from user
useraction=request("action")
select case useraction
case "save"
	Uemail=lcase(request.form("email"))
	subs=request.form("subs")
	dsn="DBQ=" & Server.Mappath("db/subs.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
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
			response.write "<script>alert('Você foi cadastrado com sucesso! Muito Obrigado pela visita!')</script>"
		else
			response.write "<script>alert('Você foi cadastrado')</script>"
		end if

	
	'in case someOne wants to unsubscribe
		case "0"
	if rs.bof and rs.eof then
			response.write "<script>alert('Você está registrado')</script>"
	else
			sql2="delete from emails where emails='"&Uemail&"'"
			conn.execute(sql2)
			response.write "<script>alert('Seu E-mail foi excluído')</script>"
	end if

		
		
	end select
rs.close
set rs=nothing

end select
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
    BACKGROUND-COLOR: black;font-size:14px;font-family:Arial,Verdana;
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



</style>
<TITLE>Suporte Casa da Web</TITLE>
<LINK href="default.css" type=text/css rel=STYLESHEET>
</HEAD>
<BODY BGCOLOR=#FFFFFF>
<p align="center"> 
  <embed src="sup.swf" width="350" height="40"></embed> </p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Suporte 
  Casa da Web</font><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif"><font color="#FF9900"><font color="#FFFFFF">!</font></font></font></p>
<hr>
<p align="center"><font color="#FFFF00">E-mails</font></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:mandry@casadaweb.net">mandry@casadaweb.net</a></font></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:suporte@casadaweb.net">suporte@casadaweb.net</a></font></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:admin@casadaweb.net">admin@casadaweb.net</a></font></p>
<p align="center"><font color="#0000FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">MSN</font></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:mandry@casadaweb.net">mandry@casadaweb.net</a></font></p>
<p align="center"><font color="#FFFF00">ICQ</font></p>
<p align="center"><font color="#FF0000"><font color="#00FF00">287 - 412 - 105</font></font></p>
<p align="center"><font color="#FF0000">SKYPE</font></p>
<p align="center"><font color="#FFFFFF">mandry_web_design</font></p>
<hr>
<p align="center"><font color="#FFFFFF">Copyright Casa da Web</font></p>
<p align="center"></p>
</BODY>
</HTML>