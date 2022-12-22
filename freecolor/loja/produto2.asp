	  <tr><td valign=top>
<%

'Função para chamar os produtos aleatoreamente na vitime inicial
set rs = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok';")
if rs.eof or rs.bof then
rs.close
set rs = nothing
set atualizar = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok';")
if rs.eof or rs.bof then
rs.close
set rs = nothing
set atualizar = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok';")
end if
else
set atualizar = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs("idprod")&";")
end if
set rs2 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&";")
if rs2.eof or rs2.bof then
rs2.close
set rs2 = nothing
set atualizar2 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs2 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&";")
if rs2.eof or rs2.bof then
rs2.close
set rs2 = nothing
set atualizar2 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs2 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&";")
end if
else
set atualizar2 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs2("idprod")&";")
end if
set rs3 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&";")
if rs3.eof or rs3.bof then
rs3.close
set rs3 = nothing
set atualizar3 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs3 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&";")
if rs3.eof or rs3.bof then
rs3.close
set rs3 = nothing
set atualizar3 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs3 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&";")
end if
else
set atualizar3 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs3("idprod")&";")
end if
set rs4 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&";")
if rs4.eof or rs4.bof then
rs4.close
set rs4 = nothing
set atualizar4 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs4 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&";")
if rs4.eof or rs4.bof then
rs4.close
set rs4 = nothing
set atualizar4 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs4 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> '"&rs("idprod")&"' and idprod <> '"&rs2("idprod")&"' and idprod <> '"&rs3("idprod")&"';")
end if
else
set atualizar4 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs4("idprod")&";")
end if
set rs5 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&";")
if rs5.eof or rs5.bof then
rs5.close
set rs5 = nothing
set atualizar5 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs5 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&";")
if rs5.eof or rs5.bof then
rs5.close
set rs5 = nothing
set atualizar5 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs5 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&";")
end if
else
set atualizar5 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs5("idprod")&";")
end if
set rs6 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&";")
if rs6.eof or rs6.bof then
rs6.close
set rs6 = nothing
set atualizar6 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs6 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&";")
if rs6.eof or rs6.bof then
rs6.close
set rs6 = nothing
set atualizar6 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs6 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&";")
end if
else
set atualizar6 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs6("idprod")&";")
end if
set rs7 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&";" )
if rs7.eof or rs7.bof then
rs7.close
set rs7 = nothing
set atualizar7 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs7 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&";")
if rs7.eof or rs7.bof then
rs7.close
set rs7 = nothing
set atualizar7 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs7 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&";")
end if
else
set atualizar7 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs7("idprod")&";")
end if
set rs8 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&";" )
if rs8.eof or rs8.bof then
rs8.close
set rs8 = nothing
set atualizar8 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs8 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&";")
if rs8.eof or rs8.bof then
rs8.close
set rs8 = nothing
set atualizar8 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs8 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&";")
end if
else
set atualizar8 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs8("idprod")&";")
end if
set rs9 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&";" )
if rs9.eof or rs9.bof then
rs9.close
set rs9 = nothing
set atualizar9 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs9 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&";")
if rs9.eof or rs9.bof then
rs9.close
set rs9 = nothing
set atualizar9 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs9 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&";")
end if
else
set atualizar9 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs9("idprod")&";")
end if
set rs10 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&";" )
if rs10.eof or rs10.bof then
rs10.close
set rs10 = nothing
set atualizar10 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs10 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&";")
if rs10.eof or rs10.bof then
rs10.close
set rs10 = nothing
set atualizar10 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs10 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&";")
end if
else
set atualizar10 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs10("idprod")&";")
end if


set rs11 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&";" )
if rs11.eof or rs11.bof then
rs11.close
set rs11 = nothing
set atualizar11 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs11 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&";")
if rs11.eof or rs11.bof then
rs11.close
set rs11 = nothing
set atualizar11 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs11 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&";")
end if
else
set atualizar11 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs11("idprod")&";")
end if


set rs12 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&" and idprod <> "&rs11("idprod")&";" )
if rs12.eof or rs12.bof then
rs12.close
set rs12 = nothing
set atualizar12 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs12 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&" and idprod <> "&rs11("idprod")&";")
if rs12.eof or rs12.bof then
rs12.close
set rs12 = nothing
set atualizar12 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs12 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&" and idprod <> "&rs11("idprod")&";")
end if
else
set atualizar12 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs12("idprod")&";")
end if

set rs13 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&" and idprod <> "&rs11("idprod")&" and idprod <> "&rs12("idprod")&";" )
if rs13.eof or rs13.bof then
rs13.close
set rs13 = nothing
set atualizar13 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs13 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&" and idprod <> "&rs11("idprod")&" and idprod <> "&rs12("idprod")&";")
if rs13.eof or rs13.bof then
rs13.close
set rs13 = nothing
set atualizar13 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs13 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&" and idprod <> "&rs11("idprod")&" and idprod <> "&rs12("idprod")&";")
end if
else
set atualizar13 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs13("idprod")&";")
end if

