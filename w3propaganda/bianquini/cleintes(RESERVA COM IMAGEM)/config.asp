<%

'CONFIGURAÇÕES GERAIS DA SUA LOJA
'Altere todos os dados que desejar 
'====================================================


'###################################################################################
'## SELECIONE SEU BANCO DE DADOS E SEU TIPO DE CONEXÃO (Access, SQLServer ou MySQL)
'###################################################################################

'## Para selecionar a opção basta retirar o comentário que é representado por " ' " nas partes "'StringdeConexao" e "VersaoDb" e preencher com os dados corretos

'*********************************
'## Use 1 para MySql; 2 para Access e 3 para SQL Server
VersaoDb = 3

'## Se você usa Access escolha a versão e preencha abaixo 
'------> MySQL usando o MyODBC
'StringdeConexao = "driver=MySQL;server=localhost;uid=judas;pwd=123456;database=vitrola"
'*********************************

'## Se você usa Access escolha a versão e preencha abaixo 
'------> MS Access 2000 usando uma pasta virtual
'StringdeConexao = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("relisable\vitrola.mdb") 

'------> MS Access 2000 no Brinkster
'StringdeConexao = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("/nome_de_usuario/db/virtuastore.mdb") 

'------> MS Access 2000
'StringdeConexao = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\virtuastore\database\virtuastore.mdb" 

'------> MS Access 97 usando uma pasta virtual
'StringdeConexao = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("database/virtuastore97.mdb") 

'------> MS Access 97 no Brinkster
'StringdeConexao = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("/nome_de_usuario/db/virtuastore97.mdb") 

'------> MS Access 97
'StringdeConexao = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=c:\inetpub\wwwroot\virtuastore\database\virtuastore97.mdb" 
'*********************************


'*********************************
'## Se você usa SQLServer escolha a versão e preencha abaixo 
'------> MS SQL Server 6.x/7.x/2000 (Conexão OLEDB)
'StringdeConexao = "Provider=SQLOLEDB;Data Source=localhost;database=vitrola;uid=mandry;pwd=123456;"

'------> MS SQL Server 6.x/7.x/2000 (Conexão ODBC) 
'StringdeConexao = "Provider=MSDASQL.1;Persist Security Info=False;Data Source=VirtuaStore;Initial Catalog=virtuastore" 
'*************************************
StringdeConexao = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=bianq;pwd=bi7002;Initial Catalog=bianquini;Data Source=mssql.moveisbianquini.com.br"
'*********************************
'## Se você usa DSN preencha abaixo:
'StringdeConexao = "NOME_DA_DSN_NAME"
'*************************************

'###################################################################################


'###################################################################################
'## ESCREVA A MOEDA QUE VAI SER UTILIZADA EM SUA LOJA
'###################################################################################

strLgMoeda = "R$"  ' REAL - R$ - Brasil
strLgMoedax = "Reais"  ' Nome da moeda no plural
'###################################################################################


'###################################################################################
'## INFORME O DIRETORIO DOS ARQUIVOS DE LINGUAGEM DA LOJA
'###################################################################################

'diretorio padrão a partir do wwwroot onde se encontra sua loja
dirlingua = "linguagens/portuguesbr"
%><!--#include file="linguagens/portuguesbr/linguagem.asp"--><%
'###################################################################################


'###################################################################################
'## CONFIGURAÇÃO DE FRETE
'###################################################################################

'ATENÇÃO: Leia o arquivo Leia-me.txt para saber como configurar 
'o frete da loja no banco de dados e depois siga as instruções abaixo:

'----> Escreva o numero da coluna em que o estado está seguindo a ordem da sua tabela de fretes (tabela padrão dos correios)
'----> de acordo com os seguintes critérios:
'----> **: A coluna do seu estado é igual a 0 e as outras são 1,2 e assim respectivamente

'## o padrão aqui está configurado para a tabela do Rio Grande do Sul

