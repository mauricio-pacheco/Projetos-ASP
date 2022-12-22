<% 
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################
'#
'#  CÓDIGO: VirtuaStore Versão 1.2 - Copyright 2001-2003 VirtuaWorks                                    
'#  URL: www.virtuastore.com.br / www.virtuaworks.com.br                                                           
'#  E-MAIL: webmaster@virtuaworks.com.br                                                                                          
'#  AUTORES: Otávio Dias(Desenvolvedor) / Jone Bandinelli(Desenvolvedor) / Daniel Kern(Revisão)                
'# 
'#     Este programa é um software livre; você pode redistribuí-lo e/ou 
'#     modificá-lo sob os termos do GNU General Public License como 
'#     publicado pela Free Software Foundation.
'#     É importante lembrar que qualquer alteração feita no programa 
'#     deve ser informada e enviada para os criadores, através de e-mail 
'#     ou da página de onde foi baixado o código.
'#
'#  //-------------------------------------------------------------------------------------
'#  // LEIA COM ATENÇÃO: O software VirtuaStore 1.2 deve conter as frases
'#  // "Powered by VirtuaStore 1.2" ou "Software derivado de VirtuaStore 1.2" e 
'#  // o link para o site http://www.virtuastore.com.br no créditos da 
'#  // sua loja virtual para ser utilizado gratuitamente. Se o link e/ou uma das 
'#  // frases não estiver presentes ou visiveis este software deixará de ser
'#  // considerado Open-source(gratuito) e o uso sem autorização terá 
'#  // penalidades judiciais de acordo com as leis de pirataria de software.
'#  //--------------------------------------------------------------------------------------
'#      
'#     Este programa é distribuído com a esperança de que lhe seja útil,
'#     porém SEM NENHUMA GARANTIA. Veja a GNU General Public License
'#     abaixo (GNU Licença Pública Geral) para mais detalhes.
'# 
'#     Você deve receber a cópia da Licença GNU com este programa, 
'#     caso contrário escreva para
'#     Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
'#     Boston, MA  02111-1307  USA
'# 
'#     Para enviar suas dúvidas, sugestões e/ou contratar a VirtuaWorks 
'#     Internet Design entre em contato através do e-mail 
'#     contato@virtuaworks.com.br ou pelo endereço abaixo: 
'#     Rua Venâncio Aires, 1001 - Niterói - Canoas - RS - Brasil. Cep 92110-000.
'#
'#     Para ajuda e suporte acesse: http://www.virtuastore.com.br
'#
'#     BOM PROVEITO!          
'#     Equipe VirtuaStore
'#     []'s
'#
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################

'INÍCIO DO CÓDIGO
'----------------------------------------------------------------------------------------------------------------
'Este código está otimizado e roda tanto em Windows 2000/NT/XP/ME/98 quanto em servidores UNIX-LINUX com chilli!ASP


'Declaração das variaveis comuns
Dim razaoloja
Dim bancopag
Dim contapag
Dim pagpara
Dim varimg
Dim pesquisa
Dim strTextoHtml 
Dim conexao 
Dim dados 
Dim senhamaster 
Dim nomeloja 
Dim slogan 
Dim emailloja 
Dim urlloja 
Dim tituloloja 
Dim endereco11 
Dim bairro11 
Dim cidade11 
Dim estado11 
Dim pais11 
Dim fone11 
Dim razao 
Dim Mes 
Dim meszz 
Dim diazz 
Dim dataz 
Dim i 
Dim dia 
Dim mez 
Dim strLink 
Dim strAcao 
Dim contacompra 
Dim contacli 
Dim estadoz 
Dim rs 
Dim r2 
Dim finalera 
Dim pag 
Dim pesss 
Dim pagdxx 
Dim pesqsa 
Dim catege 
Dim fDia 
Dim mezito 
Dim anito 
Dim data 
Dim Ano 
Dim j 
Dim ndiasmes 
Dim anozinho 
Dim palavra 
Dim inicial 
Dim final 
Dim restinho 
Dim totalreg 
Dim pagina2 
Dim pagina3 
Dim rs2 
Dim nSem 
Dim aDiasMes 
Dim strString 
Dim UploadRequest 
Dim objFSO 
Dim ObjFile 
Dim ObjStream 
Dim arquivodat 
Dim separador 
Dim senhaok 
Dim VersaoDb
Dim StringdeConexao

Call Iniciar
%>
<!-- #include file="email.asp" -->
<!-- #include file="criptografia.asp" -->
<%
'-----------------------------------------------------------------------------------
'Inicia a sub pricipal
Sub Iniciar()

on error resume next

Session.LCID = 1046
Response.Buffer = True


'inicia conexao com o banco de dados
%>
<!-- #include file="config.asp" -->
<%
set conexao = Server.CreateObject("ADODB.Connection")
conexao.Open(StringdeConexao)

'Chama variaveis de Aplicação
senhamaster = Application("senhamaster")
nomeloja = Application("nomeloja")
razaoloja = Application("razaoloja")
emailloja = Application("emailloja")
slogan = Application("slogan")
urlloja = Application("urlloja")
endereco11 = Application("endereco11")
bairro11 = Application("bairro11")
cidade11 = Application("cidade11")
estado11 = Application("estado11")
pais11 = Application("pais11")
fone11 = Application("fone11")
bancopag = Application("bancopag")
contapag = Application("contapag")
pagpara = Application("pagpara")

Application("nomeadmin") = admin 
Application("senhaadmin") = nsenha

If Session("admin") = "" Then
Call AcessoASP
Response.Write strTextoHtml
Response.End
End If
strTextoHtml = "<!--" & vbNewLine
strTextoHtml = strTextoHtml & "O que você está procurando?" & vbNewLine
strTextoHtml = strTextoHtml & "What are you lookin' for?" & vbNewLine
strTextoHtml = strTextoHtml & "" & vbNewLine
strTextoHtml = strTextoHtml & "Copyright(c) Casa da Web - Soluções em Marketing Digital" & vbNewLine
strTextoHtml = strTextoHtml & "All Rights Reserved." & vbNewLine
strTextoHtml = strTextoHtml & "------------------------------" & vbNewLine
strTextoHtml = strTextoHtml & "http://www.casadaweb.net" & vbNewLine
strTextoHtml = strTextoHtml & "-->" & vbNewLine & vbNewLine & "<!--INICIO DO CODIGO-->" & vbNewLine
strTextoHtml = strTextoHtml & "<HTML>"
strTextoHtml = strTextoHtml & "<HEAD><TITLE>" & nomeloja & " - Administração On-line</TITLE>"
strTextoHtml = strTextoHtml & "<style type=""text/css"">"
strTextoHtml = strTextoHtml & "<!--"
strTextoHtml = strTextoHtml & "a:link       { color: #000000; text-decoration:none }"
strTextoHtml = strTextoHtml & "a:visited    { color: #000000; text-decoration:none }"
strTextoHtml = strTextoHtml & "a:hover      { color: #365efc; text-decoration:underline }"
strTextoHtml = strTextoHtml & "-->"
strTextoHtml = strTextoHtml & "</style>" & vbNewLine
strTextoHtml = strTextoHtml & "<script language=JavaScript1.2>" & vbNewLine
strTextoHtml = strTextoHtml & "function mOvr(src,clrOver) {" & vbNewLine
strTextoHtml = strTextoHtml & "if (!src.contains(event.fromElement)) {" & vbNewLine
strTextoHtml = strTextoHtml & "src.style.cursor = 'hand';" & vbNewLine
strTextoHtml = strTextoHtml & "src.bgColor = clrOver;" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & " }" & vbNewLine
strTextoHtml = strTextoHtml & "function mOut(src,clrIn) {" & vbNewLine
strTextoHtml = strTextoHtml & "if (!src.contains(event.toElement)) {" & vbNewLine
strTextoHtml = strTextoHtml & "src.style.cursor = 'default';" & vbNewLine
strTextoHtml = strTextoHtml & "src.bgColor = clrIn;" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "</script>" & vbNewLine
strTextoHtml = strTextoHtml & "</HEAD>"

strTextoHtml = strTextoHtml & "<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight=""0"" marginwidth=""0"">"
strTextoHtml = strTextoHtml & "<table cellspacing=""0"" cellpadding=""0"" width=779 height=100% align=center bgcolor=#ffffff style=""border-right: 1px solid #cccccc;border-left: 1px solid #cccccc;""><tr><td valign=top height=""100%"">"

strTextoHtml = strTextoHtml & "<TABLE cellSpacing=0 cellPadding=0 width=""100%"" bgColor=#ffffff border=0>"
strTextoHtml = strTextoHtml & "<TBODY><TD vAlign=top align=middle  width=""100%"">"
strTextoHtml = strTextoHtml & "<TABLE cellSpacing=0 cellPadding=0 width=""100%"" border=0><TBODY>"
strTextoHtml = strTextoHtml & "<tr><td height=0></td></tr>"

Mes = CStr(Trim(Month(Date)))
If Mes = "1" Or Mes = "01" Then
Mes = "janeiro"
End If
If Mes = "2" Or Mes = "02" Then
Mes = "fevereiro"
End If
If Mes = "3" Or Mes = "03" Then
Mes = "março"
End If
If Mes = "4" Or Mes = "04" Then
Mes = "abril"
End If
If Mes = "5" Or Mes = "05" Then
Mes = "maio"
End If
If Mes = "6" Or Mes = "06" Then
Mes = "junho"
End If
If Mes = "7" Or Mes = "07" Then
Mes = "julho"
End If
If Mes = "8" Or Mes = "08" Then
Mes = "agosto"
End If
If Mes = "9" Or Mes = "09" Then
Mes = "setembro"
End If
If Mes = "10" Then
Mes = "outubro"
End If
If Mes = "11" Then
Mes = "novembro"
End If
If Mes = "12" Then
Mes = "dezembro"
End If

strTextoHtml = strTextoHtml & "<form name=""registro1"">"
strTextoHtml = strTextoHtml & "<TR><TD width=""1%"" bgColor=#eeeeee></TD><TD vAlign=top align=right width=50 bgColor=#eeeeee><IMG src=""adm_imagens/mao.gif""></TD>"
strTextoHtml = strTextoHtml & "<TD vAlign=middle width=""70%"" bgColor=#eeeeee><FONT face=tahoma style=font-size:11px>&nbsp;&nbsp;Usuario: <b>Administrador " & nomeloja & " &middot; <a href=http://" & urlloja & " target=_new>" & urlloja & "</a> &middot;</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD><TD align=right vAlign=center width=""30%"" bgColor=#eeeeee><FONT face=tahoma style=font-size:11px><b><a href=""?"">Página inicial</a></b>&nbsp;&nbsp;|&nbsp;&nbsp;<b><a href=""?link=logout"">Logout</a></b>&nbsp;&nbsp;&nbsp;&nbsp;</TD></TR>"
strTextoHtml = strTextoHtml & "</TBODY></TABLE></TD></TR></TABLE>"
strTextoHtml = strTextoHtml & "<TABLE cellSpacing=0 cellPadding=0 width=""100%"" height=91.5% border=0 style=""border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc;"">"
strTextoHtml = strTextoHtml & "<TBODY><TR><TD vAlign=top align=center width=160>"
strTextoHtml = strTextoHtml & "<TABLE cellSpacing=0 cellPadding=0 width=160  align=left border=0><TBODY>"
strTextoHtml = strTextoHtml & "<TR><TD align=middle width=160 background=""adm_imagens/bk_branco.gif"" height=50 valign=top>"
strTextoHtml = strTextoHtml & "<!--- INICIO DO MENU --->"
strTextoHtml = strTextoHtml & "<TABLE height=""100%"" cellSpacing=2 cellPadding=2 width=""100%"" align=center><TBODY></form><TR>"
strTextoHtml = strTextoHtml & "<TD vAlign=center align=middle><a href=""http://" & urlloja & """ target=_new><img src=""adm_imagens/logo.gif"" width=""144"" border=""0"" alt=""" & nomeloja & " - " & urlloja & """></a></FONT></TD></TR></TBODY></TABLE></TD></TR>"
strTextoHtml = strTextoHtml & "<TR><TD vAlign=top align=middle><TABLE cellSpacing=0 cellPadding=2 width=100% border=0><TBODY>"
strTextoHtml = strTextoHtml & "<!--- PRODUTOS NA LOJA --->"
strTextoHtml = strTextoHtml & "<TR bgcolor=#eeeeee><TD><FONT face=tahoma style=font-size:11px>&nbsp;&nbsp;<IMG src=""adm_imagens/prod.gif"" border=0></FONT></TD>"
strTextoHtml = strTextoHtml & "<TD><FONT face=tahoma style=font-size:11px><B>PRODUTOS</B></FONT></TD></TR>"
strTextoHtml = strTextoHtml & "<TR><TD colSpan=2 height=2></td></td>"
strTextoHtml = strTextoHtml & "<TR><TD colSpan=2><FONT face=tahoma style=font-size:11px>&nbsp;&nbsp;<IMG src=""adm_imagens/seta.gif"" border=0> &nbsp;<A href=""?link=produtos&acao=inserir&acaba=sim"">Inserir produto</A></FONT></TD></TR>"
strTextoHtml = strTextoHtml & "<TR><TD colSpan=2><FONT face=tahoma style=font-size:11px>&nbsp;&nbsp;<IMG src=""adm_imagens/seta.gif"" border=0> &nbsp;<A href=""?link=produtos&acao=editar&acaba=sim"">Editar produtos</A></FONT></TD></TR>"
strTextoHtml = strTextoHtml & "<TR><TD colSpan=2><FONT face=tahoma style=font-size:11px>&nbsp;&nbsp;<IMG src=""adm_imagens/seta.gif"" border=0> &nbsp;<A href=""?link=produtos&acao=excluir&acaba=sim"">Excluir produtos</A></FONT></TD></TR>"
strTextoHtml = strTextoHtml & "<TR><TD colSpan=2 height=4></td></td>"

If CStr(Len(Day(Now))) = CStr("1") Then
diazz = "0" & Day(Now)
Else
diazz = Day(Now)
End If
If CStr(Len(Month(Now))) = CStr("1") Then
meszz = "0" & Month(Now)
Else
meszz = Month(Now)
End If

dataz = diazz & "/" & meszz & "/" & Year(Now)

strTextoHtml = strTextoHtml & "<!--- DEPARTAMENTOS --->"
strTextoHtml = strTextoHtml & "<TR bgcolor=#eeeeee><TD><FONT face=tahoma style=font-size:11px>&nbsp;&nbsp;<IMG src=""adm_imagens/dep.gif"" border=0></FONT></TD>"
strTextoHtml = strTextoHtml & "<TD><FONT face=tahoma style=font-size:11px><B>DEPARTAMENTOS</B></FONT></TD></TR>"
strTextoHtml = strTextoHtml & "<TR><TD colSpan=2 height=2></td></td>"
strTextoHtml = strTextoHtml & "<TR><TD colSpan=2><FONT face=tahoma style=font-size:11px>&nbsp;&nbsp;<IMG src=""adm_imagens/seta.gif"" border=0> &nbsp;<A href=""?link=dep&acao=inserir&acaba=sim"">Inserir departamento</A></FONT></TD></TR>"
strTextoHtml = strTextoHtml & "<TR><TD colSpan=2><FONT face=tahoma style=font-size:11px>&nbsp;&nbsp;<IMG src=""adm_imagens/seta.gif"" border=0> &nbsp;<A href=""?link=dep&acao=editar&acaba=sim"">Editar departamentos</A></FONT></TD></TR>"
strTextoHtml = strTextoHtml & "<TR><TD colSpan=2><FONT face=tahoma style=font-size:11px>&nbsp;&nbsp;<IMG src=""adm_imagens/seta.gif"" border=0> &nbsp;<A href=""?link=dep&acao=excluir&acaba=sim"">Excluir departamentos</A></FONT></TD></TR>"
strTextoHtml = strTextoHtml & "<TR><TD colSpan=2 height=4></td></td>"
strTextoHtml = strTextoHtml & "</TBODY></TABLE></TD></TR></TBODY></TABLE></TD>"
strTextoHtml = strTextoHtml & "<!--- FIM DO MENU --->"
strTextoHtml = strTextoHtml & "<!--- INICIO DO CONTEUDO --->"

If Len(Day(Date)) = 1 Then
dia = "0" & Day(Date)
Else
dia = Day(Date)
End If
If Len(Month(Date)) = 1 Then
mez = "0" & Month(Date)
Else
mez = Month(Date)
End If

strTextoHtml = strTextoHtml & "<TD vAlign=top style=""border-left: 1px solid #cccccc;""><TABLE cellSpacing=5 cellPadding=7 width=""100%"" border=0>"
strTextoHtml = strTextoHtml & "<TBODY>"
strTextoHtml = strTextoHtml & "<TR><TD vAlign=center colSpan=2>"

strLink = Request("link")
strAcao = Request("acao")

Select Case strLink
Case "produtos"
Call ProdutosASP

Case "clientes"
Call ClientesASP

Case "news"
Call EmailASP

Case "util"
Call UtilASP

Case "suporte"
Call SuporteASP

Case "dep"
Call DepartamentosASP

Case "compras"
Call ComprasASP

Case "logout"
Session.contents.remove("admin")
Response.Redirect "administrador.asp"

Case Else
strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/acs.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""> <B>Bem-vindo ao administrador...</B> <hr size=1 width=100% color=#cccccc align=left></FONT>"
strTextoHtml = strTextoHtml & "<br><table width=""100%""><tr><td colspan=2><b><FONT face=tahoma style=font-size:11px>Estatísticas da loja virtual " & nomeloja & " ...</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><br>"
strTextoHtml = strTextoHtml & "<table align=center cellSpacing=4 cellPadding=4 style=""border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-right: 1px solid #cccccc;""><tr><td align=center vAlign=center><img src=""adm_imagens/adm.gif"" width=""41"" height=""44"" border=""0""></td><td align=center vAlign=center>"
Set contacompra = conexao.Execute("SELECT count(pedido) AS totalcomp FROM compras WHERE status <> 'Compra em Aberto';")
Set contacli = conexao.Execute("SELECT count(nome) AS totalcli FROM clientes;")
strTextoHtml = strTextoHtml & ""
strTextoHtml = strTextoHtml & "</td></tr></table>"
strTextoHtml = strTextoHtml & "<br><table><tr><td height=6></td></tr></table></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2><b><FONT face=tahoma style=font-size:11px>Dados da sua loja virtual ...</b><br><br><table><tr><td height=3></td></tr></table></td></tr>"
strTextoHtml = strTextoHtml & "<tr bgcolor=#eeeeee><td width=""35%""><FONT face=tahoma style=font-size:11px><b>Nome Fantasia:</b></td><td width=""75%""><FONT face=tahoma style=font-size:11px>" & nomeloja & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma style=font-size:11px><b>Razão social:</b></td><td><FONT face=tahoma style=font-size:11px>" & Application("razaoloja") & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr bgcolor=#eeeeee><td><FONT face=tahoma style=font-size:11px><b>Endereço:</b></td><td><FONT face=tahoma style=font-size:11px>" & endereco11 & " - " & bairro11 & " - " & cidade11 & "/" & estado11 & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma style=font-size:11px><b>Telefone:</b></td><td><FONT face=tahoma style=font-size:11px>" & fone11 & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr bgcolor=#eeeeee><td><FONT face=tahoma style=font-size:11px><b>URL:</b></td><td><FONT face=tahoma style=font-size:11px>http://" & urlloja & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma style=font-size:11px><b>E-mail:</b></td><td><FONT face=tahoma style=font-size:11px>" & emailloja & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr bgcolor=#eeeeee><td></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma style=font-size:11px><b>Última atualização:</b></td><td><FONT face=tahoma style=font-size:11px>" & Application("ultimaatualizacao") & "</td></tr>"

if VersaoDb = "2" then
strTextoHtml = strTextoHtml & "<tr bgcolor=#eeeeee><td><FONT face=tahoma style=font-size:11px><b>Banco de Dados:</b></td><td><FONT face=tahoma style=font-size:11px>Access [.mdb] (Conexão Estável)</td></tr>"
elseif VersaoDb = "3" then
strTextoHtml = strTextoHtml & "<tr bgcolor=#eeeeee><td><FONT face=tahoma style=font-size:11px><b>Banco de Dados:</b></td><td><FONT face=tahoma style=font-size:11px>SQLServer Datadase [.mdf] (Conexão Estável)</td></tr>"
else
strTextoHtml = strTextoHtml & "<tr bgcolor=#eeeeee><td><FONT face=tahoma style=font-size:11px><b>Banco de Dados:</b></td><td><FONT face=tahoma style=font-size:11px>MySQL Database [.frm] (Conexão Estável)</td></tr>"
end if
strTextoHtml = strTextoHtml & "<tr><td colspan=2><br><table><tr><td height=1></td></tr></table></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><table><tr><td height=10></td></tr></table>"
strTextoHtml = strTextoHtml & "<table align=center cellSpacing=0 width=90% height=30 cellPadding=0 style=""border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-right: 1px solid #cccccc;"">"
strTextoHtml = strTextoHtml & ""
strTextoHtml = strTextoHtml & ""
strTextoHtml = strTextoHtml & "</table><table><tr><td height=5></td></tr></table></td></tr></table>"
End Select

strTextoHtml = strTextoHtml & "</TD></TR></TBODY></TABLE>"
strTextoHtml = strTextoHtml & "<!--- FIM DO CONTEUDO --->"
strTextoHtml = strTextoHtml & "</TD></TR></TBODY></TABLE>" & vbNewLine
strTextoHtml = strTextoHtml & "<!--- INICIO DO FIM --->"
strTextoHtml = strTextoHtml & "<TABLE cellSpacing=2 cellPadding=2 width=""100%"" align=center bgcolor=#eeeeee border=0>"
strTextoHtml = strTextoHtml & "<TBODY><TR><TD vAlign=top align=right width=""100%"">"
strTextoHtml = strTextoHtml & "<a href=""http://www.casadaweb.net"" target=_new style=text-decoration:none;><FONT face=tahoma style=font-size:11px><B>&copy; Casa da Web - Soluções em Marketing Digital&nbsp;</B></a></TD></TR></TBODY></TABLE>"
strTextoHtml = strTextoHtml & "</td></tr></table>"
strTextoHtml = strTextoHtml & "</BODY></HTML>"

conexao.Close
Set conexao = Nothing

if err.number <> 0 then
Select Case Err.number
Case 0
Case Else
Response.Write "<title>Erro!</title><center><br><br><font face=tahoma style=font-size:11px><h1>Erro no Sistema!</h1><br><br>N°. do erro:" & Err.number & "<br>Descrição do erro:" & Err.Description & "<br><br>Se você estiver inserindo dados em sua loja NÃO use: aspas simples ('), barra (/) e parêntes (())<br><Br><a href=""javascript: history.go(-1);"">Voltar para página anterior</a>"
End Select
else
Response.Write strTextoHtml
end if
End Sub


Sub ClientesASP()
If Request("acaba") = "sim" Then
Session("adm_descprod") = ""
Session("adm_email") = ""
End If
Select Case strAcao
Case "ver"

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/cli_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Administrar clientes cadastrados na loja</B></FONT><hr size=1 color=#cccccc>"

finalera = Request.QueryString("final")
pag = Request.QueryString("itens")
pesss = Trim(Request.QueryString("pesq"))
pagdxx = Request.QueryString("pagina")
pesqsa = Request.QueryString("pesqsa")
catege = Request("cat")

if pesss = "" Then
pesss = "-"
palavra = Split(Trim("asdfghjklçqwertyuiopzxcvbnm"), " ")
Else
pesss = pesss
palavra = Split(Trim(Request.QueryString("pesq")), " ")
End If
If pag = "" Then
inicial = 0
final = 10
Else
inicial = pag
final = 10
End If
If pesqsa = "" Then
restinho = ""
catege = "todos"
Else
If catege = "todos" Or catege = "xxx" Or catege = "" Then
resto = ""
Else
resto = "idsessao = '" & catege & "' and"
End If
palavraz = Split(Trim(pesqsa), " ")
if VersaoDb = 1 then
  restinho = "WHERE nome LIKE  '%" & Cripto(palavraz(0),true) & "%'"
else
  restinho = "WHERE nome LIKE  '%" & Cripto(palavraz(0),true) & "%'"
end if
End If

Set rs = conexao.Execute("SELECT * FROM clientes " & restinho & " ORDER by nome asc")

If rs.EOF Or rs.bof Then

strTextoHtml = strTextoHtml & "<table><tr><td align=left valign=top><table border=0 cellspacing=4 cellpadding=4 width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=tahoma style=font-size:11px;color:000000>Cliente(s) encontrado(s): <b>0" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table cellspacing=3 cellpadding=3 align=center width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><form action=? method=get><input name=link type=hidden value=clientes><input name=acao type=hidden value=ver>"
strTextoHtml = strTextoHtml & "<td align=center><font face=""tahoma"" style=font-size:11px;color:000000><center>Para uma busca mais detalhada dos clientes cadastrados na loja realize uma pesquisa com o nome e/ou palavra-chave do cliente  que você procura.</td><tr><td align=center>"
strTextoHtml = strTextoHtml & "<input name=""pesqsa"" type=""text"" size=30 value=""" & Request("pesqsa") & """ style=font-size:11px;color:000000;font-family:tahoma><font style=font-size:11px></font> <input type=submit class=""ok"" value=""Pesquisar"" style=font-size:11px;color:000000;font-family:tahoma>"
strTextoHtml = strTextoHtml & "</td></form></tr><tr><td height=1 bgcolor=cccccc></td></tr></table><br><br>"
strTextoHtml = strTextoHtml & "<table width=565 align=center>"
strTextoHtml = strTextoHtml & "<tr><td align=center><br><br><b><font style=font-size:11px>Nenhum cliente foi encontrado na base de dados da loja.<br><br></b><br><br></td></tr></table>"
strTextoHtml = strTextoHtml & "<br></table>"
strTextoHtml = strTextoHtml & "<table width=100% cellspacing=""0"" cellpadding=""0""><tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc width=""101%""></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><font face=""tahoma"" style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table><td></tr></table>"

Else
Set rs2 = conexao.Execute("SELECT count(nome) AS total FROM clientes " & restinho & ";")
totalreg = rs2("total")
rs2.Close
Set rs2 = Nothing
numiz = Request("pagina") & "0"
numiz = CInt(numiz)
iz = iz + numiz

strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Cliente(s) encontrado(s): <b>" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table cellspacing=""3"" cellpadding=""3"" align=center width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><form action=""?"" method=get><input name=""link"" type=""hidden"" value=""clientes""><input name=""acao"" type=""hidden"" value=""ver"">"
strTextoHtml = strTextoHtml & "<td align=center><font face=""tahoma"" style=font-size:11px;color:000000><center>Para uma busca mais detalhada dos clientes cadastrados na loja realize uma pesquisa com o nome e/ou palavra-chave do cliente  que você procura.</td><tr><td align=center>"
strTextoHtml = strTextoHtml & "<input name=""pesqsa"" type=""text"" size=30 value=""" & Request("pesqsa") & """ style=font-size:11px;color:000000;font-family:tahoma><font style=font-size:11px></font> <input type=submit class=""ok"" value=""Pesquisar"" style=font-size:11px;color:000000;font-family:tahoma>"
strTextoHtml = strTextoHtml & "<br><br></td></form></tr><tr><td height=1 bgcolor=cccccc></td></tr></table>"

If Request("status") = "sucesso" Then
strTextoHtml = strTextoHtml & "<br><center><b><font style=font-size:11px;font-family:tahoma;color:#003366>CLIENTE EXCLUÍDO COM SUCESSO!<br><br></font></b></center>"
Else
strTextoHtml = strTextoHtml & "<br>"
End If

strTextoHtml = strTextoHtml & "<table width=""565"" align=center>"

While Not rs.EOF
iz = iz + 1
varestoq = "<font color=#b23c04>" & Cripto(rs("email"), False) & "</font>" & vbNewLine

strTextoHtml = strTextoHtml & "<script language=""javascript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function cli" & rs("clienteid") & "(){" & vbNewLine
strTextoHtml = strTextoHtml & "if (confirm('Você realmente deseja excluir este cliente?'))" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "window.location.href('?link=clientes&cli=" & rs("clienteid") & "&acao=exclui');" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "else" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "}}" & vbNewLine
strTextoHtml = strTextoHtml & "</script>" & vbNewLine

strTextoHtml = strTextoHtml & "<tr><td align=left valign=center>"
strTextoHtml = strTextoHtml & "<table width=""100%"" bgcolor=#eeeeee style=""border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;""><tr><td valign=center><font face=""tahoma"" style=font-size:11px;color:000000>" & iz & ") <b>" & UCASE(Cripto(rs("nome"),False)) & "</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data do cadastro: <b>" & rs("datacad") & "</b> &nbsp;&nbsp;&nbsp;E-mail: <b>" & varestoq & "</b></td><td align=right valign=center><font face=""tahoma"" style=font-size:11px;color:000000>Ação: <b><a href=?link=clientes&acao=olhar&cli=" & rs("clienteid") & ">Ver</a></b> | <b><a href=""javascript: cli" & rs("clienteid") & "();"">Excluir</a></b>&nbsp;</td></tr></table> <table><tr><td height=4></td></tr></table>"

rs.movenext
Wend

strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=tahoma style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table></td></tr></table></table>"

rs.Close
Set rs = Nothing
End If

Case "exclui"
notz = Request.QueryString("cli")
Set dados = conexao.Execute("delete from clientes where clienteid = " & notz & ";")
Response.Redirect "?link=clientes&acao=ver&status=sucesso"

Case "olhar"
if VersaoDb = 1 then
  Set dados = conexao.Execute("SELECT clienteid, datacad AS data, nome, email, senha, nascimento, cpf, rg, endereco, bairro, cidade, estado, cep, pais, tel FROM clientes WHERE clienteid='" & Request("cli") & "';")
else
  Set dados = conexao.Execute("SELECT clientes.*, clientes.datacad AS data FROM clientes WHERE clienteid=" & Request("cli"))
end if

If dados.EOF Or dados.EOF Then
Conn.Close
Set Conn = Nothing
Response.Redirect "administrador.asp"
Else
strNome = Cripto(dados("nome"), False)
strEmail = Cripto(dados("email"),False)
strNasc = Cripto(dados("nascimento"),False)
strCpf = Cripto(dados("cpf"),False)
strRg = Cripto(dados("rg"),False)
strEndereco = Cripto(dados("endereco"),False)
strBairro = Cripto(dados("bairro"),False)
strCidade = Cripto(dados("cidade"),False)
strEstado = Cripto(dados("estado"),False)
strCep = Cripto(dados("cep"),False)
strData = dados("data")
strPais = Cripto(dados("pais"),False)
strClienteid = dados("email")
strFone = Cripto(dados("tel"),False)
numero = InStr(1, strNasc, "/")
dia = Left(strNasc, numero)
s = ""
For x = 1 To Len(dia)
ch = Mid(dia, x, 1)
If Asc(ch) >= 48 And Asc(ch) <= 57 Then
s = s & ch
End If
Next
dia = s
Mes = Mid(strNasc, 4, 2)
If Mes = "01" Then
Mes = "janeiro"
End If
If Mes = "02" Then
Mes = "fevereiro"
End If
If Mes = "03" Then
Mes = "março"
End If
If Mes = "04" Then
Mes = "abril"
End If
If Mes = "05" Then
Mes = "maio"
End If
If Mes = "06" Then
Mes = "junho"
End If
If Mes = "07" Then
Mes = "julho"
End If
If Mes = "08" Then
Mes = "agosto"
End If
If Mes = "09" Then
Mes = "setembro"
End If
If Mes = "10" Then
Mes = "outubro"
End If
If Mes = "11" Then
Mes = "novembro"
End If
If Mes = "12" Then
Mes = "dezembro"
End If
Ano = Right(strNasc, 4)
Select Case strEstado
Case "AC"
estadoz = "Acre"
Case "AL"
estadoz = "Alagoas"
Case "AP"
estadoz = "Amapá"
Case "AM"
estadoz = "Amazonas"
Case "BA"
estadoz = "Bahia"
Case "CE"
estadoz = "Ceará"
Case "DF"
estadoz = "Distrito Federal"
Case "ES"
estadoz = "Espirito Santo"
Case "GO"
estadoz = "Goiás"
Case "MA"
estadoz = "Maranhão"
Case "MT"
estadoz = "Mato Grosso"
Case "MS"
estadoz = "Mato Grosso do Sul"
Case "MG"
estadoz = "Minas Gerais"
Case "PA"
estadoz = "Pará"
Case "PB"
estadoz = "Paraiba"
Case "PR"
estadoz = "Parana"
Case "PE"
estadoz = "Pernambuco"
Case "PI"
estadoz = "Piauí"
Case "RJ"
estadoz = "Rio de Janeiro"
Case "RN"
estadoz = "Rio Grande do Norte"
Case "RS"
estadoz = "Rio Grande do Sul"
Case "RO"
estadoz = "Rondônia"
Case "RR"
estadoz = "Roraima"
Case "SC"
estadoz = "Santa Catarina"
Case "SP"
estadoz = "São Paulo"
Case "SE"
estadoz = "Sergipe"
Case "TO"
estadoz = "Tocantins"
End Select

   Set rs = conexao.Execute("select * from compras where clienteid='" & strClienteid & "';")

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/cli_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Ver cliente cadastrado na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<center><FONT face=tahoma  style=font-size:11px><b><A href=""?link=clientes&acao=ver&acaba=sim"">Voltar e ver mais clientes</a></b></center>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc>"
strTextoHtml = strTextoHtml & "<table width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><td colspan=2><font style=font-family:tahoma;font-size:11px;color:#000000;><br><b>Dados do Cliente</font><hr size=1 color=000000></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><font style=font-family:tahoma;font-size:11px;color:#000000;>Data do cadastro:</font></td><td><font style=font-family:tahoma;font-size:11px;color:#000000><b>" & strData & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td bgcolor=#eeeeee><font style=font-family:tahoma;font-size:11px;color:#000000;>Nome completo:</font></td><td bgcolor=#eeeeee><font style=font-family:tahoma;font-size:11px;color:#000000><b>" & strNome & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><font style=font-family:tahoma;font-size:11px;color:#000000;>E-mail:</td><td><font style=font-family:tahoma;font-size:11px;color:#000000;><b>" & strEmail & "</b></font></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td  bgcolor=#eeeeee><font style=font-family:tahoma;font-size:11px;color:#000000;>Nascimento:</font></td><td  bgcolor=#eeeeee><font style=""font-family:tahoma;font-size:11px;color:#000000;""><b>" & dia & " de " & Mes & " de " & Ano & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><font style=font-family:tahoma;font-size:11px;color:#000000;>CIC/CPF:</font></td><td><font style=font-family:tahoma;font-size:11px;color:#000000;><b>" & strCpf & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td  bgcolor=#eeeeee><font style=font-family:tahoma;font-size:11px;color:#000000;>RG:</font></td><td  bgcolor=#eeeeee><font style=font-family:tahoma;font-size:11px;color:#000000;><b>" & strRg & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><font style=font-family:tahoma;font-size:11px;color:#000000;>Endereço:</font></td><td><font style=font-family:tahoma;font-size:11px;color:#000000;><b>" & strEndereco & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td  bgcolor=#eeeeee><font style=font-family:tahoma;font-size:11px;color:#000000;>Bairro:</font></td><td  bgcolor=#eeeeee><font style=font-family:tahoma;font-size:11px;color:#000000;><b>" & strBairro & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><font style=font-family:tahoma;font-size:11px;color:#000000;>Cidade:</font></td><td><font style=font-family:tahoma;font-size:11px;color:#000000;><b>" & strCidade & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td  bgcolor=#eeeeee><font style=font-family:tahoma;font-size:11px;color:#000000;>Estado:</font></td><td  bgcolor=#eeeeee><font style=font-family:tahoma;font-size:11px;color:#000000;><b>" & estadoz & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><font style=font-family:tahoma;font-size:11px;color:#000000;>CEP:</font></td><td><font style=font-family:tahoma;font-size:11px;color:#000000;><b>" & strCep & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td  bgcolor=#eeeeee><font style=font-family:tahoma;font-size:11px;color:#000000;>País:</td><td  bgcolor=#eeeeee><font style=font-family:tahoma;font-size:11px;color:#000000;><b>" & strPais & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><font style=font-family:tahoma;font-size:11px;color:#000000;>Telefone:</font></td><td><font style=font-family:tahoma;font-size:11px;color:#000000;><b>" & strFone & "</font></td></tr>"

strTextoHtml = strTextoHtml & "<tr><td colspan=2><font style=font-family:tahoma;font-size:11px;color:#000000;><br><b>Compras efetuadas</font><hr size=1 color=000000></td></tr>"

Set rs2 = conexao.Execute("SELECT count(pedido) AS total FROM compras WHERE clienteid = '" & strClienteid & "';")

totalreg = rs2("total")
rs2.Close
Set rs2 = Nothing
numiz = Request("pagina") & "0"
numiz = CInt(numiz) * 2
iz = iz + numiz

strTextoHtml = strTextoHtml & "<table border=""0"" cellspacing=""4"" cellpadding=""4"" width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><td><font face=""tahoma"" style=font-size:11px;color:000000>Compra(s) efetuada(s): <b>" & totalreg & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td>"

If Request("status") = "sucesso" Then
strTextoHtml = strTextoHtml & "<center><b><font style=font-size:11px;font-family:tahoma;color:#003366>COMPRA EXCLUÍDA COM SUCESSO!<br><br></font></b></center>"
Else
End If

strTextoHtml = strTextoHtml & "<table width=""100%"" align=center>"
While Not rs.EOF
iz = iz + 1
Select Case rs("estadoentrega")
Case "AC"
estadoz = "Acre"
Case "AL"
estadoz = "Alagoas"
Case "AP"
estadoz = "Amapá"
Case "AM"
estadoz = "Amazonas"
Case "BA"
estadoz = "Bahia"
Case "CE"
estadoz = "Ceará"
Case "DF"
estadoz = "Distrito Federal"
Case "ES"
estadoz = "Espirito Santo"
Case "GO"
estadoz = "Goiás"
Case "MA"
estadoz = "Maranhão"
Case "MT"
estadoz = "Mato Grosso"
Case "MS"
estadoz = "Mato Grosso do Sul"
Case "MG"
estadoz = "Minas Gerais"
Case "PA"
estadoz = "Pará"
Case "PB"
estadoz = "Paraiba"
Case "PR"
estadoz = "Parana"
Case "PE"
estadoz = "Pernambuco"
Case "PI"
estadoz = "Piauí"
Case "RJ"
estadoz = "Rio de Janeiro"
Case "RN"
estadoz = "Rio Grande do Norte"
Case "RS"
estadoz = "Rio Grande do Sul"
Case "RO"
estadoz = "Rondônia"
Case "RR"
estadoz = "Roraima"
Case "SC"
estadoz = "Santa Catarina"
Case "SP"
estadoz = "São Paulo"
Case "SE"
estadoz = "Sergipe"
Case "TO"
estadoz = "Tocantins"
End Select

   Set rs3 = conexao.Execute("select nome, email from clientes where email='" & strClienteid & "'")
   on error resume next
strTextoHtml = strTextoHtml & "<tr><td align=left valign=center>" & vbNewLine

strTextoHtml = strTextoHtml & "<script language=""javascript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function compra" & rs("idcompra") & "(){" & vbNewLine
strTextoHtml = strTextoHtml & "if (confirm('Você realmente deseja excluir esta compra?'))" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "window.location.href('?link=clientes&acao=excluirc&compra=" & rs("idcompra") & "&cli=" & dados("clienteid") & "');" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "else" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "}}" & vbNewLine
strTextoHtml = strTextoHtml & "</script>" & vbNewLine

strTextoHtml = strTextoHtml & "<table width=""100%"" bgcolor=#eeeeee style=""border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;""><tr><td valign=center><font face=""tahoma"" style=font-size:11px;color:000000>" & iz & ") Compra feita por: <b>" & UCase(Cripto(rs3("nome"),false)) & "</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Frete para: <b>" & estadoz & "</b> &nbsp;&nbsp;&nbsp;Total da compra: <font color=#b23c04><b>R$ " & FormatNumber(-1 + Cripto(rs("totalcompra"),false) + Cripto(rs("frete"),false) + 1, 2) & "</b></font></td><td align=right valign=center><font face=tahoma style=font-size:11px;color:000000>Ação: <b><a href=?link=clientes&acao=verc&compra=" & rs("idcompra") & ">Ver</a></b> | <b><a href=""javascript: compra" & rs("idcompra") & "();"">Excluir</a></b>&nbsp;</td></tr></table> <table><tr><td height=4></td></tr></table>"

rs.movenext
pagn = inicial + 20
Wend
paga = pagn - 40

strTextoHtml = strTextoHtml & "</td></tr></table></table>"
strTextoHtml = strTextoHtml & "<hr size=1 color=#cccccc width=""100%""><font face=tahoma style=font-size:11px><b><center><br><a HREF=?>Voltar para Página Inicial</a></b></font></center>"
End If

Case "verc"

Set rs = conexao.Execute("select * from compras where idcompra=" & Request("compra") & ";")
Set rs3 = conexao.Execute("select * from clientes where email='" & rs("clienteid") & "'")

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/cli_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Ver detalhes da compra</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<center><FONT face=tahoma  style=font-size:11px><b><A href=""?link=clientes&acao=olhar&acaba=sim&cli=" & rs3("clienteid") & """>Voltar e ver detalhes do cliente " & Cripto(rs3("nome"),false) & "</a></b></center>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc>"
strTextoHtml = strTextoHtml & "<FONT face=tahoma color=#000000 style=font-size:11px>Compra efetuada pelo cliente: <b>" & UCase(Cripto(rs3("nome"),false)) & "</b><br>"
strTextoHtml = strTextoHtml & "<FONT face=tahoma color=#000000 style=font-size:11px>Pedido n<sup>o</sup> : <b>#" & rs("pedido") & "</b><br>"
strTextoHtml = strTextoHtml & "<br>"

