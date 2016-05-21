program Project2;

{$APPTYPE CONSOLE}
uses
  SysUtils;

Type
  {TChar ='a'..'z';
  TSet=set of TChar; }
  TSet=set of 'á'..'ä';

Var
 Many:Tset;
 ch:char;
 i:integer;
begin

  writeln(ord('à'));
  writeln(ord('ÿ'));
  for i:=224 to 255 do
  begin
    ch:=chr(i);

    if ch in ['á'..'ä'] then
      writeln ('+')
    else
      writeln('-');
  end;

  readln;
  readln;
end.
