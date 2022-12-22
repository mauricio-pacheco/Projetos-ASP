<?php

######################################################################
# Modulo Splatt Forum per PHP-NUKE
#-------------------------
# Versione: 3.2
#
#  by:
#
# Giorgio Ciranni (~Splatt~) (http://www.splatt.it) (webmaster@splatt.it)
#
#
# Supporto tecnico disponibile sul Forum di www.splatt.it
######################################################################
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License.
######################################################################
#Translated to Brazilian by: Luiz Gustavo Aleagi Nunes - tatau
#For any comments/suggestions: aleagi@terra.com.br
######################################################################

/*****************************************************/
/* Messaggi Modulo Forum
/*****************************************************/

define("_FORUM","Fórum");
define("_FORUMACC","Usuários");
define("_FORUMCONF","Configuração");
define("_FORUMRANK","Ranks");
define("_UNABLETOQUERY","Problemas ao se conectar ao Servidor de Banco de Dados");
define("_TODAYIS","Hoje é ");
define("_LASTVISIT","Sua última visita ao Fórum foi ");
define("_TYPES","Preferências");
define("_FTOPICS","Discussão");
define("_FPOSTS","Mensagens");
define("_FLPOSTS","Última Mensagem");
define("_PMSG","Mensagens Privadas");
define("_PINBOX","Caixa de Entrada");
define("_LOGINTOR","Você deve se logar para poder ler suas Mensagens Privadas!");
define("_VNMS","novas Mensagens");
define("_VNM","neva Mensagem");
define("_TVM","Total de Mensagens");
define("_NPM","Você não recebeu nenhuma nova Mensagem!");
define("_NPO","HÁ mensagens novas desde a sua última visita!");
define("_NNPO","NãO HÁ mensagens novas desde a sua última visita!");
define("_FFA","Disponível para todos");
define("_FREG","Usuários Registrados");
define("_FMODS","Moderador");
define("_PASSW","Protegido por Senha");
define("_FCOULDNOT","Foram encontrados problemas ao tentar acessar o Banco de Dados");
define("_FNOTEXIST","Este Fórum não existe! Por favor, selecione outro");
define("_MODERATED","Moderado por: ");
define("_FINDEX","Índice");
define("_FPRIVATE","Este é um Fórum PRIVADO, você precisa de uma Senha para entrar!");
define("_FREPLIES","Respostas");
define("_FPOSTER","Enviado por");
define("_FVIEWS","Visualizações");
define("_FODATE","Data");
define("_FNOTOPICS","Não há Tópicos para este Fórum.");
define("_FPOSTONE","Se você quiser, você pode iniciar uma nova discussão.");
define("_FNEXTP","Próxima página");
define("_JUMPTO","Ir para");
define("_FSELECTF","Selecione o Fórum");
define("_TLOCKED","Discussão TRAVADA - Não é permitida nenhuma Mensagem nova!");
define("_MORETHEN","Mais que");
define("_WRONGPASS","Senha não reconhecida!");
define("_FNOMORE","Não há mais Foros.");
define("_FFMOD","Moderador");
define("_FCOULDNOTINSERT","<b>ERRO</b>! Não pude inserir a Mensagem no Banco de Dados! Desculpe-nos pelo inconveniente!");
define("_FPOSTCOUNT","O contador de Mensagens não foi alterado.");
define("_FPOSTED","Nova Mensagem postada!");
define("_FVIEW","Por favor aguarde alguns segundos ou clique aqui.");
define("_YOUMUST","Você DEVE inserir uma Mensagem ou Resposta.");
define("_POSTIN","Responder para: ");
define("_FCANWRITE","Você pode postar novas Mensagens ou Respostas neste Fórum!");
define("_YOUNOT","Você não tem permissão de escrever aqui!!!");
define("_FBACK","Voltar");
define("_FNICKNAME","Nome de Usuário");
define("_FPASSWORD","Senha");
define("_FSUBJECT","Assunto");
define("_FMESSAGE","Mensagem");
define("_FMICON","Ícone da Mensagem");
define("_FON","Ligado");
define("_FOFF","Desligado");
define("_FOPTIONS","Opções");
define("_DISHTML","A utilização de HTML não é permitida nesta Mensagem.");
define("_FDIS","Não é permitido.");
define("_FTHISMAIL","nesta Mensagem");
define("_FSHOWSIG","Empresa");
define("_WHATISSIG","Esta opção pode ser adicionada/alterada na Página de Usuário.");
define("_FNOTIFY","Notifique-me por e-mail quando houver uma nova postagem. (Apenas para Usuários Registrados)");
define("_FPAGED","Páginas");
define("_FAQOUTE","Quotar");
define("_FAUTHOR","Autor");
define("_FGOTO","Ir para a página: ");
define("_FADMINT","Administração");
define("_LOCKTHIS","TRAVAR discussão");
define("_UNLOCKTHIS","DESTRAVAR discussão");
define("_FMOVET","Mover discussão");
define("_FDELT","Cancelar discussão");
define("_FJOINED","Registradp em:");
define("_FAPOSTS","Mensagens:");
define("_FFROM","De");
define("_NOTREG","Usuário não Registrado");
define("_FTPOSTED","Postedo");
define("_FAPROFIL","Perfil");
define("_FAEMAIL","e-mail");
define("_FAADD","Postar");
define("_FAEDIT","Editar");
define("_TREVIEW","Rever sua Resposta");
define("_ENM","Ler");
define("_FPAGES","páginas");
define("_BENV","Bem-vindo(a) so Foros do $sitename");
define("_HEAD1","Aqui você pode trocar idéias e expor pensamentos.");
define("_HEAD2","Para ser ajudado e ajudar a quem precisa.");
define("_HEAD3","Sinta-se a vontade para postar suas Mensagens!");
define("_ERRORE1","Oooooops... Houston, we have a problem...");
define("_FNOTA","Mesmo se o Fórum estiver disponível para Usuários Anônimos, por favor <a href=\"modules.php?name=Your_Account\">Registre-se!</a>");
define("_ERRQUERY","durante a solicitação ao Banco de Dadoa!");
define("_FERRORE","<b>ERRO</a>!");
define("_FNONTUO","Você não tem permissão para alterar esta mensagem!");
define("_NOPERMESS","Você não tem permissão para alterar esta mensagem!");
define("_MODBY","Esta mensagem foi editada por");
define("_FIL","em");
define("_CHECKCONF","Não pude me conectar ao Banco de Dados. Por favor verifique as configurações!");
define("_PUPD","Sua Mensagem foi editada com êxito!");
define("_CLIKVUPD","Clique aqui para ver a modificação de sua Mensagem.");
define("_CLIKRET","Clique aqui para retornar ao Índice dos Foros.");
define("_POSTCANC","Postagem CANCELADA.");
define("_CLIKRETL","Clique aqui para retornar à Lista de Mensagens.");
define("_MODPOST","Editar Mensagem");
define("_FNICK","Nome de Usuário");
define("_FERRPASS","Ou você digitou uma Senha incorreta ou não possui a Senha correta para editar esta Mensagem. Por favor, volte e redigite a Senha.");
define("_MESSICON","Ícone da Mensagem");
define("_FMESS","Mensagem!");
define("_FOPT","Opções");
define("_FDELP","Cancelar esta Mensagem");
define("_FATTACT","Ativos atualmente");
define("_DISCTOT","Total de discussões");
define("_FMESS","Mensagem!");
define("_FLEGEN","Legenda");
define("_CLICONSMI","Clique para adicionar <a href=\"bb_smilies.php\">Smilies</a> (carinhas) em sua Mensagem:<br>");
define("_CLIONBOT","Clique para adicionar <a href=\"bbcode_ref.php\">CódigoBB</a> em sua Mensagem:<br><br>");
define("_FRICAV","Busca avançada");
define("_FRESET","Resetar");
define("_FCANC","Cancelar");
define("_FPMESS","Mensagem Privada");
define("_FFROM","De");
define("_FNOPMSG","Você não recebeu nehuma Mensagem nova.");
define("_FPROF","Perfil");
define("_FPREVMSG","Mensagem anterior");
define("_FNEXMSG","Próxima Mensagem");
define("_FLOKTOP","O Moderador TRAVOU esta discussão! Você não pode respondê-la!.");
define("_NOTIFSUB","alguém postou uma Resposta para sua Mensagem.");
define("_CIAO","Olá");
define("_NOTIFM1","Você está recebendo este e-mail pois alguém postou uma Resposta para sua Mensagem postada no Fórum do $sitename, e você solicitou");
define("_NOTIFM2"," ser informado quando isso acontecesse. \r\n\r\nYou Você pode ver a discussão clicando aqui: ");
define("_NOTIFM3","Ou ir até nosso Site clicando aqui: ");
define("_GRAZ","Obrigado");
define("_APRSTAF","Equipe do $sitename");
define("_FKEY","Palavra-chave ou frase a tentar");
define("_FSEANY","Palavra (Padrão)");
define("_FSEAL","Frase");
define("_SALF","Em TODOs os Foros");
define("_AUTN","Nome do Autor");
define("_SORTBY","Ordenar por");
define("_FPTIM","Data de Postagem");
define("_FSEA","Eu tentei!");
define("_FNOREC","Nenhum registro correspondente foi encontrado! Por favor retorne e tente novamente.");
define("_FFTOPIC","Discussão");
define("_FPRAC","Fórum de Acesso Restrito!");
define("_FLIVAC","Nível de Acesso alterado");
define("_FADNAC","Adicionado novo Nível de Acesso");
define("_FADNUSAC","Adicionar novo Usuário a este Nível de Acesso");
define("_FUT","Usuário");
define("_FUSID","ID do Usuário");
define("_FCUSACL","Ativar Níveis de Usuários");
define("_FWARDEL","<b>AVISO</b>: Você está prestes a apagar este Nível de Acesso. Você tem certeza de que quer apagá-lo?");
define("_FNO","Não");
define("_FSI","Sim");
define("_FEDUSAC","Editar Nível de Acesso de Usuário");
define("_FADD","Adicionar");
define("_FSAV","Salvar");
define("_WARDELU","<b>AVISO</b>: Você está prestes a apagar este Nível de Acesso de Usuário. Você tem certez de que quer apagá-lo?");
define("_FACNEG","ACESSO NEGADO!!!");
define("_FCONF","Configuração dos Foros");
define("_FALHTML","Ativar HTML");
define("_FALBBC","Ativar CódigoBB");
define("_FALSIGN","Ativar Assinatura");
define("_FHOTOP","Discussões quentes Threshold");
define("_FPOSTP","Postagens por página");
define("_FMESSCO1","O número de por Postagens por página");
define("_FTOPPF","Discussões por Fórum");
define("_FMESCO2","O número de Discussões por Fórum.");
define("_FSAVC","Salvar Configuração");
define("_FCATE","Categorias dos Foros");
define("_FID","ID");
define("_FCAT","Categorias");
define("_FNUM","Número do Fórum");
define("_FEDFO","Editar Fórum");
define("_FADDCAT","Adicionar Categorias");
define("_FCATT","Categorias");
define("_FPRAT","Atualmente no Fórum ");
define("_FNAME","Nome");
define("_FDESCR","Descrição");
define("_FACCE","Accesso");
define("_FTIPO","Tipe");
define("_FANON","Anônimo");
define("_FMODERAM","Moderador/Administrador");
define("_FPUBLIC","Público");
define("_FPRIVA","Privado");
define("_FADDMOR","Adicionar novo Fórum em ");
define("_FNONE","Ninguém");
define("_FPASSIF","Senha <i>(Privado)</i>");
define("_FATTUA","Moderador/i Ativado/i");
define("_NOMODSA","Nenhum Moderador foi escolhido");
define("_WADELCAT","<b>WARNING</b>: Você está prestes a apagar esta Categoria e todos os Foros e Mensagens contidas nela. Você tem certeze de que quer apagá-la?");
define("_WADELFO","<b>WARNING</b>: Você está prestes a apagar este Fporum e todas as suas Mensagens. Você tem certeza de que quer continuar?");
define("_FORANKSI","Estrutura hierárquica dos Foros");
define("_FTITL","Grau");
define("_FMINPO","Mínimo de Postagens");
define("_FMAXPO","Máximo de postagens");
define("_FRANSP","Rank Especial");
define("_FADDNRAN","Adicionar um novo Rank");
define("_WADELRA","<b>WARNING</b>: Você tem certeza de que quer apagar este Rank?");
define("_FENTNIPAS","Por favor digite seu Nome de Usuário e sua Senha");
define("_FTUNOMOD","Você não é um Moderador deste Fórum, portanto você não tem permissão de executar este comando!");
define("_ERRORPASS","<b>ERRO</b>: Você digitou uma Senha incorreta! Por favor volte e redigite-a novamente.");
define("_FTOPDEL","A Discussão foi REMOVIDA do Banco de Dados.");
define("_FCLIKTORET","Clique aqui para retornar ao Fórum");
define("_FTOPMOV","A Discussão foi REMOVIDA!");
define("_FTOPLOK","A Discusão foi TRAVADA!");
define("_FTOPSBLOK","A Discussão foi DESTRAVADA!");
define("_FUSIP","Informações sobre o Registro e Endereço de IP");
define("_FFUSIP","Endereço de IP:");
define("_FREDVIS","<b>AVISO</b>: ");
define("_FIDENTMOD","Você foi reconhecido como Moderador deste Fórum!");
define("_FONCEDEL","Assim que você clicar neste botão, a Discussão selecionada e todas as suas Mensagens serão apagadas do Banco de Dados.");
define("_FONCEMOV","Assim que você clicar neste botão, a Discussão selecionada e todas as suas mensagens serão movidas para o Fórum selecionado.");
define("_FONCELOK","Quando você clicar neste borão, a Discussão selecionada será TRAVADA. Você pode destravá-la a qualquer minuto.");
define("_FONCEUNLOK","Quando você clicar neste botão, a Discussão selecionada será DESTRAVADA e estará disponível aos Usuários.");
define("_FMOVETO","Mover Discussão para: ");
define("_FVIEWIP","Seu endereço de IP");
define("_FANONIMO","Anônimo");
define("_LOCALDATETIME","%d-%m-%Y at %H:%M");
define("_BY","por");
define("_WEEKDAYDATETIME","%A, %e-%m-%Y at %H:%M");

