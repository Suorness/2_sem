program test;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var  x,y:real;
begin
 x:=2;
 y:=Ln(sqrt(sqr(x)));
 writeln(y);
 readln;
end.
