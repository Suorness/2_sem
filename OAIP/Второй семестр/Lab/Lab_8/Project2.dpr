program Project2;

{$APPTYPE CONSOLE}
uses
  SysUtils;

Type
  {TChar ='a'..'z';
  TSet=set of TChar; }
  TSet=set of '�'..'�';

Var
 Many:Tset;
 ch:char;
 i:integer;
begin

  writeln(ord('�'));
  writeln(ord('�'));
  for i:=224 to 255 do
  begin
    ch:=chr(i);

    if ch in ['�'..'�'] then
      writeln ('+')
    else
      writeln('-');
  end;

  readln;
  readln;
end.
