<%
'####################################
'## Application:   Blue-Collar Productions
'## File Name:     lang_users.inc (Language File)
'## File Version:  i-Gallery
'## Notice:        This code has limited warranties. Please see http://www.b-cp.com for details.
'####################################
%>

<%
'## upload.asp
CONST IGupld_warn1 		= "The \""File Attachment\"" field is required!  Please select an image attachment by clicking on the browse button."
CONST IGupld_warn2 		= "The \""File Type\"" you have requested is not allowed!  Supported file types are:"
CONST IGupld_upimg 		= "Upload Image"
CONST IGupld_rtn 		= "Return To Folder"
CONST IGupld_msg 		= "You are about to upload an image to the following directory in your photo gallery:"
CONST IGupld_but1 		= "Upload"
CONST IGupld_but2 		= "Reset"
CONST IGupld_aft 		= "Allowed File Types"
CONST IGupld_mus 		= "Maximum Upload Size"

'## blank.asp
CONST IGblnk_ferr1 		= "Folder Error"
CONST IGblnk_ferr2 		= "Folder Permission Error"
CONST IGblnk_ferr3 		= "The ADODB object <I>Stream</I> is not available in your server."
CONST IGblnk_ferrmsg 	= "The folder listed above does not exist.&nbsp; If you feel you have reached this page in error please contact the system administrator."
CONST IGblnk_write1 	= "The image folder you have identified in your system settings does not have <b>""Write""</b> permissions enabled.&nbsp; Correct the problem then try uploading again!"
CONST IGblnk_mod1 		= "Although the folder above has <b>""Write""</b> permission set properly it does have <b>""Modify""</b> permission.&nbsp; Check the value of your image folder which you identified in the system settings&nbsp; The image folder must have <b>""Read, Write &amp; Modify""</b> permissions.&nbsp; Correct the problem then try uploading again!"
CONST IGblnk_adodb1 	= "Checar as permissões de envio no Banco de Dados."

'## upload-inc.asp
CONST IGupinc_ferr 		= "Erro no arquivo"
CONST IGupinc_ferrmsg 	= "O nome da pasta especificado no formulário do upload não corresponde a uma pasta válida em seu sistema. Se o erro persistir contate o administrador de sistema."

'## freeaspupload.asp
CONST IGfree_succ 		= "Upload feito com sucesso!"
CONST IGfree_succmsg1 	= "O arquivo"
CONST IGfree_succmsg2 	= "Upload feito com sucesso!"
CONST IGfree_fail 	  	= "Falha no envio da imagem!"
CONST IGfree_failmsg1 	= "O arquivo"
CONST IGfree_failmsg2 	= "excedeu o limite de tamanho de"
CONST IGfree_failmsg3 	= "O processo de Upload foi concluido."
CONST IGfree_rnamemsg1 	= "O arquivo"
CONST IGfree_rnamemsg2 	= "ela já esta presente no diretório.&nbsp; Para evitar de apagar apenas renomeie."
CONST IGfree_fld1a 		= "Editar esta imagem"
CONST IGfree_fld1b 		= "Antes de enviar a imagem seguinte... você pôde querer editar os campos do tamanho, do título ou de descrição da mesma."
CONST IGfree_fld2a 		= "Sincronizar esta imagem"
CONST IGfree_fld2b 		= "Para fazer acima esta pasta disponível no uso das perguntas da busca a ligação à sincronização ele com a base de dados da Galeria."
CONST IGfree_fld3a 		= "Enviar Imagem"
CONST IGfree_fld3b 		= "Terminado aqui.... clicando neste link você restaurará a página do upload assim que você pode introduzir uma outra imagem neste diretório."
%>