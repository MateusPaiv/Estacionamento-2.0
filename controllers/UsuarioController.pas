unit UsuarioController;

interface
uses
   RpDriverAdapter,SqlSis,SqlFun,Generics.Collections,UsuariosModel,SysUtils,connection;
type
  TUsuarioController = class
    private
    public
      function cadastrarUsuario(nome,nomeFunc,senha:string):Boolean;
  end;

  var usuaControl:TUsuarioController;
implementation

{ TUsuarioController }

function TUsuarioController.cadastrarUsuario(nome,nomeFunc ,senha: string): Boolean;
var Q:IQuery;
    ListUser:TObjectList<TUsuarios>;
    id:integer;
begin
   if (nome='') or (nomeFunc='') or (senha='') then begin
      AvisoErro('CAMPO VAZIO');
      exit;
   end;

   Q:=SqlToQuery('SELECT id_func FROM funcionarios WHERE nome='+QuotedStr(nomeFunc));

   if Q.IsEmpty then begin
      AvisoErro('Funcion�rio n�o encontrado');
      exit;
   end else begin
      id:=Q.FieldByName('id_func').AsInteger;
      ListUser:=TObjectList<TUsuarios>.create;
      ListUser.Add(TUsuarios.Create(nome,senha,id));
      dm.cadastrarUsuario(ListUser);
   end;





end;

end.
