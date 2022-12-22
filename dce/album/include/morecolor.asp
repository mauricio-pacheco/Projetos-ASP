<%@ LANGUAGE="VBSCRIPT" %>
<%
Dim sAgent, b_IE
Dim ie
b_IE  = false
b_NN6 = false
sAgent = Request.ServerVariables("HTTP_USER_AGENT")
if (inStr(sAgent,"MSIE")>0) then
b_IE = true
end if
if (inStr(sAgent,"Gecko")>0) then
b_NN6 = true
end if
ie = b_IE
nn6 = b_NN6
Dim eSiteName
eSiteName = Request.ServerVariables("SERVER_NAME")
Dim eScriptName
eScriptName = Request.ServerVariables("Script_Name")
eScriptName = Mid(eScriptName,InstrRev(eScriptName,"/") + 1)
Dim eRoot, eServerName
eRoot 		 	= Replace(Request.ServerVariables("Script_Name"),"/" & eScriptName,"")
eServerName 	= "http://" & Request.ServerVariables("SERVER_NAME") & Replace(Request.ServerVariables("SCRIPT_NAME"),"/" & eScriptName,"")
ePageLocation 	= "http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("Script_Name")
eHeaders = "<HTML><HEAD><TITLE>"&eTitle&"</TITLE></HEAD><BODY text=#000000 bgColor=#ffffff><font face=Arial color=#000000 size=2></font></BODY></HTML>"
If eType = 1 Then
eWidth = eWidth+25
End If
%>

<html>
<head>

<title>.:: Color Chart (1488) ::.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</title>

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<script language="JavaScript">
<!-- Begin
function showC(oBox,oColor) {
oBox.style.backgroundColor = oColor.style.backgroundColor
}
function showH(oBox,oColor) {
oBox.innerHTML = oColor.style.backgroundColor.toUpperCase();
}

function setColor(oBox,oColor)
{
oBox.style.backgroundColor = oColor.style.backgroundColor
document.all.col.value = oColor.style.backgroundColor
}
function sendColor(){
if(opener.document.all.MoreColor.value == 'foreColor')
{
opener.eBox.document.execCommand('foreColor', false, document.all.col.value);
opener.eBox.focus();
window.close();
}
else
{
opener.eBox.document.execCommand('backColor', false, document.all.col.value);
opener.eBox.focus();
window.close();
}
}
// -->
</script>

<%
mp = "onmouseover=""showC(c,this),showH(h,this)"" onclick=""setColor(s,this)"""
w  = "width:4px;"
h  = "height:6px;"
%>

<input type="hidden" name="col">

<table cellspacing="0" cellpadding="10" border="0">
<tr>
<td>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td>

