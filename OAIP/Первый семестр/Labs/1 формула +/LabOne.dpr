program LabOne;
{$APPTYPE CONSOLE}
uses
  SysUtils;
Var x,y,sum:real;
    n:integer;
begin
  x:=0.6; // начальное значение х
  while x<1.2 do  //условие по х
  begin
    sum:=0;
    for n:=1 to 15 do
    begin
      sum:=sum+(Ln(sqrt(sqr(x))))/(2-1/n);   // расчет суммы
      if n>=10 then
      begin
        y:=n*sqrt(n*x)*(exp(ln(x)*(2/3)))+sum;  // расчет y
        write('n=', n);
        write('   x=', x:1:2);
        write('   y=', y:5:3);
        writeln;
      end;
    end;
  x:=x+0.25;
  end;
  readln;
end.
