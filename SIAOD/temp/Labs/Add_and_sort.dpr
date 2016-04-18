program Add_and_sort;

{$APPTYPE CONSOLE}

uses
  SysUtils,windows;

Const
  Count = 10;
  ARName:array[1..count] of string = ('Скорая','Петров','Сидоров','Иванов','Жуков','МЧС','Антонов','Милиция','Аварийная','Скороходов');
  ARNomer:array[1..count] of integer = (103,2694322,2866649,2576925,2569254,101,2884328,102,104,2946844);

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
  listNSP,firstNSP,lostNSP:adressNSP;
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

{Procedure printRNSP (listNSP:adressNSP);
begin
  while listNSP <> nil do
  begin
    write(listNSP^.name,' ', listNSP^.nomer,' ');
    listNSP:=listNSP^.next;
    writeln;
  end;
end;
        }

Procedure printL (list:adressall);
begin
  while list^.pred <>nil do
  begin
    write(list^.name,' ', list^.nomer,' ');
    list:=list^.pred;
    writeln;
  end;
end;

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

{procedure newELNSP(listNSP:adressNSP;list:adressall);
begin
    new(listNSP^.next);
    listNSP:=listNSP^.next;
    listNSP^.name:=list^.name;
    listNSP^.nomer:=list^.nomer;
   // lostNSP:=listNSP;
    listNSP^.next:=nil;
end;
      }
{Окей ушел искать начало её}
{procedure addlistNSP(listNSP:adressNSP;list:adressall);
begin
  if length(inttostr(list^.nomer)) = 3 then
  begin
    new(listNSP^.next);
    listNSP:=listNSP^.next;
    listNSP^.name:=list^.name;
    listNSP^.nomer:=list^.nomer;
    lostNSP:=listNSP;
    listNSP^.next:=nil;
  end;
end; }

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
    lost:=list;
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
    //addlistNSP(listNSP:adressNSP;list:adressall);
    {
    if length(inttostr(list^.nomer)) = 3 then
  begin
    new(listNSP^.next);
    listNSP:=listNSP^.next;
    listNSP^.name:=list^.name;
    listNSP^.nomer:=list^.nomer;
    //lostNSP:=listNSP;
    listNSP^.next:=nil;
  end;
    }
    list^.pred:=pred;
    lost:=list;
    list^.next:=nil;

  end;


{  procedure search(list,first:adressall;strsearsh:string);
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
              }



begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);

  new(first);
  //new(firstNSP);
  list:=first;
  //listNSP:=firstNSP;
  list^.pred:=nil;
  //listNSP^.next:=nil;
  first^.next:=nil;

  for i:=1 to count do         {ВАЖНО ВВВОД ИНФЫ}
  begin
    newcel(i);
  end;
  //newCEL(i,listNSP,list);
  //printL(list);
  writeln('--------------------------------------------------');
  //printRNSP (firstNSP^.next);
  //printR(first^.next);
 // writeln;
  //writeln('Enter search string');
  //readln(strsearsh);
  //search(list,first,strsearsh);
  //printL(list);
 // list:=first;
 // writeln(list^.next.next.name);
  //newEL;

  printR(first^.next); //левый вывод    {ВАЖНО ВЫВОД}
  sort(list,first);
  writeln;
  printR(first^.next); //левый вывод    {ВАЖНО ВЫВОД}
  
  //printL(lost); //правый вывод

  readln;


end.
