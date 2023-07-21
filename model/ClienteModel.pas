unit ClienteModel;

interface
uses BaseList,Generics.Collections;

type TCliente = class
  private
    Fnome: string;
    Fsobrenome: string;
    Fcpf: string;
    Fid: integer;
  public
    constructor Create(const nome,sobrenome,cpf:string);overload;
        constructor Create(const nome,sobrenome,cpf:string;id:integer);overload;
    destructor Destroy; override;
    property nome: string read Fnome write Fnome;
    property sobrenome: string read Fsobrenome write Fsobrenome;
    property cpf: string read Fcpf write Fcpf;
    property id: integer read Fid write Fid;
end;
var ListaCliente: TObjectList<TCliente>;

implementation

{ TCliente }




constructor TCliente.Create(const nome, sobrenome, cpf: string);
begin
  Fnome := nome;
  Fsobrenome:= sobrenome;
  FCpf:= cpf;
end;

constructor TCliente.Create(const nome, sobrenome, cpf: string; id: integer);
begin

  Fnome      := nome;
  Fsobrenome := sobrenome;
  FCpf       := cpf;
  Fid        := id;
end;

destructor TCliente.Destroy;
begin
   inherited;
   Destroy;
end;


end.
