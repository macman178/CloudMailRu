object Descriptions: TDescriptions
  Left = 0
  Top = 0
  Caption = 'Descriptions'
  ClientHeight = 719
  ClientWidth = 1295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 579
    Top = 0
    Width = 7
    Height = 719
    ExplicitLeft = 744
    ExplicitTop = 114
    ExplicitHeight = 709
  end
  object Keys: TListBox
    Left = 0
    Top = 0
    Width = 579
    Height = 719
    Align = alLeft
    ItemHeight = 13
    TabOrder = 0
    OnClick = KeysClick
    ExplicitWidth = 321
  end
  object Panel1: TPanel
    Left = 586
    Top = 0
    Width = 709
    Height = 719
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitLeft = 816
    ExplicitTop = 336
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Splitter2: TSplitter
      Left = 1
      Top = 393
      Width = 707
      Height = 5
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 399
    end
    object description: TMemo
      Left = 1
      Top = 1
      Width = 707
      Height = 392
      Align = alTop
      TabOrder = 0
    end
    object Hex: TMemo
      Left = 1
      Top = 398
      Width = 707
      Height = 320
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 272
      ExplicitTop = 504
      ExplicitWidth = 185
      ExplicitHeight = 89
    end
  end
  object dlgOpen: TOpenDialog
    Left = 1032
    Top = 136
  end
  object MainMenu1: TMainMenu
    Left = 1072
    Top = 88
    object OpenItem: TMenuItem
      Caption = 'Open'
      ShortCut = 16463
      OnClick = OpenItemClick
    end
    object SaveItem: TMenuItem
      Caption = 'Save'
      ShortCut = 16467
    end
  end
end
