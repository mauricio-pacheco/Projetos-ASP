<script type="text/javascript">
<!--
function CompactRepair(url) {
var leftPos = (screen.availWidth-500) / 2
var topPos  = (screen.availHeight-175) / 2 
var iforgot = window.open(url,'','width=500,height=175,scrollbars=no,resizable=no,status=no,toolbar=no,location=no,top=' + topPos + ',left=' + leftPos);
}
//-->
</script><style type="text/css">
<!--
body {
	background-color: #F4F4F4;
}
.style3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
}
-->
</style>
<%
Response.Write ("<MARQUEE behavior= ""scroll"" align= ""center"" direction= ""up"" height=""208"" scrollamount= ""1"" scrolldelay= ""80"" onmouseover='this.stop()' onmouseout='this.start()'>")
   
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
<table width="106" align="center"><tr><td><div align="center"><span class="style3"><a class=menu href="default.asp?d=<%= Directory %>\" target=_blank><img src="marca.gif" border="0" /><br /><%= FolderName %></a></span></div><br /></td></tr></table>
<%

End If

currentf = currentf + 1
Next
%>
<img src="images/spacer.gif" width=1 height=10 border=0 alt=""><br>
<% If Anonymous Then %>
<% End If %>
<% If Session("userLevel") = "99" Then %>
<!-- ################ Begin i-Gallery Message Board ################# -->
<% Response.Write ("</marquee>")
 If MessageBoard Then %>
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
