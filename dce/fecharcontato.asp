<%

'por: Mauricio Pacheco
Dim iMail, Nome, Sobrenome, Assunto, Bairro, Datanascimento, Estadocivil, Nacionalidade, Numero, Celular, Complemento, Cep, Estado, Cidade, Outropais, Pais, Telefone, Endereco, Natural, Email, Mensagem

Assunto = Request.form("assunto") 
Email = Request.form("email") 
Telefone = Request.form("telefone") 
Celular = Request.form("celular") 
Endereco = Request.form("endereco") 
Complemento = Request.form("complemento") 
Bairro = Request.form("bairro") 
Cidade = Request.form("cidade") 
Cep = Request.form("cep") 
Estado = Request.form("estado") 
Mensagem = Request.form("mensagem") 

meu_email = "dce@fw.uri.br"
corpo = "<div align=""center""><font size=""2"" face=""Verdana, Arial, Helvetica, sans-serif"">Formulário de contatos do site do DCE!</font></div><br><br><font size=""1"" face=""Verdana, Arial, Helvetica, sans-serif""><b>Nome:</b>" & Assunto & "<BR>"
corpo = corpo & "<b>E-mail:</b>" & Email & "<BR>"
corpo = corpo & "<b>Telefone:</b>" & Telefone & "<BR>"
corpo = corpo & "<b>Celular:</b>" & Celular & "<BR>"
corpo = corpo & "<b>Endereço:</b>" & Endereco & "<BR>"
corpo = corpo & "<b>Complemento:</b>" & Complemento & "<BR>"
corpo = corpo & "<b>Bairro:</b>" & Bairro & "<BR>"
corpo = corpo & "<b>Cidade:</b>" & Cidade & "<BR>"
corpo = corpo & "<b>CEP:</b>" & Cep & "<BR>"
corpo = corpo & "<b>Estado:</b>" & Estado & "<BR>"
corpo = corpo & "<b>Mensagem:</b>" & Mensagem & "</font><BR>"

Set iMail = CreateObject("CDONTS.NewMail")
iMail.From = email
iMail.To = meu_email
iMail.Subject = Assunto
iMail.MailFormat = 0
iMail.BodyFormat = 0
iMail.Body = corpo
iMail.Send


Set objMail = nothing
%> 
<!--#include file="cabecalho.asp"-->
<!--#include file="tabelacima.asp"-->
<script LANGUAGE="JavaScript">

function validar(Form) {


var invalid, s;
invalid = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
 
var s;
 

if (document.cadastro.nome.value=="") {
alert("O Campo Nome não está preenchido!")
return false
}

if (document.cadastro.email.value=="") {
alert("O Campo E-mail não está preenchido!")
return false
}

if (document.cadastro.endereco.value=="") {
alert("O Campo Endereço não está preenchido!")
return false
}

if (document.cadastro.bairro.value=="") {
alert("O Campo Bairro não está preenchido!")
return false
}

if (document.cadastro.cidade.value=="") {
alert("O Campo Cidade não está preenchido!")
return false
}

if (document.cadastro.cep.value=="") {
alert("O Campo CEP não está preenchido!")
return false
}

if (document.cadastro.area.value=="") {
alert("O Campo Área não está preenchido!")
return false
}

if (document.cadastro.pastagens.value=="") {
alert("O Campo Pastagens Predominantes não está preenchido!")
return false
}

if (document.cadastro.qt1.value=="") {
alert("O Campo Quantidade não está preenchido!")
return false
}

if (document.cadastro.sex1.value=="") {
alert("O Campo Sexo não está preenchido!")
return false
}

if (document.cadastro.idade1.value=="") {
alert("O Campo Idade não está preenchido!")
return false
}

if (document.cadastro.peso1.value=="") {
alert("O Campo Peso @ não está preenchido!")
return false
}

if (document.cadastro.pesok1.value=="") {
alert("O Campo Peso Kg não está preenchido!")
return false
}




return true;
}
</script>
<TABLE cellSpacing=0 cellPadding=0 width=778 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=middle width=140 bgColor=#f2f2f2>
      <!--#include file="tesquerda.asp"--></TD>
    <TD vAlign=top align=middle width=498 
    background=home_arquivos/tc_layout_15.jpg height=25>
      <TABLE cellSpacing=0 cellPadding=0 width=498 border=0>
        <TBODY>
        <TR>
          <TD vAlign=center align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width=482 border=0>
              <TBODY>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD class=fonte>
                  <TABLE cellSpacing=0 cellPadding=0 width=482 border=0>
                    <TBODY>
                    <TR>
                      <TD width=62>
                        <DIV align=center><IMG height=50 
                        src="home_arquivos/default.jpg" width=50></DIV></TD>
                      <TD vAlign=center width=422>
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" 
border=0>
                          <TBODY>
                          <TR>
                            <TD class=fonte><span class="fontedestaque"><span style="color: #3A83A6"><strong>» DCE - Diret&oacute;rio Central dos Estudantes </strong></span></span></TD>
                          </TR>
                          <TR>
                            <TD class=fonte height=5></TD></TR>
                          <TR>
                            <TD class=fonte>
                              <DIV align=justify><STRONG>&raquo;</STRONG> CONTATOS </DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD align=middle height=1><IMG height=1 
                  src="home_arquivos/tc_layout_barra.gif" width=480></TD></TR>
          </TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle>
            <TABLE width=482 border=0 align="center" cellPadding=0 cellSpacing=0>
              <TBODY>
              <TR>
                <TD height=10></TD></TR>
              <TR>
                <TD class=fontedestaque><div align="center">
                  <TABLE width="460" align=center border=0>
                    <TBODY>
                      <TR>
                        <TD>&nbsp;</TD>
                      </TR>
                      <TR>
                        <TD><div align="center"><img src="dce.jpg" width="202" height="103"></div></TD>
                      </TR>
                      <TR>
                        <TD><div align="center"><span style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><span style="font-family: Verdana, Arial, Helvetica, sans-serif"><span style="font-size: 9px">FORMUL&Aacute;RIO ENVIADO COM SUCESSO! </span></span></span></div></TD>
                      </TR>
                      <TR>
                        <TD>&nbsp;</TD>
                      </TR>
                      <TR>
                        <TD><div align="center"><span style="font-size: 9px">EM BREVE ESTAREMOS ENTRANDO EM CONTATO.</span></div></TD>
                      </TR>
                      <TR>
                        <TD>&nbsp;</TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                </div></TD>
              </TR>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD>
                 </TD></TR>
              <TR>
              <TD height=10></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle height=1><IMG height=1 
            src="home_arquivos/tc_layout_barra.gif" width=480></TD></TR></TBODY></TABLE>
      <p>&nbsp;</p></TD>
    <TD vAlign=top align=middle width=140 bgColor=#f2f2f2>
      <!--#include file="tdireita.asp"--><!--#include file="baixo.asp"--></BODY></HTML>
