<script type="text/javascript">
<!--
function CompactRepair(url) {
var leftPos = (screen.availWidth-500) / 2
var topPos  = (screen.availHeight-175) / 2 
var iforgot = window.open(url,'','width=500,height=175,scrollbars=no,resizable=no,status=no,toolbar=no,location=no,top=' + topPos + ',left=' + leftPos);
}
//-->
</script>

<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>

<table width="200" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="19" valign="bottom"><img src="images/sm-folder.gif" alt="" width="16" height="14" border="0"></td>
<td class="textsm" valign="bottom"><a class="textsm" style="text-decoration:none;" href="igallery.asp"><b><%= GalleryName %></b></a></td>
</tr>
</table>

<img src="images/spacer.gif" width=1 height=3 border=0 alt=""><br>

<!-- ################ Begin Tree Layout ################ -->
<table width="200" cellspacing="0" cellpadding="0" border="0">
<%
On Error Resume Next

folderc = 0
For Each fn1 In FileList
folderc = folderc +1
Next

currentf = 1
For Each fn In FileList
If NOT LCase(fn.Name) = "_vti_cnf" Then ' Hide Front Page "_vti_cnf" Folder In Menu

If Request("D") Then
String1 = LCase(Request("D"))
Else
String1 = "\"&LCase(Replace(Request("folder"),"/","\"))&"\"
End If
String2 = "\"&LCase(fn.Name)&"\"
If InStr(String1,String2)>0 Then
ShowFolder = True
Else
ShowFolder = False
End if

If len(fn.Name) > 30 Then 
FolderName = Left(fn.Name,30)&"..."
Else
FolderName = fn.Name
End if

Directory = fn
Directory = Replace(LCase(Directory),LCase(UploadPath),"")
Directory = URLSpace(Directory)
%>

<tr>
<td height="18" width="17"><img src="images/sm-tree2.gif" alt="" width="17" height="17" border="0"></td>
<td width="18" nowrap><img src="images/sm-folder<% If ShowFolder Then %>4<% Else %>5<% End If %>.gif" width=17 height=16 border=0 alt=""></td>
<td width="100%" nowrap><a class="linkxsm" href="igallery.asp?d=<%= Directory %>\"><b><%= FolderName %></b></a></td>
</tr>

<%
End If
currentf = currentf + 1
Next
%>
</table>
<!-- ################ End Tree Layout ################ -->

<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>

<!--#include file="../searchform.asp"-->

<hr size="1" color="silver">

<% If Anonymous Then %>

<table cellspacing="0" cellpadding="2" border="0">
<tr>
<td><img src="images/sm-portrait.gif" alt="" width="15" height="16" border="0"></td>
<td class="textsm"><b><%= IGmenu_spo %>:</b></td>
</tr>
</table>

<table width="200" cellspacing="0" cellpadding="0" border="0">
<tr>
<td height="17" align="right"><a class="linkxsm" href="submitphotos.asp?mi=1"><b><%= IGmenu_subfrm %></b></a></td>
<% If Request("mi") = "1" Then %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/xsm-email.gif"  border=0 alt=""></td>
<% Else %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/arrow-rt.gif" width=13 height=10 border=0 alt=""></td>
<% End If %>
</tr>
</table>

<% End If %>


<% If Session("userLevel") = "99" Then %>

<hr size="1" color="silver">

<table cellspacing="0" cellpadding="2" border="0">
<tr>
<td><img src="images/sm-users.gif" alt="" width="14" height="14" border="0"></td>
<td class="textsm"><b><%= IGmenu_ua %>:</b></td>
</tr>
</table>

