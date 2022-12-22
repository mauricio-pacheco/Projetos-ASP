<%
'####################################
'## Application:   Blue-Collar Productions
'## File Name:     lang_system.inc (Language File)
'## File Version:  i-Gallery
'## Notice:        This code has limited warranties. Please see http://www.b-cp.com for details.
'####################################
%>

<%
'## system.asp & system-firsttime.asp
CONST IGsys_titl 	= "i-Gallery System Settings"
CONST IGsys_ex 		= "EX"
CONST IGsys_mf 		= "MainFolder"
CONST IGsys_yes 	= "Yes"
CONST IGsys_no	 	= "No"
CONST IGsys_on	 	= "On"
CONST IGsys_off 	= "Off"
CONST IGsys_strt 	= "Start"
CONST IGsys_end 	= "End"
CONST IGsys_fnt 	= "Font"
CONST IGsys_dflt 	= "Default"
CONST IGsys_but 	= "Update i-Gallery Settings"
CONST IGsys_forml 	= "Name of Gallery"
CONST IGsys_notel 	= "<b>Note:</b> The gallery name is displayed above the folders in the left menu.  Careful on the size as the name will wrap."
CONST IGsys_data 	= "<b>Database Location & Folder Properties</b>"
CONST IGsys_datamsg = "The DB connection strings are stored in the page "">>include>>connection.asp"".&nbsp; If for some reason you need to move the i-Gallery database to an alternate folder (better security) make sure to adjust the location from within that page.&nbsp; You can also choose what type of connection you would like to use for i-Gallery (Server.MapPath -or- Direct)."
CONST IGsys_modmsg 	= "<font class=""textxsm"" style=""color: #CC0000;""><b>NOTE: </b></font><font class=""textxsm""> Although the database folder identified in the connection.asp page has the appropriate <b>""Read/Write""</b> permissions for i-Gallery to function properly, it does not have <b>""Modify""</b> permission (delete) and therefore the online ""Compact & Repair"" feature has been disabled.<br>"
CONST IGsys_datapth = "Database Path"
CONST IGsys_prop1   = "Folder Properties"
CONST IGsys_prop1a  = "Read & Write Only"
CONST IGsys_prop1b  = "Read, Write & Modify"
CONST IGsys_sec1 	= "<b>Main Gallery Folder Location</b> <font class=""textxsm"">[Main Photo Location]</font>"
CONST IGsys_sec1msg = "<b>Please Note:</b>  The folder you identify below is the main gallery folder that you intend to use for all of your sub-folders and photo's.  i-Gallery unzips with a folder called ""Upload"" that is used in all of our instructions as the main gallery folder.  The ""Upload"" folder does not need to be your main gallery folder, you just need to identify the correct paths to the main folder you intend on using!  Both of the paths below are critical in the successful operation of i-Gallery."
CONST IGsys_form2 	= "Physical Path"
CONST IGsys_note2 	= "<font class=""textxsm"" style=""color: #CC0000;""><b>NOTE: </b></font><font class=""textxsm"">Altering this line of code may result in i-Gallery not functioning properly.  Please make sure you enter the correct path if you are moving your image gallery to an alternate folder."
CONST IGsys_form3 	= "Resource Locator"
CONST IGsys_note3 	= "<b>Note:</b> This locator is used throughout i-Gallery for image display.  Make sure it points to your main image folder."
CONST IGsys_sec2 	= "System Settings"
CONST IGsys_form4 	= "Thumbnailer App."
CONST IGsys_form4a 	= "ASPJpeg - $195.00 US"
CONST IGsys_form4b 	= "ASPImage - $69.95 US"
CONST IGsys_form4c 	= "Crazy Beaver .dll (2.2) - FREE"
CONST IGsys_form4d 	= "None"
CONST IGsys_form4e 	= "Auto-Detect Thumbnail Com's"
CONST IGsys_note4 	= "<b>Note:</b>  i-Gallery now supports [2] thumbnailing COM's and [1] .DLL.  Make your thumbnailing selection here if you have any of the supported COM's or choose the FREE <a class=""linkxsm"" href=""http://www.crazybeavers.se/products_imagerresizer.asp"" target=""_blank"">CrazyBeaver</a> Imager.dll if you have installed it on your server.  The default setting is ""None""."
CONST IGsys_form5 	= "Imager.dll Location"
CONST IGsys_note5 	= "<b>Note:</b> The <a class=""linkxsm"" href=""http://www.crazybeavers.se/Documentation/Imager_Resizer/installation.html"" target=""_blank"">CrazyBeaver</a> Imager.dll and the <a class=""linkxsm"" href=""http://www.crazybeavers.se/Documentation/Imager_Resizer/installation.html"" target=""_blank"">cls_Imager.asp</a> file must be placed in a folder with ""Scripts and Executables"" permissions enabled."
CONST IGsys_form6 	= "Date Format"
CONST IGsys_note6 	= "<b>Note:</b> i-Gallery uses a date/time stamp for logging users and images. Some servers are extremely picky about this. The default setting is MM/DD/YYYY - U.S."
CONST IGsys_form7 	= "Folders Per Row"
CONST IGsys_note7 	= "<b>Note:</b> Keep in mind those smaller monitors out there.  Not everybody has the same resoulution as you! Default Value: 4"
CONST IGsys_form8 	= "Records Per Row"
CONST IGsys_note8 	= "<b>Note:</b> Eh Eh Hummm... Resolution reminder! Default Value: 3"
CONST IGsys_form9 	= "Records Per Page"
CONST IGsys_note9 	= "<b>Note:</b> Number of images to display per page.  This number must be divisible by the ""Records Per Row"" selection above or will be altered during submission. Default Value: 12"
CONST IGsys_note9a 	= "<b>Note:</b>  Number of images to display per page."
CONST IGsys_form10 	= "Max. Upload Size"
CONST IGsys_note10 	= "<b>Note:</b>  Maximum allowed image upload size for administrators and photo submissions."
CONST IGsys_form11 	= "Admin's Email"
CONST IGsys_note11 	= "<b>Note:</b> Address used for outgoing emails."
CONST IGsys_form12 	= "Email Server"
CONST IGsys_note12 	= "<b>Note:</b> Outgoing SMTP for your server.  Usually something like ""mail.yourdomain.com""."
CONST IGsys_form13 	= "Email Application"
CONST IGsys_form13a = "Auto-Detect Installed Email Com's"
CONST IGsys_note13 	= "<b>Note:</b> If your not sure what email com's are registered on your server i-Gallery can look them up for you."
CONST IGsys_form14 	= "Allow Online Photo Submissions"
CONST IGsys_note14 	= "<b>Note:</b> Activating this feature allows anonymous photo submissions from your Web.  Users will be able to email pictures limited to the ""Max. Upload Size"" above."
CONST IGsys_form15 	= "Message Board"
CONST IGsys_note15 	= "<b>Note:</b> I realize it can be annoying but how else are you going to know about i-Gallery updates and revisions?"
CONST IGsys_form16 	= "Allowed File Types"
CONST IGsys_note16 	= "<b>Note:</b> The default allowed file types are: <b>jpg, jpeg, gif, bmp, png</b><br>i-Gallery now supports most audio and video files!  You know you like that."
CONST IGsys_sec3 	= "Thumbnail Display Settings"
CONST IGsys_form17 	= "Title Max Size"
CONST IGsys_note17 	= "<b>Note:</b> Default is [20].  Careful on the image title size as the title will wrap and can cause the program view to look distorted."
CONST IGsys_form18 	= "Image History"
CONST IGsys_form19 	= "Image Toolbar"
CONST IGsys_note19 	= "<b>Note:</b> The toolbar allows rotation [left, center, right] of the displayed thumbnails.  This is just a cosmetic rotation and does not effect the actual image."
CONST IGsys_form20 	= "Image Voting"
CONST IGsys_form21 	= "Description"
CONST IGsys_form21a = "Max"
CONST IGsys_note21 	= "<b>Note:</b> Default is [250].  Careful on the image descriptions size as the description wraps down and can cause the program view to look distorted."
CONST IGsys_sec4 	= "Slideshow Settings"
CONST IGsys_form22 	= "Slideshow"
CONST IGsys_note22 	= "<b>Note:</b>  Default value ""On""."
CONST IGsys_form23 	= "Delay Speed"
CONST IGsys_form23a = "10 Seconds"
CONST IGsys_form23b = "15 Seconds"
CONST IGsys_form23c = "20 Seconds"
CONST IGsys_form23d = "25 Seconds"
CONST IGsys_form23e = "30 Seconds"
CONST IGsys_form23f = "1 Minute"
CONST IGsys_note23 	= "<b>Note:</b> Delay in seconds between images."
CONST IGsys_form24 	= "Transition Effect"
CONST IGsys_form24a = "Gradient Wipe"
CONST IGsys_form24b = "Pixelate"
CONST IGsys_form24c = "Fade"
CONST IGsys_form24d = "Slide"
CONST IGsys_form24e = "Random Dissolve"
CONST IGsys_form24f = "No Transition Effect"
CONST IGsys_note24 	= "<b>Note:</b>  Effect used to transition from one image to the next."
CONST IGsys_sec5 	= "Miscellaneous Display Settings"
CONST IGsys_form25 	= "i-Gallery Bar"
CONST IGsys_form26 	= "Viewer Bar"
CONST IGsys_form27 	= "Viewer<br>Background"
CONST IGsys_note28 	= "<b>Note:</b> Image viewer background."
CONST IGsys_idpv1 	= "<b>ERROR:</b> The folder listed above does not exist.  Please make your correction then re-submit!"
CONST IGsys_idpv2 	= "<b>ERROR:</b> The folder listed above does not have <b>""Write""</b> permissions.  Please make the correction on your server then re-submit!"
CONST IGsys_idpv3 	= "<b>ERROR:</b> Although the folder above has <b>""Write""</b> permissions set properly it does not have <b>""Modify""</b> permissions set (delete).  Please make the correction on your server then re-submit!"
CONST IGsys_idpv4 	= "<b>ERROR:</b> The ADODB object <I>Stream</I> is not available on your server.  Check the requirements page for information about i-Gallery's minimum requirements."
CONST IGsys_ps 	    = "PLEASE STOP!"
CONST IGsys_psmsg   = "There is a problem with the directory you have assigned as the main image folder.&nbsp; Please check the warning message under the ""Physical Path"" input field."
CONST IGsys_gtg     = "GOOD TO GO!"
CONST IGsys_gtgmsg1 = "The ""Physical Path"" of your image directory has been verified and is configured properly."
CONST IGsys_gtgmsg2 = "We <font style=""color: #CC0000;""><b>STRONGLY</b></font> recommend deleting the file <font style=""color: #CC0000;"">""<b>system-firsttime.asp</b>""</FONT> from your server at this point!  This file is unsecured and can be accessed by anyone familiar with i-Gallery.  You can adjust your settings in the future by logging into i-Gallery as an administrator."
CONST IGsys_gtgmsg3 = "Click Here To Continue!"
CONST IGsys_sftmsg1 = "It appears that this is the first time you have run i-Gallery or you have some errors in your system setup.&nbsp; i-Gallery needs some basic settings to run on your server.&nbsp; Please take a few minutes to fill in the boxes below."
CONST IGsys_sftmsg2 = "<b>Please Note:</b> More features are available in the ""System Maintenance"" section of i-Gallery.  To access these settings log-in to i-Gallery after completing this section."

'## comcheck.asp
CONST IGcom_em1 	= "Email Component Check"
CONST IGcom_em2 	= "i-Gallery has detected the following email components on your server."
CONST IGcom_tn1 	= "Thumbnailer Com Check"
CONST IGcom_tn2 	= "i-Gallery has detected the following thumbnailing components on your server."
%>