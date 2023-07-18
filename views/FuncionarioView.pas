unit FuncionarioView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, RPStringGrid,
  SqlDtg, Vcl.Buttons, SQLBtn, Vcl.ExtCtrls, Vcl.WinXPanels, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Response.Adapter, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, SQLEd, SqlSis,
  RpDriverAdapter, SqlFun,
  FuncionarioController;

type
TfrmFuncionarioView = class(TForm)
    Funcionario: TCardPanel;
    viewFuncionarios: TCard;
    pnlButtons: TPanel;
    btnCadastrar: TSQLBtn;
    bFiltrar: TSQLBtn;
    btnCarregaGrid: TSQLBtn;
    pnlMain: TPanel;
    pnlEdits: TPanel;
    Grid: TSqlDtGrid;
    pnlTitle: TPanel;
    Label1: TLabel;
    ViewCadastraFuncionario: TCard;
    Panel1: TPanel;
    btnSair: TSQLBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnCadastrarClie: TSQLBtn;
    edtEndereco: TSQLEd;
    edtCep: TSQLEd;
    edtCelular: TSQLEd;
    edtCpf: TSQLEd;
    edtSobrenome: TSQLEd;
    edtNome: TSQLEd;
    MemTable: TFDMemTable;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    edtNumero: TSQLEd;
    procedure btnCadastrarClieClick(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure btnCarregaGridClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure consultaCep(cep: string);
  public
  end;

var
  frmFuncionarioView: TfrmFuncionarioView;

implementation

{$R *.dfm}
{ TfrmFuncionario }

procedure TfrmFuncionarioView.btnCadastrarClick(Sender: TObject);
begin
  Funcionario.ActiveCard := ViewCadastraFuncionario;
end;

procedure TfrmFuncionarioView.btnSairClick(Sender: TObject);
begin
  Funcionario.ActiveCard := viewFuncionarios;
end;

procedure TfrmFuncionarioView.btnCadastrarClieClick(Sender: TObject);
var funcionarioCon:TFuncionarioController;
begin
   funcionarioCon.insertFuncionario(edtNome.text, edtSobrenome.text, edtCpf.text,edtCelular.text, edtCep.text, edtEndereco.text, edtNumero.text);
end;

procedure TfrmFuncionarioView.btnCarregaGridClick(Sender: TObject);
var funcionarioCon:TFuncionarioController;
begin
  funcionarioCon.carregarGrid(Grid);
end;

procedure TfrmFuncionarioView.consultaCep(cep: string);
begin
  if cep.Length <> 8 then
  begin
    MessageDlg('CEP inv�lido', mterror, [mbOK], 1);
    exit;
  end;

  RESTRequest1.Resource := cep + '/json';
  RESTRequest1.Execute;

  if RESTRequest1.Response.StatusCode = 200 then
  begin
    if RESTRequest1.Response.Content.IndexOf('erro') > 0 then
    begin
      MessageDlg('CEP n�o encontrado', mterror, [mbOK], 1);
    end
    else
    begin
      with MemTable do
      begin
        edtEndereco.text := FieldByName('logradouro').AsString;
        edtNumero.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmFuncionarioView.edtCepExit(Sender: TObject);
begin
  consultaCep(edtCep.text);
end;

procedure TfrmFuncionarioView.FormActivate(Sender: TObject);
begin
  Funcionario.ActiveCard := viewFuncionarios;
end;

end.