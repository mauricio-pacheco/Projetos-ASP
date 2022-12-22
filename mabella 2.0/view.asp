<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Frigor&iacute;fico Mabella</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="MSHTML 6.00.2900.2180" name=GENERATOR>
<META content=INDEX,FOLLOW name=GOOGLEBOT>
<STYLE type="text/css">
<!--
BODY {
scrollbar-face-color:#F7F7F7;
scrollbar-highlight-color:#F9DC8E;
scrollbar-3dlight-color:#F9DC8E;
scrollbar-darkshadow-color:#F9DC8E;
scrollbar-shadow-color:#F9DC8E;
scrollbar-arrow-color:#000000;
scrollbar-track-color:#F9DC8E;
}
-->
</STYLE>
<LINK href="index_arquivos/ditcom.css" type=text/css rel=stylesheet>
<SCRIPT LANGUAGE="JavaScript">
var dayarray=new Array("Domingo","Segunda-feira","Terça-feira","Quarta-feira","Quinta-feira","Sexta-feira","Sábado")
var montharray=new Array("Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro")
function getthedate(){
var mydate=new Date()
var year=mydate.getYear()
if (year < 1000)
year+=1900
var day=mydate.getDay()
var month=mydate.getMonth()
var daym=mydate.getDate()
if (daym<10)
daym="0"+daym
var hours=mydate.getHours()
var minutes=mydate.getMinutes()
var seconds=mydate.getSeconds()
{
hours=hours
}
{
 d = new Date();
 Time24H = new Date();
 Time24H.setTime(d.getTime() + (d.getTimezoneOffset()*60000) + 3600000);
 InternetTime = Math.round((Time24H.getHours()*60+Time24H.getMinutes()) / 1.44);
 if (InternetTime < 10) InternetTime = '00'+InternetTime;
 else if (InternetTime < 100) InternetTime = '0'+InternetTime;
}
if (hours==0)
hours=24
if (minutes<=9)
minutes="0"+minutes
if (seconds<=9)
seconds="0"+seconds
//altere a fonte aqui
var cdate=""+hours+":"+minutes+":"+seconds+""
if (document.all)
document.all.clock.innerHTML=cdate
else if (document.getElementById)
document.getElementById("clock").innerHTML=cdate
else
document.write(cdate)
}
if (!document.all&&!document.getElementById)
getthedate()
function goforit(){
if (document.all||document.getElementById)
setInterval("getthedate()",1000)
}
window.onload=goforit
</script>
</HEAD>
<BODY leftMargin=0 topMargin=0>
<FORM name=form2 action="" method=post>
<TABLE height=78 cellSpacing=0 cellPadding=0 width=774 
background=index_arquivos/bg_top.gif border=0>
  <TBODY>
  <TR>
        <TD width=41>&nbsp; </TD>
        
      </TR>
    </TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=774 border=0>
  <TBODY>
  <TR>
    <TD height=1><IMG height=1 src="index_arquivos/c_linha.gif" 
  width=774></TD></TR></TBODY></TABLE>
<TABLE height=24 cellSpacing=0 cellPadding=0 width=774 bgColor=#f7f7f7 
  border=0><TBODY>
  <TR>
        <TD width=415><FONT face="Arial, Helvetica, sans-serif" color=#4f4f4f 
      size=1>&nbsp;
          <script language="JavaScript" type="text/JavaScript">
