/*
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2004 Frederico Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * 		http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit:
 * 		http://www.fckeditor.net/
 * 
 * File Name: fcktoolbarfontformatcombo.js
 * 	FCKToolbarPanelButton Class: Handles the Fonts combo selector.
 * 
 * Version:  2.0 RC1
 * Modified: 2004-11-19 07:50:49
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
 */

var FCKToolbarFontFormatCombo = function()
{
	this.Command =  FCKCommands.GetCommand( 'FontFormat' ) ;
}

// Inherit from FCKToolbarSpecialCombo.
FCKToolbarFontFormatCombo.prototype = new FCKToolbarSpecialCombo ;

FCKToolbarFontFormatCombo.prototype.GetLabel = function()
{
	return FCKLang.FontFormat ;
}

FCKToolbarFontFormatCombo.prototype.CreateItems = function( targetSpecialCombo )
{
	// Get the format names from the language file.
	var aNames = FCKLang['FontFormats'].split(';') ;
	var oNames = {
		p		: aNames[0],
		pre		: aNames[1],
		address	: aNames[2],
		h1		: aNames[3],
		h2		: aNames[4],
		h3		: aNames[5],
		h4		: aNames[6],
		h5		: aNames[7],
		h6		: aNames[8]
	} ;
	
	if ( document.all )
	{
		var oIds = {
			p		: 'Normal',
			pre		: 'Formatted',
			address	: 'Address',
			h1		: 'Heading 1',
			h2		: 'Heading 2',
			h3		: 'Heading 3',
			h4		: 'Heading 4',
			h5		: 'Heading 5',
			h6		: 'Heading 6'
		} ;
	}
	else
	{
		var oIds = {
			p		: 'p',
			pre		: 'pre',
			address	: 'address',
			h1		: 'h1',
			h2		: 'h2',
			h3		: 'h3',
			h4		: 'h4',
			h5		: 'h5',
			h6		: 'h6'
		} ;
	}

	// Get the available formats from the configuration file.
	var aTags = FCKConfig.FontFormats.split(';') ;
	
	for ( var i = 0 ; i < aTags.length ; i++ )
	{
		this._Combo.AddItem( oIds[aTags[i]], '<' + aTags[i] + '>' + oNames[aTags[i]] + '</' + aTags[i] + '>', oNames[aTags[i]] ) ;
	}
}