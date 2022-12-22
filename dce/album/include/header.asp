<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td height="75">

<table height="75" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td>
<a class="linksm" href="../default.asp"><img src="titulo.jpg" width="550" height="103" border="0" /></a><br>
</td>
</tr>
</table>

</td>
</tr>
<tr>
<td height="24" bgcolor="#ffffff" colspan="3">

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
          <td> <font style="color: <%= DateColor %>;" class="textsm"> &nbsp;&nbsp;<br>
</font>
</td>
<td style="padding-right: 6px;" align="right">

<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>
<a href="authorize.asp?l=O" onMouseOver="document.sbtnoff.src='images/sm-logoff2.gif'" onMouseOut="document.sbtnoff.src='images/sm-logoff1.gif'"><img name="sbtnoff" src="images/sm-logoff1.gif" width="14" height="14" border="0" alt="<%= IGhead_lgoff %>"></a><br>
<% Else %>
<a href="login.asp?n=<%= Request.ServerVariables("SCRIPT_NAME") %>&d=<%= URLSpace(Request("d")) %>" onMouseOver="document.sbtnon.src='images/sm-logon2.gif'" onMouseOut="document.sbtnon.src='images/sm-logon1.gif'"><img name="sbtnon" src="images/sm-logon1.gif" width="14" height="14" border="0" alt="<%= IGhead_lgon %>"></a><br>
<% End If %>

</td>
</tr>
</table>

</td>
</tr>
</table>