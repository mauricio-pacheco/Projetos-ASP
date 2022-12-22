<%
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################
'#
'#  CÓDIGO: VirtuaStore Versão 1.2 - Copyright 2001-2003 VirtuaWorks                                    
'#  URL: www.virtuastore.com.br / www.virtuaworks.com.br                                                           
'#  E-MAIL: webmaster@virtuaworks.com.br                                                                                          
'#  AUTORES: Otávio Dias(Desenvolvedor) / Jone Bandinelli(Desenvolvedor) / Daniel Kern(Revisão)                
'# 
'#     Este programa é um software livre; você pode redistribuí-lo e/ou 
'#     modificá-lo sob os termos do GNU General Public License como 
'#     publicado pela Free Software Foundation.
'#     É importante lembrar que qualquer alteração feita no programa 
'#     deve ser informada e enviada para os criadores, através de e-mail 
'#     ou da página de onde foi baixado o código.
'#
'#  //-------------------------------------------------------------------------------------
'#  // LEIA COM ATENÇÃO: O software VirtuaStore 1.2 deve conter as frases
'#  // "Powered by VirtuaStore 1.2" ou "Software derivado de VirtuaStore 1.2" e 
'#  // o link para o site http://www.virtuastore.com.br no créditos da 
'#  // sua loja virtual para ser utilizado gratuitamente. Se o link e/ou uma das 
'#  // frases não estiver presentes ou visiveis este software deixará de ser
'#  // considerado Open-source(gratuito) e o uso sem autorização terá 
'#  // penalidades judiciais de acordo com as leis de pirataria de software.
'#  //--------------------------------------------------------------------------------------
'#      
'#     Este programa é distribuído com a esperança de que lhe seja útil,
'#     porém SEM NENHUMA GARANTIA. Veja a GNU General Public License
'#     abaixo (GNU Licença Pública Geral) para mais detalhes.
'# 
'#     Você deve receber a cópia da Licença GNU com este programa, 
'#     caso contrário escreva para
'#     Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
'#     Boston, MA  02111-1307  USA
'# 
'#     Para enviar suas dúvidas, sugestões e/ou contratar a VirtuaWorks 
'#     Internet Design entre em contato através do e-mail 
'#     contato@virtuaworks.com.br ou pelo endereço abaixo: 
'#     Rua Venâncio Aires, 1001 - Niterói - Canoas - RS - Brasil. Cep 92110-000.
'#
'#     Para ajuda e suporte acesse: http://www.virtuastore.com.br
'#
'#     BOM PROVEITO!          
'#     Equipe VirtuaStore
'#     []'s
'#
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################
%>
<html>
<!-- #include file="config.asp" -->
<%
'******************************************
'Dados do Autor:
' 	Copyright (C) 2002  Data Tech Tecnologia e Informática LTDA
'  daniel@seevissp.org.br - avenida daury goes de moraes, 357 - caieiras - são paulo - sp - 07700-000 - brasil
'******************************************

' Response.Expires = 60
'Response.Expiresabsolute = Now() - 1
'Response.AddHeader "pragma","no-cache"
'Response.AddHeader "cache-control","private"
'Response.CacheControl = "no-cache"


SDIG=""
CDIG=""
LDIG=""
NOSSONUMERO=""
Dim atab(99)


'********************************
' CONSTANTES
'********************************

cons_banco = bol_banco
cons_dvbanco = bol_dvbanco
cons_agencia = bol_agencia
cons_conta = bol_conta
cons_dvconta = bol_dvconta
cons_carteira = bol_carteira
cons_letracarteira = bol_letracarteira
cons_moeda = bol_moeda
cons_especie = bol_especie
cons_codigocedente = bol_codigocedente
cons_cedente = bol_cedente
cons_dadoscedente = bol_dadoscedente

'********************************
' VARIÁVEIS
'********************************

var_sacado = Request.QueryString("sacador")
var_endereco = Request.QueryString("endereco")
var_bairro = Request.QueryString("bairro")
var_cidade = Request.QueryString("cidade")
var_estado = Request.QueryString("estado")
var_cep = Request.QueryString("cep")
var_cpfcnpj = CNPJ_da_sua_empresa

'*************************************** 
 Function Converten(pNumeron)
 Converten = Right(String(8,"0") &_
 cstr(pNumeron * 100),8)
 End Function
'****************************************