/* AGGIUNTE PER VERSIONE 2.1 */

define("_FINMSGH","Cabeçalho da Mensagem");
define("_FINMSGF","Rodapé da Mensagem");
define("_FNOTIF","Notificar");
define("_FNOTMAIL","Notificar por e-mail");
define("_FINDNOT","Endereço a ser notificado");
define("_POSTINN","Postado em: ");
define("_FOPTIO","Opcional");
define("_FOPPR","Se privado");

/* AGGIUNTE PER VERSIONE 2.1 by REFOSCO */

define("_FORUMPREF","Preferências");
define("_FORUMPREFDESC","Preferências Gerais, ativar HTML, CódigoBB, Postagens por página, Cabeçalho e Rodapé da Mensagem, etc...");
define("_FORUMDESC","Gerenciador de Categorias, Adicionar, Editar e Apagar Foros");
define("_FORUMRANKDESC","Sistema de Ranks dos Foos, Adicionar, Editar e Apagar Ranks");
define("_FORUMACCDESC","Gerenciador de Usuários, Adicionar, Editar, Privilégios de Acesso");
define("_FORUMMENU","Menu de Administração dos Foros");
define("_EDITRANK","Editar Rank");

/* AGGIUNTE PER GESTIONE ATTACHMENT */

define("_FORUMATCHM","Anexos");
define("_FORUMENABLECOOKIE","Para usar este recurso você DEVE ativar os COOKIES em seu Browser");
define("_FORUMCLOSE","Fechar");
define("_FORUMATCHMERRINVFILETYPE","<b>ERRO</b>: Este arquivo não pode ser anexado!");
define("_FORUMATCHMERRMAXSIZEREACH","<b>ERRO</b>: O tamanho do arquivo ultrapassa o limite estipulado.");
define("_FORUMATCHMMODEINFO","Para anexar um arquivo a sua Mensagem, siga os dois pessos mencionados, repetindo-os se necessário para incluir mais que um arquivo.<br>No final, clique em <B>OK</B> para voltar para a sua Mensagem.");
define("_FORUMATCHMMODEINFO1","Clique em <B>Browse</B> para selecionar o arquivo<br> ou digite o caminho para o arquivo no seguinte campo.");
define("_FORUMATCHMMODEINFO2","Mover o arquivo para o campo<B></B> clicando em <B>Anexar</B>. O tempo de transferência do arquivo pode variar (de alguns segundos a minutos).");
define("_FORUMATCHMFINDFILE","Procurar arquivo");
define("_FORUMATCHMUPLOAD"," Anexar ");
define("_FORUMATCHMREMOVE","Apagar");
define("_FORUMATCHMEMPTY","-- Sem anexos --");
define("_FORUMATCHMTOTSIZE","Tamanho Total");
define("_FORUMATCHMMAXSIZE","máximo");
define("_FORUMATCHMCANCEL","Cancelar");
define("_FORUMATCHMDELCONFIRM","Você tem certeza de que quer apagar este arquivo?");
define("_FORUMATCHMDOWNFILE","Baixar arquivo");
define("_FORUMATCHMOPENFILE","Abrir arquivo");
define("_FORUMATCHMCODE","(Digite &lt;Anexos&gt; para adicionar arquivos a sua Mensagem.)");

