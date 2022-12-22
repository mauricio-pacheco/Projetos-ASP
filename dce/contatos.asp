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
                        <TD><div align="center"><span style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px">Preencha o formul&aacute;rio abaixo 
                          para entrar em contato conosco:</span></div></TD>
                      </TR>
                      <TR>
                        <TD>&nbsp;</TD>
                      </TR>
                      <TR>
                        <TD><FORM action="fecharcontato.asp" method=post name=cadastro style="font-size: 9px" onSubmit="return validar(this);">
                            <div align="center">
                              <p style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px">* Campos Obrigat&oacute;rios </p>
                            </div>
                          <TABLE cellSpacing=1 cellPadding=3 width="100%" 
                        align=center border=0>
                              <TBODY>
                                <TR>
                                  <TD colSpan=2 bgColor=#ffffff style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV class=back align=center></DIV></TD>
                                </TR>
                                <TR class=back>
                                  <TD width="28%" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV align=right><font color="#000000">Nome 
                                    Completo: </font></DIV></TD>
                                  <TD width="72%" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><STRONG>
                                    <INPUT class=busca size=56 name=assunto>
                                    *</STRONG></TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV align=right><FONT 
                              color=#000000>E-mail</FONT></DIV></TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><STRONG>
                                    <INPUT class=busca size=40 name=email>
                                    *</STRONG></TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV align=right><FONT 
                              color=#000000>Telefone 
                                    Res.:</FONT></DIV></TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px">
                                    <INPUT class=busca name=telefone>
                                    Ex: (99)9999-9999</TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV align=right><FONT 
                              color=#000000>Telefone 
                                    Celular:</FONT></DIV></TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px">
                                    <INPUT class=busca name=celular>
                                    Ex: (99)9999-9999</TD>
                                </TR>

                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV align=right><FONT 
                              color=#000000>Endere&ccedil;o:</FONT></DIV></TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><STRONG>
                                    <INPUT class=busca size=56 name=endereco>
                                    *</STRONG></TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV align=right><FONT 
                              color=#000000>Complemento:</FONT></DIV></TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><STRONG>
                                    <INPUT class=busca size=50 name=complemento>
                                  </STRONG></TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV align=right><FONT 
                              color=#000000>Bairro:</FONT></DIV></TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><STRONG>
                                    <INPUT class=busca size=50 name=bairro>
                                  *</STRONG></TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV align=right><FONT 
                              color=#000000>Cidade:</FONT></DIV></TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><STRONG>
                                    <INPUT class=busca size=50 name=cidade>
                                    *</STRONG></TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV align=right><FONT 
                              color=#000000>Cep:</FONT></DIV></TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><STRONG>
                                    <INPUT class=busca name=cep>
                                    *</STRONG></TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px">&nbsp;</TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><strong><a 
                              href="http://www.correios.com.br/servicos/cep/default.cfm" 
                              target=_blank><img 
                              src="busca_cep.gif" 
                              border=0></a></strong></TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px">&nbsp;</TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px">&nbsp;</TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV align=right><FONT 
                              color=#000000>Estado:</FONT></DIV></TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><STRONG>
                                    <SELECT class=buscacat name=estado>
                                      <OPTION value="UF" 
                                selected>UF</OPTION>
                                      <OPTION 
                                value="AC">AC</OPTION>
                                      <OPTION 
                                value="AL">AL</OPTION>
                                      <OPTION 
                                value="AP">AP</OPTION>
                                      <OPTION 
                                value="AM">AM</OPTION>
                                      <OPTION 
                                value="BA">BA</OPTION>
                                      <OPTION 
                                value="CE">CE</OPTION>
                                      <OPTION 
                                value="DF">DF</OPTION>
                                      <OPTION 
                                value="ES">ES</OPTION>
                                      <OPTION 
                                value="GO">GO</OPTION>
                                      <OPTION 
                                value="MA">MA</OPTION>
                                      <OPTION 
                                value="MT">MT</OPTION>
                                      <OPTION 
                                value="MS">MS</OPTION>
                                      <OPTION 
                                value="MG">MG</OPTION>
                                      <OPTION 
                                value="PA">PA</OPTION>
                                      <OPTION 
                                value="PB">PB</OPTION>
                                      <OPTION 
                                value="PR">PR</OPTION>
                                      <OPTION 
                                value="PE">PE</OPTION>
                                      <OPTION 
                                value="PI">PI</OPTION>
                                      <OPTION 
                                value="RJ">RJ</OPTION>
                                      <OPTION 
                                value="RN">RN</OPTION>
                                      <OPTION 
                                value="RS">RS</OPTION>
                                      <OPTION 
                                value="RO">RO</OPTION>
                                      <OPTION 
                                value="RR">RR</OPTION>
                                      <OPTION 
                                value="SC">SC</OPTION>
                                      <OPTION 
                                value="SP">SP</OPTION>
                                      <OPTION 
                                value="SE">SE</OPTION>
                                      <OPTION 
                              value="TO">TO</OPTION>
                                    </SELECT>
                                  </STRONG></TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><DIV align=right><font color="#000000">Observa&ccedil;&otilde;es:</font></DIV></TD>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"><STRONG>
                                    <TEXTAREA name=mensagem class=form rows=5 wrap=VIRTUAL cols=50></TEXTAREA>
                                    <BR>
                                    </STRONG><SPAN class=login>Se 
                                      necess&aacute;rio, coloque suas d&uacute;vidas 
                                      e observa&ccedil;&otilde;es.</SPAN></TD>
                                </TR>
                                <TR class=back>
                                  <TD style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px">
                                    <SCRIPT> 

var checkobj 
function agreesubmit(el){ 
checkobj=el 
if (document.all||document.getElementById){ 
for (i=0;i<checkobj.form.length;i++){  //hunt down submit button 
var tempobj=checkobj.form.elements[i] 
if(tempobj.type.toLowerCase()=="submit") 
tempobj.disabled=!checkobj.checked 
} 
} 
} 

function defaultagree(el){ 
if (!document.all&&!document.getElementById){ 
if (window.checkobj&&checkobj.checked) 
return true 
else{ 
alert("Please read/accept terms to submit form") 
return false 
} 
} 
} 

                                    </SCRIPT>                                  </TD>
                                </TR>
                              </TBODY>
                            </TABLE>
                          <DIV align=center style="font-size: 9px"><span style="font-family: Verdana, Arial, Helvetica, sans-serif"><BR>
                                  <INPUT class=botao name="submit" type=submit value="Enviar Formul&aacute;rio">
                            </span> </DIV>
                        </FORM></TD>
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