<table cellpadding="0" cellspacing="0" border="0">

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#FF0000;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF2000;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF4000;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF6000;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF8000;<%= w %>"></td>
<td <%= mp %> style="background-color:#FFA000;<%= w %>"></td>
<td <%= mp %> style="background-color:#FFC000;<%= w %>"></td>
<td <%= mp %> style="background-color:#FFE000;<%= w %>"></td>
<td <%= mp %> style="background-color:#FFFF00;<%= w %>"></td>
<td <%= mp %> style="background-color:#DFFF00;<%= w %>"></td>
<td <%= mp %> style="background-color:#BFFF00;<%= w %>"></td>
<td <%= mp %> style="background-color:#9FFF00;<%= w %>"></td>
<td <%= mp %> style="background-color:#7FFF00;<%= w %>"></td>
<td <%= mp %> style="background-color:#5FFF00;<%= w %>"></td>
<td <%= mp %> style="background-color:#3FFF00;<%= w %>"></td>
<td <%= mp %> style="background-color:#1FFF00;<%= w %>"></td>
<td <%= mp %> style="background-color:#00FF00;<%= w %>"></td>
<td <%= mp %> style="background-color:#00FF20;<%= w %>"></td>
<td <%= mp %> style="background-color:#00FF40;<%= w %>"></td>
<td <%= mp %> style="background-color:#00FF60;<%= w %>"></td>
<td <%= mp %> style="background-color:#00FF80;<%= w %>"></td>
<td <%= mp %> style="background-color:#00FFA0;<%= w %>"></td>
<td <%= mp %> style="background-color:#00FFC0;<%= w %>"></td>
<td <%= mp %> style="background-color:#00FFE0;<%= w %>"></td>
<td <%= mp %> style="background-color:#00FFFF;<%= w %>"></td>
<td <%= mp %> style="background-color:#00DFFF;<%= w %>"></td>
<td <%= mp %> style="background-color:#00BFFF;<%= w %>"></td>
<td <%= mp %> style="background-color:#009FFF;<%= w %>"></td>
<td <%= mp %> style="background-color:#007FFF;<%= w %>"></td>
<td <%= mp %> style="background-color:#005FFF;<%= w %>"></td>
<td <%= mp %> style="background-color:#003FFF;<%= w %>"></td>
<td <%= mp %> style="background-color:#001FFF;<%= w %>"></td>
<td <%= mp %> style="background-color:#0000FF;<%= w %>"></td>
<td <%= mp %> style="background-color:#2000FF;<%= w %>"></td>
<td <%= mp %> style="background-color:#4000FF;<%= w %>"></td>
<td <%= mp %> style="background-color:#6000FF;<%= w %>"></td>
<td <%= mp %> style="background-color:#8000FF;<%= w %>"></td>
<td <%= mp %> style="background-color:#A000FF;<%= w %>"></td>
<td <%= mp %> style="background-color:#C000FF;<%= w %>"></td>
<td <%= mp %> style="background-color:#E000FF;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF00FF;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF00DF;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF00BF;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF009F;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF007F;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF005F;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF003F;<%= w %>"></td>
<td <%= mp %> style="background-color:#FF001F;<%= w %>"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#F90000;"></td>
<td <%= mp %> style="background-color:#F91F00;"></td>
<td <%= mp %> style="background-color:#F93E00;"></td>
<td <%= mp %> style="background-color:#F95D00;"></td>
<td <%= mp %> style="background-color:#F97C00;"></td>
<td <%= mp %> style="background-color:#F99B00;"></td>
<td <%= mp %> style="background-color:#F9BA00;"></td>
<td <%= mp %> style="background-color:#F9D900;"></td>
<td <%= mp %> style="background-color:#F9F900;"></td>
<td <%= mp %> style="background-color:#DAF900;"></td>
<td <%= mp %> style="background-color:#BBF900;"></td>
<td <%= mp %> style="background-color:#9CF900;"></td>
<td <%= mp %> style="background-color:#7DF900;"></td>
<td <%= mp %> style="background-color:#5EF900;"></td>
<td <%= mp %> style="background-color:#3FF900;"></td>
<td <%= mp %> style="background-color:#20F900;"></td>
<td <%= mp %> style="background-color:#00F900;"></td>
<td <%= mp %> style="background-color:#00F91F;"></td>
<td <%= mp %> style="background-color:#00F93E;"></td>
<td <%= mp %> style="background-color:#00F95D;"></td>
<td <%= mp %> style="background-color:#00F97C;"></td>
<td <%= mp %> style="background-color:#00F99B;"></td>
<td <%= mp %> style="background-color:#00F9BA;"></td>
<td <%= mp %> style="background-color:#00F9D9;"></td>
<td <%= mp %> style="background-color:#00F9F9;"></td>
<td <%= mp %> style="background-color:#00DAF9;"></td>
<td <%= mp %> style="background-color:#00BBF9;"></td>
<td <%= mp %> style="background-color:#009CF9;"></td>
<td <%= mp %> style="background-color:#007DF9;"></td>
<td <%= mp %> style="background-color:#005EF9;"></td>
<td <%= mp %> style="background-color:#003FF9;"></td>
<td <%= mp %> style="background-color:#0020F9;"></td>
<td <%= mp %> style="background-color:#0000F9;"></td>
<td <%= mp %> style="background-color:#1F00F9;"></td>
<td <%= mp %> style="background-color:#3E00F9;"></td>
<td <%= mp %> style="background-color:#5D00F9;"></td>
<td <%= mp %> style="background-color:#7C00F9;"></td>
<td <%= mp %> style="background-color:#9B00F9;"></td>
<td <%= mp %> style="background-color:#BA00F9;"></td>
<td <%= mp %> style="background-color:#D900F9;"></td>
<td <%= mp %> style="background-color:#F900F9;"></td>
<td <%= mp %> style="background-color:#F900DA;"></td>
<td <%= mp %> style="background-color:#F900BB;"></td>
<td <%= mp %> style="background-color:#F9009C;"></td>
<td <%= mp %> style="background-color:#F9007D;"></td>
<td <%= mp %> style="background-color:#F9005E;"></td>
<td <%= mp %> style="background-color:#F9003F;"></td>
<td <%= mp %> style="background-color:#F90020;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#F30000;"></td>
<td <%= mp %> style="background-color:#F31E00;"></td>
<td <%= mp %> style="background-color:#F33C00;"></td>
<td <%= mp %> style="background-color:#F35A00;"></td>
<td <%= mp %> style="background-color:#F37800;"></td>
<td <%= mp %> style="background-color:#F39600;"></td>
<td <%= mp %> style="background-color:#F3B400;"></td>
<td <%= mp %> style="background-color:#F3D200;"></td>
<td <%= mp %> style="background-color:#F3F300;"></td>
<td <%= mp %> style="background-color:#D5F300;"></td>
<td <%= mp %> style="background-color:#B7F300;"></td>
<td <%= mp %> style="background-color:#99F300;"></td>
<td <%= mp %> style="background-color:#7BF300;"></td>
<td <%= mp %> style="background-color:#5DF300;"></td>
<td <%= mp %> style="background-color:#3FF300;"></td>
<td <%= mp %> style="background-color:#21F300;"></td>
<td <%= mp %> style="background-color:#00F300;"></td>
<td <%= mp %> style="background-color:#00F31E;"></td>
<td <%= mp %> style="background-color:#00F33C;"></td>
<td <%= mp %> style="background-color:#00F35A;"></td>
<td <%= mp %> style="background-color:#00F378;"></td>
<td <%= mp %> style="background-color:#00F396;"></td>
<td <%= mp %> style="background-color:#00F3B4;"></td>
<td <%= mp %> style="background-color:#00F3D2;"></td>
<td <%= mp %> style="background-color:#00F3F3;"></td>
<td <%= mp %> style="background-color:#00D5F3;"></td>
<td <%= mp %> style="background-color:#00B7F3;"></td>
<td <%= mp %> style="background-color:#0099F3;"></td>
<td <%= mp %> style="background-color:#007BF3;"></td>
<td <%= mp %> style="background-color:#005DF3;"></td>
<td <%= mp %> style="background-color:#003FF3;"></td>
<td <%= mp %> style="background-color:#0021F3;"></td>
<td <%= mp %> style="background-color:#0000F3;"></td>
<td <%= mp %> style="background-color:#1E00F3;"></td>
<td <%= mp %> style="background-color:#3C00F3;"></td>
<td <%= mp %> style="background-color:#5A00F3;"></td>
<td <%= mp %> style="background-color:#7800F3;"></td>
<td <%= mp %> style="background-color:#9600F3;"></td>
<td <%= mp %> style="background-color:#B400F3;"></td>
<td <%= mp %> style="background-color:#D200F3;"></td>
<td <%= mp %> style="background-color:#F300F3;"></td>
<td <%= mp %> style="background-color:#F300D5;"></td>
<td <%= mp %> style="background-color:#F300B7;"></td>
<td <%= mp %> style="background-color:#F30099;"></td>
<td <%= mp %> style="background-color:#F3007B;"></td>
<td <%= mp %> style="background-color:#F3005D;"></td>
<td <%= mp %> style="background-color:#F3003F;"></td>
<td <%= mp %> style="background-color:#F30021;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#ED0000;"></td>
<td <%= mp %> style="background-color:#ED1D00;"></td>
<td <%= mp %> style="background-color:#ED3A00;"></td>
<td <%= mp %> style="background-color:#ED5700;"></td>
<td <%= mp %> style="background-color:#ED7400;"></td>
<td <%= mp %> style="background-color:#ED9100;"></td>
<td <%= mp %> style="background-color:#EDAE00;"></td>
<td <%= mp %> style="background-color:#EDCB00;"></td>
<td <%= mp %> style="background-color:#EDED00;"></td>
<td <%= mp %> style="background-color:#D0ED00;"></td>
<td <%= mp %> style="background-color:#B3ED00;"></td>
<td <%= mp %> style="background-color:#96ED00;"></td>
<td <%= mp %> style="background-color:#79ED00;"></td>
<td <%= mp %> style="background-color:#5CED00;"></td>
<td <%= mp %> style="background-color:#3FED00;"></td>
<td <%= mp %> style="background-color:#22ED00;"></td>
<td <%= mp %> style="background-color:#00ED00;"></td>
<td <%= mp %> style="background-color:#00ED1D;"></td>
<td <%= mp %> style="background-color:#00ED3A;"></td>
<td <%= mp %> style="background-color:#00ED57;"></td>
<td <%= mp %> style="background-color:#00ED74;"></td>
<td <%= mp %> style="background-color:#00ED91;"></td>
<td <%= mp %> style="background-color:#00EDAE;"></td>
<td <%= mp %> style="background-color:#00EDCB;"></td>
<td <%= mp %> style="background-color:#00EDED;"></td>
<td <%= mp %> style="background-color:#00D0ED;"></td>
<td <%= mp %> style="background-color:#00B3ED;"></td>
<td <%= mp %> style="background-color:#0096ED;"></td>
<td <%= mp %> style="background-color:#0079ED;"></td>
<td <%= mp %> style="background-color:#005CED;"></td>
<td <%= mp %> style="background-color:#003FED;"></td>
<td <%= mp %> style="background-color:#0022ED;"></td>
<td <%= mp %> style="background-color:#0000ED;"></td>
<td <%= mp %> style="background-color:#1D00ED;"></td>
<td <%= mp %> style="background-color:#3A00ED;"></td>
<td <%= mp %> style="background-color:#5700ED;"></td>
<td <%= mp %> style="background-color:#7400ED;"></td>
<td <%= mp %> style="background-color:#9100ED;"></td>
<td <%= mp %> style="background-color:#AE00ED;"></td>
<td <%= mp %> style="background-color:#CB00ED;"></td>
<td <%= mp %> style="background-color:#ED00ED;"></td>
<td <%= mp %> style="background-color:#ED00D0;"></td>
<td <%= mp %> style="background-color:#ED00B3;"></td>
<td <%= mp %> style="background-color:#ED0096;"></td>
<td <%= mp %> style="background-color:#ED0079;"></td>
<td <%= mp %> style="background-color:#ED005C;"></td>
<td <%= mp %> style="background-color:#ED003F;"></td>
<td <%= mp %> style="background-color:#ED0022;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#E10000;"></td>
<td <%= mp %> style="background-color:#E71D00;"></td>
<td <%= mp %> style="background-color:#E73A00;"></td>
<td <%= mp %> style="background-color:#E75700;"></td>
<td <%= mp %> style="background-color:#E77400;"></td>
<td <%= mp %> style="background-color:#E79100;"></td>
<td <%= mp %> style="background-color:#E7AE00;"></td>
<td <%= mp %> style="background-color:#E7CB00;"></td>
<td <%= mp %> style="background-color:#E7E700;"></td>
<td <%= mp %> style="background-color:#CAE700;"></td>
<td <%= mp %> style="background-color:#ADE700;"></td>
<td <%= mp %> style="background-color:#ADE700;"></td>
<td <%= mp %> style="background-color:#90E700;"></td>
<td <%= mp %> style="background-color:#73E700;"></td>
<td <%= mp %> style="background-color:#56E700;"></td>
<td <%= mp %> style="background-color:#39E700;"></td>
<td <%= mp %> style="background-color:#1CE700;"></td>
<td <%= mp %> style="background-color:#00E700;"></td>
<td <%= mp %> style="background-color:#00E73A;"></td>
<td <%= mp %> style="background-color:#00E757;"></td>
<td <%= mp %> style="background-color:#00E774;"></td>
<td <%= mp %> style="background-color:#00E791;"></td>
<td <%= mp %> style="background-color:#00E7AE;"></td>
<td <%= mp %> style="background-color:#00E7CB;"></td>
<td <%= mp %> style="background-color:#00E7E7;"></td>
<td <%= mp %> style="background-color:#00CAE7;"></td>
<td <%= mp %> style="background-color:#00ADE7;"></td>
<td <%= mp %> style="background-color:#0090E7;"></td>
<td <%= mp %> style="background-color:#0073E7;"></td>
<td <%= mp %> style="background-color:#0056E7;"></td>
<td <%= mp %> style="background-color:#0039E7;"></td>
<td <%= mp %> style="background-color:#001CE7;"></td>
<td <%= mp %> style="background-color:#0000E7;"></td>
<td <%= mp %> style="background-color:#1D00E7;"></td>
<td <%= mp %> style="background-color:#3A00E7;"></td>
<td <%= mp %> style="background-color:#5700E7;"></td>
<td <%= mp %> style="background-color:#7400E7;"></td>
<td <%= mp %> style="background-color:#9100E7;"></td>
<td <%= mp %> style="background-color:#AE00E7;"></td>
<td <%= mp %> style="background-color:#CB00E7;"></td>
<td <%= mp %> style="background-color:#E700E7;"></td>
<td <%= mp %> style="background-color:#E700CA;"></td>
<td <%= mp %> style="background-color:#E700AD;"></td>
<td <%= mp %> style="background-color:#E70090;"></td>
<td <%= mp %> style="background-color:#E70073;"></td>
<td <%= mp %> style="background-color:#E70056;"></td>
<td <%= mp %> style="background-color:#E70039;"></td>
<td <%= mp %> style="background-color:#E7001C;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#DB0000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#D50000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#CF0000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#C90000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#C30000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#BD0000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#B70000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#B10000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#AB0000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#A50000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#9F0000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#990000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#930000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#8D0000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#870000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#810000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#7B0000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#750000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#6F0000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#690000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#630000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#5D0000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#570000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#510000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#4B0000;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
<td <%= mp %> style="background-color:;"></td>
</tr>

