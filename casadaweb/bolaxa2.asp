<%

'por: Mauricio Pacheco
Dim iMail, meu_email, Nome, Email, Telefone, Celular, Telefoneop, Emailop, Preferencia, Sitenovo, Hospedagem, Manutencao, Inclusao, Formularios, Criacao, Dominio, Web, Outros, Anima, Dinamico, Diinternet, Vendaprod, Outrossite, Mensagem

Nome = Request.form("nome") 
Email = Request.form("email") 
Telefone = Request.form("telefone") 
Celular = Request.form("celular")
Telefoneop = Request.form("telefoneop") 
Emailop = Request.form("emailop")
Preferencia = Request.form("preferencia")
Sitenovo = Request.form("sitenovo")
Hospedagem = Request.form("hospedagem") 
Manutencao = Request.form("manutencao") 
Inclusao = Request.form("inclusao") 
Formularios = Request.form("formularios") 
Criacao = Request.form("criacao") 
Dominio = Request.form("dominio") 
Web = Request.form("web") 
Outros = Request.form("outros") 
Anima = Request.form("anima")
Dinamico = Request.form("dinamica") 
Diinternet = Request.form("diinternet") 
Vendaprod = Request.form("vendaprod")
Outrossite = Request.form("outrossite") 
Mensagem = Request.form("mensagem") 

meu_email = "mandry@casadaweb.net"

corpo = "<div align=""center""><font size=""2"" face=""Verdana, Arial, Helvetica, sans-serif"">Formul�rio de contatos do site da Casa da Web!</font></div><br><br><font size=""1"" face=""Verdana, Arial, Helvetica, sans-serif""><b>Nome:</b>" & Nome & "<BR>"
corpo = corpo & "<b>E-mail:</b>" & Email & "<BR>"
corpo = corpo & "<b>Telefone:</b>" & Telefone & "<BR>"
corpo = corpo & "<b>Celular:</b>" & Celular & "<BR>"
corpo = corpo & "<b>Resposta por:</b>" & Telefoneop & "<BR>"
corpo = corpo & "<b>Resposta por:</b>" & Emailop & "<BR>"
corpo = corpo & "<b>Resposta por:</b>" & Preferencia & "<BR>"
corpo = corpo & "<b>Servi�os:</b>" & Sitenovo & "<BR>"
corpo = corpo & "<b>Servi�os:</b>" & Hospedagem & "<BR>"
corpo = corpo & "<b>Servi�os:</b>" & Manutencao & "<BR>"
corpo = corpo & "<b>Servi�os:</b>" & Inclusao & "<BR>"
corpo = corpo & "<b>Servi�os:</b>" & Formularios & "<BR>"
corpo = corpo & "<b>Servi�os:</b>" & Criacao & "<BR>"
corpo = corpo & "<b>Registro de Dom�nio:</b>" & Dominio & "<BR>"
corpo = corpo & "<b>Endere�o atualiza��o:</b>" & Web & "<BR>"
corpo = corpo & "<b>Outros servi�os:</b>" & Outros & "<BR>"
corpo = corpo & "<b>O site ser�:</b>" & Anima & "<BR>"
corpo = corpo & "<b>O site ser�:</b>" & Dinamico & "<BR>"
corpo = corpo & "<b>Objetivo do site:</b>" & Diinternet & "<BR>"
corpo = corpo & "<b>Objetivo do site:</b>" & Vendaprod & "<BR>"
corpo = corpo & "<b>Objetivo do site:</b>" & Outrossite & "<BR>"
corpo = corpo & "<b>Mensagem:</b>" & Mensagem & "<BR>"

Set iMail = CreateObject("CDONTS.NewMail")
iMail.From = email
iMail.To = meu_email
iMail.Subject = Nome
iMail.MailFormat = 0
iMail.BodyFormat = 0
iMail.Body = corpo
iMail.Send


