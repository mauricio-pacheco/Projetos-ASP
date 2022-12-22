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
<TITLE>Extras Casa da Web</TITLE>
<LINK href="default.css" type=text/css rel=STYLESHEET>
</HEAD>
<BODY BGCOLOR=#FFFFFF>
<p align="center"> 
  <embed src="extra.swf" width="350" height="40"></embed> </p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Especial 
  Bitorrent da <font color="#FF9900">Casa da Web</font>!</font></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Baixe 
  seu cliente Torrent e tenha uma por&ccedil;&atilde;o de op&ccedil;&otilde;es 
  de download!</font></p>
<p align="center"><font color="#FFFF00" size="1" face="Verdana, Arial, Helvetica, sans-serif">Digite 
  as op&ccedil;&otilde;es de download:</font></p>
<form method="get" action="http://www.torrentreactor.net/search.php" target=_blank>
  <div align="center">
    <input type="Hidden" name="search">
    <strong style="color:#FE712C">Torrent :</strong>&nbsp; 
    <input type="text" name="words" size="15">
    &nbsp;
    <select size="1" name="cid">
      <option value="">Todas as Categorias</option>
      <option value="1">Desenhos</option>
      <option value="2">Aplicativos</option>
      <option value="3">Jogos</option>
      <option value="4">Hentai</option>
      <option value="5">Filmes</option>
      <option value="6">Musicas</option>
      <option value="7">Outros</option>
      <option value="8">Séries/Shows de TV</option>
      <option value="9">torrentreactor.net</option>
      <option value="10">XXX</option>
    </select>
    &nbsp;
    <input type="Submit" Value="ENVIAR" name="B1" align="absmiddle">
    <br>
  </div>
</form></BODY>
</HTML>