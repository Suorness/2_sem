program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
Red,Green,GreenN,N,i,cycle:integer;
//N промежуточный множетель
//  greenN ѕромежуточные вычислени€
// i- счетчик циклов, cycle кол-во поторений
begin
  green:=0;
  N:=1;
  red:=0;
  Writeln('Enter the number of red');
  readln(red);
  writeln('Enter the number of cycles');
  readln(cycle);
  for i:=1 to cycle do
  begin
    N:=red;
    red:=0;
    greenN:=N;
    red:=2*green;
    green:= green+greenN;
    N:=0;
    
  end;
  writeln('Red -', red);
  Writeln('Green - ', green);
  Writeln('Green+Red ', green+red);
  readln;
end.
 