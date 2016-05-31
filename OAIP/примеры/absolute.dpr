program absolute;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Type
  TM= array[1..4]of byte;
Var
  //a,b:integer;
  A,B:TM;
  i:integer;
  k:byte;
  j:char;


function test(Var x):char;
Var
  Xxx:char absolute x;
begin
  result:=chr(ord(xxx)+10);
end;

begin
  k:=225;
  writeln(chr(225));
  j:=test(k);
  writeln(j);
  readln;
end.
 