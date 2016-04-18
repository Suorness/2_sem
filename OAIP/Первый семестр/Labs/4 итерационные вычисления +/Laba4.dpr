Program Laba4;
{$APPTYPE CONSOLE}
Uses
  SysUtils,
  math,
  windows;

Const
  Eps0=0.000001;
  Eps1=0.0000001;
  Eps2=0.0000001;

Var
  Eps:array[0..2] of extended;
  k,i,j,denominator,fact,f:integer;
  early_X,numerator,y0,y,r,Step_X,x:real;

begin

  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  Eps[0]:=Eps0;
  Eps[1]:=Eps1;
  Eps[2]:=Eps2;
  writeln('¬ведите начальный  X');
  readln(early_X);
  writeln('¬ведите шаг X');
  readln(Step_X);
  x:=early_X;
  for f:=1 to 20 do
  begin
    for i:=0 to 2 do
    begin
      R:=Eps[i]+1;
      K:=0;
      denominator:=1;
      y0:=x;
      while r>Eps[1] do
      begin
        k:=k+1;
        fact:=4*k+1;
        for j:=1 to fact do
        begin
          denominator:=denominator*j;
        end;

        //numerator:=exp(ln(x)*(fact));
        numerator:=power(x,fact);
        y:=y0+numerator/denominator;
        r:=y-y0;
        y0:=y;
      end;
      writeln('X = ', x:0:2,' y =', y0:0:10,' Eps =', Eps[i]:0:7);
    end;
  x:=x+Step_X;
  end;
  readln;
end.




