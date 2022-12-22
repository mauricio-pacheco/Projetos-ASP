<%
if Request.Cookies("username") = "" then
  Response.Redirect("nologin.asp?page=membersonly.asp")
end if
%>
<STYLE type="text/css">
<!--
BODY {
scrollbar-face-color:#0080C0;
scrollbar-highlight-color:#0080C0;
scrollbar-3dlight-color:#454545;
scrollbar-darkshadow-color:#454545;
scrollbar-shadow-color:#454545;
scrollbar-arrow-color:#FFFFFF;
scrollbar-track-color:#454545;
}
-->
</STYLE>

<html>
<head>
<title>Members only page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="default.css" type=text/css rel=STYLESHEET>
<body bgcolor="#292929" link="#DD0000" vlink="#DD0000" alink="#000000">
<font face="arial,helvetica" size=2> </font> 
<h2 align="center">&nbsp;</h2>
<h2 align="center"><img src="menor.jpg" width="180" height="131"></h2>
<h2 align="center"><font color="#FFFFFF" size="2" face="arial,helvetica">&Aacute;rea 
  somente para membros</font></h2>
<p align="center"><font color="#FFFFFF" size="2" face="arial,helvetica">Se voc&ecirc; 
  ainda n&atilde;o se inscreveu, voc&ecirc; ser&aacute; direcionado para a &aacute;rea 
  de inscri&ccedil;&atilde;o.</font></p>
</body>
</html>