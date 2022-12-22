PowerASP.com Simple Hit Counter System Version 1

Designed By Chris Williams
chris@powerasp.com

This is a simple "ASP Based" hit counter solution.

Whats included...

Text Based Counter Example Code
Graphic Based Counter Example Code
8 digit collections
Its easy to make your own but I made some to get ya started.

If you are using NT the counter files you run this on must have the
correct permissions. Basically the files need "read" and "write"
permissions from the anonymous account or you will get an error.

If you get a "Permission denied" error then permissions is most
likely why.

Usually your web hosting company will give the anonymous
web server account "change permissions" on at least one directory in your
site..they wont give it to you everywhere for security reasons.
so if that is the case keep all of your counter files in that directory.
If thats the case you should specify the counter file path physically and
not use Server.MapPath... like so

CounterFile = "C:\inetpub\wwwroot\virtuals\mysites\counter.txt")

Your hosting company can provide you with the physical path information
or you could run this code to find out what it is.

<%= Server.MapPath("\")%>


Also  (for advanced users)....

If you understand Server.Map well and have anonymous write permissions all
throughout your website which I doubt you have... then you could have the
script name the counter file automatically like so..The you could include
the counter script on all the pages in your site and have hit counters
everywhere... it would almost be like your own stats program......
but you should only try that if you really understand all of this well

Below is an example of how you might do this

CounterFile = Server.MapPath(Replace(Request.ServerVariables("URL"),".asp","") & "_count.txt")

If using the graphical counter example you'll also need to adjust the image
path code so that it will always be right also no matter where the script
is included from. Like so...

DigitPath = "http://www.yourweb.com/digits/red_on_white"


'***********
Legal Notes:
'***********

These code examples cannot be re-published anywhere without
my written permission and this archive cannot be distributed from
any web site or CDROM without my written permission. If this archive
is distributed in any other way this text file must remain in tact.

Enjoy...