var_nossonumero = Converten(ccur(Request.QueryString("nossonumero")))
var_datadocumento = Request.QueryString("datadocumento")
var_datavencimento = Request.QueryString("datavencimento")
var_valordocumento = Request.QueryString("valordocumento")
var_numerodoc = Request.QueryString("numerodoc")
var_instrucoes="<B><BR> Não receber após 90 dias.<BR> Pagável em CASAS LOTÉRICAS, em agências da CAIXA ECONÔMICA FEDERAL<br> e em qualquer agência bancária até o vencimento <BR></b>"
var_observacoes="<B> <BR> Pagamento referente a compra efetuada na loja "&application("nomeloja")&"<BR> <BR> <BR> <BR></b>"

if var_datavencimento = "" then
   var_datavencimento = "Contra Apresentação"
end if


'********************************************************
' INICIO DO CÁLCULO DO DIGITO VERIFICAR DO NOSSO NUMERO
'********************************************************

val_d1 = mid(cons_carteira&var_nossonumero,10,1)
val_d2 = mid(cons_carteira&var_nossonumero,9,1)
val_d3 = mid(cons_carteira&var_nossonumero,8,1)
val_d4 = mid(cons_carteira&var_nossonumero,7,1)
val_d5 = mid(cons_carteira&var_nossonumero,6,1)
val_d6 = mid(cons_carteira&var_nossonumero,5,1)
val_d7 = mid(cons_carteira&var_nossonumero,4,1)
val_d8 = mid(cons_carteira&var_nossonumero,3,1)
val_d9 = mid(cons_carteira&var_nossonumero,2,1)
val_d10 = mid(cons_carteira&var_nossonumero,1,1)

soma1 = 2 * val_d1
soma2 = 3 * val_d2
soma3 = 4 * val_d3
soma4 = 5 * val_d4
soma5 = 6 * val_d5
soma6 = 7 * val_d6
soma7 = 8 * val_d7
soma8 = 9 * val_d8
soma9 = 2 * val_d9
soma10 = 3 * val_d10

soma = soma1 + soma2 + soma3 + soma4 + soma5 + soma6 + soma7 + soma8 + soma9 + soma10

resto = soma mod 11

if resto > 9 then
 dvnossonumero = 0
else
 dvnossonumero = 11 - resto
end if

'********************************************************
' INICIO DO CÁLCULO DO DIGITO VERIFICAR DA BARRA
'********************************************************

Function Converte(pNumero)
Converte = Right(String(14,"0") &_
cstr(pNumero * 100),14)
End Function

var_barra = cons_banco&cons_moeda & converte(ccur(var_valordocumento)) & cons_carteira&var_nossonumero&cons_agencia&cons_conta


val_d1 = mid(var_barra,43,1)
val_d2 = mid(var_barra,42,1)
val_d3 = mid(var_barra,41,1)
val_d4 = mid(var_barra,40,1)
val_d5 = mid(var_barra,39,1)
val_d6 = mid(var_barra,38,1)
val_d7 = mid(var_barra,37,1)
val_d8 = mid(var_barra,36,1)
val_d9 = mid(var_barra,35,1)
val_d10 = mid(var_barra,34,1)
val_d11 = mid(var_barra,33,1)
val_d12 = mid(var_barra,32,1)
val_d13 = mid(var_barra,31,1)
val_d14 = mid(var_barra,30,1)
val_d15 = mid(var_barra,29,1)
val_d16 = mid(var_barra,28,1)
val_d17 = mid(var_barra,27,1)
val_d18 = mid(var_barra,26,1)
val_d19 = mid(var_barra,25,1)
val_d20 = mid(var_barra,24,1)
val_d21 = mid(var_barra,23,1)
val_d22 = mid(var_barra,22,1)
val_d23 = mid(var_barra,21,1)
val_d24 = mid(var_barra,20,1)
val_d25 = mid(var_barra,19,1)
val_d26 = mid(var_barra,18,1)
val_d27 = mid(var_barra,17,1)
val_d28 = mid(var_barra,16,1)
val_d29 = mid(var_barra,15,1)
val_d30 = mid(var_barra,14,1)
val_d31 = mid(var_barra,13,1)
val_d32 = mid(var_barra,12,1)
val_d33 = mid(var_barra,11,1)
val_d37 = mid(var_barra,10,1)
val_d35 = mid(var_barra,9,1)
val_d36 = mid(var_barra,8,1)
val_d37 = mid(var_barra,7,1)
val_d38 = mid(var_barra,6,1)
val_d39 = mid(var_barra,5,1)
val_d40 = mid(var_barra,4,1)
val_d41 = mid(var_barra,3,1)
val_d42 = mid(var_barra,2,1)
val_d43 = mid(var_barra,1,1)

