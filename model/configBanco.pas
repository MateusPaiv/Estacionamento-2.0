unit configBanco;

interface
type
  TConfigBanco = class
    private
    public
      procedure configuraBanco;
  end;
implementation

{ TConfigBanco }

procedure TConfigBanco.configuraBanco;
begin
   inst.DataBaseName:='teste1';
   inst.RPPassword:='erp94587361';
   inst.RPUserName:='erp';
   Inst.SQLPassword:='erp94587361'; //Senha do Banco de dados - Padrão do banco , deixei a mesma mais teria que ser a senha do postgres
   inst.SQLUserName:='postgres';//Deixei o mesmo do flex mais deveria ser o nome do usuário do banco padrão "postgers"
   inst.Version:='1';
   inst.ServerName:='192.168.2.1';
   Inst.TypeServer:=tsPostGreSQL;
   inst.InstallSystem(true,false);
end;

end.
