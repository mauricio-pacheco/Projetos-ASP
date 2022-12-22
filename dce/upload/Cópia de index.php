<html>
<head>
<title>Cadastro B&aacute;sico Brasil</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="Javascript">

<!-- Begin
function validate(){
var digits="0123456789"
var temp


if (document.form1.login.value=="") {
alert("O Campo Usuário não está preenchido!")
return false
}


if (document.form1.senha.value=="") {
alert("O Campo Senha não está preenchido!")
return false
}


if (document.form1.razao.value=="") {
alert("O Campo Razão Social não está preenchido!")
return false
}

if (document.form1.endereco.value=="") {
alert("O Campo Endereço não está preenchido!")
return false
}

if (document.form1.bairro.value=="") {
alert("O Campo Bairro não está preenchido!")
return false
}

if (document.form1.cidade.value=="") {
alert("O Campo Cidade não está preenchido!")
return false
}

if (document.form1.estado.value=="") {
alert("O Campo Estado não está preenchido!")
return false
}

if (document.form1.cep.value=="") {
alert("O Campo CEP não está preenchido!")
return false
}

if (document.form1.telefone.value=="") {
alert("O Campo Telefone não está preenchido!")
return false
}

if (document.form1.estadual.value=="") {
alert("O Campo Insc. Estadual não está preenchido!")
return false
}

for (var i=0;i<document.testform.age.value.length;i++){
temp=document.testform.age.value.substring(i,i+1)
if (digits.indexOf(temp)==-1){
alert("O campo idade, deve ser preenchido apenas com números!")
return false
      }
   }
return true
}
// End -->
</script>
</head>
<LINK href="style.css" type=text/css rel=stylesheet>
<body bgcolor="#f5f5f5" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<form action="add_user.php" method="post" enctype="multipart/form-data" name="form1" onSubmit="return validate()">
  <p align="center"><img src="encima.jpg" width="264" height="86"></p>
  <TABLE width="555" border="0" align="center" cellPadding=0 cellSpacing=0 bgcolor="f5f5f5">
    <TBODY>
      <TR> 
        <TD width=20>&nbsp;</TD>
        <TD width="515"><TABLE cellSpacing=0 cellPadding=0 width="98%" align=center  border=0>
            <TBODY>
              <TR> 
                <TD><TABLE cellSpacing=0 cellPadding=0 width="505" 
