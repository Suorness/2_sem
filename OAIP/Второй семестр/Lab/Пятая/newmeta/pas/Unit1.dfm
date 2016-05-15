object FMain: TFMain
  Left = 339
  Top = 9
  Width = 825
  Height = 641
  Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1077#1090#1086#1074
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
  object LabMainText: TLabel
    Left = 16
    Top = 240
    Width = 295
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077'/'#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1088#1077#1081#1089#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabNumberFlight: TLabel
    Left = 8
    Top = 280
    Width = 98
    Height = 20
    Caption = #1053#1086#1084#1077#1088' '#1088#1077#1081#1089#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabPlace: TLabel
    Left = 8
    Top = 320
    Width = 138
    Height = 20
    Caption = #1055#1091#1085#1082#1090' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabRange: TLabel
    Left = 8
    Top = 360
    Width = 143
    Height = 20
    Caption = #1044#1072#1083#1100#1085#1086#1089#1090#1100' '#1087#1086#1083#1077#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabAirCraft: TLabel
    Left = 8
    Top = 400
    Width = 105
    Height = 20
    Caption = #1058#1080#1087' '#1089#1072#1084#1086#1083#1077#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabTimeOutPut: TLabel
    Left = 8
    Top = 440
    Width = 110
    Height = 20
    Caption = #1042#1088#1077#1084#1103' '#1074#1099#1083#1077#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabComing: TLabel
    Left = 8
    Top = 480
    Width = 154
    Height = 20
    Caption = #1042#1088#1077#1084#1103' '#1087#1088#1080#1079#1077#1084#1083#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabSearchText: TLabel
    Left = 480
    Top = 248
    Width = 321
    Height = 25
    Caption = #1055#1086#1080#1089#1082' '#1088#1077#1081#1089#1072' '#1087#1086' '#1087#1091#1085#1082#1090#1091' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 464
    Top = 520
    Width = 297
    Height = 25
    Caption = #1043#1086#1088#1102#1095#1080#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1077' '#1085#1072' '#1089#1091#1090#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ButtomListPlain: TButton
    Left = 328
    Top = 584
    Width = 161
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
    TabOrder = 0
    OnClick = ButtomListPlainClick
  end
  object ListTable: TListView
    Left = -8
    Top = 0
    Width = 825
    Height = 241
    Columns = <
      item
        Caption = #1053#1086#1084#1077#1088' '#1056#1077#1081#1089#1072
        Width = 150
      end
      item
        Caption = #1055#1091#1085#1082#1090' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        Width = 150
      end
      item
        Caption = #1044#1072#1083#1100#1085#1086#1089#1090#1100' '#1087#1086#1083#1077#1090#1072
        Width = 150
      end
      item
        Caption = #1058#1080#1087' '#1089#1072#1084#1086#1083#1077#1090#1072
        Width = 150
      end
      item
        Caption = #1042#1088#1077#1084#1103' '#1074#1099#1083#1077#1090#1072
        Width = 100
      end
      item
        Caption = #1042#1088#1077#1084#1103' '#1087#1088#1080#1079#1077#1084#1083#1077#1085#1080#1103
        Width = 120
      end>
    TabOrder = 1
    ViewStyle = vsReport
    OnChange = ListTableChange
  end
  object EPlace: TEdit
    Left = 168
    Top = 312
    Width = 185
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ComboBoxAirPlain: TComboBox
    Left = 168
    Top = 392
    Width = 185
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 3
    OnDropDown = ComboBoxAirPlainDropDown
  end
  object TimeOutPut: TDateTimePicker
    Left = 168
    Top = 432
    Width = 186
    Height = 28
    Date = 42489.500000000000000000
    Time = 42489.500000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Kind = dtkTime
    ParentFont = False
    TabOrder = 4
    TabStop = False
  end
  object TimeComing: TDateTimePicker
    Left = 168
    Top = 472
    Width = 186
    Height = 28
    Date = 42489.500000000000000000
    Time = 42489.500000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Kind = dtkTime
    ParentFont = False
    TabOrder = 5
  end
  object BAddDataList: TButton
    Left = 8
    Top = 512
    Width = 89
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 6
    OnClick = BAddDataListClick
  end
  object BDowloadData: TButton
    Left = 216
    Top = 512
    Width = 137
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 7
    OnClick = BDowloadDataClick
  end
  object SENumberFlight: TSpinEdit
    Left = 168
    Top = 272
    Width = 185
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
  object SERange: TSpinEdit
    Left = 168
    Top = 352
    Width = 185
    Height = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxValue = 0
    MinValue = 0
    ParentFont = False
    TabOrder = 9
    Value = 0
  end
  object BDel: TButton
    Left = 112
    Top = 512
    Width = 89
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 10
    OnClick = BDelClick
  end
  object BChange: TButton
    Left = 8
    Top = 552
    Width = 113
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 11
    OnClick = BChangeClick
  end
  object BSaveChanges: TButton
    Left = 136
    Top = 552
    Width = 145
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    TabOrder = 12
    OnClick = BSaveChangesClick
  end
  object ESearchPlace: TEdit
    Left = 576
    Top = 288
    Width = 201
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
  end
  object BSearchPlace: TButton
    Left = 480
    Top = 288
    Width = 75
    Height = 25
    Caption = #1048#1089#1082#1072#1090#1100
    TabOrder = 14
    OnClick = BSearchPlaceClick
  end
  object ListSearchResult: TListView
    Left = 480
    Top = 328
    Width = 305
    Height = 185
    Columns = <
      item
        Caption = #1053#1086#1084#1077#1088' '#1088#1077#1081#1089#1072
        Width = 150
      end
      item
        Caption = #1042#1088#1077#1084#1103' '#1074#1099#1083#1077#1090#1072
        Width = 150
      end>
    TabOrder = 15
    ViewStyle = vsReport
  end
  object EOilResult: TEdit
    Left = 584
    Top = 560
    Width = 185
    Height = 28
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
  end
end
