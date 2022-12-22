<?php

global $modversion;
define(_GALVERSION, $modversion['version']);
define(_RATING,'Dê uma nota');
define(_GALINFO,'Informações da Imagem');
define(_GALDESCRIPTIONS,'Descrição da Imagem');
define(_RATETIME,'Para votar, clique no botão acima!');
// Date Strings
/* 2.4 */define(_GALDATEFULL, '%A, %d de %b de %Y');
/* 2.4 */define(_GALDATEBRIEF, '%d de %b de %Y');
/* 2.4 */define(_GALTIME, '%I:%M%p');

// Copyright Strings
/* 2.4 */define(_GALCOPYRIGHT, "Powered by: My_eGallery %s AddOn Modules<br>&copy; 2001 Copyright <a href=\"http://www.marsishere.net/index.php\" target=\"_blank\">MarsIsHere.net</a>");

// Sorting of Media Menu
/* 2.4 */define(_GALSORTMEDIABY,'Ordenar mídia por');
/* 2.4 */define(_GALMEDIASORTED,'Mídia atualmente ordenada por');
/* 2.4 */define(_GALPOPULARITY1,'Popularidade (Número menor de Hits para número maior de Hits)');
/* 2.4 */define(_GALPOPULARITY2,'Popularidade (Número maior de Hits para número menor de Hits)');
/* 2.4 */define(_GALASC,'A');
/* 2.4 */define(_GALDESC,'D');
/* 2.4 */define(_GALNAMEAZ,'Nome (de A até Z)');
/* 2.4 */define(_GALNAMEZA,'Nome (de Z até A)');
/* 2.4 */define(_GALDATE1,'Data (M Mídia Listada primeiramente)');
/* 2.4 */define(_GALDATE2,'Data (Nova Mídia Listada primeiramente)');
/* 2.4 */define(_GALRATING1,'Avaliação (menor nota para maior nota)');
/* 2.4 */define(_GALRATING2,'Avaliação (maior nota para menor nota)');

// Media Formats
/* 2.5 */define(_GALMEDIAMOV, 'Vídeo Quicktime');
/* 2.5 */define(_GALMEDIAMPG, 'Vídeo MPEG');
/* 2.5 */define(_GALMEDIAAVI, 'Vídeo AVI');
/* 2.5 */define(_GALMEDIAMP3, 'Aúdio MP3');
/* 2.5 */define(_GALMEDIAMID, 'Música MIDI');
/* 2.5 */define(_GALMEDIASWF, 'Shockwave Flash');
define(_GALVISIBLEMEMBER,'Visível apenas para membros');
define(_GALVISIBLEADMIN,'Visível apenas para administradores');
define(_GALVISIBLEPUBLIC,'Visível para todos');
/* 1.1 */define(_GALHITS, 'Hits');
/* 2.0 */define(_GALRATING, 'Avaliação');
/* 2.0 */define(_GALVOTES, 'Votos');

// WebJeff File Manager Messages (fileFunctions.php)
/* 2.5 */define(_GALFILEMOVED, 'O arquivo <b>%s</b>foi movido para o diretório');
/* 2.5 */define(_GALFILEDELETED, "O diretório <b>%s</b> foi apagado.");
/* 2.5 */define(_GALFILEDELETED2, "O arquivo <b>%s</b> foi apagado");
/* 2.5 */define(_GALFILEDELETED3, "O arquivo foi apagado");
/* 2.5 */define(_GALFILERENAMED, "Entre um nome válido");
/* 2.5 */define(_GALFILERENAMED1, "<b>%s</b> já existe");
/* 2.5 */define(_GALFILERENAMED2, "<b>%s</b> foi renomeado para <b>%s</b>");
/* 2.5 */define(_GALFILECREATED, "Entre um nome válido");
/* 2.5 */define(_GALFILECREATED1, "O diretório já existe");
/* 2.5 */define(_GALFILECREATED2, "O diretório <b>%s</b> foi criado neste diretório");
/* 2.5 */define(_GALFILEUPLOADED, "<br>ERRO durante a transferência de!<br> %s");
/* 2.5 */define(_GALFILEUPLOADED1, "O arquivo <b>%s</b> foi enviado para o diretório <b>%s</b>");
/* 2.6.4*/define (_GALCREATECATERROR, 'O script não pode criar o diretório. Por favor cheque suas permissoes de escrita (CHMOD).');
/* 2.6.4*/define (_GALUPLOADERROR, "A mídia que você tentou enviar excedeu o tamanho máximo para upload permitido em 'Configurações Gerais' ou no 'php.ini'.<br><br>Outra causa para o problema é que seu servidor está com a variável <pre>register_globals</pre> setadas em <pre>off</pre>.<br><br>você precisa dessa variável setada em ON para ter a galeria funcionando 100%!");
/* 2.6.4*/define (_GALUPLOADERROR2, "Por favor selecione uma mídia para enviar.");
/* 2.6.4*/define (_GALUPLOADERROR3, "O script não pode criar o diretório. Por favor cheque suas permissões de escrita (CHMOD).");

/* 2.7.3*/define (_GALTYPENOTSUPPORTED, 'Você não pode enviar este arquivo: O tipo não é suportado');

define(_NAME, 'Nome');
define(_POPULARITY, 'Popularidade');
define(_IMAGEINSUBCAT, 'Imagem em sub Categoria');
?>