Select Case rs("estadoentrega")
Case "AC"
estadoz = "Acre"
Case "AL"
estadoz = "Alagoas"
Case "AP"
estadoz = "Amapá"
Case "AM"
estadoz = "Amazonas"
Case "BA"
estadoz = "Bahia"
Case "CE"
estadoz = "Ceará"
Case "DF"
estadoz = "Distrito Federal"
Case "ES"
estadoz = "Espirito Santo"
Case "GO"
estadoz = "Goiás"
Case "MA"
estadoz = "Maranhão"
Case "MT"
estadoz = "Mato Grosso"
Case "MS"
estadoz = "Mato Grosso do Sul"
Case "MG"
estadoz = "Minas Gerais"
Case "PA"
estadoz = "Pará"
Case "PB"
estadoz = "Paraiba"
Case "PR"
estadoz = "Parana"
Case "PE"
estadoz = "Pernambuco"
Case "PI"
estadoz = "Piauí"
Case "RJ"
estadoz = "Rio de Janeiro"
Case "RN"
estadoz = "Rio Grande do Norte"
Case "RS"
estadoz = "Rio Grande do Sul"
Case "RO"
estadoz = "Rondônia"
Case "RR"
estadoz = "Roraima"
Case "SC"
estadoz = "Santa Catarina"
Case "SP"
estadoz = "São Paulo"
Case "SE"
estadoz = "Sergipe"
Case "TO"
estadoz = "Tocantins"
End Select

If rs("status") = "0" Then
estatuzz = "Pedido recebido pela " & nomeloja
End If
If rs("status") = "1" Then
estatuzz = "Pedido em processamento"
End If
If rs("status") = "2" Then
estatuzz = "Compra já enviada ao cliente"
End If
If rs("status") = "3" Then
estatuzz = "Compra Já Entregue"
End If
If rs("status") = "4" Then
estatuzz = "Compra Cancelada"
End If
If rs("status") = "5" Then
estatuzz = "Compra Negada"
End If
If rs("status") = "6" Then
estatuzz = "Outras - Contate o Atendimento"
End If

strTextoHtml = strTextoHtml & "<b>STAUS DA COMPRA EFETUADA:</b><hr size=1 color=000000>"
strTextoHtml = strTextoHtml & "<table width=""100%""><tr><td><font face=tahoma style=font-size:11px;color:000000>Status da compra:</td><td align=right><font face=tahoma style=font-size:11px;color:000000><form action=""?"" method=get><input name=""link"" type=""hidden"" value=""compras""><input name=""acao"" type=""hidden"" value=""modificar""><input name=""compra"" type=""hidden"" value=""" & Request("compra") & """><input name=""dia"" type=""hidden"" value=""" & Request("dia") & """><input name=""data"" type=""hidden"" value=""" & Request("data") & """><input name=""mes"" type=""hidden"" value=""" & Request("mes") & """><input name=""ano"" type=""hidden"" value=""" & Request("ano") & """><font style=font-size:11px;color:b23c04;font-family:tahoma;font-weight:bold>" & estatuzz & "</font></td></tr></table>"
strTextoHtml = strTextoHtml & "<br><b>DADOS PARA ENTREGA DO PEDIDO:</b><hr size=1 color=000000>"
strTextoHtml = strTextoHtml & "<table width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><td bgcolor=#eeeeee><FONT face=tahoma color=#000000 style=font-size:11px>Data da compra: </b></td><td  bgcolor=#eeeeee> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & rs("datacompra") & "</b></td></tr>"

estimativa = CDate(rs("datacompra")) + 10
If Mid(estimativa, 2, 1) = "/" Then
estimativa = "0" & estimativa
Else
estimativa = estimativa
End If
If Mid(estimativa, 5, 1) = "/" Then
estimativa = Mid(estimativa, 1, 3) & "0" & Mid(estimativa, 4, 99)
Else
estimativa = estimativa
End If

strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma color=#000000 style=font-size:11px>Estimativa para entrega: </b></td><td> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & estimativa & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td bgcolor=#eeeeee><FONT face=tahoma color=#000000 style=font-size:11px>Endereço:</b></td><td bgcolor=#eeeeee> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & Cripto(rs("endentrega"),false) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma color=#000000 style=font-size:11px>Bairro:</b></td><td> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & Cripto(rs("bairroentrega"),false) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td bgcolor=#eeeeee><FONT face=tahoma color=#000000 style=font-size:11px>Cidade:</b></td><td bgcolor=#eeeeee> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & Cripto(rs("cidadeentrega"),false) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma color=#000000 style=font-size:11px>Estado: </b></td><td> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & estadoz & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td bgcolor=#eeeeee><FONT face=tahoma color=#000000 style=font-size:11px>País: </b></td><td bgcolor=#eeeeee> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>Brasil</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma color=#000000 style=font-size:11px>CEP: </b></td><td> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & Cripto(rs("cepentrega"),false) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td bgcolor=#eeeeee><FONT face=tahoma color=#000000 style=font-size:11px>Telefone: </b></td><td bgcolor=#eeeeee> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & Cripto(rs("telentrega"),false) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "</table><br>"
strTextoHtml = strTextoHtml & "<b>DADOS DA COMPRA E PAGAMENTO:</b><hr size=1 color=000000>"
strTextoHtml = strTextoHtml & "<table width=""100%"">"
strTextoHtml = strTextoHtml & "</form><tr><td bgcolor=003366><font face=tahoma style=font-size:11px;color:ffffff>&nbsp;Cód.</b></td>"
strTextoHtml = strTextoHtml & "<td bgcolor=003366><font face=tahoma style=font-size:11px;color:ffffff>&nbsp;Produto</b></td>"
strTextoHtml = strTextoHtml & "<td bgcolor=003366><font face=tahoma style=font-size:11px;color:ffffff>&nbsp;Quant.</b></td>"
strTextoHtml = strTextoHtml & "<td bgcolor=003366><font face=tahoma style=font-size:11px;color:ffffff>&nbsp;Valor Unit.</b></td>"
strTextoHtml = strTextoHtml & "<td bgcolor=003366><font face=tahoma style=font-size:11px;color:ffffff>&nbsp;Valor Total</b></td>"
strTextoHtml = strTextoHtml & "</tr>"

Set rs10 = conexao.execute("SELECT * FROM pedidos WHERE idcompra = '" & Request("compra") & "';")
If rs10.EOF Then
Else
While Not rs10.EOF

Set prod = conexao.Execute("select * from produtos where idprod = " & rs10("idprod") & ";")
If prod.bof Or prod.EOF Then
strTextoHtml = strTextoHtml & "<tr><td align=center><font face=tahoma style=font-size:11px;color:000000>#</td><td colspan=4><font face=tahoma style=font-size:11px;color:000000>O produto comprado não estão mais presente na loja</b></center>"
Else
codigo = prod("idprod")
prodnome = prod("nome")
preconormal = prod("preco")
quantidade = rs10("quantidade")
subpreco = FormatNumber(preconormal, 2)
totpreco = FormatNumber((quantidade * preconormal), 2)

strTextoHtml = strTextoHtml & "<tr><td align=center><font face=tahoma style=font-size:11px;color:000000>" & codigo & "</td>"
strTextoHtml = strTextoHtml & "<td><font face=tahoma style=font-size:11px;color:000000>" & prodnome & "</td>"
strTextoHtml = strTextoHtml & "<td align=center><font face=tahoma style=font-size:11px;color:000000>" & quantidade & "</td>"
strTextoHtml = strTextoHtml & "<td align=right><font face=tahoma style=font-size:11px;color:000000>R$ " & subpreco & "</td>"
strTextoHtml = strTextoHtml & "<td align=right><font face=tahoma style=font-size:11px;color:000000>R$ " & totpreco & "</td></tr>"
End If
rs10.movenext
Wend
rs10.Close
End If

totalcompra = Cripto(rs("totalcompra"),false)
totalfrete = Cripto(rs("frete"),false)
Status = rs("status")
pagamento = rs("pagamentovia")
intcomprasz = totalcompra + 1 + totalfrete - 1
comprasz = intcomprasz
comprasz = Replace(comprasz, "-", "")
data = rs("datacompra")
Select Case pagamento
Case "0"
ver = "Cartão de Crédito - Visa"
Case "1"
ver = "Cartão de Crédito - Mastercard"
Case "2"
ver = "Cartão de Crédito - Dinners"
Case "3"
ver = "Cartão de Crédito - American Express"
Case "4"
ver = "SEDEX à cobrar"
Case "5"
ver = "Depósito Identificado"
Case "6"
ver = "Depósito Simples"
End Select
If Status = "0" Then
estatus = "Pedido recebido pela " & nomeloja
If pagamento = "0" And pagamento = "1" And pagamento = "2" And pagamento = "3" And pagamento = "4" Then
ver2 = "Pagamento confirmado com a operdora do cartão de credito"
Else
ver2 = "Aguardando confirmação"
End If
End If
If Status = "1" Then
estatus = "Pedido em processamento"
If pagamento = "0" And pagamento = "1" And pagamento = "2" And pagamento = "3" And pagamento = "4" Then
ver2 = "Pagamento confirmado com a operdora do cartão de credito"
Else
ver2 = "Pagamento confirmado"
End If
End If
If Status = "2" Then
estatus = "Compra já enviada ao cliente"
ver2 = "Pagamento já efetuado"
End If
If Status = "3" Then
estatus = "Compra Já Entregue"
ver2 = "Pagamento já efetuado"
End If
If Status = "4" Then
estatus = "Compra Cancelada"
ver2 = "Pagamento cancelado"
End If
If Status = "5" Then
estatus = "Compra Negada"
ver2 = "Pagamento cancelado"
End If
If Status = "6" Then
estatus = "Outras - Contate o Atendimento"
ver2 = "Pagamento cancelado"
End If
comprazw = FormatNumber(comprasz, 2)
totalfretezw = FormatNumber(totalfrete, 2)
totalcomprazw = FormatNumber(totalcompra, 2)

select case pagamento
case 0,1,2,3
   strInf = "<tr><td><font face=tahoma style=font-size:11px;color:000000>Número do Cartão</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>" & Cripto(rs("numero"),false) & "</b></td>"
   strInf = strInf & "<tr><td><font face=tahoma style=font-size:11px;color:000000>Vencimento</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>" & Cripto(rs("vencimento"),false) & "</b></td>"
   strInf = strInf & "<tr><td><font face=tahoma style=font-size:11px;color:000000>Titular do Cartão</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>" & Cripto(rs("titular"),false) & "</b></td>"   
case else
   strInf = ""
end select

strTextoHtml = strTextoHtml & "</table><hr size=1 color=cccccc width=""100%""><table width=""100%""><tr><td><font face=tahoma style=font-size:11px;color:000000>Sub-total</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>R$ " & totalcomprazw & "</b></td>"
strTextoHtml = strTextoHtml & "</tr></table><table width=""100%""><tr><td><font face=tahoma style=font-size:11px;color:000000>Frete</td>"
strTextoHtml = strTextoHtml & "<td align=right><font face=tahoma style=font-size:11px;color:000000><b>R$ " & totalfretezw & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><font face=tahoma style=font-size:11px;color:000000>Valor total da compra</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>R$ " & comprazw & "</b></td>"
strTextoHtml = strTextoHtml & "</tr></table><hr size=1 color=cccccc width=""100%""><table width=""100%""><tr><td><font face=tahoma style=font-size:11px;color:000000>Forma de Pagamento</td><td align=right><font face=tahoma style=font-size:11px;color:b23c04><b>" & ver & "</b></td></tr>"
select case pagamento
case 0,1,2,3
   strInf = "<tr><td><font face=tahoma style=font-size:11px;color:000000>Número do Cartão</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>" & Cripto(rs("numero"),false) & "</b></td>"
   strInf = strInf & "<tr><td><font face=tahoma style=font-size:11px;color:000000>Vencimento</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>" & Cripto(rs("vencimento"),false) & "</b></td>"
   strInf = strInf & "<tr><td><font face=tahoma style=font-size:11px;color:000000>Titular do Cartão</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>" & Cripto(rs("titular"),false) & "</b></td>"   
case else
   strInf = ""
end select
strTextoHtml = strTextoHtml & strInf
strTextoHtml = strTextoHtml & "<tr><td><font face=tahoma style=font-size:11px;color:000000>Status</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>" & ver2 & "</b></td></tr></table>"
strTextoHtml = strTextoHtml & "<center><br><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br>"

Case "excluirc"
notz = Request.QueryString("compra")
Set dados = conexao.Execute("delete from compras where idcompra=" & notz & ";")
Response.Redirect "?link=clientes&acao=olhar&cli=" & Request("cli") & "&status=sucesso"
End Select
End Sub
'-----------------------------------------------------------------------------------
Sub AcessoASP()
strTextoHtml = "<HTML>"
strTextoHtml = strTextoHtml & "<HEAD><TITLE>" & tituloloja & "</TITLE>"
strTextoHtml = strTextoHtml & "<style type=""text/css""><!--"
strTextoHtml = strTextoHtml & "a:link       { color: #000000; text-decoration:none }"
strTextoHtml = strTextoHtml & "a:visited    { color: #000000; text-decoration:none }"
strTextoHtml = strTextoHtml & "a:hover      { color: #365efc; text-decoration:underline }"
strTextoHtml = strTextoHtml & "#divDrag0{position:absolute; left:0; top:0; height:120; width:40; clip:rect(0,120,120,0); cursor:hand;}"
strTextoHtml = strTextoHtml & "-->"
strTextoHtml = strTextoHtml & "</style>"
strTextoHtml = strTextoHtml & "</HEAD>"
strTextoHtml = strTextoHtml & "<body topmargin=0 leftmargin=0 bottommargin=0 rightmargin=0>"

strAcao = Request.Form("acao")
Select Case strAcao
Case "valida"

If Request.Form("usr") = LCase(Application("nomeadmin")) And Request.Form("sen") = Application("senhaadmin") Then

textosql = "INSERT INTO admin (data, hora, ip, host) VALUES ('" & Day(Now) & "/" & Month(Now) & "/" & Year(Now) & "', '" & Time & "', '" & Request.ServerVariables("remote_addr") & "', '" & Request.ServerVariables("remote_host") & "');"
Set gravaentra = conexao.Execute(textosql)

Session("admin") = "logado"
Response.Redirect "?" & Request.Form("url")
Else
Response.Redirect "?login=erro"
End If

Case Else

strTextoHtml = strTextoHtml & "<table cellspacing=""0"" cellpadding=""0"" width=779 height=""100%"" align=center valign=center bgcolor=#ffffff style=""border-right: 1px solid #cccccc;border-left: 1px solid #cccccc;"">"
strTextoHtml = strTextoHtml & "<tr><td valign=top><BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/acs.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Login na administração da loja</B></FONT><hr size=1 color=#cccccc width=""99%"" align=left><br>"
strTextoHtml = strTextoHtml & "<table cellspacing=""0"" cellpadding=""2""><tr><td bgcolor=#eeeeee>"

If Len(Day(Date)) = 1 Then
dia = "0" & Day(Date)
Else
dia = Day(Date)
End If
If Len(Month(Date)) = 1 Then
mez = "0" & Month(Date)
Else
mez = Month(Date)
End If

strTextoHtml = strTextoHtml & "<center><FONT face=tahoma style=font-size:11px><img src=adm_imagens/ssl.gif width=13 height=15 hspace=0 vspace=0 border=0 align=absbottom>&nbsp; Seu IP é <b>" & Request.ServerVariables("remote_addr") & "</b> e seu HOST é <b>" & Request.ServerVariables("remote_host") & "</b>, são <b>" & Time & "</b> em <b>" & dia & "/" & mez & "/" & Year(Date) & "</b> , por medidas de segurança estas informações serão gravadas em nossa base de dados.</center></td></tr></table>"
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=top>"

If Request("login") = "erro" Then

strTextoHtml = strTextoHtml & "<center><font style=font-size:11px;font-family:tahoma;color:red><b>Autorização para login no administrador negada!</b></font></center><br><br>"

End If

strTextoHtml = strTextoHtml & "<table cellspacing=2 cellpadding=2 align=center style=""border-bottom: 1px solid #cccccc;border-left: 1px solid #cccccc;border-top: 1px solid #cccccc;border-right: 1px solid #cccccc""'>"
strTextoHtml = strTextoHtml & "<tr><form action=administrador.asp method=post><input name=acao type=hidden value=valida><input name=url type=hidden value=""" & Request.ServerVariables("query_string") & """><td colspan=2><FONT face=tahoma style=font-size:11px;font-family:tahoma><b>Login no administrador</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2><FONT face=tahoma style=font-size:10px;font-family:tahoma;color:000000>Esta é uma área de acesso restrito</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma style=font-size:11px;font-family:tahoma>Usuário:</td><td><input name=usr type=text style=font-size:11px;font-family:tahoma></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma style=font-size:11px;font-family:tahoma>Senha:</td><td><input name=sen type=password style=font-size:11px;font-family:tahoma></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td></td><td align=center><input type=submit value="" Entrar "" style=font-size:11px;font-family:tahoma> <input type=reset value=Cancelar style=font-size:11px;font-family:tahoma></td></tr>"
strTextoHtml = strTextoHtml & "</form></table>"
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=bottom>"
strTextoHtml = strTextoHtml & "<TABLE cellSpacing=2 cellPadding=2 width=""100%"" align=center bgcolor=#eeeeee border=0 valign=bottom>"
strTextoHtml = strTextoHtml & "<TBODY><TR><TD vAlign=bottom align=right width=""100%"">"
strTextoHtml = strTextoHtml & "<a href=""http://www.casadaweb.net"" target=_new style=text-decoration:none;><FONT face=tahoma style=font-size:11px><B>&copy; Casa da Web - Soluções em Marketing Digital&nbsp;</B></a></TD></TR></TBODY></TABLE>"
strTextoHtml = strTextoHtml & "</td></tr></table></td></tr></table>"

End Select

strTextoHtml = strTextoHtml & "</body>"
strTextoHtml = strTextoHtml & "</html>"

conexao.Close
Set conexao = Nothing
End Sub

'-----------------------------------------------------------------------------------
Sub ComprasASP()
If Request("acaba") = "sim" Then
Session("adm_descprod") = ""
Session("adm_email") = ""
End If
Select Case strAcao
Case "ver"

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/comp_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Administrar compras efetuadas na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<center>"
Call CalendarioASP
strTextoHtml = strTextoHtml & "<br><font face=tahoma style=font-size:11px>>> Datas em <font color=red>VERMELHO</font> indicam compras efetudadas no dia<<</center><table><tr><td height=7></td></tr></table><hr size=1 color=#cccccc>"

finalera = Request.QueryString("final")
pag = Request.QueryString("itens")
pesss = Trim(Request.QueryString("pesq"))
pagdxx = Request.QueryString("pagina")
pesqsa = Request.QueryString("pesqsa")
catege = Request("cat")
Mes = CStr(Trim(Request("mes")))
If Mes = "1" Or Mes = "01" Then
Mes = "janeiro"
End If
If Mes = "2" Or Mes = "02" Then
Mes = "fevereiro"
End If
If Mes = "3" Or Mes = "03" Then
Mes = "março"
End If
If Mes = "4" Or Mes = "04" Then
Mes = "abril"
End If
If Mes = "5" Or Mes = "05" Then
Mes = "maio"
End If
If Mes = "6" Or Mes = "06" Then
Mes = "junho"
End If
If Mes = "7" Or Mes = "07" Then
Mes = "julho"
End If
If Mes = "8" Or Mes = "08" Then
Mes = "agosto"
End If
If Mes = "9" Or Mes = "09" Then
Mes = "setembro"
End If
If Mes = "10" Then
Mes = "outubro"
End If
If Mes = "11" Then
Mes = "novembro"
End If
If Mes = "12" Then
Mes = "dezembro"
End If
If pesss = "" Then
pesss = "-"
palavra = Split(Trim("asdfghjklçqwertyuiopzxcvbnm"), " ")
Else
pesss = pesss
palavra = Split(Trim(Request.QueryString("pesq")), " ")
End If
If pag = "" Then
inicial = 0
final = 20
Else
inicial = pag
final = 20
End If
If pesqsa = "" Then
restinho = ""
catege = "todos"
Else
If catege = "todos" Or catege = "xxx" Or catege = "" Then
resto = ""
Else
resto = "idsessao = '" & catege & "' and"
End If
palavraz = Split(Trim(pesqsa), " ")
restinho = "WHERE " & resto & " nome LIKE '%" & palavraz(0) & "%'"
End If

If VersaoDb = 1 then
   Set rs = conexao.Execute("select * from compras where datacompra='" & Request("data") & "' AND status <> 'Compra em Aberto' LIMIT " & inicial & "," & final & ";")
else
   set rs = createobject("adodb.recordset")
   set rs.activeconnection = conexao
   rs.cursortype = 3
   rs.pagesize = final
   rs.open "select * from compras where datacompra='" & Request("data") & "' AND status <> 'Compra em Aberto'"
end if

If rs.EOF Or rs.bof Then

strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Compra(s) efetuada(s) em " & Request("dia") & " de " & Mes & " de " & Request("ano") & ": <b>0" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=""100%""><tr><td>"
strTextoHtml = strTextoHtml & "<table width=563 align=center>"
strTextoHtml = strTextoHtml & "<tr><td align=center><br><br><b><font style=font-size:11px><br>Nenhuma compra referente a este dia foi encontrada na base de dados da loja.<br><br></b><br><br></td></tr></table>"
strTextoHtml = strTextoHtml & "<br></table>"
strTextoHtml = strTextoHtml & "<table width=100% cellspacing=""0"" cellpadding=""0""><tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc width=""101%""></td></tr><tr><td></td><td align=right><font face=""tahoma"" style=font-size:11px;color:000000>"
strTextoHtml = strTextoHtml & "&nbsp;<font face=""tahoma"" style=font-size:11px>Página(s): <b><u>1</u></b></a></font></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table><td></tr></table>"

Else

Set rs2 = conexao.Execute("SELECT count(pedido) AS total FROM compras WHERE datacompra='" & Request("data") & "' AND status <> 'Compra em Aberto'")

totalreg = rs2("total")
rs2.Close
Set rs2 = Nothing
numiz = Request("pagina") & "0"
numiz = CInt(numiz) * 2
iz = iz + numiz

strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Compra(s) efetuada(s) em " & Request("dia") & " de " & Mes & " de " & Request("ano") & ": <b>" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=""100%""><tr><td>"

If Request("status") = "sucesso" Then

strTextoHtml = strTextoHtml & "<center><b><font style=font-size:11px;font-family:tahoma;color:#003366>COMPRA EXCLUÍDA COM SUCESSO!<br><br></font></b></center>"

Else
End If

strTextoHtml = strTextoHtml & "<table width=563 align=center>"

If VersaoDb = 1 then

While Not rs.EOF

iz = iz + 1
Select Case rs("estadoentrega")
Case "AC"
estadoz = "Acre"
Case "AL"
estadoz = "Alagoas"
Case "AP"
estadoz = "Amapá"
Case "AM"
estadoz = "Amazonas"
Case "BA"
estadoz = "Bahia"
Case "CE"
estadoz = "Ceará"
Case "DF"
estadoz = "Distrito Federal"
Case "ES"
estadoz = "Espirito Santo"
Case "GO"
estadoz = "Goiás"
Case "MA"
estadoz = "Maranhão"
Case "MT"
estadoz = "Mato Grosso"
Case "MS"
estadoz = "Mato Grosso do Sul"
Case "MG"
estadoz = "Minas Gerais"
Case "PA"
estadoz = "Pará"
Case "PB"
estadoz = "Paraiba"
Case "PR"
estadoz = "Parana"
Case "PE"
estadoz = "Pernambuco"
Case "PI"
estadoz = "Piauí"
Case "RJ"
estadoz = "Rio de Janeiro"
Case "RN"
estadoz = "Rio Grande do Norte"
Case "RS"
estadoz = "Rio Grande do Sul"
Case "RO"
estadoz = "Rondônia"
Case "RR"
estadoz = "Roraima"
Case "SC"
estadoz = "Santa Catarina"
Case "SP"
estadoz = "São Paulo"
Case "SE"
estadoz = "Sergipe"
Case "TO"
estadoz = "Tocantins"
End Select

on error resume next

Set rs3 = conexao.Execute("select * from clientes where email='" & rs("clienteid") & "';")

strTextoHtml = strTextoHtml & "<tr><td align=left valign=center>" & vbNewLine

strTextoHtml = strTextoHtml & "<script language=""javascript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function compra" & rs("idcompra") & "(){" & vbNewLine
strTextoHtml = strTextoHtml & "if (confirm('Você realmente deseja excluir esta compra?'))" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "window.location.href('?link=compras&acao=excluir&compra=" & rs("idcompra") & "&ano=" & Request("ano") & "&data=" & Request("data") & "&mes=" & Request("mes") & "&dia=" & Request("dia") & "');" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "else" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "}}" & vbNewLine
strTextoHtml = strTextoHtml & "</script>" & vbNewLine

strTextoHtml = strTextoHtml & "<table width=563 bgcolor=#eeeeee style='border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;'><tr><td valign=center><font face=""tahoma"" style=font-size:11px;color:000000>" & iz & ") Compra feita por: <b>" & UCase(Cripto(rs3("nome"),false)) & "</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Frete para: <b>" & estadoz & "</b> &nbsp;&nbsp;&nbsp;Total da compra: <font color=#b23c04><b>R$ " & FormatNumber(-1 + Cripto(rs("totalcompra"),false) + Cripto(rs("frete"),false) + 1, 2) & "</b></font></td><td align=right valign=center><font face=""tahoma"" style=font-size:11px;color:000000>Ação: <b><a href=?link=compras&acao=olhar&compra=" & rs("idcompra") & "&ano=" & Request("ano") & "&data=" & Request("data") & "&mes=" & Request("mes") & "&dia=" & Request("dia") & ">Ver</a></b> | <b><a href=""javascript: compra" & rs("idcompra") & "();"">Excluir</a></b>&nbsp;</td></tr></table> <table><tr><td height=4></td></tr></table>"

rs.movenext
pagn = inicial + 20
Wend
paga = pagn - 40

If totalreg Mod 20 <> 0 Then
valor = 1
Else
valor = 0
End If
pagina = Fix(totalreg / 20) + valor
pagina = Replace(pagina, ",", "")
pagdxx = pagdxx + 1
pagdxx = Replace(pagdxx, ",", "")
pagdxx2 = pagdxx - 2
pagdxx2 = Replace(pagdxx2, ",", "")
paga = Replace(paga, ",", "")
pagn = Replace(pagn, ",", "")
If pagdxx = "" Then pagdxx = 1
If pagina = "0" Then pagina = "1"

strTextoHtml = strTextoHtml & "</td></tr></table>"
strTextoHtml = strTextoHtml & "<table width=563>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<center>"

If paga < 0 Then
paga = 0
Else

strTextoHtml = strTextoHtml & "<a HREF=""?link=compras&acao=ver&ano=" & Request("ano") & "&data=" & Request("data") & "&mes=" & Request("mes") & "&dia=" & Request("dia") & "&itens=" & paga & "&pagina=" & pagdxx2 & "&pesqsa=" & pesqsa & "&cat=" & catege & """ style=""color:000000""><font face=""tahoma"" style=font-size:11px><b>Página Anterior</b></a></font>&nbsp;&nbsp;"

