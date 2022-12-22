var estagioCorpo = 3;
var DOM= document.getElementById;
var obb,obb1,obb2,obb3,obb4,obb5,obb6,obb7;
var obb10 = new Array;
var obb11 = new Array;
var botaoaumentadiminui1,botaoaumentadiminui2,textoaumentadiminui1,textoaumentadiminui2;

function iniciaIdTitulos()
{
  var cont=1;
  var val = "titulochamada" + cont;
  obb10[cont]=document.getElementById(val);
  while (obb10[cont])
  {
    cont = cont+1;
    val = "titulochamada" + cont; 
    obb10[cont]=document.getElementById(val);
  }
}


function iniciaIdChamadas()
{
  var cont=1;
  var val  = "chamada" + cont;
  obb11[cont]=document.getElementById(val);
  while (obb11[cont])
  {
    cont = cont+1;
    val  = "chamada" + cont;
    obb11[cont]=document.getElementById(val);  
  }
}


function alteraIdTitulos(novoCorpo)
{
  if (obb10.length>0)
  {
    for (i=1;i<=obb10.length-1;i++)
	{
	  if (obb10[i]) {obb10[i].style.fontSize=novoCorpo;}
	}
  }	
}

function alteraIdChamadas(novoCorpo)
{
  if (obb11.length>0)
  {
    for (i=1;i<=obb11.length-1;i++)
	{
	  if (obb11[i]) {obb11[i].style.fontSize=novoCorpo;}
	}
  }	
}

function iniciaObjetosTamanhoLetra()
{
  obb = document.getElementById("corpo");
  obb1 = document.getElementById("subtitulo");
  obb2 = document.getElementById("assinatura");
  obb3 = document.getElementById("creditoespecial");
  obb4 = document.getElementById("procedencia");
  obb5 = document.getElementById("coordenada");
  obb6 = document.getElementById("chamada0");
  obb7 = document.getElementById("titulochamada0");
  iniciaIdTitulos();
  iniciaIdChamadas();
  botaoaumentadiminui1 = document.getElementById("botaoaumentadiminui1");
  botaoaumentadiminui2 = document.getElementById("botaoaumentadiminui2");
  textoaumentadiminui1 = document.getElementById("textoaumentadiminui1");
  textoaumentadiminui2 = document.getElementById("textoaumentadiminui2");
}


function achaCookie(nome)
{
 var i=0;
 var achou=false;
 var COOKIES = document.cookie.split("; ")
 for (i=0;i<COOKIES.length;i++)
 {
   if (COOKIES[i].split("=")[0]==nome)
   {
     	return COOKIES[i].split("=")[1]
   }
 }
 return ""
}

function todosCookies()
{
 if (document.cookie=="")
 {
  alert ("no cookie")
 }
 else
 {
 COOKIES = document.cookie.split("; ")
 for (i=0;i<COOKIES.length;i++)
 {
   alert("Cookie is " + COOKIES[i].split("="));
 }
  }
  
}

function setaCorpo()
{
  expirateDate = new Date;
  expirateDate.setMonth(expirateDate.getMonth()+6)
  document.cookie="estagioCorpo="+estagioCorpo;expires=expirateDate    
} 

        
function iniciaCorpo()
{
estagioCorpo=achaCookie("estagioCorpo")
if (estagioCorpo==1)
{
   estagioCorpo1();
}
 else
{
    if (estagioCorpo==2)
    {
      estagioCorpo2();
    }
    else
    {
      if (estagioCorpo==4)
      {
        estagioCorpo4();
      }
      else
      {
    	estagioCorpo3();
      }	
    } 
} 
}

function estagioCorpo1()
{
	if (obb) obb.style.fontSize="70%";
	if (obb1) obb1.style.fontSize="80%";
         if (obb2) obb2.style.fontSize="60%";
	if (obb3) obb3.style.fontSize="70%";
	if (obb4) obb4.style.fontSize="80%";
	if (obb5) obb5.style.fontSize="75%";
	if (obb) obb.style.lineHeight="160%";
	if (obb6) obb6.style.fontSize="80%";
	if (obb7) obb7.style.fontSize="110%";
	alteraIdChamadas("70%");
	alteraIdTitulos("80%");
	estagioCorpo=1;
} 		

