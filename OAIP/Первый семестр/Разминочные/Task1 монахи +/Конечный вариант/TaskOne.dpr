program TaskOne;

{$APPTYPE CONSOLE}
uses
  SysUtils,
  windows;

var
allM,allP,V,Pr,St,variant:integer;    a,b,c:real;
{Всего моназов = allM,
 Всего пирогов = allP,
 Ведущие монахи = V,
 Простые монахи = Pr
 Ученики = St
 Едят ведущие = а
 Едят простые = b
 Едят ученики = с
 variant}
begin
  
  // Подключение русского языка
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  variant:=0;
  // Ввод исходных данных
  Writeln('Введите количество монахов');
  readln(allM);
  while (allM=0) or(allM<0) do
    begin
        Writeln('Ошибка');
        writeln('Количество монахов должно быть больше нуля');
        Writeln('Повторите ввод');
        Writeln('Введите количество монахов');
        readln(allM);
    end;
  Writeln('Введите количество пирогов');
  readln(allP);
  while (allP=0) or(allP<0) do
    begin
        Writeln('Ошибка');
        writeln('Количество пирогов должно быть больше нуля');
        Writeln('Повторите ввод');
        Writeln('Введите количество пирогов');
        readln(allP);
    end;
  Writeln('Разный тип монахов');
  writeln('должен есть разное количество пирогов');
  Writeln('Сколько пирогов съедает ведущий монах?');
  readln(a);
  while a<0 do
    begin
      Writeln('Ошибка! Повторите ввод');
      readln(a);
    end;
  Writeln('Сколько пирогов съедает простой монах?');
      readln(b);
  while (a=b) or(b<0) do
    begin
        Writeln('Ошибка!');
        Writeln('Повторите ввод');
        Writeln('Сколько пирогов съедает простой монах?');
        readln(b);
    end;
  Writeln('Сколько пирогов съедает ученик?');
  readln(c);
  while (a=c) or (b=c) or(c<0)do
    begin
      Writeln('Ошибка!');
      Writeln('Повторите ввод');
      Writeln('Сколько пирогов съедает ученик?');
      readln(c);
       end;
  // цикл по простым монахам
  //от нуля до максимального значения

  for Pr:=0 to allM do
    begin
      // вычисляем количество учеников
      // используем округление для получения целых вариантов
      St:=trunc((allM*a-allP-(a-b)*Pr)/(a-c));
      // вычисляем количество ведущих
      V:= allM-Pr-St;
     // проверка на выполнение условия не отрицательности
     //  и проверка условия по общему количеству
       if (V>=0) and (St>=0) and (V*a+Pr*b+St*c=allP) then
       begin
          //количество решений
          variant:= variant+1;
          Writeln('Вариант №',variant);
          writeln('Ведущие монахи = ',V);
          writeln('Простые монахи = ', Pr);
          writeln('Ученики монахи = ', St);
       end;
     end;
       // если решений нет
  if variant=0 then
  writeln('Вариантов нет');
  readln;
end.



