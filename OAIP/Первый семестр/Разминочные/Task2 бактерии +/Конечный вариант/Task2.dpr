program Task2;
{$APPTYPE CONSOLE}
uses
  Windows,
  SysUtils;

var
Red,Green,M,N:int64;
i,cycle:longint;
{ N и M промежуточный множетель
  Red - значение красных
  Green - значение зеленых
  i- счетчик цикла, cycle кол-во поторений }
begin
  SetConsoleOutputCP(1251); // подключение русского языка
  SetConsoleCP(1251);
  repeat  //цикл для проверки на положительность
    Writeln('Введите число зеленых бактерий');
    readln(green); //ввод зеленых
    if green<0 then
    Writeln('Повторите ввод, значение должно быть положительным');
  until green>=0;
  repeat   //цикл для проверки на положительность
    Writeln('Введите число красных бактерий');
    readln(red);  //ввод красных
    if red<0 then
    Writeln('Повторите ввод, значение должно быть положительным');
  until red>=0;
  repeat   //цикл для проверки на положительность
    writeln('Введите число циклов');
    readln(cycle); // ввод кол-во циклов
    if cycle<0 then
    Writeln('Повторите ввод, значение должно быть положительным');
  until cycle>=0;
  for i:=1 to cycle do
  begin            //расчет новых значений
    N:=red;
    red:=0;
    M:=green;
    green:=0;
    red:=M;
    green:=M+N;
    N:=0;
    M:=0;
  end;
  writeln('Красные = ', red);   //вывод результатов
  Writeln('Зеленые = ', green);
  Writeln('Всего =  ', green+red);
  readln;
end.
 