estado_ac = 7
estado_al = 7
estado_ap = 9
estado_am = 9
estado_ba = 6
estado_ce = 9
estado_df = 4
estado_es = 4
estado_go = 5
estado_ma = 9
estado_mt = 5
estado_ms = 3
estado_mg = 4
estado_pa = 9
estado_pb = 8
estado_pr = 1
estado_pe = 8
estado_pi = 8
estado_rj = 3
estado_rn = 9
estado_rs = 0
estado_ro = 7
estado_rr = 9
estado_sc = 1
estado_sp = 2
estado_se = 7
estado_to = 0
'###################################################################################



'###################################################################################
'## CONFIGURAÇÕES GERAIS
'###################################################################################

'## Escreva o nome do administrador da loja para suporte via Administrador
Seu_nome = "Mandry Web Master"

'## Senha principal da loja
senhamaster = "w37001"
	
'## Dados da loja	
Nome_da_sua_loja = "Móveis Bianquini"
CNPJ_da_sua_empresa = "91.973.313/0001-81"
Razao_Social = "Móveis Bianquini LTDA"
Email_da_sua_loja = "mandry@casadaweb.net"
Slogan_da_sua_loja = ""
Endereco_do_site = "www.moveisbianquini.com.br"          'ATENÇÃO: Escreva o endereço virtual da sua loja sem o Http://
Endereco_da_sua_loja = "Rua Humberto Possamai, 35"
Bairro_da_sua_loja = "Distrito Industrial"
Cidade_da_sua_loja = "Rodeio Bonito"
Estado_da_sua_loja = "RS"
Pais_da_sua_loja = "Brasil"
Telefone_da_sua_loja = "(0xx55) 3798-1136"
	
'## Dados bancarios
Seu_banco = "Banco do Brasil"
Sua_agencia = "111111"
Sua_conta_corrente = "0000000-9"
Nome_do_cedente = "Otávio Dias"


'########## DADOS PARA CONFIGURAÇÃO DO BOLETO BANCÁRIO ##########

caminho_boleto = "boleto_caixa.asp" ' use este caminho para utilizar o boleto da Caixa Econômica Federal
'caminho_boleto = "boleto_itau.asp" ' use este caminho para utilizar o boleto do banco Itaú
'caminho_boleto = "boleto_bradesco.asp" ' use este caminho para utilizar o boleto do Bradesco

bol_banco = "104" 'código do banco
bol_dvbanco = "0" 'Digito verificador do banco
bol_agencia = "1584" 'agencia
bol_conta = "00100002993" 'conta
bol_dvconta = "6" 'digito verificador da conta
bol_carteira = "80" 'código da carteira
bol_letracarteira = "SR" 'sigla da carteira
bol_moeda = "9" 'tamanho da moeda
bol_especie = "R$" 'cifra da moeda
bol_codigocedente = "15847000000172" 'código do cedente
bol_cedente = "Móveis Bianquini" 'nome do cedente
bol_dadoscedente = "Móveis Bianquini<br>Rua Humberto Possamai, 35 CEP: 98360-000 <br>Fone: 55 3798-1136 <br>E-Mail: mandry@casadaweb.net <br>Site: www.moveisbianquini.com.br <br>" 'dados do cedente

'##################################################################


'## Confirurações de e-mail
Host_da_loja = "mail.moveisbianquini.com.br" ' --> Se o componente usado for CDONTS deixe esse campo assim: "-"

'## Escolha o componente e desmarque o comentário
'Componente_usado = "AspEmail"
'Componente_usado = "AspMail"
'Componente_usado = "AspQmail"
Componente_usado = "CDONTS"


'## Config da Administração(administrador.asp)
Seu_Usuario_no_Administrador = "bianquini"
Sua_Senha_no_Administrador = "bianquini"
	
'## Fonte da loja
Fontes_da_loja = "tahoma,verdana,arial,helvetica"
	
'## Valor da mão proria para entrega do SEDEX
Preco_da_mao_propria = 0     ' ex. 2.20
	