/* AGGIUNTE VARIE 3.0 */

define("_RANKIM","Imagem");
define("_NONE","Nenhum(a)");
define("_RANKIMB","(<b>N.B.</b> Imagens devem estar no diretório:  <b>images/forum/special/</b>)");
define("_RANKIMD","Imagens disponíveis atualmente:");
define("_NONEPOST","Fórum VAZIO!");
define("_LASTENP","Últimas 10 Mensagens");

/* AGGIUNTE VARIE 3.1 */

define("_FDI","de");
define("_MAXUPFILE","Tamanho máximo permitid para arquivos anexos (Kb)");
define("_MAXFILE","Anexos");
define("_INVIA","Enviar");
define("_RESETTA","Resetar");
define("_CATORDE","Ordenar");
define("_CATUP","Mover uma posição para cima");
define("_CATDOWN","Mover uma posição para baixo");
define("_CATRESET","Resetar para a ordem padrão");
define("_FPAGE","Página");
define("_FUSDEL","O Usuário não existe no Banco de Dados!");
define("_FNASCBS","Esconder Blocos da esquerda");
define("_FVISBS","Visualizar Blocos da esquerda");
define("_FULTM","Últimas Mensagens ");
define("_FMPIUL","Mensagens mais lidas");
define("_FMEDRI","Em média cada Discussão recebe:");
define("_FRISPS","Respostas");
define("_FCERCF","Procurar nos Foros");
define("_FISCRIPT","* O início do script não aceito!*");
define("_FINSCRIPT","* Final do script não aceito*");
define("_FHACK","<font color=\"#FF0000\"> *** INSERÇÃO DE CÓDIGO PROIBIDO! - ESTA MENSAGEM É PROVAVELMENTE UM ATAQUE HACKER! ENDEREÇO DE IP REGISTRADO! *** </font>");

/* HELP SYSTEM */

define("_SFHS","Sistema de Ajuda Splatt Forum");
define("_HSH1","Cliqeu aqui e você poderá inserir uma nova Mensagem neste Fórum.");
define("_HSH2","Clique aqui e você poderá visualizar a última Mensagem postada neste Fórum.");
define("_HSH3","Clique aqui e você poderá visualizar o Fórum sem os Blocos da esquerda. Esta é uma solução para uma navegação mais agradável.");
define("_HSH4","Clique aqui para a navegação padrão, com os Blocos da esquerda.");
define("_HSH5","Estas são as 10 Mensagens mais lidas. . Próximo, entre parêntesis, você pode ver quantas vezes ela foi lida.");
define("_HSH6","Estas são as 10 últimas Mensagens postadas nos oros. Elas estão ordenadas cronologicamente.");
define("_HSH7","Aqui você pode visualizar quaisquer restrições configuradas npara estes Foros.");

define("_LOCALDATE","%d-%m-%Y");

?>
