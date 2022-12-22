<% 
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################
'#
'#  CÓDIGO: VirtuaStore Versão 1.2 - Copyright 2001-2003 VirtuaWorks                                    
'#  URL: www.virtuastore.com.br / www.virtuaworks.com.br                                                           
'#  E-MAIL: webmaster@virtuaworks.com.br                                                                                          
'#  AUTORES: Otávio Dias(Desenvolvedor) / Jone Bandinelli(Desenvolvedor) / Daniel Kern(Revisão)                
'# 
'#     Este programa é um software livre; você pode redistribuí-lo e/ou 
'#     modificá-lo sob os termos do GNU General Public License como 
'#     publicado pela Free Software Foundation.
'#     É importante lembrar que qualquer alteração feita no programa 
'#     deve ser informada e enviada para os criadores, através de e-mail 
'#     ou da página de onde foi baixado o código.
'#
'#  //-------------------------------------------------------------------------------------
'#  // LEIA COM ATENÇÃO: O software VirtuaStore 1.2 deve conter as frases
'#  // "Powered by VirtuaStore 1.2" ou "Software derivado de VirtuaStore 1.2" e 
'#  // o link para o site http://www.virtuastore.com.br no créditos da 
'#  // sua loja virtual para ser utilizado gratuitamente. Se o link e/ou uma das 
'#  // frases não estiver presentes ou visiveis este software deixará de ser
'#  // considerado Open-source(gratuito) e o uso sem autorização terá 
'#  // penalidades judiciais de acordo com as leis de pirataria de software.
'#  //--------------------------------------------------------------------------------------
'#      
'#     Este programa é distribuído com a esperança de que lhe seja útil,
'#     porém SEM NENHUMA GARANTIA. Veja a GNU General Public License
'#     abaixo (GNU Licença Pública Geral) para mais detalhes.
'# 
'#     Você deve receber a cópia da Licença GNU com este programa, 
'#     caso contrário escreva para
'#     Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
'#     Boston, MA  02111-1307  USA
'# 
'#     Para enviar suas dúvidas, sugestões e/ou contratar a VirtuaWorks 
'#     Internet Design entre em contato através do e-mail 
'#     contato@virtuaworks.com.br ou pelo endereço abaixo: 
'#     Rua Venâncio Aires, 1001 - Niterói - Canoas - RS - Brasil. Cep 92110-000.
'#
'#     Para ajuda e suporte acesse: http://www.virtuastore.com.br
'#
'#     BOM PROVEITO!          
'#     Equipe VirtuaStore
'#     []'s
'#
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################

'INÍCIO DO CÓDIGO
'----------------------------------------------------------------------------------------------------------------
'Este código está otimizado e roda tanto em Windows 2000/NT/XP/ME/98 quanto em servidores UNIX-LINUX com chilli!ASP


Function Cripto(StrCripto, BolAcao) 'Início de da função de criptografia. Aonde o parâmetro String é o valor que será criptografado ou descriptografado. E o parâmetro BolAcao é um valor booleano (True ou False) para indicar se deve ser criptografado (True) ou descriptografado (False).

Dim X , i, n, TamChave, Valor 'Declaração das variáveis.
Dim aChaves(9) 'Declaração do Array que contem as chaves de criptografia

aChaves(0) = 77 'Atribuição dos valores dos caracteres que serão utilizados
aChaves(1) = 84 'como chave de criptografia
aChaves(2) = 79
aChaves(3) = 65
aChaves(4) = 73
aChaves(5) = 78
aChaves(6) = 67
aChaves(7) = 70
aChaves(8) = 82

X = Empty 'Atribui o valor vazio para a variável X

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