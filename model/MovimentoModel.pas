unit MovimentoModel;

interface
type
  TMovimento = class
    private
      FentradaData: TDate;
      FsaidaData: TDate;
      FentradaHora: TTime;
      FsaidaHora: TTime;
      Fvalor: currency;
      FidFuncCadastrouMovimento: integer;
      FidFuncManobristaMovimento: integer;
      FidVeic: integer;
      FidMvt: integer;
    public
      constructor Create(entradaData:TDate;entradaHora:TTime;idMvtCadastroFunc, idMvtManobristaFunc,idMvtVeic: integer)overload;
      constructor Create(saidaData:TDate;saidaHora:TTime;valor:Currency;idMvt:integer)overload;
      destructor Destroy;override;
      property entradaData: TDate read FentradaData write FentradaData;
      property saidaData: TDate read FsaidaData write FsaidaData;
      property entradaHora: TTime read FentradaHora write FentradaHora;
      property saidaHora: TTime read FsaidaHora write FsaidaHora;
      property valor: currency read Fvalor write Fvalor;
      property idFuncCadastrouMovimento: integer read FidFuncCadastrouMovimento write FidFuncCadastrouMovimento;
      property idFuncManobristaMovimento: integer read FidFuncManobristaMovimento write FidFuncManobristaMovimento;
      property idVeic: integer read FidVeic write FidVeic;
      property idMvt: integer read FidMvt write FidMvt;
  end;
implementation

{ TMovimento }

constructor TMovimento.Create(entradaData: TDate; entradaHora: TTime;idMvtCadastroFunc, idMvtManobristaFunc,idMvtVeic: integer);
begin
   FentradaData:=entradaData;
   FentradaHora:=entradaHora;
   FidFuncCadastrouMovimento:= idMvtCadastroFunc;
   FidFuncManobristaMovimento:=idMvtManobristaFunc;
   FidVeic:=idMvtVeic;
end;

constructor TMovimento.Create(saidaData: TDate; saidaHora: TTime;valor: Currency;idMvt:integer);
begin
   FsaidaData:=saidaData;
   FsaidaHora:=saidaHora;
   Fvalor:=valor;
   FidMvt:=idMvt;
end;

destructor TMovimento.Destroy;
begin
  inherited;
end;

end.
