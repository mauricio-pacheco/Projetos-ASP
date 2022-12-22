<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

// Set Netscape up to run the "captureMousePosition" function whenever
// the mouse is moved. For Internet Explorer and Netscape 6, you can capture
// the movement a little easier.
if (document.layers) { // Netscape
    document.captureEvents(Event.MOUSEMOVE);
    document.onmousemove = captureMousePosition;
} else if (document.all) { // Internet Explorer
    document.onmousemove = captureMousePosition;
} else if (document.getElementById) { // Netcsape 6
    document.onmousemove = captureMousePosition;
}
// Global variables
xMousePos = 0; // Horizontal position of the mouse on the screen
yMousePos = 0; // Vertical position of the mouse on the screen
xMousePosMax = 0; // Width of the page
yMousePosMax = 0; // Height of the page

function captureMousePosition(e) {
    if (document.layers) {
        // When the page scrolls in Netscape, the event's mouse position
        // reflects the absolute position on the screen. innerHight/Width
        // is the position from the top/left of the screen that the user is
        // looking at. pageX/YOffset is the amount that the user has 
        // scrolled into the page. So the values will be in relation to
        // each other as the total offsets into the page, no matter if
        // the user has scrolled or not.
        xMousePos = e.pageX;
        yMousePos = e.pageY;
        xMousePosMax = window.innerWidth+window.pageXOffset;
        yMousePosMax = window.innerHeight+window.pageYOffset;
    } else if (document.all) {
        // When the page scrolls in IE, the event's mouse position 
        // reflects the position from the top/left of the screen the 
        // user is looking at. scrollLeft/Top is the amount the user
        // has scrolled into the page. clientWidth/Height is the height/
        // width of the current page the user is looking at. So, to be
        // consistent with Netscape (above), add the scroll offsets to
        // both so we end up with an absolute value on the page, no 
        // matter if the user has scrolled or not.
        xMousePos = window.event.x+document.body.scrollLeft;
        yMousePos = window.event.y+document.body.scrollTop;
        xMousePosMax = document.body.clientWidth+document.body.scrollLeft;
        yMousePosMax = document.body.clientHeight+document.body.scrollTop;
    } else if (document.getElementById) {
        // Netscape 6 behaves the same as Netscape 4 in this regard 
        xMousePos = e.pageX;
        yMousePos = e.pageY;
        xMousePosMax = window.innerWidth+window.pageXOffset;
        yMousePosMax = window.innerHeight+window.pageYOffset;
    }
	//window.status = "xMousePos=" + xMousePos + ", yMousePos=" + yMousePos + ", xMousePosMax=" + xMousePosMax + ", yMousePosMax=" + yMousePosMax;
}


function WM_checkIn(id) {

/*
Usage: WM_checkIn('id')
*/

  // This function checks for DOM strategy, then 
  // returns an object reference.
  if (document.all) {
    return document.all[id].style;
  } else if(document.layers) {
    return document.layers[id];
  }
}

// set hidden/visible vars for Netscape 4 compatibility
if (document.layers) {
  var hidden = "hide";
  var visible = "show";
} else {
  var hidden = "hidden";
  var visible = "visible";
}
var toggle = "toggle";

function WM_changeVisibility() {
  if (document.layers || document.all) {
    var inc, endInc=arguments.length;
    // run through the args (objects) and set the visibility of each
    for (inc=0; inc<endInc; inc+=2) {
      // get a good object reference
      var daObj = WM_checkIn(arguments[inc]);
      if (arguments[inc+1] == hidden) {
        // hide the object
        daObj.visibility = hidden;
      } else if (arguments[inc+1] == visible) {
        // show the object
        daObj.visibility = visible;
      } else if (arguments[inc+1] == toggle) {
        // toggle the object's visibility
        if (daObj.visibility == visible) {
          daObj.visibility = hidden;
        } else if (daObj.visibility == hidden) {
          daObj.visibility = visible;
        }
      }
    }
  }
}


function WM_moveTo(daObject, endLeft, endTop, numSteps, delay, endFunction) {


  // Declare variables.
  var leftInc, topInc, daObj = new Object;
  // The first time through, create document.WM.WM_moveTo
  if (typeof document.WM == 'undefined'){
    document.WM = new Object;
    document.WM.WM_moveTo = new Object;
  } else if (typeof document.WM.WM_moveTo == 'undefined') {
    document.WM.WM_moveTo = new Object;
  }
  // Store endFunction to execute when the move is finished.
  if(endFunction) document.WM.WM_moveTo.endFunction = endFunction;
  // Get a good object reference (call it daObj) from WM_checkIn().
  // But if we've already done so, don't check it in again.
    if (daObject == "sameObj") {
      daObj = document.WM.WM_moveTo.daObj;
    } else {
      daObj = WM_checkIn(daObject);
      document.WM.WM_moveTo.daObj = daObj;
    }
  // If this is the last step, go to the end point and run endFunction.
  if (numSteps == 1) {
    daObj.left = endLeft;
    daObj.top = endTop;
    // If an endFunction was set, execute it and then delete it.
    if(document.WM.WM_moveTo.endFunction) {
      daFunction = document.WM.WM_moveTo.endFunction;
      document.WM.WM_moveTo.endFunction = '';
      eval(daFunction);
    }
  } else {
    // Otherwise, figure out how far to move.
    leftInc = (endLeft - parseInt(daObj.left)) / numSteps;
    topInc = (endTop - parseInt(daObj.top)) / numSteps;
    // Then move, decrement numSteps, and do it all again.
    daObj.left = parseInt(daObj.left) + leftInc;
    daObj.top = parseInt(daObj.top) + topInc;
    numSteps--;
    setTimeout ('WM_moveTo(\'sameObj\', ' + endLeft + ', ' + endTop + ', ' + numSteps + ', ' + delay + ')', delay);
  }
}

function togglemenu(id) {
	var menuimg = document.getElementById("menuimg" + id);
	var submenuimg = document.getElementById("submenuimg" + id);
	var children = document.getElementById("childitems" + id);
	
	if(menuimg) {
		if(menuimg.src == urlRoot + "/images/menu_arrow_right.gif") {
			menuimg.src = urlRoot + "/images/menu_arrow_down.gif";
		}
		else {
			menuimg.src = urlRoot + "/images/menu_arrow_right.gif";
		}
	}
	
	if(submenuimg) {
		if(submenuimg.src == urlRoot + "/images/submenu_arrow_right.gif") {
			submenuimg.src = urlRoot + "/images/submenu_arrow_down.gif";
		}
		else {
			submenuimg.src = urlRoot + "/images/submenu_arrow_right.gif";
		}
	}
	
	if(children) {
		if(children.className == "collapsedchild") {
			children.className = "expandedchild";
		}
		else {
			children.className = "collapsedchild";
		}
	}
}


//-->