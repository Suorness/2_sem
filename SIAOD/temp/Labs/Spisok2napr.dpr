program Spisok2napr;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  Count = 10;
  ARName:array[1..count] of string = ('','user3','user1','user5','user8','user9','user7','user4','user6','user10');
  ARNomer:array[1..count] of integer = (2916428,2694322,2866649,2576925,2569254,2486644,2884328,2994485,2445566,2946844);

Type
  adressall = ^elem;
  elem = record
    name:string;
    nomer:integer;
    next:adressall;
    pred:adressall;
    end;

  adresspec = ^elemspec;
  elemspec = record
    namespec:string;
    nomerspec:integer;
    nextspec:adresspec;
    end;



Var
  list,first,lost:adressall;
  listSpec:adresspec;
  i:integer;
  strsearsh:string;

Procedure printR (list:adressall);
begin
  while list <> nil do
  begin
    write(list^.name,' ', list^.nomer,' ');
    list:=list^.next;
    writeln;
  end;
end;

Procedure printRR (list:adressall);
var
i:integer;
begin
  for i:=1 to count do
  begin
    write(list^.name,' ', list^.nomer,' ');
    list:=list^.next;
    writeln;
  end;
end;


Procedure printL (list:adressall);
begin
  while list <> nil do
  begin
    write(list^.name,' ', list^.nomer,' ');
    list:=list^.pred;
  end;
end;

procedure swap(list:adressall);
var
  temp,temp2:adressall;
begin
  new(temp);
  temp^.name:=list^.next.name;
  temp^.nomer:=list^.next.nomer;
  list^.next.name:=list^.name;
  list^.next.nomer:=list^.nomer;
  list^.name:=temp^.name;
  list^.nomer:=temp^.nomer;


end;

Procedure sort(list,first:adressall);
var i,j:integer;
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

{Procedure newEL;
var
  pred:adressall;
  begin
    pred:=list;
    new(list^.next);
    list:=list^.next;
    readln(list^.name);
    readln(list^.nomer);
    list^.pred:=pred;

    //lost:=list;
    list^.next:=nil;
  end;
}


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

    //lost:=list;
    list^.next:=nil;

  end;


  procedure search(list,first:adressall;strsearsh:string);
  begin
    list:=first;
    for i:=1 to count+1 do
    begin
      if list^.name = strsearsh then
      begin
        write(list^.name,' ', list^.Nomer);
        writeln;
      end;
      list:=list^.next;
    end;
  end;



begin
  new(first);
  list:=first;
  list^.pred:=nil;
  {}
  first^.next:=nil;

  for i:=1 to count do
  newCEL(i);
  writeln('--------------------------------------------------');
  printR(first^.next);
  writeln;
  //writeln('Enter search string');
  //readln(strsearsh);
  //search(list,first,strsearsh);
  //printL(list);
 // list:=first;
 // writeln(list^.next.next.name);
  sort(list,first);
  printR(first^.next);
  readln;


end.
