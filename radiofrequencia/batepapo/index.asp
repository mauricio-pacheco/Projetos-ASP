<%

Select Case Request.Querystring("acao")
	Case "semnick"
		msg = "Você precisa digitar um apelido!"
	Case "tamanhoerrado"
		msg = "O apelido deve ter entre 3 e 21 caracteres!"
End Select

strCareta = Request.Querystring("careta")

If strCareta = "" Then
	strCareta = "69"
end if

%>

<HTML>
<HEAD>
<TITLE>Bem vindo ao Bate Papo da R&aacute;dio Frequ&ecirc;ncia - Garopaba/SC</TITLE>
<SCRIPT LANGUAGE="VBScript">
Dim sl01_Nomes(20)
<%
Dim i

sl01_Usuarios = Application("sl01_Usuarios")
for i=0 to 19
if sl01_usuarios(i) <> "" then
   Response.write "sl01_Nomes(" & i & ") = " & chr(34) & sl01_Usuarios(i) & chr(34) & chr(13)
End if
Next
%>

</SCRIPT>
<link rel="stylesheet" href="main.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></HEAD>
<BODY BGCOLOR=#FFFFFF text="#000000" link="#000000" vlink="#000000" alink="#000000">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    
  </tr>
  <tr> 
    <td height="202"> <form name="form1" action="le_nickname.asp" method=POST>
        <table border=0 cellpadding=0 cellspacing=0 height=76 width="100%">
          <tbody>
            <tr> 
              
            </tr>
            <tr> 
              <td height=192 width="38%" valign="top"> <p align="center"><br><img src="simbolo.jpg" width="300" height="365"></p>
                <table width="740" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td> 
                      <table width="740" border="0" cellpadding=0 cellspacing=0>
                        <tbody>
                          <tr> 
                            <td width="39%" align=right bordercolor="#000000" bgcolor="#FFFFFF"> 
                              <p align=center><font color="#000000">Nome: 
                                <input name=apelido size=20 class="style_forms" value="<%=Request.Cookies("sc")("nome")%>">
                                </font><font color="#000000"> 
                                <input type="checkbox" name="salvar" value="sim"
					<% 
					If Request.Cookies("sc")("salvar") = "sim" then
						Response.Write "checked" 
					end if 
					%> >
                                Salvar apelido - </font><font color="#000000">Cor 
                                do nick: 
                                <select name=optCor size=1 class="style_forms" >
                                  <option value="Preto" selected>Preto</option>
                                  <option value="Laranja">Laranja</option>
                                  <option value="Azul">Azul</option>
                                  <option value="Roxo">Roxo</option>
                                  <option value="Verde">Verde</option>
                                  <option value="Vermelho">Vermelho</option>
                                </select>
                                <input type="hidden" name="careta" value="<%=strCareta%>">
                                - </font><font color="#000000"> 
                                <input type="submit" border="0" name="imageField" value="ENTRAR" width="20" height="20">
                                - Careta: <img src="caretas/<%=strCareta%>.gif"></font><font color="#FFFFFF"> 
                                </font></p>
                              </td>
                          </tr>
                        </tbody>
                      </table></td>
                  </tr>
                </table>
               
                <table width="740" border="1" align="center">
                  <tr> 
                    <td bordercolor="#000000" bgcolor="#FFFFFF"> <!--#include file="caretas.asp" --></td>
                  </tr>
                </table>
   
                <p align="center"><font color="#000000"><b><%=msg%></b></font></p>
                <p align="center"><b><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">Designed by <a href="http://www.casadaweb.net" target=_blank>Casa 
                  da Web</a> </font></b></p>
                </td>
            
            </tr>
          </tbody>
        </table>
      </form></td>
  </tr>
  <tr> 
    
  </tr>
</table>
