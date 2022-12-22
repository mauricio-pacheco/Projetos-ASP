__urliG = document.location.toString();
if(__urliG.indexOf("www.ig.com.br") == -1) { location.href = "http://www.ig.com.br/"; }

function trocaInput(){
	document.getElementById("mail_input_pass").innerHTML = "<input type=\"password\" tabindex=\"2\" name=\"password\" id=\"bl2_txtsenha\" onkeypress=\"if(event.keyCode == 13) validaManda();\" style=\"background-color:#ffffff; height:16px;_height:14px; width:115px; border:0px; border-style:none; font-size:10px; color:#a0a0a0;\">";
	setTimeout("setFocus()", 1);
}

function setFocus() { login.password.focus(); }
function abreJanela(url) { window.open(url); }
function pegaXAbs(elt) { return parseInt(elt.x) ? elt.x : pegaPosAbs(elt,"Left"); }
function pegaYAbs(elt) { return parseInt(elt.y) ? elt.y : pegaPosAbs(elt,"Top"); }
function shopping(url){ window.open(url); }

function addhomesite(oForm, tipoHome) {
    if(document.all) {
        oForm.style.behavior="url(#default#homepage)";
        oForm.setHomePage("http://www.ig.com.br/" + tipoHome);
        return false;
    }
}

function alocaBanAbs(divBan,esqPos){
	tblNome = document.getElementById('tbl_reftop');
	tdEsq  = (pegaXAbs(tblNome));
	tdEsq  = (tdEsq + esqPos);
	document.getElementById(divBan).style.left = tdEsq;
	document.getElementById(divBan).style.right = '-15px';
	document.getElementById(divBan).style.marginRight = '15px';
}

function alocaBanAbsTop(divBan,topPos,objRef){
    objNam = document.getElementById(objRef);
    objTop  = (pegaYAbs(objNam));
    objTop  = (objTop + topPos);
    document.getElementById(divBan).style.top = objTop;
}

function pegaPosAbs(elt,posicao) {
    iPos = 0;

    while (elt != null) {
        iPos += elt["offset" + posicao];
        elt = elt.offsetParent;
    }
    return iPos;
}

//insira os divs absolutos aqui (div id + distancia left)
function aTodosBanrs(){
    alocaBanAbs('absCTopban',0);  //top banner
    alocaBanAbs('absCAnunc',728); //top anuncie
    alocaBanAbs('abs3selos',661); //3 selos
    alocaBanAbs('absIfrUSEG',320);//iframe useg
    alocaBanAbs('termometro',795);  //termometro
    alocaBanAbsTop('absIfrUSEG',0,'divCorpo');
    alocaBanAbsTop('abs3selos',0,'divCorpo');
}

function validaManda() {
	var destino = document.login.username.value;

	if(destino.indexOf("superig.com.br") != -1) {
		document.login.action = 'http://auth.superig.com.br/central/authorganizer';
	} else {
		if(destino.indexOf("@ig.com.br") != -1) {
			destino = destino.substring(0, destino.indexOf("@ig.com.br"));
		}
		document.login.username.value = destino;
		document.login.action = 'http://webmail.ig.com.br/inmail/chklogin.pl';
	}
	document.login.submit();
}

//Abri painel iGeconomia
function painel(){
Popup_Painel = ck(30038, 781, 'http://ultimosegundo.ig.com.br/paginas/igeconomia/painel.html', '3');
Popup_Painel.focus();
}

document.write("<scr" + "ipt type='text/javascript' language='javascript' src='http://image.ig.com.br/homev8/js/contaclique.js'></scr" + "ipt>");

function acessoVerifica() {
	_urlHome = (location.href).split("?");

	var urlFlashBox = "";
	var objFlash = "";

	if (_urlHome[1] == "acesso") {
		urlFlashBox = "http://image.ig.com.br/homev8/flash/box_hp_usuario.swf";
	} else {
		urlFlashBox = "http://image.ig.com.br/homev8/flash/box_hp.swf";
	}

	objFlash += "<object id='objFlashBox' classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' width='130' height='85'>";
	objFlash += "	<param name='movie' value='" + urlFlashBox + "'>";
	objFlash += "	<param name='wmode' value='transparent'>";
	objFlash += "	<embed id='objFlashBox2' src='" + urlFlashBox + "' wmode='transparent' quality='high' width='130' height='85' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'></embed>";
	objFlash += "</object>";

	document.write(objFlash);
}

function opecflash(ig_widht,ig_height,ig_swf,ig_wmode){
	document.writeln('     <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" WIDTH="'+ig_widht+'" HEIGHT="'+ig_height+'" id="dhtmlig" ALIGN="">');
	document.writeln('       <PARAM NAME="movie" VALUE="'+ig_swf+'">');
	document.writeln('       <PARAM NAME="quality" VALUE="high">');
	document.writeln('       <PARAM NAME="wmode" VALUE="'+ig_wmode+'">');
	document.writeln('       <PARAM NAME="bgcolor" VALUE="#FFFFFF">');
	document.writeln('      <EMBED src="'+ig_swf+'" quality="high" wmode="'+ig_wmode+'" bgcolor="#FFFFFF"  WIDTH="'+ig_widht+'" HEIGHT="'+ig_height+'" NAME="dhtmlig" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>');
	document.writeln('     </OBJECT>');
}