soma1 = 2 * val_d1
soma2 = 3 * val_d2
soma3 = 4 * val_d3
soma4 = 5 * val_d4
soma5 = 6 * val_d5
soma6 = 7 * val_d6
soma7 = 8 * val_d7
soma8 = 9 * val_d8
soma9 = 2 * val_d9
soma10 = 3 * val_d10
soma11 = 3 * val_d11
soma12 = 3 * val_d12
soma13 = 3 * val_d13
soma14 = 3 * val_d14
soma15 = 3 * val_d15
soma16 = 3 * val_d16
soma17 = 3 * val_d17
soma18 = 3 * val_d18
soma19 = 3 * val_d19
soma20 = 3 * val_d20
soma21 = 3 * val_d21
soma22 = 3 * val_d22
soma23 = 3 * val_d23
soma24 = 3 * val_d24
soma25 = 3 * val_d25
soma26 = 3 * val_d26
soma27 = 3 * val_d27
soma28 = 3 * val_d28
soma29 = 3 * val_d29
soma30 = 3 * val_d30
soma31 = 3 * val_d31
soma32 = 3 * val_d32
soma33 = 3 * val_d33
soma34 = 3 * val_d34
soma35 = 3 * val_d35
soma36 = 3 * val_d36
soma37 = 3 * val_d37
soma38 = 3 * val_d38
soma39 = 3 * val_d39
soma40 = 3 * val_d40
soma41 = 3 * val_d41
soma42 = 3 * val_d42
soma43 = 3 * val_d43

soma = soma1 + soma2 + soma3 + soma4 + soma5 + soma6 + soma7 + soma8 + soma9 + soma10 &_
soma11 = soma12 + soma13 + soma14 + soma15 + soma16 + soma17 + soma18 + soma19 + soma20 + soma21 &_
soma22 = soma23 + soma24 + soma25 + soma26 + soma27 + soma28 + soma29 + soma30 + soma31 + soma32 &_
soma33 = soma34 + soma35 + soma36 + soma37 + soma38 + soma39 + soma40 + soma41 + soma42 + soma43

resto = soma mod 11

if (11 - resto) = 0 or (11 - resto) = 1 or (11 - resto) > 9 then
  dvbarramonze = 1
Else
  dvbarramonze  = 11 - resto
End if

var_numeros = cons_banco & cons_moeda & converte(ccur(var_valordocumento)) & cons_carteira&var_nossonumero&cons_agencia&cons_conta

'*************************************************************
' INICIO DO CÁLCULO DO DIGITO DOS CAMPOS DA BARRA E MONTAGEM
'*************************************************************

'************
'*  CAMPO1  *
'************

campo1 = var_numeros

var_campo1 = mid(campo1,1,4) & mid(campo1,20,5) 

'var_campo1 = "104990000"

val_d1 = mid(var_campo1,9,1)
val_d2 = mid(var_campo1,8,1)
val_d3 = mid(var_campo1,7,1)
val_d4 = mid(var_campo1,6,1)
val_d5 = mid(var_campo1,5,1)
val_d6 = mid(var_campo1,4,1)
val_d7 = mid(var_campo1,3,1)
val_d8 = mid(var_campo1,2,1)
val_d9 = mid(var_campo1,1,1)

soma1 = 2 * val_d1
soma2 = 1 * val_d2
soma3 = 2 * val_d3
soma4 = 1 * val_d4
soma5 = 2 * val_d5
soma6 = 1 * val_d6
soma7 = 2 * val_d7
soma8 = 1 * val_d8
soma9 = 2 * val_d9

If len(soma1) = 2 then
  soma1 = cdbl(left(soma1,1)) + cdbl(right(soma1,1))
  soma = soma1
Else
  soma = soma1 
End if

If len(soma2) = 2 then
  soma2 = cdbl(left(soma2,1)) + cdbl(right(soma2,1))
  soma = soma + soma2
Else
  soma = soma + soma2 
End if

If len(soma3) = 2 then
  soma3 = cdbl(left(soma3,1)) + cdbl(right(soma3,1))
  soma = soma + soma3 
Else
  soma = soma + soma3 
End if

If len(soma4) = 2 then
  soma4 = cdbl(left(soma4,1)) + cdbl(right(soma4,1))
  soma = soma + soma4 
Else
  soma = soma + soma4 
