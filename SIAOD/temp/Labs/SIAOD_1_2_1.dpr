program SIAOD_1_2_1;

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
  first,list,list2,first2:ring;
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
Procedure newCCEL(child:integer);
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
  str:=str+ list^.pred.name;
  list^.pred:=list;
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

{procedure main2(list:ring);
Var
  child,childs,i,j:integer;
begin
  for child:=2 to 64 do
  begin
    for j:=1 to child do
    begin
      newCCEL(child);
    end;
    list:=first^.next;
    childs:=child;
    while childs <> 1 do
    begin

      for i:=1 to del do
      begin
        list:=list^.next;
      end;
      childs:=childs-1;
      deletes(list);
    end;
    writeln(child, 'lost- ', list^.next.name);

  end;
end;   }

begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  new(first);
  list:=first;
  new(first2);
  list2:=first2;

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
 // main2(list2);
  //list:=first^.next;
  //deletes(list^.next);
  //printR(list);
  //writeln(str);
  readln;

end.
