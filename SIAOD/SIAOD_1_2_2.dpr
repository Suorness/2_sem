program SIAOD_1_2_2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

Type
  ring = ^elem;
  elem = record
    name:string;
    next:ring;
    pred:ring;
    end;
Var
  first,list,firsttwo,listtwo:ring;
  i,del,children:integer;
  str:string;

Procedure newlonglist(i:integer);
var
  pred:ring;
begin
  pred:=listtwo;
  new(listtwo^.next);
  listtwo:=listtwo^.next;
  listtwo^.name:=inttostr(i);
  listtwo^.pred:=pred;
  listtwo^.next:=firsttwo^.next;

end;

{Создаем новые элементы списка и присваиваем им номера}
Procedure newCEL(i:integer);
var
  pred:ring;
begin
  pred:=list;
  new(list^.next);
  list:=list^.next;
  list^.name:=inttostr(i);
  list^.pred:=pred;
  list^.next:=first^.next;

end;
{Вывод списка детей}
Procedure printR (list:ring);
var
  i:integer;
begin
  list:=first^.next;
  for i:=1 to children do
  begin
    write(list^.name,' ');
    list:=list^.next;
    writeln;
  end;
end;

{Удаление из списка, при выбывании ребенка}
procedure deletes(list:ring);
begin
  str:=str+ list^.name;
  list^.pred.next:=list^.next;
end;

procedure main(list:ring;children:integer);
begin
  list:=first^.next;
  while children <> 1 do
  begin
    for i:=1 to del do
    begin
      list:=list^.next;
    end;
    children:=children-1;
    deletes(list);
  end;
  writeln('lost- ', list^.next.name);
end;


{Подготовка к новому списку}
procedure inic(const j:integer);
var
  i:integer;
begin
 new(firsttwo);
 listtwo:=firsttwo;
 for i:=1 to j do
 begin
  newlonglist(i);
 end;
end;
{очистка}
procedure ending;
begin

end;

procedure deletelong (listtwo:ring);
var
  next:ring;
begin
  new(next);
  next:=listtwo;
  listtwo:=listtwo.pred;
  dispose(listtwo^.next);
  {listtwo^.pred.next:=listtwo^.next;
  dispose(listtwo);
  listtwo:=listtwo^.next; }
end;

procedure main2;
var
  i,j:integer;
begin
  for j:=1 to 64 do
  begin
    inic(j);
    children:=j;
    listtwo:=firsttwo^.next;
    while children <> 1 do
    begin
      for i:=1 to del do
      begin
        listtwo:=listtwo^.next;
      end;
      children:=children-1;
      deletelong(listtwo);
    end;
    writeln('Последний герой', listtwo^.name);
    dispose(firsttwo);
  end;
end;


begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  new(first);
  list:=first;


  writeln('Введите количество детей');
  readln(children);
  writeln('Введите количество шагов до удаления');
  readln(del);
  for i:=1 to children do
  begin
    newCEL(i);
  end;
  writeln('--------------------------');
  printR(list);
  writeln('--------------------------');
  main(list,children);
  writeln(str);
  main2;
  readln;

end.
