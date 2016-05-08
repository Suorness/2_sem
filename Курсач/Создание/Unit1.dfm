object FMain: TFMain
  Left = 162
  Top = 34
  Width = 1157
  Height = 678
  Caption = 'FMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = TopMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 232
    Top = 344
    Width = 265
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object PanelFilm: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 289
    Caption = 'PanelFilm'
    TabOrder = 1
    object LVFilm: TListView
      Left = 1
      Top = 1
      Width = 671
      Height = 287
      Align = alClient
      Columns = <
        item
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 150
        end
        item
          Caption = #1043#1086#1076
          Width = 150
        end
        item
          Caption = #1046#1072#1085#1088
          Width = 150
        end>
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object PFunction: TPanel
    Left = 704
    Top = 0
    Width = 445
    Height = 627
    Align = alRight
    Caption = 'PFunction'
    TabOrder = 2
    object BAdd: TButton
      Left = 24
      Top = 40
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = BAddClick
    end
    object BChange: TButton
      Left = 144
      Top = 40
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = BChangeClick
    end
    object BDelet: TButton
      Left = 288
      Top = 40
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = BDeletClick
    end
    object BTEstSave: TButton
      Left = 136
      Top = 136
      Width = 75
      Height = 25
      Caption = 'BTEstSave'
      TabOrder = 3
      OnClick = BTEstSaveClick
    end
    object BTestOpen: TButton
      Left = 24
      Top = 144
      Width = 75
      Height = 25
      Caption = 'BTestOpen'
      TabOrder = 4
      OnClick = BTestOpenClick
    end
  end
  object TopMenu: TMainMenu
    Left = 288
    Top = 472
    object TopFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object TopFileNew: TMenuItem
        Caption = #1053#1086#1074#1099#1081
        OnClick = TopFileNewClick
      end
      object TopFileOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = TopFileOpenClick
      end
      object TopFileSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      end
      object TopFileSaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
      end
    end
  end
  object dlgOpen: TOpenDialog
    Left = 360
    Top = 472
  end
end
