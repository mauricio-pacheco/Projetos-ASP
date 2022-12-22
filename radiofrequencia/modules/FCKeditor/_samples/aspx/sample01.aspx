<%@ Page ValidateRequest="false" Language="C#" AutoEventWireup="false" %>
<%@ Register TagPrefix="fckeditorv2" Namespace="FredCK.FCKeditorV2" Assembly="FredCK.FCKeditorV2" %>
<%--
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2004 Frederico Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * 		http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit:
 * 		http://www.fckeditor.net/
 * 
 * File Name: sample01.aspx
 * 	Sample page.
 * 
 * Version:  2.0 RC1
 * Modified: 2004-11-13 01:12:40
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
--%>
<script runat="server" language="C#">
	// This sample doesnt use a code behind file to avoid the user to have to compile
	// the page to run it.
	protected override void OnLoad(EventArgs e)
	{
		// Automatically calculates the editor base path based on the _samples directory.
		// This is usefull only for these samples. A real application should use something like this:
		// FCKeditor1.BasePath = '/fckeditor/' ;	// '/fckeditor/' is the default value.
		string sPath = Request.Url.AbsolutePath ;
		int iIndex = sPath.LastIndexOf( "_samples") ;
		FCKeditor1.BasePath = sPath.Remove( iIndex, sPath.Length - iIndex  ) ;
	}
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FCKeditor - Sample</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="robots" content="noindex, nofollow">
		<link href="../sample.css" rel="stylesheet" type="text/css">
			<script type="text/javascript" src="../../fckeditor.js"></script>
			<script type="text/javascript">

function FCKeditor_OnComplete( editorInstance )
{
	window.status = editorInstance.Description ;
}

			</script>
	</HEAD>
	<body>
		<h1>FCKeditor - ASP.Net - Sample 1</h1>
		This sample displays a normal HTML form with an FCKeditor with full features 
		enabled.
		<hr>
		<form action="sampleposteddata.aspx" method="post" target="_blank">
			<FCKeditorV2:FCKeditor id="FCKeditor1" runat="server" value='This is some <strong>sample text</strong>. You are using <a href="http://www.fckeditor.net/">FCKeditor</a>.'></FCKeditorV2:FCKeditor>
			<br>
			<input type="submit" value="Submit">
		</form>
	</body>
</HTML>