var datahora,xhora,xdia,dia,mes,ano,txtsaudacao;
datahora = new Date();
xhora = datahora.getHours();
if (xhora >= 0 && xhora < 12) {txtsaudacao = "Bom Dia!"}
if (xhora >= 12 && xhora < 18) {txtsaudacao = "Boa Tarde!"}
if (xhora >= 18 && xhora <= 23) {txtsaudacao = "Boa Noite!"}
xdia = datahora.getDay();
diasemana = new Array(7);
diasemana[0] = "Domingo";
diasemana[1] = "Segunda";
diasemana[2] = "Terça";
diasemana[3] = "Quarta";
diasemana[4] = "Quinta";
diasemana[5] = "Sexta";
diasemana[6] = "Sábado";
dia = datahora.getDate();
mes = datahora.getMonth();
mesdoano = new Array(12);
mesdoano[0] = "janeiro";
mesdoano[1] = "fevereiro";
mesdoano[2] = "março";
mesdoano[3] = "abril";
mesdoano[4] = "maio";
mesdoano[5] = "junho";
mesdoano[6] = "julho";
mesdoano[7] = "agosto";
mesdoano[8] = "setembro";
mesdoano[9] = "outubro";
mesdoano[10] = "novembro";
mesdoano[11] = "dezembro";
ano = datahora.getFullYear();
document.write(txtsaudacao + " Seja bem vindo a Mabella, hoje " + diasemana[xdia] + ", " + dia + " de " + mesdoano[mes] + " de " + ano);
</script>
          </font><FONT size="1" face="Verdana, Arial, Helvetica, sans-serif" class=content><span class=style1> 
          </span></FONT></TD>
    <TD width=1></TD>
    <TD width=1 bgColor=#cecfce></TD>
    <TD width=1></TD>
        <TD width=220> <TABLE cellSpacing=0 cellPadding=0 width=218 align=center border=0>
            <TBODY>
              <TR> 
                <TD width=5>&nbsp;</TD>
                <form name="login" action="buscar.asp" method="post">
				<TD width=121> <INPUT class=central 
            onblur="if(this.value=='')this.value='Busca no Site';" 
            onfocus="if(this.value=='Busca no Site')this.value='';" size=27 
            value="Busca no Site" name="buscar"></TD>
                
  
                <TD align=middle width=33><INPUT type=image height=16 width=21 
            src="index_arquivos/c_ok.gif" border=0 name=submit> </TD></form>
              </TR>
            </TBODY>
          </TABLE></TD>
    <TD width=1>
    <TD vAlign=top width=10>
      <TABLE height=24 cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD width=1 bgColor=#cecfce></TD></TR></TBODY></TABLE></TD>
        <TD width=125><FONT face="Arial, Helvetica, sans-serif" color=#4f4f4f 
      size=1>&nbsp;Hora certa: <span id="clock"></font></TD>
      </TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=774 border=0>
  <TBODY>
  <TR>
    <TD bgColor=#cecfce height=1></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=774 border=0>
  <TBODY>
  <TR>
    <TD height=7></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=774 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width=203>
      <TABLE cellSpacing=0 cellPadding=0 width=203 border=0>
        <TBODY>
          <TR> 
            <TD bgColor=#cecfce height=1></TD>
          </TR>
          <TR> 
            <TD bgColor=#F9DC8E><br><div align="center"> 
                <embed src="menu.swf" width="170" height="240"></embed></div><br></TD>
          </TR>
          <TR> 
            <TD bgColor=#ffffff height=1></TD>
          </TR>
        <TD bgColor=#1873c0 height=1></TD>
        </TR>
        <tr>
          <td>&nbsp;
      </TABLE>
      
      <TABLE height=107 cellSpacing=0 cellPadding=0 width=183 border=0>
        <TBODY>
        <TR>
          <TD vAlign=top background=index_arquivos/tv.gif>
            <TABLE height=85 cellSpacing=0 cellPadding=0 width=174 border=0>
              <TBODY>
              <TR>
                
				<TD colSpan=2 height=10></TD></TR>
              <TR>
                <TD width=23 height=77>&nbsp;</TD>
                <TD vAlign=top width=151>
                  <OBJECT 
                  codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0 
                  height=73 width=150 
                  classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000><PARAM NAME="movie" VALUE="tv.swf"><PARAM NAME="quality" VALUE="high">
                                                                              
                  <embed src="tv.swf" quality="high" 
                  pluginspage="http://www.macromedia.com/go/getflashplayer" 
                  type="application/x-shockwave-flash" width="150" 
                  height="73"></embed></OBJECT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
        <p>
          <embed src="currilum.swf" width="190" height="50"></embed></p></TD>
    <TD width=1 bgColor=#cecfce></TD>
    <TD width=4></TD>
    <TD vAlign=top width=566></FORM>
      <TABLE cellSpacing=0 cellPadding=0 width=566 border=0>
        <TBODY>
        <TR>
          <TD vAlign=top width=335>
            <TABLE height=213 cellSpacing=0 cellPadding=0 width=330 border=0>
              <TBODY>
              <TR>
                <TD align=middle bgColor=#cecfce><embed src="anime.swf" height="211" width="328"></embed></TD></TR></TBODY></TABLE></TD>
          <TD vAlign=top width=231>
            <TABLE height=213 cellSpacing=0 cellPadding=0 width=223 border=0>
              <TBODY>
              <TR>
                <TD bgColor=#cecfce>
                  <TABLE height=211 cellSpacing=0 cellPadding=0 width=221 
                  align=center border=0>
                    <TBODY>
                    <TR>
                      <TD vAlign=top align=middle bgColor=#f9f4e6>
                        <TABLE cellSpacing=0 cellPadding=0 border=0>
                          <TBODY>
                          <TR>
                            <TD><IMG height=7 alt="hospedagem de sites" 
                              src="index_arquivos/d.gif" 
                        width=1></TD></TR></TBODY></TABLE>
                        <TABLE height=44 cellSpacing=0 cellPadding=0 width=213 
                        border=0>
                          <TBODY>
                          <TR>
                            <TD bgColor=#e9e3d4 height=44>
                              <TABLE height=42 cellSpacing=0 cellPadding=0 
                              width=211 align=center border=0>
                                <TBODY>
                                <TR>
                                <TD align=middle bgColor=#fffcf3 height=42>
                                <TABLE cellSpacing=0 cellPadding=0 width=203 
                                align=center border=0>
                                <TBODY>
                                <TR>
                                              <TD><div align="center"><A class=noti 
                                href="http://www.ditcom.com.br/index.php?pagina=noticias&amp;cmd=10&amp;session_id=6ad66986904da2e330cdcde244ccf677"><FONT 
                                color=#ff7900><STRONG>&Uacute;ltimas Not&iacute;cias 
                                                  Mabella</STRONG></FONT></A></div></TD>
                                            </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                        <TABLE cellSpacing=0 cellPadding=0 width=206 border=0>
                          <TBODY>
                          <TR>
                              <TD height=24><MARQUEE behavior= "scroll" align= "center" direction= "up" height="160" width="220" scrollamount= "1" scrolldelay= "40" onmouseover='this.stop()' onmouseout='this.start()'><iframe src="recebido.asp" width="220" height="800" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe></marquee></TD>
                            </TR></TBODY></TABLE>
                        
                      </TD>
                    </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD><IMG height=5 alt="hospedagem de sites" 
            src="index_arquivos/d.gif" width=1></TD></TR></TBODY></TABLE>
      <TABLE height=179 cellSpacing=0 cellPadding=0 width=558 border=0>
        <TBODY>
        <TR>
          <TD bgColor=#cecfce>
            <TABLE height=177 cellSpacing=0 cellPadding=0 width=100% align=center 
            border=0>
                <TBODY>
                  <TR> 
                    <TD width=1 bgColor=#cecfce></TD>
                    <TD vAlign=top align=middle width=186 bgColor=#F9DC8E><p><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
                        <%
