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
                            <TD width="43%" class=PresentacionHomeBD style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"><span class="PresentacionHomeBD" style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif">&nbsp;Passagens A&eacute;reas</span></TD>
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
Dim iMail, Nome, Email, Telefone, Tarifa, Classe, De1, De2, De3, De4, Para1, Para2, Para3, Para4, Mes1, Mes2, Mes3, Mes4, Dia1, Dia2, Dia3, Dia4, Ano1, Ano2, Ano3, Ano4, Periodo1, Periodo2, Periodo3, Periodo4, Nome1, Nome2, Nome3, Nome4, Sobrenome1, Sobrenome2, Sobrenome3, Sobrenome4, Idade1, Idade2, Idade3, Idade4, Observacoes

Nome = Request.form("nome") 
Email = Request.form("email") 
Telefone = Request.form("telefone") 
Tarifa = Request.form("tarifa") 
Classe = Request.form("classe") 
De1 = Request.form("de1") 
De2 = Request.form("de2") 
De3 = Request.form("de3") 
De4 = Request.form("de4") 
Para1 = Request.form("para1") 
Para2 = Request.form("para2") 
Para3 = Request.form("para3") 
Para4 = Request.form("para4")
Mes1 = Request.form("mes1") 
Mes2 = Request.form("mes2") 
Mes3 = Request.form("mes3") 
Mes4 = Request.form("mes4") 
Dia1 = Request.form("dia1") 
Dia2 = Request.form("dia2") 
Dia3 = Request.form("dia3") 
Dia4 = Request.form("dia4")
Ano1 = Request.form("ano1") 
Ano2 = Request.form("ano2") 
Ano3 = Request.form("ano3") 
Ano4 = Request.form("ano4")
Periodo1 = Request.form("periodo1") 
Periodo2 = Request.form("periodo2") 
Periodo3 = Request.form("periodo3") 
Periodo4 = Request.form("periodo4") 
Nome1 = Request.form("nome1") 
Nome2 = Request.form("nome2") 
Nome3 = Request.form("nome3") 
Nome4 = Request.form("nome4")
Sobrenome1 = Request.form("sobrenome1") 
Sobrenome2 = Request.form("sobrenome2") 
Sobrenome3 = Request.form("sobrenome3") 
Sobrenome4 = Request.form("sobrenome4") 
Idade1 = Request.form("idade1") 
Idade2 = Request.form("idade2") 
Idade3 = Request.form("idade3") 
Idade4 = Request.form("idade4") 
Observacoes = Request.form("observacoes") 

meu_email = "mandry@casadaweb.net"

corpo = "<div align=""center""><font size=""2"" face=""Verdana, Arial, Helvetica, sans-serif"">FORMULÁRIO DAS PASSAGENS AÉREAS DO SITE DA MATEUS TUR!</font></div><br><br><b>DADOS DA RESERVA:</b><BR><BR><font size=""2"" face=""Verdana, Arial, Helvetica, sans-serif""><b>Nome:</b>" & Nome & "<BR>"
corpo = corpo & "<b>E-mail:</b> " & Email & "<BR>"
corpo = corpo & "<b>Telefone:</b> " & Telefone & "<BR>"
corpo = corpo & "<b>1.a opção:</b> " & Tarifa & "<BR>"
corpo = corpo & "<b>Classe de serviço:</b> " & Classe & "<BR>"
corpo = corpo & "<b>TRECHO:</b>""<BR><br>"
corpo = corpo & "<b>DE:</b>""<BR><br>"
corpo = corpo & "<b>1º:</b> " & De1 & "<BR>"
corpo = corpo & "<b>2º:</b> " & De2 & "<BR>"
corpo = corpo & "<b>3º:</b> " & De3 & "<BR>"
corpo = corpo & "<b>4º:</b> " & De4 & "<BR><BR>"
corpo = corpo & "<b>Para:</b>""<BR><br>"
corpo = corpo & "<b>1º:</b> " & Para1 & "<BR>"
corpo = corpo & "<b>2º:</b> " & Para2 & "<BR>"
corpo = corpo & "<b>3º:</b> " & Para3 & "<BR>"
corpo = corpo & "<b>4º:</b> " & Para4 & "<BR><BR>"
corpo = corpo & "<b>Data de Saída:</b>""<BR><br>"
corpo = corpo & "<b>1º:</b> " & Dia1 & " - " & Mes1 & " - " & Ano1 & "<BR>"
corpo = corpo & "<b>2º:</b> " & Dia2 & " - " & Mes2 & " - " & Ano2 & "<BR>"
corpo = corpo & "<b>3º:</b> " & Dia3 & " - " & Mes3 & " - " & Ano3 & "<BR>"
corpo = corpo & "<b>4º:</b> " & Dia4 & " - " & Mes4 & " - " & Ano4 & "<BR><BR>"
corpo = corpo & "<b>Período:</b>""<BR><br>"
corpo = corpo & "<b>1º:</b> " & Periodo1 & "<BR>"
corpo = corpo & "<b>2º:</b> " & Periodo2 & "<BR>"
corpo = corpo & "<b>3º:</b> " & Periodo3 & "<BR>"
corpo = corpo & "<b>4º:</b> " & Periodo4 & "<BR><BR>"
corpo = corpo & "<b>Nome dos Passageiros:</b>""<BR><br>"
corpo = corpo & "<b>1º:</b> " & Nome1 & " - " & Sobrenome1 & " - " & Idade1 & "<BR>"
corpo = corpo & "<b>2º:</b> " & Nome2 & " - " & Sobrenome2 & " - " & Idade2 & "<BR>"
corpo = corpo & "<b>3º:</b> " & Nome3 & " - " & Sobrenome3 & " - " & Idade3 & "<BR>"
corpo = corpo & "<b>4º:</b> " & Nome4 & " - " & Sobrenome4 & " - " & Idade4 & "<BR><BR>"
corpo = corpo & "<b>OBSERVAÇÕES:</b> " & Observacoes & "<BR>"


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