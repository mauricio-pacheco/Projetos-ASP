function uolbarCombo()
{
var uolEst = new Array('fotos.uol.com.br/','&Aacute;lbum de Fotos',
'ferramentas.uol.com.br/','Aplicativos Ferramentas',
'batepapo.uol.com.br/','Bate-papo UOL',
'biblioteca.uol.com.br/','Biblioteca',
'www1.uol.com.br/bichos/','Bichos',
'blog.uol.com.br/','Blog',
'busca.uol.com.br/','Busca',
'noticias.uol.com.br/carros/','Carros',
'cartoes.uol.com.br/','Cart&otilde;es',
'seguranca.uol.com.br/','Central de Seguran&ccedil;a',
'sac.uol.com.br/','Central do Assinante',
'cinema.uol.com.br/','Cinema',
'classificados.uol.com.br/','Classificados',
'noticias.uol.com.br/saude/','Corpo e Sa&uacute;de',
'criancas.uol.com.br/','Crian&ccedil;as',
'diversao.uol.com.br/','Divers&atilde;o e Arte',
'noticias.uol.com.br/economia/','Economia',
'noticias.uol.com.br/educacao/','Educa&ccedil;&atilde;o',
'email.uol.com.br/','E-Mail',
'noticias.uol.com.br/empregos/','Empregos',
'esporte.uol.com.br/','Esporte',
'estilo.uol.com.br/','Estilo',
'www.folha.uol.com.br/','Folha Online', 
'fotoblog.uol.com.br/','Fotoblog',
'gay.uol.com.br/','Gay',
'horoscopo.uol.com.br/','Hor&oacute;scopo',
'humor.uol.com.br/','Humor',
'indice.uol.com.br/','&Iacute;ndice',
'jogos.uol.com.br','Jogos',
'noticias.uol.com.br/jornais/','Jornais',
'noticias.uol.com.br/licaodecasa/','Li&ccedil;&atilde;o de Casa',
'megastore.uol.com.br/','Megastore',
'musica.uol.com.br/','M&uacute;sica',
'personalidades.uol.com.br/','Personalidades',
'musica.uol.com.br/radiouol/','R&aacute;dio UOL',
'noticias.uol.com.br/revistas/','Revistas',
'servicos.uol.com.br/','Servi&ccedil;os',
'sexo.uol.com.br/','Sexo',
'shopping.uol.com.br/','Shopping UOL',
'sites.uol.com.br/','Sites Pessoais',
'tecnologia.uol.com.br/','Tecnologia',
'televisao.uol.com.br/','Televis&atilde;o',
'www3.uol.com.br/tempo/','Tempo Tr&acirc;nsito Mapas',
'tvuol.uol.com.br/','TV UOL',
'noticias.uol.com.br/ultnot/','&Uacute;ltimas Not&iacute;cias',
'uolk.uol.com.br/','UOL K',
'noticias.uol.com.br/uolnews/','UOL News',
'vestibular.uol.com.br/','Vestibular',
'viagem.uol.com.br/','Viagem');

var printer='<option value=0>&Iacute;NDICE PRINCIPAL</option>';
for(var i=0;i<uolEst.length;i+=2) printer+='<option value='+uolEst[i]+'>'+uolEst[(i+1)]+'</option>';
return printer;
}

var form_name_seed;
var dC = document;

Iid=9;
form_name_seed = (form_name_seed) ? 2 : 1 ;
CClara = "#F5BB0B";
EEscura = "#DC8B22";

if(!document.getElementById) { forminI = '<form name=fm_uol'+form_name_seed+'>'; formfiM = '</form>'; }
else { forminI = ''; formfiM = ''; }

dC.write('<style>a.lxy:active, a.lxy:link, a.lxy:visited, a.lxy { font-family:arial;font-size:10px;color:white;text-decoration:none; } a.lxy:hover { text-decoration:underline;color:white; }');
if (navigator.appName.indexOf('Netscape')==-1) dC.write('a.lxy { height:24px;padding-top:6px;font-family:arial; }');
else dC.write('a.lxy { height:19px;padding-top:5px;display:block; }');
dC.write('#uolbar { background-image:url(http://barra.uol.com.br/b/uol10anosbg.gif);background-color:#0A3B6C; }')
dC.write('#bnx1, #bnx2 { text-align:center;border-right:1px solid #02264B;vertical-align:middle; } ');
dC.write('#bnx2, #bnx3 { text-align:center; } #uols1, #uols2 { font-family:arial;font-size:10px;width:136px; } </style>');

dC.write('<table cellpadding=0 cellspacing=0 border=0 width=760 id=uolbar height=24><tr>'
+'<td id=bnx1 width=131><a href=http://www.uol.com.br/ target=_top><img src=http://barra.uol.com.br/b/uol10anos.gif border=0 height=17></a></td>'
+'<td id=bnx2 width=53><a href=https://cadastro.uol.com.br/index.html?eos=yes&promo=117570810&sg=300016192&sa=UOL-barra-assine&promochild=PROMOCOMBIAVSS class=lxy style=width:55px; target=_top>ASSINE</a></td>'
+'<td id=bnx1 width=75><a href=http://batepapo.uol.com.br/ class=lxy style=width:75px; target=_top>BATE-PAPO</a></td>'
+'<td id=bnx2 width=52><a href=http://busca.uol.com.br/ class=lxy style=width:52px; target=_top>BUSCA</a></td>'
+'<td id=bnx1 width=144><a href=https://sac.uol.com.br/ class=lxy style=width:144px; target=_top>CENTRAL DO ASSINANTE</a></td>'
+'<td id=bnx2 width=53><a href=http://email.uol.com.br/ class=lxy style=width:53px; target=_top>E-MAIL</a></td>'
+'<td id=bnx1 width=94><a href=http://shopping.uol.com.br/ class=lxy style=width:94px; target=_top>SHOPPING UOL</a></td>'
+'<td id=bnx3 width=148><font face=arial size=1>'+forminI+'<select name=sel_uol0 id=uols'+form_name_seed+' onchange=openEs('+form_name_seed+')>'+ uolbarCombo() +'</select></font>'
+'</td>'+formfiM+'</tr></table>');

function openEs(fn_seed)
{
if(!document.getElementById) eval("var op = document.fm_uol"+fn_seed+".sel_uol0[document.fm_uol"+fn_seed+".sel_uol0.selectedIndex].value");
else op = document.getElementById('uols'+fn_seed)[document.getElementById('uols'+fn_seed).selectedIndex].value;
if(op!=0&&typeof(top)=='object') parent.top.location = 'http://'+op;
else if(op!=0) window.open('http://'+op, 'newWin');
}