Set objMail = nothing
%> 
<HTML><HEAD><TITLE>Casa da Web</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<META 
content="Empresa destinada ao marketing digital: web design profissional, design, design gr�fico, apresenta��o e anima��es em flash, solu��es em com�rcio eletr�nico, programa��o web" 
name=description>
<META 
content="web, site, design, website, web design, desenvolvimento, p�gina, empresa, internet, portal, profissional, grafica, flash, com�rcio eletr�nico, Frederico Westphalen, Rio Grande do Sul, firma" 
name=keywords>
<META content="Casa da Web" name=author>
<META 
content="Casa da Web - Solu��es em Marketing Digital - Frederico Westphalen/RS" 
name=copyright>
<META content=English name=language>
<META content="All, FOLLOW" name=robots><LINK href="index_arquivos/style.css" 
type=text/css rel=stylesheet>
<script language="Javascript">
<!--
// 
//

function initArray(n) {
  this.length = n;
  for (var i =1; i <= n; i++) {
    this[i] = ' '
  }
}

slide = new initArray(4)
slide[0]="Casa da Web"
slide[1]="Websites - Multimidia - Banners - Anima��es"
slide[2]="Com�rcio Eletr�nico - Portais Corporativos - Audio Visual"
slide[3]="Solu��es em Marketing Digital!"

var delay1 = 3
var delay2 = 3000

var text = slide[0] + " "
var str = " " 
var leftmsg = "" 
var nextmsg = 0

function setMessage() {
    
if (str.length == 1) {

while (text.substring(0, 1) == " ") {

leftmsg += str
str = text.substring(0, 1)
text = text.substring(1, text.length) 
}

leftmsg += str            
str = text.substring(0, 1)
text = text.substring(1, text.length) 

for (var x = 0; x < 120; x++) {
str = " " + str
}
}

else {
str = str.substring(10, str.length)
}

window.status = leftmsg + str

if (text == "") {

str = " "
nextmsg++

if (nextmsg > slide.length) {
nextmsg = 0
}

text = slide[nextmsg] + " "
leftmsg = ""  

setTimeout('setMessage()',delay2)
}

else {
setTimeout('setMessage()',delay1)
}
}

setMessage();
//-->
</script>
<SCRIPT src="index_arquivos/chgimg.js"></SCRIPT>
<SCRIPT src="index_arquivos/preload.js"></SCRIPT>
<script language="JavaScript1.2">
if (document.all){
actualtitle=document.title;
var scroller; 
var ampm;
function antiMilitaryTime()
{
if (hr == "12"){
ampm="p.m."
}
else if (hr == "13"){
hr="1"
ampm="p.m."
}
else if (hr == "14"){
hr="2"
ampm="p.m."
}
else if (hr == "15"){
hr ="3"
ampm="p.m."
}
else if (hr == "16"){
hr = "4"
ampm="p.m."
}
else if (hr == "17"){
hr = "5"
ampm="p.m."
}
else if (hr == "18"){
hr = "6"
ampm="p.m."
}
else if (hr == "19"){
hr = "7"
ampm="p.m."
}
else if (hr == "20"){
hr = "8"
ampm="p.m."
}
else if (hr == "21"){
hr = "9"
ampm="p.m."
}
else if (hr == "22"){
hr = "10"
ampm="p.m."
}
else if (hr == "23"){
hr = "11"
ampm="p.m."
}
else if (hr == "24"){
hr = "12"
}
}
function addZero(){
if (min <= 9){
min = "0"+min
}
if (sec <= 9){
sec = "0"+sec
}
if (hr <= 9){
hr = "0"+hr
}
}
function time(){
dt=new Date()
date=dt.getDate()
month=dt.getMonth()
month=month+1
sec=dt.getSeconds()
hr=dt.getHours()
yr=dt.getYear()
ampm="A.M."
min=dt.getMinutes()
}
function scroll() {
time()
antiMilitaryTime()
addZero()
var scroller=" - HOJE: "+date+"/"+month+"/"+yr
var scroller2=" - HORA: "+hr+":"+min+":"+sec+" "+ampm
var timeout=setTimeout("scroll()", 1)
scroller=scroller+scroller2
  document.title = actualtitle+" "+scroller
  }
var timeout=setTimeout('scroll()',1000);
}
else{

}
</script>
<META content="MSHTML 6.00.2900.2180" name=GENERATOR></HEAD>
<BODY text=#000000 bgColor=#e0e0e0 leftMargin=0 topMargin=0 marginheight="0" 
marginwidth="0">
<TABLE cellSpacing=0 cellPadding=0 width="100%" 
background=index_arquivos/bgu.jpg border=0>
  <TBODY>
  <TR>
      <TD noWrap align=right background=index_arquivos/uu.jpg colSpan=2 
      height=15><IMG height=15 src="index_arquivos/spacer.gif" width=292></TD>
    <TD style="BACKGROUND-REPEAT: no-repeat" width="100%" 
    background=index_arquivos/casa3.jpg rowSpan=2>&nbsp;</TD></TR>
  <TR>
    <TD width=17 background=index_arquivos/ul.jpg><IMG height=50 alt="Flash / HTML" 
      src="index_arquivos/spacer.gif" width=17 border=0></TD>
    <TD>
        <embed src="flas.swf" width="734" height="179"></embed></TD>
    </TR></TBODY></TABLE>
