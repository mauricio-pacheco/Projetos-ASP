<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<LINK href="style.css" type=text/css rel=stylesheet>
<body bgcolor="#f5f5f5" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<script language="JavaScript"><!--
////
 
function validar(Form) {


var invalid, s;
invalid = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
 
var s;
 
 
if (document.cadastro.login.value=="") {
alert("O Campo Usuário não está preenchido!")
return false
}

if (document.cadastro.senha.value=="") {
alert("O Campo Senha não está preenchido!")
return false
}


if (document.cadastro.razao.value=="") {
alert("O Campo Razão Social não está preenchido!")
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

if (document.cadastro.estado.value=="") {
alert("O Campo Estado não está preenchido!")
return false
}

if (document.cadastro.telefone.value=="") {
alert("O Campo Telefone não está preenchido!")
return false
}

if (document.cadastro.estadual.value=="") {
alert("O Campo Insc. Estadual não está preenchido!")
return false
}




// inicio de verificacao de cnpj ou cpf
if (Form.cnpj.value.length == 0) {
alert("O CNPJ/CPF é um campo obrigatório !");
Form.cnpj.focus();
return false; }

s = limpa_string(Form.cnpj.value);


// checa se é cpf 
if (s.length == 11) {
if (valida_CPF(Form.cnpj.value) == false ) {
alert("O CPF não é válido !");
Form.cnpj.focus();
return false; }
}

// checa se é cgc
else if (s.length == 14) {
if (valida_CGC(Form.cnpj.value) == false ) {
alert("O CNPJ não é válido !");
Form.cnpj.focus();
return false; }
}
else {
alert("O CPF/CNPJ não é válido !");
Form.cnpj.focus();
return false;
}
 
// final da verificacao de cnpj ou cpf
 
 
// verifica o cep
// primeiro deixa somente numeros no cep
// obs.:a chamada abaixo tambem pode ser utilizada para checar telefones

s = limpa_string(Form.cep.value);
if (s.length < 8) {
alert("Digite corretamente o CEP: 99999-999 !");
Form.cep.focus();
return false; }
 
 
 
if (invalid.test(document.cadastro.email.value) == true) {
// caso o teste falhe, para mudar a cor do texto na caixa, mude na linha abaixo
document.cadastro.email.style.color = "red";

alert("Endereço de E-mail inválido !");
Form.email.focus();
return (false); }
 
return true;
}
// fim da funcao validar()
 
 
function limpa_string(S){
// Deixa so' os digitos no numero
var Digitos = "0123456789";
var temp = "";
var digito = "";
 
for (var i=0; i<S.length; i++) {
digito = S.charAt(i);
if (Digitos.indexOf(digito)>=0) {
temp=temp+digito }
} //for
 
return temp
}
// fim da funcao
 
 
function valida_CPF(s) {
var i;
s = limpa_string(s);
var c = s.substr(0,9);
var dv = s.substr(9,2);
var d1 = 0;
for (i = 0; i < 9; i++)
{
d1 += c.charAt(i)*(10-i);
}
if (d1 == 0) return false;
d1 = 11 - (d1 % 11);
if (d1 > 9) d1 = 0;
if (dv.charAt(0) != d1)
{
return false;
}
 
d1 *= 2;
for (i = 0; i < 9; i++)
{
d1 += c.charAt(i)*(11-i);
}
d1 = 11 - (d1 % 11);
if (d1 > 9) d1 = 0;
if (dv.charAt(1) != d1)
{
return false;
}
return true;
}
 
function valida_CGC(s)
{
var i;
s = limpa_string(s);
var c = s.substr(0,12);
var dv = s.substr(12,2);
var d1 = 0;
for (i = 0; i < 12; i++)
{
d1 += c.charAt(11-i)*(2+(i % 8));
}
if (d1 == 0) return false;
d1 = 11 - (d1 % 11);
if (d1 > 9) d1 = 0;
if (dv.charAt(0) != d1)
{
return false;
}
 
d1 *= 2;
for (i = 0; i < 12; i++)
{
d1 += c.charAt(11-i)*(2+((i+1) % 8));
}
d1 = 11 - (d1 % 11);
if (d1 > 9) d1 = 0;
if (dv.charAt(1) != d1)
{
return false;
}
return true;
}
 
// -->
</script>
<form action="add_user.php" method="post" enctype="multipart/form-data" name="cadastro" onSubmit="return validar(this)">
  <p align="center">&nbsp;</p>
  <TABLE width="555" border="0" align="center" cellPadding=0 cellSpacing=0 bgcolor="f5f5f5">
    <TBODY>
      <TR> 
        <TD width=20>&nbsp;</TD>
        <TD width="515"><TABLE cellSpacing=0 cellPadding=0 width="98%" align=center  border=0>
            <TBODY>
              <TR> 
                <TD>&nbsp;</TD>
              </TR>
              <TR> 
                <TD> <TABLE cellSpacing=0 cellPadding=0 width="100%" 
border=0>
                    <TBODY>
                      <TR> 
                        <TD width=20>&nbsp;</TD>
                        <TD width="100%">&nbsp;</TD>
                        <TD width=20>&nbsp;</TD>
                      </TR>
                      <TR> 
                        <TD width=20>&nbsp;</TD>
                        <TD width="100%"><font 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>
                          T&iacute;tulo:
                          <input 
                                class=camposformularios id=gerente 
                                maxlength=50 size=50 name=gerente2 value="">
                        </font></TD>
                        <TD width=20>&nbsp;</TD>
                      </TR>
                    </TBODY>
                  </TABLE></TD>
              </TR>
              <TR> 
                <TD> <TABLE cellSpacing=0 cellPadding=0 width="100%" 
                        align=center border=0>
                    <TBODY>
                      <TR>
                        <TD>&nbsp;</TD>
                        <TD>&nbsp;</TD>
                        <TD>&nbsp;</TD>
                      </TR>
                      <TR> 
                        <TD>&nbsp;</TD>
                        <TD> <FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Procure o Arquivo:</FONT> <input type="file" name="arquivo"> </TD>
                        <TD>&nbsp;</TD>
                      </TR>
                      <TR> 
                        <TD width=20>&nbsp;</TD>
                        <TD width="100%">&nbsp;</TD>
                        <TD width=20>&nbsp;</TD>
                      </TR>
                      <TR> 
                        <TD width=20>&nbsp;</TD>
                        <TD width="100%"> <TABLE cellSpacing=0 cellPadding=0 width="100%" 
                              border=0>
                            <TBODY>
                              <TR> 
                                <TD colSpan=2><p><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=2><STRONG>Descri&ccedil;&atilde;o</STRONG></FONT></p>
                                  <p><font 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>
                                    <textarea class=camposformulariosgrandes id=textarea name=dados rows=10 wrap=VIRTUAL cols=50 maxlength="500"></textarea>
                                    </font><br> 
                                    <br>
                                  </p></TD>
                              </TR>
                              <TR> 
                                <TD width="22%">&nbsp;</TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>&nbsp; </FONT> <table width="100%" border="0">
                                    <tr> 
                                      <td>&nbsp;</td>
                                    </tr>
                                  </table></TD>
                              </TR>
                            </TBODY>
                          </TABLE></TD>
                        <TD width=20>&nbsp;</TD>
                      </TR>
                      <TR> 
                        <TD>&nbsp;</TD>
                        <TD>&nbsp;</TD>
                        <TD>&nbsp;</TD>
                      </TR>
                    </TBODY>
                  </TABLE></TD>
              </TR>
              <TR> 
                <TD><div align="center">
                    <INPUT class=botoes type=submit value="ENVIAR" name=Submit>
                  </div></TD>
              </TR>
            </TBODY>
          </TABLE></TD>
        <TD width=20>&nbsp;</TD>
      </TR>
      <TR> 
        <TD width=20>&nbsp; </TD>
        <TD width="515">&nbsp;</TD>
        <TD width=20>&nbsp; </TD>
      </TR>
    </TBODY>
  </TABLE>
</form>
</body>
</html>
