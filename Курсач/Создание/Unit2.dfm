object FChangeData: TFChangeData
  Left = 333
  Top = 14
  Width = 644
  Height = 707
  Caption = 'FChangeData'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelInfo: TPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 676
    Align = alClient
    Caption = 'PanelInfo'
    TabOrder = 0
    object ImgPoster: TImage
      Left = 16
      Top = 64
      Width = 241
      Height = 249
      Stretch = True
    end
    object LYear: TLabel
      Left = 272
      Top = 64
      Width = 98
      Height = 20
      Caption = #1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LGenre: TLabel
      Left = 272
      Top = 112
      Width = 40
      Height = 20
      Caption = #1046#1072#1085#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LCounty: TLabel
      Left = 272
      Top = 160
      Width = 56
      Height = 20
      Caption = #1057#1090#1088#1072#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LDirerct: TLabel
      Left = 272
      Top = 208
      Width = 73
      Height = 20
      Caption = #1056#1077#1078#1080#1089#1089#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LHistory: TLabel
      Left = 272
      Top = 256
      Width = 74
      Height = 20
      Caption = #1057#1094#1077#1085#1072#1088#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LMoney: TLabel
      Left = 272
      Top = 304
      Width = 72
      Height = 20
      Caption = #1041#1102#1076#1078#1077#1085#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LMoneyUp: TLabel
      Left = 272
      Top = 352
      Width = 49
      Height = 20
      Caption = #1057#1073#1086#1088#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LWatch: TLabel
      Left = 272
      Top = 400
      Width = 66
      Height = 20
      Caption = #1047#1088#1080#1090#1077#1083#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LTime: TLabel
      Left = 272
      Top = 448
      Width = 112
      Height = 20
      Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LSubr: TLabel
      Left = 16
      Top = 480
      Width = 74
      Height = 20
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ETitle: TEdit
      Left = 24
      Top = 8
      Width = 561
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'ETitle'
    end
    object BChangePic: TButton
      Left = 16
      Top = 328
      Width = 153
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1089#1090#1077#1088
      TabOrder = 1
      OnClick = BChangePicClick
    end
    object CBGenre: TComboBox
      Left = 416
      Top = 104
      Width = 201
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 20
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        #1050#1086#1084#1077#1076#1080#1103
        #1059#1078#1072#1089#1099
        #1041#1086#1077#1074#1080#1082
        #1052#1080#1089#1090#1080#1082#1072
        #1060#1101#1085#1090#1072#1079#1080
        #1044#1088#1072#1084#1072)
    end
    object EContry: TEdit
      Left = 416
      Top = 152
      Width = 201
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'EContry'
    end
    object SPMoneyUp: TSpinEdit
      Left = 416
      Top = 344
      Width = 201
      Height = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 4
      Value = 0
    end
    object SPYear: TSpinEdit
      Left = 416
      Top = 56
      Width = 201
      Height = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 5
      Value = 0
    end
    object EDirect: TEdit
      Left = 416
      Top = 200
      Width = 201
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = 'EContry'
    end
    object EHistory: TEdit
      Left = 416
      Top = 248
      Width = 201
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Text = 'EContry'
    end
    object SPMoney: TSpinEdit
      Left = 416
      Top = 296
      Width = 201
      Height = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 8
      Value = 0
    end
    object SPWath: TSpinEdit
      Left = 416
      Top = 392
      Width = 201
      Height = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 9
      Value = 0
    end
    object SPTime: TSpinEdit
      Left = 416
      Top = 440
      Width = 201
      Height = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 10
      Value = 0
    end
    object MMSubr: TMemo
      Left = 24
      Top = 512
      Width = 585
      Height = 153
      Lines.Strings = (
        'MMSubr')
      TabOrder = 11
    end
    object BSaveChanges: TButton
      Left = 96
      Top = 376
      Width = 137
      Height = 25
      Caption = 'C'#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      TabOrder = 12
      OnClick = BSaveChangesClick
    end
    object BChanges: TButton
      Left = 24
      Top = 376
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 13
    end
    object BSave: TButton
      Left = 104
      Top = 416
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 14
      OnClick = BSaveClick
    end
  end
  object dlgAddPic: TOpenDialog
    Left = 24
    Top = 432
  end
end