<TABLE height=400 cellSpacing=0 cellPadding=0 width="100%" 
background=index_arquivos/bgl.gif border=0><!--<table width="100%" height="400" border="0" cellpadding="0" cellspacing="0" background="img/bgl.gif">-->
  <TBODY>
  <TR>
    <TD vAlign=top align=right width=35><IMG height=26 
      src="index_arquivos/l1u.gif" width=35><IMG height=106 
      src="index_arquivos/l1g.gif" width=8></TD>
    <TD vAlign=top width=204>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD colSpan=3><IMG height=37 src="index_arquivos/l2u.gif" 
          width=204></TD></TR>
        <TR>
          <TD vAlign=top width=5><IMG height=99 src="index_arquivos/l2g.gif" 
            width=4><IMG height=99 src="index_arquivos/0.gif" width=1></TD>
          <TD vAlign=top width=196><!--#include file="por.asp"--></TD>
          <TD vAlign=top align=right width=4><IMG height=84 
            src="index_arquivos/l3g.gif" width=4></TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top align=left width=43 rowSpan=2><IMG height=54 
      src="index_arquivos/l3u.gif" width=33 align=absMiddle><BR><IMG height=74 
      src="index_arquivos/l4g.gif" width=9></TD>
    <TD vAlign=top width=275>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD vAlign=top height=25><IMG height=25 src="index_arquivos/l4u.gif" 
            width=275></TD></TR>
        <TR>
              <TD align=left background=index_arquivos/zpwelcom.gif height=26><img src="121.gif" width="6" height="10"> 
                <strong><font color="#265589" face="Verdana, Arial, Helvetica, sans-serif">CONTATOS</font></strong> 
              </TD>
          </TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=275 border=0>
        <TBODY>
        <TR>
          <TD vAlign=top width=252>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
                    <TR> 
                      <TD class=ww height=11>
