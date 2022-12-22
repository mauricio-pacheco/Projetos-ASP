<html>
<head>
<title>Mandry Web Design Suporte Online</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK 
href="style3.css" type=text/css rel=StyleSheet>
<style>
td,body {font-family:verdana,sans-serif;font-size:10;color:#FFFFFF}
</style>
<script>


function validacion() {
 if (document.FormChat.id.value.length>10) {
  alert('Seu Nick deve ter no máximo 10 caracteres')
  document.FormChat.id.value=""
 }
}

/*	foco

	aponta o cursor para a posição adequada.
*/


function foco() {
 if(FormChat.id.value=="") FormChat.id.focus();
 else FormChat.chat.focus();
}
</script>
</head>
<body bgcolor="#000000" onLoad="foco()" topmargin="5" leftmargin="5">
<p align="center"> 
  <embed src="http://www.mandrywebdesign.net/titulo.swf" width="1000" height="100"></embed></p>
<p align="center">
  <embed src="icqmsn.swf" width="300" height="80"></embed></p>
<p align="center">Digite sua mensagem...logo iremos atende-l&ocirc;...</p>
<table cellspacing="1" cellpadding="0" border="0" width="100%" bgcolor="#000000" height="32%">
  <tr> 
    <td width="100%" valign="top" height="13"> 
      <table id="Tabla" border='0' mm_noconvert="TRUE" width="100%" cellspacing="4" cellpadding="0">
        <tr> 
          <td width="10%"></td>
          <td width="10%"></td>
          <td width="40%"></td>
		  <td width="40%"></td>
        </tr>
        <%
  if len(trim(request.form("chat")))>0 then

   dim chat
   dim i
   dim j
   dim k

   chat = trim(request.form("chat"))
   k=18
   j=0
   i=0
   do until i=len(chat) 
    i=i+1
    j=j+1
    if mid(chat,i,1)=" " then
     j=0
    end if
    if j=k then
     chat = left(chat,i)& " " & right(chat,len(chat)-i)
    end if
   loop
 
   application("J") = application("I") 
   application("I") = application("H")
   application("H") = application("G")
   application("G") = application("F")
   application("F") = application("E")
   application("E") = application("D")
   application("D") = application("C")
   application("C") = application("B")
   application("B") = application("A")
   application("A") = "<tr bgcolor='#000000'><td>" & time() & "</td><td><b>" & request.form("id") & "</b></td><td>" & chat & "</td></tr>" 
  end if
response.write(application("A")&application("B")&application("C")&application("D")&application("E")&application("F")&application("G")&application("H")&application("I")&application("J"))
%> 

      </table>
    </td>
  </tr>
  <tr> 
    <td width="100%" align="center" bgcolor="#000000" height="20"> 
      <form name='FormChat' method='post' action='suporte.asp'>
        <p> <b> <font size="2"> <br>
          <font color="#00FF00">Nick:</font></font></b> 
          <input name='id' size='12' value='<%=(request.form("id"))%>' onKeyUp='validacion()' style="font-size: 8pt; font-family: Verdana; text-align: Center; font-variant: small-caps; border-style: solid; border-color: #608000">&nbsp;
        <b><font color="#FF0000" size="2">Mensagem:</font> </b><input size='70' name='chat' style="font-size: 8pt; font-family: Verdana; border-style: solid; border-color: #608000"> <input type='submit' value='enviar' name="submit" style="font-size: 8pt; font-family: Verdana; background-color: #99CC00; border-style: solid; border-color: #608000">
        </p>
      </form>

    </td>
  </tr>
</table>
<p align="center"><a href="http://www.mandrywebdesign.net/index.asp"><img src="homeforum.jpg" width="102" height="32" border="0"></a></p>
<p align="center"><font color="#FFFFFF">Mandry Web Master est&aacute;:</font></p>
<p align="center"><img src="http://web.icq.com/whitepages/online?icq=287412105&img=9"></p>
                                                              </body>
</html>
