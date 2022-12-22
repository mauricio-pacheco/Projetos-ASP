<!--#include file="verificacliente.asp"-->
<!--#include file="conexao.asp"-->
<!--#include file="meta.asp"-->
<% 

Dim rs
Dim rs2
Dim rs3
Dim SQL
Dim Conexao
Dim BancoDados
Dim aham
Dim record
Dim limpa
Dim limpa2
Dim limpado
Dim limpado2

aham = date

limpa = Cstr(Session("usuario"))

Set rs8 = Server.CreateObject("ADODB.Recordset") 
SQL8 = "SELECT usuario FROM representantes WHERE usuario =' " & limpa & " '"
rs8.Open SQL8, wm,3,3

if not rs8.EOF then
limpa2 = rs8("usuario")
else
limpa2 = Cstr(Session("usuario"))
end if 

Set rs = Server.CreateObject("ADODB.Recordset") 
SQL = "SELECT * FROM clientes WHERE representante ='" & limpa2 & "' "
rs.Open SQL, wm,3,3
      

%>
<div align="center"><img src="logore.jpg" width="550" height="150" /></div>
<TABLE width="680" border=0 align="center" cellPadding=0 
cellSpacing=0 bgColor=#ffffff class=texto style="BORDER-RIGHT: gainsboro 1px solid" style="BORDER-LEFT: gainsboro 1px solid"></HTML>
  <TBODY>
  <TR>
    <TD bgColor=#005DA2 colSpan=3 height=25><TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=center>
          <TD width="98%" bgcolor="#005DA2"><div align="center"><FONT color=#ffffff><span class="style2">&nbsp;&nbsp;Cadastro de Representantes -
            <script language="JavaScript">

<!--
day = new Date()
num_dia = day.getDate()
dia = day.getDay()+1
mes = day.getMonth()+1
ano = day.getYear()


if(dia ==1)
document.write("Domingo, ")
if(dia ==2)
document.write("Segunda feira, ")
if(dia ==3)
document.write("Terça feira, ")
if(dia ==4)
document.write("Quarta feira, ")
if(dia ==5)
document.write("Quinta feira, ")
if(dia ==6)
document.write("Sexta feira, ")
if(dia ==7)
document.write("Saturday , ")

document.write(num_dia," de ")

if(mes ==1)
document.write("Janeiro de")
if(mes ==2)
document.write("Fevereiro de")
if(mes ==3)
document.write("Março de")
if(mes ==4)
document.write("Abril de")
if(mes ==5)
document.write("Maio de")
if(mes ==6)
document.write("Junho de")
if(mes ==7)
document.write("Julho de")
if(mes ==8)
document.write("Agosto de")
if(mes ==9)
document.write("Setembro de")
if(mes ==10)
document.write("Outubro de")
if(mes ==11)
document.write("Novembro de")
if(mes ==12)
document.write("Dezembro de")

document.write(" ",ano)


//--->
                  </script>
          - 
          Seja bem vindo <%=Session("usuario")%> - <a class=home_titulo7000 href="sumir.asp">Sair do Sistema</a></span></FONT></div></TD>
        </TD></TR></TBODY></TABLE></TD>
  <TR>
  <TR>
    <TD vAlign=top>
      <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
         <TD vAlign=top>
            <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" 
border=0>
              <TBODY>
              <TR>
                <TD vAlign=top>
                  <TABLE class=texto cellSpacing=0 cellPadding=0 width="100%" 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD vAlign=top width="1%"><script language=javascript>
								   function validar(cadastro) { 
								   
								   if (document.cadastro.expedicao.value=="") {
alert("O Campo Data de Expedição não está preenchido!")
cadastro.expedicao.focus();
return false
}

if (document.cadastro.entrega.value=="") {
alert("O Campo Data de Entrega não está preenchido!")
cadastro.entrega.focus();
return false
}

}
								   
								   
								   function Mascara (formato, keypress, objeto){
campo = eval (objeto);

// data nascimento
if (formato=='expedicao'){
separador = '/'; 
conjunto1 = 2;
conjunto2 = 5;
if (campo.value.length == conjunto1)
  {
  campo.value = campo.value + separador;
  }
if (campo.value.length == conjunto2)
  {
  campo.value = campo.value + separador;
  }
}



// data cadastro
if (formato=='entrega'){
separador = '/'; 
conjunto1 = 2;
conjunto2 = 5;
if (campo.value.length == conjunto1)
  {
  campo.value = campo.value + separador;
  }
if (campo.value.length == conjunto2)
  {
  campo.value = campo.value + separador;
  }
}



// celular
if (formato=='celular32'){
separador1 = '(';
separador2 = ') ';
separador3 = '-';
conjunto1 = 0;
conjunto2 = 3;
conjunto3 = 9;
if (campo.value.length == conjunto1){
campo.value = campo.value + separador1;
}
if (campo.value.length == conjunto2){
campo.value = campo.value + separador2;
}
if (campo.value.length == conjunto3){
campo.value = campo.value + separador3;
}
}

}

</SCRIPT>
                        <form method="POST" name="cadastro" action="repedido.asp" onSubmit="return validar(this)">
                        </form></TD>
                    </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
   </TBODY></TABLE><table width="680" border="0" align="center"><TR>
    <TD style="BORDER-TOP: #005DA2 10px solid" bgColor=#FFFFFF colSpan=3 
    height="1%"><!--#include file="baixola.asp"--></TD>
  </TR>
  </TBODY></TABLE>
</BODY></HTML>
