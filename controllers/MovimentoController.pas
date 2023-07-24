unit MovimentoController;

interface

uses
  Vcl.Dialogs, Generics.Collections, MovimentoModel, connection,
  RpDriverAdapter, SqlFun, DateUtils,vcl.StdCtrls,SqlDtg;

type
  TMovimentoController = class
  private
  public
    function lancarMovimento(entradaData: TDate; entradaHora,saidaPrevista: TTime;idMvtCadastroFunc, idMvtManobristaFunc: integer; placa: string): Boolean;
    function baixarMovimento(saidaData: TDate; saidaHora: TTime;idMvt: integer): Boolean;
    function vagasPreenchidas:string;
    procedure carregarGrid(Grid:TSqlDtGrid);
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

   if (MinuteOf(calcHora)<=30) then begin
     valor:=7.5;
   end
   else if (HourOf(calcHora)>=1) and (HourOf(calcHora)<=3) then begin
     valor:=10;
   end
   else if (HourOf(calcHora)>=3) and (HourOf(calcHora)<=6) then begin
     valor:=20;
   end
   else if (HourOf(calcHora)>=6) then begin
     valor:=45;
   end else begin
     valor:=7;
   end;

   listaMovimento := TObjectList<TMovimento>.create;
   listaMovimento.Add(TMovimento.create(saidaData, saidaHora, valor, idMvt));
   Q.Close;Q.Free;
   dm.BaixarMovimento(listaMovimento);
end;

procedure TMovimentoController.carregarGrid(Grid: TSqlDtGrid);
var Q:IQuery;
    i:integer;
begin
   i:=1;
   Q:=
   SqlToQuery(
     ' select MAX(saida_prevista::time),id_mvt_veic,m.id_mvt'+
     ' ,v.modelo,v.ano,v.placa from movimentos as m'+
     ' inner join veiculos v on v.id_veic=m.id_mvt_veic'+
     ' where m.entrada_data='+QuotedStr(DatetoStr(Sistema.Hoje))+' and valor is null'+
     ' group by m.id_mvt_veic,m.id_mvt,v.id_veic, m.saida_prevista'+
     ' order by saida_prevista desc'
   );

   if not Q.IsEmpty then begin
     while not Q.Eof do begin
       Grid.Cells[Grid.GetColumn('codigoMvt'),i]:=Q.getString('id_mvt');
       Grid.Cells[Grid.GetColumn('modelo'),i]:=Q.getString('modelo');
       Grid.Cells[Grid.GetColumn('placa'),i]:=Q.getString('placa');
       Grid.Cells[Grid.GetColumn('ano'),i]:=Q.getString('ano');
       Grid.Cells[Grid.GetColumn('saidaPrev'),i]:=Q.getString('max');
       inc(i);
       if Grid.RowCount < i then begin
          Grid.CreateNewRow;
       end;
       Q.Next;
     end;
     Q.Free;Q.Close;
   end else begin
     Aviso('nenhum usu�rio encontrado');
   end;
end;

function TMovimentoController.lancarMovimento(entradaData: TDate;entradaHora,saidaPrevista: TTime; idMvtCadastroFunc, idMvtManobristaFunc:integer;placa: string): Boolean;
var listaMovimento: TObjectList<TMovimento>;
    Q: IQuery;
    veiculoCon: TVeiculoController;
begin

   Result := True;
   if (idMvtCadastroFunc <= 0) or (idMvtManobristaFunc <= 0) then begin
     MessageDlg
      ('C�digo de ve�culo ou de funcion�rio vazio', mtInformation,[mbOK], 0);
      Result := False;
      exit;
   end;

   Q:=
   SqlToQuery(
     ' select MAX(saida_prevista::time),id_mvt_veic'+
     ' ,v.modelo,v.ano,v.placa from movimentos as m'+
     ' inner join veiculos v on v.id_veic=m.id_mvt_veic'+
     ' where m.entrada_data= '+QuotedStr(DatetoStr(entradaData))+'and valor is null'+
     ' group by m.id_mvt_veic,v.id_veic, m.saida_prevista'+
     ' order by saida_prevista desc  limit 1'
   );
   if not Q.IsEmpty then begin


      if (saidaPrevista>Q.FieldByName('MAX').AsDateTime) or (saidaPrevista=Q.FieldByName('MAX').AsDateTime) then begin
          Aviso
          ('Estacione na frente do ve�culo com a placa:'+Q.FieldByName('placa').asString);
      end else begin
          Q.SQL.Clear;
          Q:=
          SqlToQuery(
            ' select MIN(saida_prevista::time),m.id_mvt_veic,v.modelo,v.ano,v.placa'+
            ' from movimentos as m'+
            ' inner join veiculos v on v.id_veic =m.id_mvt_veic'+
            ' where entrada_data= '+QuotedStr(DatetoStr(entradaData))+' and valor is null'+
            ' group by saida_prevista,m.id_mvt_veic,v.id_veic order by saida_prevista'
          );
          while not Q.Eof do begin
            if (saidaPrevista<Q.FieldByName('min').AsDateTime) or (saidaPrevista=Q.FieldByName('min').AsDateTime) then begin
                Aviso('Estacione atr�s do ve�culo com a placa:'+Q.FieldByName('placa').asString);
                break;
            end;
            Q.Next;
          end;
      end;
   end;

   Q.SQL.Clear;
   Q:=SqlToQuery('SELECT id_veic FROM veiculos WHERE placa='+QuotedStr(placa));

   if Q.IsEmpty then begin
      veiculoCon.insertVeiculos('NNNN', placa, 'NNNN', 1);
      Q:=SqlToQuery('SELECT id_veic FROM veiculos WHERE placa='+QuotedStr(placa));
      listaMovimento := TObjectList<TMovimento>.create;
      listaMovimento.Add(TMovimento.create(entradaData, entradaHora, saidaPrevista,idTest, idTest, Q.FieldByName('id_veic').AsInteger));
      dm.lancarMovimento(listaMovimento);
      Q.Close;Q.Free;
   end else begin
      listaMovimento := TObjectList<TMovimento>.create;
      listaMovimento.Add(TMovimento.create(entradaData, entradaHora,saidaPrevista ,idTest,idTest, Q.FieldByName('id_veic').AsInteger));
      dm.lancarMovimento(listaMovimento);
      Q.Close;Q.Free;
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

      Q.Close;Q.Free;
end;

function TMovimentoController.vagasPreenchidas: string;
var Q:IQuery;
begin
   Q:=SqlToQuery('SELECT COUNT(*) as total FROM movimentos WHERE valor IS NULL');

   if Q.IsEmpty then
      Result := 'Nenhuma vaga preenchida'
   else
      Result := 'Vagas preenchidas: '+Q.FieldByName('total').AsInteger.ToString;

   Q.Close;Q.Free;
end;

end.