<table width="200" cellspacing="0" cellpadding="0" border="0">
<tr>
<td height="17" align="right"><a class="linkxsm" href="users.asp?mode=add&mi=2"><b><%= IGmenu_anu %></b></a></td>
<% If Request("mi") = "2" Then %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/sm-cal.gif" width=16 height=14 border=0 alt=""></td>
<% Else %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/arrow-rt.gif" width=13 height=10 border=0 alt=""></td>
<% End If %>
</tr>
<tr>
<td height="17" align="right"><a class="linkxsm" href="users.asp?mi=3"><b><%= IGmenu_mu %></b></a></td>
<% If Request("mi") = "3" Then %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/sm-cal.gif" width=16 height=14 border=0 alt=""></td>
<% Else %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/arrow-rt.gif" width=13 height=10 border=0 alt=""></td>
<% End If %>
</tr>
<tr>
<td height="17" align="right"><a class="linkxsm" href="logs.asp?mi=4"><b><%= IGmenu_ulf %></b></a></td>
<% If Request("mi") = "4" Then %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/sm-cal.gif" width=16 height=14 border=0 alt=""></td>
<% Else %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/arrow-rt.gif" width=13 height=10 border=0 alt=""></td>
<% End If %>
</tr>
</table>

<img src="images/spacer.gif" width=1 height=5 border=0 alt=""><br>

<table cellspacing="0" cellpadding="2" border="0">
<tr>
<td><img src="images/sm-system1.gif" alt="" width="14" height="14" border="0"></td>
<td class="textsm"><b><%= IGmenu_smngt %>:</b></td>
</tr>
</table>

<table width="200" cellspacing="0" cellpadding="0" border="0">
<tr>
<td height="17" align="right"><a class="linkxsm" href="system.asp?mi=5"><b><%= IGmenu_smaint %></b></a></td>
<% If Request("mi") = "5" Then %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/sm-cal.gif" width=16 height=14 border=0 alt=""></td>
<% Else %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/arrow-rt.gif" width=13 height=10 border=0 alt=""></td>
<% End If %>
</tr>
<tr>
<td height="17" align="right"><a class="linkxsm" href="javascript:void('0');" onClick="CompactRepair('compact-repair.asp');"><b><%= IGmenu_candr %></b></a></td>
<% If Request("mi") = "6" Then %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/sm-cal.gif" width=16 height=14 border=0 alt=""></td>
<% Else %>
<td width="20" style="padding-right:2px;" align="right" nowrap><img src="images/arrow-rt.gif" width=13 height=10 border=0 alt=""></td>
<% End If %>
</tr>
</table>

<hr size="1" color="silver">

<!-- ################ Begin i-Gallery Message Board ################# -->
<% If MessageBoard Then %>
<script type="text/javascript">
<!--
var ie=document.all
var ns6=document.getElementById&&!document.all
var dragapproved=false
var z,x,y
function move(e){
if (dragapproved){
z.style.left=ns6? temp1+e.clientX-x: temp1+event.clientX-x
z.style.top=ns6? temp2+e.clientY-y : temp2+event.clientY-y
return false}}
function drags(e){
if (!ie&&!ns6)
return
var firedobj=ns6? e.target : event.srcElement
var topelement=ns6? "HTML" : "BODY"
while (firedobj.tagName!=topelement&&firedobj.className!="drag"){
firedobj=ns6? firedobj.parentNode : firedobj.parentElement}
if (firedobj.className=="drag"){
dragapproved=true
z=firedobj
temp1=parseInt(z.style.left+0)
temp2=parseInt(z.style.top+0)
x=ns6? e.clientX: event.clientX
y=ns6? e.clientY: event.clientY
document.onmousemove=move
return false}}
document.onmousedown=drags
document.onmouseup=new Function("dragapproved=false")
//-->
</script>
<div align="center">
<div class="drag" style="position: relative; cursor: move;">
<div style="padding:5px; border:1px solid #cccccc; width:180px; background-color:#fbfbfb; filter:alpha(opacity=60);">
<div style="padding-bottom:5px; width:180px;">
<table style="font-family:Verdana; font-size:10px; font-weight:bold; text-align:left;" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>&nbsp;<%= IGmenu_mb %></td>
<td align="right"><img src="images/stomp-pad.gif" width=27 height=11 border=0 alt=""></td>
</tr>
</table>
</div>
<iframe name="v7" src="http://www.b-cp.com/updates/igsu.asp" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" height="100" width="180"></iframe>
</div>
</div>
<% End If %>
<!-- ################ End i-Gallery Message Board ################# -->


<% End If %>