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
    Width =3430
    DatasheetFontHeight =11
    ItemSuffix =2
    Left =4114
    Top =9
    Right =7826
    Bottom =1989
    OnUnload ="[Event Procedure]"
    RecSrcDt = Begin
        0xb16afc5a1f07e640
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
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =237
                    Top =299
                    Width =3115
                    Height =299
                    Name ="txtCommandLine"
                    OnChange ="[Event Procedure]"

                    LayoutCachedLeft =237
                    LayoutCachedTop =299
                    LayoutCachedWidth =3352
                    LayoutCachedHeight =598
                End
                Begin Label
                    OverlapFlags =85
                    Left =237
                    Top =659
                    Width =3118
                    Height =773
                    ForeColor =0
                    Name ="lblClone"
                    Caption ="Type letters into this textbox and they appear on the other forms"
                    LayoutCachedLeft =237
                    LayoutCachedTop =659
                    LayoutCachedWidth =3355
                    LayoutCachedHeight =1432
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
            End
        End
    End
End
CodeBehindForm
' See "TargetFormF.cls"