End If
If totalreg < final Or totalreg = 20 Or pagdxx = pagina Then
totalreg = ""
npc = 1
totalp = 1
Else
variavel1 = CStr(pagdxx + 1)
variavel2 = CStr(pagina)
variavel1 = Replace(variavel1, ",", "")
variavel2 = Replace(variavel2, ",", "")

strTextoHtml = strTextoHtml & "&nbsp;&nbsp;<a HREF=?link=compras&acao=ver&ano=" & Request("ano") & "&data=" & Request("data") & "&mes=" & Request("mes") & "&dia=" & Request("dia") & "&itens=" & pagn & "&pagina=" & pagdxx & "&pesqsa=" & pesqsa & "&cat=" & catege

If variavel1 = variavel2 Then
strTextoHtml = strTextoHtml & "&final=sim"
End If

strTextoHtml = strTextoHtml & " style=color:000000><font face=tahoma style=font-size:11px><b>Próxima página</b></a></font>"

End If

strTextoHtml = strTextoHtml & "</td></tr></table></td></tr></table></td></tr></table>"
strTextoHtml = strTextoHtml & "<table width=""100%"" cellspacing=""0"" cellpadding=""0""><tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc width=""101%""></td></tr><tr><td><font face=""tahoma"" style=font-size:11px;color:000000>Página <B>" & pagdxx & "</B> de <B>" & pagina & "</B></td><td align=right><font face=""tahoma"" style=font-size:11px;color:000000>"

If pagina = 1 Then
finalera = "sim"
End If
If pagina <> 1 Then
For i = 1 To pagina - 1
i = Replace(i, ",", "")
i2 = i - 1
i2 = Replace(i2, ",", "")
fator = 20
totalfator = fator * i - 20
totalfator = Replace(totalfator, ",", "")
paginadem = pagdxx
paginadem = Replace(paginadem, ",", "")

strTextoHtml = strTextoHtml & "&nbsp;<a HREF=?link=compras&acao=ver&ano=" & Request("ano") & "&data=" & Request("data") & "&mes=" & Request("mes") & "&dia=" & Request("dia") & "&itens=" & totalfator & "&pagina=" & i2 & "&pesqsa=" & pesqsa & "&cat=" & catege & " style=color:000000><font face=tahoma style=font-size:11px>"

If paginadem = i Then
strTextoHtml = strTextoHtml & "<b><u>"
End If

strTextoHtml = strTextoHtml & Replace(i, ",", "") & "</u></b></a> &middot;</font>"

Next
End If
pagina2 = pagina * 20 - 20
pagina2 = Replace(pagina2, ",", "")
pagina3 = pagina - 1
pagina3 = Replace(pagina3, ",", "")

strTextoHtml = strTextoHtml & "&nbsp;<a HREF=""?link=compras&acao=ver&ano=" & Request("ano") & "&data=" & Request("data") & "&mes=" & Request("mes") & "&dia=" & Request("dia") & "&itens=" & pagina2 & "&pagina=" & pagina3 & "&pesqsa=" & pesqsa & "&cat=" & catege & "&final=sim"" style=""color:000000""><font face=""tahoma"" style=font-size:11px>"

If finalera = "sim" Then
strTextoHtml = strTextoHtml & "<b><u>"
End If

strTextoHtml = strTextoHtml & pagina & "</u></b></a></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font><br><br></td></tr></table>"

else

pag = request.querystring("pagina")
if pag = "" Then
   pag = 1
end if

contador = 0
rs.absolutepage = pag
while not rs.eof and contador < rs.pagesize
contador = contador +1

iz = iz + 1
Select Case rs("estadoentrega")
Case "AC"
estadoz = "Acre"
Case "AL"
estadoz = "Alagoas"
Case "AP"
estadoz = "Amapá"
Case "AM"
estadoz = "Amazonas"
Case "BA"
estadoz = "Bahia"
Case "CE"
estadoz = "Ceará"
Case "DF"
estadoz = "Distrito Federal"
Case "ES"
estadoz = "Espirito Santo"
Case "GO"
estadoz = "Goiás"
Case "MA"
estadoz = "Maranhão"
Case "MT"
estadoz = "Mato Grosso"
Case "MS"
estadoz = "Mato Grosso do Sul"
Case "MG"
estadoz = "Minas Gerais"
Case "PA"
estadoz = "Pará"
Case "PB"
estadoz = "Paraiba"
Case "PR"
estadoz = "Parana"
Case "PE"
estadoz = "Pernambuco"
Case "PI"
estadoz = "Piauí"
Case "RJ"
estadoz = "Rio de Janeiro"
Case "RN"
estadoz = "Rio Grande do Norte"
Case "RS"
estadoz = "Rio Grande do Sul"
Case "RO"
estadoz = "Rondônia"
Case "RR"
estadoz = "Roraima"
Case "SC"
estadoz = "Santa Catarina"
Case "SP"
estadoz = "São Paulo"
Case "SE"
estadoz = "Sergipe"
Case "TO"
estadoz = "Tocantins"
End Select

on error resume next

Set rs3 = conexao.Execute("select * from clientes where email='" & rs("clienteid") & "';")

strTextoHtml = strTextoHtml & "<tr><td align=left valign=center>" & vbNewLine
strTextoHtml = strTextoHtml & "<script language=""javascript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function compra" & rs("idcompra") & "(){" & vbNewLine
strTextoHtml = strTextoHtml & "if (confirm('Você realmente deseja excluir esta compra?'))" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "window.location.href('?link=compras&acao=excluir&compra=" & rs("idcompra") & "&ano=" & Request("ano") & "&data=" & Request("data") & "&mes=" & Request("mes") & "&dia=" & Request("dia") & "');" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "else" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "}}" & vbNewLine
strTextoHtml = strTextoHtml & "</script>" & vbNewLine
strTextoHtml = strTextoHtml & "<table width=563 bgcolor=#eeeeee style='border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;'><tr><td valign=center><font face=""tahoma"" style=font-size:11px;color:000000>" & iz & ") Compra feita por: <b>" & UCase(Cripto(rs3("nome"),false)) & "</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Frete para: <b>" & estadoz & "</b> &nbsp;&nbsp;&nbsp;Total da compra: <font color=#b23c04><b>R$ " & FormatNumber(-1 + Cripto(rs("totalcompra"),false) + Cripto(rs("frete"),false) + 1, 2) & "</b></font></td><td align=right valign=center><font face=""tahoma"" style=font-size:11px;color:000000>Ação: <b><a href=?link=compras&acao=olhar&compra=" & rs("idcompra") & "&ano=" & Request("ano") & "&data=" & Request("data") & "&mes=" & Request("mes") & "&dia=" & Request("dia") & ">Ver</a></b> | <b><a href=""javascript: compra" & rs("idcompra") & "();"">Excluir</a></b>&nbsp;</td></tr></table> <table><tr><td height=4></td></tr></table>"

rs.movenext
wend

strTextoHtml = strTextoHtml & "<center><br>"

strTextoHtml = strTextoHtml & "<table width=100% cellspacing=""0"" cellpadding=""0""><tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc width=""101%""></td></tr><tr><td colspan=2 align=right><font face=""tahoma"" style=font-size:11px;color:000000>"

strTextoHtml = strTextoHtml & "Página(s):&nbsp;&nbsp;"

for i = 1 to rs.pagecount

if i = cint(pag) then
   strTextoHtml = strTextoHtml & "<u><b>" & i & "</b></u> "
else
   strTextoHtml = strTextoHtml & "<a href='?link=compras&acao=ver&ano=" & Request("ano") & "&data=" & Request("data") & "&mes=" & Request("mes") & "&dia=" & Request("dia") & "&acaba=sim&pagina=" & i & "'>" & i & "</a> "
end if

next

strTextoHtml = strTextoHtml & "</td></tr><tr><td colspan=2><hr size=1 color=cccccc width=""101%""></td></tr></table></table></table></table>"
end if

rs.Close
Set rs = Nothing
End If
Case "excluir"
notz = Request.QueryString("compra")
Set dados = conexao.Execute("delete from compras where idcompra=" & notz & ";")
Response.Redirect "?link=compras&acao=ver&ano=" & Request("ano") & "&data=" & Request("data") & "&mes=" & Request("mes") & "&dia=" & Request("dia") & "&status=sucesso"
Case "olhar"
If VersaoDb = 1 then
   Set rs = conexao.Execute("select * from compras where idcompra='" & Request("compra") & "';")
   Set rs3 = conexao.Execute("select clienteid, nome, email from clientes where email='" & rs("clienteid") & "';")
else
   Set rs = conexao.Execute("select * from compras where idcompra=" & Request("compra"))
   Set rs3 = conexao.Execute("select * from clientes where email='" & rs("clienteid") & "'")
end if

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/comp_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Ver detalhes da compra efetuada na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<center><FONT face=tahoma  style=font-size:11px><b><A href=""?link=compras&acao=ver&acaba=sim&dia=" & Request("dia") & "&mes=" & Request("mes") & "&ano=" & Request("ano") & "&data=" & Request("data") & """>Voltar e ver mais compras</a></b></center>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc>"
strTextoHtml = strTextoHtml & "<FONT face=tahoma color=#000000 style=font-size:11px>Compra efetuada pelo cliente: <b><a href=""?link=clientes&acao=olhar&cli=" & rs3("clienteid") & """>" & Cripto(rs3("nome"),False) & "</a></b><br>"
strTextoHtml = strTextoHtml & "<FONT face=tahoma color=#000000 style=font-size:11px>Pedido n<sup>o</sup> : <b>#" & rs("pedido") & "</b><br><br>"

Select Case rs("estadoentrega")
Case "AC"
estadoz = "Acre"
Case "AL"
estadoz = "Alagoas"
Case "AP"
estadoz = "Amapá"
Case "AM"
estadoz = "Amazonas"
Case "BA"
estadoz = "Bahia"
Case "CE"
estadoz = "Ceará"
Case "DF"
estadoz = "Distrito Federal"
Case "ES"
estadoz = "Espirito Santo"
Case "GO"
estadoz = "Goiás"
Case "MA"
estadoz = "Maranhão"
Case "MT"
estadoz = "Mato Grosso"
Case "MS"
estadoz = "Mato Grosso do Sul"
Case "MG"
estadoz = "Minas Gerais"
Case "PA"
estadoz = "Pará"
Case "PB"
estadoz = "Paraiba"
Case "PR"
estadoz = "Parana"
Case "PE"
estadoz = "Pernambuco"
Case "PI"
estadoz = "Piauí"
Case "RJ"
estadoz = "Rio de Janeiro"
Case "RN"
estadoz = "Rio Grande do Norte"
Case "RS"
estadoz = "Rio Grande do Sul"
Case "RO"
estadoz = "Rondônia"
Case "RR"
estadoz = "Roraima"
Case "SC"
estadoz = "Santa Catarina"
Case "SP"
estadoz = "São Paulo"
Case "SE"
estadoz = "Sergipe"
Case "TO"
estadoz = "Tocantins"
End Select

strTextoHtml = strTextoHtml & "<b>STAUS DA COMPRA EFETUADA:</b><hr size=1 color=000000>"
strTextoHtml = strTextoHtml & "<table width=""100%""><tr><td><font face=tahoma style=font-size:11px;color:000000>Status da compra:</td><td align=right><font face=tahoma style=font-size:11px;color:000000><form action=""?"" method=get><input name=""link"" type=""hidden"" value=""compras""><input name=""acao"" type=""hidden"" value=""modificar""><input name=""compra"" type=""hidden"" value=""" & Request("compra") & """><input name=""dia"" type=""hidden"" value=""" & Request("dia") & """><input name=""data"" type=""hidden"" value=""" & Request("data") & """><input name=""mes"" type=""hidden"" value=""" & Request("mes") & """><input name=""ano"" type=""hidden"" value=""" & Request("ano") & """><select name=""status"" style=font-size:11px;color:000000;font-family:tahoma;font-weight:bold>"

strTextoHtml = strTextoHtml & "<option value=""0"" "
If CStr(rs("status")) = CStr("0") Then
strTextoHtml = strTextoHtml & "style='color:b23c04' SELECTED"
End If
strTextoHtml = strTextoHtml & ">Pedido recebido pela " & nomeloja & ""

strTextoHtml = strTextoHtml & "<option value=""1"" "
If CStr(rs("status")) = CStr("1") Then
strTextoHtml = strTextoHtml & "style='color:b23c04' SELECTED"
End If
strTextoHtml = strTextoHtml & ">Pedido em processamento"

strTextoHtml = strTextoHtml & "<option value=""2"" "
If CStr(rs("status")) = CStr("2") Then
strTextoHtml = strTextoHtml & "style='color:b23c04' SELECTED"
End If
strTextoHtml = strTextoHtml & ">Compra já enviada ao cliente"

strTextoHtml = strTextoHtml & "<option value=""3"" "
If CStr(rs("status")) = CStr("3") Then
strTextoHtml = strTextoHtml & "style='color:b23c04' SELECTED"
End If
strTextoHtml = strTextoHtml & ">Compra Já Entregue"

strTextoHtml = strTextoHtml & "<option value=""4"" "
If CStr(rs("status")) = CStr("4") Then
strTextoHtml = strTextoHtml & "style='color:b23c04' SELECTED"
End If
strTextoHtml = strTextoHtml & ">Compra Cancelada"

strTextoHtml = strTextoHtml & "<option value=""5"" "
If CStr(rs("status")) = CStr("5") Then
strTextoHtml = strTextoHtml & "style='color:b23c04' SELECTED"
End If
strTextoHtml = strTextoHtml & ">Compra Negada"
 
 strTextoHtml = strTextoHtml & "<option value=""6"" "
If CStr(rs("status")) = CStr("6") Then
strTextoHtml = strTextoHtml & "style='color:b23c04' SELECTED"
End If
strTextoHtml = strTextoHtml & ">Outras - Contate o Atendimento"
 
strTextoHtml = strTextoHtml & "</select> <input type=""submit"" style=font-size:11px;color:000000;font-family:tahoma value=""Modificar""></td></tr></table>"
strTextoHtml = strTextoHtml & "<br><b>DADOS PARA ENTREGA DO PEDIDO:</b><hr size=1 color=000000><table width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><td bgcolor=#eeeeee><FONT face=tahoma color=#000000 style=font-size:11px>Data da compra: </b></td><td  bgcolor=#eeeeee> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & rs("datacompra") & "</b></td></tr>"

estimativa = CDate(rs("datacompra")) + 10
If Mid(estimativa, 2, 1) = "/" Then
estimativa = "0" & estimativa
Else
estimativa = estimativa
End If
If Mid(estimativa, 5, 1) = "/" Then
estimativa = Mid(estimativa, 1, 3) & "0" & Mid(estimativa, 4, 99)
Else
estimativa = estimativa
End If

strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma color=#000000 style=font-size:11px>Estimativa para entrega: </b></td><td> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & estimativa & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td bgcolor=#eeeeee><FONT face=tahoma color=#000000 style=font-size:11px>Endereço:</b></td><td bgcolor=#eeeeee> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & Cripto(rs("endentrega"),false) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma color=#000000 style=font-size:11px>Bairro:</b></td><td> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & Cripto(rs("bairroentrega"),false) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td bgcolor=#eeeeee><FONT face=tahoma color=#000000 style=font-size:11px>Cidade:</b></td><td bgcolor=#eeeeee> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & Cripto(rs("cidadeentrega"),false) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma color=#000000 style=font-size:11px>Estado: </b></td><td> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & estadoz & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td bgcolor=#eeeeee><FONT face=tahoma color=#000000 style=font-size:11px>País: </b></td><td bgcolor=#eeeeee> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>Brasil</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma color=#000000 style=font-size:11px>CEP: </b></td><td> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & Cripto(rs("cepentrega"),false) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td bgcolor=#eeeeee><FONT face=tahoma color=#000000 style=font-size:11px>Telefone: </b></td><td bgcolor=#eeeeee> <FONT face=tahoma color=#b23c04 style=font-size:11px><b>" & Cripto(rs("telentrega"),false) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "</table><br>"
strTextoHtml = strTextoHtml & "<b>DADOS DA COMPRA E PAGAMENTO:</b><hr size=1 color=000000>"
strTextoHtml = strTextoHtml & "<table width=""100%"">"
strTextoHtml = strTextoHtml & "</form><tr><td bgcolor=003366><font face=tahoma style=font-size:11px;color:ffffff>&nbsp;Cód.</b></td>"
strTextoHtml = strTextoHtml & "<td bgcolor=003366><font face=tahoma style=font-size:11px;color:ffffff>&nbsp;Produto</b></td>"
strTextoHtml = strTextoHtml & "<td bgcolor=003366><font face=tahoma style=font-size:11px;color:ffffff>&nbsp;Quant.</b></td>"
strTextoHtml = strTextoHtml & "<td bgcolor=003366><font face=tahoma style=font-size:11px;color:ffffff>&nbsp;Valor Unit.</b></td>"
strTextoHtml = strTextoHtml & "<td bgcolor=003366><font face=tahoma style=font-size:11px;color:ffffff>&nbsp;Valor Total</b></td>"
strTextoHtml = strTextoHtml & "</tr>"


Set rs10 = conexao.execute("SELECT * FROM pedidos WHERE idcompra = '" & Request("compra") & "';")
If rs10.EOF Then
Else
While Not rs10.EOF

Set prod = conexao.Execute("select * from produtos where idprod = " & rs10("idprod") & ";")
If prod.bof Or prod.EOF Then
strTextoHtml = strTextoHtml & "<tr><td align=center><font face=tahoma style=font-size:11px;color:000000>#</td><td colspan=4><font face=tahoma style=font-size:11px;color:000000>O produto comprado não estão mais presente na loja</b></center>"
Else
codigo = prod("idprod")
prodnome = prod("nome")
preconormal = prod("preco")
quantidade = rs10("quantidade")
subpreco = FormatNumber(preconormal, 2)
totpreco = FormatNumber((quantidade * preconormal), 2)

strTextoHtml = strTextoHtml & "<tr><td align=center><font face=tahoma style=font-size:11px;color:000000>" & codigo & "</td>"
strTextoHtml = strTextoHtml & "<td><font face=tahoma style=font-size:11px;color:000000>" & prodnome & "</td>"
strTextoHtml = strTextoHtml & "<td align=center><font face=tahoma style=font-size:11px;color:000000>" & quantidade & "</td>"
strTextoHtml = strTextoHtml & "<td align=right><font face=tahoma style=font-size:11px;color:000000>R$ " & subpreco & "</td>"
strTextoHtml = strTextoHtml & "<td align=right><font face=tahoma style=font-size:11px;color:000000>R$ " & totpreco & "</td></tr>"
End if
rs10.movenext
Wend
rs10.Close
End If

totalcompra = Cripto(rs("totalcompra"),false)
totalfrete = Cripto(rs("frete"),false)
Status = rs("status")
pagamento = rs("pagamentovia")
intcomprasz = totalcompra + 1 + totalfrete - 1
comprasz = intcomprasz
comprasz = Replace(comprasz, "-", "")
data = rs("datacompra")
Select Case pagamento
Case "0"
ver = "Cartão de Crédito - Visa"
Case "1"
ver = "Cartão de Crédito - Mastercard"
Case "2"
ver = "Cartão de Crédito - Dinners"
Case "3"
ver = "Cartão de Crédito - American Express"
Case "4"
ver = "SEDEX à cobrar"
Case "5"
ver = "Deopósito Bancário"
Case "6"
ver = "Transferência Eletrônica"
Case "7"
ver = "Boleto Bancário"

End Select
If Status = "0" Then
estatus = "Pedido recebido pela " & nomeloja
If pagamento = "0" And pagamento = "1" And pagamento = "2" And pagamento = "3" And pagamento = "4" Then
ver2 = "Pagamento confirmado com a operdora do cartão de credito"
Else
ver2 = "Aguardando confirmação"
End If
End If
If Status = "1" Then
estatus = "Pedido em processamento"
If pagamento = "0" And pagamento = "1" And pagamento = "2" And pagamento = "3" And pagamento = "4" Then
ver2 = "Pagamento confirmado com a operdora do cartão de credito"
Else
ver2 = "Pagamento confirmado"
End If
End If
If Status = "2" Then
estatus = "Compra já enviada ao cliente"
ver2 = "Pagamento já efetuado"
End If
If Status = "3" Then
estatus = "Compra Já Entregue"
ver2 = "Pagamento já efetuado"
End If
If Status = "4" Then
estatus = "Compra Cancelada"
ver2 = "Pagamento cancelado"
End If
If Status = "5" Then
estatus = "Compra Negada"
ver2 = "Pagamento cancelado"
End If
If Status = "6" Then
estatus = "Outras - Contate o Atendimento"
ver2 = "Pagamento cancelado"
End If
comprazw = FormatNumber(comprasz, 2)
totalfretezw = FormatNumber(totalfrete, 2)
totalcomprazw = FormatNumber(totalcompra, 2)

select case pagamento
case 0,1,2,3
   strInf = "<tr><td><font face=tahoma style=font-size:11px;color:000000>Número do Cartão</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>" & Cripto(rs("numero"),false) & "</b></td>"
   strInf = strInf & "<tr><td><font face=tahoma style=font-size:11px;color:000000>Vencimento</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>" & Cripto(rs("vencimento"),false) & "</b></td>"
   strInf = strInf & "<tr><td><font face=tahoma style=font-size:11px;color:000000>Titular do Cartão</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>" & Cripto(rs("titular"),false) & "</b></td>"   
case else
   strInf = ""
end select

strTextoHtml = strTextoHtml & "</table><hr size=1 color=cccccc width=""100%""><table width=""100%""><tr><td><font face=tahoma style=font-size:11px;color:000000>Sub-total</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>R$ " & totalcomprazw & "</b></td>"
strTextoHtml = strTextoHtml & "</tr></table><table width=""100%""><tr><td><font face=tahoma style=font-size:11px;color:000000>Frete</td>"
strTextoHtml = strTextoHtml & "<td align=right><font face=tahoma style=font-size:11px;color:000000><b>R$ " & totalfretezw & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><font face=tahoma style=font-size:11px;color:000000>Valor total da compra</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>R$ " & comprazw & "</b></td>"
strTextoHtml = strTextoHtml & "</tr></table><hr size=1 color=cccccc width=""100%""><table width=""100%""><tr><td><font face=tahoma style=font-size:11px;color:000000>Forma de Pagamento</td><td align=right><font face=tahoma style=font-size:11px;color:b23c04><b>" & ver & "</b></td></tr>" & strInf
strTextoHtml = strTextoHtml & "<tr><td><font face=tahoma style=font-size:11px;color:000000>Status</td><td align=right><font face=tahoma style=font-size:11px;color:000000><b>" & ver2 & "</b></td></tr></table>"
strTextoHtml = strTextoHtml & "<center><br><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br>"

Case "modificar"
notz = Request.QueryString("compra")
Status = Request.QueryString("status")
Set dados = conexao.Execute("UPDATE compras SET status = '" & Status & "' WHERE idcompra = " & notz & ";")
Response.Redirect "?link=compras&acao=olhar&compra=" & notz & "&data=" & Request("data") & "&ano=" & Request("ano") & "&dia=" & Request("dia") & "&mes=" & Request("mes")
Case Else
Response.Redirect "?acaba=sim"
End Select

End Sub

'-----------------------------------------------------------------------------------
Function MesExtenso(Mes)
Select Case Mes
Case 1
MesExtenso = "Janeiro"
Case 2
MesExtenso = "Fevereiro"
Case 3
MesExtenso = "Março"
Case 4
MesExtenso = "Abril"
Case 5
MesExtenso = "Maio"
Case 6
MesExtenso = "Junho"
Case 7
MesExtenso = "Julho"
Case 8
MesExtenso = "Agosto"
Case 9
MesExtenso = "Setembro"
Case 10
MesExtenso = "Outubro"
Case 11
MesExtenso = "Novembro"
Case 12
MesExtenso = "Dezembro"
End Select
End Function

'-----------------------------------------------------------------------------------
Function DiaSemana(iDia)
Select Case iDia
Case 0
DiaSemana = "Dom"
Case 1
DiaSemana = "Seg"
Case 2
DiaSemana = "Ter"
Case 3
DiaSemana = "Qua"
Case 4
DiaSemana = "Qui"
Case 5
DiaSemana = "Sex"
Case 6
DiaSemana = "Sab"
End Select
End Function

'-----------------------------------------------------------------------------------
Function nSemanas(Mes, Ano)
DtInicial = DateSerial(Ano, Mes, fDia)
If Weekday(DtInicial) = 1 Then
nSem = 0
Else
nSem = 1
End If
ndiasmes = aDiasMes(Mes)
For i = 1 To ndiasmes
If Weekday(DtInicial) = 1 Then
nSem = nSem + 1
End If
DtInicial = DateAdd("d", 1, DtInicial)
Next
nSemanas = nSem
End Function

'-----------------------------------------------------------------------------------
Sub SetBissexto()
mezito = Request("mes")
anito = Request("ano")
If mezito = "" Then
mezito = Month(Now)
End If
If anito = "" Then
anito = Year(Now)
End If
data = "1/" & mezito & "/" & anito
If Trim(data) = "" Then
data = Date
Else
data = CDate(data)
End If
Ano = Year(data)
If (Ano Mod 4 = 0) Or (Ano Mod 100 = 0) And (Ano Mod 400 = 0) Then
aDiasMes(2) = 29
Else
aDiasMes(2) = 28
End If
End Sub

'-----------------------------------------------------------------------------------
Sub CalendarioASP()
strTextoHtml = strTextoHtml & "<Font Face=tahoma style=font-size:11px><B>Selecione pela data as compras que você deseja visualizar:</B></Font>"
strTextoHtml = strTextoHtml & "<table><tr><td height=6></td></tr></table>"
fDia = 1
ReDim aDiasMes(12)
aDiasMes(1) = 31
aDiasMes(2) = 28
aDiasMes(3) = 31
aDiasMes(4) = 30
aDiasMes(5) = 31
aDiasMes(6) = 30
aDiasMes(7) = 31
aDiasMes(8) = 31
aDiasMes(9) = 30
aDiasMes(10) = 31
aDiasMes(11) = 30
aDiasMes(12) = 31
Call SetBissexto
Call MontaCalendario
End Sub

'-----------------------------------------------------------------------------------
Sub MontaCalendario()
mezito = Request("mes")
anito = Request("ano")
If mezito = "" Then
mezito = Month(Now)
End If
If anito = "" Then
anito = Year(Now)
End If
data = "1/" & mezito & "/" & anito
If Trim(data) = "" Then
data = Date
Else
data = CDate(data)
End If

Ano = Year(data)
Mes = Month(data)
DiaInicial = Weekday(DateSerial(Ano, Mes, fDia))
DtInicial = DateSerial(Ano, Mes, fDia)

strTextoHtml = strTextoHtml & "<table border=""0"" cellpading=""0"" cellspacing=""0"">" & vbCrLf
strTextoHtml = strTextoHtml & "<tr>"
For j = 0 To 6
If j = 0 Then
strTextoHtml = strTextoHtml & "<td align=""center"" width=""28"" height=22 style='border-bottom: 1px solid #cccccc;border-left: 1px solid #cccccc;border-top: 1px solid #cccccc;' bgcolor=""#003366""><font style=font-size:10px;font-family:tahoma;color:ffffff><b>" & DiaSemana(j) & "</b></div></td>" & vbCrLf
Else
strTextoHtml = strTextoHtml & "<td align=""center"" width=""28"" height=22 style='border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc;' bgcolor=""#003366""><font style=font-size:10px;font-family:tahoma;color:ffffff><b>" & DiaSemana(j) & "</b></td>" & vbCrLf
End If
Next
strTextoHtml = strTextoHtml & "</tr>"

For i = 0 To (nSemanas(Month(DtInicial), Year(DtInicial)) - 1)
strTextoHtml = strTextoHtml & "<tr>" & vbCrLf
For j = 0 To 6
If (DiaInicial - 1) > j And i = 0 Then
If j = 0 And i = 0 Then
strTextoHtml = strTextoHtml & "<td height=20 style='border-right: 1px solid #cccccc;border-bottom: 1px solid #cccccc;border-left: 1px solid #cccccc;'>&nbsp;</div></td>" & vbCrLf
Else
strTextoHtml = strTextoHtml & "<td height=20 style='border-right: 1px solid #cccccc;border-bottom: 1px solid #cccccc;'>&nbsp;</td>" & vbCrLf
End If
Else
If Month(DtInicial) > Mes Or Year(DtInicial) > Ano Then
strTextoHtml = strTextoHtml & "<td height=20 style='border-right: 1px solid #cccccc;border-bottom: 1px solid #cccccc;'>&nbsp;</td>" & vbCrLf
Else
If Weekday(DtInicial) = 1 Then
If CStr(Len(Day(DtInicial))) = CStr("1") Then
diazz = "0" & Day(DtInicial)
Else
diazz = Day(DtInicial)
End If
If CStr(Len(Month(DtInicial))) = CStr("1") Then
meszz = "0" & Month(DtInicial)
Else
meszz = Month(DtInicial)
End If
dataz = diazz & "/" & meszz & "/" & Year(DtInicial)
set rs = conexao.execute("select * from compras where datacompra='" & dataz & "' AND status <> 'Compra em Aberto';")
if rs.eof then
varvialvelcompra = "#000000"
else
varvialvelcompra = "red"
end if
rs.close
set rs = nothing
strTextoHtml = strTextoHtml & "<a href=""?link=compras&acao=ver&dia=" & Day(DtInicial) & "&data=" & dataz & "&ano=" & Year(DtInicial) & "&mes=" & Month(DtInicial) & """><td height=20  style=""border-left: 1px solid #ccccc;border-right: 1px solid #cccccc;border-bottom: 1px solid #cccccc;"" align=center onMouseOver=""mOvr(this,'eeeeee');"" onMouseOut=""mOut(this,'ffffff');""><font style=font-size:10px;font-family:tahoma;color:" & varvialvelcompra & ">"