function estagioCorpo2()
{
   	if (obb) obb.style.fontSize="75%";
	if (obb1) obb1.style.fontSize="85%";
        if (obb2) obb2.style.fontSize="65%";
	if (obb3) obb3.style.fontSize="75%";
	if (obb4) obb4.style.fontSize="85%";
	if (obb5) obb5.style.fontSize="80%";
	if (obb) obb.style.lineHeight="165%";
	if (obb6) obb6.style.fontSize="85%";
	if (obb7) obb7.style.fontSize="115%";
	alteraIdChamadas("75%");
	alteraIdTitulos("85%");
    estagioCorpo=2;
}

function estagioCorpo3()
{
   	if (obb) obb.style.fontSize="90%";
	if (obb1) obb1.style.fontSize="90%";
        if (obb2) obb2.style.fontSize="70%";
	if (obb3) obb3.style.fontSize="85%";
	if (obb4) obb4.style.fontSize="90%";
	if (obb5) obb5.style.fontSize="85%";
	if (obb6) obb6.style.fontSize="90%";
	if (obb6) obb6.style.fontSize="90%";
	if (obb7) obb7.style.fontSize="120%";
	alteraIdChamadas("90%");
	alteraIdTitulos("90%");
	estagioCorpo=3;
}

function estagioCorpo4()
{
	if (obb) obb.style.fontSize="100%";
	if (obb1) obb1.style.fontSize="100%";
    if (obb2) obb2.style.fontSize="80%";
	if (obb3) obb3.style.fontSize="95%";
	if (obb4) obb4.style.fontSize="100%";
	if (obb5) obb5.style.fontSize="95%";
	if (obb) obb.style.lineHeight="160%";
	if (obb6) obb6.style.fontSize="100%";
	if (obb7) obb7.style.fontSize="130%";
	alteraIdChamadas("100%");
	alteraIdTitulos("100%");
	estagioCorpo=4;
}

function estagioCorpo5()
{
        if (obb) obb.style.fontSize="110%";
        if (obb1) obb1.style.fontSize="110%";
    if (obb2) obb2.style.fontSize="90%";
        if (obb3) obb3.style.fontSize="105%";
        if (obb4) obb4.style.fontSize="110%";
        if (obb5) obb5.style.fontSize="105%";
        if (obb) obb.style.lineHeight="170%";
        if (obb6) obb6.style.fontSize="110%";
        if (obb7) obb7.style.fontSize="140%";
        alteraIdChamadas("110%");
        alteraIdTitulos("110%");
        estagioCorpo=5;
}

		
function aumentaCorpo()
{
  if (estagioCorpo==1) 
  { 
    estagioCorpo2();
  }	
  else
  {
  	if (estagioCorpo==2) 
  	{
 	 estagioCorpo3();		
  	}	
  	else
  	{
  		if (estagioCorpo==3) 
  		{
    	 	estagioCorpo4();
  		}
		else 
		{ 
		if (estagioCorpo==4) 
			{
			estagioCorpo5();
			}
		} 	
  	}	
  }
  setaCorpo();	
}

function diminuiCorpo()
{
if(estagioCorpo==5)
{
estagioCorpo4();
} 
else 
{
  if (estagioCorpo==4) 
  {
    estagioCorpo3();
  }	
  else
  {
  	if (estagioCorpo==3) 
  	{
	  estagioCorpo2();
  	}	
  	else
  	{
  		if (estagioCorpo==2) 
  		{		
		 estagioCorpo1();
  		}	
  	}	
  }	
 }
  setaCorpo();
}


function mostraAumentaDiminui()
{
     // botaoaumentadiminui1.style.visibility="visible";
     // botaoaumentadiminui2.style.visibility="visible";
      //textoaumentadiminui1.style.visibility="visible";
      //textoaumentadiminui2.style.visibility="visible";
}

function iniciaTamanhoLetra()
{
  if (DOM)
  {	
       iniciaObjetosTamanhoLetra();
       iniciaCorpo();
       mostraAumentaDiminui();
  }	  	
}
