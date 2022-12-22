CREATE TABLE "admin" (
  "data" text, 
  "hora" text, 
  "ip" text, 
  "host" text);

CREATE TABLE "clientes" (
  "clienteid" int IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "datacad" varchar(250),
  "nome" varchar(250),
  "email" varchar(250),
  "senha" varchar(250),
  "cpf" varchar(250),
  "rg" varchar(250),
  "nascimento" varchar(250),
  "endereco" varchar(250),
  "bairro" varchar(250),
  "cidade" varchar(250),
  "estado" varchar(250),
  "cep" varchar(250),
  "pais" varchar(250),
  "tel" varchar(250),
  "status" varchar(250)
  PRIMARY KEY ("clienteid"));

CREATE TABLE "compras" (
  "pedido" "bigint" IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "idcompra" "bigint" default NULL,
  "datacompra" text,
  "clienteid" varchar(250),
  "frete" text,
  "totalcompra" text,
  "dataentrega" text,
  "endentrega" varchar(250),
  "bairroentrega" varchar(250),
  "cidadeentrega" varchar(250),
  "estadoentrega" varchar(250),
  "cepentrega" varchar(250),
  "paisentrega" varchar(250),
  "telentrega" varchar(250),
  "pagamentovia" varchar(250),
  "status" varchar(250),
  "presente" text,
  "msgpresente" varchar(250),
  "numero" text,
  "vencimento" text,
  "titular" varchar(250),
  PRIMARY KEY  ("pedido"));

CREATE TABLE "email" (
  "email" varchar(250)
);

CREATE TABLE "boleto" (
  "nosso" text
);

CREATE TABLE "fretes" (
  "localidade" varchar(250),
  "re0" varchar(250),
  "re1" varchar(250),
  "re2" varchar(250),
  "re3" varchar(250),
  "re4" varchar(250),
  "re5" varchar(250),
  "re6" varchar(250),
  "re7" varchar(250),
  "re8" varchar(250),
  "re9" varchar(250)
);

INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES('capital', '6,10', '9,10', '12,60', '15,30', '16,60', '18,70', '21,40', '24,50', '25,80', '27,70');
INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES('interior', '6,10', '13,90', '16,40', '19,80', '20,40', '22,40', '25,30', '28,00', '29,40', '31,50');
INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES('pesocapital', '0,80', '2,10', '3,50', '4,40', '4,90', '5,60', '6,80', '7,80', '8,20', '8,90');
INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES('pesointerior', '0,80', '4,00', '4,90', '6,00', '6,30', '7,00', '8,20', '9,20', '9,50', '10,20');

CREATE TABLE "newsletter" (
  "datacad" text,
  "email" varchar(250)
);


CREATE TABLE "pedidos" (
  "idcompra" bigint default NULL,
  "idprod" bigint default NULL,
  "quantidade" bigint default NULL
);


CREATE TABLE "produtos" (
  "idprod" bigint IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "nome" varchar(250),
  "fabricante" text,
  "detalhe" varchar(8000),
  "preco" text,
  "precovelho" text NOT NULL,
  "parcela" text,
  "juro" text,
  "aomes" text,
  "estoque" text,
  "idsessao" varchar(250),
  "data" text,
  "peso" text,
  "imgra" text,
  "impeq" text,
  "status" text,
  "contador" bigint default NULL,
  PRIMARY KEY  ("idprod"));

