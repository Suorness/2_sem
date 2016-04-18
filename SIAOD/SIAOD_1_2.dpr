program SIAOD_1_2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

Const
  ARC:array[1..3] of string = ('user1','user2','user3');

Type
  ring = ^elem;
  elem = record
    name:string;
    //nomer:integer;
    next:ring;
    pred:ring;
    end;
Var
  first,list:ring;
  i,del,children:integer;
  str:string;

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

procedure deletes(list:ring);
begin
  str:=str+ list^.name;
  list^.pred.next:=list^.next;
end;

procedure main(list:ring);
Var
  child,i:integer;
begin
  child:=children;
  list:=first^.next;
  while child <> 1 do
  begin

    for i:=1 to del do
    begin
      list:=list^.next;
    end;
    child:=child-1;
    deletes(list);
  end;
  writeln('lost- ', list^.next.name);
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
  main(list);
  //list:=first^.next;
  //deletes(list^.next);
  //printR(list);
  writeln(str);
  readln;

end.
