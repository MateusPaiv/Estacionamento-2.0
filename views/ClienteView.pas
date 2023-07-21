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
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure viewCadastraClienteExit(Sender: TObject);
  private
    clienteCon : TClienteController;
    veiculoCon : TVeiculoController;
  public
    id:string;
  end;

var
  frmClienteView: TfrmClienteView;

implementation
{$R *.dfm}
procedure TfrmClienteView.btnCadastrarClick(Sender: TObject);
begin
   btnCadastrarClie.Caption:='Salvar';
   Clientes.ActiveCard := viewCadastraCliente;
end;

procedure TfrmClienteView.btnCadastrarClieClick(Sender: TObject);
begin

   if btnCadastrarClie.Caption='Salvar' then begin
      clienteCon.insertClientes(edtNome.Text,edtSobrenome.Text,edtCpf.Text);
      veiculoCon.insertVeiculos(edtModelo.Text,edtPlaca.Text,edtAno.Text,0);
   end else begin
       clienteCon.editarClientes(edtNome.Text,edtSobrenome.Text,edtCpf.Text
       ,edtModelo.Text,edtPlaca.Text,edtAno.Text,StrToInt(id));
   end;
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

procedure TfrmClienteView.GridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
    edtNome.Text      :=grid.Cells[grid.GetColumn('nome'), ARow];
    edtSobrenome.text :=grid.Cells[grid.GetColumn('sobrenome'), ARow];
    edtmodelo.text    :=grid.Cells[grid.GetColumn('modelo'), ARow];
    edtPlaca.text     :=grid.Cells[grid.GetColumn('placa'), ARow];
    edtAno.text       :=grid.Cells[grid.GetColumn('ano'), ARow];
    id                :=grid.Cells[Grid.GetColumn('id'),aRow];

    btnCadastrarClie.Caption:='Editar';
    Clientes.ActiveCard:= viewCadastraCliente;
end;

procedure TfrmClienteView.viewCadastraClienteExit(Sender: TObject);
begin
  edtAno.Clear;
  edtPlaca.Clear;
  edtModelo.Clear;
  edtSobrenome.Clear;
  edtNome.Clear;
  edtCpf.Clear;
end;

end.
