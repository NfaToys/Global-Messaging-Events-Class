VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "SizeAndLocation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

'=========================================================================================================================
'
'   SSSSS     i                      AA                dd  LLLLL                                      i
'  S     S                            A                 d    L                               t
'  S                                  A                 d    L                               t
'  S        iii    zzzzzz   eeeee    A A   nn nn    ddddd    L      ooooo   ccccc   aaaa    tttt    iii     ooooo  nn nn
'   SSSSS     i    z   z   e     e   A A    nn  n  d    d    L     o     o c     c      a    t        i    o     o  nn  n
'        S    i       z    eeeeeee  A   A   n   n  d    d    L     o     o c        aaaaa    t        i    o     o  n   n
'        S    i      z     e        AAAAA   n   n  d    d    L     o     o c       a    a    t        i    o     o  n   n
'  S     S    i     z   z  e     e  A   A   n   n  d    d    L   L o     o c     c a    a    t  t     i    o     o  n   n
'   SSSSS   iiiii  zzzzzz   eeeee  AAA AAA nnn nnn  dddddd LLLLLLL  ooooo   ccccc   aaaa a    tt    iiiii   ooooo  nnn nnn

'
' Microsoft Access VBA Class: SizeAndLocation, written by Gary James, Sept 20, 2023
' Add this class to your Access project to save and restore your forms size and location
' upon opening.
'
'
'  UUU UUU
'   U   U
'   U   U
'   U   U   sssss   aaaa    gggggg  eeeee
'   U   U  s     s      a  g    g  e     e
'   U   U   sss     aaaaa  g    g  eeeeeee
'   U   U      ss  a    a  g    g  e
'   U   U  s     s a    a   ggggg  e     e
'    UUU    sssss   aaaa a      g   eeeee
'                               g
'                           gggg
'
' To use this class set your Form "Border Style" to "Sizable" and "Min Max Buttons" to "None"
' this code does NOT include support to restore a Form to a Maximized or Minimized state.
'
'Option Compare Database
'Option Explicit
'
''  place this at the top of the Forms code module
'Private sl As New SizeAndLocation
'
''  place this in the Forms Open Event
'Private Sub Form_Open(Cancel As Integer)
'   Set sl.MyForm = Me.Form
'End Sub
'
''  place this in the Forms Unload Event
'Private Sub Form_Unload(Cancel As Integer)
'   sl.Save
'   Set sl = Nothing
'End Sub

'=========================================================================================================================

Private Const tableName As String = "Orientation"
Private Const TABLEID As String = "SizeAndPosID"
Private Const FORMNAME As String = "FormName"
Private Const FORMWIDTH As String = "FormWidth"
Private Const FORMHEIGHT As String = "FormHeight"
Private Const FORMLEFT As String = "FormLeft"
Private Const FORMTOP As String = "FormTop"

Dim fw As Long
Dim fh As Long
Dim fl As Long
Dim ft As Long

Private frm As Form
Attribute frm.VB_VarHelpID = -1

Private Sub Class_Initialize()
   Set frm = Nothing
End Sub

Public Property Set MyForm(f As Form)
   Set frm = f
   Me.Load
End Property

Public Property Get MyForm() As Form
   Set MyForm = frm
End Property

Public Property Get Width() As Long
   Width = fw
End Property

Public Property Get Height() As Long
   Height = fh
End Property

Public Property Get Left() As Long
   Left = fl
End Property

Public Property Get Top() As Long
   Top = ft
End Property

Function TableExists(tblName As String) As Boolean

   Dim tdf As TableDef

   TableExists = False

   On Error Resume Next

   ' Check each table in the current database
   For Each tdf In CurrentDb.TableDefs
      If tdf.Name = tblName Then
         TableExists = True
         Exit Function
      End If
   Next tdf


End Function

Public Sub Load()

   Dim sqlStr As String
   Dim rs As Recordset
   Dim tdf As TableDef
   Dim fld As field

   ' get default size & location of the form
   fw = frm.WindowWidth
   fh = frm.WindowHeight
   fl = frm.WindowLeft
   ft = frm.WindowTop

   On Error GoTo err1

   ' check if the size and position table exists.  if not create it
   If (Not TableExists(tableName)) Then

      ' create it
      Set tdf = CurrentDb.CreateTableDef(tableName)

      ' Add fields to the table

      ' Add ID field
      Set fld = tdf.CreateField(TABLEID, dbLong)
      fld.Attributes = dbAutoIncrField
      tdf.Fields.Append fld

      ' Add name field
      Set fld = tdf.CreateField(FORMNAME, dbText, 255)
      tdf.Fields.Append fld

      ' Add size & position fields
      Set fld = tdf.CreateField(FORMWIDTH, dbLong, 16)
      tdf.Fields.Append fld

      Set fld = tdf.CreateField(FORMHEIGHT, dbLong, 16)
      tdf.Fields.Append fld

      Set fld = tdf.CreateField(FORMLEFT, dbLong, 16)
      tdf.Fields.Append fld

      Set fld = tdf.CreateField(FORMTOP, dbLong, 16)
      tdf.Fields.Append fld

      ' Append the table to the database
      CurrentDb.TableDefs.Append tdf

      Set tdf = Nothing
      Set fld = Nothing

   End If

   ' try to replqce the default size and location values with data from the table
   Set rs = CurrentDb.OpenRecordset(tableName, dbOpenDynaset)

   sqlStr = FORMNAME & "=" & "'" & frm.Name & "'"
   rs.FindFirst sqlStr

   ' if the record for this form exists, get its values and replace the defaults
   If (rs.NoMatch = False) Then
      fw = Nz(rs(FORMWIDTH), 7000)
      fh = Nz(rs(FORMHEIGHT), 3500)
      fl = Nz(rs(FORMLEFT), 0)
      ft = Nz(rs(FORMTOP), 0)

   ' else use default values znd save to table
   Else
      rs.AddNew
      rs(FORMNAME) = frm.Name
      rs(FORMWIDTH) = fw
      rs(FORMHEIGHT) = fh
      rs(FORMLEFT) = fl
      rs(FORMTOP) = ft
      rs.Update
   End If

err1:

   If (Not IsNull(rs)) Then
      rs.Close
   End If

   Set rs = Nothing

   ' set size and position of the form
   frm.Move fl, ft, fw, fh

   On Error GoTo 0

End Sub

Public Sub Update()

   Dim rs As Recordset
   Dim sqlStr As String

   On Error GoTo err1

   ' open recordset for updating
   Set rs = CurrentDb.OpenRecordset(tableName, dbOpenDynaset)

   ' done if doesn't exist
   If (IsNull(rs)) Then Exit Sub

   ' if form is valid
   If (Not frm Is Nothing) Then
      sqlStr = "FormName=" & "'" & frm.Name & "'"

      ' find the forms record in the table
      rs.FindFirst sqlStr

      ' if the record for this form exists, update the field
      ' values with the forms current size and position
      If (rs.NoMatch = False) Then
         rs.Edit
         rs(FORMWIDTH) = frm.WindowWidth
         rs(FORMHEIGHT) = frm.WindowHeight
         rs(FORMLEFT) = frm.WindowLeft
         rs(FORMTOP) = frm.WindowTop
         rs.Update
      End If
   End If

   rs.Close
   Set rs = Nothing

err1:

   On Error GoTo 0

End Sub

Public Sub Save()
   Me.Update
End Sub
