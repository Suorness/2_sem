object FAbout: TFAbout
  Left = 558
  Top = 168
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1082#1072
  ClientHeight = 398
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PTitle: TPanel
    Left = 0
    Top = 0
    Width = 531
    Height = 81
    Align = alTop
    Caption = 'PTitle'
    TabOrder = 0
    object LTitle: TLabel
      Left = 152
      Top = 17
      Width = 170
      Height = 32
      Alignment = taCenter
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BBClose: TBitBtn
      Left = 416
      Top = 24
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = BBCloseClick
    end
  end
  object PText: TPanel
    Left = 0
    Top = 81
    Width = 531
    Height = 317
    Align = alClient
    Caption = 'PText'
    TabOrder = 1
    object MMText: TMemo
      Left = 1
      Top = 1
      Width = 529
      Height = 315
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'MMText')
      ParentFont = False
      TabOrder = 0
    end
  end
end
