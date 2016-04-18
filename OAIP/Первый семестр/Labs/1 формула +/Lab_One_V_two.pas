program Lab_One_V_two;
{$APPTYPE CONSOLE}
uses
  SysUtils,windows;
Var x,y,h,d,sum:extended;
    n:integer;
    {h- шаг по х до D
    D- конечный х}
begin
  // Подключение русского языка
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);

  // начальное значение х
  writeln('Введите X');
  readln(x);
  while x<0 do
    begin
      writeln('Повторите ввод X');
      writeln('Введите X');
      readln(x);
    end;
  writeln('Введите шаг h');
  readln(h);
  while h<0 do
    begin
      writeln('Повторите ввод h');
      writeln('Введите h');
      readln(h);
    end;
   writeln('Введите конечный  X');
  readln(D);
  while D<x do
    begin
      writeln('Повторите ввод D');
      writeln('D должно быть больше X');
      writeln('Введите D');
      readln(D);
    end;

  while x<d do  //условие по х
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
  x:=x+h;
  end;
  readln;
end.