'## Dias para entrega dos pedidos
Dias_para_entrega = 0    'Dez dias
	
	
'CORES DA SUA LOJA
'Altere todos os dados que desejar 
'====================================================
'Cor do fundo na resolução 1024x768
Cor_de_fundo = "#ffffff"

'Cor das linhas
Cor_das_linhas = "#cccccc"

'Cor da barra de menu e copyright
Cor_do_menu = "#005DA2"

'Cor principal da loja
Cor_principal = "#D5EDFF"

'Cor principal dos links
Cor_dos_links ="#000000"

'Cor secundaria dos links
Cor_dos_links_secundarios ="#005DA2"

'Cor do texto dos menus
Texto_dos_menus = "#ffffff"

'Cor do texto da loja
Texto_da_loja = "#000000"

'Cor da borda do carrinho de compras
Cor_da_borda_carrinho_de_compras = "#005DA2"
'====================================================


'####################################################################
'# NAO ALTERE ESSA PARTE, VOCÊ PODERÁ ESTRAGAR SUA LOJA
'####################################################################

    'Inicia as variaveis da Aplicação 
	application("senhamaster") = senhamaster
 	application("razaoloja") = Razao_Social
    application("nomeloja") = Nome_da_sua_loja
    application("emailloja") = Email_da_sua_loja
   	application("slogan") = Slogan_da_sua_loja
   	application("urlloja") = Endereco_do_site
   	application("endereco11") = Endereco_da_sua_loja
   	application("bairro11") = Bairro_da_sua_loja
   	application("cidade11") = Cidade_da_sua_loja
   	application("estado11") = Estado_da_sua_loja
   	application("pais11") = Pais_da_sua_loja
   	application("fone11") = Telefone_da_sua_loja
   	application("bancopag") = Seu_banco
   	application("contapag") = Sua_conta_corrente
   	application("pagpara") = Nome_do_cedente
	application("agpag") = Sua_agencia
	application("fonte") = Fontes_da_loja
	application("maopropria") = Preco_da_mao_propria
	application("diasentrega") = Dias_para_entrega
	application("corfundo") = Cor_de_fundo
	application("cor1") = Cor_das_linhas
	application("cor2") = Cor_do_menu
	application("cor3") = Cor_principal
	application("cor4") = Cor_dos_links
	application("cor5") = Cor_dos_links_secundarios
	application("fontebranca") = Texto_dos_menus
	application("fontepreta") = Texto_da_loja
	application("corborda") = Cor_da_borda_carrinho_de_compras
    application("nomecontato") = Seu_nome
	admin = Seu_Usuario_no_Administrador
    nsenha = Sua_Senha_no_Administrador	
	application("HostLoja") = Host_da_loja
    application("ComponenteLoja") = Componente_usado	
	

'>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<

    Server.ScriptTimeOut = 999
	application("vsversao") = "1.2.1"
	application("ultimaatualizacao")  = "Domingo, 12 de Março de 2003 às 15:05:11"
	set abredb = Server.CreateObject("ADODB.Connection")
	abredb.Open(StringdeConexao)

'>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<
	
'Executa a função GLOBAL

set rsglobal = abredb.execute("SELECT * FROM compras Order by idcompra desc")
if rsglobal.eof then
Session("orderID") = ""
end if
rsglobal.close
set rsglobal = nothing

if Session("orderID") = "" then
set rs = abredb.execute("SELECT * FROM compras Order by idcompra desc")
if rs.eof then
Session("orderID") = 1
abredb.Execute("INSERT INTO compras (idcompra, datacompra, status) values ('" &session("orderID") & "', '" & date & "', 'Compra em Aberto')")
else
Session("orderID") = rs("idcompra") + 1
abredb.Execute("INSERT INTO compras (idcompra, datacompra, status) values (" &session("orderID") & ", '" & date & "','Compra em Aberto')")
end if
session.timeout = 999
else
end if

'####################################################################
%>

