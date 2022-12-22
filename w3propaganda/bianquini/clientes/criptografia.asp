<% 

Function Cripto(StrCripto, BolAcao) 'Início de da função de criptografia. Aonde o parâmetro String é o valor que será criptografado ou descriptografado. E o parâmetro BolAcao é um valor booleano (True ou False) para indicar se deve ser criptografado (True) ou descriptografado (False).

Dim X , i, n, TamChave, Valor 'Declaração das variáveis.
Dim aChaves(9) 'Declaração do Array que contem as chaves de criptografia

For i = 1 To Len(StrCripto) 'Inicia um Loop For que deve ser repetido a quantidade de vezes de acordo com o tamanho da String que deve ser criptografada.
    n = Asc(Mid(StrCripto, i, 1))
	
    If n > 31 Then 'mantém controles intactos
       n = n - 32 'desconsidera controles (Caracteres de 0 a 31)
       If BolAcao Then
          Valor = 1
       Else
          Valor = -1
       End If
       n = n + (aChaves((i - 1) Mod 9)) * Valor
       n = n Mod 224 ' Caracteres 256 - 32 desconsiderados
          If n < 0 Then
             n = 224 + n
          End If
       n = n + 32 ' Reajusta para caracteres normais
    End If
	
    X = X & Chr(n) 'Armazena na variável X os caracteres que foram modificados
Next

       If BolAcao Then
          Cripto = EHtmlEncode(X) 'Retorna o valor da variável X para a função
       Else
         Cripto = EHtmlDecode(X) 'Retorna o valor da variável X para a função
       End If


End Function

Function EHtmlEncode(StrString)
StrString = Replace(StrString, ",", ",")
StrString = Replace(StrString, "'", "'")
StrString = Replace(StrString, """", """")
StrString = Replace(StrString, "=", "=")
StrString = Replace(StrString, ".", ".")
StrString = Replace(StrString, "(", "(")
StrString = Replace(StrString, "set", "set")
StrString = Replace(StrString, "SET", "SET")
StrString = Replace(StrString, " where ", "where")
StrString = Replace(StrString, " WHERE ", "WHERE")
StrString = Replace(StrString, ")", "(")
StrString = Replace(StrString, Chr(32), Chr(32))
StrString = Replace(StrString, Chr(13), Chr(13))
StrString = Replace(StrString, Chr(0), Chr(0))
StrString = Replace(StrString, Chr(10) & Chr(10), Chr(10) & Chr(10))
StrString = Replace(StrString, Chr(10), Chr(10))
StrString = Replace(StrString, Chr(9), Chr(9))
StrString = Replace(StrString, Chr(11), Chr(11))
StrString = Replace(StrString, Chr(12), Chr(12))
StrString = Replace(StrString, Chr(60), Chr(60))
StrString = Replace(StrString, "/", "/")
StrString = Replace(StrString, "\", "\")
EHtmlEncode = StrString
End Function

Function EHtmlDecode(StrString)
StrString = Replace(StrString, "_a", "_a")
StrString = Replace(StrString, "_b", "_b")
StrString = Replace(StrString, "_c", "_c")
StrString = Replace(StrString, "_d", "_d")
StrString = Replace(StrString, "_e", "_e")
StrString = Replace(StrString, "_f", "_f")
StrString = Replace(StrString, "_g", "_g")
StrString = Replace(StrString, "_h", "_h")
StrString = Replace(StrString, "_i", "_i")
StrString = Replace(StrString, "_j", "_j")
StrString = Replace(StrString, "_l", "_l")
StrString = Replace(StrString, "_m", "_m")
StrString = Replace(StrString, "_n", "_n")
StrString = Replace(StrString, "_o", "_o")
StrString = Replace(StrString, "_p", "_p")
StrString = Replace(StrString, "_q", "_q")
StrString = Replace(StrString, "_r", "_r")
StrString = Replace(StrString, "_s", "_s")
StrString = Replace(StrString, "_t", "_t")
StrString = Replace(StrString, "_u", "_u")
StrString = Replace(StrString, "_v", "_v")
StrString = Replace(StrString, "_x", "_x")
EHtmlDecode = StrString
End Function


%>