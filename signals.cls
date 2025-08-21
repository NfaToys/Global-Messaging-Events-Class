VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "signals"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Compare Database
Option Explicit

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'  EEEEEEE                                   ll                      CCCC    ll
'   E    E                                    l                     C    C    l
'   E                                         l                    C          l
'   E  E   xxx xxx  aaaa   mmm m   pppppp     l     eeeee          C          l     aaaa    sssss   sssss
'   EEEE    x   x       a   m m m   p    p    l    e     e         C          l         a  s     s s     s
'   E  E     xxx    aaaaa   m m m   p    p    l    eeeeeee         C          l     aaaaa   sss     sss
'   E        xxx   a    a   m m m   p    p    l    e               C          l    a    a      ss      ss
'   E    E  x   x  a    a   m m m   p    p    l    e     e          C    C    l    a    a  s     s s     s
'  EEEEEEE xxx xxx  aaaa a mm m mm  ppppp   lllll   eeeee            CCCC   lllll   aaaa a  sssss   sssss
'                                   p
'                                  ppp
'             i            hh
'                    t      h                                                t
'                    t      h                                                t
'  www www  iii     tttt    h hh            eeeee  vvv vvv  eeeee  nn nn    tttt
'   w   w     i      t      hh  h          e     e  v   v  e     e  nn  n    t
'   w w w     i      t      h   h          eeeeeee  v   v  eeeeeee  n   n    t
'   w w w     i      t      h   h          e         v v   e        n   n    t
'    w w      i      t  t   h   h          e     e   v v   e     e  n   n    t  t
'    w w    iiiii     tt   hhh hhh          eeeee     v     eeeee  nnn nnn    tt
'
'
' This public class instance can be customized to provide any type of events that your program
' needs to update all Forms that have hooked into the event chain.
'
' This example broadcasts the senders window handle and string data to all listener Forms.
' If a form has multiple calling points that send data, a caller ID could be sent instead
' to also allow the form to process its own events that effect other components.  Likewise
' an enum could be sent identifying the type of data being updated.
'
' You can customize this event class however you need.  You can also add additional events
' by declaring the event sub along with an associated event trigger function.

' possible custom type for processing events
Public Enum UpdateType
   utRefresh
   utRequery
End Enum

' trigger functions that user code calls to fire the associated
' event in every form that has hooked into the event chain of the
' global singleton instance of this class in the globals module.
Public Event OnCommand(text As String, hndl As Long)
Public Event OnTableUpdate(frm As Object, tbl As DAO.Recordset, uType As UpdateType)
Public Event OnCloseWindow(hndl As Long)

' public function to send event passing text and window handle values to all forms hooked into the event chain
Public Sub Command(text As String, Optional hndl As Long = 0)
   RaiseEvent OnCommand(text, hndl)
End Sub

' possible function to send a Table Update event to all active forms hooked into the event chain
Public Sub TableUpdate(frm As Form, tbl As DAO.Recordset, uType As UpdateType)
   RaiseEvent OnTableUpdate(frm, tbl, uType)
End Sub

' possible function to send an event telling all open project windows to shut down gracefully
Public Sub CloseAllWindows(hndl As Long)
   RaiseEvent OnCloseWindow(hndl)
End Sub
