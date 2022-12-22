<%
set cn = Server.CreateObject("ADODB.Connection")
cn.provider= "Microsoft.Jet.OLEDB.4.0"
cn.connectionstring=Server.MapPath("data/santaluzia.mdb")
cn.open

pagina = "teste.asp"


SQL = "SELECT * FROM subdep"
Set rs = cn.execute(sql)

response.write "<ul id='primary-nav'>"
   do while not rs.eof
        response.write "<li class='menuparent'><a href='java script:;'>"& rs("nome") &"</a>"
        
        SQL2 = "SELECT * FROM sessoes WHERE subdep='"&rs("id")&"'"
        set rs2 = cn.execute(sql2)

        If Rs2.eof Then
            response.write "</li>"
        Else
            response.write "<ul>"
            do while not rs2.eof
                response.write "<li><a href='"&pagina&"?if="& rs2("id") &"'>" & rs2("nome") & "</a></li>"
               rs2.movenext
            loop
        response.write "</ul>"
        response.write "</li>"
        end if
        rs.movenext
    loop
response.write "</ul>"
%>