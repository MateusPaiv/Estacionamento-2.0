object frmBxMovimento: TfrmBxMovimento
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Baixar movimento'
  ClientHeight = 135
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 263
    Height = 135
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 250
    ExplicitHeight = 116
    object btnLancaMvt: TSQLBtn
      Left = 152
      Top = 64
      Width = 73
      Height = 30
      Caption = 'Lan'#231'ar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnLancaMvtClick
      Operation = fbNone
      Processing = False
      AutoAction = True
      GlyphSqlEnv = True
      IntervalRepeat = 0
      DownUp = False
    end
    object edtCod: TSQLEd
      Left = 32
      Top = 29
      Width = 193
      Height = 21
      TabStop = False
      Alignment = taLeftJustify
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = ''
      Visible = True
      Empty = False
      CloseForm = False
      CloseFormEsc = False
      ColorFocus = clBlack
      ColorTextFocus = clWhite
      ColorNotEnabled = clGray
      ColorNormal = clWhite
      ColorTextNormal = clBlack
      ColorTextNotEnabled = clWhite
      Title = 'Insira o c'#243'digo do movimento:'
      TitlePos = tppTop
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      TitlePixels = 0
      TypeValue = tvString
      ValueNegative = False
      Decimals = 0
      CharUpperLower = False
      ItemsMultiples = False
      ItemsValid = True
      ItemsWidth = 0
      ItemsHeight = 0
      ItemsLength = 0
      Duplicity = 0
      MinLength = 0
      Group = 0
    end
  end
end
