		function init() {
		
			if (TransMenu.isSupported()) {
				TransMenu.initialize();

				
				menu1.onactivate = function() { document.getElementById("ajansspor").className = "hover"; };
				menu1.ondeactivate = function() { document.getElementById("ajansspor").className = ""; };

			
				menu2.onactivate = function() { document.getElementById("formula").className = "hover"; };
				menu2.ondeactivate = function() { document.getElementById("formula").className = ""; };
				
				menu3.onactivate = function() { document.getElementById("futbol").className = "hover"; };
				menu3.ondeactivate = function() { document.getElementById("futbol").className = ""; };
				
				menu4.onactivate = function() { document.getElementById("basketbol").className = "hover"; };
				menu4.ondeactivate = function() { document.getElementById("basketbol").className = ""; };
		
				menu5.onactivate = function() { document.getElementById("voleybol").className = "hover"; };
				menu5.ondeactivate = function() { document.getElementById("voleybol").className = ""; };
				
				menu6.onactivate = function() { document.getElementById("hentbol").className = "hover"; };
				menu6.ondeactivate = function() { document.getElementById("hentbol").className = ""; };
				menu7.onactivate = function() { document.getElementById("motorsporlari").className = "hover"; };
				menu7.ondeactivate = function() { document.getElementById("motorsporlari").className = ""; };
				menu8.onactivate = function() { document.getElementById("golf").className = "hover"; };
				menu8.ondeactivate = function() { document.getElementById("golf").className = ""; };
				menu9.onactivate = function() { document.getElementById("diger").className = "hover"; };
				menu9.ondeactivate = function() { document.getElementById("diger").className = ""; };
				
				document.getElementById("bos").onmouseover = function() {
					ms.hideCurrent();
					this.className = "hover";
				}

				document.getElementById("bos").onmouseout = function() { this.className = ""; }
			}
		}