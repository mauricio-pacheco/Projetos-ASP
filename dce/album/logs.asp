<%@ LANGUAGE="VBSCRIPT" %>

<!--#INCLUDE FILE="include/security-admin.inc"-->
<!--#INCLUDE FILE="include/globalsets.asp"-->
<!--#INCLUDE FILE="language/lang_global.inc"-->
<!--#INCLUDE FILE="language/lang_logs.inc"-->

<%
Set LogConn = Server.CreateObject ("ADODB.Connection")
LogConn.Open strConnect
%>

<% 
DataTable   = "Log"

Dim pagesize
Dim currentpage
Dim appRS
Dim appSQL
Dim pagecount
pagesize = 20

If Request("Page")="" Then
currentpage = 1
Else
currentpage = CInt(Request("Page"))
End If
%>

<html>
<head>

<title>DCE - URI - Campus de Frederico Westphalen/RS</title>

<link rel="stylesheet" type="text/css" href="style/style.css">

<script language="JavaScript">
<!--
var ie = (document.all && document.getElementById) ? true : false;
function CheckAll(isOnload){
var trk=0;
for (var i=0;i<document.logs.elements.length;i++) {
var e = document.logs.elements[i];
if ((e.name != 'allbox') && (e.type=='checkbox')) {
if (isOnload != 1) {
trk++;
e.checked = document.logs.allbox.checked;
if (document.logs.allbox.checked) {
hL(e);
}
else {
dL(e);
}}
else {
e.tabIndex = i;
if (e.checked) {
hL(e);
}
else {
dL(e);
}}}}}

function CCA(CB){
if (CB.checked)
hL(CB);
else
dL(CB);
var TB=TO=0;
for (var i=0;i<document.logs.elements.length;i++) {
var e = document.logs.elements[i];
if ((e.name != 'allbox') && (e.type=='checkbox')) {
TB++;
if (e.checked)
TO++;
} }
if (TO==TB)
document.logs.allbox.checked=true;
else
document.logs.allbox.checked=false;
}

function hL(E){
if (ie) {
while (E.tagName!="TR")
{E=E.parentElement;}
}
else {
while (E.tagName!="TR")
{E=E.parentNode;}
}
E.className = "H";
}

function dL(E){
if (ie) {
while (E.tagName!="TR")
{E=E.parentElement;}
}
else {
while (E.tagName!="TR")
{E=E.parentNode;}
}
E.className = "";
}

function VerifyDelete(){
var verify = confirm("<%= IGlgs_alrt1 %>");
if (verify == true) {
document.logs.submit();
}}
function VerifyDelete1(URL) {
var verify1 = confirm("<%= IGlgs_alrt2 %>");
if (verify1 == true) {
window.open(URL,"_self");
}}
//-->
</script>

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

<table width="100%" cellspacing="0" cellpadding="0"><tr>
<td>

<% If Request.Querystring("mode") = "delete" Then %>

<% 
strid = Request("kid")
page  = Request("Page")

If strid <> "" Then

Sql = "DELETE * FROM " & DataTable
Sql = Sql & " WHERE ID=" & strid & ";"
LogConn.Execute(SQL)

Else

For Each item In Request("DeleteLog")
Sql = "DELETE * FROM " & DataTable
Sql = Sql & " WHERE ID=" & item & ";"
LogConn.Execute(SQL)
Next

End if

%>

<SCRIPT LANGUAGE="JavaScript">
<!--
function redirect() {
window.location.href="logs.asp"
}
setTimeout('redirect()',5000)
// -->
</script>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGlgs_deltitl %></b></font>
<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<font class="text">
<% If strid <> "" Then %>
<%= IGlgs_delmsgl %><br>
<% Else %>
<%= IGlgs_delmsg2 %><br>
<% End If %>
</font>

<% Else %>

<font style="font-family: Verdana, Arial, Helvetica; font-size: 12pt; color: #000000;"><b><%= IGlgs_titl %></b></font>
<br><img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<font class="text">

<%= IGlgs_msgl %><br>

</font>

<img src="images/spacer.gif" width=1 height=8 border=0 alt=""><br>

<% 
order = Request("order")
If order = "" Then 
Session("SortOrder") = "ASC"
strorder = Session("SortOrder")
Else 
Session("SortOrder") = order
strorder = Session("SortOrder")
End If

Set kRS = Server.CreateObject("ADODB.RecordSet")

SQL = "SELECT * "
SQL = SQL & " FROM " & DataTable
SQL = SQL & " ORDER BY lastname "&strorder&";"

kRS.CursorLocation = adUseClient
kRS.PageSize = pagesize
kRS.Open SQL, LogConn, adOpenStatic, adLockReadOnly, adCmdText

If kRS.EOF And kRS.BOF Then
%>

<font class="text">
<b><%= IGlgs_msg2 %></b>
</font>

<%
else
%>
<table width="510" bgcolor="gray" cellpadding=0 cellspacing=0 border=0>
<tr>
<form action="logs.asp?mode=delete&Page=<%= currentpage %>" method="post" name="logs">
<td>
<table width="100%" cellpadding=1 cellspacing=1 border=0>