If CStr(Request("dia")) = CStr(Day(DtInicial)) Then
strTextoHtml = strTextoHtml & "<B>" & Day(DtInicial) & "</b>"
Else
strTextoHtml = strTextoHtml & Day(DtInicial)
End If

strTextoHtml = strTextoHtml & "</td></a>"
Else

If DtInicial = Date Then
If CStr(Len(Day(DtInicial))) = CStr("1") Then
diazz = "0" & Day(DtInicial)
Else
diazz = Day(DtInicial)
End If
If CStr(Len(Month(DtInicial))) = CStr("1") Then
meszz = "0" & Month(DtInicial)
Else
meszz = Month(DtInicial)
End If
dataz = diazz & "/" & meszz & "/" & Year(DtInicial)
set rs = conexao.execute("select * from compras where datacompra='" & dataz & "' AND status <> 'Compra em Aberto';")
if rs.eof then
varvialvelcompra = "#000000"
else
varvialvelcompra = "red"
end if
rs.close
set rs = nothing
strTextoHtml = strTextoHtml & "<a href=""?link=compras&acao=ver&dia=" & Day(DtInicial) & "&data=" & dataz & "&ano=" & Year(DtInicial) & "&mes=" & Month(DtInicial) & """><td height=20  style=""border-left: 1px solid #ccccc;border-right: 1px solid #cccccc;border-bottom: 1px solid #cccccc;"" align=center onMouseOver=""mOvr(this,'eeeeee');"" onMouseOut=""mOut(this,'ffffff');""><font style=font-size:10px;font-family:tahoma;color:" & varvialvelcompra & ">"

If CStr(Request("dia")) = CStr(Day(DtInicial)) Then
strTextoHtml = strTextoHtml & "<B>" & Day(DtInicial) & "</b>"
Else
strTextoHtml = strTextoHtml & Day(DtInicial)
End If

strTextoHtml = strTextoHtml & "</td></a>"
Else
If CStr(Len(Day(DtInicial))) = CStr("1") Then
diazz = "0" & Day(DtInicial)
Else
diazz = Day(DtInicial)
End If
If CStr(Len(Month(DtInicial))) = CStr("1") Then
meszz = "0" & Month(DtInicial)
Else
meszz = Month(DtInicial)
End If
dataz = diazz & "/" & meszz & "/" & Year(DtInicial)
set rs = conexao.execute("select * from compras where datacompra='" & dataz & "' AND status <> 'Compra em Aberto';")
if rs.eof then
varvialvelcompra = "#000000"
else
varvialvelcompra = "red"
end if
rs.close
set rs = nothing

strTextoHtml = strTextoHtml & "<a href=""?link=compras&acao=ver&dia=" & Day(DtInicial) & "&data=" & dataz & "&ano=" & Year(DtInicial) & "&mes=" & Month(DtInicial) & """><td height=20  style=""border-left: 1px solid #ccccc;border-right: 1px solid #cccccc;border-bottom: 1px solid #cccccc;"" align=center onMouseOver=""mOvr(this,'eeeeee');"" onMouseOut=""mOut(this,'ffffff');""><font style=font-size:10px;font-family:tahoma;color:" & varvialvelcompra & ">"

If CStr(Request("dia")) = CStr(Day(DtInicial)) Then
strTextoHtml = strTextoHtml & "<B>" & Day(DtInicial) & "</b>"
Else
strTextoHtml = strTextoHtml & Day(DtInicial)
End If

strTextoHtml = strTextoHtml & "</td></a>"

End If
End If
End If
DtInicial = DateAdd("d", DtInicial, 1)
End If
Next
strTextoHtml = strTextoHtml & "</tr>" & vbCrLf
Next
strTextoHtml = strTextoHtml & "<TR><TD align=center valign=center height=35 colspan=7 style='border-bottom: 1px solid #cccccc;border-left: 1px solid #cccccc;border-right: 1px solid #cccccc'>"
Call DisplaySelectDate
strTextoHtml = strTextoHtml & "</TD></TR></Form>"
strTextoHtml = strTextoHtml & "</table>" & vbCrLf
End Sub

'-----------------------------------------------------------------------------------
Sub DisplaySelectDate()
strTextoHtml = strTextoHtml & "<Form method=get><input name=link type=hidden value=compras><input name=acao type=hidden value=ver><font style=font-size:10px;font-family:tahoma> "
Call MonthCombo
Call YearCombo
strTextoHtml = strTextoHtml & " <input type=submit value=' Ver ' style=font-size:10px;font-family:tahoma>"
End Sub

Sub MonthCombo()
mezito = Request("mes")
If mezito = "" Then
mezito = Month(Now)
Else
mezito = mezito
End If
strTextoHtml = strTextoHtml & "<input name=dia type=hidden value=1><select name='mes' style=font-size:10px;font-family:tahoma><Option value=1"
If mezito = "1" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Janeiro</Option><Option value=2"

If mezito = "2" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Fevereiro</Option><Option value=3"

If mezito = "3" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Março</Option><Option value=4"

If mezito = "4" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Abril</Option><Option value=5"

If mezito = "5" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Maio</Option><Option value=6"

If mezito = "6" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Junho</Option><Option value=7"

If mezito = "7" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Julho</Option><Option value=8"

If mezito = "8" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Agosto</Option><Option value=9"

If mezito = "9" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Setembro</Option><Option value=10"

If mezito = "10" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Outubro</Option><Option value=11"

If mezito = "11" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Novembro</Option><Option value=12"

If mezito = "12" Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">Dezembro</Option></select>"
End Sub

Sub YearCombo()
anozinho = Request("ano")
If anozinho = "" Then
anozinho = Year(Now)
Else
anozinho = anozinho
End If
strTextoHtml = strTextoHtml & " de <select name=ano style=font-size:10px;font-family:tahoma>"
For i = 2002 To 2015
strTextoHtml = strTextoHtml & "<Option value=" & i
If CStr(i) = CStr(anozinho) Then
strTextoHtml = strTextoHtml & " selected"
End If
strTextoHtml = strTextoHtml & ">" & i & "</Option>"
 Next
 strTextoHtml = strTextoHtml & "</select>"
End Sub

Sub DepartamentosASP()
If Request("acaba") = "sim" Then
Session("adm_descprod") = ""
Session("adm_email") = ""
End If
Select Case strAcao
Case "inserir"


strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/dep_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Incluir novo departamento na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<form method=post action=""administrador.asp?link=dep&acao=gravanovo"">"
strTextoHtml = strTextoHtml & "<table align=center width=""90%"">"

varimg = "&nbsp;<img src='adm_imagens/xis.gif' width='15' height='16' border='0' align='absmiddle'>"

strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Data:</b></td><td><FONT face=tahoma  style=font-size:11px>" & dia & "/" & mez & "/" & Year(Date) & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td width=""40%""><FONT face=tahoma  style=font-size:11px><b>Departamento:</b></td><td><input name=""nomedep"" type=""text"" value="""

If Request.QueryString("erro1") <> "sim" Then
strTextoHtml = strTextoHtml & Request.QueryString("erro1")
End If

strTextoHtml = strTextoHtml & """ size=50  style=font-size:11px;font-family:tahoma>"

If Request.QueryString("erro1") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If

strTextoHtml = strTextoHtml & "</td></tr><tr><td><FONT face=tahoma  style=font-size:11px><b>Descrição (opcional):</b></td><td><textarea name=""descri"" rows=5 cols=55 style=font-size:11px;font-family:tahoma>" & Request.QueryString("erro3") & "</textarea></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Visível:</b></td><td><select name=""ver"" style=font-size:11px;font-family:tahoma><option value=""s"" "

If CStr(Request.QueryString("erro2")) = "s" Then
strTextoHtml = strTextoHtml & "selected"
End If

strTextoHtml = strTextoHtml & ">Sim<option value=""n"" "

If CStr(Request.QueryString("erro2")) = "n" Then
strTextoHtml = strTextoHtml & "selected"
End If

strTextoHtml = strTextoHtml & ">Não</select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center height=15></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td align=center></td><td align=center>&nbsp;&nbsp;&nbsp;&nbsp;<input type=""submit"" NAME=""Enter"" style=font-size:11px;font-family:tahoma value=""Gravar departamento""> <input type=""reset"" value=""Limpar formulario"" style=font-size:11px;font-family:tahoma></td></table><br><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br></form>"

Case "gravanovo"
nome = Trim(Request("nomedep"))
descri = Trim(Request("descri"))
ver = Trim(Request("ver"))
If nome = "" Then
If nome = "" Then erro1 = "sim" Else erro1 = nome
erro3 = descri
If ver = "" Then erro2 = "sim" Else erro2 = ver
Response.Redirect "?link=dep&acao=inserir&erro1=" & erro1 & "&erro2=" & erro2 & "&erro3=" & erro3
End If

If descri = "" Then
descri = "-"
End If

If CStr(Len(Day(Now))) = CStr("1") Then
diazz = "0" & Day(Now)
Else
diazz = Day(Now)
End If
If CStr(Len(Month(Now))) = CStr("1") Then
meszz = "0" & Month(Now)
Else
meszz = Month(Now)
End If
dataz = diazz & "/" & meszz & "/" & Year(Now)

textosql = "INSERT INTO sessoes (data, nome, descr,ver) VALUES ('" & dataz & "', '" & nome & "', '" & descri & "','" & ver & "');"
Set gravadep = conexao.Execute(textosql)

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/dep_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Novo departamento incluído na loja com sucesso</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<center><FONT face=tahoma  style=font-size:11px><b><A href=""?link=dep&acao=inserir&acaba=sim"">Inserir um novo departamento na loja</a></b></center>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc><br>"
strTextoHtml = strTextoHtml & "<table align=center width=""90%"">"

varimg = "&nbsp;<img src='adm_imagens/xis.gif' width='15' height='16' border='0' align='absmiddle'>"

strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Data:</b></td><td><FONT face=tahoma  style=font-size:11px>" & dataz & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td width=""40%""><FONT face=tahoma  style=font-size:11px><b>Departamento:</b></td><td><FONT face=tahoma  style=font-size:11px>" & nome & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Descrição (opcional):</b></td><td><FONT face=tahoma  style=font-size:11px>"

If descri = "" Then
strTextoHtml = strTextoHtml & "-"
Else
strTextoHtml = strTextoHtml & descri
End If

strTextoHtml = strTextoHtml & "</td></tr><tr><td><FONT face=tahoma  style=font-size:11px><b>Visível:</b></td><td><FONT face=tahoma  style=font-size:11px>"

If CStr(ver) = "s" Then
strTextoHtml = strTextoHtml & "Sim"
Else
strTextoHtml = strTextoHtml & "Não"
End If

strTextoHtml = strTextoHtml & "</td></tr><tr><td colspan=2 align=center height=15></td></tr></table><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br></form>"

Case "editar"
Set rs = conexao.Execute("SELECT * FROM sessoes ORDER by nome")
If rs.EOF Or rs.bof Then

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/dep_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Editar departamentos na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Departamentos(s) encontrado(s): <b>0</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<br><br><table width=568 align=center>"
strTextoHtml = strTextoHtml & "<tr><td align=center><br><br><b><font style=font-size:11px>Nenhum departamento foi encontrado na base de dados da loja.<br><br></b><br><br></td></tr></table>"
strTextoHtml = strTextoHtml & "<br></table>"
strTextoHtml = strTextoHtml & "<table width=""100%"" cellspacing=""0"" cellpadding=""0""><tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table><td></tr></table>"

Else

Set rs2 = conexao.Execute("SELECT count(nome) AS total FROM sessoes;")
totalreg = rs2("total")
rs2.Close
Set rs2 = Nothing
numiz = Request("pagina") & "0"
numiz = CInt(numiz)
iz = iz + numiz

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/dep_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Editar departamentos na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Departamentos(s) encontrado(s): <b>" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table><tr><td height=3></td></tr></table><table width=568 align=center>"

While Not rs.EOF
iz = iz + 1
If rs("ver") = "s" Then
varestoq = "<font color=#000000>Sim</font>"
Else
varestoq = "<font color=#b23c04>Não</font>"
End If

strTextoHtml = strTextoHtml & "<tr><td align=left valign=center>"
strTextoHtml = strTextoHtml & "<table width=""100%"" bgcolor=#eeeeee style='border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;'><tr><td valign=center><font face=""tahoma"" style=font-size:11px;color:000000>" & iz & ") <b>" & UCase(rs("nome")) & "</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data: <b>" & rs("data") & "</b> &nbsp;&nbsp;&nbsp;Visível: <b>" & varestoq & "</b></td><td align=right valign=center><font face=""tahoma"" style=font-size:11px;color:000000>Ação: <b><a href=?link=dep&acao=ver&dep=" & rs("id") & ">Ver</a></b> | <b><a href=?link=dep&acao=edita&dep=" & rs("id") & ">Editar</a></b>&nbsp;</td></tr></table> <table><tr><td height=4></td></tr></table>"

rs.movenext
Wend

strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table></td></tr></table> </td></tr></table>"

rs.Close
Set rs = Nothing
End If

Case "excluir"
Set rs = conexao.Execute("SELECT * FROM sessoes ORDER by nome")
If rs.EOF Or rs.bof Then

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/dep_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Excluir departamentos na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Departamentos(s) encontrado(s): <b>0</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<br><br><table width=568 align=center>"
strTextoHtml = strTextoHtml & "<tr><td align=center><br><br><b><font style=font-size:11px>Nenhum departamento foi encontrado na base de dados da loja.<br><br></b><br><br></td></tr></table>"
strTextoHtml = strTextoHtml & "<br></table>"
strTextoHtml = strTextoHtml & "<table width=""100%"" cellspacing=""0"" cellpadding=""0""><tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table><td></tr></table>"

Else

Set rs2 = conexao.Execute("SELECT count(nome) AS total FROM sessoes;")
totalreg = rs2("total")
rs2.Close
Set rs2 = Nothing
numiz = Request("pagina") & "0"
numiz = CInt(numiz)
iz = iz + numiz

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/dep_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Excluir departamentos na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Departamentos(s) encontrado(s): <b>" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table><tr><td height=3></td></tr></table><table width=568 align=center>"

If Request("status") = "sucesso" Then

strTextoHtml = strTextoHtml & "<div align=center><b><font style=font-size:11px;font-family:tahoma;color:#003366>DEPARTAMENTO EXCLIUDO COM SUCESSO!<br><br></font></b></center>"

Else
End If

While Not rs.EOF
iz = iz + 1
If rs("ver") = "s" Then
varestoq = "<font color=#000000>Sim</font>"
Else
varestoq = "<font color=#b23c04>Não</font>"
End If

strTextoHtml = strTextoHtml & "<script language=""javascript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function dep" & rs("id") & "(){" & vbNewLine
strTextoHtml = strTextoHtml & "if (confirm('Você realmente deseja excluir este departamento e seus respectivos produtos?'))" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "window.location.href('?link=dep&acao=exclui&dep=" & rs("id") & "');" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "else" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "}}" & vbNewLine
strTextoHtml = strTextoHtml & "</script>" & vbNewLine

strTextoHtml = strTextoHtml & "<tr><td align=left valign=center>" & vbNewLine
strTextoHtml = strTextoHtml & "<table width=""100%"" bgcolor=#eeeeee style='border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;'><tr><td valign=center><font face=""tahoma"" style=font-size:11px;color:000000>" & iz & ") <b>" & UCase(rs("nome")) & "</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data: <b>" & rs("data") & "</b> &nbsp;&nbsp;&nbsp;Visível: <b>" & varestoq & "</b></td><td align=right valign=center><font face=""tahoma"" style=font-size:11px;color:000000>Ação: <b><a href=?link=dep&acao=ver&dep=" & rs("id") & "&modo=exclui>Ver</a></b> | <b><a href=""javascript: dep" & rs("id") & "();"">Excluir</a></b>&nbsp;</td></tr></table> <table><tr><td height=4></td></tr></table>"

rs.movenext
Wend

strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table></td></tr></table> </td></tr></table>"

rs.Close
Set rs = Nothing
End If

Case "exclui"
notz = Request.QueryString("dep")
conexao.Execute("delete from sessoes where id=" & notz & ";")
conexao.Execute("delete from produtos where idsessao='" & notz & "';")
Response.Redirect "?link=dep&acao=excluir&status=sucesso"

Case "ver"

Set setdep = conexao.Execute("SELECT * FROM sessoes WHERE id = " & Request("dep") & ";")

nome = setdep("nome")
data = setdep("data")
descri = setdep("descr")
ver = setdep("ver")

If Request("status") = "sucesso" Then

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/dep_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Departamento editado com sucesso</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<center><FONT face=tahoma  style=font-size:11px><b><A href=""?link=dep&acao=edita&dep=" & Request("dep") & "&acaba=sim"">Editar novamente este departamento</a></b> |<b><A href=""?link=dep&acao=editar&acaba=sim""> Ver novamente todos os departamentos</a></b></center>"

Else

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/dep_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Ver departamento cadastrado na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"

If Request("modo") = "exclui" Then

strTextoHtml = strTextoHtml & "<script language=""javascript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function dep" & Request("dep") & "(){" & vbNewLine
strTextoHtml = strTextoHtml & "if (confirm('Você realmente deseja excluir este departamento e seus respectivos produtos?'))" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "window.location.href('?link=dep&acao=exclui&dep=" & Request("dep") & "');" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "else" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "}}" & vbNewLine
strTextoHtml = strTextoHtml & "</script>" & vbNewLine

strTextoHtml = strTextoHtml & "<center><FONT face=tahoma  style=font-size:11px><b><a href=""vbscript: dep" & Request("dep") & "()"">Excluir este departamento</a></b> |<b><A href=""?link=dep&acao=excluir&acaba=sim""> Ver todos os departamentos</a></b></center>"

Else

strTextoHtml = strTextoHtml & "<center><FONT face=tahoma  style=font-size:11px><b><A href=""?link=dep&acao=edita&dep=" & Request("dep") & "&acaba=sim"">Editar este departamento</a></b> |<b><A href=""?link=dep&acao=editar&acaba=sim""> Ver todos os departamentos</a></b></center>"

End If
End If

strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc><br>"
strTextoHtml = strTextoHtml & "<table align=center width=""90%"">"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Data:</b></td><td><FONT face=tahoma  style=font-size:11px>" & dataz & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td width=""40%""><FONT face=tahoma  style=font-size:11px><b>Departamento:</b></td><td><FONT face=tahoma  style=font-size:11px>" & nome & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Descrição (opcional):</b></td><td><FONT face=tahoma  style=font-size:11px>"

If setdep("descr") = "" Then
strTextoHtml = strTextoHtml & "-"
Else
strTextoHtml = strTextoHtml & descri
End If

strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Visível:</b></td><td><FONT face=tahoma  style=font-size:11px>"

If CStr(ver) = "s" Then
strTextoHtml = strTextoHtml & "Sim"
Else
strTextoHtml = strTextoHtml & "Não"
End If

strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center height=15></td></tr></table><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br></form>"

Case "edita"
Set depz = conexao.Execute("SELECT * FROM sessoes WHERE id = " & Request("dep") & ";")

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/dep_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Editar departamento na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<form method=post action=""administrador.asp?link=dep&acao=gravavelho"">"
strTextoHtml = strTextoHtml & "<input name=""dep"" type=""hidden"" value=""" & Request("dep") & """>"
strTextoHtml = strTextoHtml & "<table align=center width=""90%"">"

varimg = "&nbsp;<img src='adm_imagens/xis.gif' width='15' height='16' border='0' align='absmiddle'>"

strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Data:</b></td><td><FONT face=tahoma  style=font-size:11px>" & depz("data") & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td width=""40%""><FONT face=tahoma  style=font-size:11px><b>Departamento:</b></td><td><input name=""nomedep"" type=""text"" value=""" & depz("nome") & """ size=50  style=font-size:11px;font-family:tahoma>"

If Request.QueryString("erro1") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If

strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Descrição (opcional):</b></td><td><textarea name=""descri"" rows=5 cols=55 style=font-size:11px;font-family:tahoma>"

If depz("descr") = "-" Then
strTextoHtml = strTextoHtml & ""
Else
strTextoHtml = strTextoHtml & depz("descr")
End If

strTextoHtml = strTextoHtml & "</textarea></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Visível:</b></td><td><select name=""ver"" style=font-size:11px;font-family:tahoma><option value=""s"" "

If CStr(depz("ver")) = "s" Then
strTextoHtml = strTextoHtml & "selected"
End If

strTextoHtml = strTextoHtml & ">Sim<option value=""n"" "

If CStr(depz("ver")) = "n" Then
strTextoHtml = strTextoHtml & "selected"
End If

strTextoHtml = strTextoHtml & ">Não</select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center height=15></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td align=center></td><td align=center>&nbsp;&nbsp;&nbsp;&nbsp;<input type=""submit"" NAME=""Enter"" style=font-size:11px;font-family:tahoma value=""Editar departamento""> <input type=""reset"" value=""Limpar formulario"" style=font-size:11px;font-family:tahoma></td></table><br><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br></form>"

Case "gravavelho"
nome = Trim(Request("nomedep"))
descri = Trim(Request("descri"))
ver = Trim(Request("ver"))
If nome = "" Then
If nome = "" Then erro1 = "sim" Else erro1 = nome
erro3 = descri
If ver = "" Then erro2 = "sim" Else erro2 = ver
Response.Redirect "?link=dep&acao=edita2&erro1=" & erro1 & "&erro2=" & erro2 & "&erro3=" & erro3 & "&dep=" & Request("dep")
End If

If descri = "" Then
descri = "-"
End If

textosql = "UPDATE sessoes SET nome = '" & nome & "',  descr = '" & descri & "', ver = '" & ver & "' WHERE id = " & Request("dep") & ";"
Set gravadep = conexao.Execute(textosql)

Response.Redirect "?link=dep&acao=ver&status=sucesso&dep=" & Request("dep")

Case "edita2"

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/dep_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Editar departamento na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<form method=post action=""administrador.asp?link=dep&acao=gravavelho"">"
strTextoHtml = strTextoHtml & "<input name=""dep"" type=""hidden"" value=""" & Request("dep") & """>"
strTextoHtml = strTextoHtml & "<table align=center width=""90%"">"

varimg = "&nbsp;<img src='adm_imagens/xis.gif' width='15' height='16' border='0' align='absmiddle'>"

strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Data:</b></td><td><FONT face=tahoma  style=font-size:11px>" & dia & "/" & mez & "/" & Year(Date) & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td width=""40%""><FONT face=tahoma  style=font-size:11px><b>Departamento:</b></td><td><input name=""nomedep"" type=""text"" value="""

If Request.QueryString("erro1") <> "sim" Then
strTextoHtml = strTextoHtml & Request.QueryString("erro1")
End If

strTextoHtml = strTextoHtml & """ size=50  style=font-size:11px;font-family:tahoma>"

If Request.QueryString("erro1") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If

strTextoHtml = strTextoHtml & "</td></tr><tr><td><FONT face=tahoma  style=font-size:11px><b>Descrição (opcional):</b></td><td><textarea name=""descri"" rows=5 cols=55 style=font-size:11px;font-family:tahoma>" & Request.QueryString("erro3") & "</textarea></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Visível:</b></td><td><select name=""ver"" style=font-size:11px;font-family:tahoma><option value=""s"" "

If CStr(Request.QueryString("erro2")) = "s" Then
strTextoHtml = strTextoHtml & "selected"
End If

strTextoHtml = strTextoHtml & ">Sim<option value=""n"""

If CStr(Request.QueryString("erro2")) = "n" Then
strTextoHtml = strTextoHtml & "selected"
End If

strTextoHtml = strTextoHtml & ">Não</select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center height=15></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td align=center></td><td align=center>&nbsp;&nbsp;&nbsp;&nbsp;<input type=""submit"" NAME=""Enter"" style=font-size:11px;font-family:tahoma value=""Editar departamento""> <input type=""reset"" value=""Limpar formulario"" style=font-size:11px;font-family:tahoma></td></table><br><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br></form>"


End Select
End Sub