End if

If len(soma5) = 2 then
  soma5 = cdbl(left(soma5,1)) + cdbl(right(soma5,1))
  soma = soma + soma5 
Else
  soma = soma + soma5 
End if

If len(soma6) = 2 then
  soma6 = cdbl(left(soma6,1)) + cdbl(right(soma6,1))
  soma = soma + soma6 
Else
  soma = soma + soma6 
End if

If len(soma7) = 2 then
  soma7 = cdbl(left(soma7,1)) + cdbl(right(soma7,1))
  soma = soma + soma7 
Else
  soma = soma + soma7 
End if

If len(soma8) = 2 then
  soma8 = cdbl(left(soma8,1)) + cdbl(right(soma8,1))
  soma = soma + soma8 
Else
  soma = soma + soma8 
End if

If len(soma9) = 2 then
  soma9 = cdbl(left(soma9,1)) + cdbl(right(soma9,1))
  soma = soma + soma9 
Else
  soma = soma + soma9 
End if

resto = soma mod 10

if (soma / 10) = 0 or resto > 9 or resto = 0 then
   dvcampo1 = 0
else   
   dvcampo1 = 10 - resto
end if


'***********************************
campo1 = mid(campo1,1,4) & mid(campo1,20,5)
'**********************************

'************
'*  CAMPO2  *
'************

campo2 = var_numeros

var_campo2 = mid(campo2,25,10) 

val_d1 = mid(var_campo2,9,1)
val_d2 = mid(var_campo2,8,1)
val_d3 = mid(var_campo2,7,1)
val_d4 = mid(var_campo2,6,1)
val_d5 = mid(var_campo2,5,1)
val_d6 = mid(var_campo2,4,1)
val_d7 = mid(var_campo2,3,1)
val_d8 = mid(var_campo2,2,1)
val_d9 = mid(var_campo2,1,1)

soma1 = 2 * val_d1
soma2 = 1 * val_d2
soma3 = 2 * val_d3
soma4 = 1 * val_d4
soma5 = 2 * val_d5
soma6 = 1 * val_d6
soma7 = 2 * val_d7
soma8 = 1 * val_d8
soma9 = 2 * val_d9

If len(soma1) = 2 then
  soma1 = cdbl(left(soma1,1)) + cdbl(right(soma1,1))
  soma = soma1
Else
  soma = soma1 
End if

If len(soma2) = 2 then
  soma2 = cdbl(left(soma2,1)) + cdbl(right(soma2,1))
  soma = soma + soma2
Else
  soma = soma + soma2 
End if

If len(soma3) = 2 then
  soma3 = cdbl(left(soma3,1)) + cdbl(right(soma3,1))
  soma = soma + soma3 
Else
  soma = soma + soma3 
End if

If len(soma4) = 2 then
  soma4 = cdbl(left(soma4,1)) + cdbl(right(soma4,1))
  soma = soma + soma4 
Else
  soma = soma + soma4 
End if

If len(soma5) = 2 then
  soma5 = cdbl(left(soma5,1)) + cdbl(right(soma5,1))
  soma = soma + soma5 
Else
  soma = soma + soma5 
End if

If len(soma6) = 2 then
  soma6 = cdbl(left(soma6,1)) + cdbl(right(soma6,1))
  soma = soma + soma6 
Else
  soma = soma + soma6 
End if

If len(soma7) = 2 then
  soma7 = cdbl(left(soma7,1)) + cdbl(right(soma7,1))
  soma = soma + soma7 
Else
  soma = soma + soma7 
End if

If len(soma8) = 2 then
  soma8 = cdbl(left(soma8,1)) + cdbl(right(soma8,1))
  soma = soma + soma8 
Else
  soma = soma + soma8 
End if

If len(soma9) = 2 then
  soma9 = cdbl(left(soma9,1)) + cdbl(right(soma9,1))
  soma = soma + soma9 
Else
  soma = soma + soma9 
End if

resto = soma mod 10

if (soma / 10) = 0 or resto > 9 or resto = 0 then
	dvcampo2 = 0
else   
   dvcampo2 = 10 - resto
end if

'****************************
campo2 = mid(campo2,24,10)
'****************************

'************
'*  CAMPO3  *
'************

campo3 = var_numeros

var_campo3 = mid(campo3,35,10) 