<p align="justify">&nbsp;</p>
                        <p align="center"><img src="fantasma.gif" width="160" height="160"></p>
                        <p align="justify"><font color="#265589" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Seu 
                          formul&aacute;rio foi enviado com sucesso!</strong></font></p>
                        <p align="justify"><font color="#265589" size="1" face="Verdana, Arial, Helvetica, sans-serif">Agradecemos pela 
                          sua aten&ccedil;&atilde;o em breve estaremos entrando 
                          em contato...</font></p>
                        </TD></TR></TBODY></TABLE></TD>
          <TD vAlign=top width=23><IMG height=235 src="index_arquivos/lpl.gif" 
            width=23></TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top width=225>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
              <TD vAlign=top align=middle width=225 
          background=index_arquivos/bglogin.gif height=109> <table cellspacing=0 width=211 background=index_arquivos/xtgate.htm 
            border=0>
                  <FORM 
      action=http://www.homesites.com.br/cgi-local/domain/dominios.pl?root_allowed=1 
      method=post target=_blank>
				    <tbody>
                  
                  <td width="209"><br>
                      <font color="#265589"><img src="mundo12.gif" width="16" height="16"> 
                      Pesquise seu dom&iacute;nio:<br>
                      <br>
                      www.</font> 
                      <INPUT class=input 
                        maxLength=256 size="25" name=domain><INPUT type=hidden value=4.1 
                        name=cdomain><INPUT type=hidden value=1 
                        name=root_allowed><INPUT type=hidden value=OK 
                        name=lookup><br><br><INPUT type=submit value=Pesquisar>&nbsp;&nbsp;<INPUT type=reset value=Apagar></table></TD>
            </TR>
        </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=225 border=0>
        <TBODY>
        <TR>
            <TD align=middle width=199 background=index_arquivos/lpbgu.gif 
          height=34>&nbsp; </TD>
          <TD vAlign=top rowSpan=3><IMG height=177 
            src="index_arquivos/rpl2.gif" width=25></TD></TR>
        <TR>
          <TD vAlign=center align=middle width=200 
          background=index_arquivos/advbg.jpg height=110><IMG height=1 
            src="index_arquivos/0.gif" width=1><BR>
              <embed src="filme.swf" width="200" height="109"></embed> </TD>
          </TR>
        <TR>
          <TD vAlign=top align=middle background=index_arquivos/pdbg.gif 
          height=32>
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD width=130 height=27>&nbsp;</TD>
                <TD><!--a href="#"><img src="img/kgo.gif" alt="Go" width="22" height="21" border="0" align="texttop"></a--></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <TABLE id=hand onClick="location.href=('/orcamento.asp')" height=61 
      cellSpacing=0 cellPadding=0 width=199 
      background=index_arquivos/request_bbg.gif border=0>
        <TBODY>
        <TR>
            <TD vAlign=bottom height=24>&nbsp;</TD>
          <TD width=60 rowSpan=2><IMG height=61 
            src="index_arquivos/_request.jpg" width=60></TD></TR>
        <TR>
              <TD class=contact vAlign=top background=index_arquivos/xtgate.htm 
          height=37><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Fa&ccedil;a seu or&ccedil;amento sem compromisso...</font></TD>
          </TR></TBODY></TABLE>
      <TABLE id=hand onClick="location.href=('/contatos.asp')" height=61 
      cellSpacing=0 cellPadding=0 width=200 
      background=index_arquivos/request_bbg.gif border=0>
        <TBODY>
        <TR>
            <TD vAlign=bottom height=24>&nbsp;</TD>
          <TD width=60 rowSpan=2><IMG height=61 
            src="index_arquivos/_contact.jpg" width=60></TD></TR>
        <TR>
              <TD class=contact vAlign=top background=index_arquivos/xtgate.htm 
          height=37> <font size="1" face="Verdana, Arial, Helvetica, sans-serif">Entre 
                em contato conosco...</font></TD>
          </TR></TBODY></TABLE>
      <TABLE id=hand onClick="location.href=('/casa.asp')" 
      height=61 cellSpacing=0 cellPadding=0 width=200 
      background=index_arquivos/createch_bbg.gif border=0>
        <TBODY>
        <TR>
            <TD vAlign=bottom height=24>&nbsp;</TD>
          <TD width=60 rowSpan=2><IMG height=61 
            src="index_arquivos/_createch.jpg" width=60></TD></TR>
        <TR>
              <TD class=contact vAlign=top background=index_arquivos/xtgate.htm 
          height=37><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Saiba mais 
                sobre a casa da web...</font></TD>
          </TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=199 border=0>
        <TBODY>
        <TR>
          <TD background=""><IMG height=6 src="index_arquivos/r_row_news.gif" 
            width=200></TD></TR>
        <TR>
          <TD><IMG height=24 src="index_arquivos/ttl_latest_news.gif" 
            width=200></TD></TR>
        <TR>
          <TD style="PADDING-RIGHT: 7px; PADDING-LEFT: 10px" vAlign=top>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                  <TBODY>
                    <TR> 
                      <TD class=nttl id=fs10><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><em>E-mails:</em></font></TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10>&nbsp;</TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10><img src="141.gif" width="17" height="11"> 
                        <a href="mailto:mandry@casadaweb.net">mandry@casadaweb.net                        </a></TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10>&nbsp;</TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10><img src="141.gif" width="17" height="11"> 
                        <a href="mailto:comercial@casadaweb.net">comercial@casadaweb.net                        </a></TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10>&nbsp;</TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10><img src="141.gif" width="17" height="11"> 
                        <a href="mailto:financeiro@casadaweb.net">financeiro@casadaweb.net                        </a> </TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10>&nbsp;</TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10>&nbsp;</TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><em>Suporte 
                        e Atendimento:</em></font></TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10><font size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><img src="msn.gif" width="17" height="16"> 
                        <font color="#265589">mandry@casadaweb.net </font></font></TD>
                    </TR>
                    <TR> 
                      <TD><font size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></TD>
                    </TR>
                    <TR> 
                      <TD><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><img src="icq.gif" width="16" height="16"> 
                        <font color="#265589">287-412-105</font></font></TD>
                    </TR>
                    <TR> 
                      <TD class=nttl id=fs10><font size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></TD>
                    </TR>
                    <TR> 
                      <TD><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><img src="skype2.gif" width="16" height="16"> 
                        <font color="#265589">mandry_web_design</font></font></TD>
                    </TR>
                    <TR> 
                      <TD><font size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></TD>
                    </TR>
                    <TR> 
                      <TD><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><img src="ftp.gif" width="16" height="15"> 
                        <font color="#265589">(55) 99969637</font></font></TD>
                    </TR>
                    <TR>
                      <TD>&nbsp;</TD>
                    </TR>
                    <TR> 
                      <TD><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><img src="ftp.gif" width="16" height="15"> <font color="#265589">(55) 99653530</font></font></TD>
                    </TR>
                    <TR>
                      <TD>&nbsp;</TD>
                    </TR>
                    <TR> 
                      <TD>&nbsp;</TD>
                    </TR>
                  </TBODY>
                </TABLE></TD></TR></TBODY></TABLE>
   </TD>
    <TD vAlign=top width="100%">
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD background=index_arquivos/bgr.gif><IMG height=6 
            src="index_arquivos/spacer.gif" 
  width=1></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" 
