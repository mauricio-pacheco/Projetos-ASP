<%
'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Guide - Web Wiz Mailing List
'**                                                              
'**  Copyright 2001-2002 Bruce Corkhill All Rights Reserved.                                
'**
'**  This program is free software; you can modify (at your own risk) any part of it 
'**  under the terms of the License that accompanies this software and use it both 
'**  privately and commercially.
'**
'**  All copyright notices must remain in tacked in the scripts and the 
'**  outputted HTML.
'**
'**  You may use parts of this program in your own private work, but you may NOT
'**  redistribute, repackage, or sell the whole or any part of this program even 
'**  if it is modified or reverse engineered in whole or in part without express 
'**  permission from the author.
'**
'**  You may not pass the whole or any part of this application off as your own work.
'**   
'**  All links to Web Wiz Guide and powered by logo's must remain unchanged and in place
'**  and must remain visible when the pages are viewed unless permission is first granted
'**  by the copyright holder.
'**
'**  This program is distributed in the hope that it will be useful,
'**  but WITHOUT ANY WARRANTY; without even the implied warranty of
'**  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR ANY OTHER 
'**  WARRANTIES WHETHER EXPRESSED OR IMPLIED.
'**
'**  You should have received a copy of the License along with this program; 
'**  if not, write to:- Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom.
'**    
'**
'**  No official support is available for this program but you may post support questions at: -
'**  http://www.webwizguide.info/forum
'**
'**  Support questions are NOT answered by e-mail ever!
'**
'**  For correspondence or non support questions contact: -
'**  info@webwizguide.com
'**
'**  or at: -
'**
'**  Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom
'**
'****************************************************************************************


'If the session variable is False or does not exsist then redirect the user to the unauthorised user page
If Session("blnIsUserGood") = False or IsNull(Session("blnIsUserGood")) = True then
	'Redirect to unathorised user page
	Response.Redirect"unauthorised_user_page.htm"
End If
%>
<html>
<head>
<title>Administra&ccedil;&atilde;o dos E-mails Cadastrados</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<!-- The Web Wiz Guide - Web Wiz Mailing List is written and produced by Bruce Corkhill ©2001-2002
     	 If you want your own ASP Mailing List then goto http://www.webwizguide.info -->

<LINK href="style.css" type=text/css rel=STYLESHEET>

</head>

<body bgcolor="#FFFFFF" text="#000000">
<h2 align="center">&nbsp;</h2>
<h2 align="center"><font face="Arial, Helvetica, sans-serif">Administra&ccedil;&atilde;o dos E-mails Cadastrados </font></h2>
<br>
<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
 <tr> 
  <td><div align="center">
    <p><a href="send_mail.asp?Format=advHTML" target="_self"><img border="0" src="corel_trace_01.jpg" width="80" height="80"></a></p>
    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="send_mail.asp?Format=advHTML" target="_self">ENVIAR E-MAIL PARA TODOS OS USUÁRIOS CADASTRADOS</a><br>
        <br>
      </font></p>
  </div></td>
 </tr>
 <tr> 
  <td height="47"><div align="center">
    <p>&nbsp;</p>
    <p><a href="delete_list_members_form.asp" target="_self"><img border="0" src="corel_rave_01.jpg" width="80" height="80"></a></p>
    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="delete_list_members_form.asp" target="_self">LISTA DE USUÁRIOS CADASTRADOS</a><br>
        <br>
      </font></p>
  </div></td>
 </tr>
</table>
<div align="center"><br>
 <br>
 <br>
</div>
</body>
</html>
