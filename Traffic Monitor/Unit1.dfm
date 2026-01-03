object Form1: TForm1
  Left = 437
  Top = 179
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Traffic Monitor'
  ClientHeight = 376
  ClientWidth = 484
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 309
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    object GroupBox: TGroupBox
      Left = 5
      Top = 5
      Width = 474
      Height = 278
      Align = alClient
      Enabled = False
      TabOrder = 0
      DesignSize = (
        474
        278)
      object LabelEdit1: TLabeledEdit
        Left = 8
        Top = 32
        Width = 265
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        Ctl3D = False
        EditLabel.Width = 100
        EditLabel.Height = 13
        EditLabel.Caption = 'Adapter description : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        OnChange = LabelEdit1Change
      end
      object LabelEdit2: TLabeledEdit
        Left = 279
        Top = 32
        Width = 103
        Height = 19
        Anchors = [akTop, akRight]
        Color = clBtnFace
        Ctl3D = False
        EditLabel.Width = 70
        EditLabel.Height = 13
        EditLabel.Caption = 'MAC Address :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object gbIN: TGroupBox
        Left = 8
        Top = 124
        Width = 457
        Height = 61
        Caption = 'IN (download)'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 2
        object LabelEdit6: TLabeledEdit
          Left = 8
          Top = 32
          Width = 85
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = 'Traffic / sec.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object LabelEdit8: TLabeledEdit
          Left = 184
          Top = 32
          Width = 85
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          EditLabel.Width = 74
          EditLabel.Height = 13
          EditLabel.Caption = 'Average / sec.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object LabelEdit7: TLabeledEdit
          Left = 96
          Top = 32
          Width = 85
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Peak / sec.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object LabelEdit9: TLabeledEdit
          Left = 276
          Top = 32
          Width = 65
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          EditLabel.Width = 41
          EditLabel.Height = 13
          EditLabel.Caption = 'TOTAL :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object gbOUT: TGroupBox
        Left = 8
        Top = 188
        Width = 457
        Height = 61
        Caption = 'OUT (upload)'
        TabOrder = 3
        object LabelEdit10: TLabeledEdit
          Left = 8
          Top = 32
          Width = 85
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = 'Traffic / sec.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object LabelEdit12: TLabeledEdit
          Left = 184
          Top = 32
          Width = 85
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          EditLabel.Width = 74
          EditLabel.Height = 13
          EditLabel.Caption = 'Average / sec.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object LabelEdit11: TLabeledEdit
          Left = 96
          Top = 32
          Width = 85
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Peak / sec.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object LabelEdit13: TLabeledEdit
          Left = 276
          Top = 32
          Width = 65
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          EditLabel.Width = 41
          EditLabel.Height = 13
          EditLabel.Caption = 'TOTAL.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object gbTime: TGroupBox
        Left = 8
        Top = 60
        Width = 457
        Height = 61
        Caption = 'From last reset:'
        TabOrder = 4
        object LabelEdit4: TLabeledEdit
          Left = 8
          Top = 32
          Width = 141
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'Started at :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object LabelEdit5: TLabeledEdit
          Left = 156
          Top = 32
          Width = 113
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Duration :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object StatusText: TStaticText
        Left = 2
        Top = 259
        Width = 470
        Height = 17
        Align = alBottom
        BevelInner = bvNone
        Caption = 'StatusText'
        Color = clCream
        ParentColor = False
        TabOrder = 5
      end
      object LabelEdit3: TLabeledEdit
        Left = 386
        Top = 32
        Width = 73
        Height = 19
        Anchors = [akTop, akRight]
        Color = clBtnFace
        Ctl3D = False
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'Speed :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object TabSet1: TTabSet
      Left = 5
      Top = 283
      Width = 474
      Height = 21
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      SoftTop = True
      Tabs.Strings = (
        '1'
        '2'
        '3')
      TabIndex = 0
      OnChange = TabSet1Change
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 309
    Width = 484
    Height = 67
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    DesignSize = (
      484
      67)
    object ExitButton: TButton
      Left = 401
      Top = 40
      Width = 76
      Height = 20
      Anchors = [akTop, akRight]
      Caption = 'Exit'
      Default = True
      ModalResult = 1
      TabOrder = 0
      TabStop = False
      OnClick = ExitButtonClick
    end
    object UnFreezeButton: TBitBtn
      Left = 80
      Top = 38
      Width = 65
      Height = 20
      Caption = 'Unfreeze'
      TabOrder = 1
      TabStop = False
      OnClick = UnFreezeButtonClick
    end
    object FreezeButton: TBitBtn
      Left = 8
      Top = 38
      Width = 65
      Height = 20
      Caption = 'Freeze'
      TabOrder = 2
      TabStop = False
      OnClick = FreezeButtonClick
    end
    object ClearCountersButton: TBitBtn
      Left = 152
      Top = 38
      Width = 89
      Height = 20
      Caption = 'Clear counters'
      TabOrder = 3
      TabStop = False
      OnClick = ClearCountersButtonClick
    end
    object RemoveInactiveButton: TBitBtn
      Left = 244
      Top = 38
      Width = 65
      Height = 20
      Caption = 'Remove'
      TabOrder = 4
      TabStop = False
      OnClick = RemoveInactiveButtonClick
    end
    object cbOnTop: TCheckBox
      Left = 11
      Top = 9
      Width = 86
      Height = 17
      TabStop = False
      Caption = 'Stay On Top'
      TabOrder = 5
      OnClick = cbOnTopClick
    end
    object CheckBox1: TCheckBox
      Left = 112
      Top = 8
      Width = 73
      Height = 17
      TabStop = False
      Caption = 'Start/Stop'
      TabOrder = 6
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 192
      Top = 8
      Width = 31
      Height = 17
      Caption = 'In'
      Checked = True
      State = cbChecked
      TabOrder = 7
      OnClick = CheckBox2Click
    end
    object CheckBox3: TCheckBox
      Left = 232
      Top = 8
      Width = 38
      Height = 17
      Caption = 'Out'
      Checked = True
      State = cbChecked
      TabOrder = 8
      OnClick = CheckBox3Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 404
    Top = 80
  end
end
