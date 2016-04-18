Program SIAOD_1_4_end;

{$APPTYPE CONSOLE}

Uses
  SysUtils,windows;

Const
  Count = 10;
  ARName:array[1..count] of string =
  ('Скорая','Петров','Сидоров','Иванов',
   'Жуков','МЧС','Антонов','Милиция','Аварийная','Скороходов');
  ARNomer:array[1..count] of integer =
  (103,2694322,2866649,2576925,2569254,101,2884328,102,104,2946844);

Type
  adressall = ^elem;
  elem = record
    name:string;
    nomer:integer;
    next:adressall;
    pred:adressall;
    end;

  adressNSP = ^elemNSP;
  elemNSP = record
    name:string;
    nomer:integer;
    next:adressNSP;
    end;



Var
  list,first,lost:adressall;
  listNSP,firstNSP:adressNSP;
  i:integer;

{Вывод двунаправленного списка слево на право}
Procedure printR (list:adressall);
begin
  while list <> nil do
  begin
    write(list^.name,' ', list^.nomer,' ');
    list:=list^.next;
    writeln;
  end;
end;

{Вывод одноноправленного списка}
Procedure printRNSP (listNSP:adressNSP);
begin
  while listNSP <> nil do
  begin
    write(listNSP^.name,' ', listNSP^.nomer,' ');
    listNSP:=listNSP^.next;
    writeln;
  end;
end;

{Вывод двунаправленного списка справа налево}
Procedure printL (list:adressall);
begin
  while list^.pred <>nil do
  begin
    write(list^.name,' ', list^.nomer,' ');
    list:=list^.pred;
    writeln;
  end;
end;

{Замена элементов местами}
procedure swap(list:adressall);
var
  temp:adressall;
begin
  new(temp);
  temp^.name:=list^.next.name;
  temp^.nomer:=list^.next.nomer;
  list^.next.name:=list^.name;
  list^.next.nomer:=list^.nomer;
  list^.name:=temp^.name;
  list^.nomer:=temp^.nomer;
end;

{Создание однонаправленного списка}
procedure addlistNSP(list:adressall);
var
  str:string;
  temp:integer;
begin
  list:=first;
  while list^.next <> nil do
  begin
    if length(inttostr(list^.nomer)) = 7 then
    begin
      new(listNSP^.next);
      listNSP:=listNSP^.next;
      str:=list^.name;
      listNSP^.name:=str;
      temp:=list^.nomer;
      listNSP^.nomer:=temp;
      listNSP^.next:=nil;
    end;
    list:=list^.next;
  end;
end;

{Сортировка двунаправленного списка}
Procedure sort(list,first:adressall);
var
  i,j:integer;
begin
  list:=first^.next;
  for i:=1 to count-1 do
  begin
    for j:=1 to count-i do
    begin
      if list^.name > list^.next.name then
        swap (list);
      list:=list^.next;
    end;
    list:=first^.next;
  end;
end;

{Создание двунаправленного списка}
Procedure newCEL(i:integer);
var
  pred:adressall;
begin
  pred:=list;
  new(list^.next);
  list:=list^.next;
  list^.name:=ARName[i];
  list^.nomer:=ARNomer[i];
  list^.pred:=pred;
  lost:=list;
  list^.next:=nil;
end;

{Функционал программы}
procedure interfaces;
var
  comand:string;
begin
  writeln('------------------------------------------------------------------');
  writeln('Введите номер команды для выполнения');
  writeln(' 1 - Показ двунаправленного неупорядоченного списока номеров');
  writeln(' 2 - Просмотреть список справа налево');
  writeln(' 3 - отсортировать двунаправленный список');
  writeln(' 4 - построить однонаправленный список без номеров спецслужб ');
  writeln(' 5 - выход ');
  //writeln(' ');
  readln(comand);
  writeln('------------------------------------------------------------------');
  if comand = '1' then
  begin
  for i:=1 to count do
    newcel(i);
  printR(first^.next);
  interfaces;
  end
  else
  begin
    if comand = '2' then
    begin
      printL(lost);
      interfaces;
    end
    else
    begin
      if comand = '3' then
      begin
        sort(list,first);
        printR(first^.next);
        interfaces;
      end
      else
      begin
        if comand = '4' then
        begin
          addlistNSP(first^.next);
          printRNSP(firstNSP^.next);

          interfaces;
        end
        else
        begin
          if comand = '5' then
            exit
          else
          begin
            writeln('Неверная команда! Повторите ввод');
            interfaces;
          end;
        end;
      end;
    end;
  end;
end;

Begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  new(first);
  new(firstNSP);
  list:=first;
  listNSP:=firstNSP;
  list^.pred:=nil;
  listNSP^.next:=nil;
  first^.next:=nil;
  interfaces;
End.
