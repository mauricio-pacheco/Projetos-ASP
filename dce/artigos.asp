<!--#include file="cabecalho.asp"-->
<!--#include file="tabelacima.asp"-->
<script LANGUAGE="JavaScript">

function validar(Form) {


var invalid, s;
invalid = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
 
var s;
 

if (document.cadastro.autor.value=="") {
alert("O Campo Autor não está preenchido!")
return false
}

if (document.cadastro.assunto.value=="") {
alert("O Campo Assunto não está preenchido!")
return false
}

if (document.cadastro.mensagem.value=="") {
alert("O Campo Mensagem não está preenchido!")
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
                              <DIV align=justify><STRONG>&raquo;</STRONG> ARTIGOS</DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
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
                  <p><br>
                    <em>Por favor escreva seu artigo atentando para a gram&aacute;tica   e poss&iacute;veis erros de digita&ccedil;&atilde;o. <BR>
                    Voc&ecirc; fica ciente, desde j&aacute;, que nem todas as   contribui&ccedil;&otilde;es s&atilde;o publicadas.<BR>
                    Sua emiss&atilde;o ser&aacute; conferida e poder&aacute; ser   publicada no site.</em></p>
                  <p><font size="1" face="Verdana, Arial, Helvetica, sans-serif">*</font> Campos Obrigat&oacute;rios </p>
                  <form name="cadastro" method="post" action="recebeartigo.asp" onSubmit="return validar(this);">
                    <p align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Autor:
                        <input class="busca" type="text" name="autor" size=36 >
                      *</font></p>
                    <p align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">T&iacute;tulo:
                        <input class="busca" type="text" name="assunto" size=44 >
*</font></p>
                    <p align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Texto:* 
                      </font></p>
                    <p align="center">Utilize <span style="color: #006600">&lt;br&gt;</span> para quebrar linha.</p>
                    <p align="center"> <font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                      <textarea class=form name="mensagem" cols="70" rows="14"></textarea>
                    </font></p>
                    <p align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                      <input type="submit" class="botao" name="Submit" value="ENVIAR ARTIGO">
                    </font></p>
                    </form>
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
    </TD>
    <TD vAlign=top align=middle width=140 bgColor=#f2f2f2>
      <!--#include file="tdireita.asp"--><!--#include file="baixo.asp"--></BODY></HTML>
