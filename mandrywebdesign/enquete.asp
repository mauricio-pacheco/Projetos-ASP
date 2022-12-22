<%@ LANGUAGE=VBScript%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><title>Mandry Web Design Enquete</title></HEAD>
<BODY bgcolor="#000000" text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF" topmargin="3">
<%
'**********************************
' Sistema de Enquetes 1.0         *
' Autor: Henrique Burity          *
' email: henrique@akimesmo.com    *
'**********************************

' Esse arquivo nao precisa ser alterado, salvo o SERVER.MAPPTH no caso da enquete aparecer
' em várias pastas (vide arquivo PRINCIPAL.ASP)

id = request.querystring ("id")
cont = request.querystring ("cont")

'Cria o objeto de texto
Set Textobj = Server.CreateObject("Scripting.FileSystemObject")
Set Leenq = Textobj.OpenTextFile(Server.MapPath("" & id & ".txt"),1)
linha = split(Leenq.readline , "|")

'Fecha e limpa da memoria
Leenq.close
Set Leenq = nothing

'Calcula a quantidade de opções que a enquete possui
opcoes = int(ubound(linha)/2)

'Cont é o valor passado do código do PRINCIPAL.ASP
'Quando ele é igual a 1 então o sistema grava o voto
'Caso contrário, ele pula a gravação e apenas exibe os resultados parciais

if cont = "1" then
  sel = int(request.querystring("op"))
		linha(opcoes+sel+1)=(int(linha(opcoes+sel+1)))+1
		Set Gravaenq = Textobj.CreateTextFile(Server.MapPath("" & id & ".txt"),8)
  for g = 0 to ubound(linha)
				Gravaenq.write linha(g)
				if g <> ubound(linha) then Gravaenq.write "|"
		next
		msg = "Muito Obrigado" 'mensagem de agradecimento
		
		' fecha e limpa da memoria os objetos e instancias
		Gravaenq.close
  Set Gravaenq = nothing
end if
' exibe os resultados
%>
<font face="verdana" size="2"><b>ENQUETE</b></font><br>
<br>
<font face="verdana" size="1"><b><%=linha(0)%></b><br><br>
Resultados Parciais<br><br>
<%
for a=1 to opcoes
		%>
		<b><%=linha(a)%>: </b><%=linha(opcoes+a)%> votos<br>
		<%
next

' fecha e limpa da memoria os objetos e instancias
Set Textobj = nothing
%>
<br></font>
<p align=center><font face="verdana" size="1">
<%=msg%><br><br><br>
<a href="" onClick="window.close()">fechar essa janela</a></font></p>

</BODY>
</HTML>
