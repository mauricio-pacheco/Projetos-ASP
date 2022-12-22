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
<td class="textsm" valign="bottom"><a class="textsm" style="text-decoration:none;" href="dcegaleria.asp"><b><%= GalleryName %></b></a></td>
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
<% If Anonymous Then %>
<% End If %>
<% If Session("userLevel") = "99" Then %>
<hr size="1" color="silver">

<table cellspacing="0" cellpadding="2" border="0">
<tr>
<td width="14"><img src="images/sm-users.gif" alt="" width="14" height="14" border="0"></td>
    <td width="249" class="textsm"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">LOGADO 
      COMO ADMIN</font></b></td>
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
</script><div align="center">
<% End If %>
<!-- ################ End i-Gallery Message Board ################# -->
<% End If %>