val_d1 = mid(var_campo3,9,1)
val_d2 = mid(var_campo3,8,1)
val_d3 = mid(var_campo3,7,1)
val_d4 = mid(var_campo3,6,1)
val_d5 = mid(var_campo3,5,1)
val_d6 = mid(var_campo3,4,1)
val_d7 = mid(var_campo3,3,1)
val_d8 = mid(var_campo3,2,1)
val_d9 = mid(var_campo3,1,1)

soma1 = 2 * val_d1
soma2 = 1 * val_d2
soma3 = 2 * val_d3
soma4 = 1 * val_d4
soma5 = 2 * val_d5
soma6 = 1 * val_d6
soma7 = 2 * val_d7
soma8 = 1 * val_d8
soma9 = 2 * val_d9

If len(soma1) = 2 then
  soma1 = cdbl(left(soma1,1)) + cdbl(right(soma1,1))
  soma = soma1
Else
  soma = soma1 
End if

If len(soma2) = 2 then
  soma2 = cdbl(left(soma2,1)) + cdbl(right(soma2,1))
  soma = soma + soma2
Else
  soma = soma + soma2 
End if

If len(soma3) = 2 then
  soma3 = cdbl(left(soma3,1)) + cdbl(right(soma3,1))
  soma = soma + soma3 
Else
  soma = soma + soma3 
End if

If len(soma4) = 2 then
  soma4 = cdbl(left(soma4,1)) + cdbl(right(soma4,1))
  soma = soma + soma4 
Else
  soma = soma + soma4 
End if

If len(soma5) = 2 then
  soma5 = cdbl(left(soma5,1)) + cdbl(right(soma5,1))
  soma = soma + soma5 
Else
  soma = soma + soma5 
End if

If len(soma6) = 2 then
  soma6 = cdbl(left(soma6,1)) + cdbl(right(soma6,1))
  soma = soma + soma6 
Else
  soma = soma + soma6 
End if

If len(soma7) = 2 then
  soma7 = cdbl(left(soma7,1)) + cdbl(right(soma7,1))
  soma = soma + soma7 
Else
  soma = soma + soma7 
End if

If len(soma8) = 2 then
  soma8 = cdbl(left(soma8,1)) + cdbl(right(soma8,1))
  soma = soma + soma8 
Else
  soma = soma + soma8 
End if

If len(soma9) = 2 then
  soma9 = cdbl(left(soma9,1)) + cdbl(right(soma9,1))
  soma = soma + soma9 
Else
  soma = soma + soma9 
End if

resto = soma mod 10

if (soma / 10) = 0 or resto > 9 or resto = 0 then
   dvcampo3 = 0
else   
   dvcampo3 = 10 - resto
end if



'**************************************
 campo3 = mid(campo3,34,10)
'**************************************

'************
'*  CAMPO4  *
'************

'**************************************
 campo4 = dvbarramonze
'**************************************

'************
'*  CAMPO5  *
'************

'**************************************
campo5 = Replace(var_valordocumento, ",", "")
campo5 = Replace(campo5, ".", "")
'**************************************

campo1 = mid(campo1,1,5)&"."&mid(campo1,6,5)&dvcampo1
campo2 = mid(campo2,1,5)&"."&mid(campo2,6,6)&dvcampo2
campo3 = mid(campo3,1,5)&"."&mid(campo3,6,6)&dvcampo3

campo5 = campo5

if campo5 = 0 then
   campo5 = "000"
end if

barra = Replace(campo1, ".", "")&Replace(campo3, ".", "")&Replace(campo3, ".", "")&campo4&campo5


var_linhadigitavel = campo1&"&nbsp;&nbsp;"&campo2&"&nbsp;&nbsp;"&campo3&"&nbsp;&nbsp;"&campo4&"&nbsp;&nbsp;"&campo5


'*************************************************************************
'                INÍCIO DA FUNÇÃO DE CÓDIGO DE BARRAS
'Substitua o valor do parâmetro abaixo pelo número do código de barras.
'*************************************************************************

WBarCode( barra )


Sub WBarCode( Valor )
Dim f, f1, f2, i
Dim texto
Const fino = 1
Const largo = 3
Const altura = 50
Dim BarCodes(99)

if isempty(BarCodes(0)) then
  BarCodes(0) = "00110"
  BarCodes(1) = "10001"
  BarCodes(2) = "01001"
  BarCodes(3) = "11000"
  BarCodes(4) = "00101"
  BarCodes(5) = "10100"
  BarCodes(6) = "01100"
  BarCodes(7) = "00011"
  BarCodes(8) = "10010"
  BarCodes(9) = "01010"
  for f1 = 9 to 0 step -1
    for f2 = 9 to 0 Step -1
      f = f1 * 10 + f2
      texto = ""
      for i = 1 To 5
        texto = texto & mid(BarCodes(f1), i, 1) + mid(BarCodes(f2), i, 1)
      next
      BarCodes(f) = texto
    next
  next
