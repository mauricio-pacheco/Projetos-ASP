<style type="text/css">
<!--
.style2 {
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
-->
</style>
<TABLE cellSpacing=0 cellPadding=15 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD background="fundo.jpg" class=PresentacionHomeBC>
                       <TABLE id=table__15956 cellSpacing=0 cellPadding=0 
                        width="100%" border=0>
                          <TBODY>
                          <TR>
                            <TD width="2%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><img src="seta.gif" width="12" height="12"></TD>
                            <TD width="43%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><span class="PresentacionHomeBD" style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif">&nbsp;Reservas</span></TD>
                            <TD width="55%" align="left" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><script language="JavaScript" type="text/JavaScript">
var datahora,xhora,xdia,dia,mes,ano,txtsaudacao;
datahora = new Date();
xhora = datahora.getHours();
if (xhora >= 0 && xhora < 12) {txtsaudacao = "Bom Dia!"}
if (xhora >= 12 && xhora < 18) {txtsaudacao = "Boa Tarde!"}
if (xhora >= 18 && xhora <= 23) {txtsaudacao = "Boa Noite!"}
xdia = datahora.getDay();
diasemana = new Array(7);
diasemana[0] = "Domingo";
diasemana[1] = "Segunda-feira";
diasemana[2] = "Terça-feira";
diasemana[3] = "Quarta-feira";
diasemana[4] = "Quinta-feira";
diasemana[5] = "Sexta-feira";
diasemana[6] = "Sábado";
dia = datahora.getDate();
mes = datahora.getMonth();
mesdoano = new Array(12);
mesdoano[0] = "janeiro";
mesdoano[1] = "fevereiro";
mesdoano[2] = "março";
mesdoano[3] = "abril";
mesdoano[4] = "maio";
mesdoano[5] = "junho";
mesdoano[6] = "julho";
mesdoano[7] = "agosto";
mesdoano[8] = "setembro";
mesdoano[9] = "outubro";
mesdoano[10] = "novembro";
mesdoano[11] = "dezembro";
ano = datahora.getFullYear();
document.write(txtsaudacao + " Hoje, " + diasemana[xdia] + ", " + dia + " de " + mesdoano[mes] + " de " + ano);
</script></TD>
                          </TR>
						  <TR height="1">
                            <TD width="2%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif">&nbsp;</TD>
                            <TD width="43%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif">&nbsp;</TD>
                            <TD width="55%" align="left" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"></TD>
                          </TR>
                          </TBODY></TABLE>
                        <table width="100%" height="350" border="0">
                          <tr>
                            <td><div align="center">
                              <p>
                                <%

'por: Mauricio Pacheco
Dim iMail, Nome, Endereco, Cidade, Estado, Cep, Ddd, Telefone, Fax, Email, Destino, Origem, Saida, Retorno, Adultos, Criancas, Mensagem, Resposta

Nome = Request.form("nome") 
Endereco = Request.form("endereco") 
Cidade = Request.form("cidade") 
Estado = Request.form("estado") 
Cep = Request.form("cep") 
Ddd = Request.form("ddd") 
Telefone = Request.form("telefone") 
Fax = Request.form("fax")
Email = Request.form("email") 
Destino = Request.form("destino") 
Origem = Request.form("origem")
Saida = Request.form("saida")
Retorno = Request.form("retorno") 
Adultos = Request.form("adultos")
Criancas = Request.form("criancas") 
Mensagem = Request.form("mensagem") 
Resposta = Request.form("resposta") 

meu_email = "mandry@casadaweb.net"

corpo = "<div align=""center""><font size=""2"" face=""Verdana, Arial, Helvetica, sans-serif"">FORMULÁRIO DE CONTATOS DO SITE DA MATEUS TUR!</font></div><br><br><b>DADOS DA RESERVA:</b><BR><BR><font size=""2"" face=""Verdana, Arial, Helvetica, sans-serif""><b>Nome:</b>" & Nome & "<BR>"
corpo = corpo & "<b>Endereço:</b> " & Endereco & "<BR>"
corpo = corpo & "<b>Cidade:</b> " & Cidade & "<BR>"
corpo = corpo & "<b>Estado:</b> " & Estado & "<BR>"
corpo = corpo & "<b>CEP:</b> " & Cep & "<BR>"
corpo = corpo & "<b>Telefone:</b> " & Ddd & " - " & Telefone & "<BR>"
corpo = corpo & "<b>FAX:</b> " & Fax & "<BR>"
corpo = corpo & "<b>E-mail:</b> " & Email & "<BR><BR>"
corpo = corpo & "<b>DADOS DA RESERVA:</b><BR><BR>"
corpo = corpo & "<b>Destino:</b> " & Destino & "<BR>"
corpo = corpo & "<b>Origem:</b> " & Origem & "<BR>"
corpo = corpo & "<b>Saída:</b> " & Saida & "<BR>"
corpo = corpo & "<b>Retorno:</b> " & Retorno & "<BR>"
corpo = corpo & "<b>Número de Adultos:</b> " & Adultos & "<BR>"
corpo = corpo & "<b>Número de Crianças:</b> " & Criancas & "<BR>"
corpo = corpo & "<b>Mensagem:</b> " & Mensagem & "</font><BR><BR>"
corpo = corpo & "<b>RESPOSTA SELECIONADA:</b> " & Resposta & "<BR>"


Set iMail = CreateObject("CDONTS.NewMail")
iMail.From = email
iMail.To = meu_email
iMail.Subject = Nome
iMail.MailFormat = 0
iMail.BodyFormat = 0
iMail.Body = corpo
iMail.Send


Set objMail = nothing
%> 
                                <img src="logotipo.jpg" width="320" height="116" /></p>
                              <p class="style2">Formul&aacute;rio enviado com sucesso!</p>
                              <p class="style2">Logo estaremos entrando em contato. </p>
                            </div></td>
                          </tr>
                        </table>
                        </TD></TR></TBODY></TABLE>