Function DecodificaTexto(strString)
strString = Replace(strString, Chr(1), "A")
strString = Replace(strString, Chr(2), "a")
strString = Replace(strString, Chr(3), "B")
strString = Replace(strString, Chr(4), "b")
strString = Replace(strString, Chr(5), "C")
strString = Replace(strString, Chr(6), "c")
strString = Replace(strString, Chr(7), "D")
strString = Replace(strString, Chr(8), "d")
strString = Replace(strString, Chr(14), "E")
strString = Replace(strString, Chr(15), "e")
strString = Replace(strString, Chr(16), "F")
strString = Replace(strString, Chr(17), "f")
strString = Replace(strString, Chr(18), "G")
strString = Replace(strString, Chr(19), "g")
strString = Replace(strString, Chr(20), "H")
strString = Replace(strString, Chr(21), "h")
strString = Replace(strString, Chr(22), "I")
strString = Replace(strString, Chr(23), "i")
strString = Replace(strString, Chr(24), "J")
strString = Replace(strString, Chr(25), "j")
strString = Replace(strString, Chr(26), "K")
strString = Replace(strString, Chr(27), "k")
strString = Replace(strString, Chr(28), "L")
strString = Replace(strString, Chr(29), "l")
strString = Replace(strString, Chr(30), "M")
strString = Replace(strString, Chr(31), "m")
strString = Replace(strString, Chr(127), "N")
strString = Replace(strString, Chr(128), "n")
strString = Replace(strString, Chr(129), "O")
strString = Replace(strString, Chr(131), "o")
strString = Replace(strString, Chr(134), "P")
strString = Replace(strString, Chr(135), "p")
strString = Replace(strString, Chr(138), "Q")
strString = Replace(strString, Chr(140), "q")
strString = Replace(strString, Chr(141), "R")
strString = Replace(strString, Chr(142), "r")
strString = Replace(strString, Chr(143), "S")
strString = Replace(strString, Chr(144), "s")
strString = Replace(strString, Chr(153), "T")
strString = Replace(strString, Chr(154), "t")
strString = Replace(strString, Chr(156), "U")
strString = Replace(strString, Chr(157), "u")
strString = Replace(strString, Chr(158), "V")
strString = Replace(strString, Chr(162), "v")
strString = Replace(strString, Chr(163), "X")
strString = Replace(strString, Chr(164), "x")
strString = Replace(strString, Chr(165), "Z")
strString = Replace(strString, Chr(166), "z")
strString = Replace(strString, Chr(167), "Y")
strString = Replace(strString, Chr(169), "y")
strString = Replace(strString, Chr(172), "W")
strString = Replace(strString, Chr(174), "w")
strString = Replace(strString, Chr(177), "1")
strString = Replace(strString, Chr(181), "2")
strString = Replace(strString, Chr(182), "3")
strString = Replace(strString, Chr(188), "4")
strString = Replace(strString, Chr(189), "5")
strString = Replace(strString, Chr(190), "6")
strString = Replace(strString, Chr(191), "7")
strString = Replace(strString, Chr(198), "8")
strString = Replace(strString, Chr(208), "9")
strString = Replace(strString, Chr(216), "0")
strString = Replace(strString, Chr(222), ",")
strString = Replace(strString, Chr(223), "-")
strString = Replace(strString, Chr(221), "_")
strString = Replace(strString, Chr(229), Chr(34))
strString = Replace(strString, Chr(230), "'")
strString = Replace(strString, Chr(240), "@")
strString = Replace(strString, Chr(241), "&")
strString = Replace(strString, Chr(248), "$")
strString = Replace(strString, Chr(253), "#")
strString = Replace(strString, Chr(254), "*")
strString = Replace(strString, Chr(255), "(")
strString = Replace(strString, Chr(197), ")")
strString = Replace(strString, Chr(175), "\")
strString = Replace(strString, Chr(161), "/")
strString = Replace(strString, Chr(149), "|")
DecodificaTexto = strString
End Function

Function Codifica(strString)
strString = Replace(strString, Chr(32) & Chr(32), "&nbsp;&nbsp;")
strString = Replace(strString, Chr(13), "&nbsp;")
strString = Replace(strString, Chr(10) & Chr(10), "</p><p>")
strString = Replace(strString, Chr(10), "<br>")
strString = Replace(strString, "[b]", "<b>")
strString = Replace(strString, "[/b]", "</b>")
strString = Replace(strString, "[i]", "<i>")
strString = Replace(strString, "[/i]", "</i>")
strString = Replace(strString, "[u]", "<u>")
strString = Replace(strString, "[linha]", "<hr size=1 color=cccccc>")
strString = Replace(strString, "[justificar]", "<div align=justify>")
strString = Replace(strString, "[/justificar]", "</div></js>")
strString = Replace(strString, "[/alinhar]", "</div></al>")
strString = Replace(strString, "[alinhar=esquerda]", "<div align=left>")
strString = Replace(strString, "[alinhar=direita]", "<div align=right>")
strString = Replace(strString, "[/u]", "</u>")
strString = Replace(strString, "[centralizar]", "<center>")
strString = Replace(strString, "[/centralizar]", "</center>")
strString = Replace(strString, "[comentario]", "<table align=center width=""80%"" style=""border-right: 1px solid #000000;border-left: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000""><tr><td><font face=verdana style=font-size:10px>")
strString = Replace(strString, "[/comentario]", "</td></tr></table>")
strString = Replace(strString, "[lista]", "<ul>")
strString = Replace(strString, "[item]", "<li>")
strString = Replace(strString, "[/lista]", "</ul>")
strString = Replace(strString, "[/fonte]", "</font>")
strString = Replace(strString, "[fonte=Andale Mono]", "<font face=""Andale Mono"">")
strString = Replace(strString, "[fonte=Arial]", "<font face=""Arial"">")
strString = Replace(strString, "[fonte=Arial Black]", "<font face=""Arial Black"">")
strString = Replace(strString, "[fonte=Book Antiqua]", "<font face=""Book Antiqua"">")
strString = Replace(strString, "[fonte=Century Gothic]", "<font face=""Century Gothic"">")
strString = Replace(strString, "[fonte=Comic Sans MS]", "<font face=""Comic Sans MS"">")
strString = Replace(strString, "[fonte=Courier New]", "<font face=""Courier New"">")
strString = Replace(strString, "[fonte=Georgia]", "<font face=""Georgia"">")
strString = Replace(strString, "[fonte=Impact]", "<font face=""Impact"">")
strString = Replace(strString, "[fonte=Tahoma]", "<font face=""Tahoma"">")
strString = Replace(strString, "[fonte=Times New Roman]", "<font face=""Times New Roman"">")
strString = Replace(strString, "[fonte=Trebuchet MS]", "<font face=""Trebuchet MS"">")
strString = Replace(strString, "[fonte=Script MT Bold]", "<font face=""Script MT Bold"">")
strString = Replace(strString, "[fonte=Stencil]", "<font face=""Stencil"">")
strString = Replace(strString, "[fonte=Verdana]", "<font face=""Verdana"">")
strString = Replace(strString, "[fonte=Lucida Console]", "<font face=""Lucida Console"">")
strString = Replace(strString, "[/tamanho]", "</font>")
strString = Replace(strString, "[/cor]", "</font>")
strString = Replace(strString, "[tamanho=1]", "<font style=font-size:11px>")
strString = Replace(strString, "[tamanho=2]", "<font style=font-size:13px>")
strString = Replace(strString, "[tamanho=3]", "<font style=font-size:15px>")
strString = Replace(strString, "[tamanho=4]", "<font style=font-size:17px>")
strString = Replace(strString, "[tamanho=5]", "<font style=font-size:19px>")
strString = Replace(strString, "[tamanho=6]", "<font style=font-size:21px>")
strString = Replace(strString, "[cor=preto]", "<font color=#000000>")
strString = Replace(strString, "[cor=vermelho]", "<font color=#ff0000>")
strString = Replace(strString, "[cor=amarelo]", "<font color=#ffff00>")
strString = Replace(strString, "[cor=rosa]", "<font color=#f674dc>")
strString = Replace(strString, "[cor=verde]", "<font color=#00ff00>")
strString = Replace(strString, "[cor=laranja]", "<font color=#ffcc00>")
strString = Replace(strString, "[cor=roxo]", "<font color=#5601d7>")
strString = Replace(strString, "[cor=azul]", "<font color=#0000ff>")
strString = Replace(strString, "[cor=bege]", "<font color=#ece9d8>")
strString = Replace(strString, "[cor=marron]", "<font color=#b22f04>")
strString = ContaLink(strString)
strString = ContaEmail(strString)
Codifica = strString
End Function

Function Decodifica(strString)
strString = Replace(strString, "&nbsp;&nbsp;", Chr(32) & Chr(32))
strString = Replace(strString, "&nbsp;", Chr(13))
strString = Replace(strString, "</p><p>", Chr(10) & Chr(10))
strString = Replace(strString, "<br>", Chr(10))
strString = Replace(strString, "<b>", "[b]")
strString = Replace(strString, "</b>", "[/b]")
strString = Replace(strString, "<i>", "[i]")
strString = Replace(strString, "</i>", "[/i]")
strString = Replace(strString, "<u>", "[u]")
strString = Replace(strString, "</u>", "[/u]")
strString = Replace(strString, "<hr size=1 color=cccccc>", "[linha]")
strString = Replace(strString, "<div align=justify>", "[justificar]")
strString = Replace(strString, "</div></js>", "[/justificar]")
strString = Replace(strString, "</div></al>", "[/alinhar]")
strString = Replace(strString, "<div align=left>", "[alinhar=esquerda]")
strString = Replace(strString, "<div align=right>", "[alinhar=direita]")
strString = Replace(strString, "<center>", "[centralizar]")
strString = Replace(strString, "</center>", "[/centralizar]")
strString = Replace(strString, "<table align=center width=""80%"" style=""border-right: 1px solid #000000;border-left: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000""><tr><td><font face=verdana style=font-size:10px>", "[comentario]")
strString = Replace(strString, "</td></tr></table>", "[/comentario]")
strString = Replace(strString, "<ul>", "[lista]")
strString = Replace(strString, "<li>", "[item]")
strString = Replace(strString, "</ul>", "[/lista]")
strString = Replace(strString, "</font>", "[/fonte]")
strString = Replace(strString, "<font face=""Andale Mono"">", "[fonte=Andale Mono]")
strString = Replace(strString, "<font face=""Arial"">", "[fonte=Arial]")
strString = Replace(strString, "<font face=""Arial Black"">", "[fonte=Arial Black]")
strString = Replace(strString, "<font face=""Book Antiqua"">", "[fonte=Book Antiqua]")
strString = Replace(strString, "<font face=""Century Gothic"">", "[fonte=Century Gothic]")
strString = Replace(strString, "<font face=""Comic Sans MS"">", "[fonte=Comic Sans MS]")
strString = Replace(strString, "<font face=""Courier New"">", "[fonte=Courier New]")
strString = Replace(strString, "<font face=""Georgia"">", "[fonte=Georgia]")
strString = Replace(strString, "<font face=""Impact"">", "[fonte=Impact]")
strString = Replace(strString, "<font face=""Tahoma"">", "[fonte=Tahoma]")
strString = Replace(strString, "<font face=""Times New Roman"">", "[fonte=Times New Roman]")
strString = Replace(strString, "<font face=""Trebuchet MS"">", "[fonte=Trebuchet MS]")
strString = Replace(strString, "<font face=""Script MT Bold"">", "[fonte=Script MT Bold]")
strString = Replace(strString, "<font face=""Stencil"">", "[fonte=Stencil]")
strString = Replace(strString, "<font face=""Verdana"">", "[fonte=Verdana]")
strString = Replace(strString, "<font face=""Lucida Console"">", "[fonte=Lucida Console]")
strString = Replace(strString, "</font>", "[/tamanho]")
strString = Replace(strString, "</font>", "[/cor]")
strString = Replace(strString, "<font style=font-size:11px>", "[tamanho=1]")
strString = Replace(strString, "<font style=font-size:13px>", "[tamanho=2]")
strString = Replace(strString, "<font style=font-size:15px>", "[tamanho=3]")
strString = Replace(strString, "<font style=font-size:17px>", "[tamanho=4]")
strString = Replace(strString, "<font style=font-size:19px>", "[tamanho=5]")
strString = Replace(strString, "<font style=font-size:21px>", "[tamanho=6]")
strString = Replace(strString, "<font color=#000000>", "[cor=preto]")
strString = Replace(strString, "<font color=#ff0000>", "[cor=vermelho]")
strString = Replace(strString, "<font color=#ffff00>", "[cor=amarelo]")
strString = Replace(strString, "<font color=#f674dc>", "[cor=rosa]")
strString = Replace(strString, "<font color=#00ff00>", "[cor=verde]")
strString = Replace(strString, "<font color=#ffcc00>", "[cor=laranja]")
strString = Replace(strString, "<font color=#5601d7>", "[cor=roxo]")
strString = Replace(strString, "<font color=#0000ff>", "[cor=azul]")
strString = Replace(strString, "<font color=#ece9d8>", "[cor=bege]")
strString = Replace(strString, "<font color=#b22f04>", "[cor=marron]")
strString = Replace(strString, "<font color=#b22f04>", "[cor=marron]")
strString = VerEmail(strString)
strString = VerLink(strString)
strString = Replace(strString, "</a>", "")

Decodifica = strString
End Function

Function VerLink(strString)
oTag = "####"
c1Tag = "####"
oTag2 = "<a href=http://"
roTag = "[link]"
c1Tag2 = " target=_blank style=text-decoration:underline;>"
rc1Tag = "[/link]"
c2Tag = " target=_blank style=text-decoration:underline;>"
rc2Tag = ""
oTagpos = InStr(1, strString, oTag, 1)
c1TagPos = InStr(1, strString, c1Tag, 1)
strTempString = ""
If (oTagpos > 0) And (c1TagPos > 0) Then
strArray = Split(strString, oTag, -1, 1)
For counter2 = 0 To UBound(strArray)
If (InStr(1, strArray(counter2), c2Tag, 1) > 0) Or (InStr(1, strArray(counter2), c1Tag, 1) > 0) Then
strArray2 = Split(strArray(counter2), c1Tag, -1, 1)
If InStr(1, strArray2(1), c2Tag, 1) And Not ((InStr(1, UCase(strArray2(1)), "[link]", 1) > 0) And Not (InStr(1, UCase(strArray2(1)), "[/link]", 1) > 0)) Then
strFirstPart = Left(strArray2(1), InStr(1, strArray2(1), c2Tag, 1) - 1)
strSecondPart = Right(strArray2(1), (Len(strArray2(1)) - InStr(1, strArray2(1), c2Tag, 1) - Len(c2Tag) + 1))
If strFirstPart <> "" Then
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & strFirstPart & rc2Tag
Else
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & strFirstPart & rc2Tag
End If
Else
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & rc2Tag
Else
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & rc2Tag
End If
End If
Else
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & rc2Tag
End If
ElseIf (InStr(1, strArray(counter2), c1Tag, 1) > 0) Then
strArray2 = Split(strArray(counter2), c1Tag, -1)
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & rc2Tag
Else
strTempString = strTempString & strArray(counter2)
End If
Next
Else
strTempString = strString
End If
oTagpos2 = InStr(1, strTempString, oTag2, 1)
c1TagPos2 = InStr(1, strTempString, c1Tag2, 1)
If (oTagpos2 > 0) And (c1TagPos2 > 0) Then
strTempString2 = ""
strArray = Split(strTempString, oTag2, -1, 1)
For counter3 = 0 To UBound(strArray)
If (InStr(1, strArray(counter3), c1Tag2, 1) > 0) Then
strArray2 = Split(strArray(counter3), c1Tag2, -1, 1)
vararray = Replace(strArray2(1), strArray2(0), "")
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString2 = strTempString2 & roTag & strArray2(0) & rc1Tag & rc2Tag & vararray
Else
strTempString2 = strTempString2 & roTag & strArray2(0) & rc1Tag & rc2Tag & vararray
End If
Else
strTempString2 = strTempString2 & strArray(counter3)
End If
Next
strTempString = strTempString2
End If
VerLink = strTempString
End Function

Function VerEmail(strString)
oTag = "####"
c1Tag = "####"
oTag2 = "<a href=mailto:"
roTag = "[email]"
c1Tag2 = " target=_email style=text-decoration:underline;>"
rc1Tag = "[/email]"
c2Tag = " target=_email style=text-decoration:underline;>"
rc2Tag = ""
oTagpos = InStr(1, strString, oTag, 1)
c1TagPos = InStr(1, strString, c1Tag, 1)
strTempString = ""
If (oTagpos > 0) And (c1TagPos > 0) Then
strArray = Split(strString, oTag, -1, 1)
For counter2 = 0 To UBound(strArray)
If (InStr(1, strArray(counter2), c2Tag, 1) > 0) Or (InStr(1, strArray(counter2), c1Tag, 1) > 0) Then
strArray2 = Split(strArray(counter2), c1Tag, -1, 1)
If InStr(1, strArray2(1), c2Tag, 1) And Not ((InStr(1, UCase(strArray2(1)), "[email]", 1) > 0) And Not (InStr(1, UCase(strArray2(1)), "[/email]", 1) > 0)) Then
strFirstPart = Left(strArray2(1), InStr(1, strArray2(1), c2Tag, 1) - 1)
strSecondPart = Right(strArray2(1), (Len(strArray2(1)) - InStr(1, strArray2(1), c2Tag, 1) - Len(c2Tag) + 1))
If strFirstPart <> "" Then
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & strFirstPart & rc2Tag
Else
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & strFirstPart & rc2Tag
End If
Else
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & rc2Tag
Else
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & rc2Tag
End If
End If
Else
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & rc2Tag
End If
ElseIf (InStr(1, strArray(counter2), c1Tag, 1) > 0) Then
strArray2 = Split(strArray(counter2), c1Tag, -1)
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & rc2Tag
Else
strTempString = strTempString & strArray(counter2)
End If
Next
Else
strTempString = strString
End If
oTagpos2 = InStr(1, strTempString, oTag2, 1)
c1TagPos2 = InStr(1, strTempString, c1Tag2, 1)
If (oTagpos2 > 0) And (c1TagPos2 > 0) Then
strTempString2 = ""
strArray = Split(strTempString, oTag2, -1, 1)
For counter3 = 0 To UBound(strArray)
If (InStr(1, strArray(counter3), c1Tag2, 1) > 0) Then
strArray2 = Split(strArray(counter3), c1Tag2, -1, 1)
vararray = Replace(strArray2(1), strArray2(0), "")
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString2 = strTempString2 & roTag & strArray2(0) & rc1Tag & rc2Tag & vararray
Else
strTempString2 = strTempString2 & roTag & strArray2(0) & rc1Tag & rc2Tag & vararray
End If
Else
strTempString2 = strTempString2 & strArray(counter3)
End If
Next
strTempString = strTempString2
End If
VerEmail = strTempString
End Function

Function ContaLink(strString)
oTag = "[link="""
oTag2 = "[link]"
roTag = "<a href="
c1Tag = """]"
c1Tag2 = "[/link]"
rc1Tag = " target=_blank style=text-decoration:underline;>"
c2Tag = "[/link]"
rc2Tag = "</a>"
oTagpos = InStr(1, strString, oTag, 1)
c1TagPos = InStr(1, strString, c1Tag, 1)
strTempString = ""
If (oTagpos > 0) And (c1TagPos > 0) Then
strArray = Split(strString, oTag, -1, 1)
For counter2 = 0 To UBound(strArray)
If (InStr(1, strArray(counter2), c2Tag, 1) > 0) Or (InStr(1, strArray(counter2), c1Tag, 1) > 0) Then
strArray2 = Split(strArray(counter2), c1Tag, -1, 1)
If InStr(1, strArray2(1), c2Tag, 1) And Not ((InStr(1, UCase(strArray2(1)), "[link]", 1) > 0) And Not (InStr(1, UCase(strArray2(1)), "[/link]", 1) > 0)) Then
strFirstPart = Left(strArray2(1), InStr(1, strArray2(1), c2Tag, 1) - 1)
strSecondPart = Right(strArray2(1), (Len(strArray2(1)) - InStr(1, strArray2(1), c2Tag, 1) - Len(c2Tag) + 1))
If strFirstPart <> "" Then
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString = strTempString & roTag & "http://" & strArray2(0) & rc1Tag & strFirstPart & rc2Tag & strSecondPart
Else
strTempString = strTempString & roTag & "http://" & strArray2(0) & rc1Tag & strFirstPart & rc2Tag & strSecondPart
End If
Else
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString = strTempString & roTag & "http://" & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strSecondPart
Else
strTempString = strTempString & roTag & "http://" & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strSecondPart
End If
End If
Else
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strArray2(1)
End If
ElseIf (InStr(1, strArray(counter2), c1Tag, 1) > 0) Then
strArray2 = Split(strArray(counter2), c1Tag, -1)
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strArray2(1)
Else
strTempString = strTempString & strArray(counter2)
End If
Next
Else
strTempString = strString
End If
oTagpos2 = InStr(1, strTempString, oTag2, 1)
c1TagPos2 = InStr(1, strTempString, c1Tag2, 1)
If (oTagpos2 > 0) And (c1TagPos2 > 0) Then
strTempString2 = ""
strArray = Split(strTempString, oTag2, -1, 1)
For counter3 = 0 To UBound(strArray)
If (InStr(1, strArray(counter3), c1Tag2, 1) > 0) Then
strArray2 = Split(strArray(counter3), c1Tag2, -1, 1)
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString2 = strTempString2 & roTag & "http://" & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strArray2(1)
Else
strTempString2 = strTempString2 & roTag & "http://" & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strArray2(1)
End If
Else
strTempString2 = strTempString2 & strArray(counter3)
End If
Next
strTempString = strTempString2
End If
ContaLink = strTempString
End Function

Function ContaEmail(strString)
oTag = "[email="""
oTag2 = "[email]"
roTag = "<a href="
c1Tag = """]"
c1Tag2 = "[/email]"
rc1Tag = " target=_email style=text-decoration:underline;>"
c2Tag = "[/email]"
rc2Tag = "</a>"
oTagpos = InStr(1, strString, oTag, 1)
c1TagPos = InStr(1, strString, c1Tag, 1)
strTempString = ""
If (oTagpos > 0) And (c1TagPos > 0) Then
strArray = Split(strString, oTag, -1, 1)
For counter2 = 0 To UBound(strArray)
If (InStr(1, strArray(counter2), c2Tag, 1) > 0) Or (InStr(1, strArray(counter2), c1Tag, 1) > 0) Then
strArray2 = Split(strArray(counter2), c1Tag, -1, 1)
If InStr(1, strArray2(1), c2Tag, 1) And Not ((InStr(1, UCase(strArray2(1)), "[email]", 1) > 0) And Not (InStr(1, UCase(strArray2(1)), "[/email]", 1) > 0)) Then
strFirstPart = Left(strArray2(1), InStr(1, strArray2(1), c2Tag, 1) - 1)
strSecondPart = Right(strArray2(1), (Len(strArray2(1)) - InStr(1, strArray2(1), c2Tag, 1) - Len(c2Tag) + 1))
If strFirstPart <> "" Then
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString = strTempString & roTag & "mailto:" & strArray2(0) & rc1Tag & strFirstPart & rc2Tag & strSecondPart
Else
strTempString = strTempString & roTag & "mailto:" & strArray2(0) & rc1Tag & strFirstPart & rc2Tag & strSecondPart
End If
Else
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString = strTempString & roTag & "mailto:" & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strSecondPart
Else
strTempString = strTempString & roTag & "mailto:" & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strSecondPart
End If
End If
Else
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strArray2(1)
End If
ElseIf (InStr(1, strArray(counter2), c1Tag, 1) > 0) Then
strArray2 = Split(strArray(counter2), c1Tag, -1)
strTempString = strTempString & roTag & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strArray2(1)
Else
strTempString = strTempString & strArray(counter2)
End If
Next
Else
strTempString = strString
End If
oTagpos2 = InStr(1, strTempString, oTag2, 1)
c1TagPos2 = InStr(1, strTempString, c1Tag2, 1)
If (oTagpos2 > 0) And (c1TagPos2 > 0) Then
strTempString2 = ""
strArray = Split(strTempString, oTag2, -1, 1)
For counter3 = 0 To UBound(strArray)
If (InStr(1, strArray(counter3), c1Tag2, 1) > 0) Then
strArray2 = Split(strArray(counter3), c1Tag2, -1, 1)
If (InStr(strArray2(0), "@") > 0) And UCase(Left(strArray2(0), 7)) <> "MAILTO:" Then
strTempString2 = strTempString2 & roTag & "mailto:" & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strArray2(1)
Else
strTempString2 = strTempString2 & roTag & "mailto:" & strArray2(0) & rc1Tag & strArray2(0) & rc2Tag & strArray2(1)
End If
Else
strTempString2 = strTempString2 & strArray(counter3)
End If
Next
strTempString = strTempString2
End If
ContaEmail = strTempString
End Function

Sub BuildUploadRequest(RequestBin)
PosBeg = 1
PosEnd = InStrB(PosBeg, RequestBin, getByteString(Chr(13)))
boundary = MidB(RequestBin, PosBeg, PosEnd - PosBeg)
BoundaryPos = InStrB(1, RequestBin, boundary)
Do Until (BoundaryPos = InStrB(RequestBin, boundary & getByteString("--")))
Dim UploadControl
Set UploadControl = CreateObject("Scripting.Dictionary")
Pos = InStrB(BoundaryPos, RequestBin, getByteString("Content-Disposition"))
Pos = InStrB(Pos, RequestBin, getByteString("name="))
PosBeg = Pos + 6
PosEnd = InStrB(PosBeg, RequestBin, getByteString(Chr(34)))
Name = getString(MidB(RequestBin, PosBeg, PosEnd - PosBeg))
PosFile = InStrB(BoundaryPos, RequestBin, getByteString("filename="))
PosBound = InStrB(PosEnd, RequestBin, boundary)
If PosFile <> 0 And (PosFile < PosBound) Then
PosBeg = PosFile + 10
PosEnd = InStrB(PosBeg, RequestBin, getByteString(Chr(34)))
FileName = getString(MidB(RequestBin, PosBeg, PosEnd - PosBeg))
UploadControl.Add "FileName", FileName
Pos = InStrB(PosEnd, RequestBin, getByteString("Content-Type:"))
PosBeg = Pos + 14
PosEnd = InStrB(PosBeg, RequestBin, getByteString(Chr(13)))
ContentType = getString(MidB(RequestBin, PosBeg, PosEnd - PosBeg))
UploadControl.Add "ContentType", ContentType
PosBeg = PosEnd + 4
PosEnd = InStrB(PosBeg, RequestBin, boundary) - 2
Value = MidB(RequestBin, PosBeg, PosEnd - PosBeg)
Else
Pos = InStrB(Pos, RequestBin, getByteString(Chr(13)))
PosBeg = Pos + 4
PosEnd = InStrB(PosBeg, RequestBin, boundary) - 2
Value = getString(MidB(RequestBin, PosBeg, PosEnd - PosBeg))
End If
UploadControl.Add "Value", Value
UploadRequest.Add Name, UploadControl
BoundaryPos = InStrB(BoundaryPos + LenB(boundary), RequestBin, boundary)
Loop
End Sub

Function getByteString(StringStr)
For i = 1 To Len(StringStr)
Char = Mid(StringStr, i, 1)
getByteString = getByteString & ChrB(AscB(Char))
Next
End Function

Function getString(StringBin)
getString = ""
For intCount = 1 To LenB(StringBin)
getString = getString & Chr(AscB(MidB(StringBin, intCount, 1)))
Next
End Function

Sub ProdutosASP()
If Request("acaba") = "sim" Then
Session("adm_email") = ""
Session("adm_descprod") = ""
End If
strTextoHtml = strTextoHtml & "<SCRIPT LANGUAGE=""JavaScript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function AdicionaCodigo(Codigo) {document.frmprod.descri.value+=Codigo}" & vbNewLine
strTextoHtml = strTextoHtml & "function email() {Codigo=""[email][/email]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function tamanhofonte(tamanho) {Codigo=""[tamanho=""+tamanho+""][/tamanho]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function negrito() {Codigo=""[b][/b]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function italico() {Codigo=""[i][/i]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function corfonte(cor) {Codigo=""[cor=""+cor+""][/cor]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function centralizado() {Codigo=""[centralizar][/centralizar]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function direita() {Codigo=""[alinhar=direita][/alinhar]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function esquerda() {Codigo=""[alinhar=esquerda][/alinhar]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function justificar() {Codigo=""[justificar][/justificar]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function linha() {Codigo=""[linha]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function link() {Codigo=""[link][/link]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function comentario() {Codigo=""[comentario][/comentario]"";    AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function lista() {Codigo=""[lista][item] [item] [item] [/lista]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function sublinhado() {Codigo=""[u][/u]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function fontecara(cara) {Codigo=""[fonte=""+cara+""][/fonte]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "</SCRIPT>" & vbNewLine
Select Case strAcao
Case "inserir"
strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/prod_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Incluir novo produto na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<form method=post ENCTYPE=""multipart/form-data"" action=""administrador.asp?link=produtos&acao=gravanovo"" name=frmprod>"
strTextoHtml = strTextoHtml & "<table align=center width=""90%"">"
varimg = "&nbsp;<img src='adm_imagens/xis.gif' width='15' height='16' border='0' align='absmiddle'>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Data:</b></td><td><FONT face=tahoma  style=font-size:11px>" & dia & "/" & mez & "/" & Year(Date) & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td width=""40%""><FONT face=tahoma  style=font-size:11px><b>Nome do produto:</b></td><td><input name=""nomeprod"" type=""text"" value="""
If Request.QueryString("erro1") <> "sim" Then
strTextoHtml = strTextoHtml & Request.QueryString("erro1")
End If
strTextoHtml = strTextoHtml & """ size=75  style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro1") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Categoria:</b></td><td><select name=""categ"" style=font-size:11px;font-family:tahoma>"
Set pesquisa = conexao.Execute("SELECT id, nome FROM sessoes ORDER by nome;")
While Not pesquisa.EOF
strTextoHtml = strTextoHtml & "<option value=""" & pesquisa("id") & """"
If CStr(pesquisa("id")) = CStr(Request.QueryString("erro10")) Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">" & pesquisa("nome") & "</option>"
pesquisa.movenext
Wend
pesquisa.Close
Set pesquisa = Nothing
strTextoHtml = strTextoHtml & "</select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Peso:</b></td><td><FONT face=tahoma  style=font-size:11px><input name=""peso"" type=""text"" size=10 value="""
If Request.QueryString("erro2") <> "sim" Then
strTextoHtml = strTextoHtml & Request.QueryString("erro2")
End If
strTextoHtml = strTextoHtml & """ style=font-size:11px;font-family:tahoma>&nbsp;Kg "
If Request.QueryString("erro2") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"

strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Preço A VISTA:</b></td><td><FONT face=tahoma  style=font-size:11px>&nbsp;R$ <input name=""precv"" type=""text"" size=15 value="""
If Request.QueryString("erro3") <> "sim" Then
strTextoHtml = strTextoHtml & Request.QueryString("erro3")
End If
strTextoHtml = strTextoHtml & """ style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro3") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Preço A PRAZO:</b></td><td><FONT face=tahoma  style=font-size:11px>&nbsp;<input name=""fabri"" type=""text"" size=2 value="""" style=font-size:11px;font-family:tahoma>X de R$ <input name=""precn"" type=""text"" size=15 value="""
If Request.QueryString("erro4") <> "sim" Then
strTextoHtml = strTextoHtml & Request.QueryString("erro4")
End If
strTextoHtml = strTextoHtml & """ style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro4") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<input type=hidden name=""parc"" value=""v""><input type=hidden name=""juro"" value=""0""><input type=hidden name=""jurodia"" value=""mes"">"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Imagem grande:</b></td><td><FONT face=tahoma  style=font-size:11px><input name=""figurag"" type=""file"" size=15 style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro8") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "<font color=""#003366"" style=font-size:10px>&nbsp;(tamanho ideal: lagura 185px, altura indiferente)</font></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Imagem pequena:</b></td><td><FONT face=tahoma  style=font-size:11px><input name=""figurap"" type=""file""  size=15 style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro9") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "<font color=""#003366"" style=font-size:10px>&nbsp;(tamanho ideal: lagura 75px, altura indiferente)</font></td></tr>"
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=""center"" rowspan=2>"
strTextoHtml = strTextoHtml & "<font style=font-family:tahoma;font-size:11px><b>Formatação de texto:</b> </td><td><a href=""Javascript:negrito();""><img src=""adm_imagens/negrito.gif"" alt=""Negrito"" border=""0""></a>&nbsp;<a href=""Javascript:italico();""><img src=""adm_imagens/italico.gif""  alt=""Itálico"" border=""0""></a>&nbsp;<a href=""Javascript:sublinhado();""><img src=""adm_imagens/sublinhado.gif""  alt=""Sublinhado"" border=""0""></a>&nbsp;&nbsp;<a href=""Javascript:esquerda();""><img src=""adm_imagens/esquerda.gif""  alt=""Alinhar à esquerda"" border=""0""></a>&nbsp;<a href=""Javascript:centralizado();""><img src=""adm_imagens/centraliza.gif""  alt=""Centralizado"" border=""0""></a>&nbsp;<a href=""Javascript:direita();""><img src=""adm_imagens/direita.gif""  alt=""Alinhar à direita"" border=""0""></a>&nbsp;<a href=""Javascript:justificar();""><img src=""adm_imagens/justificado.gif""  alt=""Justificar"" border=""0""></a>&nbsp;&nbsp;<a href=""Javascript:link();""><img src=""adm_imagens/link.gif""  alt=""Inserir Hyperlink"" border=""0"">"
strTextoHtml = strTextoHtml & "</a>&nbsp;<a href=""Javascript:email();""><img src=""adm_imagens/email.gif""  alt=""Inserir E-mail"" border=""0""></a>&nbsp;&nbsp;<a href=""Javascript:linha();""><img src=""adm_imagens/linha.gif""  alt=""Linha horizontal"" border=""0""></a>&nbsp;<a href=""Javascript:comentario();""><img src=""adm_imagens/comentario.gif""  alt=""Inserir Comentário"" border=""0""></a>&nbsp;<a href=""Javascript:lista();""><img src=""adm_imagens/lista.gif""  alt=""Inserir Lista"" border=""0""></a></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=""top"">"
strTextoHtml = strTextoHtml & "<select name=""cara"" onChange=""fontecara(this.options[this.selectedIndex].value)"" style=font-size:11px;font-family:tahoma><option value=""Andale Mono"">Andale Mono</option><option value=""Arial"">Arial</option><option value=""Arial Black"">Arial Black</option><option value=""Book Antiqua"">Book Antiqua</option><option value=""Century Gothic"">Century Gothic</option><option value=""Comic Sans MS"">Comic Sans MS</option><option value=""Courier New"">Courier New</option><option value=""Georgia"">Georgia</option><option value=""Impact"">Impact</option><option value=""Tahoma"" selected>Tahoma</option><option value=""Times New Roman"">Times New Roman</option><option value=""Trebuchet MS"">Trebuchet MS</option><option value=""Script MT Bold"">Script MT Bold</option><option value=""Stencil"">Stencil</option><option value=""Verdana"">Verdana</option><option value=""Lucida Console"">Lucida Console</option></select>&nbsp;"
strTextoHtml = strTextoHtml & "<select name=""tamanho"" onChange=""tamanhofonte(this.options[this.selectedIndex].value)"" style=font-size:11px;font-family:tahoma><option value=""1"" selected>1</option><option value=""2"">2</option><option value=""3"">3</option><option value=""4"">4</option><option value=""5"">5</option><option value=""6"">6</option></select>&nbsp;"
strTextoHtml = strTextoHtml & "<select name=""cor"" onChange=""corfonte(this.options[this.selectedIndex].value)"" style=font-size:11px;font-family:tahoma><option value=""preto"" selected>Preto</option><option value=""vermelho"">Vermelho</option><option value=""amarelo"">Amarelo</option><option value=""rosa"">Rosa</option><option value=""verde"">Verde</option><option value=""laranja"">Laranja</option><option value=""roxo"">Roxo</option><option value=""azul"">Azul</option><option value=""bege"">Bege</option><option value=""marron"">Marron</option></select>"
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Descrição:</b></td><td><textarea name=""descri"" rows=15 cols=75 style=font-size:11px;font-family:tahoma>" & Session("adm_descprod") & "</textarea>"
If Request.QueryString("erro6") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Estoque:</b></td><td><select name=""estoq"" style=font-size:11px;font-family:tahoma><option value=""s"" "
If CStr(Request.QueryString("erro11")) = "s" Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">Disponível<option value=""n"" "
If CStr(Request.QueryString("erro11")) = "n" Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">Não disponível</select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center height=15></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td align=center></td><td align=center>&nbsp;&nbsp;&nbsp;&nbsp;<input type=""submit"" NAME=""Enter"" style=font-size:11px;font-family:tahoma value="" Gravar produto ""> <input type=""reset"" value=""Limpar formulario"" style=font-size:11px;font-family:tahoma></td></table><br><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br></form>"

Case "gravanovo"
Response.Expires = 0
byteCount = Request.TotalBytes
RequestBin = Request.BinaryRead(byteCount)
Set UploadRequest = CreateObject("Scripting.Dictionary")
BuildUploadRequest RequestBin
'variaveis
nome = Trim(UploadRequest.Item("nomeprod").Item("Value"))
categ = Trim(UploadRequest.Item("categ").Item("Value"))
peso = Trim(UploadRequest.Item("peso").Item("Value"))
precov = Trim(UploadRequest.Item("precv").Item("Value"))
precon = Trim(UploadRequest.Item("precn").Item("Value"))
parcelamento = Trim(UploadRequest.Item("parc").Item("Value"))
juros = Trim(UploadRequest.Item("juro").Item("Value"))
juropor = Trim(UploadRequest.Item("jurodia").Item("Value"))
fabricante = Trim(UploadRequest.Item("fabri").Item("Value"))
descricao = Trim(UploadRequest.Item("descri").Item("Value"))
estoq = Trim(UploadRequest.Item("estoq").Item("Value"))
figurg = Trim(UploadRequest.Item("figurag").Item("Value"))
figurp = Trim(UploadRequest.Item("figurap").Item("Value"))

If parcelamento = "v" Then
juros = "0"
Else
juros = juros
End If

If nome = "" Or peso = "" Or precov = "" Or precon = "" Or parcelamento = "" Or juros = "" Or juropor = "" Or fabricante = "" Or descricao = "" Or estoq = "" Or figurg = "" Or figurp = "" Then

If parcelamento = "" Then
erro14 = "sim"
Else
erro14 = parcelamento
End If
If juropor = "" Then
erro13 = "sim"
Else
erro13 = juropor
End If
If categ = "" Then
erro10 = "sim"
Else
erro10 = categ
End If
If estoq = "" Then
erro11 = "sim"
Else
erro11 = estoq
End If
If figurg = "" Then
erro8 = "sim"
Else
erro8 = figurg
End If
If figurp = "" Then
erro9 = "sim"
Else
erro9 = figurp
End If
If nome = "" Then
erro1 = "sim"
Else
erro1 = nome
End If
If peso = "" Then
erro2 = "sim"
Else
erro2 = peso
End If
If precov = "" Then
erro3 = "sim"
Else
erro3 = precov
End If
If precon = "" Then
erro4 = "sim"
Else
erro4 = precon
End If
If fabricante = "" Then
erro5 = "sim"
Else
erro5 = fabricante
End If
If descricao = "" Then
erro6 = "sim"
Session("adm_descprod") = ""
Else
Session("adm_descprod") = descricao
End If
If juros = "" Then
erro12 = "sim"
Else
erro12 = juros
End If

Response.Redirect "?link=produtos&acao=inserir&erro14=" & erro14 & "&erro88=" & erro88 & "&erro99=" & erro99 & "&erro10=" & erro10 & "&erro11=" & erro11 & "&erro12=" & erro12 & "&erro13=" & erro13 & "&erro1=" & erro1 & "&erro2=" & erro2 & "&erro3=" & erro3 & "&erro4=" & erro4 & "&erro5=" & erro5 & "&erro6=" & erro6 & "&erro8=" & erro8 & "&erro9=" & erro9

End If

strString = descricao
strString = Codifica(strString)
descricao = ""
descricao = strString

Set selectfig = conexao.Execute("SELECT * FROM produtos WHERE imgra = '" & FileName & "';")

ContentType = UploadRequest.Item("figurag").Item("ContentType")
filepathname = UploadRequest.Item("figurag").Item("FileName")
FileName = Right(filepathname, Len(filepathname) - InStrRev(filepathname, "\"))

Set selectfig = conexao.Execute("SELECT * FROM produtos WHERE imgra = '" & FileName & "';")

Value = UploadRequest.Item("figurag").Item("Value")
Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
numero1 = instrrev(Request.servervariables("Path_Info"), "/")
var3 = left(Request.servervariables("Path_Info"),numero1)
Set MyFile = ScriptObject.CreateTextFile(Server.mappath(var3) & "\produtos\g_" & FileName)
For i = 1 To LenB(Value)
MyFile.Write Chr(AscB(MidB(Value, i, 1)))
Next
MyFile.Close

contentType2 = UploadRequest.Item("figurap").Item("ContentType")
filepathname2 = UploadRequest.Item("figurap").Item("FileName")
filename2 = Right(filepathname2, Len(filepathname2) - InStrRev(filepathname2, "\"))
value2 = UploadRequest.Item("figurap").Item("Value")
Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
numero2 = instrrev(Request.servervariables("Path_Info"), "/")
var32 = left(Request.servervariables("Path_Info"),numero2)
Set MyFile2 = ScriptObject.CreateTextFile(Server.mappath(var32) & "\produtos\p_" & filename2)
For i = 1 To LenB(value2)
MyFile2.Write Chr(AscB(MidB(value2, i, 1)))
Next
MyFile2.Close

textosql = "INSERT INTO produtos (nome, fabricante, detalhe, preco, precovelho, parcela" _
& ", juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status) VALUES ('" & nome & "', " _
& "'" & fabricante & "', '" & descricao & "', '" & precon & "', '" & precov & "', '" & parcelamento & "'" _
& ", '" & juros & "', '" & juropor & "', '" & estoq & "', '" & categ & "', '" & dia & "/" & mez & "/" & Year(Date) & "'," _
& " '" & peso & "', 'g_" & FileName & "', 'p_" & filename2 & "', 'nao')"
Set gravaprod = conexao.Execute(textosql)
strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/prod_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Novo produto incluído com sucesso</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<center><FONT face=tahoma  style=font-size:11px><b><A href=""?link=produtos&acao=inserir&acaba=sim"">Inserir um novo produto na loja</a></b></center>"
strTextoHtml = strTextoHtml & "<hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc><br>"
strTextoHtml = strTextoHtml & "<table align=center width=""88%"" cellspacing=""2"" cellpadding=""2"">"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Data:</b></td><td><FONT face=tahoma  style=font-size:11px>" & dia & "/" & mez & "/" & Year(Date) & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td width=""40%""><FONT face=tahoma  style=font-size:11px><b>Nome do produto:</b></td><td><FONT face=tahoma  style=font-size:11px>" & nome & "</b></td></tr>"
Set setcat = conexao.Execute("SELECT nome FROM sessoes WHERE id = " & categ & ";")
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Categoria:</b></td><td><FONT face=tahoma  style=font-size:11px>" & setcat("nome") & "</b></td></tr>"
setcat.Close
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Peso:</b></td><td><FONT face=tahoma  style=font-size:11px>" & peso & " Kg</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Preço A VISTA:</b></td><td><FONT face=tahoma  style=font-size:11px>R$ " & FormatNumber(precov, 2) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Preço A PRAZO:</b></td><td><FONT face=tahoma  style=font-size:11px>R$ " & FormatNumber(precon, 2) & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Parcelamento:</b></td><td><FONT face=tahoma  style=font-size:11px>"
If parcelamento = "v" Then
strTextoHtml = strTextoHtml & "à Vista sem juros."
Else
strTextoHtml = strTextoHtml & parcelamento & "x  com juros de " & juros & "% ao "
If juropor = "mes" Then
strTextoHtml = strTextoHtml & "mês."
Else
strTextoHtml = strTextoHtml & "ano."
End If
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Imagem pequena:</b></td><td><FONT face=tahoma  style=font-size:11px><b>Imagem grande:</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=center width=""40%"" align=center style=""border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;""><img src=""produtos/p_" & filename2 & """ vsapce=5 hsapce=5  width=""75""></td><td valign=center width=""30%"" align=center style=""border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;""><img src=""produtos/g_" & FileName & """ width=185 vsapce=5 hsapce=5></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Fabricante:</b></td><td><FONT face=tahoma  style=font-size:11px>" & fabricante & "</b></td></tr>"
strString = descricao
strString = Decodifica(strString)
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Descrição:</b></td><td><div id=""layer1"" style=""position:absolute; width:378px; height:175px; z-index:1""><table width=""100%"" height=""100%""><tr><td></td></tr></table></div><FONT face=tahoma  style=font-size:11px><textarea name=""descri"" rows=13 cols=75 style=""font-size:11px;font-family:tahoma;border:1px #cccccc solid"">" & strString & "</textarea></b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Estoque:</b></td><td><FONT face=tahoma  style=font-size:11px>"
If estoq = "s" Then
strTextoHtml = strTextoHtml & "Disponível"
Else
strTextoHtml = strTextoHtml & "Não disponível"
End If
strTextoHtml = strTextoHtml & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center height=15></td></tr></table><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br><br>"

Case "editar"

finalera = Request.QueryString("final")
pag = Request.QueryString("itens")
pesss = Trim(Request.QueryString("pesq"))
pagdxx = Request.QueryString("pagina")
pesqsa = Request.QueryString("pesqsa")
catege = Request("cat")
If pesss = "" Then
pesss = "-"
palavra = Split(Trim("asdfghjklçqwertyuiopzxcvbnm"), " ")
Else
pesss = pesss
palavra = Split(Trim(Request.QueryString("pesq")), " ")
End If
If pag = "" Then
inicial = 0
final = 10
Else
inicial = pag
final = 10
End If
If pesqsa = "" Then
restinho = ""
catege = "todos"
Else
If catege = "todos" Or catege = "xxx" Or catege = "" Then
resto = ""
Else
resto = "idsessao = '" & catege & "' and"
End If
palavraz = Split(Trim(pesqsa), " ")
restinho = "WHERE " & resto & " nome LIKE '%" & palavraz(0) & "%'"
End If


If VersaoDb = 1 then
   Set rs = conexao.Execute("SELECT * FROM produtos " & restinho & " ORDER by nome asc LIMIT " & inicial & "," & final & ";")
else
   set rs = createobject("adodb.recordset")
   set rs.activeconnection = conexao
   rs.cursortype = 3
   rs.pagesize = final
   rs.open "SELECT * FROM produtos " & restinho & " ORDER by nome asc"
end if

If rs.EOF Or rs.bof Then

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/prod_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Editar produtos na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Produtos(s) encontrado(s): <b>0" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table cellspacing=""3"" cellpadding=""3"" align=center width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><form action=""?"" method=get><input name=""link"" type=""hidden"" value=""produtos""><input name=""acao"" type=""hidden"" value=""editar"">"
strTextoHtml = strTextoHtml & "<td align=center><font face=""tahoma"" style=font-size:11px;color:000000><center>Para uma busca mais detalhada dos produtos na loja realize uma pesquisa com o nome e/ou palavra-chave do produto  que você procura.</td><tr><td align=center>"
strTextoHtml = strTextoHtml & "<input name=""pesqsa"" type=""text"" value=""" & Request("pesqsa") & """ style=font-size:11px;color:000000;font-family:tahoma><font style=font-size:11px> em <select name=cat style=font-size:11px;font-family:tahoma>"
strTextoHtml = strTextoHtml & "<option value=todos>toda loja</option>"
strTextoHtml = strTextoHtml & "<option value=xxx>--------------------</option>"
Set Menu = conexao.Execute("SELECT * FROM sessoes ORDER by nome;")
If Err.Number <> 0 Then
strTextoHtml = ""
strTextoHtml = strTextoHtml & "<meta http-equiv=""refresh"" content=""0"">"
Response.Write strTextoHtml
Response.End
End If
While Not Menu.EOF
strTextoHtml = strTextoHtml & "<option value=""" & Menu("id") & """ "
If CStr(Request("cat")) = CStr(Menu("id")) Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">" & LCase(Menu("nome")) & "</option>"
Menu.movenext
Wend
Menu.Close
Set Menu = Nothing
 
strTextoHtml = strTextoHtml & "</select></font> <input type=submit class=""ok"" value=""Pesquisar"" style=font-size:11px;color:000000;font-family:tahoma>"
strTextoHtml = strTextoHtml & "</td></form></tr><tr><td height=1 bgcolor=cccccc></td></tr></table><br><br>"
strTextoHtml = strTextoHtml & "<table width=565 align=center>"
strTextoHtml = strTextoHtml & "<tr><td align=center><br><br><b><font style=font-size:11px>Nenhum produto foi encontrado na base de dados da loja.<br><br></b><br><br></td></tr></table>"
strTextoHtml = strTextoHtml & "<br></table>"
strTextoHtml = strTextoHtml & "<table width=""100%"" cellspacing=""0"" cellpadding=""0""><tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc width=""101%""></td></tr><tr><td></td><td align=right><font face=""tahoma"" style=font-size:11px;color:000000>"
strTextoHtml = strTextoHtml & "&nbsp;<font face=""tahoma"" style=font-size:11px>Página(s): <b><u>1</u></b></a></font></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table><td></tr></table>"

Else
Set rs2 = conexao.Execute("SELECT count(nome) AS total FROM produtos " & restinho & ";")
totalreg = rs2("total")
rs2.Close
Set rs2 = Nothing
numiz = Request("pagina") & "0"
numiz = CInt(numiz)
iz = iz + numiz

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/prod_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Editar produtos na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Produtos(s) encontrado(s): <b>" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table cellspacing=""3"" cellpadding=""3"" align=center width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><form action=""?"" method=get><input name=""link"" type=""hidden"" value=""produtos""><input name=""acao"" type=""hidden"" value=""editar"">"
strTextoHtml = strTextoHtml & "<td align=center><font face=""tahoma"" style=font-size:11px;color:000000><center>Para uma busca mais detalhada dos produtos na loja realize uma pesquisa com o nome e/ou palavra-chave do produto  que você procura.</td><tr><td align=center>"
strTextoHtml = strTextoHtml & "<input name=""pesqsa"" type=""text"" value=""" & Request("pesqsa") & """ style=font-size:11px;color:000000;font-family:tahoma><font style=font-size:11px> em <select name=cat style=font-size:11px;font-family:tahoma>"
strTextoHtml = strTextoHtml & "<option value=todos>toda loja</option>"
strTextoHtml = strTextoHtml & "<option value=xxx>--------------------</option>"

Set Menu = conexao.Execute("SELECT * FROM sessoes ORDER by nome;")
If Err.Number <> 0 Then
strTextoHtml = ""
strTextoHtml = strTextoHtml & "<meta http-equiv=""refresh"" content=""0"">"
Response.Write strTextoHtml
Response.End
End If
While Not Menu.EOF
strTextoHtml = strTextoHtml & "<option value=""" & Menu("id") & """ "
If CStr(catege) = CStr(Menu("id")) Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">" & LCase(Menu("nome")) & "</option>"
Menu.movenext
Wend
Menu.Close
Set Menu = Nothing
 
strTextoHtml = strTextoHtml & "</select></font> <input type=submit class=""ok"" value=""Pesquisar"" style=font-size:11px;color:000000;font-family:tahoma>"
strTextoHtml = strTextoHtml & "</td></form></tr><tr><td height=1 bgcolor=cccccc></td></tr></table><br><br>"
strTextoHtml = strTextoHtml & "<table width=""100%"" align=center>"

If VersaoDb = 1 then

While Not rs.EOF
iz = iz + 1
If rs("estoque") = "s" Then
varestoq = "<font color=#000000>Disponível</font>"
Else
varestoq = "<font color=#b23c04>Não disponível </font>"
End If
if VersaoDb = 1 Then
   Set rs3 = conexao.Execute("SELECT nome FROM sessoes WHERE id = '" & rs("idsessao") & "';")
else
   Set rs3 = conexao.Execute("SELECT nome FROM sessoes WHERE id =" & rs("idsessao"))
end if

varsessao = rs3("nome")

strTextoHtml = strTextoHtml & "<tr><td align=left valign=center>"
strTextoHtml = strTextoHtml & "<table width=""100%"" bgcolor=#eeeeee style='border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;'><tr><td valign=center><font face=""tahoma"" style=font-size:11px;color:000000>" & iz & ") <b>" & UCase(rs("nome")) & "</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Departamento: <b>" & varsessao & "</b> &nbsp;&nbsp;&nbsp;Estoque: <b>" & varestoq & "</b></td><td align=right valign=center><font face=""tahoma"" style=font-size:11px;color:000000>Ação: <b><a href=?link=produtos&acao=ver&prod=" & rs("idprod") & ">Ver</a></b> | <b><a href=?link=produtos&acao=edita&prod=" & rs("idprod") & ">Editar</a></b>&nbsp;</td></tr></table> <table><tr><td height=4></td></tr></table>"
rs.movenext
pagn = inicial + 10
Wend


paga = pagn - 20

If totalreg Mod 10 <> 0 Then
valor = 1
Else
valor = 0
End If
pagina = Fix(totalreg / 10) + valor
pagina = Replace(pagina, ",", "")
pagdxx = pagdxx + 1
pagdxx = Replace(pagdxx, ",", "")
pagdxx2 = pagdxx - 2
pagdxx2 = Replace(pagdxx2, ",", "")
paga = Replace(paga, ",", "")
pagn = Replace(pagn, ",", "")
If pagdxx = "" Then pagdxx = 1
If pagina = "0" Then pagina = "1"

strTextoHtml = strTextoHtml & "<table width=565>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<center><br>"

If paga < 0 Then
paga = 0
Else

strTextoHtml = strTextoHtml & "<a HREF=""?link=produtos&acao=editar&itens=" & paga & "&pagina=" & pagdxx2 & "&pesqsa=" & pesqsa & "&cat=" & catege & """ style=""color:000000""><font face=""tahoma"" style=font-size:11px><b>Página Anterior</b></a></font>&nbsp;&nbsp;"

End If
If totalreg < final Or totalreg = 10 Or pagdxx = pagina Then
totalreg = ""
npc = 1
totalp = 1
Else
variavel1 = CStr(pagdxx + 1)
variavel2 = CStr(pagina)
variavel1 = Replace(variavel1, ",", "")
variavel2 = Replace(variavel2, ",", "")
strTextoHtml = strTextoHtml & "&nbsp;&nbsp;<a HREF=""?link=produtos&acao=editar&itens=" & pagn & "&pagina=" & pagdxx & "&pesqsa=" & pesqsa & "&cat=" & catege
If variavel1 = variavel2 Then
strTextoHtml = strTextoHtml & "&final=sim"""
End If
strTextoHtml = strTextoHtml & " style=""color:000000""><font face=""tahoma"" style=font-size:11px><b>Próxima página</b></a></font>"
End If
strTextoHtml = strTextoHtml & "<table width=100% cellspacing=""0"" cellpadding=""0""><tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc width=""101%""></td></tr><tr><td><font face=""tahoma"" style=font-size:11px;color:000000>Página <B>" & pagdxx & "</B> de <B>" & pagina & "</B></td><td align=right><font face=""tahoma"" style=font-size:11px;color:000000>"
If pagina = 1 Then
finalera = "sim"
End If
If pagina <> 1 Then
For i = 1 To pagina - 1
i = Replace(i, ",", "")
i2 = i - 1
i2 = Replace(i2, ",", "")
fator = 10
totalfator = fator * i - 10
totalfator = Replace(totalfator, ",", "")
paginadem = pagdxx
paginadem = Replace(paginadem, ",", "")
strTextoHtml = strTextoHtml & " &nbsp;<a HREF=""?link=produtos&acao=editar&itens=" & totalfator & "&pagina=" & i2 & "&pesqsa=" & pesqsa & "&cat=" & catege & """ style=""color:000000""><font face=""tahoma"" style=font-size:11px>"
If paginadem = i Then
strTextoHtml = strTextoHtml & "<b><u>"
End If
strTextoHtml = strTextoHtml & Replace(i, ",", "") & "</u></b></a> &middot;</font>"
Next
End If
pagina2 = pagina * 10 - 10
pagina2 = Replace(pagina2, ",", "")
pagina3 = pagina - 1
pagina3 = Replace(pagina3, ",", "")
strTextoHtml = strTextoHtml & " &nbsp;<a HREF=""?link=produtos&acao=editar&itens=" & pagina2 & "&pagina=" & pagina3 & "&pesqsa=" & pesqsa & "&cat=" & catege & "&final=sim"" style=""color:000000""><font face=""tahoma"" style=font-size:11px>"
If finalera = "sim" Then
strTextoHtml = strTextoHtml & "<b><u>"
End If
strTextoHtml = strTextoHtml & pagina & "</u></b></a></td></tr>"
else

pag = request.querystring("pagina")
if pag = "" Then
   pag = 1
end if

contador = 0
rs.absolutepage = pag
while not rs.eof and contador < rs.pagesize
contador = contador +1

iz = iz + 1
If rs("estoque") = "s" Then
varestoq = "<font color=#000000>Disponível</font>"
Else
varestoq = "<font color=#b23c04>Não disponível </font>"
End If
if VersaoDb = 1 Then
   Set rs3 = conexao.Execute("SELECT nome FROM sessoes WHERE id = '" & rs("idsessao") & "';")
else
   Set rs3 = conexao.Execute("SELECT nome FROM sessoes WHERE id =" & rs("idsessao"))
end if

varsessao = rs3("nome")

strTextoHtml = strTextoHtml & "<tr><td align=left valign=center>"
strTextoHtml = strTextoHtml & "<table width=""100%"" bgcolor=#eeeeee style='border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;'><tr><td valign=center><font face=""tahoma"" style=font-size:11px;color:000000>" & iz & ") <b>" & UCase(rs("nome")) & "</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Departamento: <b>" & varsessao & "</b> &nbsp;&nbsp;&nbsp;Estoque: <b>" & varestoq & "</b></td><td align=right valign=center><font face=""tahoma"" style=font-size:11px;color:000000>Ação: <b><a href=?link=produtos&acao=ver&prod=" & rs("idprod") & ">Ver</a></b> | <b><a href=?link=produtos&acao=edita&prod=" & rs("idprod") & ">Editar</a></b>&nbsp;</td></tr></table> <table><tr><td height=4></td></tr></table>"


rs.movenext
wend
strTextoHtml = strTextoHtml & "<table width=565>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<center><br>"

strTextoHtml = strTextoHtml & "<table width=100% cellspacing=""0"" cellpadding=""0""><tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc width=""101%""></td></tr><tr><td colspan=2 align=right><font face=""tahoma"" style=font-size:11px;color:000000>"

strTextoHtml = strTextoHtml & "Página(s):&nbsp;&nbsp;"

for i = 1 to rs.pagecount

if i = cint(pag) then
   strTextoHtml = strTextoHtml & "<u><b>" & i & "</b></u> "
else
   strTextoHtml = strTextoHtml & "<a href='?link=produtos&acao=editar&acaba=sim&pagina=" & i & "&pesqsa=" & pesqsa & "&cat=" & catege & "'>" & i & "</a> "
end if

next

strTextoHtml = strTextoHtml & "</td></tr>"
end if


strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & " </tr></table></td></tr></table> </td></tr></table></td></tr></table></td></tr></table>"
rs.Close
Set rs = Nothing
End If
Case "ver"
Set setprod = conexao.Execute("SELECT * FROM produtos WHERE idprod = " & Request("prod") & ";")
nome = setprod("nome")
categ = setprod("idsessao")
peso = setprod("peso")
precov = setprod("precovelho")
precon = setprod("preco")
parcelamento = setprod("parcela")
juros = setprod("juro")
juropor = setprod("aomes")
fabricante = setprod("fabricante")
descricao = setprod("detalhe")
estoq = setprod("estoque")
figurg = setprod("imgra")
figurp = setprod("impeq")
If Request("status") = "sucesso" Then
strTextoHtml = strTextoHtml & " <BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/prod_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Produto editado com sucesso</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & " <hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & " <center><FONT face=tahoma  style=font-size:11px><b><A href=""?link=produtos&acao=edita&prod=" & Request("prod") & "&acaba=sim"">Editar novamente este produto</a></b> |<b><A href=""?link=produtos&acao=editar&acaba=sim""> Ver novamente todos os produtos</a></b></center>"
Else
strTextoHtml = strTextoHtml & " <BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/prod_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Ver produto cadastrado na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & " <hr size=1 color=ffffff>"
If Request("modo") = "exclui" Then

strTextoHtml = strTextoHtml & "<script language=""javascript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function prod" & Request("prod") & "(){" & vbNewLine
strTextoHtml = strTextoHtml & "if (confirm('Você realmente deseja excluir este produto?'))" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "window.location.href('?link=produtos&acao=exclui&prod=" & Request("prod") & "');" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "else" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "}}" & vbNewLine
strTextoHtml = strTextoHtml & "</script>" & vbNewLine
strTextoHtml = strTextoHtml & " <center><FONT face=tahoma  style=font-size:11px><b><a href=""javascript: prod" & Request("prod") & "();"">Excluir este produto</a></b> |<b><A href=""?link=produtos&acao=excluir&acaba=sim""> Ver todos os produtos</a></b></center>"
Else
strTextoHtml = strTextoHtml & " <center><FONT face=tahoma  style=font-size:11px><b><A href=""?link=produtos&acao=edita&prod=" & Request("prod") & "&acaba=sim"">Editar este produto</a></b> |<b><A href=""?link=produtos&acao=editar&acaba=sim""> Ver todos os produtos</a></b></center>"
End If
End If
strTextoHtml = strTextoHtml & " <hr size=1 color=ffffff>"
strTextoHtml = strTextoHtml & " <hr size=1 color=cccccc><br>"
strTextoHtml = strTextoHtml & " <table align=center width=""88%"" cellspacing=""2"" cellpadding=""2"">"
strTextoHtml = strTextoHtml & " <tr><td><FONT face=tahoma  style=font-size:11px><b>Data:</b></td><td><FONT face=tahoma  style=font-size:11px>" & setprod("data") & "</td></tr>"
strTextoHtml = strTextoHtml & " <tr><td width=""40%""><FONT face=tahoma  style=font-size:11px><b>Nome do produto:</b></td><td><FONT face=tahoma  style=font-size:11px>" & nome & "</b></td></tr>"
Set setcat = conexao.Execute("SELECT nome FROM sessoes WHERE id = " & categ & ";")
strTextoHtml = strTextoHtml & " <tr><td><FONT face=tahoma  style=font-size:11px><b>Categoria:</b></td><td><FONT face=tahoma  style=font-size:11px>" & setcat("nome") & "</b></td></tr>"
setcat.Close
strTextoHtml = strTextoHtml & " <tr><td><FONT face=tahoma  style=font-size:11px><b>Peso:</b></td><td><FONT face=tahoma  style=font-size:11px>" & peso & " Kg</b></td></tr>"
strTextoHtml = strTextoHtml & " <tr><td><FONT face=tahoma  style=font-size:11px><b>Preço A VISTA:</b></td><td><FONT face=tahoma  style=font-size:11px>R$ " & FormatNumber(precov, 2) & "</b></td></tr>"
strTextoHtml = strTextoHtml & " <tr><td><FONT face=tahoma  style=font-size:11px><b>Preço A PRAZO:</b></td><td><FONT face=tahoma  style=font-size:11px>R$ " & FormatNumber(precon, 2) & "</b></td></tr>"
strTextoHtml = strTextoHtml & " <tr><td><FONT face=tahoma  style=font-size:11px><b>Parcelamento:</b></td><td><FONT face=tahoma  style=font-size:11px>"
If parcelamento = "v" Then
strTextoHtml = strTextoHtml & "à Vista."
Else
strTextoHtml = strTextoHtml & parcelamento & "x com juros de " & juros & "% ao "
If juropor = "mes" Then
strTextoHtml = strTextoHtml & "mês"
Else
strTextoHtml = strTextoHtml & "ano"
End If
strTextoHtml = strTextoHtml & ".</td></tr>"
End If
strTextoHtml = strTextoHtml & " <tr><td><FONT face=tahoma  style=font-size:11px><b>Imagem pequena:</b></td><td><FONT face=tahoma  style=font-size:11px><b>Imagem grande:</b></td></tr>"
strTextoHtml = strTextoHtml & " <tr><td valign=center width=""40%"" align=center style=""border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;""><img src=""produtos/" & figurp & """ vsapce=5 hsapce=5  width=""75""></td><td valign=center width=""30%"" align=center style=""border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;""><img src=""produtos/" & figurg & """ width=185 vsapce=5 hsapce=5></td></tr>"
strString = descricao
strString = Decodifica(strString)
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Descrição:</b></td><td><div id=""layer1"" style=""position:absolute; width:378px; height:175px; z-index:1""><table width=""100%"" height=""100%""><tr><td></td></tr></table></div><FONT face=tahoma  style=font-size:11px><textarea name=""descri"" rows=13 cols=75 style=""font-size:11px;font-family:tahoma;border:1px #cccccc solid"">" & strString & "</textarea></b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Estoque:</b></td><td><FONT face=tahoma  style=font-size:11px>"
If estoq = "s" Then
strTextoHtml = strTextoHtml & "Disponível"
Else
strTextoHtml = strTextoHtml & "Não disponível"
End If
strTextoHtml = strTextoHtml & "</b></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center height=15></td></tr></table><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br><br>"
Case "edita"
Set setprod = conexao.Execute("SELECT * FROM produtos WHERE idprod = " & Request("prod") & ";")
strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/prod_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Editar produto na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<form method=post ENCTYPE=""multipart/form-data"" action=""?link=produtos&acao=gravavelho"" name=frmprod>"
strTextoHtml = strTextoHtml & "<input name=""prod"" type=""hidden"" value=""" & Request("prod") & """>"
strTextoHtml = strTextoHtml & "<table align=center width=""90%"">"
varimg = "&nbsp;<img src='adm_imagens/xis.gif' width='15' height='16' border='0' align='absmiddle'>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Data:</b></td><td><FONT face=tahoma  style=font-size:11px>" & setprod("data") & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td width=""40%""><FONT face=tahoma  style=font-size:11px><b>Nome do produto:</b></td><td><input name=""nomeprod"" type=""text"" value=""" & setprod("nome") & """ size=75  style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro1") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Categoria:</b></td><td><select name=""categ"" style=font-size:11px;font-family:tahoma>"
Set pesquisa = conexao.Execute("SELECT id, nome FROM sessoes ORDER by nome;")
While Not pesquisa.EOF
strTextoHtml = strTextoHtml & "<option value=""" & pesquisa("id") & """ "
If CStr(pesquisa("id")) = CStr(setprod("idsessao")) Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">" & pesquisa("nome") & "</option>"
pesquisa.movenext
Wend
pesquisa.Close
Set pesquisa = Nothing
strTextoHtml = strTextoHtml & "</select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Peso:</b></td><td><FONT face=tahoma  style=font-size:11px><input name=""peso"" type=""text"" size=10 value=""" & setprod("peso") & """ style=font-size:11px;font-family:tahoma>&nbsp;Kg "
If Request.QueryString("erro2") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"

strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Preço A VISTA:</b></td><td><FONT face=tahoma  style=font-size:11px>&nbsp;R$ <input name=""precv"" type=""text"" size=15 value=""" & setprod("precovelho") & """ style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro3") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Preço A PRAZO:</b></td><td><FONT face=tahoma  style=font-size:11px>&nbsp;<input name=""fabri"" type=""text"" size=2 value="""" style=font-size:11px;font-family:tahoma>X de R$ <input name=""precn"" type=""text"" size=15 value=""" & setprod("preco") & """ style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro4") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"

strTextoHtml = strTextoHtml & "<input type=hidden name=""parc"" value=""v""><input type=hidden name=""juro"" value=""0""><input type=hidden name=""jurodia"" value=""mes"">"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Imagem grande:</b></td><td><FONT face=tahoma  style=font-size:11px><input name=""figurag"" type=""file"" size=15 style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro8") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "<font color=""#003366"" style=font-size:10px>(caso não deseje editar a foto deixe em branco)</font></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Imagem pequena:</b></td><td><FONT face=tahoma  style=font-size:11px><input name=""figurap"" type=""file""  size=15 style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro9") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "<font color=""#003366"" style=font-size:10px>(caso não deseje editar a foto deixe em branco)</font></td></tr>"
strTextoHtml = strTextoHtml & "</td></tr>"
strString = setprod("detalhe")
strString = Decodifica(strString)

strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=""center"" rowspan=2>"
strTextoHtml = strTextoHtml & "<font style=font-family:tahoma;font-size:11px><b>Formatação de texto:</b> </td><td><a href=""Javascript:negrito();""><img src=""adm_imagens/negrito.gif"" alt=""Negrito"" border=""0""></a>&nbsp;<a href=""Javascript:italico();""><img src=""adm_imagens/italico.gif""  alt=""Itálico"" border=""0""></a>&nbsp;<a href=""Javascript:sublinhado();""><img src=""adm_imagens/sublinhado.gif""  alt=""Sublinhado"" border=""0""></a>&nbsp;&nbsp;<a href=""Javascript:esquerda();""><img src=""adm_imagens/esquerda.gif""  alt=""Alinhar à esquerda"" border=""0""></a>&nbsp;<a href=""Javascript:centralizado();""><img src=""adm_imagens/centraliza.gif""  alt=""Centralizado"" border=""0""></a>&nbsp;<a href=""Javascript:direita();""><img src=""adm_imagens/direita.gif""  alt=""Alinhar à direita"" border=""0""></a>&nbsp;<a href=""Javascript:justificar();""><img src=""adm_imagens/justificado.gif""  alt=""Justificar"" border=""0""></a>&nbsp;&nbsp;<a href=""Javascript:link();""><img src=""adm_imagens/link.gif""  alt=""Inserir Hyperlink"" border=""0"">"
strTextoHtml = strTextoHtml & "</a>&nbsp;<a href=""Javascript:email();""><img src=""adm_imagens/email.gif""  alt=""Inserir E-mail"" border=""0""></a>&nbsp;&nbsp;<a href=""Javascript:linha();""><img src=""adm_imagens/linha.gif""  alt=""Linha horizontal"" border=""0""></a>&nbsp;<a href=""Javascript:comentario();""><img src=""adm_imagens/comentario.gif""  alt=""Inserir Comentário"" border=""0""></a>&nbsp;<a href=""Javascript:lista();""><img src=""adm_imagens/lista.gif""  alt=""Inserir Lista"" border=""0""></a></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=""top"">"
strTextoHtml = strTextoHtml & "<select name=""cara"" onChange=""fontecara(this.options[this.selectedIndex].value)"" style=font-size:11px;font-family:tahoma><option value=""Andale Mono"">Andale Mono</option><option value=""Arial"">Arial</option><option value=""Arial Black"">Arial Black</option><option value=""Book Antiqua"">Book Antiqua</option><option value=""Century Gothic"">Century Gothic</option><option value=""Comic Sans MS"">Comic Sans MS</option><option value=""Courier New"">Courier New</option><option value=""Georgia"">Georgia</option><option value=""Impact"">Impact</option><option value=""Tahoma"" selected>Tahoma</option><option value=""Times New Roman"">Times New Roman</option><option value=""Trebuchet MS"">Trebuchet MS</option><option value=""Script MT Bold"">Script MT Bold</option><option value=""Stencil"">Stencil</option><option value=""Verdana"">Verdana</option><option value=""Lucida Console"">Lucida Console</option></select>&nbsp;"
strTextoHtml = strTextoHtml & "<select name=""tamanho"" onChange=""tamanhofonte(this.options[this.selectedIndex].value)"" style=font-size:11px;font-family:tahoma><option value=""1"" selected>1</option><option value=""2"">2</option><option value=""3"">3</option><option value=""4"">4</option><option value=""5"">5</option><option value=""6"">6</option></select>&nbsp;"
strTextoHtml = strTextoHtml & "<select name=""cor"" onChange=""corfonte(this.options[this.selectedIndex].value)"" style=font-size:11px;font-family:tahoma><option value=""preto"" selected>Preto</option><option value=""vermelho"">Vermelho</option><option value=""amarelo"">Amarelo</option><option value=""rosa"">Rosa</option><option value=""verde"">Verde</option><option value=""laranja"">Laranja</option><option value=""roxo"">Roxo</option><option value=""azul"">Azul</option><option value=""bege"">Bege</option><option value=""marron"">Marron</option></select>"
strTextoHtml = strTextoHtml & "</td></tr>"

strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Descrição:</b></td><td><textarea name=""descri"" rows=15 cols=75 style=font-size:11px;font-family:tahoma>" & strString & "</textarea>"
If Request.QueryString("erro6") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"

strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Estoque:</b></td><td><select name=""estoq"" style=font-size:11px;font-family:tahoma><option value=""s"" "
If CStr(setprod("estoque")) = "s" Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">Disponível<option value=""n"" "
If CStr(setprod("estoque")) = "n" Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">Não disponível</select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center height=15></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td align=center></td><td align=center>&nbsp;&nbsp;&nbsp;&nbsp;<input type=""submit"" NAME=""Enter"" style=font-size:11px;font-family:tahoma value="" Editar produto ""> <input type=""reset"" value=""Limpar formulario"" style=font-size:11px;font-family:tahoma></td></table><br><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br></form>"

Case "gravavelho"
Response.Expires = 0
byteCount = Request.TotalBytes
RequestBin = Request.BinaryRead(byteCount)
Set UploadRequest = CreateObject("Scripting.Dictionary")
BuildUploadRequest RequestBin
'variaveis
nome = Trim(UploadRequest.Item("nomeprod").Item("Value"))
categ = Trim(UploadRequest.Item("categ").Item("Value"))
peso = Trim(UploadRequest.Item("peso").Item("Value"))
precov = Trim(UploadRequest.Item("precv").Item("Value"))
precon = Trim(UploadRequest.Item("precn").Item("Value"))
parcelamento = Trim(UploadRequest.Item("parc").Item("Value"))
juros = Trim(UploadRequest.Item("juro").Item("Value"))
juropor = Trim(UploadRequest.Item("jurodia").Item("Value"))
fabricante = Trim(UploadRequest.Item("fabri").Item("Value"))
descricao = Trim(UploadRequest.Item("descri").Item("Value"))
estoq = Trim(UploadRequest.Item("estoq").Item("Value"))
figurg = Trim(UploadRequest.Item("figurag").Item("Value"))
figurp = Trim(UploadRequest.Item("figurap").Item("Value"))

If nome = "" Or peso = "" Or precov = "" Or precon = "" Or parcelamento = "" Or juros = "" Or juropor = "" Or fabricante = "" Or descricao = "" Or estoq = "" Then

If parcelamento = "" Then
erro14 = "sim"
Else
erro14 = parcelamento
End If
If juropor = "" Then
erro13 = "sim"
Else
erro13 = juropor
End If
If categ = "" Then
erro10 = "sim"
Else
erro10 = categ
End If
If estoq = "" Then
erro11 = "sim"
Else
erro11 = estoq
End If
If figurg = "" Then
erro8 = "sim"
Else
erro8 = figurg
End If
If figurp = "" Then
erro9 = "sim"
Else
erro9 = figurp
End If
If nome = "" Then
erro1 = "sim"
Else
erro1 = nome
End If
If peso = "" Then
erro2 = "sim"
Else
erro2 = peso
End If
If precov = "" Then
erro3 = "sim"
Else
erro3 = precov
End If
If precon = "" Then
erro4 = "sim"
Else
erro4 = precon
End If
If fabricante = "" Then
erro5 = "sim"
Else
erro5 = fabricante
End If
If descricao = "" Then
erro6 = "sim"
Session("adm_descprod") = ""
Else
Session("adm_descprod") = descricao
End If
If juros = "" Then
erro12 = "sim"
Else
erro12 = juros
End If

Response.Redirect "?link=produtos&acao=edita2&erro14=" & erro14 & "&erro10=" & erro10 & "&erro99=" & erro99 & "&erro88=" & erro88 & "&erro11=" & erro11 & "&erro12=" & erro12 & "&erro13=" & erro13 & "&erro1=" & erro1 & "&erro2=" & erro2 & "&erro3=" & erro3 & "&erro4=" & erro4 & "&erro5=" & erro5 & "&erro6=" & erro6 & "&erro8=" & erro8 & "&erro9=" & erro9 & "&prod=" & UploadRequest.Item("prod").Item("Value")

End If

If figurg <> "" Or figurp <> "" Then

Set fig = conexao.Execute("SELECT imgra, impeq FROM produtos WHERE idprod = " & UploadRequest.Item("prod").Item("Value") & ";")

ContentType = UploadRequest.Item("figurag").Item("ContentType")
filepathname = UploadRequest.Item("figurag").Item("FileName")
FileName = Right(filepathname, Len(filepathname) - InStrRev(filepathname, "\"))
Value = UploadRequest.Item("figurag").Item("Value")
Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
numero1 = instrrev(Request.servervariables("Path_Info"), "/")
var3 = left(Request.servervariables("Path_Info"),numero1)
Set MyFile = ScriptObject.CreateTextFile(Server.mappath(var3) & "\produtos\" & fig("imgra"))
For i = 1 To LenB(Value)
MyFile.Write Chr(AscB(MidB(Value, i, 1)))
Next
MyFile.Close
contentType2 = UploadRequest.Item("figurap").Item("ContentType")
filepathname2 = UploadRequest.Item("figurap").Item("FileName")
filename2 = Right(filepathname2, Len(filepathname2) - InStrRev(filepathname2, "\"))
value2 = UploadRequest.Item("figurap").Item("Value")
Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
numero2 = instrrev(Request.servervariables("Path_Info"), "/")
var32 = left(Request.servervariables("Path_Info"),numero2)
Set MyFile2 = ScriptObject.CreateTextFile(Server.mappath(var32) & "\produtos\" & fig("impeq"))
For i = 1 To LenB(value2)
MyFile2.Write Chr(AscB(MidB(value2, i, 1)))
Next
MyFile2.Close
End If

strString = descricao
strString = Codifica(strString)
descricao = ""
descricao = strString

textozql = "UPDATE produtos SET nome = '" & nome & "', fabricante = '" & fabricante & "', detalhe = '" & descricao & "', preco = '" & precon & "', precovelho =  '" & precov & "', parcela = '" & parcelamento & "', juro = '" & juros & "', aomes = '" & juropor & "' , estoque = '" & estoq & "', idsessao = '" & categ & "', peso = '" & peso & "' WHERE idprod=" & UploadRequest.Item("prod").Item("Value") & ";"
Set atualizaprod = conexao.Execute(textozql)
Response.Redirect "?link=produtos&acao=ver&status=sucesso&prod=" & UploadRequest.Item("prod").Item("Value")

Case "edita2"
Set setprod = conexao.Execute("SELECT * FROM produtos WHERE idprod = " & Request("prod") & ";")
strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/prod_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Editar produto na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<form method=post ENCTYPE=""multipart/form-data"" action=""?link=produtos&acao=gravavelho"">"
strTextoHtml = strTextoHtml & "<input name=""prod"" type=""hidden"" value=""" & Request("prod") & """>"
strTextoHtml = strTextoHtml & "<table align=center width=""90%"">"
varimg = "&nbsp;<img src='adm_imagens/xis.gif' width='15' height='16' border='0' align='absmiddle'>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Data:</b></td><td><FONT face=tahoma  style=font-size:11px>" & setprod("data") & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td width=""40%""><FONT face=tahoma  style=font-size:11px><b>Nome do produto:</b></td><td><input name=""nomeprod"" type=""text"" value="""
If Request.QueryString("erro1") <> "sim" Then
strTextoHtml = strTextoHtml & Request.QueryString("erro1")
End If
strTextoHtml = strTextoHtml & """ size=75  style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro1") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Categoria:</b></td><td><select name=""categ"" style=font-size:11px;font-family:tahoma>"
Set pesquisa = conexao.Execute("SELECT id, nome FROM sessoes ORDER by nome;")
While Not pesquisa.EOF
strTextoHtml = strTextoHtml & "<option value=""" & pesquisa("id") & """ "
If CStr(pesquisa("id")) = CStr(Request.QueryString("erro10")) Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">" & pesquisa("nome") & "</option>"
pesquisa.movenext
Wend
pesquisa.Close
Set pesquisa = Nothing
strTextoHtml = strTextoHtml & "</select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Peso:</b></td><td><FONT face=tahoma  style=font-size:11px><input name=""peso"" type=""text"" size=10 value="""
If Request.QueryString("erro2") <> "sim" Then
strTextoHtml = strTextoHtml & Request.QueryString("erro2")
End If
strTextoHtml = strTextoHtml & """ style=font-size:11px;font-family:tahoma>&nbsp;Kg "
If Request.QueryString("erro2") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"

strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Preço A VISTA:</b></td><td><FONT face=tahoma  style=font-size:11px>&nbsp;R$ <input name=""precv"" type=""text"" size=15 value="""
If Request.QueryString("erro3") <> "sim" Then
strTextoHtml = strTextoHtml & Request.QueryString("erro3")
End If
strTextoHtml = strTextoHtml & """ style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro3") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Preço A PRAZO:</b></td><td><FONT face=tahoma  style=font-size:11px>&nbsp;<input name=""fabri"" type=""text"" size=2 value="""" style=font-size:11px;font-family:tahoma>X de R$ <input name=""precn"" type=""text"" size=15 value="""
If Request.QueryString("erro4") <> "sim" Then
strTextoHtml = strTextoHtml & Request.QueryString("erro4")
End If
strTextoHtml = strTextoHtml & """ style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro4") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"

strTextoHtml = strTextoHtml & "<input type=hidden name=""parc"" value=""v""><input type=hidden name=""juro"" value=""0""><input type=hidden name=""jurodia"" value=""mes"">"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Imagem grande:</b></td><td><FONT face=tahoma  style=font-size:11px><input name=""figurag"" type=""file"" size=15 style=font-size:11px;font-family:tahoma> <font color=""#003366"" style=font-size:10px>(caso não deseje editar a foto deixe em branco)</font></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Imagem pequena:</b></td><td><FONT face=tahoma  style=font-size:11px><input name=""figurap"" type=""file""  size=15 style=font-size:11px;font-family:tahoma> <font color=""#003366"" style=font-size:10px>(caso não deseje editar a foto deixe em branco)</font></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Fabricante:</b></td><td><input name=""fabri"" type=""text"" size=50 value="""
If Request.QueryString("erro5") <> "sim" Then
strTextoHtml = strTextoHtml & Request.QueryString("erro5")
End If
strTextoHtml = strTextoHtml & """ style=font-size:11px;font-family:tahoma>"
If Request.QueryString("erro5") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Descrição:</b></td><td><textarea name=""descri"" rows=15 cols=75 style=font-size:11px;font-family:tahoma>" & Session("adm_descprod") & "</textarea>"
If Request.QueryString("erro6") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Estoque:</b></td><td><select name=""estoq"" style=font-size:11px;font-family:tahoma><option value=""s"" "
If CStr(Request.QueryString("erro11")) = "s" Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">Disponível<option value=""n"" "
If CStr(Request.QueryString("erro11")) = "n" Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">Não disponível</select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center height=15></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td align=center></td><td align=center>&nbsp;&nbsp;&nbsp;&nbsp;<input type=""submit"" NAME=""Enter"" style=font-size:11px;font-family:tahoma value="" Editar produto ""> <input type=""reset"" value=""Limpar formulario"" style=font-size:11px;font-family:tahoma></td></table><br><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br></form>"

Case "excluir"
finalera = Request.QueryString("final")
pag = Request.QueryString("itens")
pesss = Trim(Request.QueryString("pesq"))
pagdxx = Request.QueryString("pagina")
pesqsa = Request.QueryString("pesqsa")
catege = Request("cat")
If pesss = "" Then
pesss = "-"
palavra = Split(Trim("asdfghjklçqwertyuiopzxcvbnm"), " ")
Else
pesss = pesss
palavra = Split(Trim(Request.QueryString("pesq")), " ")
End If
If pag = "" Then
inicial = 0
final = 10
Else
inicial = pag
final = 10
End If
If pesqsa = "" Then
restinho = ""
catege = "todos"
Else
If catege = "todos" Or catege = "xxx" Or catege = "" Then
resto = ""
Else
resto = "idsessao = '" & catege & "' and"
End If
palavraz = Split(Trim(pesqsa), " ")
restinho = "WHERE " & resto & " nome LIKE '%" & palavraz(0) & "%'"
End If


If VersaoDb = 1 then
   Set rs = conexao.Execute("SELECT * FROM produtos " & restinho & " ORDER by nome asc LIMIT " & inicial & "," & final & ";")
else
   set rs = createobject("adodb.recordset")
   set rs.activeconnection = conexao
   rs.cursortype = 3
   rs.pagesize = final
   rs.open "SELECT * FROM produtos " & restinho & " ORDER by nome asc"
end if

If rs.EOF Or rs.bof Then

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/prod_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Excluir produtos na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Produtos(s) encontrado(s): <b>0" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table cellspacing=""3"" cellpadding=""3"" align=center width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><form action=""?"" method=get><input name=""link"" type=""hidden"" value=""produtos""><input name=""acao"" type=""hidden"" value=""excluir"">"
strTextoHtml = strTextoHtml & "<td align=center><font face=""tahoma"" style=font-size:11px;color:000000><center>Para uma busca mais detalhada dos produtos na loja realize uma pesquisa com o nome e/ou palavra-chave do produto  que você procura.</td><tr><td align=center>"
strTextoHtml = strTextoHtml & "<input name=""pesqsa"" type=""text"" value=""" & Request("pesqsa") & """ style=font-size:11px;color:000000;font-family:tahoma><font style=font-size:11px> em <select name=cat style=font-size:11px;font-family:tahoma>"
strTextoHtml = strTextoHtml & "<option value=todos>toda loja</option>"
strTextoHtml = strTextoHtml & "<option value=xxx>--------------------</option>"
Set Menu = conexao.Execute("SELECT * FROM sessoes ORDER by nome;")
While Not Menu.EOF
strTextoHtml = strTextoHtml & "<option value=""" & Menu("id") & """  "
If CStr(catege) = CStr(Menu("id")) Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">" & LCase(Menu("nome")) & "</option>"
Menu.movenext
Wend
Menu.Close
Set Menu = Nothing
 
strTextoHtml = strTextoHtml & "</select></font> <input type=submit class=""ok"" value=""Pesquisar"" style=font-size:11px;color:000000;font-family:tahoma>"
strTextoHtml = strTextoHtml & "</td></form></tr><tr><td height=1 bgcolor=cccccc></td></tr></table><br><br>"
strTextoHtml = strTextoHtml & "<table width=565 align=center>"
strTextoHtml = strTextoHtml & "<tr><td align=center><br><br><b><font style=font-size:11px>Nenhum produto foi encontrado na base de dados da loja.<br><br></b><br><br></td></tr></table>"
strTextoHtml = strTextoHtml & "<br></table>"
strTextoHtml = strTextoHtml & "<table width=""100%"" cellspacing=""0"" cellpadding=""0""><tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc width=""101%""></td></tr><tr><td></td><td align=right><font face=""tahoma"" style=font-size:11px;color:000000>"
strTextoHtml = strTextoHtml & "&nbsp;<font face=""tahoma"" style=font-size:11px>Página(s): <b><u>1</u></b></font></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table><td></tr></table>"

Else
Set rs2 = conexao.Execute("SELECT count(nome) AS total FROM produtos " & restinho & ";")
totalreg = rs2("total")
rs2.Close
Set rs2 = Nothing
numiz = Request("pagina") & "0"
numiz = CInt(numiz)
iz = iz + numiz

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/prod_g.gif"" width=""30"" height=""33"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Excluir produtos na loja</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Produtos(s) encontrado(s): <b>" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table cellspacing=""3"" cellpadding=""3"" align=center width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><form action=""?"" method=get><input name=""link"" type=""hidden"" value=""produtos""><input name=""acao"" type=""hidden"" value=""excluir"">"
strTextoHtml = strTextoHtml & "<td align=center><font face=""tahoma"" style=font-size:11px;color:000000><center>Para uma busca mais detalhada dos produtos na loja realize uma pesquisa com o nome e/ou palavra-chave do produto  que você procura.</td><tr><td align=center>"
strTextoHtml = strTextoHtml & "<input name=""pesqsa"" type=""text"" value=""" & Request("pesqsa") & """ style=font-size:11px;color:000000;font-family:tahoma><font style=font-size:11px> em <select name=cat style=font-size:11px;font-family:tahoma>"
strTextoHtml = strTextoHtml & "<option value=todos>toda loja</option>"
strTextoHtml = strTextoHtml & "<option value=xxx>--------------------</option>"
Set Menu = conexao.Execute("SELECT * FROM sessoes ORDER by nome;")
While Not Menu.EOF
strTextoHtml = strTextoHtml & "<option value=""" & Menu("id") & """  "
If CStr(catege) = CStr(Menu("id")) Then
strTextoHtml = strTextoHtml & "selected"
End If
strTextoHtml = strTextoHtml & ">" & LCase(Menu("nome")) & "</option>"
Menu.movenext
Wend
Menu.Close
Set Menu = Nothing
 
strTextoHtml = strTextoHtml & "</select></font> <input type=submit class=""ok"" value=""Pesquisar"" style=font-size:11px;color:000000;font-family:tahoma>"

strTextoHtml = strTextoHtml & "</td></form></tr><tr><td height=1 bgcolor=cccccc></td></tr></table>"

If Request("status") = "sucesso" Then
strTextoHtml = strTextoHtml & "<br><center><b><font style=font-size:11px;font-family:tahoma;color:#003366>PRODUTO EXCLUÍDO COM SUCESSO!<br><br></font></b></center>"
Else
strTextoHtml = strTextoHtml & "<br><br>"
End If

strTextoHtml = strTextoHtml & "<table width=""100%"" align=center>"

If VersaoDb = 1 then

While Not rs.EOF
iz = iz + 1
If rs("estoque") = "s" Then
varestoq = "<font color=#000000>Disponível</font>"
Else
varestoq = "<font color=#b23c04>Não disponível </font>"
End If
If VersaoDb = 1 Then
   Set rs3 = conexao.Execute("SELECT nome FROM sessoes WHERE id = '" & rs("idsessao") & "';")
else
   Set rs3 = conexao.Execute("SELECT nome FROM sessoes WHERE id =" & rs("idsessao"))
end if

varsessao = rs3("nome")

strTextoHtml = strTextoHtml & "<script language=""javascript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function prod" & rs("idprod") & "(){" & vbNewLine
strTextoHtml = strTextoHtml & "if (confirm('Você realmente deseja excluir este produto?'))" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "window.location.href('?link=produtos&acao=exclui&prod=" & rs("idprod") & "');" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "else" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "}}" & vbNewLine
strTextoHtml = strTextoHtml & "</script>" & vbNewLine


strTextoHtml = strTextoHtml & "<tr><td align=left valign=center>"
strTextoHtml = strTextoHtml & "<table width=""100%"" bgcolor=#eeeeee style='border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;'><tr><td valign=center><font face=""tahoma"" style=font-size:11px;color:000000>" & iz & ") <b>" & UCase(rs("nome")) & "</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Departamento: <b>" & varsessao & "</b> &nbsp;&nbsp;&nbsp;Estoque: <b>" & varestoq & "</b></td><td align=right valign=middle><font face=""tahoma"" style=font-size:11px;color:000000>Ação: <b><a href=?link=produtos&acao=ver&prod=" & rs("idprod") & "&modo=exclui>Ver</a></b> | <b><a href=""javascript: prod" & rs("idprod") & "();"">Excluir</a></b>&nbsp;</td></tr></table> <table><tr><td height=4></td></tr></table>"
rs.movenext
pagn = inicial + 10
Wend


paga = pagn - 20

If totalreg Mod 10 <> 0 Then
valor = 1
Else
valor = 0
End If
pagina = Fix(totalreg / 10) + valor
pagina = Replace(pagina, ",", "")
pagdxx = pagdxx + 1
pagdxx = Replace(pagdxx, ",", "")
pagdxx2 = pagdxx - 2
pagdxx2 = Replace(pagdxx2, ",", "")
paga = Replace(paga, ",", "")
pagn = Replace(pagn, ",", "")
If pagdxx = "" Then pagdxx = 1
If pagina = "0" Then pagina = "1"

strTextoHtml = strTextoHtml & "<table width=565>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<center><br>"

If paga < 0 Then
paga = 0
Else

strTextoHtml = strTextoHtml & "<a HREF=""?link=produtos&acao=excluir&itens=" & paga & "&pagina=" & pagdxx2 & "&pesqsa=" & pesqsa & "&cat=" & catege & """ style=""color:000000""><font face=""tahoma"" style=font-size:11px><b>Página Anterior</b></a></font>&nbsp;&nbsp;"

End If
If totalreg < final Or totalreg = 10 Or pagdxx = pagina Then
totalreg = ""
npc = 1
totalp = 1
Else
variavel1 = CStr(pagdxx + 1)
variavel2 = CStr(pagina)
variavel1 = Replace(variavel1, ",", "")
variavel2 = Replace(variavel2, ",", "")
strTextoHtml = strTextoHtml & "&nbsp;&nbsp;<a HREF=""?link=produtos&acao=excluir&itens=" & pagn & "&pagina=" & pagdxx & "&pesqsa=" & pesqsa & "&cat=" & catege
If variavel1 = variavel2 Then
strTextoHtml = strTextoHtml & "&final=sim"""
End If
strTextoHtml = strTextoHtml & " style=""color:000000""><font face=""tahoma"" style=font-size:11px><b>Próxima página</b></a></font>"
End If
strTextoHtml = strTextoHtml & "<table width=100% cellspacing=""0"" cellpadding=""0""><tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc width=""101%""></td></tr><tr><td><font face=""tahoma"" style=font-size:11px;color:000000>Página <B>" & pagdxx & "</B> de <B>" & pagina & "</B></td><td align=right><font face=""tahoma"" style=font-size:11px;color:000000>"
If pagina = 1 Then
finalera = "sim"
End If
If pagina <> 1 Then
For i = 1 To pagina - 1
i = Replace(i, ",", "")
i2 = i - 1
i2 = Replace(i2, ",", "")
fator = 10
totalfator = fator * i - 10
totalfator = Replace(totalfator, ",", "")
paginadem = pagdxx
paginadem = Replace(paginadem, ",", "")
strTextoHtml = strTextoHtml & " &nbsp;<a HREF=""?link=produtos&acao=excluir&itens=" & totalfator & "&pagina=" & i2 & "&pesqsa=" & pesqsa & "&cat=" & catege & """ style=""color:000000""><font face=""tahoma"" style=font-size:11px>"
If paginadem = i Then
strTextoHtml = strTextoHtml & "<b><u>"
End If
strTextoHtml = strTextoHtml & Replace(i, ",", "") & "</u></b></a> &middot;</font>"
Next
End If
pagina2 = pagina * 10 - 10
pagina2 = Replace(pagina2, ",", "")
pagina3 = pagina - 1
pagina3 = Replace(pagina3, ",", "")
strTextoHtml = strTextoHtml & " &nbsp;<a HREF=""?link=produtos&acao=excluir&itens=" & pagina2 & "&pagina=" & pagina3 & "&pesqsa=" & pesqsa & "&cat=" & catege & "&final=sim"" style=""color:000000""><font face=""tahoma"" style=font-size:11px>"
If finalera = "sim" Then
strTextoHtml = strTextoHtml & "<b><u>"
End If
strTextoHtml = strTextoHtml & pagina & "</u></b></a></td></tr>"
else

pag = request.querystring("pagina")
if pag = "" Then
   pag = 1
end if

contador = 0
rs.absolutepage = pag
while not rs.eof and contador < rs.pagesize
contador = contador +1

iz = iz + 1
If rs("estoque") = "s" Then
varestoq = "<font color=#000000>Disponível</font>"
Else
varestoq = "<font color=#b23c04>Não disponível </font>"
End If
If VersaoDb = 1 Then
   Set rs3 = conexao.Execute("SELECT nome FROM sessoes WHERE id = '" & rs("idsessao") & "';")
else
   Set rs3 = conexao.Execute("SELECT nome FROM sessoes WHERE id =" & rs("idsessao"))
end if

varsessao = rs3("nome")
strTextoHtml = strTextoHtml & "<script language=""javascript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function prod" & rs("idprod") & "(){" & vbNewLine
strTextoHtml = strTextoHtml & "if (confirm('Você realmente deseja excluir este produto?'))" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "window.location.href('?link=produtos&acao=exclui&prod=" & rs("idprod") & "');" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "else" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "}}" & vbNewLine
strTextoHtml = strTextoHtml & "</script>" & vbNewLine
strTextoHtml = strTextoHtml & "<tr><td align=left valign=center>"
strTextoHtml = strTextoHtml & "<table width=""100%"" bgcolor=#eeeeee style='border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;'><tr><td valign=center><font face=""tahoma"" style=font-size:11px;color:000000>" & iz & ") <b>" & UCase(rs("nome")) & "</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Departamento: <b>" & varsessao & "</b> &nbsp;&nbsp;&nbsp;Estoque: <b>" & varestoq & "</b></td><td align=right valign=middle><font face=""tahoma"" style=font-size:11px;color:000000>Ação: <b><a href=?link=produtos&acao=ver&prod=" & rs("idprod") & "&modo=exclui>Ver</a></b> | <b><a href=""javascript: prod" & rs("idprod") & "();"">Excluir</a></b>&nbsp;</td></tr></table> <table><tr><td height=4></td></tr></table>"

rs.movenext
wend
strTextoHtml = strTextoHtml & "<table width=565>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<center><br>"

strTextoHtml = strTextoHtml & "<table width=100% cellspacing=""0"" cellpadding=""0""><tr><td colspan=2>"
strTextoHtml = strTextoHtml & "<hr size=1 color=cccccc width=""101%""></td></tr><tr><td colspan=2 align=right><font face=""tahoma"" style=font-size:11px;color:000000>"

strTextoHtml = strTextoHtml & "Página(s):&nbsp;&nbsp;"

for i = 1 to rs.pagecount

if i = cint(pag) then
   strTextoHtml = strTextoHtml & "<u><b>" & i & "</b></u> "
else
   strTextoHtml = strTextoHtml & "<a href='?link=produtos&acao=excluir&acaba=sim&pagina=" & i & "&pesqsa=" & pesqsa & "&cat=" & catege & "'>" & i & "</a> "
end if

next

strTextoHtml = strTextoHtml & "</td></tr>"
end if

strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table></td></tr></table> </td></tr></table></td></tr></table></td></tr></table>"
rs.Close
Set rs = Nothing
End If
Case "exclui"
notz = Request.QueryString("prod")
On error resume next
Set excluidados = conexao.Execute("SELECT imgra,impeq from produtos where idprod=" & notz & ";")
Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
objFSO.DeleteFile (Server.MapPath("produtos/" & excluidados("imgra") & ""))
objFSO.DeleteFile (Server.MapPath("produtos/" & excluidados("impeq") & ""))
Set objFSO = Nothing

Set dados = conexao.Execute("delete from produtos where idprod=" & notz & ";")
Response.Redirect "?link=produtos&acao=excluir&status=sucesso"
End Select
End Sub

Sub SuporteASP()
If Request("acaba") = "sim" Then
Session("adm_descprod") = ""
Session("adm_email") = ""
End If
Select Case strAcao
Case "email"
strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/supor_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Pedido de suporte via e-mail</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<form action=""administrador.asp?link=suporte&acao=envia"" method=post><font style=font-size:11px;font-family:tahoma><br>Preencha seu pedido de suporte:<br>"
If Request("sucesso") = "sim" Then
strTextoHtml = strTextoHtml & "<br><center><b><font style=font-size:11px;font-family:tahoma;color:#003366><br>SEU PEDIDO DE SUPORTE ENVIADO COM SUCESSO! <br>EM BREVE A EQUIPE ESTARÁ RESPONDENDO SEU CHAMADO.<br><br><br></font></b></center>"
Else
strTextoHtml = strTextoHtml & "<br><br>"
End If
varimg = "&nbsp;<img src='adm_imagens/xis.gif' width='15' height='16' border='0' align='absmiddle'>"
strTextoHtml = strTextoHtml & "<table width=""90%"" align=center><tr><td width=""50%""><font style=font-size:11px;font-family:tahoma><b>Data:</b></td><td width=""50%""><font style=font-size:11px;font-family:tahoma>" & Date & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><font style=font-size:11px;font-family:tahoma><b>Seu nome:</b></td><td><input name=""nome"" type=""text"" size=""50"" value=""" & Request("nome") & """ style=font-size:11px;font-family:tahoma>"
If Request("erro1") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=center><font style=font-size:11px;font-family:tahoma><b>Sua dúvida:</b></td><td><textarea name=""duvida"" cols=""70"" rows=""12""  style=font-size:11px;font-family:tahoma>" & Request("msg") & "</textarea>"
If Request("erro2") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=top><font style=font-size:11px;font-family:tahoma><b>Urgente?</b></td><td><select name=urgente style=font-size:11px;font-family:tahoma><option style=""color:red"" value=1>Sim<option value=2 selected>Não</select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=top></td><td align=center><input type=""submit"" value= "" Enviar Pedido "" style=font-size:11px;font-family:tahoma>&nbsp;<input type=""reset"" value="" Limpar Pedido "" style=font-size:11px;font-family:tahoma></td></tr></form>"
strTextoHtml = strTextoHtml & "</table>"
strTextoHtml = strTextoHtml & "<br><center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><a HREF=""?"">Voltar para Página Inicial</a></b></font>"

Case "envia"
nome = Request("nome")
msg = Request("duvida")
urgente = Request("urgente")
If nome = "" Or msg = "" Then
If nome = "" Then
erro1 = "sim"
End If
If msg = "" Then
erro2 = "sim"
End If
Response.Redirect "administrador.asp?link=suporte&acao=email&erro1=" & erro1 & "&erro2=" & erro2 & "&nome=" & nome & "&msg=" & msg
Else
strMensagem = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//PT/BR'>"
strMensagem = strMensagem & "<HTML><HEAD>"
strMensagem = strMensagem & "<META content='text/html; charset=iso-8859-1' http-equiv=Content-Type>"
strMensagem = strMensagem & "<META content='MSHTML 5.00.2614.3500' name=GENERATOR></HEAD>"
strMensagem = strMensagem & "<BODY>"
strMensagem = strMensagem & "<TABLE border=0 cellSpacing=0 width='98%'>"
strMensagem = strMensagem & "  <TBODY>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4 height=42>"
strMensagem = strMensagem & "      <DIV align=center><font face=tahoma><B><FONT style=font-size:17px color=000000>Pedido de Suporte via Administrador</DIV></FONT></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4><FONT face=tahoma>"
strMensagem = strMensagem & "      <HR color=#000000 SIZE=1 width='100%'>"
strMensagem = strMensagem & "      </FONT></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4><BR><FONT face=tahoma style=font-size:13px><b>Dados do Cliente e do E-mail:</b><FONT face=tahoma style=font-size:11px>"
strMensagem = strMensagem & "      <HR color=#000000 SIZE=1 width='100%'>"
strMensagem = strMensagem & "    <b>Nome: </b>" & nome
strMensagem = strMensagem & "    <br><b>Loja: </b> " & nomeloja & "(<a href=""http://" & urlloja & """>" & url & "</a>)"
strMensagem = strMensagem & "    <br><b>Contato: </b> " & Application("nomecontato") & " - Fone: " & Application("fone11")
strMensagem = strMensagem & "    </font><FONT face=tahoma style=font-size:13px><br><br><b>Mensagem</b></font>"
strMensagem = strMensagem & "      <HR color=#000000 SIZE=1 width='100%'>"
strMensagem = strMensagem & "      " & msg
strMensagem = strMensagem & "    <FONT face=tahoma style=font-size:11px>"
strMensagem = strMensagem & "    </font>"
strMensagem = strMensagem & "      <HR color=#000000 SIZE=1 width='100%'></font>"
strMensagem = strMensagem & "    </FONT></STRONG></FONT></TD></TR>"
strMensagem = strMensagem & "      <hr size=1 color=000000></TBODY></TABLE></BODY></HTML>"

