VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Form_SourceFormF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'   SSSSS                                  FFFFFFF                         FFFFFFF
'  S     S                                  F    F                          F    F
'  S                                        F                               F
'  S        ooooo  uu  uu   ccccc   eeeee   F  F    ooooo  rrr rr  mmm m    F  F
'   SSSSS  o     o  u   u  c     c e     e  FFFF   o     o   rr  r  m m m   FFFF
'        S o     o  u   u  c       eeeeeee  F  F   o     o   r      m m m   F  F
'        S o     o  u   u  c       e        F      o     o   r      m m m   F
'  S     S o     o  u  uu  c     c e     e  F      o     o   r      m m m   F
'   SSSSS   ooooo    uu uu  ccccc   eeeee  FFFF     ooooo  rrrrr   mm m mm FFFF
'

' local SIGNALS class object to source events
Dim WithEvents Obj As signals
Attribute Obj.VB_VarHelpID = -1

' this requires adding a reference to the "Microsoft Scripting Runtime"
' this is used to create the user specified number of additional forms
Dim formCollection As New Scripting.Dictionary

Private Sub Form_Load()

   ' insures the global module gets loaded to instantiate the signals object before use
   Globals.dummy = 0
   
   ' get a local reference to the global signals object and hook into its event chain.
   ' you access the objects events from the drop down combo boxes just above the
   ' VBA source code editor window.
   Set Obj = Globals.Sig
   
   ' adjust window size (these numbers are for my Laptop with resolution of 2560 x 1600)
   Me.Move Me.WindowLeft, , 3775, 2740
   
   ' open the other other form that also hooks into the global objects event chain.
   ' there are no practical limts to the number of senders and listeners that can
   ' source and sink the global objects events
   DoCmd.OpenForm "TargetFormF", acNormal
   DoEvents
   
   ' create 'N' additional TargetFormF objects, showing that all of them can take
   ' part in the event messaging system without knowing how many senders or listeners
   ' exist, or anything about who or what they are.
   CreateFormCollection

End Sub

Private Sub Form_Unload(Cancel As Integer)
   
   ' destroy all the dynamically created additional TargetForF forms
   CloseFormCollection

   ' unload the reference and unhook from the event chain
   Set Obj = Nothing

End Sub

' create some additional dynamic forms that also hook into the event chain
' no additional code is needed to communicate with them
Public Sub CreateFormCollection()

   Dim I As Integer
   Dim numForms As Integer
   
   ' Number of dynamic forms to create
   numForms = 0
   
   On Error GoTo exitout
   numForms = CInt(InputBox("Enter a NUMBER of additional TargetFormT forms to create - ( 0 to 8 )", "Input Number"))
   
   numForms = IIf(numForms < 0, 1, IIf(numForms > 8, 8, numForms))
   
   For I = 1 To numForms
   
      Dim newForm As Form_TargetFormF
      Set newForm = New Form_TargetFormF
      
      newForm.Caption = "TargetFormF " & I
      newForm.Move newForm.WindowLeft + (600 * I), newForm.WindowTop + (300 * I)
      
      formCollection.Add "Form_" & I, newForm   ' Assign a unique name to each form
      newForm.Visible = True                    ' display the form
      
   Next I
   
exitout:
    
End Sub

' destroy the dynamically created TargetFormF forms
Public Sub CloseFormCollection()
   Obj.CloseAllWindows Me.Hwnd
End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' process Event from event chain tied into global signals class
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Private Sub obj_OnCommand(text As String, hndl As Long)

   ' test if I broadcast this event because i'm both a sender and listener to this single event type.  If so don't process it
   If (hndl = Me.Hwnd) Then Exit Sub
   
   ' update the textbox because some other event sender has changed the data.
   ' chnging text programatically DOES NOT cause a "Change Event" to fire.
   txtCommandLine = text

End Sub

Private Sub txtCommandLine_Change()

   ' inform any and all other listeners that my textbox data changed
   Obj.Command Nz(Me.txtCommandLine.text, ""), Me.Hwnd
   
End Sub
