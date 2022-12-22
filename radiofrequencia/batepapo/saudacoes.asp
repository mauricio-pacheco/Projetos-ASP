<%
strNome = Request.Cookies("sc")("nome")
dia_m = day(now)
dia_s = weekday(now)
mes = month(now)
ano = year(now)
hora = time()

If hora >= "18" And hora < "24" Then
	strSaudacao = "Boa noite"
End if

If hora >= "0" And hora < "12" Then
	strSaudacao = "Bom dia"
End if

If hora >= "12" And hora < "18" Then
	strSaudacao = "Boa tarde"
End if

Select Case dia_s
	Case "1"
		dia_s = "Domingo"
	Case "2"
		dia_s = "Segunda-feira"
	Case "3"
		dia_s = "Terça-feira"
	Case "4"
		dia_s = "Quarta-feira"
	Case "5"
		dia_s = "Quinta-feira"
	Case "6"
		dia_s = "Sexta-feira"
	Case "7"
		dia_s = "Sábado"
End Select

Select Case mes
	Case "1"
		mes = "Janeiro"
	Case "2"
		mes = "Fevereiro"
	Case "3"
		mes = "Março"
	Case "4"
		mes = "Abril"
	Case "5"
		mes = "Maio"
	Case "6"
		mes = "Junho"
	Case "7"
		mes = "Julho"
	Case "8"
		mes = "Agosto"
	Case "9"
		mes = "Setembro"
	Case "10"
		mes = "Outubro"
	Case "11"
		mes = "Novembro"
	Case "12"
		mes = "Dezembro"
End Select

Response.Write dia_s & ", " & dia_m & " de " & mes & " de " & ano & ", " & strSaudacao & " " & strNome

%>