		var preloaded = [];

		// here is a lame preloading script i am putting in just for demonstration
		for (var i = 1; i <= 7; i++) {
			preloaded[i] = [loadImage(i + "-0.gif"), loadImage(i + "-1.gif")];
		}

		function init() {
			// whatever stuff you need to do onload goes here.

			//==========================================================================================
			// if supported, initialize graniteDropDowns
			//==========================================================================================
			// Check isSupported() so that menus aren't accidentally sent to non-supporting browsers.
			// This is better than server-side checking because it will also catch browsers which would
			// normally support the menus but have javascript disabled.
			//
			// If supported, call initialize() and then hook whatever image rollover code you need to do
			// to the .onactivate and .ondeactivate events for each menu.
			//==========================================================================================
			if (graniteDropDown.isSupported()) {
				graniteDropDown.initialize();

				// hook all the image swapping of the main toolbar to menu activation/deactivation
				// instead of simple rollover to get the effect where the button stays hightlit until
				// the menu is closed.

				//menu1.onactivate = function() { swapImage("button1", preloaded[1][1].src) };
				//menu1.ondeactivate = function() { swapImage("button1", preloaded[1][0].src) };

				menu2.onactivate = function() { swapImage("button2", preloaded[2][1].src) };
				if(section == "About"){
					menu2.ondeactivate = function() { swapImage("button2", preloaded[2][1].src) };
				} else {
					menu2.ondeactivate = function() { swapImage("button2", preloaded[2][0].src) };
				}

				menu3.onactivate = function() { swapImage("button3", preloaded[3][1].src) };
				if(section == "CServices"){
					menu3.ondeactivate = function() { swapImage("button3", preloaded[3][1].src) };
				} else {
					menu3.ondeactivate = function() { swapImage("button3", preloaded[3][0].src) };
				}

				menu4.onactivate = function() { swapImage("button4", preloaded[4][1].src) };
				if(section == "CMaterials"){
					menu4.ondeactivate = function() { swapImage("button4", preloaded[4][1].src) };
				} else {
					menu4.ondeactivate = function() { swapImage("button4", preloaded[4][0].src) };
				}

				menu5.onactivate = function() { swapImage("button5", preloaded[5][1].src) };
				if(section == "IR"){
					menu5.ondeactivate = function() { swapImage("button5", preloaded[5][1].src) };
				} else if (section == "Home") {
					menu5.ondeactivate = function() { swapImage("button5", preloaded[5][0].src); document.getElementById('HomePageLinks').style.visibility = 'visible'; };
				} else {
					menu5.ondeactivate = function() { swapImage("button5", preloaded[5][0].src) };
				}

				menu6.onactivate = function() { swapImage("button6", preloaded[6][1].src) };
				if(section == "Careers"){
					menu6.ondeactivate = function() { swapImage("button6", preloaded[6][1].src) };
				} else {
					menu6.ondeactivate = function() { swapImage("button6", preloaded[6][0].src) };
				}

				menu7.onactivate = function() { swapImage("button7", preloaded[7][1].src) };
				if(section == "Contact"){
					menu7.ondeactivate = function() { swapImage("button7", preloaded[7][1].src) };
				} else {
					menu7.ondeactivate = function() { swapImage("button7", preloaded[7][0].src) };
				}
			}
		}


		function loadImage(sFilename) {
			var img = new Image();
			img.src ="" + sFilename;
			return img;
		}


		function swapImage(imgName, sFilename) {
			document.images[imgName].src = sFilename;
		}