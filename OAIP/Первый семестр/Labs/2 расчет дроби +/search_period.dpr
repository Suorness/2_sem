program search_period;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

const ten=10;
Var
period:string;
numerator,denominator,step,origin,division_step:integer;
begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  writeln('¬ведите числитель');
  readln(numerator);
  writeln('¬ведите знаменатель');
  readln(denominator);
  step:=1;
  origin:=0;
  period:='';
  while(step <= denominator) or (origin <> numerator) do
  begin
    if step = denominator then origin:= numerator;
    division_step:=ten*numerator div denominator;
    numerator:=ten*numerator mod denominator;
    if step >= denominator then period:=period + inttostr(division_step);
    step:=step+1;
  end;
  writeln('ѕериод = ',period);
  readln;
end.
