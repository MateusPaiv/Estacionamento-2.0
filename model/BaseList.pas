unit BaseList;

interface

uses
  Contnrs, System.Classes, System.SysUtils;


type
  TBaseList12 = class
  private
    Lista:TObjectList;
  public
    constructor Create(AOwnsObjects: Boolean = True);
    destructor Destroy;override;
    procedure Clear;
    procedure Add(Obj:TObject);
    procedure Delete(Index:Integer);
    procedure Extract(obj:Tobject);
    procedure Sort(Compare:TListSortCompare);
    function Count:Integer;
    function Get(Index:Integer):TObject;
  end;


implementation

{ TBaseList12 }

procedure TBaseList12.Clear;
begin
   if Lista<>nil then Lista.Clear;
end;
procedure TBaseList12.Add(Obj:TObject);
begin
   Lista.Add(Obj);
end;

function TBaseList12.Count:Integer;
begin
   Result:=Lista.Count;
end;

constructor TBaseList12.Create(AOwnsObjects: Boolean = True);
begin
   inherited Create;
   Lista:=TObjectList.Create(AOwnsObjects);
end;

procedure TBaseList12.Delete(Index:Integer);
begin
   if (Index>=0) and (Index<Count) then begin
      Lista.Delete(Index);
   end else begin
      raise Exception.Create('TBaseList12.Delete: Índice fora de faixa ('+IntToStr(Index)+')');
   end;
end;

destructor TBaseList12.Destroy;
begin
   FreeAndNil(Lista);
   inherited;
end;
procedure TBaseList12.Extract(obj: Tobject);
begin

end;

function TBaseList12.Get(Index:Integer):TObject;
begin
//   FGeral.LogProcessos('TBaseList12.Get Index: '+IntToStr(Index)+' Count List: '+IntToStr(Count));
   if (Index>=0) and (Index<Count) then begin
      Result:=Lista.Items[Index];
   end else begin
      raise Exception.Create('TBaseList12.Get: Índice fora de faixa ('+IntToStr(Index)+')');
   end;
end;

procedure TBaseList12.Sort(Compare:TListSortCompare);
begin
   Lista.Sort(Compare);
end;

end.

