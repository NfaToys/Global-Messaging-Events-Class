Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'  TTTTTTT                                         FFFFFFF                         FFFFFFF
'  T  T  T                                   t      F    F                          F    F
'     T                                      t      F                               F
'     T     aaaa   rrr rr   gggggg  eeeee   tttt    F  F    ooooo  rrr rr  mmm m    F  F
'     T         a    rr  r g    g  e     e   t      FFFF   o     o   rr  r  m m m   FFFF
'     T     aaaaa    r     g    g  eeeeeee   t      F  F   o     o   r      m m m   F  F
'     T    a    a    r     g    g  e         t      F      o     o   r      m m m   F
'     T    a    a    r      ggggg  e     e   t  t   F      o     o   r      m m m   F
'    TTT    aaaa a rrrrr        g   eeeee     tt   FFFF     ooooo  rrrrr   mm m mm FFFF
'                               g
'                           gggg

' comments can be found in the other forms source code
Dim WithEvents Obj As signals
Attribute Obj.VB_VarHelpID = -1

Private Sub Form_Load()

   Globals.dummy = 0
   Set Obj = Globals.Sig

   ' adjust window size
   Me.Move Me.WindowLeft, , 4056, 2740

End Sub

Private Sub Form_Unload(Cancel As Integer)
   Set Obj = Nothing
End Sub

Private Sub Obj_OnCloseWindow(hndl As Long)
   ' the SourceformF called the signals objects CloseAllWindows sub that
   ' sent an OnCloseWindow event to all hooked in listeners
   If (Me.Hwnd <> hndl) Then DoCmd.Close acForm, Me.Name
End Sub

Private Sub obj_OnCommand(text As String, hndl As Long)
   ' test if I broadcast this event because i'm both a sender and listener to this single event type.  If so don't process it
   If (hndl = Me.Hwnd) Then Exit Sub
   txtCommandLine = text
End Sub

Private Sub obj_OnTableUpdate(frm As Object, tbl As DAO.Recordset, uType As UpdateType)
   Select Case uType
      Case UpdateType.utRefresh
         frm.Refresh
      Case UpdateType.utRequery
         tbl.Requery
   End Select
End Sub

Private Sub txtCommandLine_Change()
   ' this simpl call is all thats needed to update the Textbox's of
   ' any and all forms hooked into the event chain
   Obj.Command Nz(Me.txtCommandLine.text, ""), Me.Hwnd
End Sub
