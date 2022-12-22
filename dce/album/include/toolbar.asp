<table cellspacing="0" cellpadding="0" border="0">
<tr>
<% If Session("userLevel") = "99" OR Session("userLevel") = "98" Then %>
<td width="22"><a href="editimage.asp<%= QS %>"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/sm-pencil1.gif" width="23" height="22" border="0" alt="<%= IGt_editimage %>"></a></td>
<td width="8" align="center"><img src="images/separator.gif" width="2" height="24" border="0" border=0 alt=""></td>
<% End If %>
<td width="22"><a href="javascript:void('0');" onClick="imagePopup('viewphoto.asp?i=<%= URLSpace(Replace(f1.Name,"tn-","")) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>');" title="Actual Size"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/actual-size.gif" width="23" height="22" border="0" alt="<%= IGt_viewimage %>"></a></td>
<% If (ie) Then %>
<td width="8" align="center"><img src="images/separator.gif" width="2" height="24" border="0" border=0 alt=""></td>
<td width="22"><a href="javascript:void(0);" onclick="SetRotation(mydiv<%= recordscount %>,'-90','1','0','0','1');"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/90CC.gif" width="23" height="22" border="0" alt="<%= IGt_rotateimagel %>"></a></td>
<td width="2"><img src="images/spacer.gif" width="2" height="24" border="0" border=0 alt=""></td>
<td width="22"><a href="javascript:void(0);" onclick="SetRotation(mydiv<%= recordscount %>,'0','1','0','0','1');"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/90.gif" width="23" height="22" border="0" alt="<%= IGt_centerimage %>"></a></td>
<td width="2"><img src="images/spacer.gif" width="2" height="24" border="0" border=0 alt=""></td>
<td width="22"><a href="javascript:void(0);" onclick="SetRotation(mydiv<%= recordscount %>,'90','1','0','0','1');"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/90C.gif" width="23" height="22" border="0" alt="<%= IGt_rotateimager %>"></a></td>
<% End If %>
<td width="8" align="center"><img src="images/separator.gif" width="2" height="24" border="0" border=0 alt=""></td>
<td width="22"><a href="streamfile.asp?i=<%= URLSpace(Replace(f1.Name,"tn-","")) %>&f=<%= URLSpace(Replace(BaseDir,"'","\'")) %>"><img onmouseup="button_up(this)" class="toolbar" onmousedown="button_down(this)" onmouseover="button_over(this)" onmouseout="button_out(this)" src="images/gallery/download.gif" width="23" height="22" border="0" alt="<%= IGt_dwnimage %>"></a></td>
</tr>
</table>