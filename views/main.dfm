object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Home'
  ClientHeight = 510
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 510
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlTopo: TPanel
      Left = 0
      Top = 0
      Width = 783
      Height = 73
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 783
        Height = 73
        Align = alClient
        Alignment = taCenter
        Caption = 'Estacionamento 2.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11565152
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 189
        ExplicitHeight = 23
      end
    end
    object pnlHome: TPanel
      Left = 0
      Top = 73
      Width = 783
      Height = 437
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pnlMenu: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 437
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object btnCadCliente: TSQLBtn
          AlignWithMargins = True
          Left = 28
          Top = 68
          Width = 129
          Height = 49
          Margins.Left = 28
          Margins.Right = 28
          Align = alTop
          Caption = 'Cadastrar Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnCadClienteClick
          Operation = fbNone
          Processing = False
          AutoAction = True
          GlyphSqlEnv = True
          IntervalRepeat = 0
          DownUp = False
          ExplicitLeft = 0
          ExplicitTop = 58
          ExplicitWidth = 179
        end
        object btnCadFunc: TSQLBtn
          AlignWithMargins = True
          Left = 28
          Top = 10
          Width = 129
          Height = 49
          Margins.Left = 28
          Margins.Top = 10
          Margins.Right = 28
          Margins.Bottom = 6
          Align = alTop
          Caption = 'Cadastrar Funcion'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnCadFuncClick
          Operation = fbNone
          Processing = False
          AutoAction = True
          GlyphSqlEnv = True
          IntervalRepeat = 0
          DownUp = False
          ExplicitLeft = 0
          ExplicitTop = 3
          ExplicitWidth = 179
        end
      end
      object pnlContent: TPanel
        Left = 185
        Top = 0
        Width = 598
        Height = 437
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pnlDescVagas: TPanel
          Left = 0
          Top = 0
          Width = 598
          Height = 73
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 598
            Height = 73
            Margins.Left = 170
            Margins.Right = 170
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              AlignWithMargins = True
              Left = 461
              Top = 3
              Width = 127
              Height = 67
              Margins.Right = 10
              Align = alRight
              Alignment = taCenter
              Caption = 'Movimentos Baixados hoje'
              Layout = tlCenter
              ExplicitHeight = 13
            end
            object Label3: TLabel
              Left = 0
              Top = 0
              Width = 90
              Height = 73
              Align = alLeft
              Alignment = taCenter
              Caption = 'Vagas preenchidas'
              Layout = tlCenter
              ExplicitHeight = 13
            end
          end
        end
        object pnlConteudoEstacionamento: TPanel
          Left = 0
          Top = 73
          Width = 598
          Height = 364
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object pnlBotoes: TPanel
            Left = 0
            Top = 263
            Width = 598
            Height = 101
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object pnlLancaMov: TPanel
              AlignWithMargins = True
              Left = 170
              Top = 3
              Width = 378
              Height = 95
              Margins.Left = 170
              Margins.Right = 50
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object btnLancarMovimento: TSQLBtn
                AlignWithMargins = True
                Left = 233
                Top = 40
                Width = 135
                Height = 40
                Margins.Left = 0
                Margins.Top = 40
                Margins.Right = 10
                Margins.Bottom = 15
                Align = alRight
                Caption = 'Lan'#231'ar movimento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnLancarMovimentoClick
                Operation = fbNone
                Processing = False
                AutoAction = True
                GlyphSqlEnv = True
                IntervalRepeat = 0
                DownUp = False
                ExplicitLeft = 224
                ExplicitTop = 50
                ExplicitHeight = 42
              end
              object btnBaixaMvt: TSQLBtn
                AlignWithMargins = True
                Left = 88
                Top = 40
                Width = 135
                Height = 40
                Margins.Left = 0
                Margins.Top = 40
                Margins.Right = 10
                Margins.Bottom = 15
                Align = alRight
                Caption = 'Baixar movimento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Operation = fbNone
                Processing = False
                AutoAction = True
                GlyphSqlEnv = True
                IntervalRepeat = 0
                DownUp = False
                ExplicitLeft = 224
                ExplicitTop = 50
                ExplicitHeight = 42
              end
            end
          end
          object Panel1: TPanel
            Left = 361
            Top = 0
            Width = 237
            Height = 263
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 265
            Height = 263
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 2
          end
        end
      end
    end
  end
end