If urgente = "1" Then
nourg = 2
Else
nourg = 1
End If

EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), email, "", "suporte@casadaweb.net", "Pedido de Suporte", strMensagem
Response.Redirect "administrador.asp?link=suporte&acao=email&sucesso=sim"
End If

Case "erro"
strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/supor_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Reportar erros no Sistema</B></FONT><hr size=1 color=#cccccc>"
strTextoHtml = strTextoHtml & "<form action=""administrador.asp?link=suporte&acao=enviaerro"" method=post><font style=font-size:11px;font-family:tahoma><br>Preencha descrevendo o erro para a equipe de suporte:<br>"
If Request("sucesso") = "sim" Then
strTextoHtml = strTextoHtml & "<br><center><b><font style=font-size:11px;font-family:tahoma;color:#003366><br>SUA NOTIFICAÇÃO DE ERRO FOI ENVIADA COM SUCESSO!<br><br></font></b></center>"
Else
strTextoHtml = strTextoHtml & "<br><br>"
End If
varimg = "&nbsp;<img src='adm_imagens/xis.gif' width='15' height='16' border='0' align='absmiddle'>"
strTextoHtml = strTextoHtml & "<table width=""90%"" align=center><tr><td width=""50%""><font style=font-size:11px;font-family:tahoma><b>Data:</b></td><td width=""50%""><font style=font-size:11px;font-family:tahoma>" & Date & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=center><font style=font-size:11px;font-family:tahoma><b>Descreva o erro:</b></td><td><textarea name=""erro"" cols=""70"" rows=""12""  style=font-size:11px;font-family:tahoma>" & Request("msg") & "</textarea>"
If Request("erro1") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=top><font style=font-size:11px;font-family:tahoma><b>Já ocorreu outra vez? </b></td><td><select name=outra style=font-size:11px;font-family:tahoma><option>Sim<option selected>Não</select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=top></td><td align=center><input type=""submit"" value= "" Enviar o Erro "" style=font-size:11px;font-family:tahoma>&nbsp;<input type=""reset"" value="" Limpar o Erro "" style=font-size:11px;font-family:tahoma></td></tr></form>"
strTextoHtml = strTextoHtml & "</table>"
strTextoHtml = strTextoHtml & "<br><center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><a HREF=""?"">Voltar para Página Inicial</a></b></font>"

