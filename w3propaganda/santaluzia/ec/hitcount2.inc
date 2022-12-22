<%
set file = Server.CreateObject("Scripting.FileSystemObject")
path = Server.MapPath("hitcount.txt")
set infile = file.OpenTextFile( path ) 
visitor = infile.ReadLine
d = infile.ReadLine
fundo = infile.ReadLine
visitor = visitor + 0
infile.close
set outfile = file.CreateTextFile( path, True )
outfile.WriteLine( visitor )
outfile.WriteLine( d )
outfile.WriteLine( fundo )
outfile.Close
%>
<%Response.Write(" ")%>
<% =visitor %>