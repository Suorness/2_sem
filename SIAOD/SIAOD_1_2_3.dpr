program SIAOD_1_2_3;

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
  str,str2:string;



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
  str:= str + list^.name;
  list^.pred.next:=list^.next;
  list^.next.pred:=list^.pred;
end;

procedure main(list:ring;children:integer);
var
k:integer;
begin
  list:=first^.next;
  K:=1;
  while children <> 0 do
  begin
    while k <> del do
    begin
      list:=list^.next;
      k:=k+1;
    end;
    children:=children-1;
    deletes(list);
    k:=0;
  end;
    writeln('lost- ', list^.name);

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

  readln;

end.
