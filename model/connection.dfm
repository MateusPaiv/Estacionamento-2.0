object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object Env: TSQLEnv
    ShowException = True
    Btns.FontColorBlack = clBlack
    Btns.FontColorRed = clRed
    Btns.FontColorWhite = clWhite
    Btns.Transparent = True
    Btns.Flat = True
    Btns.ShowHint = True
    Btns.LayOut = blGlyphLeft
    Btns.Active = True
    Btns.Margin = 0
    Btns.Height = 25
    Btns.Width = 75
    Btns.Spacing = 2
    Btns.HintEdit = 'Altera o campo selecionado'
    Btns.HintInsert = 'Inclui um novo registro'
    Btns.HintReports = 'Emite o relat'#243'rio'
    Btns.HintFind = 'Pesquisa pelo campo selecionado'
    Btns.HintFilter = 'Ativa um filtro para o campo selecionado/Retira filtro'
    Btns.HintIndex = 'Ordena pelo campo selecionado'
    Btns.HintDelete = 'Insere marca'#231#227'o para exclus'#227'o do registro'
    Btns.HintCancel = 'Cancela a opera'#231#227'o em andamento'
    Btns.HintExit = 'Abandona a tela'
    Btns.HintPost = 'Efetiva a grava'#231#227'o'
    Btns.HintNext = 'Seleciona o pr'#243'ximo registro'
    Btns.HintPrior = 'Seleciona o registro anterior'
    Btns.HintColor = 'Acesso '#224' configura'#231#227'o de cores'
    Btns.HintFirst = 'Seleciona o primeiro registro'
    Btns.HintSaveGrid = 'Grava o formato atual da grade'
    Btns.HintLoadGrid = 'Restaura o formato padr'#227'o para a grade'
    Btns.HintLast = 'Seleciona o '#250'ltimo registro'
    Btns.HintEditAll = 'Edita o registro selecionado'
    Btns.HintConfirm = 'Efetiva o procedimento'
    Btns.HintExpColumn = 'Expande a coluna selecionada'
    Btns.HintRedColumn = 'Reduz a coluna selecionada'
    Btns.HintDelColumn = 'Apaga a coluna selecionada'
    Btns.HintRestColumn = 'Restaura todas as colunas'
    Btns.HintRestColor = 'Restaura padr'#227'o de cores'
    Btns.HintMoveLeftColumn = 'Move para a esquerda a coluna selecionda'
    Btns.HintMoveRightColumn = 'Move para a direita a coluna selecionada'
    Btns.HintRestaurar = 'Recupera todos os registros do servidor'
    Btns.CaptionEdit = '&Alterar'
    Btns.CaptionInsert = '&Incluir'
    Btns.CaptionReports = '&Relat'#243'rio'
    Btns.CaptionFind = '&Pesquisar'
    Btns.CaptionFilter = '&Filtrar'
    Btns.CaptionIndex = '&Ordenar'
    Btns.CaptionDelete = '&Excluir'
    Btns.CaptionCancel = '&Cancelar'
    Btns.CaptionExit = '&Sair'
    Btns.CaptionPost = '&Gravar'
    Btns.CaptionNext = 'Pro&ximo'
    Btns.CaptionPrior = 'A&nterior'
    Btns.CaptionFirst = 'Pri&meiro'
    Btns.CaptionLast = '&Ultimo'
    Btns.CaptionEditAll = 'E&ditar'
    Btns.CaptionConfirm = 'Confir&mar'
    Btns.CaptionRestaurar = 'Res&taurar'
    Btns.Font.Charset = DEFAULT_CHARSET
    Btns.Font.Color = clWindowText
    Btns.Font.Height = -11
    Btns.Font.Name = 'Tahoma'
    Btns.Font.Style = []
    DuplicityInstance = False
    TypeServer = tsOracle
    Conexao = Env.Conexao
    GeraLogComandos = False
    UtilizaPWL = False
    ColorNotEnabledSqlEd = clGray
    Left = 88
    Top = 56
  end
  object Inst: TSQLInstall
    RPUserPrivilegesOracle = 'CONNECT, RESOURCE, CREATE VIEW, DROP ANY VIEW'
    TypeServer = tsOracle
    Left = 24
    Top = 32
  end
  object conn: TFDConnection
    Params.Strings = (
      'Database=estacionamento'
      'User_Name=postgres'
      'Password=3099'
      'Server=localhost'
      'DriverID=PG')
    Left = 152
    Top = 80
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\Eduardo\Documents\Delphi\Estacionamento\Win32\Debug\lib' +
      '\libpq.dll'
    Left = 40
    Top = 104
  end
end
