unit VeiculoModel;

interface
type
  TVeiculo = class
    private
      Fmodelo: string;
      Fplaca: string;
      Fano: string;
      FcodigoCliente: integer;
    public
      property modelo: string read Fmodelo write Fmodelo;
      property placa: string read Fplaca write Fplaca;
      property ano: string read Fano write Fano;
      property codigoCliente: integer read FcodigoCliente write FcodigoCliente;
      constructor Create(const modelo,placa,ano:string;id:integer); overload;
      constructor Create(const modelo,placa,ano:string); overload;
  end;
implementation

{ TVeiculo }

constructor TVeiculo.Create(const modelo, placa, ano: string;id:integer);
begin
   Fmodelo       := modelo;
   Fplaca        := placa;
   Fano          := ano;
   FcodigoCliente:= id;
end;
constructor TVeiculo.Create(const modelo, placa, ano: string);
begin
   Fmodelo       := modelo;
   Fplaca        := placa;
   Fano          := ano;
end;

end.
