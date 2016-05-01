object FMain: TFMain
  Left = 358
  Top = 47
  Width = 825
  Height = 641
  Caption = 'FMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
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
  object ButtomListPlain: TButton
    Left = 680
    Top = 448
    Width = 113
    Height = 25
    Caption = 'OpenListPlain'
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
  object BTest: TButton
    Left = 736
    Top = 328
    Width = 75
    Height = 25
    Caption = 'BTest'
    TabOrder = 6
    OnClick = BTestClick
  end
  object BTest2: TButton
    Left = 736
    Top = 368
    Width = 75
    Height = 25
    Caption = 'BTest2'
    TabOrder = 7
  end
  object BAddDataList: TButton
    Left = 368
    Top = 480
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 8
    OnClick = BAddDataListClick
  end
  object BDowloadData: TButton
    Left = 456
    Top = 480
    Width = 137
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 9
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
    TabOrder = 10
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
    TabOrder = 11
    Value = 0
  end
  object BDel: TButton
    Left = 360
    Top = 520
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 12
    OnClick = BDelClick
  end
end
