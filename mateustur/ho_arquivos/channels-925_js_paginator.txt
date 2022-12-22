
//
// EidoxPaginator
//

// History:
// - Thomas Brattli
// - David G. Miles
// - Carlos Castillo
// - Edgard Pineda

//
// This will hold the main eidoxPaginator object
//
var ep = null;

// Class constructor

function EidoxPaginator(contentDiv,pagesDiv,firstButton,prevButton,nextButton,lastButton,firstEnabled,lastEnabled,prevEnabled,nextEnabled,prevDisabled,nextDisabled,firstDisabled,lastDisabled,pageHeight,pageText,pagesDiv_top,firstButton_top,prevButton_top,nextButton_top,lastButton_top,pageText_top) {
    this.contentDiv		= document.getElementById(contentDiv); // Internal div
	this.pagesDiv		= document.getElementById(pagesDiv);   // Page nums
	this.fullHeight		= this.contentDiv.offsetHeight;        // Total height
	this.pageHeight		= +pageHeight;                         // Force int
	this.totalPages		= Math.ceil( this.fullHeight / this.pageHeight );
	this.firstButton	= firstButton;
	this.prevButton		= prevButton;
	this.nextButton		= nextButton;
	this.lastButton		= lastButton;
	this.pageText		= pageText;

	this.pagesDiv_top		= document.getElementById(pagesDiv_top);   // Page nums
	this.firstButton_top	= firstButton_top;
	this.prevButton_top		= prevButton_top;
	this.nextButton_top		= nextButton_top;
	this.lastButton_top		= lastButton_top;
	this.pageText_top		= pageText_top;

	// Methods
    this.scroll			= EidoxPaginatorScroll;
	this.first			= EidoxPaginatorFirst;
	this.prev			= EidoxPaginatorPrev;
	this.next			= EidoxPaginatorNext;
	this.last			= EidoxPaginatorLast;
	this.buttons		= EidoxPaginatorButtons;
	this.go				= EidoxPaginatorGo;

	// Images
	this.firstEnabled	= firstEnabled;
	this.lastEnabled	= lastEnabled;
	this.prevEnabled	= prevEnabled;
	this.nextEnabled	= nextEnabled;
	this.prevDisabled	= prevDisabled;
	this.nextDisabled	= nextDisabled;
	this.firstDisabled	= firstDisabled;
	this.lastDisabled	= lastDisabled;

	// Init
	this.scroll(0);
    return this 
} 

function EidoxPaginatorGo(n) {
	var y = 0;
	var p = 1;
	while( p < n && p < this.totalPages && this.fullHeight - this.pageHeight > -y ) {
		y -= this.pageHeight;
		p += 1;
	}
	this.scroll(y);
	this.buttons();
}

// Scrolling function

function EidoxPaginatorScroll(y){ 
    this.y=y 
    this.contentDiv.style.top=this.y + 'px';           // 'px' important for mozilla

	var currentPage = 1;
	if( this.y != 0 ) {
		currentPage = Math.round( (-this.y) / this.pageHeight ) + 1;
	}
	var msg = this.pageText;
	if( msg.length ) {
		msg = msg.replace( /\$page/g, currentPage );
		msg = msg.replace( /\$total/g, this.totalPages );
	} else {
		msg = currentPage + "/" + this.totalPages;
	}
	this.pagesDiv.innerHTML = "<span>" + msg + "</span>";
	if(this.pagesDiv_top && this.pageText_top) {
		msg = this.pageText_top;
		if( msg.length ) {
			msg = msg.replace( /\$page/g, currentPage );
			msg = msg.replace( /\$total/g, this.totalPages );
		} else {
			msg = currentPage + "/" + this.totalPages;
		}
		this.pagesDiv_top.innerHTML = "<span>" + msg + "</span>";
	}
} 
 
// First/last page function
function EidoxPaginatorFirst() {
	this.scroll(0);
	this.buttons();
}

function EidoxPaginatorLast() {
	var y = this.y;
	while( this.fullHeight - this.pageHeight > -y ) {
		y -= this.pageHeight;
	}
	this.scroll(y);
	this.buttons();
}

// Previous/next page function

function EidoxPaginatorPrev(delta,objtimeout,timeout) {
	if( this.y < 0 ) {
		if(delta) {
			this.scroll(this.y+delta);
		} else {
			this.scroll(this.y+this.pageHeight);
		}
		if(objtimeout && timeout) {
			this.scrollPrevTimer = setTimeout(objtimeout + '.prev(' + delta + ',"' + objtimeout + '",' + timeout + ')',timeout);
		}
	}
	this.buttons();
}

function EidoxPaginatorNext(delta,objtimeout,timeout) {
	if( this.fullHeight - this.pageHeight > -this.y ) {
		if(delta) {
			this.scroll(this.y-delta);
		} else {
			this.scroll(this.y-this.pageHeight);
		}
		if(objtimeout && timeout) {
			this.scrollNextTimer = setTimeout(objtimeout + '.next(' + delta + ',"' + objtimeout + '",' + timeout + ')',timeout);
		}
	}
	this.buttons();
}

// Update buttons to enable/disable state

function EidoxPaginatorButtons() {
	if( this.y < 0 ) {
		if( this.prevButton ) {
			if( this.prevButton.src != this.prevEnabled.src ) {
				this.prevButton.src = this.prevEnabled.src;
				if( this.firstButton ) this.firstButton.src = this.firstEnabled.src;
			}
		}
		if( this.prevButton_top ) {
			if( this.prevButton_top.src != this.prevEnabled.src ) {
				this.prevButton_top.src = this.prevEnabled.src;
				if( this.firstButton_top ) this.firstButton_top.src = this.firstEnabled.src;
			}
		}
	} else {
		if( this.prevButton ) {
			if( this.prevButton.src != this.prevDisabled.src ) {
				this.prevButton.src = this.prevDisabled.src;
				if( this.firstButton ) this.firstButton.src = this.firstDisabled.src;
			}
		}
		if( this.prevButton_top ) {
			if( this.prevButton_top.src != this.prevDisabled.src ) {
				this.prevButton_top.src = this.prevDisabled.src;
				if( this.firstButton_top ) this.firstButton_top.src = this.firstDisabled.src;
			}
		}
	}
	if( this.fullHeight - this.pageHeight > -this.y ) {
		if( this.nextButton ) {
			if( this.nextButton.src != this.nextEnabled.src ) {
				this.nextButton.src = this.nextEnabled.src;
				if( this.lastButton ) this.lastButton.src = this.lastEnabled.src;
			}
		}
		if( this.nextButton_top ) {
			if( this.nextButton_top.src != this.nextEnabled.src ) {
				this.nextButton_top.src = this.nextEnabled.src;
				if( this.lastButton_top ) this.lastButton_top.src = this.lastEnabled.src;
			}
		}
	} else {
		if( this.nextButton ) {
			if( this.nextButton.src != this.nextDisabled.src ) {
				this.nextButton.src = this.nextDisabled.src;
				if( this.lastButton ) this.lastButton.src = this.lastDisabled.src;
			}
		}
		if( this.nextButton_top ) {
			if( this.nextButton_top.src != this.nextDisabled.src ) {
				this.nextButton_top.src = this.nextDisabled.src;
				if( this.lastButton_top ) this.lastButton_top.src = this.lastDisabled.src;
			}
		}
	}
}
