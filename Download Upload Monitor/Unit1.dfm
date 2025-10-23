object Form1: TForm1
  Left = 1742
  Top = 167
  AlphaBlend = True
  AlphaBlendValue = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Download Upload Monitor'
  ClientHeight = 511
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Label2: TLabel
    Left = 23
    Top = 389
    Width = 43
    Height = 13
    Caption = 'Adapter :'
  end
  object Label4: TLabel
    Left = 8
    Top = 427
    Width = 58
    Height = 13
    Caption = 'Network Ip :'
  end
  object Label5: TLabel
    Left = 18
    Top = 446
    Width = 48
    Height = 13
    Caption = 'Gateway :'
  end
  object Label6: TLabel
    Left = 30
    Top = 465
    Width = 36
    Height = 13
    Caption = 'DHCP :'
  end
  object Label7: TLabel
    Left = 69
    Top = 389
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 69
    Top = 427
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 69
    Top = 446
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 69
    Top = 465
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 38
    Top = 408
    Width = 28
    Height = 13
    Caption = 'IPv6 :'
  end
  object Label12: TLabel
    Left = 69
    Top = 408
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Grp_Interfaces: TGroupBox
    Left = 7
    Top = 7
    Width = 378
    Height = 74
    Caption = 'Network Interface : '
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 20
      Width = 212
      Height = 13
      Caption = 'Choose an interface to get Traffic information'
    end
    object Image1: TImage
      Left = 13
      Top = 20
      Width = 20
      Height = 17
      Picture.Data = {
        055449636F6E0000010001001010000001002000680400001600000028000000
        1000000020000000010020000000000040040000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000004A1E0B2463361BB75025112900000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        3D10004DCE9F6FFFAB784DFF3F16042400000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000002D00003F
        966B4BFFFFF7C4FF946341FF2F03004300000000000000000000000000000000
        000000000000000000000000000000003C0C00215A2C14A77E553AE88C674AFF
        CAAA87FFFFDCB3FFAF8764FF54270DFE3F1200C9461A08520000000000000000
        000000000000000000000000592B136AA7886AFFD2B699FFE7CAA8FFFDE4BFFF
        FFE9C7FFFFF8D1FFF5D6B3FFD8B893FFAD8964FF5E2F15FF3E1100A100000000
        0000000000000000885E3D74CAB59AFFEDD5B8FFFFEBCCFFF8D6B7FFC0704FFF
        E99563FFDD8D5CFFDFA67BFFFFE7C3FFF4D6B1FFD7B694FF734729FF3C11009A
        0000000060331929CBB8A2FFEED8C1FFFFEFD1FFFFEECFFFFFFFE2FFB48162FF
        790000FF8F2E06FFF7E5C4FFFFEDCBFFFFE7C3FFF5D7B7FFDABD9BFF5B2D14FF
        471B0837AD9177B3E8DBC7FFFFF0D7FFFFECD2FFFFE7CEFFFFFFEDFFCFB295FF
        6F0000FFA45837FFFFFFF0FFFFE7C9FFFFE5C6FFFFEAC9FFFCE3C5FFAD8A6BFF
        3E0F0092CFBFAEFFF8E7D5FFFFF4DFFFFFECD6FFFFECD6FFFFFFF3FFCDAF94FF
        740000FFA55736FFFFFFF1FFFFE8CFFFFFE5CAFFFFEACFFFFFEBD1FFE4CAAFFF
        4B1D07A8CFC2B7FFFDEFE0FFFFF4E3FFFFEFDEFFFFF0DCFFFFFFFFFFD6C1AAFF
        770000FFA65836FFFFFFF8FFFFEDD5FFFFE9D0FFFFECD2FFFFF2D9FFECD7C0FF
        491E09A9D0C7BDFFFDF5E9FFFFF8EBFFFFF2E6FFFFFDEFFFEFE6DAFF8C3D1EFF
        650000FF8C3C23FFFFFFFEFFFFF0DDFFFFEBD6FFFFEED9FFFFFAE5FFF2DEC9FF
        4B1F0A93D9CCBED8F7F4EFFFFFFFF9FFFFF6ECFFFFFFF9FFE6D9C9FFB39382FF
        BAA59AFFC2AEA3FFFFFFF8FFFFF4E3FFFFEEDCFFFFFAEBFFFFFFFCFFE2CAB4FF
        42110036E2C9B254E4E5E5FFFFFFFFFFFFFFFAFFFFFBF3FFFFFFFFFFFFFFFAFF
        F9C8A6FFFFFEEEFFFFFFFFFFFFF5E8FFFFFAEFFFFFFFFFFFFFFFFFFF8A6750AF
        0000000000000000E2DBD3AAEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFF8E574EFF
        5D0000FF9A4528FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAB2A0DC00000000
        000000000000000000000000E6DCD391F2F4F5FFFFFFFFFFFFFFFFFFD7CEC9FF
        624144FFC5B5AFFFFFFFFFFFFFFFFFFFFFFFFEFFDCCCBEA40000000000000000
        00000000000000000000000000000000D3CAC226DBCFC395F5F2EEEFFFFFFFFF
        FFFFFFFFFFFFFFFFFBF8F3F3BFAB9D9D7B56402E000000000000000000000000
        00000000FF1F0000FE1F0000FC1F0000E0070000C00300008001000000000000
        00000000000000000000000000000000000000000001000080030000C0070000
        E00F0000}
    end
    object ComboBox1: TComboBox
      Left = 13
      Top = 44
      Width = 351
      Height = 21
      Cursor = crHandPoint
      Style = csDropDownList
      DropDownCount = 25
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnChange = ComboBox1Change
    end
  end
  object Grp_Info_Interface: TGroupBox
    Left = 7
    Top = 85
    Width = 378
    Height = 105
    Caption = 'Information Interface :'
    TabOrder = 1
    object Panel2: TPanel
      Left = 240
      Top = 25
      Width = 41
      Height = 21
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'MTU :'
      TabOrder = 0
    end
    object Edt_MTU: TEdit
      Left = 287
      Top = 25
      Width = 77
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 36
      Top = 24
      Width = 55
      Height = 21
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'Speed : '
      TabOrder = 2
    end
    object Edt_Speed: TEdit
      Left = 94
      Top = 24
      Width = 123
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object Panel4: TPanel
      Left = 14
      Top = 47
      Width = 77
      Height = 21
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'MAC address : '
      TabOrder = 4
    end
    object Edt_MAC: TEdit
      Left = 94
      Top = 48
      Width = 123
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object Panel5: TPanel
      Left = 14
      Top = 72
      Width = 74
      Height = 21
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'Data received :'
      TabOrder = 6
    end
    object Edt_received: TEdit
      Left = 94
      Top = 72
      Width = 123
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object Panel6: TPanel
      Left = 223
      Top = 52
      Width = 58
      Height = 21
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'Data send :'
      TabOrder = 8
    end
    object Edt_Envoye: TEdit
      Left = 287
      Top = 52
      Width = 77
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 196
    Width = 377
    Height = 83
    Caption = 'Transfer Rate : '
    TabOrder = 2
    object Graph_Download: TChart
      Left = 3
      Top = 15
      Width = 175
      Height = 42
      AllowPanning = pmNone
      BackWall.Brush.Style = bsClear
      Legend.Visible = False
      MarginBottom = 2
      MarginLeft = 1
      MarginRight = 2
      Title.Font.Style = [fsUnderline]
      Title.Text.Strings = (
        'Dowload')
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.ExactDateTime = False
      BottomAxis.Increment = 1.000000000000000000
      BottomAxis.Labels = False
      BottomAxis.LabelsFormat.Visible = False
      BottomAxis.Maximum = 60.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.ExactDateTime = False
      LeftAxis.Increment = 1.000000000000000000
      LeftAxis.Labels = False
      LeftAxis.LabelsFormat.Visible = False
      LeftAxis.LabelStyle = talValue
      RightAxis.Visible = False
      TopAxis.Visible = False
      View3D = False
      Zoom.Allow = False
      BevelOuter = bvNone
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: TLineSeries
        HoverElement = [heCurrent]
        Legend.Visible = False
        SeriesColor = 4227072
        ShowInLegend = False
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X '
        XValues.Order = loAscending
        YValues.Name = 'Y '
        YValues.Order = loNone
      end
    end
    object Graph_Upload: TChart
      Left = 192
      Top = 15
      Width = 175
      Height = 42
      AllowPanning = pmNone
      BackWall.Brush.Style = bsClear
      Legend.Visible = False
      MarginBottom = 2
      MarginLeft = 1
      MarginRight = 2
      Title.Font.Style = [fsUnderline]
      Title.Text.Strings = (
        'Upload')
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.ExactDateTime = False
      BottomAxis.Increment = 1.000000000000000000
      BottomAxis.Labels = False
      BottomAxis.LabelsFormat.Visible = False
      BottomAxis.Maximum = 60.000000000000000000
      DepthAxis.TitleSize = 5
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.ExactDateTime = False
      LeftAxis.Increment = 1.000000000000000000
      LeftAxis.Labels = False
      LeftAxis.LabelsFormat.Visible = False
      LeftAxis.LabelStyle = talValue
      RightAxis.Visible = False
      TopAxis.Visible = False
      View3D = False
      Zoom.Allow = False
      BevelOuter = bvNone
      TabOrder = 1
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series2: TLineSeries
        HoverElement = [heCurrent]
        Legend.Visible = False
        SeriesColor = clRed
        ShowInLegend = False
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X '
        XValues.Order = loAscending
        YValues.Name = 'Y '
        YValues.Order = loNone
      end
    end
    object Progress_Download: TProgressBar
      Left = 9
      Top = 58
      Width = 100
      Height = 12
      TabOrder = 2
    end
    object Progress_Upload: TProgressBar
      Left = 198
      Top = 60
      Width = 100
      Height = 12
      TabOrder = 3
    end
    object Pnl_Tx_Download: TPanel
      Left = 121
      Top = 54
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '0 bytes/s'
      TabOrder = 4
    end
    object Pnl_Tx_Upload: TPanel
      Left = 308
      Top = 57
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '0 bytes/s'
      TabOrder = 5
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 492
    Width = 393
    Height = 19
    Panels = <
      item
        Text = 'User :'
        Width = 35
      end
      item
        Width = 90
      end
      item
        Text = 'Ip :'
        Width = 25
      end
      item
        Text = 'n/a'
        Width = 100
      end
      item
        Text = 'Mask :'
        Width = 40
      end
      item
        Width = 50
      end>
    ExplicitTop = 491
    ExplicitWidth = 389
  end
  object Button1: TButton
    Left = 279
    Top = 460
    Width = 50
    Height = 25
    Caption = 'Start'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 335
    Top = 460
    Width = 50
    Height = 25
    Caption = 'Stop'
    Enabled = False
    TabOrder = 5
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 338
    Width = 377
    Height = 43
    Caption = 'Interval : '
    TabOrder = 6
    object Label3: TLabel
      Left = 323
      Top = 20
      Width = 40
      Height = 13
      Caption = '100 (ms)'
    end
    object ScrollBar1: TScrollBar
      Left = 10
      Top = 23
      Width = 298
      Height = 9
      Max = 1000
      Min = 1
      PageSize = 0
      Position = 100
      TabOrder = 0
      OnChange = ScrollBar1Change
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 284
    Width = 377
    Height = 48
    Caption = ' Options '
    TabOrder = 7
    object Label13: TLabel
      Left = 187
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Down :'
    end
    object Label14: TLabel
      Left = 287
      Top = 22
      Width = 20
      Height = 13
      Caption = 'Up :'
    end
    object CheckBox1: TCheckBox
      Left = 19
      Top = 21
      Width = 68
      Height = 17
      TabStop = False
      Caption = '3D-Graph'
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 93
      Top = 21
      Width = 65
      Height = 17
      Caption = 'Stay Top'
      TabOrder = 1
      OnClick = CheckBox2Click
    end
    object SpinEdit1: TSpinEdit
      Left = 227
      Top = 19
      Width = 50
      Height = 22
      MaxValue = 1100
      MinValue = 0
      TabOrder = 2
      Value = 100
      OnChange = SpinEdit1Change
    end
    object SpinEdit2: TSpinEdit
      Left = 313
      Top = 19
      Width = 50
      Height = 22
      MaxValue = 1100
      MinValue = 0
      TabOrder = 3
      Value = 100
      OnChange = SpinEdit2Change
    end
  end
  object Memo1: TMemo
    Left = 430
    Top = 51
    Width = 72
    Height = 31
    TabStop = False
    ScrollBars = ssBoth
    TabOrder = 8
    Visible = False
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 269
    Top = 21
  end
end
