Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridX =24
    GridY =24
    Width =3433
    DatasheetFontHeight =11
    ItemSuffix =4
    Right =3686
    Bottom =2237
    OnUnload ="[Event Procedure]"
    RecSrcDt = Begin
        0x61bd024f1f07e640
    End
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
    DatasheetAlternateBackColor =15921906
    DatasheetGridlinesColor12 =0
    FitToScreen =1
    DatasheetBackThemeColorIndex =1
    BorderThemeColorIndex =3
    ThemeFontIndex =1
    ForeThemeColorIndex =0
    AlternateBackThemeColorIndex =1
    AlternateBackShade =95.0
    Begin
        Begin Label
            BackStyle =0
            FontSize =11
            FontName ="Calibri"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =0
            BorderTint =50.0
            ForeThemeColorIndex =0
            ForeTint =60.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            BorderLineStyle =0
            LabelX =-1800
            FontSize =11
            FontName ="Calibri"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Section
            Height =1980
            Name ="Detail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =120
                    Top =360
                    Width =3313
                    Height =299
                    ForeColor =0
                    Name ="txtCommandLine"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =120
                    LayoutCachedTop =360
                    LayoutCachedWidth =3433
                    LayoutCachedHeight =659
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =85
                    Left =61
                    Top =781
                    Width =3300
                    Height =1115
                    ForeColor =0
                    Name ="lblClone"
                    Caption ="Type letters into this textbox and they appear on the other forms. When I close,"
                        "  I'll destroy any other dymanically created forms."
                    LayoutCachedLeft =61
                    LayoutCachedTop =781
                    LayoutCachedWidth =3361
                    LayoutCachedHeight =1896
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =247
                    Left =120
                    Top =60
                    Width =2083
                    Height =326
                    FontSize =12
                    FontWeight =700
                    Name ="Label3"
                    Caption ="Close Me to close all"
                    LayoutCachedLeft =120
                    LayoutCachedTop =60
                    LayoutCachedWidth =2203
                    LayoutCachedHeight =386
                End
            End
        End
    End
End
CodeBehindForm
' See "SourceFormF.cls"
