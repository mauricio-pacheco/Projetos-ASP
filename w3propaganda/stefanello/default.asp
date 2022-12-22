<HTML><HEAD><TITLE>Latic&iacute;nio Stefanello</TITLE>
<META 
content="Stefanello, Laticínios, Laticínio, Queijos, Manteigas, Ricotas, Leite, Integral, Lactea, Laticício Stefanello" 
name=description>
<META 
content="Stefanello, Laticínios, Laticínio, Queijos, Manteigas, Ricotas, Leite, Integral, Lactea, Laticício Stefanello, Rodeio Bonito" name=keywords>
<META 
content="Laticínio Stefanello" 
name=classification>
<META content=ALL name=robots>
<META content=ALL name=GOOGLEBOT>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="Stefanello" name=author>
<META content="Copyright Laticínio Stefanello" name=copyright>
<META content=English name=language>
<META content="3 dias" name=revisit-after>
<META content=general name=rating>
<META content=global name=distribution><LINK href="index_arquivos/hdnew.css" 
type=text/css rel=stylesheet>

<SCRIPT src="carrega.js"></SCRIPT>
<META content="MSHTML 6.00.2900.2873" name=GENERATOR><style type="text/css">
<!--
body {
	background-image: url(fundelho.gif);
	background-color: #AFD220;
}
.style4 {font-size: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000; }

A:link {
	COLOR: #000000; TEXT-DECORATION: none
}
A:visited {
	COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #000000; TEXT-DECORATION: underline
}
A:active {
	COLOR: #000000; TEXT-DECORATION: none
}
-->
</style></HEAD>
<BODY bgProperties=fixed topmargin="0" leftMargin=0 topMargin=0 
marginheight="0" marginwidth="0">
<DIV align=center><SPAN class=txtboldwhitel><I>&nbsp;</I> </SPAN> 
  <table width="760" border="0" align="center">
    <tr>
      <td>
<div align="center">
          <SCRIPT language=javascript>
     carregaFlash('index.swf','990','545'); // Depois só descrever o caminho, largura, altura do SWF.
    </SCRIPT>
      </div></td>
    </tr><tr>
      <td>
<div align="center">
  <table width="100%" border="0">
    <tr>
      <td><span class="style4">Melhor Visualiza&ccedil;&atilde;o 1024 x 768 </span></td>
      <td><div align="center"><span class="style4">Número de Visitas: 
        | <%
Dim objFSO, objCountFile  
Dim strCountFileName      
Dim iCount                
Dim bUseImages            
Dim I                     


bUseImages = CBool(Request.QueryString("images"))

strCountFileName = Server.MapPath(Request.ServerVariables("SCRIPT_NAME") & ".cnt")

Set objFSO = Server.CreateObject("Scripting.FileSystemObject")

Set objCountFile = objFSO.OpenTextFile(strCountFileName, 1, True)
If Not objCountFile.AtEndOfStream Then
	iCount = CLng(objCountFile.ReadAll)
Else
	iCount = 0
End If

objCountFile.Close
Set objCountFile = Nothing


iCount = iCount + 1


Set objCountFile = objFSO.CreateTextFile(strCountFileName, True)

objCountFile.Write iCount

objCountFile.Close
Set objCountFile = Nothing


Set objFSO = Nothing


If bUseImages Then
	For I = 1 to Len(iCount)
		Response.Write "<img src=""./images/digit_"
		Response.Write Mid(iCount, I, 1)
		Response.Write ".gif"" alt="""
		Response.Write Mid(iCount, I, 1)
		Response.Write """ width=""20"" height=""27"" />"
	Next 
Else
	Response.Write iCount
End If
%> |</span>
      </div></td>
      <td><div align="right"><span class="style4">Desenvolvimento: <a href="http://www.w3propaganda.com">W3 Propaganda</a> </span></div></td>
    </tr>
  </table>
</div></td>
    </tr>
</table>
  
</DIV>
</BODY></HTML>
