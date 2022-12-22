	// set up drop downs anywhere in the body of the page. I think the bottom of the page is better.. 
	// but you can experiment with effect on loadtime.
	if (graniteDropDown.isSupported()) {

		//==================================================================================================
		// create a set of dropdowns
		//==================================================================================================
		// the first param should always be down, as it is here
		//
		// The second and third param are the top and left offset positions of the menus from their actuators
		// respectively. To make a menu appear a little to the left and bottom of an actuator, you could use
		// something like -5, 5
		//
		// The last parameter can be .topLeft, .bottomLeft, .topRight, or .bottomRight to inidicate the corner
		// of the actuator from which to measure the offset positions above. Here we are saying we want the 
		// menu to appear directly below the bottom left corner of the actuator
		//==================================================================================================
		var ms = new graniteDropDownSet(graniteDropDown.direction.down, 0, 0, graniteDropDown.reference.bottomLeft);

		//==================================================================================================
		// create a dropdown menu
		//==================================================================================================
		// the first parameter should be the HTML element which will act actuator for the menu
		//==================================================================================================
		//var menu1 = ms.addMenu(document.getElementById("menu1"));
		//menu1.addItem("- Code of Conduct", "#"); // send no URL if nothing should happen onclick
		
		var menu2 = ms.addMenu(document.getElementById("menu2"));
		menu2.addItem("- Histórico","historico.asp"); // send no URL if nothing should happen onclick
		menu2.addItem("- Logomarca","logomarca.asp");
		menu2.addItem("- Localização","localiza.asp");
		menu2.addItem("- Cadastro","cadastros2.asp");
		menu2.addItem("- Fotos");
		
		
		//==================================================================================================

		//==================================================================================================
		// add a sub-menu
		//==================================================================================================
		// to add a sub menu to an existing menu object, call it's addMenu method and pass it the item from
		// the parent menu which should act as it's actuator. To add a submenu to the fourth item of a menu
		// called "theMenu", you would do theMenu.addMenu(theMenu.items[3])
		//==================================================================================================
		// submenu
		var subMenu2 = menu2.addMenu(menu2.items[4]);
		subMenu2.addItem("- Construção","obra2.asp");
		subMenu2.addItem("- Inauguração","fotoinau.asp");
		subMenu2.addItem("- Externa","constru.asp");
		subMenu2.addItem("- Interna","interna.asp");
		
		
		// menu
    	var menu5 = ms.addMenu(document.getElementById("menu5"));
		menu5.addItem("- Lançamentos","2008.asp");
		menu5.addItem("- Catálogo 2007","capa.asp");
		menu5.addItem("- Catálogo 2006","catalogo1.asp");
		
		var subMenu5 = menu5.addMenu(menu5.items[1]);
		subMenu5.addItem("Capa","Capa.asp");
		subMenu5.addItem("Página 1","cat1.asp");
		subMenu5.addItem("Página 2","cat2.asp");
		subMenu5.addItem("Página 3","cat3.asp");
		subMenu5.addItem("Página 4","cat4.asp");
		subMenu5.addItem("Página 5","cat5.asp");
		subMenu5.addItem("Página 6","cat6.asp");
		subMenu5.addItem("Página 7","cat7.asp");
		subMenu5.addItem("Página 8","cat8.asp");
		subMenu5.addItem("Página 9","cat9.asp");
		subMenu5.addItem("Página 10","cat10.asp");
		subMenu5.addItem("Contra Capa","final.asp");
		
		var subMenu5 = menu5.addMenu(menu5.items[2]);
		subMenu5.addItem("Página 1","catalogo1.asp");
		subMenu5.addItem("Página 2","catalogo2.asp");
		subMenu5.addItem("Página 3","catalogo3.asp");
		subMenu5.addItem("Página 4","catalogo4.asp");
		subMenu5.addItem("Página 5","catalogo5.asp");
		subMenu5.addItem("Página 6","cataologo6.asp");
		subMenu5.addItem("Página 7","catalogo7.asp");
		subMenu5.addItem("Página 8","catalogo8.asp");
		
		
		
		// menu
		var menu4 = ms.addMenu(document.getElementById("menu4"));
		menu4.addItem("- ACABAMENTOS");
	    menu4.addItem("- TECIDOS");
		menu4.addItem("- MADEIRA","madeiras.asp");
        
		var subMenu4 = menu4.addMenu(menu4.items[0]);
		subMenu4.addItem("<img src=\"http://www.vistamoveis.com.br/btbrancom.jpg\" width=\"16\" height=\"13\"> Branco","brancom.asp");
		subMenu4.addItem("<img src=\"http://www.vistamoveis.com.br/melm.jpg\" width=\"16\" height=\"13\"> Mel","mel.asp");
		subMenu4.addItem("<img src=\"http://www.vistamoveis.com.br/mognom.jpg\" width=\"16\" height=\"13\"> Mogno","mogno.asp");
		subMenu4.addItem("<img src=\"http://www.vistamoveis.com.br/tabacom.jpg\" width=\"16\" height=\"13\"> Tabaco","tabaco.asp");
		
				
		var subMenu4 = menu4.addMenu(menu4.items[1]);
		subMenu4.addItem("<img src=\"t1m.jpg\" width=\"16\" height=\"13\"> Chenille Nobre 71 I","t1.asp");
		subMenu4.addItem("<img src=\"t2m.jpg\" width=\"16\" height=\"13\"> Chenille Nobre 70 H","t2.asp");
		subMenu4.addItem("<img src=\"t3m.jpg\" width=\"16\" height=\"13\"> Chenille Nobre 68 F","t3.asp");
		subMenu4.addItem("<img src=\"t4m.jpg\" width=\"16\" height=\"13\"> Chenille Nobre 67 E","t4.asp");
		subMenu4.addItem("<img src=\"t5m.jpg\" width=\"16\" height=\"13\"> Chenille Bege","t5.asp");
		subMenu4.addItem("<img src=\"t6m.jpg\" width=\"16\" height=\"13\"> Chenille Verde","t6.asp");
		subMenu4.addItem("<img src=\"t7m.jpg\" width=\"16\" height=\"13\"> Chenille Laranja","t7.asp");
		subMenu4.addItem("<img src=\"t8m.jpg\" width=\"16\" height=\"13\"> Chenille Azul","t8.asp");
		subMenu4.addItem("<img src=\"t9m.jpg\" width=\"16\" height=\"13\"> Chenille Marron","t9.asp");
		subMenu4.addItem("<img src=\"t10m.jpg\" width=\"16\" height=\"13\"> Liso Bege","t10.asp");
		subMenu4.addItem("<img src=\"t11m.jpg\" width=\"16\" height=\"13\"> Liso Telha","t11.asp");
		subMenu4.addItem("<img src=\"t12m.jpg\" width=\"16\" height=\"13\"> Liso Vermelho","t12.asp");
		subMenu4.addItem("<img src=\"t13m.jpg\" width=\"16\" height=\"13\"> Corano Branco","t13.asp");
		subMenu4.addItem("<img src=\"t14m.jpg\" width=\"16\" height=\"13\"> Corano Bege","t14.asp");
		subMenu4.addItem("<img src=\"t15m.jpg\" width=\"16\" height=\"13\"> Corano Marron","t15.asp");
		subMenu4.addItem("<img src=\"t16m.jpg\" width=\"16\" height=\"13\"> Corano Verde","t16.asp");
		subMenu4.addItem("<img src=\"t17m.jpg\" width=\"16\" height=\"13\"> Corano Azul","t17.asp");
		subMenu4.addItem("<img src=\"t18m.jpg\" width=\"16\" height=\"13\"> Corano Preto","t18.asp");
		
		
		// menu
		var menu3 = ms.addMenu(document.getElementById("menu3"));
		menu3.addItem("- Mapa","localizacao.asp");
		
		
		// menu
		var menu6 = ms.addMenu(document.getElementById("menu6"));
		menu6.addItem("- Notícias","noticias.asp");
        
		// menu
		
		var menu7 = ms.addMenu(document.getElementById("menu7"));
		menu7.addItem("- Direção","formul.asp");
        menu7.addItem("- Produção","formul2.asp");
        menu7.addItem("- Assistência","formul3.asp");

		//==================================================================================================
		// write drop downs into page
		//==================================================================================================
		// this method writes all the HTML for the menus into the page with document.write(). It must be
		// called within the body of the HTML page.
		//==================================================================================================
		graniteDropDown.renderAll();
	}
