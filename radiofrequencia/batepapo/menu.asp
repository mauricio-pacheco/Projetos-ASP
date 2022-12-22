<!--#include file="falas.asp"-->
<%
Application.Lock	


sl01_StrMensagem = Request.Form("Mensagem")
strImagem = Request.Form("imagem")
sl01_StrMensagem = MostrarImagem(sl01_StrMensagem)
IntAcao = Request.Form("Acao")
IntUsuario = Request.Form("Usuario")
IntSigilo = Request.Form("Sigilo")
StrBotaoX = Request.Form("Botao.X")
StrBotaoY = Request.Form("Botao.Y")
sl01_Mensagens = Application("sl01_Mensagens")
sl01_ParaUsuario = Application("sl01_ParaUsuario")
sl01_Exclusiva = Application("sl01_Exclusiva")
sl01_DeUsuario = Application("sl01_DeUsuario")
sl01_Usuarios = Application("sl01_Usuarios")
sl01_StrUsuario = sl01_Usuarios(Session("sl01_Usuario"))
lenStrUsuario = len(sl01_StrUsuario)
lenStrUsuario = lenStrUsuario * 3

If Session("careta") = "nao" Then
	strCareta = ""
else
	strCareta = "<img src=caretas/" & Session("careta") & ".gif>"
end if

If Acao(intAcao) = "grita com" then
	strAG = "<b><font size=3>"
	strFG = "</font></b>"
else
	strAG = ""
	strFG = ""
end if

If StrBotaoX <> 0 and StrBotaoY <> 0 Then
	StrSair = "top.location.href =" & Chr(34) & "descarregar.asp" & Chr(34)
End if

If Int(IntSigilo) =  1 then StrSigilo = " reservadamente"

If sl01_StrMensagem <> "" Then
	for i=18 to 0 step -1
		sl01_Mensagens(i+1)= sl01_Mensagens(i)
		sl01_Exclusiva(i+1)= sl01_Exclusiva(i)
		sl01_ParaUsuario(i+1) = sl01_ParaUsuario(i)
		sl01_DeUsuario(i+1) = sl01_DeUsuario(i)
	next
	sl01_Mensagens(0) = sl01_StrNovaMensagem & "</font>"
	sl01_ParaUsuario(0) = IntUsuario
	sl01_DeUsuario(0) = Session("sl01_Usuario")
	sl01_Exclusiva(0) = Int(IntSigilo)
	If sl01_Usuarios(IntUsuario) = "" Then IntUsuario = 0
	If strImagem = "vazio" then 'sem imagem
		If Int(intSigilo) = 1 then 'reservado sem imagem
			sl01_StrNovaMensagem = "<table width=100% border=0 cellspacing=0 cellpadding=0 bgcolor=" & Application("tarja_r") & "><tr><td><font size=1 face=Verdana>("+formatdatetime(now,vblongtime)+") </font>" & strCareta & "<B><font face=verdana size=2 color=" & Session("cor") & ">" & sl01_Usuarios(Session("sl01_Usuario")) & " </font></b><font face=verdana size=2>" & Acao(IntAcao) & "<b> " & sl01_Usuarios(IntUsuario) & "</font></B><font face=verdana size=1>" & StrSigilo & " - "  & strAG
		    sl01_StrNovaMensagem = sl01_StrNovaMensagem & sl01_StrMensagem
		    sl01_StrNovaMensagem = sl01_StrNovaMensagem & strFG & "</td></tr></table>"
		else 'aberto sem imagem
			sl01_StrNovaMensagem = "<font size=1 face=Verdana>("+formatdatetime(now,vblongtime)+") </font> " & strCareta & " <B><font face=verdana size=2 color=" & Session("cor") & ">" & sl01_Usuarios(Session("sl01_Usuario")) & " </font></b><font face=verdana size=2>" & Acao(IntAcao) & "<b> " & sl01_Usuarios(IntUsuario) & "</font></B><font face=verdana size=1>" & StrSigilo & " - " & strAG
			sl01_StrNovaMensagem = sl01_StrNovaMensagem & sl01_StrMensagem & strFG
		end if
	  sl01_Mensagens(0) = sl01_StrNovaMensagem & "</font>"
      sl01_ParaUsuario(0) = IntUsuario
      sl01_DeUsuario(0) = Session("sl01_Usuario")
      sl01_Exclusiva(0) = Int(IntSigilo)
 else 'com imagem

	If Int(intSigilo) = 1 then 'reservado com imagem
			sl01_StrNovaMensagem = "<table width=100% border=0 cellspacing=0 cellpadding=0 bgcolor=" & Application("tarja_r") & "><tr><td><font size=1 face=Verdana>("+formatdatetime(now,vblongtime)+") </font> " & strCareta & " <B><font face=verdana size=2 color=" & Session("cor") & ">" & sl01_Usuarios(Session("sl01_Usuario")) & " </font></b><font face=verdana size=2>" & Acao(IntAcao) & "<b> " & sl01_Usuarios(IntUsuario) & "</font></B><font face=verdana size=1>" & StrSigilo & " - " & strAG & "<img src=" & strImagem & ">"
			sl01_StrNovaMensagem = sl01_StrNovaMensagem & sl01_StrMensagem
			sl01_StrNovaMensagem = sl01_StrNovaMensagem & strFG & "</td></tr></table>"
	else 'aberto com imagem
			sl01_StrNovaMensagem = "<font size=1 face=Verdana>("+formatdatetime(now,vblongtime)+") </font> " & strCareta & "<B><font face=verdana size=2 color=" & Session("cor") & ">" & sl01_Usuarios(Session("sl01_Usuario")) & " </font></b><font face=verdana size=2>" & Acao(IntAcao) & "<b> " & sl01_Usuarios(IntUsuario) & "</font></B><font face=verdana size=1>" & StrSigilo & " - " & strAG &  " <img src=" & strImagem & ">"
			sl01_StrNovaMensagem = sl01_StrNovaMensagem & sl01_StrMensagem & strAG
	end if
      sl01_Mensagens(0) = sl01_StrNovaMensagem & "</font>"
      sl01_ParaUsuario(0) = IntUsuario
      sl01_DeUsuario(0) = Session("sl01_Usuario")
      sl01_Exclusiva(0) = Int(IntSigilo)
	End if
	End if