background=index_arquivos/dbg.gif border=0>
  <TBODY>
  <TR>
      <TD style="PADDING-TOP: 35px" align=middle width=282 
    background=index_arquivos/dl.gif height=92 rowSpan=2><div align="center"><font color="#265589" size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="portifolio.asp">+ 
          Portif&oacute;lio <img src="13.gif" width="20" height="11" border="0"><img src="13.gif" width="20" height="11" border="0"><img src="13.gif" width="20" height="11" border="0"></a></font></div></TD>
    <TD vAlign=top width=259 height=34><IMG height=1 
      src="index_arquivos/spacer.gif" width=259></TD>
    <TD vAlign=top width=213><IMG height=28 src="index_arquivos/dr.gif" 
      width=213></TD>
    <TD rowSpan=2>&nbsp;</TD></TR>
  <TR>
      <TD vAlign=center background=index_arquivos/ftr_bg.gif colSpan=2 
      height=58><SPAN 
      class=crlnk><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Copyright 
        � 2003-2006</font></SPAN><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        - Casa da Web - Frederico Westphalen/RS</font></TD>
    </TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" bgColor=#779dd9 border=0>
  <TBODY>
  <TR>
    <TD background=index_arquivos/ftr_bt.gif><IMG height=8 
      src="index_arquivos/0.gif" width=18><IMG height=8 
      src="index_arquivos/ftr_ln.gif" 
width=238></TD></TR></TBODY></TABLE></BODY></HTML>
