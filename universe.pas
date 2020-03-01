unit Universe;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DBObjPas;

type

  { TWorldEntity }

  TWorldEntity = class(TDataTable)
  { an object in the universe }
  private
    function GetEntities(I: Integer): TWorldEntity;

  public
    property Entities[I: Integer]: TWorldEntity read GetEntities;
  end;

  { TUniverse }

  TUniverse = class(TWorldEntity)
  public
    constructor Create(AnOwner: TComponent); override; {initializes the global
      typed constant TheUniverse or replaces the instance, that it points to,
      because only one global instance may exist}
  end;

const
  TheUniverse: TUniverse = nil; {initialized by TUniverse.Create
    The initialization is not done by this unit, because the owner of
    TheUniverse can depend on the kind of application, that uses it}

implementation

{ TWorldEntity }

function TWorldEntity.GetEntities(I: Integer): TWorldEntity;
begin
  TDataRecord(Result) := Items[I]
end;

{ TUniverse }

constructor TUniverse.Create(AnOwner: TComponent);
begin
  if Assigned(TheUniverse) then raise Exception.Create('The universe already exists.');
  inherited Create(AnOwner);
  TheUniverse := Self
end;

end.

