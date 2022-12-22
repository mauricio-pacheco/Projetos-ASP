<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Vista M&oacute;veis - Vista Ga&uacute;cha/RS</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<LINK href="default.css" type=text/css rel=STYLESHEET>
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<script language=Javascript>

function preview1(){
if (form.name1.value == ""){
div1.innerHTML = "<p align=center><br><br><br><br><b>A name is recomended!!<br><br><input type=text name=name2 size=20 maxlength=255 onchange=name1change()><br> Enter a title for you page and Prieview again!!</b></p>"}
else{
div1.innerHTML = "<B>"+ form.name1.value + "--" + form.date1.value + "</b><br><br>" + form.Entry1.value}
}

function name1change(){
form.name1.value = form.name2.value
}
</script>

<BODY bgColor=#f6f6f6 text="#000000" link="#000000" vlink="#000000" alink="#000000" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> </font> 
<div align="center"> 
  <p>&nbsp;</p>
  <p><img src="menornn.gif" width="120" height="109"> </p>
  <p><font size="3" face="Verdana, Arial, Helvetica, sans-serif">Administra&ccedil;&atilde;o 
    das Not&iacute;cias</font></p>
  <p> <font color="#0099CC">
    <%
	Dim entry1
	dim date1
	dim name1
	
inputnum = request.querystring("inputnum")
If IsEmpty(inputnum) or inputnum = "" then


%>
    </font></p>
  <form id=form method="POST" action="submit.asp?inputnum=1">
    <div align="center"> 
      <center>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" height="48" bordercolor="#0099CC" bgcolor="#C0C0C0">
          <tr> 
            <td width="56%" height="56" bgcolor="#f6f6f6"> 
              <p align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="admin.asp">GERENCIAR 
                NOT&Iacute;CIAS</a></strong></font></p>
              <p align="center"><font color="#0099CC"><font color="#000000" size="2" face="Verdana">Data:</font><font face="Verdana" size="2">&nbsp;</font> 
                <input type="text" name="date1" value="<% =Date %>" size="13">
                &nbsp;&nbsp; &nbsp;</font></p>
              <p align="center"><font color="#0099CC"><font color="#000000" size="2" face="Verdana">Assunto:</font> 
                <input type="text" name="name1" size="38" maxlength="255">
                </font></p>
              <p align="center"><font color="#000000" size="2" face="Verdana">Resumo:</font><font color="#0099CC" size="2" face="Verdana"><br>
                <textarea rows="40" name="Entry1" cols="60" style="border-style: solid; border-width: 2"></textarea>
                </font><font color="#0099CC"><br>
                </font></p></td>
          </tr>
        </table>
      </center>
    </div>
    <div align="center">
      <center>
        <font color="#0099CC"><br>
        <input type="submit" value="ENVIAR" name="B1">
        </font> 
      </center>
    </div>
    </form>
  <p>&nbsp;</p>
  <p><font color="#0099CC"> 
    <% else
date1 = Now()
pname = request.form("name1")
pdate = request.form("date1")
entry1 = request.form("Entry1")

' Yeah I got quotes praise the lord he he he

pname = Replace(request.form("name1"), "'", "''")

pdate = request.form("date1")
entry1 = Replace(Request.Form("Entry1"), "'", "''")


	set conn = server.createobject("adodb.connection")
		DSNtemp="DRIVER={Microsoft Access Driver (*.mdb)}; "
    DSNtemp=dsntemp & "DBQ=" & server.mappath("news/journal.mdb")

    conn.Open DSNtemp

   SQLstmt = "INSERT INTO journal (pname,pdate,pentry)"
	SQLstmt = SQLstmt & " VALUES (" 
	SQLstmt = SQLstmt & "'" & pname & "',"
	SQLstmt = SQLstmt & "'" & pdate & "',"
	SQLstmt = SQLstmt & "'" & entry1 & "'"
	SQLstmt = SQLstmt & ")"

	Set RS = conn.execute(SQLstmt)
%>
    </font></p>
  <p><font color="#0099CC"><br>
    </font> </p>
  <p align="center"><font color="#000000" size="4" face="Verdana">Dados enviados 
    com sucesso!!!</font></p>
  <p align="center"><img src="menornn.gif" width="120" height="109"></p>
  <p align="center"><font color="#000000" size="2" face="Verdana"><a href="submit.asp">Postar 
    Novamente</a></font></p>
  <p align="center"> <font color="#0099CC">
    <%end if%>
    </font> </p>
  <p>&nbsp; </p>
</div>
</BODY></HTML>
