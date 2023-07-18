unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Buttons, SQLBtn,ClienteView,FuncionarioView,LancarMovimentoView;

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
    Label1: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    pnlConteudoEstacionamento: TPanel;
    pnlBotoes: TPanel;
    pnlLancaMov: TPanel;
    btnLancarMovimento: TSQLBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    btnBaixaMvt: TSQLBtn;
    procedure btnCadClienteClick(Sender: TObject);
    procedure btnCadFuncClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLancarMovimentoClick(Sender: TObject);
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
  SplashView;

{$R *.dfm}

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

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   frmSplash:=TfrmSplash.Create(nil);
   try
     frmSplash.ShowModal;
   finally
     FreeAndNil(frmSplash);
   end;
end;

end.
