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
<title>Frigor&iacute;fico Mabella</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<LINK href="../default3.css" type=text/css rel=STYLESHEET>
<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<font face="arial,helvetica" size=2> </font> 
<h2 align="center">&nbsp;</h2>
<h2 align="center"><img src="logo.jpg">&nbsp;</h2>
<p align="center">&nbsp;</p>
<h2 align="center"><font color="#000000" size="2" face="arial,helvetica">&Aacute;rea 
  somente para ouvintes.</font></h2>
<p align="center"><font color="#000000" size="2" face="arial,helvetica">Se voc&ecirc; 
  ainda n&atilde;o se inscreveu, voc&ecirc; ser&aacute; direcionado para a &aacute;rea 
  de inscri&ccedil;&atilde;o.</font></p>
<p align="center">&nbsp;</p>
</body>
</html>