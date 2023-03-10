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
 * File Name: fck_othercommands.js
 * 	Definition of other commands that are not available internaly in the
 * 	browser (see FCKNamedCommand).
 * 
 * Version:  2.0 RC1
 * Modified: 2004-11-22 15:40:30
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
 */

// ### General Dialog Box Commands.
var FCKDialogCommand = function( name, title, url, width, height, getStateFunction, getStateParam )
{
	this.Name	= name ;
	this.Title	= title ;
	this.Url	= url ;
	this.Width	= width ;
	this.Height	= height ;
	
	this.GetStateFunction	= getStateFunction ;
	this.GetStateParam		= getStateParam ;
}

FCKDialogCommand.prototype.Execute = function()
{
	FCKDialog.OpenDialog( 'FCKDialog_' + this.Name , this.Title, this.Url, this.Width, this.Height ) ;
}

FCKDialogCommand.prototype.GetState = function()
{
	if ( this.GetStateFunction )
		return this.GetStateFunction( this.GetStateParam ) ;
	else
		return FCK_TRISTATE_OFF ;
}

// Generic Undefined command (usually used when a command is under development).
var FCKUndefinedCommand = function()
{
	this.Name = 'Undefined' ;
}

FCKUndefinedCommand.prototype.Execute = function()
{
	alert( FCKLang.NotImplemented ) ;
} 

FCKUndefinedCommand.prototype.GetState = function()
{
	return FCK_TRISTATE_OFF ;
}

// ### FontName
var FCKFontNameCommand = function() 
{
	this.Name = 'FontName' ;
}

FCKFontNameCommand.prototype.Execute = function( fontName )
{
	if (fontName == null || fontName == "")
	{
		// TODO: Remove font name attribute.
	}
	else
		FCK.ExecuteNamedCommand( 'FontName', fontName ) ;
}

FCKFontNameCommand.prototype.GetState = function()
{
	return FCK.GetNamedCommandValue( 'FontName' ) ;
}

// ### FontSize
var FCKFontSizeCommand = function() 
{
	this.Name = 'FontSize' ;
}

FCKFontSizeCommand.prototype.Execute = function( fontSize )
{
	if ( typeof( fontSize ) == 'string' ) fontSize = parseInt(fontSize) ;
	
	if ( fontSize == null || fontSize == '' )
	{
		// TODO: Remove font size attribute (Now it works with size 3. Will it work forever?)
		FCK.ExecuteNamedCommand( 'FontSize', 3 ) ;
	}
	else
		FCK.ExecuteNamedCommand( 'FontSize', fontSize ) ;
}

FCKFontSizeCommand.prototype.GetState = function()
{
	return FCK.GetNamedCommandValue( 'FontSize' ) ;
}

// ### FormatBlock
var FCKFormatBlockCommand = function() 
{
	this.Name = 'FormatBlock' ;
}

FCKFormatBlockCommand.prototype.Execute = function( formatName )
{
	if ( formatName == null || formatName == '' )
		FCK.ExecuteNamedCommand( 'FormatBlock', '<P>' ) ;
	else
		FCK.ExecuteNamedCommand( 'FormatBlock', formatName ) ;
}

FCKFormatBlockCommand.prototype.GetState = function()
{
	return FCK.GetNamedCommandValue( 'FormatBlock' ) ;
}

// ### Preview
var FCKPreviewCommand = function() 
{
	this.Name = 'Preview' ;
}

FCKPreviewCommand.prototype.Execute = function()
{
     FCK.Preview() ;
}

FCKPreviewCommand.prototype.GetState = function()
{
	return FCK_TRISTATE_OFF ;
}

// ### Save
var FCKSaveCommand = function() 
{
	this.Name = 'Save' ;
}

FCKSaveCommand.prototype.Execute = function()
{
	// Get the linked field form.
	var oForm = FCK.LinkedField.form ;
	
	// Submit the form.
	oForm.submit() ;
}

FCKSaveCommand.prototype.GetState = function()
{
	return FCK_TRISTATE_OFF ;
}

// ### NewPage
var FCKNewPageCommand = function() 
{
	this.Name = 'NewPage' ;
}

FCKNewPageCommand.prototype.Execute = function()
{
	FCK.SetHTML( '' ) ;
}

FCKNewPageCommand.prototype.GetState = function()
{
	return FCK_TRISTATE_OFF ;
}

// ### Source button
var FCKSourceCommand = function()
{
	this.Name = "Source" ;
}

FCKSourceCommand.prototype.Execute = function()
{
     FCK.SwitchEditMode() ;
}

FCKSourceCommand.prototype.GetState = function()
{
	return ( FCK.EditMode == FCK_EDITMODE_WYSIWYG ? FCK_TRISTATE_OFF : FCK_TRISTATE_ON ) ;
}