/* Falar com Leonardo Prado (Ramal 3231) antes de alterar esse sistema de publicidade */
//			 	['<a href="http://adserver.ig.com.br/RealMedia/ads/click_nx.ads/www.poupaclique.com.br/ig_home/caixa@x02" target="_blank" class="publicidade"><img src="http://adserver.ig.com.br/RealMedia/ads/adstream_nx.cgi/www.poupaclique.com.br/ig_home/caixa@x02" alt="" /></a>', 'ESTAH_EM_STANDBY_UTILIDADES', 'ESTAH_EM_STANDBY_SERVIÇOS', 'ESTAH_EM_STANDBY_SEUS DIREITOS'],
var adKeys = [
				['<a href="http://adserver.ig.com.br/RealMedia/ads/click_nx.ads/www.babado.com.br/carnaval/home_ig/smirnoff@x02" target="_blank" class="publicidade"><img src="http://adserver.ig.com.br/RealMedia/ads/adstream_nx.cgi/www.babado.com.br/carnaval/home_ig/smirnoff@x02" alt="" /></a>',
				 'É CARNAVAL!', 'CAIA NA FOLIA', 'SAMBA NO PÉ', 'GATAS DO CARNAVAL', 'DIRETO DO CAMAROTE', 'DIVERSÃO', 'ENTRETENIMENTO', 'ESTILO', 'BALADAS', 'PROGRAME-SE']
			 ];

function _publicidadePf(id) {
	boxKey = id.replace(/\&amp;/gi, "&");
	for (x = 0; x < adKeys.length; x++)
		for (y = 1; y < adKeys[x].length; y++){
			boxTitle = document.getElementById(boxKey)
			if(boxTitle.innerHTML.indexOf(adKeys[x][y]) != -1) boxTitle.parentNode.innerHTML += adKeys[x][0];
		}
}

function montaBusca(){
	oFormBusca = document.getElementById("formBusca");
	linksOpcoes = oFormBusca.getElementsByTagName("a");
	textField = document.getElementById("bl2_txtbus");
	for (x = 0; x < linksOpcoes.length; x++)
		linksOpcoes[x].onclick = function(e){
			if(typeof(e)=='undefined')var e=window.event
			source=e.target?e.target:e.srcElement
			if(source.nodeType == 3)source = source.parentNode
			for (y = 0; y < linksOpcoes.length; y++) if (linksOpcoes[y].className == "ativo") linksOpcoes[y].className = "";
			source.className = "ativo"
			enviaBusca()
			return false;
		}
	oFormBusca.onsubmit = enviaBusca
}

function enviaBusca(){
	oFormBusca = document.getElementById("formBusca");
	linksOpcoes = oFormBusca.getElementsByTagName("a");
	textField = document.getElementById("bl2_txtbus");
	for (x = 0; x < linksOpcoes.length; x++){
		if (linksOpcoes[x].className == "ativo"){
			if (linksOpcoes[x].id == "buscaWeb")
				oFormBusca.action = "http://farejador-1.ig.com.br/farejador/search?q=" + escape(textField.value) + "&orig=ig_xml_br_web_search_home&pg=1";
			if (linksOpcoes[x].id == "buscaIg")
				oFormBusca.action = "http://farejador-1.ig.com.br/farejador/search?q=" + escape(textField.value) + "&orig=ig_xml_br_noig_search_home&onIG=true";
			if (linksOpcoes[x].id == "buscaNoticias")
				oFormBusca.action = "http://ultimosegundo.ig.com.br/busca/busca.shtml?origem=HOMEIG&query="+(textField.value)+"&orig=ig_xml_br_noticias_search_home";
			if (linksOpcoes[x].id == "buscaShopping")
				oFormBusca.action = "http://igshopping.ig.com.br/busca.asp?palavra="+escape(textField.value);
		}
	}
	if (document.getElementById("bl2_txtbus").value != "") oFormBusca.submit();
	return false;
}

function showEmoticon(num){ if (num != 0) document.write('<img src="http://images.ig.com.br/homev8/novas/ic_girl' + num + '_box_novo.gif" alt="" />'); }

function _mudaBox(xml, objRequest, linkIframe) {
	if(linkIframe != '') document.getElementById("iframeiG").src = linkIframe
	if(xml == '') xml = "http://www.ig.com.br/caixinhas/1pagina_v2.0.xml";
	else xml = "http://www.ig.com.br/caixinhas/" + xml + "_v2.0.xml";
	objRequest.open("GET", xml, true);
	objRequest.onreadystatechange = function() {
        if(objRequest.readyState == 4)
            if(objRequest.status == 200) {
				html = objRequest.responseXML.getElementsByTagName("conteudos");
                html = html[0].getElementsByTagName("conteudo")[0];
                if(html.textContent) conteudo = html.textContent;
                else conteudo = html.lastChild.nodeValue;
				document.getElementById("bradesco").innerHTML = conteudo;
			} else _mudaBox('', objRequest, '');
	};
	objRequest.send(null);
}