set rs14 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs("idprod")&" and idprod <> "&rs2("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&" and idprod <> "&rs11("idprod")&" and idprod <> "&rs12("idprod")&" and idprod <> "&rs13("idprod")&";" )
if rs14.eof or rs14.bof then
rs14.close
set rs14 = nothing
set atualizar14 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs14 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&" and idprod <> "&rs11("idprod")&" and idprod <> "&rs12("idprod")&" and idprod <> "&rs13("idprod")&";")
if rs14.eof or rs14.bof then
rs14.close
set rs14 = nothing
set atualizar14 = abredb.Execute("UPDATE produtos SET status = 'nao' WHERE status = 'ok';")
set rs14 = abredb.execute("SELECT * FROM produtos WHERE status <> 'ok' and idprod <> "&rs2("idprod")&" and idprod <> "&rs("idprod")&" and idprod <> "&rs3("idprod")&" and idprod <> "&rs4("idprod")&" and idprod <> "&rs5("idprod")&" and idprod <> "&rs6("idprod")&" and idprod <> "&rs7("idprod")&" and idprod <> "&rs8("idprod")&" and idprod <> "&rs9("idprod")&" and idprod <> "&rs10("idprod")&" and idprod <> "&rs11("idprod")&" and idprod <> "&rs12("idprod")&" and idprod <> "&rs13("idprod")&";")
end if
else
set atualizar14 = abredb.Execute("UPDATE produtos SET status = 'ok' WHERE idprod = "&rs14("idprod")&";")
end if



intProdID1 = rs("idprod")
intProdID2 = rs2("idprod")
intProdID3 = rs3("idprod")
intProdID4 = rs4("idprod")
intProdID5 = rs5("idprod")
intProdID6 = rs6("idprod")
intProdID7 = rs7("idprod")
intProdID8 = rs8("idprod")
intProdID9 = rs9("idprod")
intProdID10 = rs10("idprod")
intProdID10 = rs11("idprod")
intProdID10 = rs12("idprod")
intProdID10 = rs13("idprod")
intProdID10 = rs14("idprod")

'Formatação dos preços dos produtos
precito1 = formatNumber(rs("preco"), 2)
precito2 = formatNumber(rs2("preco"), 2)
precito3 = formatNumber(rs3("preco"), 2)
precito4 = formatNumber(rs4("preco"), 2)
precito5 = formatNumber(rs5("preco"), 2)
precito6 = formatNumber(rs6("preco"), 2)
precito7 = formatNumber(rs7("preco"), 2)
precito8 = formatNumber(rs8("preco"), 2)
precito9 = formatNumber(rs9("preco"), 2)
precito10 = formatNumber(rs10("preco"), 2)
precito11 = formatNumber(rs11("preco"), 2)
precito12 = formatNumber(rs12("preco"), 2)
precito13 = formatNumber(rs13("preco"), 2)
precito14 = formatNumber(rs14("preco"), 2)%>

	  <table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
	         <form action="comprar.asp" method="post" name="comprar8">
	   		 <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			  		<table align=center width=226 cellspacing="1" cellpadding="1"><tr>
					<td width=80 height=70><a href="produtos.asp?produto=<%=rs8.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" target=_blank style="color:#FFFFFF;text-decoration:none;"><img src="produtos/<%=rs8.fields("imgra")%>" width="75" border="0"></a></td>
				  <td valign=center width=200><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs8.fields("nome")%></b><br><br><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito8%><br><b><%=strLg28%></b><%if rs8.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID8 %>"><input type="hidden" name="intQuant" value=1><%if rs8.fields("estoque") = "s" then response.write "" end if%>&nbsp;&nbsp;<a href="produtos.asp?produto=<%=rs8.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" target=_blank style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>					
				    </table>
		     </table>
	  </table>
	  
	 
	  <table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
	         <form action="comprar.asp" method="post" name="comprar3">
	   		 <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			  		<table align=center width=226 cellspacing="1" cellpadding="1"><tr>
					<td width=80 height=70><a href="produtos.asp?produto=<%=rs3.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" target=_blank style="color:#FFFFFF;text-decoration:none;"><img src="produtos/<%=rs3.fields("imgra")%>" width="75" border="0"></a></td>
				  <td valign=center width=200><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs3.fields("nome")%></b><br><br><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito3%><br><b><%=strLg28%></b><%if rs3.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID3 %>"><input type="hidden" name="intQuant" value=1><%if rs3.fields("estoque") = "s" then response.write "" end if%>&nbsp;&nbsp;<a href="produtos.asp?produto=<%=rs3.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" target=_blank style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>
					</table>
			 </table>
	 </table>
	  
