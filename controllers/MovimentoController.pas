unit MovimentoController;

interface
  uses
  Vcl.Dialogs,Generics.Collections,MovimentoModel,connection,RpDriverAdapter,SqlFun;

type
  TMovimentoController = class
    private
    public
      function lancarMovimento(entradaData:TDate;entradaHora:TTime;idMvtCadastroFunc,idMvtManobristaFunc:integer;placa:string):Boolean;
  end;
implementation

uses
  System.SysUtils,VeiculoController;

{ TMovimentoController }

function TMovimentoController.lancarMovimento(entradaData:TDate;entradaHora: TTime; idMvtCadastroFunc, idMvtManobristaFunc: integer;placa:string): Boolean;
var listaMovimento:TObjectList<TMovimento>;
    Q:IQuery;
    veiculoCon:TVeiculoController;
begin

   Result:=True;
   if (idMvtCadastroFunc<=0) or (idMvtManobristaFunc<=0) then begin
      MessageDlg('C�digo de ve�culo ou de funcion�rio vazio',mtInformation,[mbOK],0);
      Result:=False;
      exit;
   end;

   Q:=SqlToQuery('SELECT id_veic FROM veiculos WHERE placa='+QuotedStr(placa));

   if Q.IsEmpty then begin

      veiculoCon.insertVeiculos('NNNN',placa,'NNNN',1);
      Q:=SqlToQuery('SELECT id_veic FROM veiculos WHERE placa='+QuotedStr(placa));

      idTest:=1;
      listaMovimento:=TObjectList<TMovimento>.create;
      listaMovimento.Add(TMovimento.Create(entradaData,entradaHora,idTest,idTest,Q.FieldByName('id_veic').AsInteger));
      dm.lancarMovimento(listaMovimento);
   end else begin

      idTest:=1;
      listaMovimento:=TObjectList<TMovimento>.create;
      listaMovimento.Add(TMovimento.Create(entradaData,entradaHora,idTest,idTest,Q.FieldByName('id_veic').AsInteger));
      dm.lancarMovimento(listaMovimento);
   end;
end;


end.
