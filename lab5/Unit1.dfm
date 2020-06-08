object Form1: TForm1
  Left = 1014
  Top = 154
  Caption = 'Form1'
  ClientHeight = 433
  ClientWidth = 793
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 793
    Height = 433
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1054#1073#1084#1077#1085
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 345
        ColCount = 11
        DefaultColWidth = 70
        DefaultRowHeight = 30
        RowCount = 11
        TabOrder = 0
        ColWidths = (
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70)
        RowHeights = (
          30
          30
          30
          30
          30
          30
          30
          30
          30
          30
          30)
      end
      object Button1: TButton
        Left = 344
        Top = 352
        Width = 75
        Height = 25
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1042#1099#1073#1086#1088
      ImageIndex = 1
      object Button2: TButton
        Left = 344
        Top = 352
        Width = 75
        Height = 25
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 0
        OnClick = Button2Click
      end
      object StringGrid2: TStringGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 345
        ColCount = 11
        DefaultColWidth = 70
        DefaultRowHeight = 30
        RowCount = 11
        TabOrder = 1
        ColWidths = (
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70)
        RowHeights = (
          30
          30
          30
          30
          30
          30
          30
          30
          30
          30
          30)
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1042#1089#1090#1072#1074#1082#1072
      ImageIndex = 2
      object Button3: TButton
        Left = 344
        Top = 352
        Width = 75
        Height = 25
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 0
        OnClick = Button3Click
      end
      object StringGrid3: TStringGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 345
        ColCount = 11
        DefaultColWidth = 70
        DefaultRowHeight = 30
        RowCount = 11
        TabOrder = 1
        ColWidths = (
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70)
        RowHeights = (
          30
          30
          30
          30
          30
          30
          30
          30
          30
          30
          30)
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1064#1077#1083#1083#1072
      ImageIndex = 3
      object Button4: TButton
        Left = 344
        Top = 352
        Width = 75
        Height = 25
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 0
        OnClick = Button4Click
      end
      object StringGrid4: TStringGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 345
        ColCount = 21
        DefaultColWidth = 36
        DefaultRowHeight = 30
        RowCount = 11
        TabOrder = 1
        ColWidths = (
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36
          36)
        RowHeights = (
          30
          30
          30
          30
          30
          30
          30
          30
          30
          30
          30)
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1051#1080#1085#1077#1081#1085#1072#1103
      ImageIndex = 4
      object StringGrid5: TStringGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 345
        ColCount = 11
        DefaultColWidth = 70
        DefaultRowHeight = 30
        RowCount = 11
        TabOrder = 0
        ColWidths = (
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70)
        RowHeights = (
          30
          30
          30
          30
          30
          30
          30
          30
          30
          30
          30)
      end
      object Button5: TButton
        Left = 344
        Top = 352
        Width = 75
        Height = 25
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 1
        OnClick = Button5Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
      ImageIndex = 5
      object Label1: TLabel
        Left = 192
        Top = 352
        Width = 117
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
      end
      object StringGrid6: TStringGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 337
        ColCount = 4
        DefaultColWidth = 194
        DefaultRowHeight = 54
        RowCount = 6
        TabOrder = 0
        ColWidths = (
          194
          194
          194
          194)
        RowHeights = (
          54
          54
          54
          54
          54
          54)
      end
      object SpinEdit1: TSpinEdit
        Left = 320
        Top = 352
        Width = 121
        Height = 22
        MaxValue = 10000000
        MinValue = 10
        TabOrder = 1
        Value = 10
      end
      object Button6: TButton
        Left = 632
        Top = 352
        Width = 139
        Height = 25
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 2
        OnClick = Button6Click
      end
    end
  end
end
