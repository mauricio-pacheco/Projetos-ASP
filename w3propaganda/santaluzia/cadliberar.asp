<!-- #include file="conecta.asp" -->
<%

Dim liberar, inserir

liberar = request.form("liberar")

inserir = "UPDATE liberacao Set liberar = '" & liberar & "'"
Conn.Execute(inserir)


response.redirect "liberacao.asp"

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
</body>
</html>
