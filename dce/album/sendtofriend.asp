<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_global.inc"-->
<!--#INCLUDE FILE="language/lang_sendtofriend.inc"-->

<%
mode 		= Request("mode")
Image 		= Request("i")
Folder 		= Request("f")
%>

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<script language="Javascript" type="text/javascript">
<!--
function TAFemailValidation(entered, alertbox) {
with (entered) {
apos=value.indexOf("@"); 
dotpos=value.lastIndexOf(".");
lastpos=value.length-1;
if (apos<1 || dotpos-apos<2 || lastpos-dotpos>3 || lastpos-dotpos<2) 
{if (alertbox) {alert(alertbox);} return false;}
else {return true;}
}}

function TAFconfirmValidation(entered, alertbox) {
with (entered) {
subjectlen = value.length;
if (subjectlen == "") {
if (alertbox) {alert(alertbox);} return false;}
else {return true;}
}}

function TAFvalidation(thisform) {
with (thisform) {
if (TAFconfirmValidation(yname,"<%= IGstf_alrt1 %>")==false) {yname.focus(); return false;};
if (TAFemailValidation(yemail,"<%= IGstf_alrt2 %>")==false) {yemail.focus(); return false;};
if (TAFconfirmValidation(tname,"<%= IGstf_alrt3 %>")==false) {tname.focus(); return false;};
if (TAFemailValidation(temail,"<%= IGstf_alrt4 %>")==false) {temail.focus(); return false;};
}}
//-->
</script>

<link rel="stylesheet" type="text/css" href="style/style.css">

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="760" cellspacing="0" cellpadding="0" border="0">

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/header.asp"--></td>
</tr>

<tr>
<td style="padding-top:7px;" width="200" valign="top">

<!--#INCLUDE FILE="include/menu.asp"-->
<img src="images/spacer.gif" width=200 height=5 border=0 alt=""><br>

</td>

<td width="20" valign="top"><img src="images/spacer-bevel.gif" width=20 height=235 border=0 alt=""></td>
<td style="padding-left:10px;padding-top:15px;" width="530" valign="top">

<font class="text">

<% If mode = "send" then %>

<%
emailapp 	= EmailApp
emailserver = MailServer
fromname   	= Request.Form("yname")
fromaddress = Request.Form("yemail")
toname   	= Request.Form("tname")
toemail  	= Request.Form("temail")
image 		= Request.Form("image")

strsubject 	= IGstf_emsg1

strmessage = 			  "<html>" & vbCrLf
strmessage = strmessage & "<body>" & vbCrLf
strmessage = strmessage & "<font face=arial size=2>" & vbCrLf

strmessage = strmessage & toname&",<p>" & vbCrLf
strmessage = strmessage & IGstf_emsg2&"&nbsp;"&fromname&" ("&fromaddress&") <p>" & vbCrLf
strmessage = strmessage & "<img src="""&image&""" border=0 alt="""">" & vbCrLf
If Request("message") <> "" Then
strmessage = strmessage & "<p><b>"&IGstf_emsg3&":</b><br>" & vbCrLf
strmessage = strmessage & Request("message") & vbCrLf
End If
strmessage = strmessage & "<p>"&IGstf_emsg4&"" & vbCrLf

strmessage = strmessage & "</font>" & vbCrLf
strmessage = strmessage & "</body>" & vbCrLf
strmessage = strmessage & "</html>" & vbCrLf

If emailapp = "1" then
strcontent	= "text/html"
ElseIf emailapp = "2" or emailapp = "4" then
strcontent	= True
ElseIf emailapp = "3" then
strcontent	= "0"
End If

If emailapp = "1" then
strreceipt = False
End If

If emailapp = "1" or emailapp = "2" then
strpriority = "3"
ElseIf emailapp = "3" then
strpriority = "1"
End If

subject 	= strsubject
body 		= strmessage
%>


<% 
If SendMail(emailapp, emailserver, fromname, fromaddress, toname, toemail, subject, body) Then
Msg = 		"<font class=""text"">" & vbCrLf
Msg = Msg & IGstf_sucs1&"&nbsp;"&fromname&"," & vbCrLf
Msg = Msg & "<p>" & vbCrLf
Msg = Msg & IGstf_sucs2&"&nbsp;"&toname&". &nbsp;"&IGstf_sucs3 & vbCrLf
Msg = Msg & "</font>" & vbCrLf
Else
msg =       IGstf_fail1 & vbCrLf
msg = msg & "<p>" & vbCrLf
msg = msg & "<b>"&IGstf_fail2&":</b> "&Err.Description&"" & vbCrLf
Msg = Msg & "</font>" & vbCrLf
End If 
%>


<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td><img src="images/sm-email.gif" width=20 height=24 border=0 alt=""></td>
<td><font class="largeheader">&nbsp;<%= IGstf_head1 %></font><br></td>
</tr>
</table>

<img src="images/spacer.gif" width=5 height=15 border=0 alt=""><br>

<font class="text">
<%= msg %>
</font>

<% Else %>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<form name="newdir" method="post" action="sendtofriend.asp?mode=send" onsubmit="return TAFvalidation(this)">
<input type="hidden" size="36" name="image" value="<%= URLPath &"/"& folder %>/<%= image %>">
<td><img src="images/sm-email.gif" width=20 height=24 border=0 alt=""></td>
<td><font class="largeheader">&nbsp;<%= IGstf_head2 %></font><br></td>
</tr>
</table>

<img src="images/spacer.gif" width=5 height=5 border=0 alt=""><br>

<font class="text">
<%= IGstf_etptxt %><br>
</font>

<img src="images/spacer.gif" width="1" height="10" border="0"><br>

<table align="center" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<table cellspacing="2" cellpadding="2" border="0">

<tr>
<td nowrap><font class="text"><%= IGstf_frm1 %>:&nbsp;&nbsp;</font></td>
<td><input class="input" type="text" size="32" name="yname" value=""><br></td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGstf_frm2 %>:&nbsp;&nbsp;</font></td>
<td><input class="input" type="text" size="32" name="yemail" value=""><br></td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGstf_frm3 %>:&nbsp;&nbsp;</font></td>
<td><input class="input" type="text" size="32" name="tname" value=""><br></td>
</tr>

<tr>
<td nowrap><font class="text"><%= IGstf_frm4 %>:&nbsp;&nbsp;</font></td>
<td><input class="input" type="text" size="32" name="temail" value=""><br></td>
</tr>

<tr>
<td colspan="2" align="right">
<textarea style="font-family:arial;font-size:8pt;padding:3px;border:1px solid #000000;" rows="5" cols="56" name="message"><%= IGstf_frm5 %></textarea><br>
</td>
</tr>

</table>

</td>
<td width="20">&nbsp;</td>
<td valign="top" align="center">

<img src="images/spacer.gif" width="1" height="5" border="0"><br>
<img class="shadow" src="<%= UrlPath &"/"& Folder %>/<%= Image %>" width=180 border=0 alt="">
<p>
<input style="font-size: 8.5pt;" type="submit" value="<%= IGstf_but1 %>">

</td>
</tr></form>
</table>

<% End if %>

</font>

</td>
</tr>

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/footer.asp"--></td>
</tr>

</table>

<p>

</body>
</html>