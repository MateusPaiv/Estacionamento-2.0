unit MovimentoController;

interface

uses
  Vcl.Dialogs, Generics.Collections, MovimentoModel, connection,
  RpDriverAdapter, SqlFun, DateUtils,vcl.StdCtrls;

type
  TMovimentoController = class
  private
  public
    function lancarMovimento(entradaData: TDate; entradaHora: TTime;idMvtCadastroFunc, idMvtManobristaFunc: integer; placa: string): Boolean;
    function baixarMovimento(saidaData: TDate; saidaHora: TTime;idMvt: integer): Boolean;
    function vagasPreenchidas:string;
    function movimentosBaixados:string;
  end;

var
  mvtControl: TMovimentoController;

implementation

uses
  System.SysUtils, VeiculoController, SqlSis;

{ TMovimentoController }

function TMovimentoController.baixarMovimento(saidaData: TDate;saidaHora: TTime; idMvt: integer): Boolean;
var
  listaMovimento:TObjectList<TMovimento>;
  Q:IQuery;
  calcHora:TTime;
  DiasDif:TDate;
  HoraHoje:TTime;
  valor:Currency;
begin
  Result:=True;

  if idMvt <= 0 then exit;
  HoraHoje:=TimeOf(Now);
  Q:=SqlToQuery('SELECT entrada_hora,entrada_data FROM movimentos WHERE id_mvt='+IntToStr(idMvt));
  if Q.IsEmpty then begin
    AvisoErro('C�digo n�o existe');
    exit;
  end;

  // if Sistema.Hoje > Q.FieldByName('entrada_data').AsDateTime then begin
  // ShowMessage(DateToStr(DaysBetween(Sistema.Hoje,Q.FieldByName('entrada_data').AsDateTime)));
  // exit;
  // end;

  calcHora := HoraHoje - Q.FieldByName('entrada_hora').AsDateTime;

  if (HourOf(calcHora)>=1) and (HourOf(calcHora)<=3) then begin
    valor := 10;
  end
  else if (HourOf(calcHora)>=3) and (HourOf(calcHora)<=6) then begin
    valor := 20;
  end
  else if (HourOf(calcHora)>=6) then begin
    valor := 45;
  end else begin
    valor:=7;
  end;

  listaMovimento := TObjectList<TMovimento>.create;
  listaMovimento.Add(TMovimento.create(saidaData, saidaHora, valor, idMvt));
  dm.BaixarMovimento(listaMovimento);
end;

function TMovimentoController.lancarMovimento(entradaData: TDate;entradaHora: TTime; idMvtCadastroFunc, idMvtManobristaFunc: integer;placa: string): Boolean;
var
  listaMovimento: TObjectList<TMovimento>;
  Q: IQuery;
  veiculoCon: TVeiculoController;
begin

  Result := True;
  if (idMvtCadastroFunc <= 0) or (idMvtManobristaFunc <= 0) then begin
    MessageDlg('C�digo de ve�culo ou de funcion�rio vazio', mtInformation,[mbOK], 0);
    Result := False;
    exit;
  end;

  Q:=SqlToQuery('SELECT id_veic FROM veiculos WHERE placa='+QuotedStr(placa));

  if Q.IsEmpty then begin
    veiculoCon.insertVeiculos('NNNN', placa, 'NNNN', 1);

    Q:=SqlToQuery('SELECT id_veic FROM veiculos WHERE placa='+QuotedStr(placa));
    listaMovimento := TObjectList<TMovimento>.create;
    listaMovimento.Add(TMovimento.create(entradaData, entradaHora, idTest, idTest, Q.FieldByName('id_veic').AsInteger));
    dm.lancarMovimento(listaMovimento);
  end else begin
    listaMovimento := TObjectList<TMovimento>.create;
    listaMovimento.Add(TMovimento.create(entradaData, entradaHora, idTest,idTest, Q.FieldByName('id_veic').AsInteger));
    dm.lancarMovimento(listaMovimento);
  end;
end;

function TMovimentoController.movimentosBaixados: string;
var Q:IQuery;
begin
   Q:=SqlToQuery('SELECT COUNT(*) as totalbx FROM movimentos WHERE valor IS NOT NULL AND saida_data='+ QuotedStr(DateToStr(Sistema.Hoje)));

   if Q.IsEmpty then
      Result := 'Nenhum servi�o baixado hoje'
   else
      Result := 'Baixas Hoje: '+Q.FieldByName('totalbx').AsInteger.ToString;
end;

function TMovimentoController.vagasPreenchidas: string;
var Q:IQuery;
begin
   Q:=SqlToQuery('SELECT COUNT(*) as total FROM movimentos WHERE valor IS NULL');

   if Q.IsEmpty then
      Result := 'Nenhuma vaga preenchida'
   else
      Result := 'Vagas preenchidas: '+Q.FieldByName('total').AsInteger.ToString;

end;

end.
