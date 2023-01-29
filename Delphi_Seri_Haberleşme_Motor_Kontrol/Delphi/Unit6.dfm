object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 18
    Width = 227
    Height = 32
    Caption = 'Com Port Ba'#287'lant'#305's'#305
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object DURDUR: TButton
    Left = 384
    Top = 74
    Width = 75
    Height = 25
    Caption = 'DURDUR'
    TabOrder = 0
    OnClick = DURDURClick
  end
  object GERI: TButton
    Left = 264
    Top = 74
    Width = 75
    Height = 25
    Caption = 'GERI'
    TabOrder = 1
    OnClick = GERIClick
  end
  object ILERI: TButton
    Left = 504
    Top = 74
    Width = 75
    Height = 25
    Caption = 'ILERI'
    TabOrder = 2
    OnClick = ILERIClick
  end
  object ILERIL: TiLedRound
    Left = 520
    Top = 17
    Width = 51
    Height = 51
  end
  object DURL: TiLedRound
    Left = 400
    Top = 17
    Width = 51
    Height = 51
    ActiveColor = clRed
    InactiveColor = clMaroon
  end
  object GERIL: TiLedRound
    Left = 280
    Top = 17
    Width = 51
    Height = 51
  end
  object ComBag: TiSwitchLever
    Left = 24
    Top = 89
    OnChange = ComBagChange
    TabOrder = 6
  end
  object ComComboBox1: TComComboBox
    Left = 72
    Top = 89
    Width = 145
    Height = 23
    Text = ''
    Style = csDropDownList
    ItemIndex = -1
    TabOrder = 7
  end
  object Memo1: TMemo
    Left = 264
    Top = 105
    Width = 315
    Height = 72
    Lines.Strings = (
      'Memo1')
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = False
    TabOrder = 8
  end
  object ComPort2: TComPort
    BaudRate = br9600
    Port = 'COM6'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = False
    Left = 80
    Top = 129
  end
  object ComDataPacket1: TComDataPacket
    ComPort = ComPort2
    OnPacket = ComDataPacket1Packet
    Left = 160
    Top = 129
  end
end
