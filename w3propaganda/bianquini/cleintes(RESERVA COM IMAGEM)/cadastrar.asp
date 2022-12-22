<!--#include file="verifica.asp"-->
<!--#include file="conexao.asp"-->
<!-- #include file = "upload_funcoes.asp" -->
<%

Dim nome, data, hora, g, h, comando, bytecount, RequestBin, tipo_foto, caminho_foto, nome_foto, foto, pasta, cfoto, usuario, senha, codigo

g = date

h = time

' Chamando Funções, que fazem o Upload funcionar
byteCount = Request.TotalBytes
RequestBin = Request.BinaryRead(byteCount)
Set UploadRequest = CreateObject("Scripting.Dictionary")
BuildUploadRequest RequestBin

' Tipo de arquivo que esta sendo enviado
tipo_foto = UploadRequest.Item("foto").Item("ContentType")

' Caminho completo dos arquivos enviados
caminho_foto = UploadRequest.Item("foto").Item("FileName")

' Nome dos arquivos enviados
nome_foto = Right(caminho_foto,Len(caminho_foto)-InstrRev(caminho_foto,"\"))

' Conteudo binario dos arquivos enviados
foto = UploadRequest.Item("foto").Item("Value")

' pasta onde as imagens serao guardadas
pasta = Server.MapPath("anexos/")
nome_foto = "/"&nome_foto

' pasta + nome dos arquivos
cfoto = "anexos" + nome_foto

' Fazendo o Upload do arquivo selecionado
if foto <> "" then
Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
Set MyFile = ScriptObject.CreateTextFile(pasta & nome_foto)
For i = 1 to LenB(foto)
MyFile.Write chr(AscB(MidB(foto,i,1)))
Next
MyFile.Close
end if

Email = UploadRequest.Item("email").Item("Value")
Senha = UploadRequest.Item("senha").Item("Value")
Codigo = UploadRequest.Item("codigo").Item("Value")
Nocliente = UploadRequest.Item("nocliente").Item("Value")
Nofantasia = UploadRequest.Item("nofantasia").Item("Value")
Endereco = UploadRequest.Item("endereco").Item("Value")
Numero = UploadRequest.Item("numero").Item("Value")
Complemento = UploadRequest.Item("complemento").Item("Value")
Bairro = UploadRequest.Item("bairro").Item("Value")
Cidade = UploadRequest.Item("cidade").Item("Value")
Estado = UploadRequest.Item("estado").Item("Value")
Cep = UploadRequest.Item("cep").Item("Value")
Cnpj = UploadRequest.Item("cnpj").Item("Value")
Pessoa = UploadRequest.Item("pessoa").Item("Value")
Inestadual = UploadRequest.Item("inestadual").Item("Value")
Identidade = UploadRequest.Item("identidade").Item("Value")
Nomepai = UploadRequest.Item("nomepai").Item("Value")
Nomemae = UploadRequest.Item("nomemae").Item("Value")
Telefone = UploadRequest.Item("telefone").Item("Value")
Fax = UploadRequest.Item("fax").Item("Value")
Celular = UploadRequest.Item("celular").Item("Value")
Pecontato = UploadRequest.Item("pecontato").Item("Value")
Email2 = UploadRequest.Item("email2").Item("Value")
Homepage = UploadRequest.Item("homepage").Item("Value")
Produtor = UploadRequest.Item("produtor").Item("Value")
Nascimento = UploadRequest.Item("nascimento").Item("Value")
Datacadastro = UploadRequest.Item("datacadastro").Item("Value")
Limite = UploadRequest.Item("limite").Item("Value")
Vendedor = UploadRequest.Item("vendedor").Item("Value")
Banco = UploadRequest.Item("banco").Item("Value")
Agencia = UploadRequest.Item("agencia").Item("Value")
Conta = UploadRequest.Item("conta").Item("Value")
Msg = UploadRequest.Item("msg").Item("Value")

comando = "INSERT INTO representantes (email, senha, codigo, nocliente, nofantasia, endereco, numero, complemento, bairro, cidade, estado, cep, cnpj, pessoa, inestadual, identidade, nomepai, nomemae, telefone, fax, celular, pecontato, email2, homepage, produtor, nascimento, datacadastro, limite, vendedor, banco, agencia, conta, msg, data, hora, foto)" & "VALUES('" & email & "','" & senha & "','" & codigo & "','" & nocliente & "','" & nofantasia & "','" & endereco & "','" & numero & "','" & complemento & "','" & bairro & "','" & cidade & "','" & estado & "','" & cep & "','" & cnpj & "','" & pessoa & "','" & inestadual & "','" & identidade & "','" & nomepai & "','" & nomemae & "','" & telefone & "','" & fax & "','" & celular & "','" & pecontato & "','" & email2 & "','" & homepage & "','" & produtor & "','" & nascimento & "','" & datacadastro & "','" & limite & "','" & vendedor & "','" & banco & "','" & agencia & "','" & conta & "','" & msg & "','" & g& "','" & h& "','" & cfoto& "')"

wm.Execute(comando)

%>
<!--#include file="meta.asp"-->
<div align="center"><img src="logore.jpg" width="550" height="150" /></div>
  <TABLE width="680" border=0 align="center" cellPadding=0 
cellSpacing=0 bgColor=#ffffff class=texto style="BORDER-RIGHT: gainsboro 1px solid" style="BORDER-LEFT: gainsboro 1px solid"></HTML>
  <TBODY>
  <TR>
    <TD bgColor=#005DA2 colSpan=3 height=25><TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=center>
          <TD width="98%" bgcolor="#005DA2"><FONT color=#ffffff><span class="style2">&nbsp;&nbsp;Cadastro de Representantes - <script language="JavaScript">

<!--
day = new Date()
num_dia = day.getDate()
dia = day.getDay()+1
mes = day.getMonth()+1
ano = day.getYear()


if(dia ==1)
document.write("Domingo, ")
if(dia ==2)
document.write("Segunda feira, ")
if(dia ==3)
document.write("Terça feira, ")
if(dia ==4)
document.write("Quarta feira, ")
if(dia ==5)
document.write("Quinta feira, ")
if(dia ==6)
document.write("Sexta feira, ")
if(dia ==7)
document.write("Saturday , ")

document.write(num_dia," de ")

if(mes ==1)
document.write("Janeiro de")
if(mes ==2)
document.write("Fevereiro de")
if(mes ==3)
document.write("Março de")
if(mes ==4)
document.write("Abril de")
if(mes ==5)
document.write("Maio de")
if(mes ==6)
document.write("Junho de")
if(mes ==7)
document.write("Julho de")
if(mes ==8)
document.write("Agosto de")
if(mes ==9)
document.write("Setembro de")
if(mes ==10)
document.write("Outubro de")
if(mes ==11)
document.write("Novembro de")
if(mes ==12)
document.write("Dezembro de")

document.write(" ",ano)


//--->
</script>
  - Seja bem vindo <span style="color: #FFFFFF">Nelcir Bianquini</span> - <a class=home_titulo7000 href="fujir.asp">Sair do Sistema</a>          </span></FONT></TD>
         </TR></TBODY></TABLE></TD>
  <TR>
  <TR>
    <TD vAlign=top>
      <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
         <!--#include file="menu.asp"--><TD vAlign=top>
            <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" 
border=0>
              <TBODY>
              <TR>
                <TD vAlign=top>
                  <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD vAlign=top width="1%"><TABLE class=texto cellSpacing=0 cellPadding=4 
                        width="100%" border=0>
                          <TBODY>
                          <TR>
                            <TD align=middle><div align="left"><span style="font-size: 12px">Cadastro de Representantes</span></div></TD>
                          </TR></TBODY></TABLE>
                       <TABLE class=texto cellSpacing=5 cellPadding=0 
                        width="100%" align=center border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top width="60%"><p>&nbsp;</p>
                              <p align="center"><img src="bot_ok.gif" width="50" height="41"></p>
                              <p align="center">Cadastro Efetuado com Sucesso</p>
                              <p align="center"><a class="home_titulo1000" href="cadastro.asp"><img border="0" src="carinha2.gif" width="16" height="16"> <span style="font-size: 12px">Cadastrar mais um representante.</span></a></p></TD>
                          </TR></TBODY></TABLE></TD>
                    </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
   </TBODY></TABLE><table width="680" border="0" align="center"><TR>
    <TD style="BORDER-TOP: #005DA2 10px solid" bgColor=#FFFFFF colSpan=3 
    height="1%"><!--#include file="baixo.asp"--></TD>
  </TR>
  </TBODY></TABLE>
</BODY></HTML>
