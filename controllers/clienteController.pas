unit clienteController;

interface
uses Vcl.Dialogs,connection,ClienteModel,Contnrs,Generics.Collections,RpDriverAdapter,SqlFun,SqlDtg;
type
  TClienteController = class
    private
    public
     function insertClientes(nome,sobrenome,Cpf: string):Boolean;
     function editarClientes(nome,sobrenome,cpf,modelo,placa,ano:string;id:integer):Boolean;
     procedure carregarGrid(Grid:TSqlDtGrid);
  end;
  var clientController:TClienteController;
implementation
uses VeiculoModel;
{ TFuncionarioController }

procedure TClienteController.carregarGrid(Grid:TSqlDtGrid);
var Q:IQuery;
    i:integer;
begin
   i:=1;
   Q:= SqlToQuery('select nome,sobrenome,id_clie,modelo,ano,placa,id_veic_clie from clientes as c inner join veiculos as v on c.id_clie = v.id_veic_clie');
   if not Q.IsEmpty then begin
     while not Q.Eof do begin
       Grid.Cells[Grid.GetColumn('nome'),i]:=Q.getString('nome');
       Grid.Cells[Grid.GetColumn('sobrenome'),i]:=Q.getString('sobrenome');
       Grid.Cells[Grid.GetColumn('modelo'),i]:=Q.getString('modelo');
       Grid.Cells[Grid.GetColumn('ano'),i]:=Q.getString('ano');
       Grid.Cells[Grid.GetColumn('placa'),i]:=Q.getString('placa');
       Grid.Cells[Grid.GetColumn('id'),i]:=Q.getString('id_clie');
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

function TClienteController.editarClientes(nome, sobrenome, cpf,modelo,placa,ano: string;id: integer): Boolean;
var listaVeiculo:TObjectList<TVeiculo>;
begin
     if (nome='') then begin
      MessageDlg('Nome n�o pode estar vazio',mtinformation,[mbOK],0);
      Result := false;
      exit;
   end;
   if (sobrenome='') then begin
      MessageDlg('Sobrenome n�o pode estar vazio',mtinformation,[mbOK],0);
      Result := false;
      exit;
   end;
   if (Cpf='') then begin
      MessageDlg('CpfCnpj n�o pode estar vazio',mtinformation,[mbOK],0);
      Result := false;
      exit;
   end;
   if (id<=0) then begin
      MessageDlg('C�digo do cliente est� vazio n�o pode estar vazio',mtinformation,[mbOK],0);
      Result := false;
      exit;
   end;

   ListaCliente := TObjectList<TCliente>.Create;
   listaVeiculo:=TObjectList<TVeiculo>.Create;

   ListaCliente.add(TCliente.Create(nome,sobrenome,cpf,id));
   listaVeiculo.Add(TVeiculo.Create(modelo,placa,ano,id));

   dm.editarCliente(ListaCliente);
   dm.editarVeiculo(listaVeiculo);
end;

function TClienteController.insertClientes(nome, sobrenome, Cpf: string): Boolean;
var ListaCliente: TObjectList<TCliente>;
    listaVeiculo:TObjectList<TVeiculo>;
begin
   if (nome='') then begin
      MessageDlg('Nome n�o pode estar vazio',mtinformation,[mbOK],0);
      Result := false;
      exit;
   end;
   if (sobrenome='') then begin
      MessageDlg('Sobrenome n�o pode estar vazio',mtinformation,[mbOK],0);
      Result := false;
      exit;
   end;
   if (Cpf='') then begin
      MessageDlg('CpfCnpj n�o pode estar vazio',mtinformation,[mbOK],0);
      Result := false;
      exit;
   end;

   ListaCliente := TObjectList<TCliente>.Create;

   ListaCliente.add(TCliente.Create(nome,sobrenome,cpf));

   dm.cadastrarClientes(ListaCliente);
end;

end.
