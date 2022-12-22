<HTML><HEAD><TITLE>Móveis Bianquini</TITLE>
<META 
content="Bianquini, Móveis, Camas, Cadeiras, Madeira, Móveis Bianquini" 
name=description>
<META 
content="Bianquini, Móveis, Camas, Cadeiras, Madeira, Móveis Bianquini" name=keywords>
<META 
content="Móveis Bianquini" 
name=classification>
<META content=ALL name=robots>
<META content=ALL name=GOOGLEBOT>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="Bianquini" name=author>
<META content="Copyright Móveis Bianquini" name=copyright>
<META content=English name=language>
<META content="3 dias" name=revisit-after>
<META content=general name=rating>
<META content=global name=distribution><LINK href="index_arquivos/hdnew.css" 
type=text/css rel=stylesheet>
<SCRIPT src="carrega.js"></SCRIPT>
<META content="MSHTML 6.00.2900.2873" name=GENERATOR><style type="text/css">
<!--
body {
	background-image: url(bg.gif);
	background-color: #0056A2;
}
.home_titulo7000 {
	FONT-SIZE: 10px; COLOR: white; TEXT-DECORATION: none
}
.home_titulo7000:hover {
	COLOR: #ffffff; TEXT-DECORATION: underline
}
.style2 {
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #FFFFFF;
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
     carregaFlash('index.swf','980','520'); // Depois só descrever o caminho, largura, altura do SWF.
    </SCRIPT>
      </div></td>
    </tr>
	  <tr>
      <td>
<div align="center">
  <table width="100%" border="0">
    <tr>
      <td><div align="left"><span class="style2">Melhor Visualiza&ccedil;&atilde;o 1024 x 768 </span></div></td>
      <td><div align="center"><a class=home_titulo7000 href="cadastro/cliente.asp" target=_blank><img border="0" src="iconezao.gif" width="16" height="16"></a></div></td>
      <td class="style2"><a class=home_titulo7000 href="cadastro/cliente.asp" target=_blank>&Aacute;rea de Representantes</a></td>
      <td><div align="center"><span class="style2">Número de Visitas: 
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
      </div></td> <td><div align="right"><span class="style2">Desenvolvimento: W3 Propaganda </span></div></td>
    </tr>
  </table>
</div></td>
    </tr>
</table>
  
</DIV>
</BODY></HTML>