Case "enviaerro"
msg = Request("erro")
outra = Request("outra")

If msg = "" Then
Response.Redirect "administrador.asp?link=suporte&acao=erro&erro1=sim"
Else
strMensagem = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//PT/BR'>"
strMensagem = strMensagem & "<HTML><HEAD>"
strMensagem = strMensagem & "<META content='text/html; charset=iso-8859-1' http-equiv=Content-Type>"
strMensagem = strMensagem & "<META content='MSHTML 5.00.2614.3500' name=GENERATOR></HEAD>"
strMensagem = strMensagem & "<BODY>"
strMensagem = strMensagem & "<TABLE border=0 cellSpacing=0 width='98%'>"
strMensagem = strMensagem & "  <TBODY>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4 height=42>"
strMensagem = strMensagem & "      <DIV align=center><font face=tahoma><B><FONT style=font-size:17px color=000000>Reporte de Erro no Sistema VS 1.0</DIV></FONT></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4><FONT face=tahoma>"
strMensagem = strMensagem & "      <HR color=#000000 SIZE=1 width='100%'>"
strMensagem = strMensagem & "      </FONT></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4><BR><FONT face=tahoma style=font-size:13px><b>Dados do Cliente e do E-mail:</b><FONT face=tahoma style=font-size:11px>"
strMensagem = strMensagem & "      <HR color=#000000 SIZE=1 width='100%'>"
strMensagem = strMensagem & "    <b>Nome: </b>" & nome
strMensagem = strMensagem & "    <br><b>Loja: </b> " & nomeloja & "(<a href=""http://" & urlloja & """>" & url & "</a>)"
strMensagem = strMensagem & "    <br><b>Contato: </b> " & Application("nomecontato") & " - Fone: " & Application("fone11")
strMensagem = strMensagem & "    </font><FONT face=tahoma style=font-size:13px><br><br><b>Erro:</b></font>"
strMensagem = strMensagem & "      <HR color=#000000 SIZE=1 width='100%'>"
strMensagem = strMensagem & "      " & msg
strMensagem = strMensagem & "    <FONT face=tahoma style=font-size:11px>"
strMensagem = strMensagem & "    </font>"
strMensagem = strMensagem & "      <HR color=#000000 SIZE=1 width='100%'></font>"
strMensagem = strMensagem & "    </FONT></STRONG></FONT></TD></TR>"
strMensagem = strMensagem & "      <hr size=1 color=000000></TBODY></TABLE></BODY></HTML>"

EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), email, "", "suporte@casadaweb.net", "Reporte de Erro", strMensagem

Response.Redirect "administrador.asp?link=suporte&acao=erro&sucesso=sim"
End If

End Select
End Sub

Sub EmailASP()
If Request("acaba") = "sim" Then
Session("adm_descprod") = ""
Session("adm_email") = ""
End If
Select Case strAcao
Case "escrever"
varimg = "&nbsp;<img src='adm_imagens/xis.gif' width='15' height='16' border='0' align='absmiddle'>"
strTextoHtml = strTextoHtml & "<SCRIPT LANGUAGE=""JavaScript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function AdicionaCodigo(Codigo) {document.frmemail.email.value+=Codigo}" & vbNewLine
strTextoHtml = strTextoHtml & "function email() {Codigo=""[email][/email]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function tamanhofonte(tamanho) {Codigo=""[tamanho=""+tamanho+""][/tamanho]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function negrito() {Codigo=""[b][/b]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function italico() {Codigo=""[i][/i]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function corfonte(cor) {Codigo=""[cor=""+cor+""][/cor]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function centralizado() {Codigo=""[centralizar][/centralizar]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function direita() {Codigo=""[alinhar=direita][/alinhar]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function esquerda() {Codigo=""[alinhar=esquerda][/alinhar]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function justificar() {Codigo=""[justificar][/justificar]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function linha() {Codigo=""[linha]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function link() {Codigo=""[link][/link]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function comentario() {Codigo=""[comentario][/comentario]"";    AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function lista() {Codigo=""[lista][item] [item] [item] [/lista]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function sublinhado() {Codigo=""[u][/u]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "function fontecara(cara) {Codigo=""[fonte=""+cara+""][/fonte]""; AdicionaCodigo(Codigo);}" & vbNewLine
strTextoHtml = strTextoHtml & "</SCRIPT>" & vbNewLine
strTextoHtml = strTextoHtml & "<form name=""frmemail"" method=""post"" action=""administrador.asp?link=news&acao=grava""><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/news_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Escrever novo e-mail</B></FONT><hr size=1 color=#cccccc>"
If Request("sucesso") = "sim" Then
strTextoHtml = strTextoHtml & "<center><b><font style=font-size:11px;font-family:tahoma;color:#003366><br>E-MAIL(S) ENVIADO(S) COM SUCESSO!<br><br></font></b></center>"
Else
strTextoHtml = strTextoHtml & "<br>"
End If
strTextoHtml = strTextoHtml & "<table width=""90%"" align=center>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Enviar para:</b></td><td>"
strTextoHtml = strTextoHtml & "<select name=""para"" style=font-size:11px;font-family:tahoma><option value=""todos"">Para Todos os Usuários Cadastrados</option><option value=""clientes"">Somente Clientes da Loja</option><option value=""news"">Somente Assinantes da Newsletter da Loja</option>"
If VersaoDb = 1 then
   Set rs = conexao.Execute("SELECT nome, email FROM clientes ORDER by nome;")
else
   Set rs = conexao.Execute("SELECT nome, email FROM clientes ORDER by nome;")
end if

strTextoHtml = strTextoHtml & "<OPTGROUP LABEL=""""></OPTGROUP><OPTGROUP LABEL=""Clientes Cadastrados"">"
While Not rs.EOF
strTextoHtml = strTextoHtml & "<option value='" & Cripto(rs("email"),False) & "'>" & Cripto(rs("nome"),False) & " (" & Cripto(rs("email"), False) & ")</option>"
rs.movenext
Wend
strTextoHtml = strTextoHtml & "</OPTGROUP></select></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Assunto:</b></td><td><input type=text name=""assunto"" size=""45"" value=""" & Request("msg") & """ style=font-size:11px;font-family:tahoma>"
If Request("erro2") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=""center"" rowspan=2>"
strTextoHtml = strTextoHtml & "<font style=font-family:tahoma;font-size:11px><b>Formatação de<br> texto:</b> </td><td><a href=""Javascript:negrito();""><img src=""adm_imagens/negrito.gif"" alt=""Negrito"" border=""0""></a>&nbsp;<a href=""Javascript:italico();""><img src=""adm_imagens/italico.gif""  alt=""Itálico"" border=""0""></a>&nbsp;<a href=""Javascript:sublinhado();""><img src=""adm_imagens/sublinhado.gif""  alt=""Sublinhado"" border=""0""></a>&nbsp;&nbsp;<a href=""Javascript:esquerda();""><img src=""adm_imagens/esquerda.gif""  alt=""Alinhar à esquerda"" border=""0""></a>&nbsp;<a href=""Javascript:centralizado();""><img src=""adm_imagens/centraliza.gif""  alt=""Centralizado"" border=""0""></a>&nbsp;<a href=""Javascript:direita();""><img src=""adm_imagens/direita.gif""  alt=""Alinhar à direita"" border=""0""></a>&nbsp;<a href=""Javascript:justificar();""><img src=""adm_imagens/justificado.gif""  alt=""Justificar"" border=""0""></a>&nbsp;&nbsp;<a href=""Javascript:link();"">"
strTextoHtml = strTextoHtml & "<img src=""adm_imagens/link.gif""  alt=""Inserir Hyperlink"" border=""0"">"
strTextoHtml = strTextoHtml & "</a>&nbsp;<a href=""Javascript:email();""><img src=""adm_imagens/email.gif""  alt=""Inserir E-mail"" border=""0""></a>&nbsp;&nbsp;<a href=""Javascript:linha();""><img src=""adm_imagens/linha.gif""  alt=""Linha horizontal"" border=""0""></a>&nbsp;<a href=""Javascript:comentario();""><img src=""adm_imagens/comentario.gif""  alt=""Inserir Comentário"" border=""0""></a>&nbsp;<a href=""Javascript:lista();""><img src=""adm_imagens/lista.gif""  alt=""Inserir Lista"" border=""0""></a></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td valign=""top"">"
strTextoHtml = strTextoHtml & "<select name=""cara"" onChange=""fontecara(this.options[this.selectedIndex].value)"" style=font-size:11px;font-family:tahoma><option value=""Andale Mono"">Andale Mono</option><option value=""Arial"">Arial</option><option value=""Arial Black"">Arial Black</option><option value=""Book Antiqua"">Book Antiqua</option><option value=""Century Gothic"">Century Gothic</option><option value=""Comic Sans MS"">Comic Sans MS</option><option value=""Courier New"">Courier New</option><option value=""Georgia"">Georgia</option><option value=""Impact"">Impact</option><option value=""Tahoma"" selected>Tahoma</option><option value=""Times New Roman"">Times New Roman</option><option value=""Trebuchet MS"">Trebuchet MS</option><option value=""Script MT Bold"">Script MT Bold</option><option value=""Stencil"">Stencil</option><option value=""Verdana"">Verdana</option><option value=""Lucida Console"">Lucida Console</option></select>&nbsp;"
strTextoHtml = strTextoHtml & "<select name=""tamanho"" onChange=""tamanhofonte(this.options[this.selectedIndex].value)"" style=font-size:11px;font-family:tahoma><option value=""1"" selected>1</option><option value=""2"">2</option><option value=""3"">3</option><option value=""4"">4</option><option value=""5"">5</option><option value=""6"">6</option></select>&nbsp;"
strTextoHtml = strTextoHtml & "<select name=""cor"" onChange=""corfonte(this.options[this.selectedIndex].value)"" style=font-size:11px;font-family:tahoma><option value=""preto"" selected>Preto</option><option value=""vermelho"">Vermelho</option><option value=""amarelo"">Amarelo</option><option value=""rosa"">Rosa</option><option value=""verde"">Verde</option><option value=""laranja"">Laranja</option><option value=""roxo"">Roxo</option><option value=""azul"">Azul</option><option value=""bege"">Bege</option><option value=""marron"">Marron</option></select>"
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td><FONT face=tahoma  style=font-size:11px><b>Texto do e-mail:</b></td><td><textarea name=""email"" rows=20 cols=75 style=font-size:11px;font-family:tahoma>" & Session("adm_email") & "</textarea>"
If Request("erro") = "sim" Then
strTextoHtml = strTextoHtml & varimg
End If
strTextoHtml = strTextoHtml & "</td></tr>"
strTextoHtml = strTextoHtml & "<tr><td></td><td align=center>&nbsp;&nbsp;&nbsp;&nbsp;<input type=""submit"" NAME=""Enter"" style=font-size:11px;font-family:tahoma value="" Enviar e-mail(s) ""> <input type=""reset"" value=""  Limpar e-mail  "" style=font-size:11px;font-family:tahoma></td></table><br><hr size=1 color=dddddd><center><FONT face=tahoma  style=font-size:11px><b><A href=""?&acaba=sim"">Voltar para página inicial</a></b></center><br></form>"

Case "grava"
email = Request("email")
para = Request("para")
assunto = Request("assunto")
Session("adm_email") = email
If email = "" Or assunto = "" Then
If email = "" Then
erro = "sim"
End If
If assunto = "" Then
erro2 = "sim"
End If
Response.Redirect "administrador.asp?link=news&acao=escrever&erro=" & erro & "&erro2=" & erro2 & "&msg=" & assunto
Else

strString = email
strString = Codifica(strString)
email = ""
email = strString

strEmailHTML = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">"
strEmailHTML = strEmailHTML & "<HTML><HEAD><TITLE>" & nomeloja & " - " & urlloja & "</TITLE>"
strEmailHTML = strEmailHTML & "<META http-equiv=Content-Type content='text/html; charset=iso-8859-1'>"
strEmailHTML = strEmailHTML & "<META content='MSHTML 6.00.2600.0' name=GENERATOR></HEAD>"
strEmailHTML = strEmailHTML & "<BODY>"
strEmailHTML = strEmailHTML & email
strEmailHTML = strEmailHTML & "</BODY></HTML>"

Select Case para

'Envia para email para todos
Case "todos"
Set rs = conexao.Execute("SELECT email FROM newsletter;")
While Not rs.EOF
EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), emailloja, "", rs("email"), "Informativo: " & nomeloja & " - " & urlloja, strEmailHTML
rs.movenext
Wend
   Set rs2 = conexao.Execute("SELECT nome, email FROM clientes")

While Not rs2.EOF
EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), emailloja, "", rs2("email"), "Informativo: " & nomeloja & " - " & urlloja, strEmailHTML
rs2.movenext
Wend

'Envia para email para todos os assinantes da newsletter da loja
Case "news"
Set rs = conexao.Execute("SELECT email FROM newsletter;")
While Not rs.EOF
EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), emailloja, "", rs("email"), "Informativo: " & nomeloja & " - " & urlloja, strEmailHTML
rs.movenext
Wend

'Envia para email para todos os clientes da loja
Case "clientes"

Set rs = conexao.Execute("SELECT nome, email FROM clientes;")

While Not rs.EOF
EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), emailloja, "", rs("email"), "Informativo: " & nomeloja & " - " & urlloja, strEmailHTML
rs.movenext
Wend

'Envia para email somente para o cliente selecionado
Case Else
Set rs = conexao.Execute("SELECT nome, email FROM clientes WHERE email ='" & para & "'")

EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), emailloja, "", rs("email"), "Informativo: " & nomeloja & " - " & urlloja, strEmailHTML
End Select

Response.Redirect "administrador.asp?link=news&acao=escrever&sucesso=sim&acaba=sim"
End If

Case "excluir"
strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/news_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Excluir emails cadastrados na newsletter da loja</B></FONT><hr size=1 color=#cccccc>"

finalera = Request.QueryString("final")
pag = Request.QueryString("itens")
pesss = Trim(Request.QueryString("pesq"))
pagdxx = Request.QueryString("pagina")
pesqsa = Request.QueryString("pesqsa")
catege = Request("cat")
If pesss = "" Then
pesss = "-"
palavra = Split(Trim("asdfghjklçqwertyuiopzxcvbnm"), " ")
Else
pesss = pesss
palavra = Split(Trim(Request.QueryString("pesq")), " ")
End If
If pag = "" Then
inicial = 0
final = 10
Else
inicial = pag
final = 10
End If
If pesqsa = "" Then
restinho = ""
catege = "todos"
Else
If catege = "todos" Or catege = "xxx" Or catege = "" Then
resto = ""
Else
resto = "idsessao = '" & catege & "' and"
End If
palavraz = Split(Trim(pesqsa), " ")
restinho = "WHERE email LIKE  '%" & palavraz(0) & "%'"
End If

Set rs = conexao.Execute("SELECT email,datacad FROM newsletter " & restinho)


If rs.EOF Or rs.bof Then

strTextoHtml = strTextoHtml & "<table><tr><td align=left valign=top><table border=0 cellspacing=4 cellpadding=4 width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=tahoma style=font-size:11px;color:000000>Cadastro(s) encontrado(s): <b>0" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table cellspacing=3 cellpadding=3 align=center width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><form action=? method=get><input name=link type=hidden value=news><input name=acao type=hidden value=excluir>"
strTextoHtml = strTextoHtml & "<td align=center><font face=""tahoma"" style=font-size:11px;color:000000><center>Para uma busca mais detalhada dos e-mails cadastrados na loja realize uma pesquisa com o e-mail que você procura.</td><tr><td align=center>"
strTextoHtml = strTextoHtml & "<input name=""pesqsa"" type=""text"" size=30 value=""" & Request("pesqsa") & """ style=font-size:11px;color:000000;font-family:tahoma><font style=font-size:11px></font> <input type=submit class=""ok"" value=""Pesquisar"" style=font-size:11px;color:000000;font-family:tahoma>"
strTextoHtml = strTextoHtml & "</td></form></tr><tr><td height=1 bgcolor=cccccc></td></tr></table><br><br>"
strTextoHtml = strTextoHtml & "<table width=565 align=center>"
strTextoHtml = strTextoHtml & "<tr><td align=center><br><br><b><font style=font-size:11px>Nenhum cadastro foi encontrado na base de dados da loja.<br><br></b><br><br></td></tr></table>"
strTextoHtml = strTextoHtml & "<br></table>"
strTextoHtml = strTextoHtml & "<table width=100% cellspacing=""0"" cellpadding=""0""><tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=""tahoma"" style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table><td></tr></table>"

Else
Set rs2 = conexao.Execute("SELECT count(email) AS total FROM newsletter " & restinho & ";")
totalreg = rs2("total")
rs2.Close
Set rs2 = Nothing
numiz = Request("pagina") & "0"
numiz = CInt(numiz)
iz = iz + numiz

strTextoHtml = strTextoHtml & "<table><tr><td align=""left"" valign=""top""><table border=""0"" cellspacing=""4"" cellpadding=""4"" width=100><tr><td>"
strTextoHtml = strTextoHtml & "<font face=""tahoma"" style=font-size:11px;color:000000>Cliente(s) encontrado(s): <b>" & totalreg & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table cellspacing=""3"" cellpadding=""3"" align=center width=""100%"">"
strTextoHtml = strTextoHtml & "<tr><form action=""?"" method=get><input name=""link"" type=""hidden"" value=""news""><input name=""acao"" type=""hidden"" value=""excluir"">"
strTextoHtml = strTextoHtml & "<td align=center><font face=""tahoma"" style=font-size:11px;color:000000><center>Para uma busca mais detalhada dos e-mails cadastrados na loja realize uma pesquisa com o e-mail que você procura.</td><tr><td align=center>"
strTextoHtml = strTextoHtml & "<input name=""pesqsa"" type=""text"" size=30 value=""" & Request("pesqsa") & """ style=font-size:11px;color:000000;font-family:tahoma><font style=font-size:11px></font> <input type=submit class=""ok"" value=""Pesquisar"" style=font-size:11px;color:000000;font-family:tahoma>"
strTextoHtml = strTextoHtml & "<br><br></td></form></tr><tr><td height=1 bgcolor=cccccc></td></tr></table>"

If Request("status") = "sucesso" Then
strTextoHtml = strTextoHtml & "<br><center><b><font style=font-size:11px;font-family:tahoma;color:#003366>CADASTRO EXCLUÍDO COM SUCESSO!<br><br></font></b></center>"
Else
strTextoHtml = strTextoHtml & "<br>"
End If

strTextoHtml = strTextoHtml & "<table width=""565"" align=center>"

While Not rs.EOF
iz = iz + 1
emailx = rs("email")
emailx = Replace(emailx, "@", "")
emailx = Replace(emailx, ".", "")
varestoq = "<font color=#b23c04>" & rs("email") & "</font>" & vbNewLine

strTextoHtml = strTextoHtml & "<script language=""javascript"">" & vbNewLine
strTextoHtml = strTextoHtml & "function cli" & replace(emailx, "-", "") & "(){" & vbNewLine
strTextoHtml = strTextoHtml & "if (confirm('Você realmente deseja excluir este cadastro da newsletter?'))" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "window.location.href('?link=news&cli=" & rs("email") & "&acao=exclui');" & vbNewLine
strTextoHtml = strTextoHtml & "}" & vbNewLine
strTextoHtml = strTextoHtml & "else" & vbNewLine
strTextoHtml = strTextoHtml & "{" & vbNewLine
strTextoHtml = strTextoHtml & "}}" & vbNewLine
strTextoHtml = strTextoHtml & "</script>" & vbNewLine

strTextoHtml = strTextoHtml & "<tr><td align=left valign=center>"
strTextoHtml = strTextoHtml & "<table width=""100%"" bgcolor=#eeeeee style=""border-right: 1px solid #cccccc;border-top: 1px solid #cccccc;border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;""><tr><td valign=center><font face=""tahoma"" style=font-size:11px;color:000000>" & iz & ") <b>" & UCase(varestoq) & "</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data do cadastro: <b>" & rs("datacad") & "</b></td><td align=right valign=center><font face=""tahoma"" style=font-size:11px;color:000000>Ação: <b><a href=""javascript: cli" & replace(emailx, "-", "") & "();"">Excluir</a></b>&nbsp;</td></tr></table> <table><tr><td height=4></td></tr></table>"

rs.movenext
Wend
pagn = inicial + 10
paga = pagn - 20


strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=tahoma style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td>"
strTextoHtml = strTextoHtml & "</tr></table></table></table>"

rs.Close
Set rs = Nothing
End If

Case "exclui"
notz = Request.QueryString("cli")
Set dados = conexao.Execute("delete from newsletter where email = '" & notz & "';")
Response.Redirect "?link=news&acao=excluir&status=sucesso"

End Select
End Sub

Sub UtilASP
If Request("acaba") = "sim" Then
Session("adm_descprod") = ""
Session("adm_email") = ""
End If
Select Case strAcao

case "exclui"

conexao.execute("delete from compras where status='Compra em Aberto'")
response.redirect "administrador.asp?link=util&acao=limpar&sucesso=sim&acaba=sim"

Case "limpar"

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/conf_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Utilitários (Excluir Compras em Aberto)</B></FONT><hr size=1 color=#cccccc>"

set rs = conexao.execute("select count(idcompra) as total from compras where status='Compra em Aberto'")
total_de_compras = rs("total")
rs.close
set rs = nothing

if Request.QueryString("sucesso") = "sim" then
    strSucesso = UCASE("<font face=tahoma style=font-size:11px;color:003366><b>Compras Excluídas Com Sucesso!</b></font>")
else
	strSucesso = ""
end if

strTextoHtml = strTextoHtml & "<table><tr><td align=left valign=top><table border=0 cellspacing=4 cellpadding=4 width=""100%""><tr><td>"
strTextoHtml = strTextoHtml & "<font face=tahoma style=font-size:11px;color:000000>Compra(s) em Aberto: <b>" & total_de_compras & "</b> <hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table cellspacing=3 cellpadding=3 align=center width=""570"">"
strTextoHtml = strTextoHtml & "<tr><td height=15></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td align=center><font face=tahoma style=font-size:11px;color:000000>Clique no Botão 'Limpar Compras em Aberto' Para Efetuar a Operação.<br></font><font face=tahoma style=font-size:11px;color:ff0000><b>Atenção!! Esta Operação Não Pode Ser Desfeita.</b></font></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td height=25 align=center>" & strSucesso & "</td><form name=frmcompras action=administrador.asp><input type=hidden name=link value=util><input type=hidden name=acao value=exclui></tr>"
strTextoHtml = strTextoHtml & "<tr><td align=center><input type=submit value=""Limpar Compras em Aberto"" style=""cursor:hand;font-family:tahoma; font-size: 11px;""></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=tahoma style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td></tr>"
strTextoHtml = strTextoHtml & "</table></td></form></tr></table></table>"

case "executa"

strSql = Request.QueryString("comando")
on error resume next
conexao.execute(strSql)
if err.number = 0 Then
   response.redirect "administrador.asp?link=util&acao=sql&sucesso=sim"
else
   response.redirect "administrador.asp?link=util&acao=sql&erro=" & err.description
end if

case "sql"

strTextoHtml = strTextoHtml & "<BR><FONT face=tahoma color=#003366 style=font-size:17px><img src=""adm_imagens/conf_g.gif"" hspace=""1"" vspace=""1"" border=""0"" align=""left""><B>&nbsp;Utilitários (SQL Manager)</B></FONT><hr size=1 color=#cccccc>"

if Request.QueryString("sucesso") = "sim" then
    strSucesso = UCASE("<font face=tahoma style=font-size:11px;color:003366><b>O Comando Foi Executado Com Sucesso!</b></font>")
else
	strSucesso = ""
end if

erro = Request.QueryString("erro")

if erro <> "" then
   	strSucesso = "<font face=tahoma style=font-size:11px;color:ff0000><b>Ocorreu o Seguinte Erro ao Executar:</b></br>" & erro & "</font>"
end if

strTextoHtml = strTextoHtml & "<table><tr><td align=left valign=top><table border=0 cellspacing=4 cellpadding=4 width=""100%""><tr><td align=center>"
strTextoHtml = strTextoHtml & "<font face=tahoma style=font-size:11px;color:000000>Utilize o SQL Manager Para Executar Comandos SQL Como: INSERT, UPDATE, DELETE, etc...<br><b>ATENÇÃO!! Qualquer Comando Executado no SQL Manager é Irreversível!!</b><hr size=1 color=#dddddd width=""100%"">"
strTextoHtml = strTextoHtml & "<table cellspacing=3 cellpadding=3 align=center width=""570"">"
strTextoHtml = strTextoHtml & "<tr><td height=25 align=center>" & strSucesso &"</td><form action=administrador.asp><input type=hidden name=link value=util><input type=hidden name=acao value=executa></tr>"
strTextoHtml = strTextoHtml & "<tr><td align=center><textarea name=comando rows=10 cols=60 style=""font-family:tahoma; font-size: 11px; color:003366""></textarea></td></tr>"
strTextoHtml = strTextoHtml & "<tr><td align=center><input type=submit value=""      Executar      "" style=""cursor:hand;font-family:tahoma; font-size: 11px;""></td></form></tr>"
strTextoHtml = strTextoHtml & "<tr><td colspan=2 align=center><hr size=1 color=#cccccc width=""101%""><font face=tahoma style=font-size:11px><b><br><a HREF=""?"">Voltar para Página Inicial</a></b></font></td></tr>"
strTextoHtml = strTextoHtml & "</table></td></form></tr></table></table>"

end select

End Sub

%>