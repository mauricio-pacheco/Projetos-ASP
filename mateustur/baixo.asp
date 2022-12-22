 <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR height=1>
                <TD class=FondoSuperiorBG2 width="98%"><div align="center"><span style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">Copyright &copy; 2007 - Mateus Tur - Todos os direitos reservados - Número de Visitas:                  <%
set file = Server.CreateObject("Scripting.FileSystemObject")
path = Server.MapPath("contar.txt")
set infile = file.OpenTextFile( path ) 
visitor = infile.ReadLine
d = infile.ReadLine
fundo = infile.ReadLine
visitor = visitor + 1
infile.close
%>
<%Response.Write(" ")%>
<% =visitor %>
<%Response.Write(" ")%> - 
                Desenvolvimento:</span> <a href="http://www.casadaweb.net" target=_blank class=MenuLateralT2LINKm >Casa da Web</a>&nbsp;&nbsp;</div></TD>
              </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></BODY></HTML>
