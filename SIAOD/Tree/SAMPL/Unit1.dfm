object FMain: TFMain
  Left = 168
  Top = 18
  Width = 1011
  Height = 632
  Caption = 'Graph Drawing Demonstration (using WinGraphViz.dll)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 231
    Top = 0
    Width = 7
    Height = 601
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 231
    Height = 601
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 0
    object Button1: TButton
      Left = 8
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object WebBrowser1: TWebBrowser
    Left = 238
    Top = 0
    Width = 765
    Height = 601
    Align = alClient
    TabOrder = 1
    ControlData = {
      4C000000114F00001D3E00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
