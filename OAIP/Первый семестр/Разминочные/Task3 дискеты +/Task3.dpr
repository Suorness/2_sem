Program Task3;
{$APPTYPE CONSOLE}
Uses
SysUtils,windows;
Var
  cost,PlusD:real;
  disk,kit,box,bonus:integer;
{cost = наименьшая цена
 kit - коробки по 12 дискет
 box -ящик по 12*12 дискет
 PlusD выгода в цене
 disk количество дискет
 bonus количество дискет получаемых в качестве бонуса}

begin
  // Подключение русского языка
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  // Ввод дискет
  writeln('Введите количество дискет');
  readln(disk);
  bonus:=0;
  // Проверка на положительность
  while disk<0 do
  begin
    writeln('Ошибка!');
    writeln('Повторите ввод');
    readln(disk);
  end;
  // Расчет плохой цены
  PlusD:=disk*11.5;
  //расчет ящиков
  box:=(disk div 144);
  disk:=disk-box*144;
  if disk>=130 then
  begin
    box:=box+1;
    bonus:=144-disk;
    disk:=0;
  end;
  //расчет коробок
  kit:= disk div 12;
  disk:=disk-kit*12;
  if disk>=10 then
  begin
    kit:=kit+1;
    bonus:=12-disk;
    disk:=0;
  end;
  //расчет цены
  cost:=box*1255+kit*114.5+disk*11.5;
  //расчет выгоды
  PlusD:=PlusD-cost;
  writeln('Выгодная цена ',cost:0:1);
  writeln('Количество ящиков ', box);
  writeln('Количество коробок ', kit);
  writeln('Количество дискет ',disk);
  writeln('Количество бонусных дисков ',bonus);
  writeln('Разница в стоимости ',PlusD:0:1);
  readln;
end.
