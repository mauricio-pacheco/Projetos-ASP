<%
menuPage = Request.ServerVariables("Script_Name")
menuPage = Mid(menuPage,InstrRev(menuPage,"/") + 1)
%>
<img src="images/spacer.gif" width="1" height="8"><br>
<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="1" nowrap>&nbsp;</td>
    <td width="477"> 
      <% If History AND menuPage = "igallery.asp" Then %>
      <% End If %>    </td>
  </tr>
</table>
<p align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" class="textsm3">Desenvolvimento:</font><font class="textsm3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;<a class="linksm3" href="http://www.casadaweb.net/curriculum.asp" target="_blank">Maurício Pacheco</a></font>&nbsp;&nbsp;</font></p>
