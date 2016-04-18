program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  ARC:array[1..3] of string = ('user1','user2','user3');

Type
  adresspec = ^elemspec;
  elemspec = record
    name:string;
    nomer:integer;
    next:adresspec;
    end;

Var
  first,list:adresspec;
  i:integer;

Procedure newCEL(i:integer);
  begin
    randomize;
    new(list^.next);
    list:=list^.next;
    list^.name:=ARC[i];
    list^.nomer:=random(99);
    list^.next:=nil;

  end;

Procedure printR (list:adresspec);
begin
  while list <> nil do
  begin
    write(list^.name,' ', list^.nomer,' ');
    list:=list^.next;
    writeln;
  end;
end;

begin
  new(first);
  list:=first;

  //first^.next:=nil;
  for i:=1 to 3 do
  begin
    NewCEL(i);
    printR(list);
  end;
  readln;
end.
 