object FSort: TFSort
  Left = 761
  Top = 245
  BorderStyle = bsSingle
  Caption = 'FSort'
  ClientHeight = 321
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LText: TLabel
    Left = 64
    Top = 8
    Width = 204
    Height = 25
    Caption = #1042#1072#1088#1080#1072#1085#1090#1099' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BBSort: TBitBtn
    Left = 160
    Top = 248
    Width = 147
    Height = 25
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 0
    OnClick = BBSortClick
  end
  object RGTypeSort: TRadioGroup
    Left = 24
    Top = 40
    Width = 289
    Height = 193
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Items.Strings = (
      #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102
      #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1075#1086#1076#1091' '#1074#1099#1087#1091#1089#1082#1072
      #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1080
      #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1089#1090#1088#1072#1085#1072#1084)
    ParentFont = False
    TabOrder = 1
  end
end
