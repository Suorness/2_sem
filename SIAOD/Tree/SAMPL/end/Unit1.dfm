object FMain: TFMain
  Left = 282
  Top = 55
  Width = 1011
  Height = 632
  Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1076#1077#1088#1077#1074#1100#1077#1074' '#1087#1086#1080#1089#1082#1072' + 3 '#1087#1088#1086#1093#1086#1076#1072
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
    Left = 321
    Top = 0
    Width = 7
    Height = 601
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 321
    Height = 601
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 0
    object Button1: TButton
      Left = 40
      Top = 128
      Width = 137
      Height = 25
      Caption = #1055#1088#1086#1096#1080#1090#1100' '#1076#1077#1088#1077#1074#1086
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 32
      Top = 88
      Width = 145
      Height = 25
      Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1076#1077#1088#1077#1074#1086
      TabOrder = 1
      OnClick = Button2Click
    end
    object EValue: TEdit
      Left = 8
      Top = 24
      Width = 185
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object LR: TMemo
      Left = 16
      Top = 184
      Width = 185
      Height = 89
      Lines.Strings = (
        'LR')
      TabOrder = 3
    end
    object LS: TMemo
      Left = 16
      Top = 296
      Width = 185
      Height = 89
      Lines.Strings = (
        'LS')
      TabOrder = 4
    end
    object LO: TMemo
      Left = 16
      Top = 400
      Width = 185
      Height = 89
      Lines.Strings = (
        'LO')
      TabOrder = 5
    end
  end
  object WebBrowser1: TWebBrowser
    Left = 328
    Top = 0
    Width = 675
    Height = 601
    Align = alClient
    TabOrder = 1
    ControlData = {
      4C000000C34500001D3E00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
