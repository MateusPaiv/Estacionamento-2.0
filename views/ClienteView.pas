unit ClienteView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  SQLEd, Vcl.Buttons, SQLBtn, Vcl.Grids, RPStringGrid, SqlDtg,
  Vcl.WinXPanels, RpDriverAdapter,SqlFun, SqlSis, clienteController,VeiculoController;

type
  TfrmClienteView = class(TForm)
    pnlMain: TPanel;
    pnlButtons: TPanel;
    pnlEdits: TPanel;
    Grid: TSqlDtGrid;
    pnlTitle: TPanel;
    Label1: TLabel;
    Clientes: TCardPanel;
    viewClientes: TCard;
    viewCadastraCliente: TCard;
    btnCadastrar: TSQLBtn;
    bFiltrar: TSQLBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtAno: TSQLEd;
    Panel4: TPanel;
    edtPlaca: TSQLEd;
    edtModelo: TSQLEd;
    edtSobrenome: TSQLEd;
    edtNome: TSQLEd;
    edtCpf: TSQLEd;
    Label2: TLabel;
    btnCadastrarClie: TSQLBtn;
    btnSair: TSQLBtn;
    btnCarregaGrid: TSQLBtn;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCadastrarClieClick(Sender: TObject);
    procedure btnCarregaGridClick(Sender: TObject);
  private
    clienteCon : TClienteController;
    veiculoCon : TVeiculoController;
  public
    { Public declarations }
  end;

var
  frmClienteView: TfrmClienteView;

implementation
{$R *.dfm}
procedure TfrmClienteView.btnCadastrarClick(Sender: TObject);
begin
   Clientes.ActiveCard := viewCadastraCliente;
end;

procedure TfrmClienteView.btnCadastrarClieClick(Sender: TObject);
begin
  clienteCon.insertClientes(edtNome.Text,edtSobrenome.Text,edtCpf.Text);
  veiculoCon.insertVeiculos(edtModelo.Text,edtPlaca.Text,edtAno.Text,0);
end;

procedure TfrmClienteView.btnCarregaGridClick(Sender: TObject);
begin
  clienteCon.carregarGrid(Grid);
end;

procedure TfrmClienteView.btnSairClick(Sender: TObject);
begin
   Clientes.ActiveCard := viewClientes;
end;

procedure TfrmClienteView.FormActivate(Sender: TObject);
begin
   Clientes.ActiveCard:=viewClientes;
end;

procedure TfrmClienteView.FormShow(Sender: TObject);
begin
   edtNome.SetFocus;
end;

end.