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
 * File Name: fck_2_gecko.js
 * 	This is the second part of the "FCK" object creation. This is the main
 * 	object that represents an editor instance.
 * 	(Gecko specific implementations)
 * 
 * Version:  2.0 RC1
 * Modified: 2004-11-22 13:04:20
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
 */

// GetNamedCommandState overload for Gecko.
FCK._BaseGetNamedCommandState = FCK.GetNamedCommandState ;
FCK.GetNamedCommandState = function( commandName )
{
	switch ( commandName )
	{
		case 'Unlink' :
			return FCKSelection.HasAncestorNode('A') ? FCK_TRISTATE_OFF : FCK_TRISTATE_DISABLED ;
		default :
			return FCK._BaseGetNamedCommandState( commandName ) ;
	}
}

// ExecuteNamedCommand overload for Gecko.
FCK._BaseExecuteNamedCommand = FCK.ExecuteNamedCommand ;
FCK.ExecuteNamedCommand = function( commandName, commandParameter )
{
	switch ( commandName )
	{
		case 'Print' :
			FCK.EditorWindow.print() ;
			break ;
		case 'Paste' :
			try			{ if ( FCK.Paste() ) FCK._BaseExecuteNamedCommand( 'Paste' ) ; }
			catch (e)	{ alert( FCKLang.PasteErrorPaste ) ; }
			break ;
		case 'Cut' :
			try			{ FCK._BaseExecuteNamedCommand( 'Cut' ) ; }
			catch (e)	{ alert( FCKLang.PasteErrorCut ) ; }
			break ;
		case 'Copy' :
			try			{ FCK._BaseExecuteNamedCommand( 'Copy' ) ; }
			catch (e)	{ alert( FCKLang.PasteErrorCopy ) ; }
			break ;
		default :
			FCK._BaseExecuteNamedCommand( commandName, commandParameter ) ;
	}
}

FCK.AttachToOnSelectionChange = function( functionPointer )
{
	this.Events.AttachEvent( 'OnSelectionChange', functionPointer ) ;
}

FCK.Paste = function()
{
	if ( FCKConfig.ForcePasteAsPlainText )
	{
		FCK.PasteAsPlainText() ;	
		return false ;
	}
	else if ( FCKConfig.AutoDetectPasteFromWord && FCKBrowserInfo.IsIE55OrMore )
	{
		var sHTML = FCK.GetClipboardHTML() ;
		var re = /<\w[^>]* class="?MsoNormal"?/gi ;
		if ( re.test( sHTML ) )
		{
			if ( confirm( FCKLang["PasteWordConfirm"] ) )
			{
				FCK.CleanAndPaste( sHTML ) ;
				return false ;
			}
		}
	}
	else
		return true ;
}

//**
// FCK.InsertHtml: Inserts HTML at the current cursor location. Deletes the
// selected content if any.
FCK.InsertHtml = function( html )
{
	// Delete the actual selection.
	var oSel = FCKSelection.Delete() ;
	
//	var oContainer	= oSel.getRangeAt(0).startContainer ;
//	var iOffSet		= oSel.getRangeAt(0).startOffset ;
	
	// Get the first available range.
	var oRange = oSel.getRangeAt(0) ;
	
//	var oRange = this.EditorDocument.createRange() ;
//	oRange.setStart( oContainer, iOffSet ) ;
//	oRange.setEnd( oContainer, iOffSet ) ;
	
	// Create a fragment with the input HTML.
	var oFragment = oRange.createContextualFragment( html ) ;
	
	// Get the last available node.
	var oLastNode = oFragment.lastChild ;

	// Insert the fragment in the range.
	oRange.insertNode(oFragment) ;
	
	// Set the cursor after the inserted fragment.
	oRange.setEndAfter( oLastNode ) ;
	oRange.setStartAfter( oLastNode ) ;
	
	oSel.removeAllRanges() ;
	oSel = FCK.EditorWindow.getSelection() ;
	oSel.addRange( oRange ) ;
		
	this.Focus() ;
}

FCK.InsertElement = function( element )
{
	// Deletes the actual selection.
	var oSel = FCKSelection.Delete() ;
	
	// Gets the first available range.
	var oRange = oSel.getRangeAt(0) ;
	
	// Inserts the element in the range.
	oRange.insertNode( element ) ;
	
	// Set the cursor after the inserted fragment.
	oRange.setEndAfter( element ) ;
	oRange.setStartAfter( element ) ;

	this.Focus() ;
}

FCK.PasteAsPlainText = function()
{
	// TODO: Implement the "Paste as Plain Text" code.
	
	FCKDialog.OpenDialog( 'FCKDialog_Paste', FCKLang.PasteAsText, 'dialog/fck_paste.html', 400, 330, 'PlainText' ) ;
	
/*
	var sText = FCKTools.HTMLEncode( clipboardData.getData("Text") ) ;
	sText = sText.replace( /\n/g, '<BR>' ) ;
	this.InsertHtml( sText ) ;	
*/
}

FCK.PasteFromWord = function()
{
	// TODO: Implement the "Paste as Plain Text" code.
	
	FCKDialog.OpenDialog( 'FCKDialog_Paste', FCKLang.PasteFromWord, 'dialog/fck_paste.html', 400, 330, 'Word' ) ;

//	FCK.CleanAndPaste( FCK.GetClipboardHTML() ) ;
}

FCK.GetClipboardHTML = function()
{
	return '' ;
}

FCK.CreateLink = function( url )
{	
	FCK.ExecuteNamedCommand( 'Unlink' ) ;
	
	if ( url.length > 0 )
	{
		// Generate a temporary name for the link.
		var sTempUrl = 'javascript:void(0);/*' + ( new Date().getTime() ) + '*/' ;
		
		// Use the internal "CreateLink" command to create the link.
		FCK.ExecuteNamedCommand( 'CreateLink', sTempUrl ) ;

		// Retrieve the just created link using XPath.
		var oLink = document.evaluate("//a[@href='" + sTempUrl + "']", this.EditorDocument.body, null, 9, null).singleNodeValue ;
		
		if ( oLink )
		{
			oLink.href = url ;
			return oLink ;
		}
	}
}

