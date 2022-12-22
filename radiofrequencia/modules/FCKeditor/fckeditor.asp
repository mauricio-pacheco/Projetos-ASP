<!--
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2004 Frederico Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * 		http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit:
 * 		http://www.fckeditor.net/
 * 
 * File Name: fckeditor.asp
 * 	This is the integration file for ASP.
 * 	
 * 	It defines the FCKeditor class that can be used to create editor
 * 	instances in ASP pages on server side.
 * 
 * Version:  2.0 RC1
 * Modified: 2004-10-30 01:37:29
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
-->
<%
Class FCKeditor

	private sBasePath
	private sInstanceName
	private sWidth
	private sHeight
	private sToolbarSet
	private sValue

	private oConfig

	Private Sub Class_Initialize()
		sBasePath		= "/FCKeditor/"
		sWidth			= "100%"
		sHeight			= "200"
		sToolbarSet		= "Default"
		sValue			= ""

		Set oConfig = CreateObject("Scripting.Dictionary")
	End Sub

	Public Property Let BasePath( basePathValue )
		sBasePath = basePathValue
	End Property

	Public Property Let InstanceName( instanceNameValue )
		sInstanceName = instanceNameValue
	End Property

	Public Property Let Width( widthValue )
		sWidth = widthValue
	End Property

	Public Property Let Height( heightValue )
		sHeight = heightValue
	End Property

	Public Property Let ToolbarSet( toolbarSetValue )
		sToolbarSet = toolbarSetValue
	End Property

	Public Property Let Value( newValue )
		sValue = newValue
	End Property

	Public Property Let Config( configKey, configValue )
		oConfig.Add configKey, configValue
	End Property

	Public Function Create( instanceName )

		Response.Write "<div>"

		If IsCompatible() Then

			Dim sLink
			sLink = sBasePath & "editor/fckeditor.html?InstanceName=" + instanceName
			
			If (sToolbarSet & "") <> "" Then
				sLink = sLink + "&Toolbar=" & sToolbarSet
			End If

			' Render the linked hidden field.
			Response.Write "<input type=""hidden"" id=""" & instanceName & """ name=""" & instanceName & """ value=""" & Server.HTMLEncode( sValue ) & """>"

			' Render the configurations hidden field.
			Response.Write "<input type=""hidden"" id=""" & instanceName & "___Config"" value=""" & GetConfigFieldString() & """>"

			' Render the editor IFRAME.
			Response.Write "<iframe id=""" & instanceName & "___Frame"" src=""" & sLink & """ width=""" & sWidth & """ height=""" & sHeight & """ frameborder=""no"" scrolling=""no""></iframe>"

		Else

			Dim sWidthCSS, sHeightCSS

			If InStr( sWidth, "%" ) > 0  Then
				sWidthCSS = sWidth
			Else
				sWidthCSS = sWidth & "px"
			End If

			If InStr( sHeight, "%" ) > 0  Then
				sHeightCSS = sHeight
			Else
				sHeightCSS = sHeight & "px"
			End If

			Response.Write "<textarea name=""" & instanceName & """ rows=""4"" cols=""40"" style=""width: " & sWidthCSS & "; height: " & sHeightCSS & """ wrap=""virtual"">" & Server.HTMLEncode( sValue ) & "</textarea>"

		End If

		Response.Write "</div>"

	End Function

	Private Function IsCompatible()

		Dim sAgent
		sAgent = Request.ServerVariables("HTTP_USER_AGENT") 
		
		Dim iVersion

		If InStr(sAgent, "MSIE") > 0 AND InStr(sAgent, "mac") <= 0  AND InStr(sAgent, "Opera") <= 0 Then
			iVersion = CInt(Mid(sAgent, InStr(sAgent, "MSIE") + 5, 3)) 
			IsCompatible = ( iVersion >= 5.5 )
		ElseIf InStr(sAgent, "Gecko") > 0 Then
			iVersion = CInt(Mid(sAgent, InStr(sAgent, "Gecko/") + 7, 8)) 
			IsCompatible = ( iVersion >= 20030210 )
		Else
			IsCompatible = False
		End If

	End Function

	Private Function GetConfigFieldString()

		Dim sParams
		
		Dim bFirst
		bFirst = True

		For Each sKey in oConfig

			If bFirst = False Then
				sParams = sParams & "&"
			Else
				bFirst = False
			End If
			
			sParams = sParams & Server.HTMLEncode( sKey ) & "=" & Server.HTMLEncode( oConfig(sKey) )

		Next
		
		GetConfigFieldString = sParams

	End Function

End Class
%>