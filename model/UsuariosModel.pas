unit UsuariosModel;

interface
type
  TUsuarios = class
  private
    Fusuario: string;
    Fsenha: string;
    FidFunc: integer;
  public
    constructor Create(usuario,senha:string;id:integer);
    destructor  Destroy;override;
    property usuario: string read Fusuario write Fusuario;
    property senha: string read Fsenha write Fsenha;
    property idFunc: integer read FidFunc write FidFunc;
  end;
implementation

{ TUsuarios }

constructor TUsuarios.Create(usuario, senha: string; id: integer);
begin
   Fusuario:=usuario;
   Fsenha:=senha;
   FidFunc:=id;
end;

destructor TUsuarios.Destroy;
begin
  inherited;
  self.Free;
end;

end.
