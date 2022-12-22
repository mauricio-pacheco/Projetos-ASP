<%
Dim StrQuebra, i

Application.Lock 

sl01_Mensagens = Application("sl01_Mensagens")
sl01_Exclusiva = Application("sl01_Exclusiva")
sl01_ParaUsuario = Application("sl01_ParaUsuario")
sl01_DeUsuario = Application("sl01_DeUsuario")
sl01_Usuarios = Application("sl01_Usuarios")

StrQuebra = "<BR>&nbsp;<BR>"

For i=0 To 19

   If sl01_Mensagens(i) = Session("sl01_Ultima") Then Exit For
   If sl01_Exclusiva(i) < 1 Or Int(sl01_DeUsuario(i)) = Int(Session("sl01_Usuario")) or Int(sl01_ParaUsuario(i)) = Int(Session("sl01_Usuario")) or sl01_ParaUsuario(i) = 0 then
   StrNovas = StrNovas & StrQuebra & sl01_Mensagens(i)
   End if
Next

Session("sl01_Ultima") = sl01_Mensagens(0)

Application("sl01_Usuarios") = sl01_Usuarios

Application.UnLock 

%>

<HTML>
<HEAD>
<META HTTP-EQUIV="Refresh" CONTENT="5; recarga.asp">
<SCRIPT LANGUAGE="VBScript">
on error resume next

If top.location.href = self.location.href then top.location.href = "entrar.asp"

<% if StrNovas <> "" Then %>
parent.mensagens.escrever("<% = StrNovas %>")
<% End If %>
</SCRIPT>
</HEAD>
</HTML>