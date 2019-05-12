unit Universe;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DBObjPas;

type

  TWorldEntity = class(TDataTable)
  { an object in the universe }
  private

  public
    property Entities[I: Integer]: TWorldEntity;
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

{ TUniverse }

constructor TUniverse.Create(AnOwner: TComponent);
begin
  inherited Create(AnOwner);
  if Assigned(TheUniverse) then TheUniverse.Free;
  TheUniverse := Self
end;

end.