StrQuebra = "<BR>&nbsp;<BR>"

For i=0 To 19
   If sl01_Mensagens(i) = Session("sl01_Ultima") Then Exit For
   If sl01_Exclusiva(i) < 1 Or Int(sl01_DeUsuario(i)) = Int(Session("sl01_Usuario")) or Int(sl01_ParaUsuario(i)) = Int(Session("sl01_Usuario")) or sl01_ParaUsuario(i) = 0 then
      StrNovas = StrNovas & StrQuebra & sl01_Mensagens(i)
   End if
Next

Session("sl01_Ultima") = sl01_Mensagens(0)

sl01_Usuarios(0) = "Todos"

Application("sl01_Mensagens") = sl01_Mensagens
Application("sl01_Exclusiva") = sl01_Exclusiva
Application("sl01_ParaUsuario") = sl01_ParaUsuario
Application("sl01_DeUsuario") = sl01_DeUsuario
Application("sl01_Usuarios") = sl01_Usuarios

For i=0 to 19
   If Len(sl01_Usuarios(i)) > 0 And Int(Session("sl01_Usuario")) <> i Then
      StrLista = StrLista & "<OPTION VALUE=" & i
      If Int(IntUsuario) = Int(i) Then StrLista = StrLista & " SELECTED"
      StrLista = StrLista & ">" & sl01_Usuarios(i) & Chr(13)
   End If
Next

Application.Unlock

Function MostrarImagem(sl01_StrMensagem)

Dim IntInicio, IntFim, StrSaida

IntInicio = InStr(1, sl01_StrMensagem, "[")
If IntInicio < 1 Then
   MostrarImagem = sl01_StrMensagem
   Exit Function
End if

IntFim = InStr(IntInicio , sl01_StrMensagem, "]")
If IntFim < 1 Then
   MostrarImagem = sl01_StrMensagem
   Exit Function
End if

'inicio mostrar imagem
StrSaida = Left(sl01_StrMensagem, IntInicio - 1) & "<br>"
StrSaida = StrSaida & "<IMG SRC='" & Mid(sl01_StrMensagem, IntInicio + 1, IntFim  - IntInicio - 1) & "'>"
StrSaida = StrSaida & Right(sl01_StrMensagem, Len(sl01_StrMensagem) - IntFim) & "<br>"
'fim mostrar imagem
MostrarImagem = StrSaida

End Function

Function LimparVariavel(sl01_StrMensagem)
Dim IntCont
Dim StrLetra
Dim StrSaida

For IntCont = 1 To Len(sl01_StrMensagem)
   StrLetra = Mid(sl01_StrMensagem, IntCont, 1)
   If Asc(StrLetra) = 34 Then
      StrLetra = "&#34;"
   ElseIf Asc(StrLetra) = 13 or Asc(StrLetra) = 10 Then
      StrLetra = " "
   End if
   StrSaida = StrSaida & StrLetra
Next
LimparVariavel = StrSaida
End Function

%>

<HTML>
<HEAD>

<SCRIPT LANGUAGE="VBScript">
on error resume next

If top.location.href = self.location.href then top.location.href = "entrar.asp"

<% = StrSair %>
parent.mensagens.escrever("<% = StrNovas %>")

</SCRIPT>
<script language="javascript">
<!--

function abre(theURL,winName,features) { 
	window.open(theURL,winName,features);
}

