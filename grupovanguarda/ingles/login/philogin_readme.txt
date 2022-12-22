PHILWEB PHILOGIN DISTRIBUTION 1.4
---------------------------------

IMPORTANT!
Due to the addition of the admin pages, it is important that you
change the username and password needed to login from it's default.
You must login from philogin_admin.asp. To change the details, edit
the page "philogin_admin-login.asp", and edit the default username
and password values. The default values are:

USERNAME : philoginadmin
PASSWORD : loginpwd123

The admin pages can be accessed by typing the username and password
into the boxes of philogin_admin.asp (from the webserver of course)
---------------------------------

Okay, here's the code, pages, images and database which let you
have a user login/signup facility on your site. There's also additions
such as a profile editor, user list, inbox and message sending
facilities. Now there's also a set of admin pages.

Installation is as simple as just unzipping all the files into one
directory! If you want to move your database elsewhere, you'll have
to edit the ConnectString (you may have to move it to a directory
with write permissions on it). If you don't know how to do this, I
suggest you take a few more ASP tutorials! Integrating the relevant
bits of code into your site shouldn't be at all tricky if you've a
reasonable knowledge of ASP and HTML.

If you spot any errors, or have any other comments or suggestions,
then please email me at mail@youngpip.com

INFO ON EMAIL OPT-IN
--------------------
There's now an option to subsribe to a newsletter. There's no inbuilt
support in Philogin to send this email but what I do on youngpip.com is
to download the database, and filter out all those who have opted-in
(do a "filter by form" and check the sendemail field, then click the
filter icon). This brings back a list of subscribed users which I then
export to a csv file and load into a bulk-email sending program.

WHAT'S NEW IN V1.4?
-------------------
* Users can choose to sign-up for a newsletter. How you use this
information is up to you (see above)
* The Profile Updater now requires the user to enter their password
before it can update.
* The password field in the profile-editor in the admin backend is now
masked (just in case anybody is looking over your shoulder!)

WHAT'S NEW IN V1.3.2?
---------------------
* Users can now change their password via a link on the profile
updater.
* Via the Admin panel, you can now view and change user's passwords.
* Database connection modularised - connection info no located in
conn.asp only.

WHAT'S NEW IN V1.3.12?
---------------------
* philogin_admin.asp redirect bug fixed
* Links to non-existent css files deleted

WHAT'S NEW IN V1.3.11?
---------------------
* I honestly can't remember! I forgot to update this file at the time!

WHAT'S NEW IN V1.3.1?
---------------------
Includes bug fixes courtesy of my aussie pal Tony. These fixes are:
* User properly logged in after signup.
* If no messages in inbox, new message count functions correctly.
* Error trapping on messagesend.asp fixed.
* Icon of SENDER, not recipient displayed in inbox.
* Signup Error-Checking tightened

WHAT'S NEW IN V1.3?
-------------------
Added the admin pages which enable you to check user profiles, edit
profiles and delete users.

WHAT'S NEW IN V1.2.0.1?
-----------------------
Now shows how many new messages are in your inbox from the user
info box.

WHAT'S NEW IN V1.2?
--------------------
A message-sending facility between users has been added. Each user
has their own inbox where they can receive and send messages.
There's also a list of users which can be alphabetically filtered.

WHAT'S NEW IN V1.1?
--------------------
There's now a profile updater for resitered users.

WHAT'S NEW IN V1.01?
--------------------
Version 1.01 includes a checkbox that allows users to stay logged in
between browser sessions.


---------------------------------------
Although this is all free, if you do decide to use it please credit
me or my site somewhere - it's only fair! the "About" page on
Philweb contains link banners and code you can use.

Author  : Phil Ward
Email   : mail@youngpip.com
Website : http://www.youngpip.com

To Advertise, please email ads@bitsonthewire.com and say you would
like to advertise on Philweb (www.youngpip.com).

---------------------------------------
Although very unlikely, the author takes no responsibility for any
loss of data incurred through use of this code.