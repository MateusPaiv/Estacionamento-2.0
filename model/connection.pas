unit connection;

interface

uses
  System.SysUtils, System.Classes, SqlSis,RpDriverAdapter,SqlFun,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Contnrs,ClienteModel,
  Vcl.Dialogs,Generics.Collections,VeiculoModel ,FuncionarioModel,MovimentoModel,DateUtils;

type
  Tdm = class(TDataModule)
    Env: TSQLEnv;
    Inst: TSQLInstall;

    procedure DataModuleCreate(Sender: TObject);
  private
    procedure initConnection;
  public
    function cadastrarClientes(Clientes:TObjectList<TCliente>):Boolean;
    function cadastrarVeiculo(Veiculos:TObjectList<TVeiculo>):Boolean;
    function cadastrarFuncionario(Funcionarios:TObjectList<TFuncionario>):Boolean;
    function lancarMovimento(Movimentos:TobjectList<TMovimento>):Boolean;
    procedure mostrarCdgMvt;
  end;

var dm: Tdm;
    idTest:integer;

implementation

{$R *.dfm}

{ TDataModule1 }

function Tdm.cadastrarClientes(Clientes:TObjectList<TCliente>): Boolean;
begin
   Sistema.Insert('clientes');
   Sistema.SetField('nome',Clientes[0].nome);
   Sistema.SetField('sobrenome',Clientes[0].sobrenome);
   Sistema.SetField('cpf',Clientes[0].cpf);
   Sistema.Post;
   Sistema.Commit;

   Aviso('Cliente cadastrado com sucesso');
end;

function Tdm.cadastrarFuncionario(Funcionarios: TObjectList<TFuncionario>): Boolean;
begin
   Sistema.Insert('funcionarios');
   Sistema.SetField('nome',Funcionarios[0].nome);
   Sistema.SetField('sobrenome',Funcionarios[0].sobrenome);
   Sistema.SetField('cpf',Funcionarios[0].cpf);
   Sistema.SetField('celular',Funcionarios[0].celular);
   Sistema.SetField('cep',Funcionarios[0].cep);
   Sistema.SetField('endereco',Funcionarios[0].endereco);
   Sistema.SetField('numero',Funcionarios[0].numero);
   Sistema.Post;
   Sistema.Commit;

   Aviso('Funcion�rio cadastrado com sucesso');
end;

function Tdm.cadastrarVeiculo(Veiculos: TObjectList<TVeiculo>): Boolean;
begin
   Sistema.Insert('veiculos');
   Sistema.SetField('modelo', Veiculos[0].modelo);
   Sistema.SetField('placa', Veiculos[0].placa);
   Sistema.SetField('ano', Veiculos[0].ano);
   Sistema.SetField('id_veic_clie', Veiculos[0].codigoCliente);
   Sistema.Post;
   Sistema.Commit;

   Aviso('Ve�culo cadastrado com sucesso');
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
   initConnection;
end;

procedure Tdm.initConnection;
begin
   Sistema.DataBaseName:='estacionamento';
   Sistema.SQLServer:='localhost';
   Sistema.SQLPassword:='3099';
   Sistema.SQLUserName:='postgres';
   Sistema.TypeServer:=tsPostGreSQL;
   Sistema.Init;
end;


function Tdm.lancarMovimento(Movimentos: TobjectList<TMovimento>): Boolean;
var HoraHoje:TTime;
    DataHoje:TDate;
begin
   HoraHoje:= TimeOf(Now);
   Sistema.Insert('movimentos');
   Sistema.SetField('entrada_data',Sistema.Hoje);
   Sistema.setField('entrada_hora',TimeToStr(HoraHoje));
   Sistema.SetField('id_mvt_cadastro_func',Movimentos[0].idFuncCadastrouMovimento);
   Sistema.SetField('id_mvt_manobrista_func',Movimentos[0].idFuncManobristaMovimento);
   Sistema.SetField('id_mvt_veic',Movimentos[0].idVeic);
   Sistema.Post;
   Sistema.Commit;
   Aviso('Movimento lan�ado!');

   mostrarCdgMvt;
end;

procedure Tdm.mostrarCdgMvt;
var Q:IQuery;
begin
   Q:=SqlToQuery('SELECT id_mvt FROM movimentos ORDER BY id_mvt DESC LIMIT 1');
   MessageDlg('C�digo para entrega ao final do servi�o para ser realizado o pagamento'+Q.FieldByName('id_mvt').AsInteger.ToString,mtInformation,[mbOK],0);
end;

end.
