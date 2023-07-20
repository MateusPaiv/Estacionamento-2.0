unit FuncionarioModel;

interface
type
  TFuncionario = class
    private
      Fnome: string;
      Fsobrenome: string;
      Fcpf: string;
      Fcelular: string;
      Fcep: string;
      Fendereco: string;
      Fnumero: string;
    Fid: integer;
    public
      constructor Create(nome,sobrenome,cpf,celular,cep,endereco,numero:string); overload;
      constructor Create(nome,sobrenome,cpf,celular,cep,endereco,numero:string;id:integer);overload;
      property nome: string read Fnome write Fnome;
      property sobrenome: string read Fsobrenome write Fsobrenome;
      property cpf: string read Fcpf write Fcpf;
      property celular: string read Fcelular write Fcelular;
      property cep: string read Fcep write Fcep;
      property endereco: string read Fendereco write Fendereco;
      property numero: string read Fnumero write Fnumero;
      property id: integer read Fid write Fid;
  end;
implementation

{ TFuncionario }

constructor TFuncionario.Create(nome, sobrenome, cpf, celular, cep, endereco,
  numero: string);
begin
   Fnome      := nome;
   Fsobrenome := sobrenome;
   Fcpf       := cpf;
   Fcelular   := celular;
   Fcep       := cep;
   Fendereco  := endereco;
   Fnumero    := numero;
end;

constructor TFuncionario.Create(nome, sobrenome, cpf, celular, cep, endereco,
  numero: string; id: integer);
begin
   Fnome      := nome;
   Fsobrenome := sobrenome;
   Fcpf       := cpf;
   Fcelular   := celular;
   Fcep       := cep;
   Fendereco  := endereco;
   Fnumero    := numero;
   Fid        := id;
end;

end.
