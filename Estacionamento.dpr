program Estacionamento;

uses
  Vcl.Forms,
  main in 'views\main.pas' {frmMain},
  ClienteView in 'views\ClienteView.pas' {frmClienteView},
  connection in 'model\connection.pas' {dm: TDataModule},
  clienteController in 'controllers\clienteController.pas',
  FuncionarioView in 'views\FuncionarioView.pas' {frmFuncionarioView},
  BaseList in 'model\BaseList.pas',
  ClienteModel in 'model\ClienteModel.pas',
  VeiculoModel in 'model\VeiculoModel.pas',
  VeiculoController in 'controllers\VeiculoController.pas',
  FuncionarioModel in 'model\FuncionarioModel.pas',
  FuncionarioController in 'controllers\FuncionarioController.pas',
  SplashView in 'views\SplashView.pas' {frmSplash},
  MovimentoModel in 'model\MovimentoModel.pas',
  MovimentoController in 'controllers\MovimentoController.pas',
  LancarMovimentoView in 'views\LancarMovimentoView.pas' {frmLacamentoMvt},
  BaixarMovimentoView in 'views\BaixarMovimentoView.pas' {frmBxMovimento},
  LoginView in 'views\LoginView.pas' {frmLogin},
  UsuariosModel in 'model\UsuariosModel.pas',
  UsuarioController in 'controllers\UsuarioController.pas',
  LoginController in 'controllers\LoginController.pas',
  VagasView in 'views\VagasView.pas' {frmVagasView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
