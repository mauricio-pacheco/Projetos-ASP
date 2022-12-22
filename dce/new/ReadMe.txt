Web Wiz Guide - Web Wiz Mailing List realease v3.02


****************************************************************************************
**  Copyright Notice    
**
**  Web Wiz Guide - Web Wiz Mailing List
**                                                              
**  Copyright 2001-2002 Bruce Corkhill All Rights Reserved.                                
**
**  This program is free software; you can modify (at your own risk) any part of it 
**  under the terms of the License that accompanies this software and use it both 
**  privately and commercially.
**
**  All copyright notices must remain in tacked in the scripts and the 
**  outputted HTML.
**
**  You may use parts of this program in your own private work, but you may NOT
**  redistribute, repackage, or sell the whole or any part of this program even 
**  if it is modified or reverse engineered in whole or in part without express 
**  permission from the author.
**
**  You may not pass the whole or any part of this application off as your own work.
**   
**  All links to Web Wiz Guide and powered by logo's must remain unchanged and in place
**  and must remain visible when the pages are viewed unless permission is first granted
**  by the copyright holder.
**
**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR ANY OTHER 
**  WARRANTIES WHETHER EXPRESSED OR IMPLIED.
**
**  You should have received a copy of the License along with this program; 
**  if not, write to:- Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom.
**    
**
**  No official support is available for this program but you may post support questions at: -
**  http://www.webwizguide.info/forum
**
**  Support questions are NOT answered by e-mail ever!
**
**  For correspondence or non support questions contact: -
**  info@webwizguide.com
**
**  or at: -
**
**  Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom
**
****************************************************************************************



Introduction
===========================================================================================

Thank you fordownloading this application and hopefully you will find it of benefit to you.

If you have not downloaded this appliaction from Web Wiz Guide then check for the latest
version at: -

http://www.webwizguide.info


This applcation uses ASP and must be run through a web server supporting ASP. 

The CDONTS, CDOSYS, w3 JMail, Persists AspEmail, or Sever Objects AspMail, component must be 
installed on the web server in order to send e-mails using this application. An SMTP server 
also needs to be installed on the server if you are using the CDONTS component.

It has been tested on PWS 4 and IIS 4 and 5 on Windows 2000/XP/NT4/98.

===========================================================================================





!!!!! WARNING !!!!!   -----   IMPORTANT PLEASE READ   -----
===========================================================================================

Please be aware that 99% of web hosts now DO NOT allow the use of mailing lists and sending
bulk email and will suspend your hosting account if you do!!

This is due to the increased use of spam filters and it only takes one complaint to find that
all people who use that web host can no-longer send email to anyone using a spam filter.


WEB WIZ HOSTS
-------------
If you have a hosting account with Web Wiz Hosts, the sending of bulk email is NOT allowed.
Use of this application on a Web Wiz Hosts account will lead to your account being suspended!

===========================================================================================





Using the Web Wiz Mailing List
===========================================================================================

1. Unzip all the files keeping the directory structure intact, most files should be in the 
folder called mailing_list.

2. Files must be run through an ASP enabled web server or on ASP enabled web space. (check 
with your hosting company).

3. The default.asp page outside of the mailing_list directory is only to show you the application
running.

4. If you wish to add the Mailing List subscription form into your homepage or another page 
on your site place the mailing_list directory containing the main files as a sub directory 
of the page you wish to integrate the Mailing List subscription form into.

5. Make sure your homepage or the page you want to place the  Mailing List subscription form in 
has the extension .asp and place the following lines in the palce on the page where you wish the 
Mailing List subscription form to be displayed: -

For ASP 3 (Win2k Servers): -

	<% Server.Execute"mailing_list_inc.asp" %>

For ASP 2 (NT4 Servers): -

	<!-- Start Mailing List Include File -->
  	<!--#include file="mailing_list_inc.asp" -->
  	<!-- End mailing list Include File -->

You can then delete the page default.asp that is outside of the mailing_list directory as it will 
no longer be needed. 

5. To use the admin area to administer, set up, and send emails to your Mailing List members use 
the admin.htm file and login with the following case sesitive username and password: -

	Username - administrator
	Password - letmein