border=0>
                    <TBODY>
                      <TR> 
                        <TD width=20>&nbsp;</TD>
                        <TD width="465"><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                            <TBODY>
                              <TR> 
                                <TD height="24" colSpan=2><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=2><STRONG>Dados Gerais</STRONG></FONT><br></TD>
                              </TR>
                              <TR> 
                                <TD><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Usu&aacute;rio:</FONT></TD>
                                <TD><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <input type="text" class=camposformularios id="login"  name="login" value="<?php echo $login; ?>">
                                  <font color="#FF0000">*</font> </FONT></TD>
                              </TR>
                              <TR> 
                                <TD><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Senha:</FONT></TD>
                                <TD><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <input type="password" class=camposformularios id="senha"  name="senha" value="<?php echo $senha; ?>">
                                  <font color="#FF0000">*</font> </FONT></TD>
                              </TR>
                              <TR>
                                <TD>&nbsp;</TD>
                                <TD>&nbsp;</TD>
                              </TR>
                              <TR> 
                                <TD><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Ramo de Atividade:</FONT></TD>
                                <TD><input type="checkbox" name="etelefone" value="Loja"> 
                                  <font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Loja</font> 
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                  <input type="checkbox" name="etelefone2" value="Representação Comercial"> 
                                  <font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Representa&ccedil;&atilde;o 
                                  Comercial</font></TD>
                              </TR>
                              <TR> 
                                <TD width="27%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Raz&atilde;o Social:</FONT></TD>
                                <TD width="73%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id="razao" maxLength=60 
                                size=50 name="razao" Value="<?php echo $razao; ?>">
                                  <font color="#FF0000">*</font> </FONT></TD>
                              </TR>
                              <TR> 
                                <TD><font 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Nome Fantasia:</font></TD>
                                <TD><font 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <input 
                                class=camposformularios maxlength=10 size=40 id="fantasia" name="fantasia" value="<?php echo $fantasia; ?>">
                                  </font></TD>
                              </TR>
                              <TR> 
                                <TD width="27%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>E-mail:</FONT></TD>
                                <TD width="73%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <input type="text" class=camposformularios id="email"  name="email" value="<?php echo $email; ?>">
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Home Page:</FONT></TD>
                                <TD><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios maxLength=10 size=40 id="site" name="site" value="<?php echo $site; ?>">
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="27%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Endereço:</FONT></TD>
                                <TD width="73%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id="endereco" maxLength=60 
                                size=50 name="endereco" value="<?php echo $endereco; ?>">
                                  <font color="#FF0000">*</font> </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="27%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Bairro:</FONT></TD>
                                <TD width="73%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id="bairro" maxLength=40 
                                size=20 name="bairro" value="<?php echo $bairro; ?>">
                                  <font color="#FF0000">*</font> </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="27%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Cidade:</FONT></TD>
                                <TD width="73%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id="cidade" maxLength=40 
                                size=40 name="cidade" value="<?php echo $cidade; ?>">
                                  <font color="#FF0000">*</font> </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="27%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Estado:</FONT></TD>
                                <TD width="73%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <select name="estado">
                                    <option value="--">-- 
                                    <option value="AC">AC 
                                    <option value="AL">AL 
                                    <option value="AM">AM 
                                    <option value="AP">AP 
                                    <option value="BA">BA 
                                    <option value="CE">CE 
                                    <option value="DF">DF 
                                    <option value="ES">ES 
                                    <option value="GO">GO 
                                    <option value="MA">MA 
                                    <option value="MG">MG 
                                    <option value="MS">MS 
                                    <option value="MT">MT 
                                    <option value="PA">PA 
                                    <option value="PB">PB 
                                    <option value="PE">PE 
                                    <option value="PI">PI 
                                    <option value="PR">PR 
                                    <option value="RJ">RJ 
                                    <option value="RN">RN 
                                    <option value="RO">RO 
                                    <option value="RR">RR 
                                    <option value="RS">RS 
                                    <option value="SC">SC 
                                    <option value="SE">SE 
                                    <option value="SP">SP 
                                    <option value="TO">TO</option>
                                  </select>
                                  <font color="#FF0000">*</font> </FONT></TD>
                              </TR>
                              <TR> 
                                <TD><font 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>CEP:</font></TD>
                                <TD><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id=cep maxLength=20 
                                value="<?php echo $cep; ?>" name=cep>
                                  <font color="#FF0000">*</font> </FONT></TD>
                              </TR>
                              <TR> 
                                <TD><font 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>CNPJ:</font></TD>
                                <TD><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id=cnpj maxLength=20 onFocus='this.select();' OnKeyUp="FormataCGC('Form', 'cnpj', event);" 
                                value="<?php echo $cnpj; ?>" name=cpf>
                                  <font color="#FF0000">*</font> </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="27%"><font 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Ins. Estadual:</font></TD>
                                <TD width="73%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id=estadual maxLength=20 
                                value="<?php echo $estadual; ?>" name=estadual>
                                  <font color="#FF0000">*</font> </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="27%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Telefone Comercial:</FONT></TD>
                                <TD width="73%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularioscomuns id=telefone value="<?php echo $telefone; ?>"                         
                                maxLength=9 size=16 name=telefone>
                                  <font color="#FF0000">*</font> </FONT></TD>
                              </TR>
                              <TR> 
                                <TD><font 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>FAX:</font></TD>
                                <TD><font 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <input 
                                class=camposformulariosminusculo id=fax2 
                                maxlength=70 size=16 name=fax value="<?php echo $fax; ?>">
                                  </font></TD>
                              </TR>
                              <TR> 
                                <TD><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Celular:</FONT></TD>
                                <TD><font 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <input class=camposformularioscomuns id=celular2 value="<?php echo $celular; ?>" maxlength=9 size=16 name=celular>
                                  </font></TD>
                              </TR>
                              <TR> 
                                <TD width="27%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Telefone Residencial:</FONT></TD>
                                <TD width="73%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <input class=camposformularioscomuns id=enome value="<?php echo $enome; ?>" maxlength=9 size=16 name=enome>
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="27%">&nbsp;</TD>
                                <TD width="73%"><div align="right"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>&nbsp; <font color="#FF0000">*</font> 
                                    Campos Obrigat&oacute;rios</FONT></div></TD>
                              </TR>
                            </TBODY>
                          </TABLE></TD>
                        <TD width=20>&nbsp;</TD>
                      </TR>
                      <TR> 
                        <TD width=20>&nbsp;</TD>
                        <TD width="465">&nbsp;</TD>
                        <TD width=20>&nbsp;</TD>
                      </TR>
                    </TBODY>
                  </TABLE></TD>
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
                        <TD width=20 height="516">&nbsp;</TD>
                        <TD width="100%"> <TABLE cellSpacing=0 cellPadding=0 width="100%" 
                              border=0>
                            <TBODY>
                              <TR> 
                                <TD colSpan=2><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=2><STRONG>Refer&ecirc;ncias 
                                  Comerciais </STRONG></FONT><br> <br></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>3 Refer&ecirc;ncias:</FONT></TD>
                                <TD width="78%"><table width="100%" border="0">
                                    <tr>
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
                                        / Telefone / Contato</font></td>
                                    </tr>
                                    <tr>
                                      <td><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>
                                        <TEXTAREA class=camposformulariosgrandes id=econtato  name=econtato rows=5 wrap=VIRTUAL cols=50 MAXLENGTH="500"></TEXTAREA>
                                        </FONT></td>
                                    </tr>
                                  </table>
                                  <FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>&nbsp; </FONT></TD>
                              </TR>
                              <TR> 
                                <TD colSpan=2>&nbsp;</TD>
                              </TR>
                              <TR> 
                                <TD colSpan=2><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=2><STRONG>1 - Refer&ecirc;ncias 
                                  Banc&aacute;rias</STRONG></FONT><br> <br></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Banco:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id=banco1 maxLength=70 
                                size=50 name=banco1 value="<?php echo $banco1; ?>">
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Conta:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id=conta1 maxLength=50 
                                size=20 name=conta1 value="<?php echo $conta1; ?>">
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Telefone:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id=telbanco1 maxLength=10 
                                size=18 name=telbanco1 value="<?php echo $telbanco1; ?>">
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Ag&ecirc;ncia:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT class=camposformularioscomuns id=agencia1 maxLength=9 size=17 name=agencia1 value="<?php echo $agencia1; ?>">
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Gerente:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id=gerente1 
                                maxLength=50 size=50 name=gerente1 value="<?php echo $gerente1; ?>">
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD colSpan=2>&nbsp;</TD>
                              </TR>
                              <TR> 
                                <TD colSpan=2><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=2><STRONG>2 - Refer&ecirc;ncias 
                                  Banc&aacute;rias</STRONG></FONT><br> <br></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Banco:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id=banco2 maxLength=70 
                                size=50 name=banco2 value="<?php echo $banco2; ?>">
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Conta:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id=conta2 value="<?php echo $conta2; ?>" maxLength=50 
                                size=20 name=conta2>
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Telefone:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id=telbanco2  value="<?php echo $telbanco2; ?>" maxLength=10 
                                size=18 name=telbanco2>
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Ag&ecirc;ncia:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT class=camposformularioscomuns 
                                id=agencia2 maxLength=9 size=17 name=agencia2 value="<?php echo $agencia2; ?>">
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Gerente:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <INPUT 
                                class=camposformularios id=gerente2 
                                maxLength=50 size=50 name=gerente2 value="<?php echo $gerente2; ?>">
                                  </FONT></TD>
                              </TR>
                              <TR> 
                                <TD colSpan=2>&nbsp;</TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Marcas que trabalha:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                  <TEXTAREA class=camposformulariosgrandes id=marcas name=marcas rows=5 wrap=VIRTUAL cols=50 MAXLENGTH="500"><?php echo $marcas; ?></TEXTAREA>
                                  </FONT></TD>
                              </TR>
                            </TBODY>
                          </TABLE></TD>
                        <TD width=20>&nbsp;</TD>
                      </TR>
                      <TR> 
                        <TD width=20>&nbsp;</TD>
                        <TD width="100%">&nbsp;</TD>
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
                        <TD> <FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Foto da Empresa (m&aacute;x 
                          200 Kb):</FONT> <input type="file" name="arquivo"> </TD>
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
                                <TD colSpan=2><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=2><STRONG>Dados Pessoais dos 
                                  S&oacute;cios </STRONG></FONT><br> <br></TD>
                              </TR>
                              <TR> 
                                <TD width="22%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>Dados Pessoais:</FONT></TD>
                                <TD width="78%"><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1>&nbsp; </FONT> <table width="100%" border="0">
                                    <tr> 
                                      <td><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome 
                                        do S&oacute;cio, CPF e RG</font></td>
                                    </tr>
                                    <tr> 
                                      <td><FONT 
                                face="Verdana, Arial, Helvetica, sans-serif" 
                                color=#000000 size=1> 
                                        <TEXTAREA class=camposformulariosgrandes id=textarea name=dados rows=10 wrap=VIRTUAL cols=50 MAXLENGTH="500"></TEXTAREA>
                                        </FONT></td>
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
                    <INPUT class=botoes type=submit value="ENVIAR FORMULÁRIO" name=Submit>
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
