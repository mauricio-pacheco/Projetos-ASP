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
 * File Name: fckcontextmenuseparator.js
 * 	FCKContextMenuSeparator Class: represents a separator in the toolbar.
 * 
 * Version:  2.0 RC1
 * Modified: 2004-05-31 23:07:47
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
 */

var FCKContextMenuSeparator = function()
{
}

FCKContextMenuSeparator.prototype.CreateTableRow = function( targetTable )
{
	// Creates the <TR> element.
	this._Row = targetTable.insertRow(-1) ;
	this._Row.className = 'CM_Separator' ;
	
	var oCell = this._Row.insertCell(-1) ;
	oCell.className = 'CM_Icon' ;
	
	oCell = this._Row.insertCell(-1) ;
	oCell.className = 'CM_Label' ;
	oCell.innerHTML = '<div></div>' ;
}

FCKContextMenuSeparator.prototype.SetVisible = function( isVisible )
{
	this._Row.style.display = isVisible ? '' : 'none' ;
}

FCKContextMenuSeparator.prototype.RefreshState = function()
{
	// Do nothing... its state doesn't change.
} 

/*
Sample output.
-----------------------------------------
<tr class="CM_Separator">
	<td class="CM_Icon"></td>
	<td class="CM_Label"><div></div></td>
</tr>
*/