
function imagem()
	img = inputbox("Coloque o caminho da imagem aqui:" & Chr(10) & Chr(10) & "Exemplo: http://www.webestudos.com.br/infologo.jpg","Coloque o caminho da imagem aqui:")
	if img <> "" then
		img = "[" & img & "]"
		parent(2).mensagens.mensagem.value = img
		parent(2).mensagens.submit
	end if
end function

function imprimir()
	parent(1).focus()

end function