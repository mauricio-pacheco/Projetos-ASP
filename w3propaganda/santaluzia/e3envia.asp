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

Dim link1

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
pasta = Server.MapPath("fabricantes/")
nome_foto = "/"&nome_foto

' pasta + nome dos arquivos
cfoto = "fabricantes" + nome_foto

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

link1 = UploadRequest.Item("link1").Item("Value")

strCaminho = Server.MapPath("/santa900/santaluz.mdb")
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strCaminho & ";"

comando = "INSERT INTO logos (link1, foto1)" & "VALUES('" & link1 & "', '" & cfoto & "')"

objConn.Execute(comando)

objConn.Close
Set objConn = Nothing


 %>
                                        Logotipo enviado com sucesso!</td>
                                      </tr>
  </table>

</BODY>
</HTML>
