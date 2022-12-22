<!--#include file="verificacliente.asp"-->
<!--#include file="conexao.asp"-->
<!-- #include file = "upload_funcoes.asp" -->
<%

Dim representante, cod, data, hora, g, h, comando, bytecount, RequestBin, tipo_foto, caminho_foto, nome_foto, foto, pasta, cfoto, razaosocial, nomefantasia, endereco, numero, complend, bairro, cod_cf, naturezapessoa, cnpjcpf, ie, ci, datanasc, telefone, pessoacontato, fax, celular, email, homepage, datacadastro, enderecocobranca, bairrocobranca, cidcobranca, cliente, fornecedor, clientepreferencial, limitecredito, observacao, cod_vend, cepcobranca, produtorrural, cod_rota, seqrota, percresfriador, cod_bco, cod_ag, contabancaria, clienteagua, clientelicenciamento, nomemae, nomepai, cidade, estado, cep

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
pasta = Server.MapPath("anexoscliente/")
nome_foto = "/"&nome_foto

' pasta + nome dos arquivos
cfoto = "anexoscliente" + nome_foto

' Fazendo o Upload do arquivo selecionado
if foto <> "" then
Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
Set MyFile = ScriptObject.CreateTextFile(pasta & nome_foto)
For i = 1 to LenB(foto)
MyFile.Write chr(AscB(MidB(foto,i,1)))
Next
MyFile.Close
end if


Representante = UploadRequest.Item("representante").Item("Value")
Cod = UploadRequest.Item("cod").Item("Value")
Cliente = UploadRequest.Item("cliente").Item("Value")
Razaosocial = UploadRequest.Item("razaosocial").Item("Value")
Nomefantasia = UploadRequest.Item("nomefantasia").Item("Value")
Endereco = UploadRequest.Item("endereco").Item("Value")
Numero = UploadRequest.Item("numero").Item("Value")
Complend = UploadRequest.Item("complend").Item("Value")
Bairro = UploadRequest.Item("bairro").Item("Value")
Cidade = UploadRequest.Item("cidade").Item("Value")
Estado = UploadRequest.Item("estado").Item("Value")
Cep = UploadRequest.Item("cep").Item("Value")
Cnpjcpf = UploadRequest.Item("cnpjcpf").Item("Value")
Ie = UploadRequest.Item("ie").Item("Value")
Ci = UploadRequest.Item("ci").Item("Value")
Datanasc = UploadRequest.Item("datanasc").Item("Value")
Telefone = UploadRequest.Item("telefone").Item("Value")
Fax = UploadRequest.Item("fax").Item("Value")
Celular = UploadRequest.Item("celular").Item("Value")
Email = UploadRequest.Item("email").Item("Value")
Homepage = UploadRequest.Item("homepage").Item("Value")
Observacao = UploadRequest.Item("observacao").Item("Value")


comando = "INSERT INTO clientes (representante, cod, cliente, razaosocial, nomefantasia, endereco, numero, complend, bairro, cidade, estado, cep, cnpjcpf, ie, ci, datanasc, telefone, fax, celular, email, homepage, observacao, foto)" & "VALUES('" & representante & "','" & cod & "','" & cliente & "','" & razaosocial & "','" & nomefantasia & "','" & endereco & "','" & numero & "','" & complend & "','" & bairro & "','" & cidade & "','" & estado & "','" & cep & "','" & cnpjcpf & "','" & ie & "','" & ci & "','" & datanasc & "','" & telefone & "','" & fax & "','" & celular & "','" & email & "','" & homepage & "','" & observacao & "','" & cfoto& "')"

wm.Execute(comando)

%>
<!--#include file="meta.asp"-->
<div align="center"><img src="logore.jpg" width="550" height="150" /></div>
  <TABLE width="680" border=0 align="center" cellPadding=0 
cellSpacing=0 bgColor=#ffffff class=texto style="BORDER-RIGHT: gainsboro 1px solid" style="BORDER-LEFT: gainsboro 1px solid"></HTML>
  <TBODY>
  <TR>
    <TD bgColor=#006200 colSpan=3 height=25><TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=center>
          <TD width="98%" bgcolor="#006200"><FONT color=#ffffff><span class="style2">&nbsp;&nbsp;Cadastro de Representantes - <script language="JavaScript">

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
</script> - 
      <% 

Set rs2 = Server.CreateObject("ADODB.Recordset") 

SQL2 = "SELECT Usuario, Nocliente, Codigo FROM representantes"

rs2.Open SQL2, wm,3,3
      

%>
- Seja bem vindo <%=Session("usuario")%> -<a class=home_titulo7000 href="fujir.asp">Sair do Sistema</a>          </span></FONT></TD>
         </TR></TBODY></TABLE></TD>
  <TR>
  <TR>
    <TD vAlign=top>
      <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
         <!--#include file="menucliente.asp"--><TD vAlign=top>
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
                            <TD align=middle><div align="left"><span style="font-size: 12px">Cadastro de Clientes</span></div></TD>
                          </TR></TBODY></TABLE>
                       <TABLE class=texto cellSpacing=5 cellPadding=0 
                        width="100%" align=center border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top width="60%"><p>&nbsp;</p>
                              <p align="center"><img src="bot_ok.gif" width="50" height="41"></p>
                              <p align="center">Cadastro Efetuado com Sucesso</p>
                              <p align="center"><a class="home_titulo1000" href="cadastrarcliente.asp"><img border="0" src="carinha2.gif" width="16" height="16"> <span style="font-size: 12px">Cadastrar mais um cliente.</span></a><br></p></TD>
                          </TR></TBODY></TABLE></TD>
                    </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
   </TBODY></TABLE><table width="680" border="0" align="center"><TR>
    <TD style="BORDER-TOP: #006200 10px solid" bgColor=#FFFFFF colSpan=3 
    height="1%"><!--#include file="baixo.asp"--></TD>
  </TR>
  </TBODY></TABLE>
</BODY></HTML>
