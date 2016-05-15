object FListPlain: TFListPlain
  Left = 736
  Top = 159
  Width = 510
  Height = 519
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
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
  object PanelListPlain: TPanel
    Left = 0
    Top = 0
    Width = 502
    Height = 488
    Align = alClient
    Caption = 'PanelListPlain'
    TabOrder = 0
    object TypePlain: TLabel
      Left = 0
      Top = 280
      Width = 124
      Height = 24
      Caption = #1058#1080#1087' '#1089#1072#1084#1086#1083#1077#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LJustWord: TLabel
      Left = 80
      Top = 232
      Width = 358
      Height = 24
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077'/'#1080#1079#1084#1077#1085#1077#1085#1080#1077'  '#1090#1080#1087#1072' '#1089#1072#1084#1086#1083#1077#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LYear: TLabel
      Left = 0
      Top = 328
      Width = 112
      Height = 24
      Caption = #1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Loil: TLabel
      Left = 0
      Top = 376
      Width = 156
      Height = 24
      Caption = #1056#1072#1089#1093#1086#1076' '#1075#1086#1088#1102#1095#1077#1075#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ListPlain: TListView
      Left = 16
      Top = 8
      Width = 465
      Height = 225
      Columns = <
        item
          Caption = #1058#1080#1087' '#1057#1072#1084#1086#1083#1077#1090#1072
          Width = 150
        end
        item
          Caption = #1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072
          Width = 150
        end
        item
          Caption = #1056#1072#1089#1093#1086#1076' '#1075#1086#1088#1102#1095#1077#1075#1086
          Width = 160
        end>
      TabOrder = 0
      ViewStyle = vsReport
    end
    object BAddEl: TButton
      Left = 8
      Top = 416
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '
      TabOrder = 1
      OnClick = BAddElClick
    end
    object EAddType: TEdit
      Left = 168
      Top = 280
      Width = 265
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object BLoadList: TButton
      Left = 8
      Top = 448
      Width = 153
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
      TabOrder = 3
      OnClick = BLoadListClick
    end
    object Bdelete: TButton
      Left = 88
      Top = 416
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '
      TabOrder = 4
      OnClick = BdeleteClick
    end
    object Bchange: TButton
      Left = 168
      Top = 416
      Width = 115
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      TabOrder = 5
      OnClick = BchangeClick
    end
    object BSaveChange: TButton
      Left = 168
      Top = 448
      Width = 121
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      TabOrder = 6
      OnClick = BSaveChangeClick
    end
    object SEYear: TSpinEdit
      Left = 168
      Top = 328
      Width = 265
      Height = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 7
      Value = 0
    end
    object SEOil: TSpinEdit
      Left = 168
      Top = 376
      Width = 265
      Height = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 8
      Value = 0
    end
  end
end