function imprimir() {
	parent(1).focus()
	parent(1).print()
}
-->
</script>
<script language="vbscript">
function imagem()
	img = inputbox("Coloque o caminho da imagem aqui:" & Chr(10) & Chr(10) & "Exemplo: http://www.webestudos.com.br/infologo.jpg","Coloque o caminho da imagem aqui:")
	if img <> "" then
		img = "[" & img & "]"
		parent(2).mensagens.mensagem.value = img
		parent(2).mensagens.submit
	end if

end function

</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></HEAD>
<BODY bgcolor="#FFFFFF" text="#000000" link="#00FF00" vlink="#00FF00" alink="#00FF00">
<form name=Mensagens action="menu.asp" method=post>
  <table cellspacing="2" cellpadding="0" width="784" border="0" valign="top">
    <tbody>
      <tr> 
        <td rowspan="2" valign="top" width="<%=lenStrUsuario%>"> <center>
            <font color="#000000" size="1" face="arial"> <font size=3><b> 
            <%Response.Write "<font face=arial size=2 color=#000000><b>" & sl01_StrUsuario & "</b></font>"%>&nbsp;&nbsp;
            </b></font></font> <font color="#000000" size="1" face="arial"> <%=strCareta%> &nbsp;&nbsp;
            </font></center></td>
        <td valign="top" width="127" height="23"> <font color="#000000"> 
          <select name="Acao" size=1 style="border-color: #000000; border-width: 1; border-style: solid; background-color:#ffffff; font-size: 10; font-family: verdana;" >
            <%
For i = 1 To 19
   Response.Write "<OPTION VALUE=" & i
   If i = Int(IntAcao) Then Response.Write " SELECTED"
   Response.Write ">" & Acao(i) & Chr(13)
Next
%>
          </select>
          </font></td>
        <td valign="top" width="320" height="23"> <font color="#000000"><select name="Usuario" style="width=100" size=1 style="border-color: #000000; border-width: 1; border-style: solid; background-color:#ffffff; font-size: 10; font-family: verdana;" > 
          <% = StrLista %></select>
          <font face="arial" size="1"> 
          <input type="checkbox" value="1" name="sigilo" <% If Int(IntSigilo) = 1 Then Response.Write "CHECKED" %>
>
          <font face="Arial">Falar Reservadamente<font face="arial" size="1"><font face="arial" size="1"><font size=3><b> 
          </b><font face="arial" size="1"><font face="arial" size="1"><font face="arial" size="1"><b> 
          <input type=HIDDEN name="Inicio" value=1>
          </b></font></font></font></font></font></font></font></font></font> 
        </td>
        <td valign="top" width="156" height="23"> <div align="center"><b> </b></div></td>
      </tr>
      <tr> 
        <td colspan="2" height="2"> <font color="#000000"> 
          <select name="imagem" size="1" style="border-color: #000000; border-width: 1; border-style: solid; background-color:#ffffff; font-size: 10; font-family: verdana;" >
            <option value="vazio" selected>enviar imagem:</option>
            <option value="exp/zangado.gif">Zangado</option>
            <option value="exp/sorriso.gif">Sorriso</option>
            <option value="exp/boiando.gif">Boiando</option>
            <option value="exp/proibidofumar.gif">Proibido Fumar</option>
            <option value="exp/tempo.gif">Tempo</option>
            <option value="exp/anjo.gif">Anjo</option>
            <option value="exp/toplayse.gif">Strip Tease</option>
            <option value="exp/apaixonado.gif">Apaixonado</option>
            <option value="exp/flutuando.gif">Flutuando</option>
            <option value="exp/bebida.gif">Bebida</option>
            <option value="exp/perigo.gif">Perigo</option>
            <option value="exp/feliz.gif">Feliz</option>
            <option value="exp/joia.gif">Jóia</option>
            <option value="exp/mostralingua.gif">Mostrar Língua</option>
            <option value="exp/muitofeliz.gif">Muito Feliz</option>
            <option value="exp/surpreso.gif">Surpreso</option>
            <option value="exp/zangado2.gif">Zangado 2</option>
          </select>
          &nbsp; <font size="2" face="Arial, Helvetica, sans-serif">Mensagem:</font></font> 
          <font color="#000000"> 
          <input maxlength="500" size="50" name="mensagem" style="border-color: #000000; border-width: 1; border-style: solid; background-color:#ffffff; font-size: 12; font-family: verdana;" >
          &nbsp; 
          <input type="Submit" Value="OK" border="0" name="imageField" src="ok.gif">
          </font> </td>
        <td width="156" height="2"> <div align="center"> 
            <input type="image" border="0" name="Botao" src="fechar.gif" width="99" height="27">
          </div></td>
      </tr>
    </tbody>
  </table>
</form>
<br>
</BODY>
</HTML>