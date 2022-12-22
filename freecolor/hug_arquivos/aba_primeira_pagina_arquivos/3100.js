var urlLimpa = document.location.search;
var regiao = urlLimpa.substring((urlLimpa.indexOf("?") + 1), urlLimpa.indexOf("&"));

if ((typeof regiao == "undefined") || (regiao == "")) regiao = "brasil";

function trataDados(obj) {
	reg = '';

	aba = obj.id.substring(18, 19);
	
	if(obj.id == 'aba1') {
		reg = regiao;
		aba = 1;
	}

	obj.href = 'javascript:carregaAba(' + aba + ', \'' + obj.href + '\');';
}

function carregaAba(aba, href) {
	var toSend = '';
	var objRequest = new xmlOBJ();

	if (href == 'http:///') {
		href = "http://ultimosegundo.ig.com.br/abas/aba_primeira_pagina/";
	}

	if (regiao == "paulista" && href.indexOf("primeira_pagina") != -1) href = "http://ultimosegundo.ig.com.br/abas/aba_primeira_pagina_paulista/";

	linkFinal = "http://contaclique.ig.com.br/contaclick/contaclick?canal=30046&campanha=" + aba + "&url=" + href + "?" + regiao + "&" + aba;
	
	if(href.indexOf("aba_esporte") != -1) toSend = "esporte";
	if(href.indexOf("aba_mundo") != -1) toSend = "mundo";
	if(href.indexOf("aba_brasil") != -1) toSend = "brasil";
	if(href.indexOf("aba_cultura") != -1) toSend = "cultura";
	if(href.indexOf("aba_babado") != -1) toSend = "babado";
	if(href.indexOf("aba_economia") != -1) toSend = "economia";
	if(href.indexOf("aba_opiniao") != -1) toSend = "opiniao";
	
	document.location.href = linkFinal;

	parent._mudaBox(toSend, objRequest, linkFinal);
}

function painel() {
    Popup_Painel = ck(30038, 781, 'http://ultimosegundo.ig.com.br/paginas/igeconomia/painel.html', '3');
    Popup_Painel.focus();
}

function xmlOBJ() {
	if (window.XMLHttpRequest) return new XMLHttpRequest();
	else if (window.ActiveXObject) return new ActiveXObject("Microsoft.XMLHTTP");
}

window.onload = function() {
	url = document.location.toString();
	posicao = url.substring((url.indexOf("&") + 1), url.length);
	
	for(var i=1; i<=8; i++) {
		var objFinal = document.getElementById((i == 1 ? "aba" : "brtpLinkChamadaAba") + i);
		objFinal.onclick = function() {
			trataDados(this);
		}
	}
	
	aba = document.getElementById((posicao == 1 ? "aba" : "brtpLinkChamadaAba") + posicao);

	aba.className += " ativo";
}