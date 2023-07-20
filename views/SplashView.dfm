object frmSplash: TfrmSplash
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmSplash'
  ClientHeight = 338
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 0
    Top = 0
    Width = 651
    Height = 321
    Align = alClient
    Alignment = taCenter
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'EmojiOne Color'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 12
    ExplicitHeight = 42
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 321
    Width = 651
    Height = 17
    Align = alBottom
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 400
    OnTimer = Timer1Timer
    Left = 456
    Top = 128
  end
end
