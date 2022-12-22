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
 * File Name: fckxhtml.js
 * 	Defines the FCKXHtml object, responsible for the XHTML operations.
 * 
 * Version:  2.0 RC1
 * Modified: 2004-11-25 00:26:33
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
 */

var FCKXHtml = new Object() ;

FCKXHtml.EmptyElementsRegex = /^(?:BASE|META|LINK|HR|BR|PARAM|IMG|AREA|INPUT)$/i ;

FCKXHtml.GetXHTML = function( node )
{
	// Create the XML DOMDocument objetc.
	if ( window.ActiveXObject )	// IE
		this.XML = new ActiveXObject( 'Msxml2.DOMDocument' ) ;
	else						// Gecko
		this.XML = document.implementation.createDocument( '', '', null ) ;
	
	// Add a root element that holds all child nodes.
	this.MainNode = this.XML.appendChild( this.XML.createElement( 'xhtml' ) ) ;

	// Start recursivelly calling the _AppendNode function.
	this._AppendChildNodes( this.MainNode, node ) ;

	// Get the resulting XHTML as a string.
	var sXHTML = FCKBrowserInfo.IsIE ? this.MainNode.xml : FCKXHtml._GetGeckoNodeXml( this.MainNode ) ;
	
	if ( FCKConfig.ForceSimpleAmpersand )
		sXHTML = sXHTML.replace( /___FCKAmp___/g, '&' ) ;
	
	// Strip the "XHTML" root node.
	return sXHTML.substr( 7, sXHTML.length - 15 )  ;
}

FCKXHtml._GetGeckoNodeXml = function( node )
{
	// Create the XMLSerializer.
	var oSerializer = new XMLSerializer() ;

	// Return the serialized XML as a string.
	// Due to a BUG on Gecko, the special chars sequence "#?-:" must be replaced with "&"
	// for the XHTML entities.
	return oSerializer.serializeToString( node ).replace( FCKXHtmlEntities.GeckoEntitiesMarkerRegex, '&' ) ;
}

FCKXHtml._AppendAttribute = function( xmlNode, attributeName, attributeValue )
{
	// There is a bug in Mozilla that returns '_moz_dirty' as specified.
	if ( attributeName == '_moz_dirty' )
		return ;

	// Create the attribute.
	var oXmlAtt = this.XML.createAttribute( attributeName ) ;
	
	// XHTML doens't support attribute minimization like "CHECKED". It must be trasformed to cheched="checked".
	if ( attributeValue === true )
		oXmlAtt.value = attributeName ;
	else
		oXmlAtt.value = attributeValue ;
	
	// Set the attribute in the node.
	xmlNode.attributes.setNamedItem( oXmlAtt ) ;
}

FCKXHtml._AppendChildNodes = function( xmlNode, htmlNode )
{
	// Get all children nodes.
	var oChildren = htmlNode.childNodes ;

	var i = 0 ;
	while ( i < oChildren.length )
	{
		i += this._AppendNode( xmlNode, oChildren[i] ) ;
	}
	
	// We can't use short representation of empty elements that are not marked
	// as empty in th XHTML DTD.
	if ( i == 0 && ! this.EmptyElementsRegex.test( htmlNode.nodeName ) )
		xmlNode.appendChild( this.XML.createTextNode('') ) ;
}

