<%
option explicit'must be declared

'setting buffering to true
response.buffer=true
'decleration
dim useraction
dim conn
dim rs
dim sql
dim dsn
dim DownNumber
dim sql3
dim sql2
dim uemail
dim subs
'----------------------

'get action from user
useraction=request("action")
select case useraction
case "save"
	Uemail=lcase(request.form("email"))
	subs=request.form("subs")
	dsn="DBQ=" & Server.Mappath("db/subs.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
	set conn=server.createobject("adodb.connection")
	set rs=server.createobject("adodb.recordset")
	sql = "select * from emails where emails='"&Uemail&"'"
	conn.open dsn
	rs.open sql,conn
	select case subs
	'in case someOne wants to join the list
	case "1"
		if rs.bof and rs.eof then
			sql2="insert into emails(emails) values('"&Uemail&"')"
			conn.execute(sql2)
			response.write "<script>alert('Você foi cadastrado com sucesso! Muito Obrigado pela visita!')</script>"
		else
			response.write "<script>alert('Você foi cadastrado')</script>"
		end if

	
	'in case someOne wants to unsubscribe
		case "0"
	if rs.bof and rs.eof then
			response.write "<script>alert('Você está registrado')</script>"
	else
			sql2="delete from emails where emails='"&Uemail&"'"
			conn.execute(sql2)
			response.write "<script>alert('Seu E-mail foi excluído')</script>"
	end if

		
		
	end select
rs.close
set rs=nothing

end select
%>
<HTML>
<HEAD>
<script>
function openwin()
{
	NewWindow =window.open("hebrew.htm","hebrew","width=500,height=200")
}
function submitit(){
var email=document.subform.email.value;
if (email==""){
alert("Digite seu E-mail")
document.subform.email.focus()
return false
	}
if (email.indexOf('@', 0) == -1 || email.indexOf('.', 0) == -1){ alert("E-mail inválido!");
		document.subform.email.focus()
		return false
		}
}

</script>
<style>
BODY
{
    BACKGROUND-COLOR: black;font-size:14px;font-family:Arial,Verdana;
}
a
{
color:blue;text-decoration:none;
}

a:hover
{
color:red;text-decoration:underline;
}

td
{
font-size:12px;font-family:Arial,Verdana;
}


.inputSubmit
{
font-size:7pt;
color:white;
background-color: black;
BORDER-BOTTOM: 1px solid;
BORDER-LEFT: 1px solid;
BORDER-RIGHT: 1px solid;
BORDER-TOP: 1px solid;
z-index:10;
}



</style>
<TITLE>Intranet / Extranet - Casa da Web</TITLE>
<LINK href="default.css" type=text/css rel=STYLESHEET>
</HEAD>
<BODY BGCOLOR=#FFFFFF>
<p align="center"> <font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
  <embed src="down.swf" width="350" height="40"></embed> </font></p>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
  Como a Intranet Pode Ajudar a Empresa?</font></p>
<hr>
<p align="justify"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
  A Intranet simplifica a intera&ccedil;&atilde;o do usu&aacute;rio, tornando 
  f&aacute;cil o acesso a aplica&ccedil;&otilde;es e a informa&ccedil;&otilde;es 
  est&aacute;ticas e din&acirc;micas, n&atilde;o importando onde esteja ou qual 
  a plataforma utilizada.<br>
  <br>
  Viabiliza uma publica&ccedil;&atilde;o em tempo real, com informa&ccedil;&atilde;o 
  muito mais atual, favorecendo o desempenho dos funcion&aacute;rios da empresa.<br>
  <br>
  Auxilia no processo de descentraliza&ccedil;&atilde;o das informa&ccedil;&otilde;es, 
  da distribui&ccedil;&atilde;o de dados e do desenvolvimento de aplica&ccedil;&otilde;es, 
  al&eacute;m de permitir maior participa&ccedil;&atilde;o do usu&aacute;rio final 
  na cria&ccedil;&atilde;o de aplica&ccedil;&otilde;es.<br>
  <br>
  Hoje em dia, neste mundo competitivo de neg&oacute;cios, um m&iacute;nimo de 
  diferencia&ccedil;&atilde;o em produtos e/ou servi&ccedil;os, redu&ccedil;&atilde;o 
  de custos e facilidades de relacionamento nos neg&oacute;cios s&atilde;o pontos 
  chaves.<br>
  <br>
  Portanto &eacute; fundamental &agrave; empresa atingir empregados, consumidores, 
  fornecedores e parceiros de neg&oacute;cios eletronicamente, porque:<br>
  <br>
  &middot; Diminui custos de negocia&ccedil;&atilde;o interna e externa; <br>
  &middot; Permite a seus empregados trabalharem com mais efici&ecirc;ncia entre 
  si e com os clientes, fornecedores e parceiros de neg&oacute;cios.<br>
  <br>
  3. Porque a Intranet &eacute; superior &agrave;s abordagens tradicionais?<br>
  <br>
  Os m&eacute;todos tradicionais, baseados em pap&eacute;is e pessoas, utilizam 
  documentos escritos, envelopes internos (vai-e-vem), faxes, telefonemas via 
  ramais internos, etc., s&atilde;o caros, lentos e est&atilde;o sujeitos a muitos 
  transtornos.<br>
  <br>
  Abordagens mais recentes incluem a utiliza&ccedil;&atilde;o de correio eletr&ocirc;nico 
  e produtos de comunica&ccedil;&atilde;o entre grupos de trabalho (groupware), 
  como o Lotus Notes por exemplo, que tamb&eacute;m tem suas desvantagens:<br>
  <br>
  &middot; Tem implanta&ccedil;&atilde;o dispendiosa - tipicamente o dobro do 
  custo de uma Intranet; <br>
  &middot; A implanta&ccedil;&atilde;o tamb&eacute;m lenta; <br>
  &middot; Tem alto custo de manuten&ccedil;&atilde;o; <br>
  &middot; &Eacute; um grande consumidor dos recursos de tr&aacute;fego da rede 
  (bandwidth); <br>
  &middot; E al&eacute;m disso a tecnologia &eacute; propriet&aacute;ria colocando 
  a IBM como &uacute;nico fornecedor.<br>
  <br>
  Intranets s&atilde;o muito mais f&aacute;ceis de instalar, configurar, expandir 
  e requerem muito menos treinamento, viabilizando as informa&ccedil;&otilde;es 
  em qualquer lugar - o que era praticamente imposs&iacute;vel em arquiteturas 
  cliente/servidor e mainframe.<br>
  <br>
  Intranets tem implanta&ccedil;&atilde;o r&aacute;pida, s&atilde;o baseadas em 
  padr&otilde;es de sistemas abertos, tem um amplo leque de ofertas de produtos, 
  fornecedores e especialistas, para suporte t&eacute;cnico.<br>
  <br>
  Intranets se integram eletronicamente aos dados corporativos armazenados em 
  seus banco de dados tais como: dados financeiros, material de marketing e vendas, 
  incluindo listas de pre&ccedil;os e prospectos, relat&oacute;rios de vendas, 
  relat&oacute;rios regionais, dados de recursos humanos, incluindo pol&iacute;ticas 
  da companhia, etc.<br>
  <br>
  4. Aplica&ccedil;&otilde;es<br>
  <br>
  Imagine o caso em que uma empresa que trabalha montado computadores, com componentes 
  de diversos fabricantes e possui revendas por todo o pa&iacute;s. Esta empresa 
  deseja disponibilizar um servi&ccedil;o de venda de microcomputadores pela internet. 
  <br>
  <br>
  O primeiro passo est&aacute; no &acirc;mbito da internet, onde cliente em potencial 
  vai interagir com a empresa . De seu computador ele estar&aacute; pesquisando, 
  escolhendo e adquirindo o produto. Caber&aacute; ent&atilde;o a empresa:<br>
  <br>
  &middot; Apresentar o computador, o design das p&aacute;ginas &eacute; t&atilde;o 
  importante quanto numa revista;<br>
  &middot; Apresentar as op&ccedil;&otilde;es de composi&ccedil;&atilde;o do computador 
  (modelos, opcionais, etc...);<br>
  &middot; Permitir a configura&ccedil;&atilde;o do computador (possibilitar que 
  o cliente crie uma vers&atilde;o que o satisfa&ccedil;a e atenda &agrave;s restri&ccedil;&otilde;es 
  impostas ao gerente de log&iacute;stica);<br>
  &middot; Fornecer ao cliente o prazo de entrega para aquela configura&ccedil;&atilde;o. 
  Aceitar a encomenda (ou reserva) e encaminh&aacute;-lo ao revendedor mais pr&oacute;ximo 
  para efetiva&ccedil;&atilde;o da compra ou efetivar a compra via cart&atilde;o 
  de cr&eacute;dito, pela internet e enviar o computador pelo correio ou transportadora.<br>
  Para que este processo tenha continuidade a intera&ccedil;&atilde;o entre a 
  empresa e sua rede de revendas poder&aacute; (dever&aacute;) acontecer tamb&eacute;m 
  via Internet, mas, neste caso, teremos um grupo de coligadas que, al&eacute;m 
  de trocar informa&ccedil;&otilde;es, ter&atilde;o suas opera&ccedil;&otilde;es 
  e sistemas computacionais integrados via Internet. Estamos ent&atilde;o falando 
  da Intranet. Ou seja: grupos de uma mesma corpora&ccedil;&atilde;o (real ou 
  virtual) que trocam informa&ccedil;&otilde;es e interagem operacionalmente via 
  Internet.<br>
  Enquanto a Internet estabelece os padr&otilde;es e as tecnologias para comunica&ccedil;&atilde;o 
  entre computadores, atrav&eacute;s de uma rede mundial que conecta muitas redes, 
  a Intranet aplica estas tecnologias dentro da organiza&ccedil;&atilde;o via 
  a rede LAN/WAN corporativa, com todos os mesmos benef&iacute;cios. Exatamente 
  pela Internet ser um padr&atilde;o bem estabelecido, montar a infra-estrutura 
  &eacute; simples. O Cl&aacute;ssico problema de como fazer um se conectar com 
  muitos &eacute; resolvida pelo uso de tecnologia Internet via WAN/LAN. O controle 
  de acesso e seguran&ccedil;a, problema complicado nos modelos informacionais 
  atuais tamb&eacute;m encontra solu&ccedil;&atilde;o nos moldes da Internet.<br>
  Voltando ao exemplo, a empresa precisa suportar o seu canal de vendas, ela oferecer&aacute; 
  &agrave; equipe de vendas, obviamente, todas as mesmas ferramentas de software 
  que o cliente j&aacute; acessou diretamente, e ainda mais: <br>
  &middot; Atualiza&ccedil;&atilde;o de informa&ccedil;&otilde;es sobre os produtos;<br>
  &middot; Divulga&ccedil;&atilde;o de estrat&eacute;gias;<br>
  &middot; Integra&ccedil;&atilde;o dos sistemas corporativos com os coligados 
  (vendas, estoques, produ&ccedil;&atilde;o, etc...);<br>
  &middot; Opera&ccedil;&atilde;o integrada do canal de vendas, etc...<br>
  A tecnologia da Internet passa a se incorporar na nova log&iacute;stica empresarial 
  de fora para dentro, ou seja, para suportar toda esta nova din&acirc;mica externa 
  a log&iacute;stica interna (suprimento-fabrica&ccedil;&atilde;o-entrega) precisa 
  acompanhar, a quest&atilde;o b&aacute;sica &eacute;: a empresa quer responder 
  pronta e corretamente &agrave;s demandas apresentadas pelo seu canal de vendas 
  e seus parceiros. N&atilde;o dar respostas, seja por telefone ou Internet &eacute; 
  igualmente inadmiss&iacute;vel. Portanto, j&aacute; &eacute; hora de come&ccedil;ar 
  a operar via Internet, aos poucos, sempre conscientes de que a ess&ecirc;ncia 
  do sucesso operacional neste novo cen&aacute;rio passa, aos poucos, por uma 
  integra&ccedil;&atilde;o de todos os sistemas computacionais desde o n&iacute;vel 
  de simples coleta de dados at&eacute; a apresenta&ccedil;&atilde;o multim&iacute;dia 
  via Internet. O caminho, n&atilde;o t&atilde;o longo, passa por:<br>
  &middot; Criar uma ponte entre os sistemas corporativos de log&iacute;stica 
  e os acessos via Internet; <br>
  &middot; Simplificar as opera&ccedil;&otilde;es, pois virtualmente estamos todos 
  trabalhando na mesma sala;<br>
  &middot; Criar bases de dados abertas que possam ser consultadas facilmente.<br>
  &middot; Montar uma estrutura de divulga&ccedil;&atilde;o e pesquisa r&aacute;pidas 
  de informa&ccedil;&atilde;o entre os diversos grupos de trabalho da empresa 
  via Intranet. Ou seja, Compras / Engenharia, Produ&ccedil;&atilde;o / Engenharia, 
  Compras / Qualidade / Fornecedores, Vendas/Produ&ccedil;&atilde;o, enfim ... 
  todos com todos.<br>
  </font></p>
<hr>
<p align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Copyright 
  Casa da Web</font></p>
<p align="center"></p>
</BODY>
</HTML>