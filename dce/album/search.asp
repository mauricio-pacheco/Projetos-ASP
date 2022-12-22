<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_global.inc"-->
<!--#INCLUDE FILE="language/lang_search.inc"-->

<% 	
Dim searchtype, searchquery, myquery
If Request.Form("myquery") <> "" Then
searchtype 		= Request.Form("searchtype")
searchquery 	= Request.Form("myquery")
Else
searchtype 		= Request.Querystring("st")
searchquery 	= Request.Querystring("mq")
End If
If searchtype <> "" then
myquery 	= chr(34)
myquery = myquery & searchquery
myquery = myquery & chr(34)
Else
myquery 	= searchquery
End If
Dim TitleHighlight, DescHighlight, NumberSearchResults, PageSize
TitleHighlight 			= "yellow"
DescHighlight 			= "yellow"
NumberSearchResults 	= True
PercentSearchResults 	= True
PageSize 				= 10
If Request.Querystring("Page") = "" Then
CurrentPage = 1
Else
CurrentPage = CInt(Request.Querystring("Page"))
End If
Dim SearchDataBase, SearchDbTable1, SearchDbTable2, SearchDbTable3, wCount, strText
SearchDataBase        	= "Descriptions"
SearchDbTable1        	= "imagename"
SearchDbTable2        	= "title"
SearchDbTable3        	= "description"
wCount 					= 0
strText 				= myquery
Dim words(100)
Set SearchConn = Server.CreateObject ("ADODB.Connection")
SearchConn.Open strConnect
%>

<!--#INCLUDE FILE="include/searchlibrary.asp"-->

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<link rel="stylesheet" type="text/css" href="style/style.css">

<script language="Javascript"> 
<!--
function imagePopup(url) {
if(document.all)
TheNewWin = window.open(url+'&sh='+screen.height+'&sw='+screen.width,'','fullscreen=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no'); 
else
TheNewWin = window.open(url+'&sh='+window.screen.availHeight+'&sw='+window.screen.availWidth,'','titlebar=no,width=' + window.screen.availWidth+',height='+window.screen.availHeight+',screenX=0,screenY=0')
}

function button_over(eButton){
eButton.style.backgroundColor 	= "#C1D2EE";
eButton.style.borderColor 		= "darkblue darkblue darkblue darkblue";
eButton = null; 
}
function button_out(eButton){
eButton.style.backgroundColor 	= "#EFEFEF";
eButton.style.borderColor 		= "#DDDDDD #DDDDDD #DDDDDD #DDDDDD"; 
}
function button_down(eButton){
eButton.style.backgroundColor 	= "#98B5E2";
eButton.style.borderColor 		= "darkblue darkblue darkblue darkblue";
}
function button_up(eButton){
eButton.style.backgroundColor 	= "#C1D2EE";
eButton.style.borderColor 		= "darkblue darkblue darkblue darkblue";
eButton.style.cursor 			= "hand"; 
}

function setScripts() {
self.name = 'igallery';
}
window.onload = setScripts;
//-->
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10" marginwidth="10" marginheight="10">

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

<!-- * Begin Main Content * -->

<% If Request.Form("myquery")  <> "" or Request.Querystring("mq") <> "" Then

Set RS = Server.CreateObject("ADODB.RecordSet")
%>

<!--#INCLUDE FILE="include/searchpercent.asp"-->

<%
SQLquery = "(" &parsethis(strText ,words ,wCount, 3) & ")"
SQLquery = Replace(SQLquery, "<FIELD1>", SearchDbTable1)
SQLquery = Replace(SQLquery, "<FIELD2>", SearchDbTable2)
SQLquery = Replace(SQLquery, "<FIELD3>", SearchDbTable3)

If searchtype="1" Then
SQLstr = "SELECT * FROM "& SearchDataBase
SQLstr = SQLstr & " WHERE "& SQLquery

SQLstr = SQLstr & " ORDER BY title;"
Else
SQLstr = "SELECT *, " & ab & " AS Score FROM "& SearchDataBase
SQLstr = SQLstr & " WHERE "& SQLquery

SQLstr = SQLstr & " ORDER BY " & ab & " DESC;"
End If

RS.CursorLocation = adUseClient
RS.PageSize = PageSize
RS.Open SQLstr, SearchConn, adOpenStatic, adLockReadOnly, adCmdText

%>

<% If RS.EOF And RS.BOF Then %>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGsrch_sr %></b></font>

</td>
<td align="right">

<font class="textsm" style="color: gray"><b>
&nbsp;<%= IGsrch_pg %>&nbsp;[1 of 1]<br>
</font>

</td>
</tr>
</table>

<hr size="1" color="silver">

<font class="textmed">
<%= IGsrch_null1 %>&nbsp;"<b><%= strText %></b>"&nbsp;<%= IGsrch_null2 %>.<br>
</font>

<% else

PageCount = RS.PageCount
If 1 > CurrentPage Then CurrentPage = 1
If CurrentPage > PageCount Then CurrentPage = PageCount
RS.AbsolutePage = CurrentPage
%>

<!--#INCLUDE FILE="include/paging-search.asp"-->

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGsrch_sr %></b></font>

</td>
<td align="right">

<font class="textsm" style="color: gray"><b>
&nbsp;<%= IGsrch_pg %>&nbsp;[<%= CurrentPage %> of <%= PageCount %>]<br>
</font>

</td>
</tr>
</table>

<hr size="1" color="silver">

<table width="100%" cellspacing="0" cellpadding="0" border="0">

<% Do While RS.AbsolutePage = CurrentPage AND Not RS.EOF %>

<!--#INCLUDE FILE="searchresults.asp"-->

<%
RS.movenext
Loop
RS.close
%>

</table>

<% End If %>

<% If PageCount > 1 then %>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td align="right">

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<%= pgHTML %>
</tr>
</table>

</td>
</tr>
</table>
<% End If %>

<br>

<% Else %>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGsrch_sr %></b></font>

</td>
<td align="right">

<font class="textsm" style="color: gray"><b>
&nbsp;<%= IGsrch_pg %>&nbsp;[1 of 1]<br>
</font>

</td>
</tr>
</table>

<hr size="1" color="silver">

<font class="textmed">
<%= IGsrch_null3 %>
</font>

<% End If %>

</td>
</tr>

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/footer.asp"--></td>
</tr>

</table>

<p>

</body>
</html>