end if

'*************************************************************************
'Desenho da barra
'Guarda inicial
'*************************************************************************
%>
<head>

<STYLE type=text/css>
.ti { FONT: 9px tahoma, Helvetica, sans-serif }
.ct { FONT: 9px tahoma; COLOR: navy }
.cn { FONT: 9px Arial; COLOR: black }
.cp { FONT: bold 11px tahoma; COLOR: black }
.ld { FONT: bold 11px tahoma; COLOR: #000000 }
.bc { FONT: bold 16px tahoma; COLOR: #000000 }
</STYLE>

</head>

<%
'Tratando o campo da conta
cons_conta = mid(cons_conta,1,3)&"."&mid(cons_conta,4,8)

%>
<CENTER>

<p>
<br>
<TABLE WIDTH="660" CELLSPACING=0 CELLPADDING=0 BORDER=0>
  	<TR>
		<TD class=cp VALIGN=BOTTOM WIDTH=225><IMG SRC="<%=dirlingua%>/imagens/logocaixa.gif" width="129" height="26"></TD>
		<TD ALIGN=RIGHT VALIGN=BOTTOM><FONT class=ld><B>RECIBO DO SACADO</B></FONT></TD>
	</TR>
</TABLE>
<TABLE WIDTH="660" BORDER=1 CELLSPACING=0 CELLPADDING=1>
  <TR>
			<TD COLSPAN=2 width="306"><FONT class=ct>Cedente</FONT><BR><FONT class=cp>&nbsp;<%=cons_cedente%></FONT></TD>
			<TD width=115><FONT class=ct>Ag&ecirc;ncia / C&oacute;digo Cedente</FONT><BR>
					<FONT align=center class=cn>&nbsp;<%=cons_agencia%>&nbsp;/&nbsp;<%=cons_conta%>-<%=cons_dvconta%></FONT></TD>
   			<TD width=94><FONT class=ct>Nosso Número</FONT><BR><FONT class=cn>&nbsp;<%=cons_carteira%>&nbsp;/&nbsp;<%=var_nossonumero%>-<%=dvnossonumero%></FONT></TD>
			<TD width=127 bgcolor="#CCCCCC">
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Vencimento</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cp><%=var_datavencimento%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
   		<TD COLSPAN=2 width="306"><FONT class=ct>Sacado</FONT><BR><FONT class=cp>&nbsp;<%=var_sacado%></FONT></TD>
		<TD width=115><FONT class=ct>Data Processamento</FONT><BR><FONT align=center class=cn>&nbsp;<%=var_data%></FONT></TD>
   		<TD width=94><FONT class=ct>Número Documento</FONT><BR><FONT class=cn>&nbsp;<%=var_numerodoc%></FONT></TD>
			<TD width=127 bgcolor="#CCCCCC">
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Valor do Documento</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cp><%=var_valordocumento%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
   		<TD width="189"><FONT class=ct>CPF / CNPJ</FONT><BR><FONT class=cp>&nbsp;<%=var_cpfcnpj%></FONT></TD>
   		<TD width=113><FONT class=ct>(-) Desconto / Abatimento</FONT><BR><FONT class=cp><br></FONT></TD>
   		<TD width=115><FONT class=ct>(-) Outras Dedu&ccedil;&otilde;es</FONT><BR><FONT class=cn><br></FONT></TD>
   		<TD width=94><FONT class=ct>(+) Mora / Multa</FONT><BR><FONT class=cn><br></FONT></TD>
   		<TD width=127 bgcolor="#CCCCCC"><FONT class=ct>(=) Valor Cobrado</FONT><BR><FONT class=cp><br></FONT></TD>
	</TR>
	<TR>
   		<TD COLSPAN=5 valign=top align=left width="654">
			<FONT class=ct>Observações:</FONT><br>
			<TABLE WIDTH="640" ALIGN=RIGHT CELLSPACING=0 CELLPADDING=0 BORDER=0>
				<TR>
					<TD valign=top align=left>
      						<FONT class=cn>
							<%=var_observacoes%>
 	 					</FONT>
	 				</TD>
				</TR>
			</TABLE>
	 	</TD>
	</TR>
</TABLE>
<TABLE WIDTH="660" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR>
			<TD align=right><FONT class=ct>Autentica&ccedil;&atilde;o Mec&acirc;nica</FONT><BR><BR><BR></TD>
  </TR>
</TABLE>

<img src="<%=dirlingua%>/imagens/corte.gif" border=0 width="660"><br><br>

<TABLE WIDTH="660" BORDER=0 CELLSPACING=0 CELLPADDING=0>
  <tr>
		<td class=cp width=150><div align="left"><img src="<%=dirlingua%>/imagens/logocaixa.gif" width="129" height="26"></div></td>
  		<td width=3 valign="bottom"><img height=22 src="barra.gif" width=2 border=0></td>
	  	<td class=cpt  width=58 valign="bottom"><div align="center"><font class="bc">
          <font size="4"><%=cons_banco%>-<%=cons_dvbanco%></font></font></div></td>
  		<td width=3 valign="bottom"><img height=22 src="barra.gif" width=2 border=0></td>
	  	<td class=ld align=right width=453 valign="bottom"><span class='ld'><p align="right">&nbsp;<font size="2"><%=var_linhadigitavel%></font></span></td>
  </tr>
</TABLE>
<TABLE WIDTH="660" BORDER=1 CELLSPACING=0 CELLPADDING=1>
  <TR>
			<TD COLSPAN=5 WIDTH=500>
					<FONT class=ct>Local de Pagamento</FONT><BR>
					<FONT class=cp>&nbsp;CASAS LOTÉRICAS, AG. CAIXA E REDE 
                    BANCARIA</FONT>
			</TD>
			<TD width=170 bgcolor="#CCCCCC">
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Vencimento</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cp><%=var_datavencimento%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
			<TD COLSPAN=5 WIDTH=500><FONT class=ct>Cedente</FONT><BR><FONT class=cn>&nbsp;<%=cons_cedente%></FONT></TD>
			<TD width=170>
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Ag&ecirc;ncia / C&oacute;digo Cedente</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cn><%=cons_agencia%>&nbsp;/&nbsp;<%=cons_conta%>-<%=cons_dvconta%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
			<TD valign=top><FONT class=ct>Data Documento</FONT><BR><FONT class=cn>&nbsp;<%=var_datadocumento%></FONT></TD>
			<TD valign=top><FONT class=ct>Número Documento</FONT><BR><FONT class=cn>&nbsp;<%=var_numerodoc%></FONT></TD>
			<TD valign=top><FONT class=ct>Tipo Docu.</FONT><BR><FONT class=cn>&nbsp;RC</FONT></TD>
			<TD valign=top><FONT class=ct>Aceite</FONT><BR><FONT class=cn>&nbsp;N</FONT></TD>
			<TD valign=top><FONT class=ct>Data Processamento</FONT><BR><FONT class=cn>&nbsp;<%=var_data%></FONT></TD>
			<TD width=170>
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Nosso Número</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cn><%=cons_carteira%>&nbsp;/&nbsp;<%=var_nossonumero%>-<%=dvnossonumero%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
			<TD valign=top><FONT class=ct>Uso Banco</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
			<TD valign=top><FONT class=ct>Carteira</FONT><BR><FONT class=cn>&nbsp;<%=cons_letracarteira%></FONT></TD>
			<TD valign=top><FONT class=ct>Espécie</FONT><BR><FONT class=cn>&nbsp;<%=cons_especie%></FONT></TD>
			<TD valign=top><FONT class=ct>Quantidade</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
			<TD valign=top><FONT class=ct>Valor</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
			<TD width=170 bgcolor="#CCCCCC">
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Valor do Documento</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cp><%=var_valordocumento%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
			<TH COLSPAN=5 ROWSPAN=4 valign=top align=LEFT ><FONT class=ct>Instru&ccedil;&otilde;es<BR>
 				&nbsp;</FONT><TABLE WIDTH="475" ALIGN=RIGHT CELLSPACING=0 CELLPADDING=0 BORDER=0>
					<TR>
						<TD valign=top align=left>
							<FONT class=cn>
								<%=var_instrucoes%>
							</FONT>
						</TD>
					</TR>
				</TABLE>
			</TH>
			<TD WIDTH=170><FONT class=ct>(-) Desconto / Abatimento</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
	</TR>
	<TR>
			<TD WIDTH=170><FONT class=ct>(-) Outras Deduções</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
	</TR>
	<TR>
			<TD WIDTH=170><FONT class=ct>(+) Mora / Multa</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
	</TR>
	<TR>
			<TD WIDTH=170 bgcolor="#CCCCCC"><FONT class=ct>(=) Valor Cobrado</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
	</TR>
	<TR>
			<TD COLSPAN=6 valign=top>
					<FONT class=ct>Sacado</FONT><BR>
						<TABLE WIDTH="600" ALIGN=right CELLSPACING=0 CELLPADDING=0 BORDER=0 style="border-collapse: collapse" bordercolor="#111111">
							<TR>
								<TD valign=top align=left>
									<FONT class=cn>
										<font size="1" face="Tahoma"><%=var_sacado%><BR>
										<%=var_endereco%><BR>
										<%=var_bairro%><BR>
										<%=var_cep%>&nbsp;-&nbsp;<%=var_cidade%>&nbsp;-&nbsp;<%=var_estado%></font><BR>
										<BR>
									</FONT>
	 							</TD>
							</TR>
						</TABLE>
			</TD>
	</TR>
</TABLE>
<TABLE WIDTH="660" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR>
			<TD class=ct align=right>
  				<div align="right">Autenticação Mecânica - <b class="cp">Ficha de Compensação</b></div>
			</TD>
	</TR>
	<TR>
			<TD align=left>

<img src=p.gif width=<%=fino%> height=<%=altura%> border=0><img 
src=b.gif width=<%=fino%> height=<%=altura%> border=0><img 
src=p.gif width=<%=fino%> height=<%=altura%> border=0><img 
src=b.gif width=<%=fino%> height=<%=altura%> border=0><img 

<%
texto = cstr(valor)
texto = replace(texto, ".", "")
if len(texto) mod 2 <> 0 then
  texto = "0" & texto
end if


' Draw dos dados
do while len(texto) > 0
  i = cstr( left( texto, 2) )
  texto = right( texto, len( texto ) - 2)
  f = BarCodes(cint(i))
  for i = 1 to 10 step 2
    if mid(f, i, 1) = "0" then
      f1 = fino
    else
      f1 = largo
    end if
    %>
    src=p.gif width=<%=f1%> height=<%=altura%> border=0><img 
    <%
    if mid(f, i + 1, 1) = "0" Then
      f2 = fino
    else
      f2 = largo
    end if
    %>
    src=b.gif width=<%=f2%> height=<%=altura%> border=0><img 
    <%
  next
loop

' Draw guarda final
%>
src=p.gif width=<%=largo%> height=<%=altura%> border=0><img 
src=b.gif width=<%=fino%> height=<%=altura%> border=0><img 
src=p.gif width=<%=1%> height=<%=altura%> border=0>

<%
'*************************************************************************
End Sub           'Final do Código de Barras
'*************************************************************************
%>


<SCRIPT language=JavaScript>
var da = (document.all) ? 1 : 0;
var pr = (window.print) ? 1 : 0;
var mac = (navigator.userAgent.indexOf("Mac") != -1);

function x86(){
if (pr) // NS4, IE5
window.print()
else if (da && !mac) // IE4 (Windows)
vbx86()
else // outros browsers
alert("Desculpe seu browser não suporta esta função. Por favor utilize a barra de trabalho para imprimir a página.");
return false;}
if (da && !pr && !mac) with (document) {
writeln('<OBJECT ID="WB" WIDTH="0" HEIGHT="0" CLASSID="clsid:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>');
writeln('<' + 'SCRIPT LANGUAGE="VBScript">');
writeln('Sub window_onunload');
writeln('  On Error Resume Next');
writeln('  Set WB = nothing');
writeln('End Sub');
writeln('Sub vbx86');
writeln('  OLECMDID_PRINT = 6');
writeln('  OLECMDEXECOPT_DONTPROMPTUSER = 2');
writeln('  OLECMDEXECOPT_PROMPTUSER = 1');
writeln('  On Error Resume Next');
writeln('  WB.ExecWB OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER');
writeln('End Sub');
writeln('<' + '/SCRIPT>');}
                    </SCRIPT>



			</TD>
	</TR>
</TABLE>

<BR>
<img src="<%=dirlingua%>/imagens/corte.gif" border=0 width="660">
<BR>

<table width='640' cellspacing=5 cellpadding=0 border=0>
	<tr>
			<form name='forma'>
						<td align="center"><input type=button value=' Imprimir Boleto' onClick='x86()' name='button'></td>
			</form>
	</tr>
</table>

</CENTER>

</HTML>