FCKXHtml._AppendNode = function( xmlNode, htmlNode )
{
	var iAddedNodes = 1 ;
	
	switch ( htmlNode.nodeType )
	{
		// Element Node.
		case 1 :
			// Mozilla insert custom nodes in the DOM.
			if ( FCKBrowserInfo.IsGecko && htmlNode.hasAttribute('_moz_editor_bogus_node') )
				return ;
			
			// Create the Element.
			var sNodeName = htmlNode.nodeName.toLowerCase() ;
			
			// If the nodeName starts with a slash, it is a orphan closing tag.
			if ( sNodeName.substr(0,1) == '/' )
				break ;
				
			var oNode = xmlNode.appendChild( this.XML.createElement( sNodeName ) ) ;

			// Add all attributes.
			var oAttributes = htmlNode.attributes ;
			for ( var n = 0 ; n < oAttributes.length ; n++ )
			{
				var oAttribute = oAttributes[n] ;
				if ( oAttribute.specified )
				{
					var sAttName	= oAttribute.nodeName.toLowerCase() ;

					// The following must be done because of a bug on IE regarding the style
					// attribute. It returns "null" for the nodeValue.
					if ( FCKBrowserInfo.IsIE && sAttName == 'style' )
						var sAttValue = htmlNode.style.cssText ;
					else if ( sAttName == 'class' )
						var sAttValue = oAttribute.nodeValue ;
					else
						var sAttValue = htmlNode.getAttribute( sAttName, 2 ) ;	// We must use getAttribute to get it exactly as it is defined.

					if ( FCKConfig.ForceSimpleAmpersand )
						sAttValue = sAttValue.replace( /&/g, '___FCKAmp___' ) ;
					
					this._AppendAttribute( oNode, sAttName, sAttValue ) ;
				}
			}
			
			// Proccess the node.
			switch ( sNodeName )
			{
				// "SCRIPT" and "STYLE" must be a CDATA.
				case "script" :
				case "style" :
					oNode.appendChild( this.XML.createCDATASection( htmlNode.text ) ) ;
					break ;
				
				// There is a BUG in IE regarding the ABBR tag.
				case "abbr" :
					if ( FCKBrowserInfo.IsIE )
					{
						var oNextNode = htmlNode.nextSibling ;
						while ( true )
						{
							iAddedNodes++ ;
							if ( oNextNode && oNextNode.nodeName != '/ABBR' )
							{
								this._AppendNode( oNode, oNextNode ) ;
								oNextNode = oNextNode.nextSibling ;
							}
							else
								break ;
						}
						break ;
					}
					
				// IE ignores the "COORDS" attribute so we must add it manually.
				case "area" :
					if ( FCKBrowserInfo.IsIE && ! oNode.attributes.getNamedItem( 'coords' ) )
					{
						var sCoords = htmlNode.getAttribute( 'coords', 2 ) ;
						if ( sCoords && sCoords != '0,0,0' )
							this._AppendAttribute( oNode, 'coords', sCoords ) ;
					}
				
				case "img" :
					// The "ALT" attribute is required for XHTML support.
					if ( ! oNode.attributes.getNamedItem( 'alt' ) )
						this._AppendAttribute( oNode, 'alt', '' ) ;
				
				// Recursivelly call the function.
				default :
					this._AppendChildNodes( oNode, htmlNode ) ;
					break ;
			}
			break ;
		
		// Text Node.
		case 3 :
			// We can't just replace the special chars with entities and create a
			// text node with it. We must split the text isolating the special chars
			// and add each piece a time.
			var asPieces = htmlNode.nodeValue.match( FCKXHtmlEntities.EntitiesRegex ) ;
			
			if ( asPieces )
			{
				for ( var i = 0 ; i < asPieces.length ; i++ )
				{
					if ( asPieces[i].length == 1 )
					{
						var sEntity = FCKXHtmlEntities.Entities[ asPieces[i] ] ;
						if ( sEntity != null )
						{
							// There is a BUG on Gecko... createEntityReference returns null.
							if ( FCKBrowserInfo.IsIE )
								var oEnt = this.XML.createEntityReference( sEntity ) ;
							else
								var oEnt = this.XML.createTextNode( '#?-:' + sEntity + ';' ) ;
							xmlNode.appendChild( oEnt ) ;
							continue ;
						}
					}
					xmlNode.appendChild( this.XML.createTextNode( asPieces[i] ) ) ;
				}
			}

			// This is the original code. It doesn't care about the entities.
			//xmlNode.appendChild( this.XML.createTextNode( htmlNode.nodeValue ) ) ;

			break ;
		
		// Comment
		case 8 :
			xmlNode.appendChild( this.XML.createComment( htmlNode.nodeValue ) ) ;
			break ;
		
		// Unknown Node type.
		default :
			xmlNode.appendChild( this.XML.createComment( "Element not supported - Type: " + htmlNode.nodeType + " Name: " + htmlNode.nodeName ) ) ;
			break ;
	}
	
	return iAddedNodes ;
}