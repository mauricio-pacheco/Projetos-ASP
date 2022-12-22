<%
Option Explicit
Dim sql,rsUser,username,password,page,stayloggedin,LConnectString,lconn,sqlflag,sql2,rsUser2

'Grab the submitted variables (page is the page they've come from, set by the hidden variable at the login box)
username = Request.Form("username")
password = Request.Form("password")
page = Request.Form("page")
stayloggedin = Request.Form("stayloggedin")

if page = "" then
	page = "index.asp"
end if

'Check no s**t is trying to hack in using SQL commands
if InStr(username, "'") or InStr(username, """") or InStr(username, "=") or InStr(password, "'") or InStr(password, """") or InStr(password, "=") then
	sqlflag = True
end if

'Open connection
%>
<!--#include file="conn.asp"-->
<%

'Get a recordset corresponding to the submitted username and password
sql = "SELECT username FROM users WHERE username = '" & username & "' AND password = '" & password & "'"
Set rsUser = Server.CreateObject("ADODB.Recordset")
rsUser.Open sql, conn, 3, 3

'If there was a valid recordset there, then send them back to the page they came from, with the username cookie set
If (not rsUser.BOF) and (not rsUser.EOF) and sqlflag <> True then

'update no campo stats
sql2 = "update users set stats = 1 where username = '"& username &"'"
Set rsUser2 = Server.CreateObject("ADODB.Recordset")
rsUser2.Open sql2, conn, 3, 3
'fim update

  Response.Cookies("username") = rsUser("username")
  'If the user wants to stay logged in all the time, then we'll set the cookie with a far-away expiry date
  if stayloggedin = "yes" then
	Response.Cookies("username").expires = #1/1/2010#
  end if
  rsUser.close
  set rsUser = nothing
  conn.close
  set conn = nothing
  Response.Redirect(page)
end if

'Otherwise, display an invalid entry screen
rsUser.close
set rsUser = nothing
conn.close
set conn = nothing%>
<HTML><HEAD>
<TITLE>Vista Móveis - Vista Gaúcha/RS</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK 
href="index_arquivos/stylesheet_0.css" type=text/css rel=stylesheet>
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
<script language=JavaScript type=text/JavaScript>
	hoje = new Date()
	dia = hoje.getDate()
	dias = hoje.getDay()
	mes = hoje.getMonth()
	ano = hoje.getYear()
//	if (dia <10)
//		dia = "0" + dia
	if (ano <2000)
                ano = "19" + ano
	function NArray (n) {
	    this.length = n
        }
	NomeDia = new NArray(7)
	NomeDia[0] = "Domingo"
	NomeDia[1] = "Segunda-feira"
	NomeDia[2] = "Ter&ccedil;a-feira"
	NomeDia[3] = "Quarta-feira"
	NomeDia[4] = "Quinta-feira"
	NomeDia[5] = "Sexta-feira"
	NomeDia[6] = "S&aacute;bado"
	NomeMes = new NArray(12)
	NomeMes[0] = "Janeiro"
	NomeMes[1] = "Fevereiro"
	NomeMes[2] = "Mar&ccedil;o"
	NomeMes[3] = "Abril"
	NomeMes[4] = "Maio"
	NomeMes[5] = "Junho"
	NomeMes[6] = "Julho"
	NomeMes[7] = "Agosto"
	NomeMes[8] = "Setembro"
	NomeMes[9] = "Outubro"
	NomeMes[10] = "Novembro"
	NomeMes[11] = "Dezembro"
function WriteDate() {
	document.write (NomeDia[dias] + ", " + dia + " de " + NomeMes[mes] + " de " + ano)
}
</script>
<SCRIPT language=JavaScript>
		section = "About";
		urlRoot = "";
		function setKbDimensions() {
			var oBody = document.body;
			var oFrame = document.all("kbframe");
			var navBarHeight = 108;
		}
	</SCRIPT>
<SCRIPT language=javascript src="index_arquivos/granite_script.js"></SCRIPT>
<SCRIPT language=javascript src="index_arquivos/granite_dropdownC.js"></SCRIPT>
<SCRIPT language=javascript 
src="index_arquivos/granite_dropdown_initialize.js"></SCRIPT>
<META content="MSHTML 6.00.2900.2722" name=GENERATOR>
<script language="JavaScript" type="text/JavaScript">
<!--

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
</HEAD>
<BODY bgcolor="#EFEFE7" leftMargin=0 
topMargin=0 
marginwidth="0" marginheight="0" onLoad="init(); setKbDimensions();" onresize=setKbDimensions();>
<span class=style1> 
</span>
<TABLE cellSpacing=0 cellPadding=0 width=780 align=center border=0>
  <TBODY>
  <TR>
    <TD colSpan=3><IMG height=15 src="index_arquivos/page_top.gif" 
    width=780></TD></TR>
  <TR>
      <TD vAlign=top width=7 background=index_arquivos/bg_left.gif>&nbsp;</TD>
    <TD vAlign=top width=758>
      <TABLE cellSpacing=0 cellPadding=0 width=758 border=0>
          <TBODY>
            <TR> 
              <TD width="758" 
          height=27 vAlign=top>
<table width="100%" height="20" border="0" align="center">
                  <tr> 
                    <td width="35%" height="0"> 
                      <form name="login" action="signin.asp" method="post">
                        <div align="center"> 
                          <table width="100%" border="0">
                            <tr>
                              <td width="49%"><font face="arial,helvetica" size=2>&nbsp; 
                                <font size="1" face="Verdana, Arial, Helvetica, sans-serif">Usuário 
                                e Senha Inválidos - <a href="index.asp">Tente 
                                Novamente</a></font></font></td>
                              <td width="51%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
                                Busca:</font> 
                                <input name="textfield32" type="text" size="26"> 
                                <input type="checkbox" name="checkbox2" value="checkbox"> 
                                <font size="1" face="Verdana, Arial, Helvetica, sans-serif">somente 
                                produtos</font> <input type="submit" name="Submit222" value="OK"> 
                              </td>
                            </tr>
                          </table>
                          
                        </div>
                      </form></td>
                  </tr>
                </table></TD>
            </TR>
            <TR> 
              <TD vAlign=top height=24><!--#include file="menucima.asp"--></TD>
            </TR>
            <TR> 
              <TD vAlign=top bgColor=#ffffff height=1><IMG height=1 
            src="index_arquivos/_spacer.gif" width=1></TD>
            </TR>
            <TR> 
              <TD vAlign=top height=103><!--#include file="acima.asp"--></TD>
            </TR>
            <TR> 
              <TD vAlign=top background=index_arquivos/bg_banner_divider.gif height=11><IMG height=1 src="index_arquivos/_spacer.gif" 
            width=1></TD>
            </TR>
          </TBODY>
        </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" 
      background=index_arquivos/bg_body.gif border=0>
        <TBODY>
        <TR>
          <TD background=index_arquivos/bg_pagetools.gif colSpan=6 height=30>
            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" 
              border=0><TBODY>
              <TR>
                      <TD width=200 background=index_arquivos/bg_sectionname.gif> 
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD width=20>&nbsp;</TD>
                              <TD class=nav><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><em><font face="Verdana, Arial, Helvetica, sans-serif"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"><img src="index_arquivos/submenu_arrow_right.gif" width="9" height="9"></font></em><font face="Verdana, Arial, Helvetica, sans-serif">ERRO</font></TD>
                            </TR></TBODY></TABLE></TD>
                      <TD align=right><div align="left"><FONT size="1" face="Verdana, Arial, Helvetica, sans-serif" class=content></FONT><FONT size=1><FONT 
            size=1><FONT face="Arial, Helvetica, sans-serif" color=#ff3300> </FONT></FONT></FONT> 
                          <FONT size="1" face="Verdana, Arial, Helvetica, sans-serif" class=content><span class=style1> 
                          Hoje: 
                          <script language="">
 WriteDate();
</script>
                          </span></FONT> <br>
                        </div></TD>
                <TD width=20><IMG height=30 
                  src="index_arquivos/pagetools_corner_right.gif" 
              width=20></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD width=16><IMG height=1 src="index_arquivos/_spacer.gif" 
          width=1></TD>
          
          
          
              <TD class=body vAlign=top width=734> 
                <table width="100%" border="0">
                  <tr> 
                    <td width="35%" height="241"><p align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">USUÁRIO 
                        OU SENHA INVÁLIDOS</font></p>
                      <p align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="index.asp">Tente 
                        Novamente</a></font></p>
                      </td>
                  </tr>
                </table> </TD>
          <TD width=9><IMG height=1 src="index_arquivos/_spacer.gif" 
          width=1></TD></TR>
       </TBODY></TABLE></TD>
      <TD vAlign=top width=15 background=index_arquivos/bg_right.gif>&nbsp;</TD>
    </TR>
  <TR vAlign=top>
    <TD colSpan=3><IMG height=26 src="index_arquivos/page_bottom.gif" 
      width=780></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=780 align=center border=0>
  <TBODY>
  <TR class=footer>
      <TD class=footer vAlign=top align=middle> Copyright © 2005 Vista Móveis 
        Ltda. Todos os direitos reservados.<BR>
        Desenvolvimento - <a href="http://www.casadaweb.net" target=_blank>Casa 
        da Web</a>.<BR> 
        <DIV id=HideThisOne style="VISIBILITY: visible"></DIV>
      <P></P></TD></TR>
  <TR class=footer>
    <TD height=10><IMG src="index_arquivos/_spacer.gif"></TD></TR></TBODY></TABLE>
<SCRIPT language=javascript 
src="index_arquivos/granite_dropdown_content.js"></SCRIPT>

<DIV id=font 
style="Z-INDEX: 1; LEFT: 1px; VISIBILITY: hidden; WIDTH: 80px; POSITION: absolute; TOP: 1px; HEIGHT: 20px"><IMG 
height=20 src="index_arquivos/font.gif" width=80></DIV>
<DIV id=print 
style="Z-INDEX: 1; LEFT: 1px; VISIBILITY: hidden; WIDTH: 80px; POSITION: absolute; TOP: 1px; HEIGHT: 20px"><IMG 
height=20 src="index_arquivos/print.gif" width=80></DIV>
<DIV id=email 
style="Z-INDEX: 1; LEFT: 1px; VISIBILITY: hidden; WIDTH: 80px; POSITION: absolute; TOP: 1px; HEIGHT: 20px"><IMG 
height=20 src="index_arquivos/email.gif" width=80></DIV></BODY></HTML>
