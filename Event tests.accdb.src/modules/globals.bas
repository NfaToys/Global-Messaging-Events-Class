Attribute VB_Name = "globals"
Option Compare Database
Option Explicit

' dummy variable that should be set by all listeners of the signals class
' by setting this variable it insures that the GLOBAL module gets loaded.
' Visual Basic only loads modules as needed, and we need to insure loading
' and instantiation of the global SIGNALS class object
Public dummy As Integer

' global signals class object to broadcast text to all listeners
Public Sig As New signals