<tr bgcolor="#C4CFDE">
<td width="16"><input name="allbox" type="checkbox" value="Check All" onClick="CheckAll();"></td>
<td width="20" nowrap><input type="Image" name="delete" src="images/spacer.gif" border="0" width="20" height="20"></td>
<td width="45%" style="padding-left: 3px;"><font class="textsm"><%= IGlgs_grd1 %>:</font></td>
<td width="55%" style="padding-left: 3px;"><font class="textsm"><%= IGlgs_grd2 %>:</td>
<td width="85" style="padding-left: 3px;" nowrap><font class="textsm"><%= IGlgs_grd3 %>:</td>
<td width="35" style="padding-left: 3px;" nowrap><font class="textsm"><%= IGlgs_grd4 %>:</td>
</tr>

<%
pagecount = kRS.PageCount
If 1 > currentpage Then currentpage = 1
If currentpage > pagecount Then currentpage = pagecount
kRS.AbsolutePage = currentpage

iCount = 0

Do While kRS.AbsolutePage = currentpage AND Not kRS.EOF

ufirstname 	= kRS("firstname")
ulastname 	= kRS("lastname") 
uemail 		= kRS("email")
utimeadded 	= kRS("timein")
udateadded 	= kRS("datein")

%>

<% If Eval(iCount\2 = iCount/2) Then %>

<tr bgcolor="#ffffff" style="cursor:default;" onMouseOver="this.bgColor='#DDE3EB'" onMouseOut="this.bgColor='#FFFFFF'">
<td><input onClick="CCA(this);" type="checkbox" name="DeleteLog" value="<%= kRS("ID") %>"></td>
<td><a href="javascript: VerifyDelete1('logs.asp?mode=delete&kid=<%= kRS("ID") %>&Page=<%= currentpage %>');"><img src="images/sm-delete.gif" width=20 height=20 border=0 alt=""></a></td>
<td style="padding-left: 3px;"><font class="textsm"><%= kRS("lastname") %>,&nbsp;<%= kRS("firstname") %></td>
<td style="padding-left: 3px;"><font class="textsm"><%= kRS("email") %></td>
<td style="padding-left: 3px;"><font class="textsm"><%= kRS("datein") %></td>
<td style="padding-left: 3px;"><font class="textsm"><%= kRS("total") %></td>
</tr>

<% Else %>

<tr bgcolor="#F9F9F9" style="cursor:default;" onMouseOver="this.bgColor='#DDE3EB'" onMouseOut="this.bgColor='#F9F9F9'">
<td><input onClick="CCA(this);" type="checkbox" name="DeleteLog" value="<%= kRS("ID") %>"></td>
<td><a href="javascript: VerifyDelete1('logs.asp?mode=delete&kid=<%= kRS("ID") %>&Page=<%= currentpage %>');"><img src="images/sm-delete.gif" width=20 height=20 border=0 alt=""></a></td>
<td width="" style="padding-left: 3px;"><font class="textsm"><%= kRS("lastname") %>,&nbsp;<%= kRS("firstname") %></td>
<td width="" style="padding-left: 3px;"><font class="textsm"><%= kRS("email") %></td>
<td style="padding-left: 3px;"><font class="textsm"><%= kRS("datein") %></td>
<td style="padding-left: 3px;"><font class="textsm"><%= kRS("total") %></td>
</tr>

<%
End If
iCount = iCount +1 
%>

<%
kRS.movenext
Loop
kRS.close
%>
</table>

</td>
</tr>
</table>

<img src="images/spacer.gif" width=5 height=8 border=0 alt=""><br>

<!--#INCLUDE FILE="include/paging-gen.asp"-->

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td><input class="button" style="font-size: 8.5pt;" type="button" onClick="javascript:VerifyDelete();" value="<%= IGlgs_but %>"></td>
<td align="right">

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<%= pgHTML %>
</tr>
</table>

</td>
</tr>
</table>

<% If PageCount > 1 Then %>
<font class="paging">[<%= PageSize %>]&nbsp;<%= IGlgs_page1 %>&nbsp;[<%= CurrentPage %>&nbsp;<%= IGlgs_page2 %>&nbsp;<%= PageCount %>]</font>
<% End If %>

</form>

<% End If %>

<% End If %>

</td>
</tr>
</table>

</td>
</tr>

<tr>
<td colspan="3"><!--#INCLUDE FILE="include/footer.asp"--></td>
</tr>

</table>

<p>

<script language="JavaScript" type="text/javascript">
<!-- 
var Today = new Date;
var mm1 = Today.getMonth() + 1;
if (mm1<10){mm1="0"+ mm1;}
var dd1 = Today.getDate();
if (dd1<10){dd1="0"+dd1;}
var yy1= Today.getFullYear();
if((yy1 >= 0) &&  (yy1 < 50)) {yy1=yy1+2000;}
if ((yy1 >= 50) && (yy1<100)){yy1=yy1+1900;}
var hh1= Today.getHours()	
var min1= Today.getMinutes()
var min2 = min1 + 10;
if (min1<10){min1="0"+ min1;}	
var chkDATE1=mm1+ "/" + dd1+ "/" + yy1 + " " + hh1 + ":" + min1;	
if(min2 >= 60) {
hh1=hh1+1;
min2=min2-60;}
if (min2<10){min2="0"+ min2;}		
var chkDATE2=mm1+ "/" + dd1+ "/" + yy1 + " " + hh1 + ":" + min2;			
var AlertMessage = "<%= IG_timeout %>";
var TimeOutMinutes = 1;	
function AlertUser()
{
switch(TimeOutMinutes)
{
case 1:
break;
case 2:
alert(AlertMessage);
break;
default:
break;								
}
TimeOutMinutes++;
setTimeout('AlertUser()', <%= OutMinusTwo %>);
}
AlertUser();
// -->
</script>

</body>
</html>