INSERT INTO produtos (nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES('iPAQ Pocket PC H3760', 'Compaq', 'Mantenha-se conectado ao que é mais importante para você - em qualquer momento e lugar.\r\nCom o iPAQ Pocket PC 3760, apresentando Microsoft® Pocket PC 2002, você terá o poder da Internet em suas mãos.\r\nPotente e delgado\r\nUm design elegante com tela TFT mais brilhante e o processador mais rápido do mercado\r\n\r\n[b]Expansível e versátil[/b]\r\nOs cartões de expansão iPAQ Expansion Packs provêem uma extraordinária gama de funcionalidades\r\n\r\n[b]Velocidade impressionante[/b]\r\nLeia rapidamente suas mensagens de correio eletrônico, programas, arquivos MP3 e fotografias digitais graças ao potente processador Intel de 206 MHz.\r\n\r\n[b]Impulso para o futuro[/b]\r\nO iPAQ Pocket PC com Microsoft Pocket PC 2002 marca o ritmo do progresso.\r\n\r\n[linha]\r\n\r\n[i][b]Características Técnicas:[/b][/i]  \r\nProcessador: Intel StrongArm 206 MHz\r\nSistema Operacional: Windows® Pocket PC\r\nMemória: 64 MB\r\nMemória Rom: 16 MB\r\nTipo de tela: LCD, TFT com 4,096 cores, Tela sensível ao tato\r\nResolução: 240 x 320 píxels\r\nTamanho de Pixel: 0,24 mm\r\nDimensões de imagem visível: 5,7 x 7,7 cm\r\nMétodo de entrada de dados: Reconhecimento de escrita, teclado programável, gravação de voz, escrita gráfica.\r\nPorta de comunicações: Interface Serial\r\nSlots para cartões: Slot de expansão opcional\r\nPorta infravermelha: com taxa de transferência de 115 Kbps\r\nÁudio: Com capacidade para gravar e ouvir áudio em formato MP3 e programas na Internet, Gravador de voz, Microfone, alto-falante\r\nBateria: Lítio-polímero de 950 mAh\r\nSoftwares Inclusos: ActiveSync 3.5, Calendário, Pocket PC Word, Excel e Internet Explorer, Windows Media Player, Calculadora, Solitario, Inbox (e-mail), MS Reader, MSN Messenger.\r\nDisplay: TFT Colorido, 240 x 320 pixels\r\nGarantia: 1 ano\r\nPeso (Kg): 0,178\r\nProcessador: StrongArm 206 MHz\r\nDimensões (LxAxP) mm: 83 x 130 x 16\r\nAlimentação: Bateria recarregável de Polímero Lítio de 950 mAh\r\nExpansão de Memória: Opcional Cartões CompactFlash (via jaqueta)\r\nAcesso à Internet: Via Modem (vendido separadamente)\r\nMemória (MB): 64\r\nSistema Operacional: Pocket PC 2002\r\nPorta Infravermelha\r\nTipo de Conexão: Serial\r\nCradlle Incluso: Serial\r\n\r\n[linha]\r\n\r\n[b][i]Dados Técnicos:[/i][/b] \r\nGarantia: 12 Meses\r\nDimensões: 83 x 130 x 16 mm \r\nPeso: 0,178 Kg', '1759', '2000', 'v', '0', 'mes', 'n', '1', '30/09/2002', '0.2', 'g_168007.jpg', 'p_168007.jpg', 'nao', '0');
INSERT INTO produtos (nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES('Placa Aceleradora Gráfica de Vídeo GeForce2 MX200 64MB PCI', 'Pixel View', 'Obtenha uma performance, velocidade e qualidade nunca antes vistas em seus aplicativos gráficos, projetos ou em jogos 3D (terceira dimensão) !!!\r\n\r\n[linha]\r\n\r\n[b][i]Características Técnicas:[/i][/b]  \r\nG2 MX200 c/ saída para TV\r\nChip Gráfico Nvidia –GeForce2 MX200\r\nUnidade Processamento Grafico de 256 bits\r\n64 MB memória onboard\r\nTaxa de processamento de 700 Mtexels\r\nConfigurável em até 20 M triângulos/segundo\r\nTecnologia QuadEnging nVIDIA\r\n350 MHz de Processamento Interno\r\nOptimizada para DirectX 7.0 e Open GL\r\nSaída de TV: NTSC/PAL com Filtro anti-flicker\r\nConfigurável p/: 8, 15,16,24 ou 32 bits/pixel\r\nCursor de Hardware True Color\r\nMulti-proteção (duas, três, quatro proteções) para animação plana e video playback\r\nG2 MX200 de 64 bits\r\n\r\n[linha]\r\n\r\n[b][i]Video Playback[/i][/b]\r\nProcessador de alta definição\r\nCompensação de Movimento Avançado de vídeo playback full screen para todas as resoluções de DVD/HDVD\r\nAceleração de vídeo para DirectShow, MPEG-1, MPEG-2 e Indeo\r\n8:1 escala abaixo / escala acima\r\n\r\n[linha]\r\n \r\n[b][i]Dados Técnicos:[/b][/i] \r\nGarantia: 6 Meses\r\nDimensões: 198 x 290 x 62 mm \r\nPeso: 0,374 Kg', '300', '350', '3', '2', 'mes', 's', '1', '30/09/2002', '0.1', 'g_157345.jpg', 'p_157345.jpg', 'ok', '0');
INSERT INTO produtos (nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES('Notebook Evo N160 W2000 Pentium III 1,2 GHz', 'Compaq', 'Um notebook poderoso, leve, delgado e com um preço competitivo!&nbsp;<br>&nbsp;<br><b>Sistema Operacional: MS Windows 2000</b>&nbsp;<br>&nbsp;<br>- Processador Intel® Pentium®III-M de 1.2GHz - Tecnologia de Intel®&nbsp;<br>- Speedstep - 512 KB de cache L2 integrado&nbsp;<br>- Monitor TFT de 14,1\"&nbsp;<br>- 256 MB SyncDRAM de memória expansível até 1GB - um compartimento disponível&nbsp;<br>- Disco Rígido UltraDMA de 20.0 GB&nbsp;<br>- Unidade de DVD/CD-RW Combinação&nbsp;<br>- Porta de vídeo digital IEEE 1394&nbsp;<br>- Porta Ethernet de 10/100 MB/s Integrado&nbsp;<br>- Modem de 56K ITU V.92&nbsp;<br>- Gráficos de 4X AGP Mobility Radeon 3D&nbsp;<br>- 8 MB de memória dedicada para vídeo&nbsp;<br>- Alto-falantes de JBL Pro Audio com \"Bass Reflex\"&nbsp;<br>- Bateria de Li-ION de Alta-Capacidade&nbsp;<br>- Unidade de Disquete de 3,5\" de 1,44 MB&nbsp;<br>- S-Video TV-Out&nbsp;<br>&nbsp;<br><b>Interfaces de E/S:</b>&nbsp;<br>-Dois (2) conectores USB&nbsp;<br>-Porta de vídeo digital IEEE 1394&nbsp;<br>-Interface paralela padrão EPP/ECP compatível com a norma Centronics (DB25 conector)&nbsp;<br>-Conector para modem RJ11&nbsp;<br>-Conector para ethernet RJ45&nbsp;<br>-Saída para TV S-Video&nbsp;<br>-Duas interfaces para áudio (saída para fone de ouvido e alto-falantes; entrada para microfone)&nbsp;<br>-Conector para monitor VGA&nbsp;<br>-Conexão para Quickdock.&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Dados Técnicos</i></b>&nbsp;<br>Bateria: Li-Ion de Alta Capacidade&nbsp;<br>Bus de Sistema: 133MHz&nbsp;<br>Expansão de Memória RAM: até 1 GB&nbsp;<br>Garantia: 1 ano&nbsp;<br>Peso (Kg): 2,540&nbsp;<br>Cor: Grafite&nbsp;<br>Dimensões do Produto (LxAxP) mm: 325 x 33 x 263&nbsp;<br>Dimensões da Embalagem (LxAxP) mm: 177 x 355 x 412&nbsp;<br>', '7499', '8000', '24', '0', 'mes', 's', '1', '30/09/2002', '2.5', 'g_168229.jpg', 'p_168229.jpg', 'ok', '0');
INSERT INTO produtos (nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES('Impressora Jato de Tinta DJ 3420', 'HP', 'A impressora jato de tinta em cores HP Deskjet 3420, oferece qualidade fotográfica excepcional, com rapidez e facilidade, de até 2400 ppp em cores com os cartuchos incluídos, além de rendimento de 10 páginas por minuto em preto profundo e 8 páginas por minuto em cores. Seu desenho compacto economiza espaço valioso no seu escritório. O indicador de nível de tinta na tela e o botão de cancelamento de impressão economizam tempo e dinheiro. Imprima documentos duradouros usando tintas e papéis especialmente desenvolvidos pela HP. Porta USB compatível com PC e Mac.&nbsp;<br>Interface com o usuário simplificada, operação da impressora com um único botão, bandeja dobrável de papel, novo design compacto&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Características Técnicas</i></b>&nbsp;<br>Emissões de Energia Acústica: 5,8 B(A)&nbsp;<br>Emissões de Pressão Acústica: 47 dB(A)&nbsp;<br>Conectividade do Hardware: padrão, USB&nbsp;<br>Cabo in Box: Não&nbsp;<br>Memória: 768 KB&nbsp;<br>Consumo de Energia: 23 watts, em média&nbsp;<br>Voltagem de entrada: 100 a 240 VAC (+/- 10%), 50-60 Hz (+/- 3Hz)&nbsp;<br>Tipo de Alimentação: Externa&nbsp;<br>Cartuchos de Impressão: padrão - 2 (1 preto, 1 tricolor)&nbsp;<br>Cores do Cartucho da Impressora: Preto, ciano, magenta, amarelo&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Velocidade de Impressão</b></i>&nbsp;<br>em cores, qualidade normal - até 1 ppm&nbsp;<br>fotografia em cores, qualidade perfeita - até 1 ppm&nbsp;<br>fotografia em cores, qualidade normal - N/D&nbsp;<br>em preto - até 10 ppm&nbsp;<br>em preto (qualidade de rascunho) - até 10 ppm&nbsp;<br>em cores - até 8 ppm&nbsp;<br>em cores, qualidade de rascunho - até 8 ppm&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Dados Técnicos</i></b>&nbsp;<br>Cartuchos Inclusos: P&B/ Color&nbsp;<br>Compatibilidade: Pc e Mac&nbsp;<br>Garantia: 1 ano&nbsp;<br>Método de Impressão: Jato de Tinta&nbsp;<br>Resolução Máxima (dpi): 2400 x 1200 ppp&nbsp;<br>Tamanho do Papel: Carta, Ofício, Executivo, A4, A5 e B5&nbsp;<br>Interface: USB&nbsp;<br>Dimensões (LxAxP) mm: 422 x 182 x 142 mm&nbsp;<br>Garantia: 12 Meses&nbsp;<br>Dimensões: 422 x 182 x 142 mm &nbsp;<br>Peso: 2,000 Kg &nbsp;<br>', '349', '410', '12', '0', 'mes', 's', '1', '30/09/2002', '2', 'g_174214.jpg', 'p_174214.jpg', 'ok', '0');
INSERT INTO produtos (nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES('Microcomputador Presario 7EL193 Pentium III 933 MHz', 'Compaq', 'Os novos modelos em minitorres possibilitam aos proprietários dos computadores Presario várias opções para acesso rápido à Internet. Quer seja com um modem de 56K V.90, uma porta Ethernet 10Mbps para conexão à Internet via modem a cabo, ou através de uma porta USB para antena parabólica, os modelos em minitorre são o que há de mais moderno em termos de Internet. E ficou ainda mais fácil desfrutar dessa rapidez com o novo teclado aprimorado de acesso imediato que permite acessar e explorar a Internet com apenas um toque de botão. O novo mouse Internet Scroll facilita ainda mais a rolagem das páginas da Internet. Os novos modelos em minitorres estão equipados para o futuro, com o design compatível com os requisitos do Ano 2000 padrão do setor. Apresentam 4 ou 6 slots de expansão, 6 compartimentos para unidades, 4 portas USB e 2 portas digitais IEEE 1394. Para garantir sua satisfação durante muitos anos com seu novo micro de Internet, o Presario Série 7000 é extremamente fácil de manter em condições de operação otimizada. Graças ao novo chassis totalmente remodelado, o usuário pode atualizar e dar manutenção ao micro sem o uso de ferramentas!&nbsp;<br>&nbsp;<br>Não deixe de ler o manual do fabricante. Você fica por dentro de todos os recursos dos equipamentos, aprende a instalá-los corretamente e evita danos&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Características Técnicas</i></b>&nbsp;<br>Bus de Sistema: 133 MHz&nbsp;<br>Disco Rígido HD: 20 Gb&nbsp;<br>Expansão de Memória RAM: até 768 MHz&nbsp;<br>Garantia: 1 ano&nbsp;<br>Memória Cache: L2 256 kb integrado&nbsp;<br>Memória RAM: 128 Mb&nbsp;<br>Monitor: 15\" Compaq com Alto-falantes JBL Pro&nbsp;<br>Multimídia: JBL Pro B540&nbsp;<br>Peso (Kg): 13,600&nbsp;<br>Placa Vídeo: TNT2 M64 PRO 16 Mb&nbsp;<br>Placa de Som: Sound Blaster® 128 PCI Creative Labs&nbsp;<br>Placa de Fax/Modem: 56Kbps ITU V.90&nbsp;<br>Processador: Pentium III 933 MHz&nbsp;<br>Rede: Ethernet de 10/100 Mbps&nbsp;<br>Softwares em CD: MS® Encarta 2000 Enciclopédia Adaptec Easy cd Crea&nbsp;<br>Softwares Pré-Instalados: MS® Windows® 98 Second Edition/MS® Works 2000&nbsp;<br>Unidade de Disquete 3.5\": inclusa&nbsp;<br>Unidade Leitora/Gravadora de CD-ROM: Gravador CD-RW 24x 4x 4x&nbsp;<br>Unidade Leitora DVD-ROM: DVD ROM de 8X&nbsp;<br>Web-Cam: Logitech QuickCam Express&nbsp;<br>Cor: Branco&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Dados Técnicos</i></b>&nbsp;<br>Dimensões do Produto (LxAxP) mm: 241 x 488 x 477&nbsp;<br>Dimensões da Embalagem (LxAxP) mm: 380 x 610 x 600&nbsp;<br>Garantia: 12 Meses&nbsp;<br>Dimensões: 241 x 488 x 477 mm &nbsp;<br>Peso: 27,300 Kg', '4299', '5000', '24', '0', 'mes', 's', '1', '30/09/2002', '27.3', 'g_166767.jpg', 'p_166767.jpg', 'ok', '0');
INSERT INTO produtos (nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES('Microcomputador OZ 10D', 'Gradiente', 'Agora você poderá navegar na Internet, assistir TV, ver um filme em DVD, ou ainda escutar seu CD favorito num único equipamento que já vem com controle remoto e sistema de áudio com SubWoofer! E, o que é melhor, tudo isso e muito mais pode ser feito insntanteneamente com o exclusivo Menu de Fácil Acesso desenvolvido para o OZ.\r\n\r\n[b]Controle Remoto Multimídia[/b] - Permite que se utilizem as principais funções multimídia do OZ a distância, com muito mais liberdadee praticidade para o usuário.\r\n\r\n[b]Menu de Fácil Acesso[/b] - Desenvolvido com exclusividade pela Gradiente, este menu possibilita o acesso a todos os recursos do OZ através do controle remoto, teclado multimídia ou mouse. Este menu possui duas telas: a primeira traz ícones de TV, FM, CD, Internet, entre outros; a segunda traz outros aplicativos, como gerenciador de arquivos, jogos, etc.\r\n\r\n[b]TV[/b] - Possibilita o uso do equipamento como se fosse uma TV comum. Se você desejar, é possível utilizar dois recursos simultaneamente, como por exemplo, assistir à TV enquanto navega na Internet.\r\n\r\n[b]CD Player[/b] - Funciona como um autêntico aparelho de som, com o reconhecido padrão de qualidade Gradiente.\r\n\r\n[b]DVD[/b] - Permite assistir a filmes de DVD com recursos como múltiplas opções de legendas, idiomas, vários ângulos de cenas e muito mais. Tudo isso com qualidade de imagem e som digitais.\r\n\r\n[b]Rádio FM[/b] - Permite ouvir emissoras de FM, utilizando ainda o recursode programação das favoritas.\r\n\r\n[b]MP3 Player[/b] - Permite entrar na Internet e ouvir emissoras de rádio do mundo todo, fazer download de músicas, ouvir arquivos MP3 etc.\r\n\r\n[b]Subwoofer Ativo (Sistema de Som Amplificado 2.1)[/b] - Reproduz os sons graves: muito mais impacto e fidelidade para TV, jogos e músicas.<\r\n\r\n[b]Teclado Multimídia[/b] - Com ele, o usuário acessa a Internet, abre o programa de e-mail, controla volume e muito mais, com apenas um toque de tecla.\r\n\r\n[b]Internet[/b] - Assinando o provedor Marte, o usuário ganha 3 meses de Internet. \r\n', '4399', '4690', '10', '0', 'mes', 's', '1', '30/09/2002', '20.6', 'g_171043.jpg', 'p_171043.jpg', 'nao', '0');
INSERT INTO produtos (nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES('Windows XP Professional', 'Microsoft', 'O sistema operacional Microsoft Windows XP Professional é o novo sistema operacional de laptop e desktop para empresas de qualquer tamanho que ajuda os usuários a trabalhar de forma mais inteligente, oferecendo ainda mais produtividade e conectividade que a comprovada base de código do Windows 2000. O Windows XP Professional oferece todas as vantagens de um sistema operacional com a simplicidade e flexibilidade da Home Edition.&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Características Técnicas</b></i>&nbsp;<br><u>Requisitos do sistema</u>&nbsp;<br>- PC com processador de 300 MHz ou superior recomendado [233 MHz é o mínimo necessário, (sistema com um ou dois processadores)&nbsp;<br>-128 MB de RAM ou superior recomendados (mínimo de 64 MB, com possível limitação do desempenho e de alguns recursos)&nbsp;<br>- 1,5 GB de espaço disponível em disco &nbsp;<br>- Adaptador de vídeo e monitor Super VGA (800 x 600) ou de resolução superior &nbsp;<br>- Unidade de CD-ROM ou DVD &nbsp;<br>- Teclado e Microsoft Mouse ou dispositivo apontador compatível &nbsp;<br>- Itens ou serviços adicionais necessários para a utilização de alguns recursos do Windows XP &nbsp;<br>&nbsp;<br><u>Para acesso à Internet</u>&nbsp;<br>Alguns recursos da Internet podem exigir acesso à Internet, conta no Microsoft .NET Passport e pagamento de uma taxa separada a um provedor de serviços, além de tarifas telefônicas locais e/ou interurbanas&nbsp;<br>Modem de 14,4 Kbps ou superior &nbsp;<br>&nbsp;<br><u>Para rede</u>&nbsp;<br>Adaptador de rede apropriado para o tipo de rede ao qual você deseja se conectar (local, de longa distância, sem fio ou doméstica) e acesso a uma infra-estrutura de rede adequada; o acesso a redes de terceiros pode exigir o pagamento de taxas &nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Dados Técnicos</i></b>&nbsp;<br>Garantia: 3 Meses&nbsp;<br>Peso: 0,900 Kg', '950', '1200', '12', '0', 'mes', 's', '1', '30/09/2002', '0.9', 'g_161168.jpg', 'p_161168.jpg', 'nao', '0');

CREATE TABLE "sessoes" (
  "id" bigint IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,
  "data" text,
  "nome" varchar(250),
  "descr" varchar(250),
  "ver" text,
);

INSERT INTO sessoes (data, nome, descr, ver) VALUES('12/07/2002', 'Computadores', '-', 's');
INSERT INTO sessoes (data, nome, descr, ver) VALUES('12/07/2002', 'Acessórios', '-', 's');
INSERT INTO sessoes (data, nome, descr, ver) VALUES('12/07/2002', 'Games', '-', 's');
INSERT INTO sessoes (data, nome, descr, ver) VALUES('12/07/2002', 'Softwares', '-', 's');
INSERT INTO sessoes (data, nome, descr, ver) VALUES('12/07/2002', 'Hardware', '-', 's');
INSERT INTO sessoes (data, nome, descr, ver) VALUES('12/07/2002', 'Internet', '-', 's');
INSERT INTO sessoes (data, nome, descr, ver) VALUES('12/07/2002', 'Livros', '-', 's');
INSERT INTO sessoes (data, nome, descr, ver) VALUES('12/07/2002', 'Celurares', '-', 's');
INSERT INTO sessoes (data, nome, descr, ver) VALUES('12/07/2002', 'Palmtops', '-', 's');
INSERT INTO sessoes (data, nome, descr, ver) VALUES('12/07/2002', 'Notebooks', '-', 's');
INSERT INTO sessoes (data, nome, descr, ver) VALUES('12/07/2002', 'Diversos', '-', 's');

