<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></HEAD>
<BODY>
<div id="Mensagem"> 
<%

Application.Lock 

sl01_Mensagens = Application("sl01_Mensagens")
sl01_Exclusiva = Application("sl01_Exclusiva")
sl01_ParaUsuario = Application("sl01_ParaUsuario")
sl01_DeUsuario = Application("sl01_DeUsuario")

for i=19 to 0 Step -1

   If sl01_Exclusiva(i) < 1 Or Int(sl01_DeUsuario(i)) = Int(Session("sl01_Usuario")) or Int(sl01_ParaUsuario(i)) = Int(Session("sl01_Usuario")) or sl01_ParaUsuario(i) = 19 then

      If sl01_Mensagens(i) <> "" then Response.Write StrMarca & sl01_Mensagens(i)
      StrMarca = "<br>&nbsp;<br>"
   End if
Next

Session("sl01_Ultima") = sl01_Mensagens(0)

Application.UnLock 
%>
</div>
<A NAME="#MARCA"></A> 
<script language="VBScript">

on error resume next

If top.location.href = self.location.href then top.location.href = "entrar.asp"


Function Escrever(sl01_StrMensagem)
Mensagem.innerHTML = Mensagem.innerHTML & sl01_StrMensagem
window.setTimeout "Rolagem()", 500
End Function


Sub Rolagem()
if parent(0).rolar.checked then
   window.location.href = "#MARCA"
End if
End sub

Sub Window_onLoad()
parent(3).location.href = "recarga.asp?id=" & Timer
parent(2).location.href = "menu.asp?id=" & Timer
End Sub

</script>
</BODY>
</HTML>