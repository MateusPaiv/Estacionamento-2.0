unit LoginController;

interface
uses
  Vcl.Dialogs, Generics.Collections, MovimentoModel, connection,
  RpDriverAdapter, SqlFun,vcl.StdCtrls,SysUtils;
type
  TLoginController = class
    private
    public
      function logar(usuario,senha:string):boolean;
  end;
  var
    loginControl:TLoginController;
implementation

{ TLoginController }

function TLoginController.logar(usuario, senha: string): boolean;
var Q:IQuery;
begin

   if(usuario='')or(senha='')then begin
      AvisoErro('Usuário ou senha estão vazios!');
      Result:=false;
      exit;
   end;

//   Q:=SqlToQuery('SELECT * FROM usuarios WHERE usuario='+QuotedStr(usuario)+' AND senha='+QuotedStr(senha));
//
//   if not Q.IsEmpty then begin
//      AvisoErro('Usuário/senha não encontrados!');
//      Result:=false;
//      exit;
//   end;

   dm.Login(usuario,senha,4);
   Result:=true;

end;

end.