id = request.querystring("id")
DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
          DSNtemp=dsntemp & "DBQ=" & server.mappath("journal.mdb")
          sqlstmt = "SELECT * FROM journal where id =" & id & " ORDER BY id DESC"
          Set rs = Server.CreateObject("ADODB.Recordset")
          rs.Open sqlstmt, DSNtemp, 3, 3
TotalRecs = rs.recordcount

		date1 = rs("pdate")
		id = rs("ID")
		name1 = rs("pname")
		p1= rs("pentry")
		
	  	description = p1
   %>
                        <br>
                        </font></p>
                      <div align="center"> 
                        <center>
                          <table border="0" cellpadding="3" cellspacing="0" width="500" bordercolor="#0099CC">
                            <tr> 
                              <td width="627"><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nova 
                                Not&iacute;cia: 
                                <% =date1 %>
                                --<b> T&iacute;tulo: 
                                <% =name1 %>
                                </b> </font></td>
                            </tr>
                            <tr> 
                              <td width="627"><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font> 
                                <font color="#000000" size="1" face="Arial, Helvetica, sans-serif"><br>
                                <% =description%>
                                </font></td>
                            </tr>
                          </table>
                        </center>
                      </div>
                      <p></p> </TD>
                    <TD width=1 bgColor=#cecfce></TD>
                  </TR>
                </TBODY>
              </TABLE></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=100 border=0>
        <TBODY>
        <TR>
          <TD><IMG height=10 alt="hospedagem de sites" 
            src="index_arquivos/d.gif" 
width=1></TD></TR></TBODY></TABLE></TD></TR></TBODY>
<TABLE height=1 cellSpacing=0 cellPadding=0 width=776 border=0>
  <TBODY>
  <TR>
    <TD width=203 bgColor=#ffffff></TD>
    <TD width=573 bgColor=#cecfce></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=100 border=0>
  <TBODY>
  <TR>
    <TD><IMG height=14 alt="hospedagem de sites" src="index_arquivos/d.gif" 
      width=1></TD></TR></TBODY></TABLE>
<TABLE height=58 cellSpacing=0 cellPadding=0 width=774 
background=index_arquivos/bg_roda.gif border=0>
  <TBODY>
  <TR>
    <TD colSpan=2 height=34>&nbsp;</TD>
    <TD>&nbsp;</TD>
    <TD vAlign=top width=227 rowSpan=2>
      <TABLE height=58 cellSpacing=0 cellPadding=0 width=145 border=0>
          <TBODY>
            <TR> 
              <TD><table width="30" border="0" align="center">
                  <tr>
                    <td><div align="center"><a href="contatos.asp"><img src="cont.gif" width="32" height="32" border="0"></a></div></td>
                  </tr>
                  <tr>
                    <td><div align="center"><FONT face="Arial, Helvetica, sans-serif" color=#4f4f4f 
      size=1><STRONG><FONT 
      face="Verdana, Arial, Helvetica, sans-serif"><a href="contatos.asp">Contatos</a></FONT></STRONG></FONT></div></td>
                  </tr>
                </table></TD>
            </TR>
            <TR> 
              <TD height=3></TD>
            </TR>
          </TBODY>
        </TABLE></TD></TR>
  <TR>
    <TD width=14>&nbsp;</TD>
      <TD width=332><FONT face="Arial, Helvetica, sans-serif" color=#4f4f4f 
      size=1>© Copyright 2005 - <STRONG><FONT 
      face="Verdana, Arial, Helvetica, sans-serif">Frigor&iacute;fico Mabella</FONT></STRONG> 
        - Frederico Westphalen/RS
       </FONT></TD>
      <TD width=201>&nbsp; </TD>
    </TR></TBODY></TABLE>

</BODY></HTML>
