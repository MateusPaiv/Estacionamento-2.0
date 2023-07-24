unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Buttons, SQLBtn,ClienteView,FuncionarioView,LancarMovimentoView,BaixarMovimentoView,
  LoginView,VagasView;

type
  TfrmMain = class(TForm)
    pnlMain: TPanel;
    pnlTopo: TPanel;
    pnlHome: TPanel;
    Label2: TLabel;
    btnCadFunc: TSQLBtn;
    btnCadCliente: TSQLBtn;
    pnlMenu: TPanel;
    pnlContent: TPanel;
    pnlDescVagas: TPanel;
    lblMvtBaixados: TLabel;
    Panel2: TPanel;
    lblVagasPreenchidas: TLabel;
    pnlConteudoEstacionamento: TPanel;
    pnlBotoes: TPanel;
    pnlLancaMov: TPanel;
    btnLancarMovimento: TSQLBtn;
    btnBaixaMvt: TSQLBtn;
    btnAtulizarVagas: TSQLBtn;
    btnVisualizarEstacionamento: TSQLBtn;
    procedure btnCadClienteClick(Sender: TObject);
    procedure btnCadFuncClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLancarMovimentoClick(Sender: TObject);
    procedure btnBaixaMvtClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAtulizarVagasClick(Sender: TObject);
    procedure btnVisualizarEstacionamentoClick(Sender: TObject);
  private
    { Private declarations }
    cadCliente: TfrmClienteView;
    cadFuncionario: TfrmFuncionarioView;

  public
    { Public declarations }
  end;

var
   frmMain: TfrmMain;

implementation

uses
  SplashView,MovimentoController;

{$R *.dfm}
procedure TfrmMain.btnBaixaMvtClick(Sender: TObject);
begin
   frmBxMovimento:=TfrmBxMovimento.Create(self);
   frmBxMovimento.ShowModal;
end;

procedure TfrmMain.btnCadClienteClick(Sender: TObject);
begin
   cadCliente:=TfrmClienteView.Create(self);
   cadCliente.ShowModal;
end;

procedure TfrmMain.btnCadFuncClick(Sender: TObject);
begin
   cadFuncionario:= TfrmFuncionarioView.Create(self);
   cadFuncionario.showmodal;
end;

procedure TfrmMain.btnLancarMovimentoClick(Sender: TObject);
begin
   frmLacamentoMvt:=TfrmLacamentoMvt.Create(nil);
   frmLacamentoMvt.ShowModal;
end;

procedure TfrmMain.btnAtulizarVagasClick(Sender: TObject);
begin
   lblVagasPreenchidas.Caption := mvtControl.vagasPreenchidas;
      lblMvtBaixados.Caption := mvtControl.movimentosBaixados;
end;

procedure TfrmMain.btnVisualizarEstacionamentoClick(Sender: TObject);
begin
  frmVagasView := TFrmVagasView.create(nil);
  frmVagasView.ShowModal;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
   lblVagasPreenchidas.Caption := mvtControl.vagasPreenchidas;
   lblMvtBaixados.Caption := mvtControl.movimentosBaixados;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   frmSplash:=TfrmSplash.Create(nil);
   try
     frmSplash.ShowModal;
   finally
     FreeAndNil(frmSplash);
   end;

   frmLogin:=TfrmLogin.Create(nil);
   try
     frmLogin.ShowModal;
   finally
     FreeAndNil(frmLogin);
   end;
end;

end.
