program SIAOD_1_2_END;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

Type
  ring = ^elem;
  elem = record
    name:integer;
    next:ring;
    pred:ring;
    end;
Var
  first,list:ring;
  str:string;
  children,del,i:integer;

Procedure createlist(list:ring;children:integer);
Var
  i:integer;
  pred,lost:ring;
begin
  for i:=1 to children do
  begin
    if i= 1 then
    begin
      new(first^.next);
      list:=first^.next;
      list^.name:=i;
      list^.pred:=list;
    end
    else
    begin
      pred:=list;
      new(list^.next);
      list:=list^.next;
      list^.name:=i;
      list^.next:=first^.next;
      list^.pred:=pred;
      lost:=list;

      list:=first^.next;
      list^.pred:=lost;
      list:=pred^.next;
    end;
  end;

end;

Procedure printlist(list:ring;children:integer);
Var
 i:integer;
begin
  list:=first^.next;
  for i:=1 to children do
  begin
    writeln(list^.name);
    list:=list^.next;
  end;
end;



Procedure main(list:ring;children,del:integer);
Var
  i,k,child:integer;
  delel:ring;
begin
  list:=first^.next;
  k:=1;
  child:=children;
  while children <> 1 do
  begin

    while k <> del do
    begin
      list:=list^.next;
      K:=k+1;
    end;
    delel:=list;
    list:=list^.pred;
    list^.next:=delel^.next;
    delel^.next.pred:=list;
    dispose(delel);
    k:=0;
    children:=children-1;
  end;
  writeln('Количество детей  ', child:2,' Последним будет ', list^.name:2);
  dispose(list);
  dispose(first);
end;
begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  writeln('Введите количество детей');
  readln(children);
  writeln('Введите количество шагов до удаления');
  readln(del);
  new(first);
  list:=first;
  list^.pred:=list;
  createlist(list,children);
  printlist(list,children);
  main(list,children,del);
  writeln('----------------------------');
  for i:=1 to 64 do
  begin
    new(first);
    list:=first;
    createlist(list,i);
    main(list,i,del);
  end;
  readln;
end.
