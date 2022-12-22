
<script language="Javascript"> 
<!--
function OpenTips(url,pwidth,pheight) {
var leftPos = (screen.availWidth-pwidth) / 2
var topPos = (screen.availHeight-pheight) / 2 
var vpop = window.open(url,'opentips','width=' + pwidth + ',height=' + pheight + ',scrollbars=yes,resizable=no,status=no,toolbar=no,location=no,top=' + topPos + ',left=' + leftPos);
if (window.focus) vpop.window.focus();
}
//-->
</script>
<div align="center">
<div style="padding-top:5px; padding-left:5px; padding-bottom:2px; padding-right:5px; border:1px solid #cccccc; width:180px; background-color:#fbfbfb; filter:alpha(opacity=60);">
<div style="padding-bottom:5px; width:180px;">
<table style="font-family:Verdana; font-size:10px; font-weight:bold; text-align:left;" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="16"><img src="images/sm-mag.gif" width="14" height="14" border="0"></td>
<td>&nbsp;<u><%= IGsform_sg %></u></td>
<td align="right"><img src="images/stomp-pad.gif" width=27 height=11 border=0 alt=""></td>
</tr>
</table>
</div>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<form name="searchform" action="search.asp" method="post">
<tr>
<td><input class="input" style="width: 150px;" name="myquery" value="<%= searchquery %>" size="23"></td>
<td width="28" align="right" nowrap><input class="textsm" style="width: 25px;" type="submit" value="<%= IGsform_but %>"></td>
</tr>
<td colspan="2" align="right">
<table style="font-family:Verdana; font-size:10px; font-weight:bold;" cellspacing="0" cellpadding="0" border="0">
<tr>
<td><%= IGsform_xm %></td>
<td><input type="checkbox" name="searchtype" value="exact"></td>
</tr>
</table>
</td>
</tr>
</form>
</table>
</div>
</div>


