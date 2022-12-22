<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="br">
<head>
<title>Associa&ccedil;&atilde;o Moto Clube Trilheiros do Barril</title>
<meta name="description" content="Descrição">
<meta name="keywords" content="palavras chave">
<meta name="classification" content="Internet" />
<meta name="language" content="br" />
<meta name="rating" content="general" />
<meta name="distribution" content="global" />
<meta name="revisit-after" content="7 Dias" />
<meta name="robots" content="index, follow" />
<meta name="author" content="dnimports.com.br">
<meta name="robots" content="index, follow, all" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="e.ico" type="image/x-icon" />
<link rel="shortcut icon" href="e.ico" type="image/x-icon" />
<style type="text/css">
@import url("home_arquivos/barroide2.css");
</style>
<STYLE type=text/css>
.texto {
	FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Tahoma, Arial
}
.style5 {
	font-size: 9px
}
.style7 {
	font-size: 14px;
	font-family: Verdana;
	color: #ffffff;
}
.style8 {font-size: 14}
.style9 {color: #FFFFFF}
.style15 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
}
.style17 {color: #FFFFFF; font-size: 10px; }
.style19 {color: #FFFFFF; font-size: 14px; }
.style21 {color: #FFFFFF; font-size: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; }
body {
	background-color: #FFFFFF;
}
.style15 {
	font-size: 11px; font-family: Tahoma, Geneva, sans-serif;
}
</STYLE>
</HEAD>
<BODY>
                                      <table width="100%" border="0" align="left">
                                      <tr>
                                        <td width="685" class="style15"><!-- #include file = "upload_funcoes.asp" --><%

Dim link1, link2, link3

' Chamando Funções, que fazem o Upload funcionar
byteCount = Request.TotalBytes
RequestBin = Request.BinaryRead(byteCount)
Set UploadRequest = CreateObject("Scripting.Dictionary")
BuildUploadRequest RequestBin


' Tipo de arquivo que esta sendo enviado
tipo_foto = UploadRequest.Item("foto1").Item("ContentType")

' Caminho completo dos arquivos enviados
caminho_foto = UploadRequest.Item("foto1").Item("FileName")

' Nome dos arquivos enviados
nome_foto = Right(caminho_foto,Len(caminho_foto)-InstrRev(caminho_foto,"\"))

' Conteudo binario dos arquivos enviados
foto = UploadRequest.Item("foto1").Item("Value")

' pasta onde as imagens serao guardadas
pasta = Server.MapPath("meio/")
nome_foto = "/"&nome_foto

' pasta + nome dos arquivos
cfoto = "meio" + nome_foto

' Fazendo o Upload do arquivo selecionado
if foto <> "" then
Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
Set MyFile = ScriptObject.CreateTextFile(pasta & nome_foto)
For i = 1 to LenB(foto)
MyFile.Write chr(AscB(MidB(foto,i,1)))
Next
MyFile.Close
end if

'--------------------------------

' Tipo de arquivo que esta sendo enviado
tipo_foto2 = UploadRequest.Item("foto2").Item("ContentType")

' Caminho completo dos arquivos enviados
caminho_foto2 = UploadRequest.Item("foto2").Item("FileName")

' Nome dos arquivos enviados
nome_foto2 = Right(caminho_foto2,Len(caminho_foto2)-InstrRev(caminho_foto2,"\"))

' Conteudo binario dos arquivos enviados
foto2 = UploadRequest.Item("foto2").Item("Value")

' pasta onde as imagens serao guardadas
pasta2 = Server.MapPath("meio/")
nome_foto2 = "/"&nome_foto2

' pasta + nome dos arquivos
cfoto2 = "meio" + nome_foto2

' Fazendo o Upload do arquivo selecionado
if foto2 <> "" then
Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
Set MyFile = ScriptObject.CreateTextFile(pasta2 & nome_foto2)
For i = 1 to LenB(foto2)
MyFile.Write chr(AscB(MidB(foto2,i,1)))
Next
MyFile.Close
end if

'--------------------------------------


' Tipo de arquivo que esta sendo enviado
tipo_foto3 = UploadRequest.Item("foto3").Item("ContentType")

' Caminho completo dos arquivos enviados
caminho_foto3 = UploadRequest.Item("foto3").Item("FileName")

' Nome dos arquivos enviados
nome_foto3 = Right(caminho_foto3,Len(caminho_foto3)-InstrRev(caminho_foto3,"\"))

' Conteudo binario dos arquivos enviados
foto3 = UploadRequest.Item("foto3").Item("Value")

' pasta onde as imagens serao guardadas
pasta3 = Server.MapPath("meio/")
nome_foto3 = "/"&nome_foto3

' pasta + nome dos arquivos
cfoto3 = "meio" + nome_foto3

' Fazendo o Upload do arquivo selecionado
if foto3 <> "" then
Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
Set MyFile = ScriptObject.CreateTextFile(pasta3 & nome_foto3)
For i = 1 to LenB(foto3)
MyFile.Write chr(AscB(MidB(foto3,i,1)))
Next
MyFile.Close
end if

'-----------------------------------















link1 = UploadRequest.Item("link1").Item("Value")
link2 = UploadRequest.Item("link2").Item("Value")
link3 = UploadRequest.Item("link3").Item("Value")

strCaminho = Server.MapPath("/santa900/santaluz.mdb")
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strCaminho & ";"

comando = "UPDATE meio SET link1 = '" & link1 & "', link2 = '" & link2 & "', link3 = '" & link3 & "', foto1 = '" & cfoto & "', foto2 = '" & cfoto2 & "', foto3 = '" & cfoto3 & "' WHERE id = 6 "

objConn.Execute(comando)

objConn.Close
Set objConn = Nothing


 %>
                                        Imagens enviadas com sucesso!</td>
                                      </tr>
  </table>

</BODY>
</HTML>