</td><td valign=top>

	 <table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
           <form action="comprar.asp" method="post" name="comprar4">
		 	<table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
					  <table align=center width=226 cellspacing="1" cellpadding="1">
					  <tr><td width=80 height=70><a href="produtos.asp?produto=<%=rs4.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" target=_blank style="color:#FFFFFF;text-decoration:none;"><img src="produtos/<%=rs4.fields("imgra")%>" width="75" border="0"></a></td>
				      <td valign=center width=200><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs4.fields("nome")%></b><br><br><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito4%><br><b><%=strLg28%></b><%if rs4.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID4 %>"><input type="hidden" name="intQuant" value=1><%if rs4.fields("estoque") = "s" then response.write "" end if%>&nbsp;&nbsp;<a href="produtos.asp?produto=<%=rs4.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" target=_blank style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>					  
					  </table>
			</table>
	</table>
	
	<table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
	<form action="comprar.asp" method="post" name="comprar5">
			  <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			   		 <table align=center width=226 cellspacing="1" cellpadding="1">
					 <tr><td width=80 height=70><a href="produtos.asp?produto=<%=rs5.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" target=_blank style="color:#FFFFFF;text-decoration:none;"><img src="produtos/<%=rs5.fields("imgra")%>" width="75" border="0"></a></td>
				     <td valign=center width=200><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs5.fields("nome")%></b><br><br><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito5%><br><b><%=strLg28%></b><%if rs5.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID5 %>"><input type="hidden" name="intQuant" value=1><%if rs5.fields("estoque") = "s" then response.write "" end if%>&nbsp;&nbsp;<a href="produtos.asp?produto=<%=rs5.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" target=_blank style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>					 
					 </table>
			  </table>
	</table>
	
	 
</td><td valign=top>

	<table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
	<form action="comprar.asp" method="post" name="comprar6">
			  <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			   		 <table align=center width=226 cellspacing="1" cellpadding="1">
					 <tr><td width=80 height=70><a href="produtos.asp?produto=<%=rs6.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img src="produtos/<%=rs6.fields("imgra")%>" width="75" border="0"></a></td>
				     <td valign=center width=200><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs6.fields("nome")%></b><br><br><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito6%><br><b><%=strLg28%></b><%if rs6.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID6 %>"><input type="hidden" name="intQuant" value=1><%if rs6.fields("estoque") = "s" then response.write "" end if%>&nbsp;&nbsp;<a href="produtos.asp?produto=<%=rs6.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>
				     </table>
			  </table>
	 </table> 
	
	 	 <table BORDER="0" CELLSPACING="1" CELLPADDING="0"><tr><td bgcolor=#bfbfbf>
	<form action="comprar.asp" method="post" name="comprar7">
			  <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
			   		 <table align=center width=226 cellspacing="1" cellpadding="1">
					 <tr><td width=80 height=70><a href="produtos.asp?produto=<%=rs7.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" target=_blank style="color:#FFFFFF;text-decoration:none;"><img src="produtos/<%=rs7.fields("imgra")%>" width="75" border="0"></a></td>
				     <td valign=center width=200><font style=font-size:11px;font-family:<%=fonte%>><b><font color=000000><%=rs7.fields("nome")%></b><br><br><b><%=strLg29%></b>&nbsp;<%= strlgmoeda & " " & precito7%><br><b><%=strLg28%></b><%if rs7.fields("estoque") = "s" then response.write " " & strLg26 else response.write " " & strLg27 end if%>&nbsp;<%=strLg25%><div align=right><br><input type="hidden" name="intProdID" value="<%= intProdID7 %>"><input type="hidden" name="intQuant" value=1><%if rs7.fields("estoque") = "s" then response.write "" end if%>&nbsp;&nbsp;<a href="produtos.asp?produto=<%=rs7.fields("idprod")%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='+ Detalhes';return true;" target=_blank style="color:#FFFFFF;text-decoration:none;"><img src=<%=dirlingua%>/imagens/detalhes.gif border="0"></a></div></td></form></tr>					 
					 </table>
			  </table>
	</table>
	
	 
</td></tr>

<%
'Fecha as tabelas
rs.close
set rs=nothing
rs2.close
set rs2=nothing
rs3.close
set rs3=nothing
rs4.close
set rs4=nothing
rs5.close
set rs5=nothing
rs6.close
set rs6=nothing
rs7.close
set rs7=nothing
rs8.close
set rs8=nothing
rs9.close
set rs9=nothing
rs10.close
set rs10=nothing
rs11.close
set rs11=nothing
rs12.close
set rs12=nothing
rs13.close
set rs13=nothing
rs14.close
set rs14=nothing

%>
