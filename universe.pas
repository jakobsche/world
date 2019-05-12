unit Universe;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  TUniverse = class

  end;

var
  TheUniverse: TUniverse;

implementation

initialization

TheUniverse := TUniverse.Create;

end.

