<SCRIPT RUNAT=SERVER LANGUAGE=VBSCRIPT>
Const IncludeType = 2

'Vous pouvez utiliser ce composant d'upload pourr :
' 1. Uploader de petits fichiers sur le serveur (sauvegarde via les FileSystem object)
' 2. Uploader des fichiers binaires/texte de n'importe quelle taille sur une base de données serveur (RS("BinField") = Upload("FormField").Value)


'restriction de la taille de l'upload
Dim UploadSizeLimit

'********************************** Méthode GetUpload **********************************
'Cette fonction lit les champs de formulaires en entrée binaire et les renvoie en tant qu'objet du dictionnaire.

Function GetUpload()
  Dim Result
  Set Result = Nothing
  If Request.ServerVariables("REQUEST_METHOD") = "POST" Then	 'la méthode REQUEST doit être POST
    Dim CT, PosB, Boundary, Length, PosE
    CT = Request.ServerVariables("HTTP_Content_Type")	' lit le header
    If LCase(Left(CT, 19)) = "multipart/form-data" Then	'qui doit être de type "multipart/form-data"

      
      PosB = InStr(LCase(CT), "boundary=") 'Finds boundary
      If PosB > 0 Then Boundary = Mid(CT, PosB + 9) 'Separetes boundary

      '****** Erreur sur IE5.01 - doublement des entêtes http
      PosB = InStr(LCase(CT), "boundary=") 
      If PosB > 0 then 'Patch pour l'erreur IE
        PosB = InStr(Boundary, ",")
        If PosB > 0 Then Boundary = Left(Boundary, PosB - 1)
      end if
      '****** Erreur sur IE5.01 - doublement des entêtes http

      Length = CLng(Request.ServerVariables("HTTP_Content_Length"))
      If "" & UploadSizeLimit <> "" Then
        UploadSizeLimit = CLng(UploadSizeLimit)
        If Length > UploadSizeLimit Then
          Request.BinaryRead (Length)
          Err.Raise 2, "GetUpload", "Upload size " & FormatNumber(Length, 0) & "B exceeds limit of " & FormatNumber(UploadSizeLimit, 0) & "B"
          Exit Function
        End If
      End If
      
      If Length > 0 And Boundary <> "" Then 
        Boundary = "--" & Boundary
        Dim Head, Binary
        Binary = Request.BinaryRead(Length) 'lit les données à partir du poste client
        
       
        Set Result = SeparateFields(Binary, Boundary)
        Binary = Empty 'Mise à jour des variables
      Else
        Err.Raise 10, "GetUpload", "longueur nulle ."
      End If
    Else
      Err.Raise 11, "GetUpload", "Pas de fichier joint."
    End If
  Else
    Err.Raise 1, "GetUpload", "Mauvaise méthode de request."
  End If
  Set GetUpload = Result
End Function

'********************************** SeparateFields **********************************
Function SeparateFields(Binary, Boundary)
  Dim PosOpenBoundary, PosCloseBoundary, PosEndOfHeader, isLastBoundary
  Dim Fields
  Boundary = StringToBinary(Boundary)

  PosOpenBoundary = InStrB(Binary, Boundary)
  PosCloseBoundary = InStrB(PosOpenBoundary + LenB(Boundary), Binary, Boundary, 0)

  Set Fields = CreateObject("Scripting.Dictionary")
  Do While (PosOpenBoundary > 0 And PosCloseBoundary > 0 And Not isLastBoundary)
    'Entête et fichier source
    Dim HeaderContent, FieldContent, bFieldContent
    'entêtes
    Dim Content_Disposition, FormFieldName, SourceFileName, Content_Type
    'variable
    Dim Field, TwoCharsAfterEndBoundary
    'Fin de l'entête
    PosEndOfHeader = InStrB(PosOpenBoundary + Len(Boundary), Binary, StringToBinary(vbCrLf + vbCrLf))

    'Séparation des champs de l'entêter
    HeaderContent = MidB(Binary, PosOpenBoundary + LenB(Boundary) + 2, PosEndOfHeader - PosOpenBoundary - LenB(Boundary) - 2)
    
    'séparation du contenu
    bFieldContent = MidB(Binary, (PosEndOfHeader + 4), PosCloseBoundary - (PosEndOfHeader + 4) - 2)

    'séparation des champs d'entête de l'entêter
    GetHeadFields BinaryToString(HeaderContent), Content_Disposition, FormFieldName, SourceFileName, Content_Type

    'Creation d'un champs et attribution des paramètres
    Set Field = CreateUploadField()'See the JS function bellow
    Set FieldContent = CreateBinaryData(bFieldContent,LenB(bFieldContent))
'    FieldContent.ByteArray = bFieldContent
'    FieldContent.Length = LenB(bFieldContent)

    Field.Name = FormFieldName
    Field.ContentDisposition = Content_Disposition
    Field.FilePath = SourceFileName
    Field.FileName = GetFileName(SourceFileName)
    Field.ContentType = Content_Type
    Field.Length = FieldContent.Length
    Set Field.Value = FieldContent

'	response.write "<br>:" & FormFieldName
    Fields.Add FormFieldName, Field

    'Dernière borne ?
    TwoCharsAfterEndBoundary = BinaryToString(MidB(Binary, PosCloseBoundary + LenB(Boundary), 2))
    isLastBoundary = TwoCharsAfterEndBoundary = "--"

    If Not isLastBoundary Then 'Putain!!! Pas la dernière... on avance jusqu'au champ suivant.
      PosOpenBoundary = PosCloseBoundary
      PosCloseBoundary = InStrB(PosOpenBoundary + LenB(Boundary), Binary, Boundary)
    End If
  Loop
  Set SeparateFields = Fields