<tr style="<%= h %>">
<td <%= mp %> style="background-color:#450000;"></td>
<td <%= mp %> style="background-color:#450800;"></td>
<td <%= mp %> style="background-color:#451000;"></td>
<td <%= mp %> style="background-color:#451800;"></td>
<td <%= mp %> style="background-color:#452000;"></td>
<td <%= mp %> style="background-color:#452800;"></td>
<td <%= mp %> style="background-color:#453000;"></td>
<td <%= mp %> style="background-color:#453800;"></td>
<td <%= mp %> style="background-color:#454500;"></td>
<td <%= mp %> style="background-color:#3D4500;"></td>
<td <%= mp %> style="background-color:#354500;"></td>
<td <%= mp %> style="background-color:#2D4500;"></td>
<td <%= mp %> style="background-color:#254500;"></td>
<td <%= mp %> style="background-color:#1D4500;"></td>
<td <%= mp %> style="background-color:#154500;"></td>
<td <%= mp %> style="background-color:#0D4500;"></td>
<td <%= mp %> style="background-color:#004500;"></td>
<td <%= mp %> style="background-color:#004508;"></td>
<td <%= mp %> style="background-color:#004510;"></td>
<td <%= mp %> style="background-color:#004518;"></td>
<td <%= mp %> style="background-color:#004520;"></td>
<td <%= mp %> style="background-color:#004528;"></td>
<td <%= mp %> style="background-color:#004530;"></td>
<td <%= mp %> style="background-color:#004538;"></td>
<td <%= mp %> style="background-color:#004545;"></td>
<td <%= mp %> style="background-color:#003D45;"></td>
<td <%= mp %> style="background-color:#003545;"></td>
<td <%= mp %> style="background-color:#002D45;"></td>
<td <%= mp %> style="background-color:#002545;"></td>
<td <%= mp %> style="background-color:#001D45;"></td>
<td <%= mp %> style="background-color:#001545;"></td>
<td <%= mp %> style="background-color:#000D45;"></td>
<td <%= mp %> style="background-color:#000045;"></td>
<td <%= mp %> style="background-color:#080045;"></td>
<td <%= mp %> style="background-color:#100045;"></td>
<td <%= mp %> style="background-color:#180045;"></td>
<td <%= mp %> style="background-color:#200045;"></td>
<td <%= mp %> style="background-color:#280045;"></td>
<td <%= mp %> style="background-color:#300045;"></td>
<td <%= mp %> style="background-color:#380045;"></td>
<td <%= mp %> style="background-color:#450045;"></td>
<td <%= mp %> style="background-color:#45003D;"></td>
<td <%= mp %> style="background-color:#450035;"></td>
<td <%= mp %> style="background-color:#45002D;"></td>
<td <%= mp %> style="background-color:#450025;"></td>
<td <%= mp %> style="background-color:#45001D;"></td>
<td <%= mp %> style="background-color:#450015;"></td>
<td <%= mp %> style="background-color:#45000D;"></td>
</tr>

</table>

</td>
<td width="10"></td>
<td width="70">

<table height="190" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="70" valign="top">

<font face="arial" size="1">
Click on color to select, then "Apply" to use.<br>
</font>

<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td style="height: 6px; width: 60px;"></td>
</tr>
<tr>
<td id=s style="height: 20px; width: 60px; font-family: verdana; font-size: 8pt; color: #000000; border: 1px solid black;">&nbsp;</td>
</tr>
<tr>
<td style="height: 6px; width: 60px;"></td>
</tr>
</table>

<input onClick="sendColor()" type="button" value="Apply" style="font-family: verdana; font-size: 7.5pt; color: #000000; width: 60px;">

</td>
</tr>
<tr>
<td valign="bottom">

<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td id=c style="height: 60px; width: 60px; font-family: verdana; font-size: 8pt; color: #000000; border: 1px solid black;">&nbsp;</td>
</tr>
<tr>
<td valign="bottom" id=h style="height: 14px; font-family: verdana; font-size: 7.5pt; color: #000000; text-align: center;">#FFFFFF</td>
</tr>
</table>

</td>
</tr>
</table>

</td>
</tr>
</table>

</td>
</tr>
</table>

</body>
</html>
