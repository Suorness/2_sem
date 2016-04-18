program test2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Math;

var x,y:real;
begin
  x:=2;
  y:=Power(sqr(x),1/3);
  writeln(y);
  readln;
end.
