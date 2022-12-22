<?php
/**************************************************************************/
/* PHP-NUKE: Advanced Content Management System                           */
/* ============================================                           */
/*                                                                        */
/* This is the language module with all the system messages               */
/*                                                                        */
/* If you made a translation, please go to the site and send to me        */
/* the translated file. Please keep the original text order by modules,   */
/* and just one message per line, also double check your translation!     */
/*                                                                        */
/* You need to change the second quoted phrase, not the capital one!      */
/*                                                                        */
/* If you need to use double quotes (") remember to add a backslash (\),  */
/* so your entry will look like: This is \"double quoted\" text.          */
/* And, if you use HTML code, please double check it.                     */
/**************************************************************************/

define("_LAN_01","Programa de Instalação do PHP-Nuke ( Todas as versões )");
define("_LAN_02","Cortesia:");
define("_LAN_03","Introdução");
define("_LAN_04","Conexão");
define("_LAN_05","Tabelas");
define("_LAN_06","Prefixos");
define("_LAN_07","Renomear Prefixo");
define("_LAN_08","Pronto");
define("_LAN_09","Essa será a chave do seu site, é muito importante que você altere-a, não deixando padrão. <br />Pode usar qualquer coisa!!!");
define("_LAN_10","Nível de Segurança, permite utilizar ou não o código de segurança. <br />Recomendo: <b>Nível 7</b>");
define("_LAN_11","Se você tem um site com subscrições, coloque a url aqui para facilitar a indicação do seu site! <br /><br />Versão: <b>7.1+</b>");
define("_LAN_12","Aqui você pode digitar as palavras que deverão ser censuradas em seu site. <br /><br />Para digitar, siga o estilo dos exemplos. <br /><br />Lista separada por vírgulas e as palavras deverão estar entre aspas.");
define("_LAN_13","Aqui você pode informar as tags HTML's que serão permitidas no seu site. <br /><br />Para digitar, siga o estilo dos exemplos. <br /><br />Lista separada por vírgulas. <br /><br />Recomendo deixar padrão, ou seja, do jeito que está.");
define("_LAN_14","Servidor MySQL no qual, o PHP-Nuke irá conectar-se... Verifique no seu provedor de hospedagem, qual o nome do Servidor MySQL. <br />Padrão: <b>localhost</b>");
define("_LAN_15","Nome do usuário que tem permissão para acessar o banco de dados no servidor MySQL. Crie o usuário, antes de continuar! <br />Não é permitido o uso de espaço ou caracteres especiais. Ex.: <b>voce_nuke</b>");
define("_LAN_16","Senha do usuário que tem permissão para acessar o banco de dados no servidor MySQL! <b>Recomendado:</b> Usar caracteres alfanuméricos. <br />Não é permitido o uso de espaço. Ex.: <b>x6r#2p5</b>");
define("_LAN_17","Nome do banco de dados, no qual as tabelas do PHP-Nuke serão criadas. Dependendo do seu provedor, poderá ser necessário a criação do mesmo via Painel de Controle. <br />Não é permitido o uso de espaço ou caracteres especiais. Ex.: <b>voce_nuke</b>");
define("_LAN_18","Nome do arquivo que contém a estrutura e os dados das tabelas usadas pelo PHP-Nuke. O arquivo deverá estar no diretorio 'instalar/sql/' <br /> Ex.: <b>nuke.sql</b>");
define("_LAN_19","Página gerada em:");
define("_LAN_20","segundos");
define("_LAN_21","Por:");
define("_LAN_22","e");
define("_LAN_23","Este Instalador do PHP-Nuke é software livre lançado sob");
define("_LAN_24","licença GNU/GPL");
define("_LAN_25","é");
define("_LAN_26","de");
define("_LAN_27","Introdução");
define("_LAN_28","Bem-vindo ao programa de instalação do PHP-Nuke.<br /><br />
Seguindo todos os passos corretamente, dentro de poucos minutos, seu PHP-Nuke estará pronto para uso.<br />
Antes de prosseguir:<br /><br />
<li>Dê permissão <b><font color=\"#FF0033\">666</font></b> para o arquivo config.php na raíz do seu PHP-Nuke ( Somente servidores Linux );</li>
<li>Copie o arquivo <b>nuke.sql</b> que acompanha o pacote do seu PHP-Nuke para dentro do diretório <b>INSTALL</b>;</li>
<li>Obtenha os seguintes dados:</li><br /><br />
&nbsp;&nbsp;&nbsp;1- Nome ou IP do servidor MySQL ( Normalmente: <b><i>localhost</i></b> );<br />
&nbsp;&nbsp;&nbsp;2- Usuário que terá acesso ao banco de dados;<br />
&nbsp;&nbsp;&nbsp;3- Senha do Usuário;<br />
&nbsp;&nbsp;&nbsp;4- Nome do banco de dados.<br /><br />
<b>Observações:</b> <li>Dependendo do seu servidor, antes de prosseguir, talvez seja necessário criar o usuário e o banco de dados 
através do Painel de Administração de sua conta.</li>
<li>Para atualizações do seu PHP-Nuke, utilize o arquivo upgrade correspondente a sua versão atual e que acompanha o pacote
de instalação.</li>");
define("_LAN_29","Conexão com o Banco de Dados");
define("_LAN_30","Preencha corretamente os seguintes dados:");
define("_LAN_31","Nome do Servidor:");
define("_LAN_32","Nome do Usuário:");
define("_LAN_33","Senha do Usuário:");
define("_LAN_34","Nome do Banco de Dados:");
define("_LAN_35","Nome do arquivo:");
define("_LAN_36","Prefixo para as tabelas");
define("_LAN_37","Prefixo para a tabelas dos usuários");
define("_LAN_38","ATENÇÃO");
define("_LAN_39","Clique apenas uma vez no botão <b>A V A N Ç A R</b> e aguarde até que o processo termine, isso poderá levar alguns minutos, dependendo do tamanho do arquivo a ser processado.");
define("_LAN_40","Criando Tabelas");
define("_LAN_41","Erro na criação das tabelas<br /><br /><font color=\"red\"><b>Mensagem de erro do servidor:</b></font>");
define("_LAN_42","Tabelas criadas com sucesso!!!");
define("_LAN_43","Configurando ( CONFIG.PHP )");
define("_LAN_44","Preencha corretamente os seguintes dados: <br /><br /><b>Obs.: </b>O arquivo config.php deverá estar com permissão <b>666</b> e estar na raíz do seu PHP-Nuke.");
define("_LAN_45","Chave do site: <i>(sitekey)</i>");
define("_LAN_46","ALTERAR_POR_QUESTÃO_DE_SEGURANÇA");
define("_LAN_47","Nível de Segurança: <i>(gfx_chk)</i>");
define("_LAN_48","Servidor DB:");
define("_LAN_49","Nível");
define("_LAN_50","URL subscription (7.1+): <i>(subscription_url)</i>");
define("_LAN_51","Lista de Palavrões:<br /><i>Informe conforme o exemplo</i>");
define("_LAN_52","Tags HTML permitidas:<br /><i>Informe conforme o exemplo</i>");
define("_LAN_53","Clique apenas uma vez no botão <b>A V A N Ç A R</b> e aguarde até que o processo termine.");
define("_LAN_54","\"puta\", \"viado\", \"gay\"");
define("_LAN_55","Falha");
define("_LAN_56","Falha na hora de escrever o arquivo config.php<br /><br />
Possíveis causas:
<li>O arquivo config.php não está com permissão <b>666</b>;</li>
<li>O arquivo config.php não está na raíz do seu php-nuke;</li><br /><br />
Possíveis soluções:
<li>Através de um cliente FTP ( consulte o manual dele para saber como fazer ), dê permissão <b>666</b> para o arquivo config.php na raíz do seu PHP-Nuke;</li>
<li>Envie o arquivo config.php para o servidor;</li><br /><br /><br />
<b><center>Volte e Tente Novamente</center></b>");
define("_LAN_57","Renomear os Prefixos");
define("_LAN_58","Essa é a última etapa da instalação!<br /><br />
Todos os prefixos das tabelas estão sendo alterados para");
define("_LAN_59","<b>Script para renomear os prefixos das tabelas ( Cortesia )</b>");
define("_LAN_60","Traduzido por:");
define("_LAN_61","Implementações por:");
define("_LAN_62","Comunidade PHP-Nuke Brasil - CNB");
define("_LAN_63","Desenvolvido por:");
define("_LAN_64","<center><h3>A alteração dos prefixos das tabelas do Banco de Dados ocorreu com <b>SUCESSO!</b></h3>
</center><br><br><br>
<b>Suas tabelas agora mudaram para:</b><br><br>");
define("_LAN_65","Pronto");
define("_LAN_66","O seu PHP-Nuke está instalado e pronto para ser utilizado.<br /><br />
Para sua segurança, crie imediatamente o administrador ( Superusuário ), acessando a administração do site clicando no botão \"AVANÇAR\" logo abaixo.<br /><br />
Não esqueça de voltar a permissão do arquivo config.php para <b>644</b><br /><br /><hr />
<center><b>Obrigado por utilizar o Instalador PHP-Nuke.</b><br /><br />Não deixe de visitar o nosso site: <a href=\"http://www.xnuke.com.br\" target=\"_blank\">XPK_FENIX</a> e <a href=\"http://www.phpnuke.org.br\" target=\"_blank\">aleagi</a>!</center>");
define("_LAN_68","Servidor não selecionado.");
define("_LAN_69","Banco de dados não selecionado.");
define("_LAN_70","Arquivo SQL não existente: ");
define("_LAN_71","Selecione seu Idioma");
define("_LAN_72","Idioma");
define("_LAN_73","Informe o prefixo a ser utilizado pelas tabelas do PHP-Nuke. ( <b>Não use o padrão \"nuke\"</b> e nem caracteres especiais. )");
define("_LAN_74","Instalação PHP-Nuke v1.3 por XPK_FENIX & Aleagi");
define("_LAN_75","ERRO");
define("_LAN_76","Verifique o Usuário, Nome do Banco de Dados e a Senha ( Digitadas e fornecidas pelo seu servidor ).");
define("_LAN_77","A V A N Ç A R");
define("_LAN_78","V O L T A R");
define("_LAN_79","altere");

define("_LAN_80","Localização");
define("_LAN_81","Ajuda Online");
?>