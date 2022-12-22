<%
'========================================
'= Desenvolvido por Armando Miani Neto  =
'=     webestudos@webestudos.com.br     =
'=  http://www.webestudos.com.br/sites  =
'========================================

Dim StrApelido, i, Cont

sl01_StrApelido = Server.HTMLEncode(Request("Apelido"))
Session("careta") = Request.Querystring("careta")
Session("cor") = Request("optcor")
	If Session("careta") = "nao" Then
		strCareta = ""
	else
		strCareta = "<img src=caretas/" & Session("careta") & ".gif>"
	end if

Select Case Session("cor")
	   Case "Azul"
			Session("cor") = "#0000FF"
	   Case "Vermelho"
			Session("cor") = "#FF0000"
	   Case "Preto"
			Session("cor") = "#000000"
	   Case "Verde"
			Session("cor") = "#339933"	
	   Case "Roxo"
			Session("cor") = "#9900CC"
       Case "Laranja"
			Session("cor") = "#FF9900"	
End Select

Application.Lock 

sl01_Usuarios = Application("sl01_Usuarios")
sl01_Mensagens = Application("sl01_Mensagens")
sl01_ParaUsuario = Application("sl01_ParaUsuario")
sl01_Exclusiva = Application("sl01_Exclusiva")
sl01_DeUsuario = Application("sl01_DeUsuario")

If VarType(Session("sl01_Usuario")) = 0 Then 

For i=0 To 19
   If sl01_Usuarios(i) = sl01_StrApelido Then Response.Redirect "descarregar.asp"
Next

For i=1 To 19
   If Len(sl01_Usuarios(i)) < 1 Then 
      sl01_Usuarios(i) = sl01_StrApelido
      Session("sl01_Usuario") = i
      Exit For
   End if
Next

   sl01_Usuarios(0) = "Todos"

For i=18 To 0 Step -1
    sl01_Mensagens(i+1) = sl01_Mensagens(i) 
	sl01_Exclusiva(i+1) = sl01_Exclusiva(i)
	sl01_ParaUsuario(i+1) = sl01_ParaUsuario(i)
	sl01_DeUsuario(i+1) = sl01_DeUsuario(i)
Next

sl01_StrNovaMensagem = "<font size=1 face=verdana>("+formatdatetime(now,vblongtime)+")</font> " & strCareta & " <B><font face=verdana size=2 color=" & Session("cor") & "> " & sl01_Usuarios(Session("sl01_Usuario")) & ": </b></font><font face=verdana size=1> entra na sala...</font>"
sl01_StrNovaMensagem = sl01_StrNovaMensagem 

sl01_Mensagens(0) = sl01_StrNovaMensagem
sl01_ParaUsuario(0) = 0
sl01_DeUsuario(0) = Session("sl01_Usuario")
sl01_Exclusiva(0) = 0

Application("sl01_Mensagens") = sl01_Mensagens
Application("sl01_Exclusiva") = sl01_Exclusiva
Application("sl01_ParaUsuario") = sl01_ParaUsuario
Application("sl01_DeUsuario") = sl01_DeUsuario
Application("sl01_Usuarios") = sl01_Usuarios

End If

Application.UnLock 

%>

<HTML>
<HEAD>
<TITLE><%=Application("titulo")%></TITLE>
</HEAD>
<FRAMESET ROWS="83,*,75,1" FRAMESPACING=0 cols="*"> 
  <FRAME NAME="Titulo" SRC="Titulo.asp" SCROLLING=no NORESIZE MARGINHEIGHT=15 MARGINWIDTH=50>
  <FRAME NAME="Mensagens" SRC="Mensagens.asp"  FRAMESPACING=0 MARGINHEIGHT=5 MARGINWIDTH=20>
  <FRAME NAME="Menu" SCROLLING=no NORESIZE MARGINHEIGHT=5 MARGINWIDTH=20 src="UntitledFrame-1">
  <FRAME NAME="Recarga" SCROLLING=no NORESIZE src="UntitledFrame-2">
</FRAMESET>
<noframes></noframes>
</HTML>