End Function

'********************************** Utilities **********************************

'Separation des champs d'entête de l'entête uploadé
Function GetHeadFields(ByVal Head, Content_Disposition, Name, FileName, Content_Type)
  Content_Disposition = LTrim(SeparateField(Head, "content-disposition:", ";"))

  Name = (SeparateField(Head, "name=", ";")) 'ltrim
  If Left(Name, 1) = """" Then Name = Mid(Name, 2, Len(Name) - 2)

  FileName = (SeparateField(Head, "filename=", ";")) 'ltrim
  If Left(FileName, 1) = """" Then FileName = Mid(FileName, 2, Len(FileName) - 2)

  Content_Type = LTrim(SeparateField(Head, "content-type:", ";"))
End Function

'Separation du champ entre sStart et sEnd
Function SeparateField(From, ByVal sStart, ByVal sEnd)
  Dim PosB, PosE, sFrom
  sFrom = LCase(From)
  PosB = InStr(sFrom, sStart)
  If PosB > 0 Then
    PosB = PosB + Len(sStart)
    PosE = InStr(PosB, sFrom, sEnd)
    If PosE = 0 Then PosE = InStr(PosB, sFrom, vbCrLf)
    If PosE = 0 Then PosE = Len(sFrom) + 1
    SeparateField = Mid(From, PosB, PosE - PosB)
  Else
    SeparateField = Empty
  End If
End Function

'Separation du nom de fichier du chemin
Function GetFileName(FullPath)
  Dim Pos, PosF
  PosF = 0
  For Pos = Len(FullPath) To 1 Step -1
    Select Case Mid(FullPath, Pos, 1)
      Case "/", "\": PosF = Pos + 1: Pos = 0
    End Select
  Next
  If PosF = 0 Then PosF = 1
  GetFileName = Mid(FullPath, PosF)
End Function



Function BinaryToStringSimple(Binary)
  Dim I, S
  For I = 1 To LenB(Binary)
    S = S & Chr(AscB(MidB(Binary, I, 1)))
  Next
  BinaryToStringSimple = S
End Function

Function BinaryToString(Binary)
'	BinaryToString = RSBinaryToString(Binary)
'	Exit Function


  dim cl1, cl2, cl3, pl1, pl2, pl3
  Dim L', nullchar
  cl1 = 1
  cl2 = 1
  cl3 = 1
  L = LenB(Binary)
  
  Do While cl1<=L
    pl3 = pl3 & Chr(AscB(MidB(Binary,cl1,1)))
    cl1 = cl1 + 1
    cl3 = cl3 + 1
    if cl3>300 then
      pl2 = pl2 & pl3
      pl3 = ""
      cl3 = 1
      cl2 = cl2 + 1
      if cl2>200 then
        pl1 = pl1 & pl2
        pl2 = ""
        cl2 = 1
      End If
    End If
  Loop
  BinaryToString = pl1 & pl2 & pl3
End Function


Function RSBinaryToString(xBinary)

	Dim Binary

	if vartype(xBinary)=8 then Binary = MultiByteToBinary(xBinary) else Binary = xBinary
	
  Dim RS, LBinary
  Const adLongVarChar = 201
  Set RS = CreateObject("ADODB.Recordset")
  LBinary = LenB(Binary)
	
	if LBinary>0 then
		RS.Fields.Append "mBinary", adLongVarChar, LBinary
		RS.Open
		RS.AddNew
			RS("mBinary").AppendChunk Binary 
		RS.Update
		RSBinaryToString = RS("mBinary")
	Else
		RSBinaryToString = ""
	End If
End Function

Function MultiByteToBinary(MultiByte)
  Dim RS, LMultiByte, Binary
  Const adLongVarBinary = 205
  Set RS = CreateObject("ADODB.Recordset")
  LMultiByte = LenB(MultiByte)
	if LMultiByte>0 then
		RS.Fields.Append "mBinary", adLongVarBinary, LMultiByte
		RS.Open
		RS.AddNew
			RS("mBinary").AppendChunk MultiByte & ChrB(0)
		RS.Update
		Binary = RS("mBinary").GetChunk(LMultiByte)
	End If
  MultiByteToBinary = Binary
End Function



Function StringToBinary(String)
  Dim I, B
  For I=1 to len(String)
    B = B & ChrB(Asc(Mid(String,I,1)))
  Next
  StringToBinary = B
End Function


Function vbsSaveAs(FileName, ByteArray)
  Dim FS, TextStream
  Set FS = CreateObject("Scripting.FileSystemObject")

  Set TextStream = FS.CreateTextFile(FileName)

    TextStream.Write BinaryToString(ByteArray) ' BinaryToString is in upload.inc.
  TextStream.Close
End Function


</SCRIPT>
<SCRIPT RUNAT=SERVER LANGUAGE=JSCRIPT>

function CreateUploadField(){ return new uf_Init() }
function uf_Init(){
  this.Name = null
  this.ContentDisposition = null
  this.FileName = null
  this.FilePath = null
  this.ContentType = null
  this.Value = null
  this.Length = null
}


function CreateBinaryData(Binary, mLength){ return new bin_Init(Binary, mLength) }
function bin_Init(Binary, mLength){
  this.ByteArray = Binary
  this.Length = mLength
  this.String = BinaryToString(Binary)
  this.SaveAs = jsSaveAs
}
//function jsBinaryToString(){
//  return BinaryToString(this.ByteArray)
//};
function jsSaveAs(FileName){
  return vbsSaveAs(FileName, this.ByteArray)
}
//Simulate ByteArray class by JS/VBS - end

</SCRIPT>
