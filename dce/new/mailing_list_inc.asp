<%


Dim adoMailingListCon 		'Database Connection Variable
Dim strMailingListCon		'Holds the Database driver and the path and name of the database
Dim strMailingListAccessDB 	'Holds the Access Database Name
Dim rsMailingListConfiguration	'Holds the configuartion recordset
Dim strMailingListSQL		'Holds the SQL query for the database
Dim blnMailingListShow		'Set to true
Dim strMailingListTextColour	'Holds the text colour of the Mailing List
Dim strMailingListTextType	'Holds the font type of the Mailing List
Dim strMailingListTextSize	'Holds the font size of the Mailing List
Dim strMailingListPath		'Holds the path to the mailing list directory



'Path to the mailing list directory
strMailingListPath = "new/mailing_list/"

'Create database connection

'Initialise the strMailingListAccessDB variable with the name and path to the Access Database
strMailingListAccessDB = "dcebd/dcedata.mdb"

'Create a connection odject
Set adoMailingListCon = Server.CreateObject("ADODB.Connection")
			 
'------------- If you are having problems with the script then try using a diffrent driver or DSN by editing the lines below --------------
			 
'Database connection info and driver (if this driver does not work then comment it out and use one of the alternative drivers)
strMailingListCon = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath(strMailingListAccessDB)
'Alternative drivers
'strMailingListCon = "Provider=Microsoft.Jet.OLEDB.3.51; Data Source=" & Server.MapPath(strMailingListAccessDB) 'This one is for Access 97
'strMailingListCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath(strMailingListAccessDB)  'This one is for Access 2000

'If you wish to use DSN then comment out the driver above and uncomment the line below (DSN is slower than the above drivers)
'strMailingListCon = "DSN=guestbook" 'Place the DSN name after the DSN=

'---------------------------------------------------------------------------------------------------------------------------------------------

'Set an active connection to the Connection object
adoMailingListCon.Open strMailingListCon


'Read in the mailing list configuration
'Intialise the ADO recordset object
Set rsMailingListConfiguration = Server.CreateObject("ADODB.Recordset")

'Initialise the SQL variable with an SQL statement to get the configuration details from the database
strMailingListSQL = "SELECT tblConfiguration.* From tblConfiguration;"

'Query the database
rsMailingListConfiguration.Open strMailingListSQL, strMailingListCon

'If there is config deatils in the recordset then read them in
If NOT rsMailingListConfiguration.EOF Then

	'Read in the configuration details from the recordset
	strMailingListTextColour = rsMailingListConfiguration("text_colour")
	strMailingListTextType = rsMailingListConfiguration("text_type")
	strMailingListTextSize = CInt(rsMailingListConfiguration("text_size"))
	blnMailingListShow = CBool(rsMailingListConfiguration("Code"))
End If

'Reset server object
rsMailingListConfiguration.Close
Set rsMailingListConfiguration = Nothing

%>

<!-- The Web Wiz Guide - Web Wiz Mailing List is written and produced by Bruce Corkhill ©2001-2002
     	 If you want your own ASP Mailing List then goto http://www.webwizguide.info -->

<style type="text/css">
<!--
body {
	background-color: #EAECD2;
}
.style2 {font-size: 9px}
.style3 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style4 {font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif; }
-->
</style>
<body topmargin="0">
<LINK href="../home_arquivos/estilos.css" type=text/css rel=STYLESHEET>
<style type="text/css">
<!--
-->
</style><form name="frmMailingList" method="post" action="<% = strMailingListPath %>mailing_list.asp" target="mailingList" onSubmit="window.open('', 'mailingList', 'toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=400,height=220')">
  <table width="98%" border="0" align="center">
    <tr>
      <td width="14%"><div align="center" class="style4">&nbsp;NEWSLETTER:</div></td>
      <td width="26%"><div align="center">
        <input type="text" class="busca" onClick="this.value=''" name="email" size="26" maxlength="35" value="DIGITE SEU E-MAIL">
      </div></td>
      <td width="24%"><div align="center" class="style3"><span class="text"> <span class="style2">
        <input type="radio" name="mode" value="add" id="add" checked>
      </span></span><span class="text style2"><font color="#434343">Cadastrar</font></span></div>        
      <span class="text"><label for="add">
        </label>
      </span></td>
      <td width="16%"><div align="center" class="style3"><span class="text"> <span class="style2">
        <input type="radio" name="mode" value="delete" id="delete">
      </span></span><span class="text style2"><font color="#434343">Apagar</font></span></div>        
      <span class="text"><label for="delete">
        </label>
      </span></td>
      <td width="20%"><div align="center">
        <input type="submit" class=botao name="Submit" value="ENVIAR">
      </div></td>
    </tr>
  </table>
  </form>