From the adminstartion files you can Send emails, Delete mailing list members, create a welcome
email for new members, change colours, fonts, username, password, set up email notification, and more.


6. If you are having problems with running Web Wiz Mailing List then edit the files common.asp 
and mailing_list_inc.asp with note pad where you can select to use a diffrent database driver or 
use DSN if you are able to setup DSN on your web server.

7. If you move the mailing_list.mdb database to another directory then place the new path into the
files common.asp and mailing_list_inc.asp file.

8. header.inc and footer.inc files are included for advanced users for better intergration into
your own site.

===========================================================================================






Brinkster Users
===========================================================================================

The Mailing list application will NOT run on Brinkster as they do NOT have any e-mail 
components installed on the Brinkster servers.

===========================================================================================





Common database error when using the Web Wiz Mailing List
===========================================================================================

If you recieve the following error: -

Microsoft OLE DB Provider for ODBC Drivers error '80004005' 
[Microsoft][ODBC Microsoft Access Driver] Operation must use an updateable query.

This means that the directory the database is in does not have the right permissions 
to be able to write to the database. 

If you are running the web server yourself and using the NTFS file system then there is
an FAQ page at, http://www.webwizguide.info/asp/FAQ, on how to change the server permissions 
on Win2k/NT4.  

If you are not running the server yourself then you will need to contact the server's
adminstrator and ask them to change the permissions otherwise you cannot update a database.


For other common database errors see:-  

http://www.webwizguide.info/asp/faq/access_database_faq.asp

===========================================================================================





Problems running the Web Wiz Mailing List Application
===========================================================================================

If you are having trouble with the application then please take a look at the FAQ pages at: -

	http://www.webwizguide.info/asp/FAQ


If you are still having problems then post support questions, queries, suggestions, at: -
	
	http://www.webwizguide.info/forum 

The is no official support for this application as support costs a large amount of unpaid 
time that is not always available to devote to the many questions posted.

===========================================================================================




Removing Links Back to Web Wiz Guide
===========================================================================================

Many 1000's of unpaid hours have gone into developing this and the other applications 
available for free from Web Wiz Guide.

If you like using this application then please help support the development and update of 
this and future applications.

If you would like to remove the powered by logo from the application then you must purchase 
a link removal key from Web Wiz Guide that can be entered into the 'Remove the Links' page
found in the admin area of the application.


Payments can be made securly on-line using your credit or debit card through WorldPay or 
PayPall more information on this can be found at: -

	http://www.webwizguide.info/purchase


You can also purchase a boxed version of Web Wiz Studios from the above link that contains
all the software from the site with link removal keys.

===========================================================================================






Donations
===========================================================================================

Many 1000's of unpaid hours have gone into developing this and the other applications 
available for free from Web Wiz Guide.

If you like using this application then please help support the development and update of 
this and future applications.

Donations can be made securly on-line using your credit or debit card through WorldPay or 
PayPall more information on this can be found at: -

	http://www.webwizguide.info/donations



Alternatively you can send donations to: -

	Bruce Corkhill
	PO Box 4982
	Bournemouth
	BH8 8XP
	United Kingdom

Please make personal checks or International money orders payable to: - Bruce Corkhill
(Sorry, I can't cash anything made payable to Web Wiz Guide) 

Please don't send a foreign check drawn on a non-UK bank, as the fees usually exceed the 
value of the donation.



For more info on donations and how Web Wiz Guide can bring professional applications for free
please see the following page: -


	http://www.webwizguide.info/donations


===========================================================================================




Other ASP Applications
===========================================================================================

The following ASP Appliacations are available for free from http://www.webwizguide.info 

	Web Wiz Forums
	Web Wiz Guestbook
	Site Search Engine
	Web Wiz Polls
	Web Wiz Site News
	Web Wiz Mailing List
	Web Wiz Journal
	Internet Search Engine
	Graphical Hit Counter
	Graphical Session Hit Counter
	Database Hidden Hit Counter
	Active Users Counter
	Email Form's (CDONTS)
	Email Form's (w3 JMail)
	Database Login Page
	Whois Lookup

===========================================================================================




If I have missed anything out or any bugs then please let me know by e-mailing me at: -

asp@webwizguide.com

